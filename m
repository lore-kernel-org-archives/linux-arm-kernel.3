Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21B4CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 10:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpR1F30zLrtOpvteu01mlEZqU7nBeoYmaGf4q3vajDw=; b=bonuAgg6hOAxYoOe5Y+I9cVH6M
	bsRDQ8NHSUJTYzqX3x6X/9sNjVwqyaSrUQ+YO6Cnsz1jbJ8iHUzWQoIgB2eTN3vvwb0yUK/9GUt1R
	OwMgXdWmne/RY79d0x/9S4Dd+7xd6QvQS1n8YCoVl00rSKzs2lwbqHTxIgPIXFHfNYlvWs4Pq/Vr9
	sDZriUYm0btMcDBrc7Sbik1ZtrTRFMhD1wuJr9kEZLPxo1269yX+Y9RelRpN5sBDh4qvSvbNzosN2
	VozAfpo9rekRfeYkIjUe9tl4tmxX7z3NOodjQ9QPPX6a2LZ1hM0EnU06iFh87R+/LgowjG7zF4nO/
	GmIGVtAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgtN-00000008xHb-1q8H;
	Thu, 25 Jun 2026 10:01:05 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgtJ-00000008xGW-2AgO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 10:01:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rpR1F30zLrtOpvteu01mlEZqU7nBeoYmaGf4q3vajDw=;
	b=TBFNCPTGICFJy7hk4gMqHOL2c6tpvPhBC7UKbbaHTRJI6/hRouGa90quumD8EJQE1BwAUKhxx
	zrAAlfiq7DyqEbQuK37mDL71csDCEnkGUVogdlAKHqGXmxrOGShIPUbqsi3oEz0UKHImeAndCUD
	OKzK+jQIobi9hrlHNyY3wSw=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gmDcf2VXszpStS;
	Thu, 25 Jun 2026 17:52:34 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 9B84C2012A;
	Thu, 25 Jun 2026 18:00:51 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 25 Jun 2026 18:00:50 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>, <bigeasy@linutronix.de>, <clrkwllms@kernel.org>,
	<rostedt@goodmis.org>, <rmk+kernel@armlinux.org.uk>, <linusw@kernel.org>,
	<arnd@arndb.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-rt-devel@lists.linux.dev>, <liaohua4@huawei.com>,
	<lilinjie8@huawei.com>, Xie Yuanbin <xieyuanbin1@huawei.com>
Subject: Re: [PATCH] ARM: enable interrupts when arm_notify_die() is handling user mode errors
Date: Thu, 25 Jun 2026 18:00:31 +0800
Message-ID: <20260625100031.25088-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625073522.182503-1-xieyuanbin1@huawei.com>
References: <20260625073522.182503-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_030102_061751_DCE6829A 
X-CRM114-Status: GOOD (  15.11  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 2026-06-25 10:05:52 [+0100], Russell King wrote:
> > for this but actual breakpoint handling might be broken or is it 
> > just me? But then your stack trace looks like mine so :/
> 
> ARM Linux doesn't use BKPT. BKPT was an instruction introduced by Arm 
> Ltd in ARMv5TE. Prior to this, we use a UDF instruction instead (we 
> had to pick something!) and gdb and other tools use that as a 
> breapoint.
> 
> Moreover, BKPT isn't guaranteed to trap to the kernel, especially when 
> there is a hardware debugger connected. In that case, DDI0100E states 
> that use of BKPT must be according to the instructions provided with 
> the hardware debugger. This makes BKPT unsuitable for use.

When do_DataAbort()/do_PrefetchAbort() run into `inf->fn()`, and the
hook function return != 0 with interrupts disabled, the WARN may be
triggered. From the code perspective, there are countless possible
places, and "bkpt #0" is just one of these.

For example:
bcm5301x_init_early()->hook_fault_code(bcm5301x_abort_handler).
if CONFIG_ARCH_BCM_5301X=y, then bcm5301x_abort_handler() may return 1
without enabling the interrupts.
if CONFIG_ARCH_BCM_5301X=n, then in the same scenario it will run into
do_bad(), also return 1 without enabling the interrupts.

So I think maybe:
1. enable interrupts in all hook functions, maybe
   multiple points for modification.
2. enable interrupts in do_DataAbort()/do_PrefetchAbort() before
   `inf->fn()`, but harden_branch_predictor() may be difficult.
3. enable interrupts in do_DataAbort()/do_PrefetchAbort() after
   `inf->fn()`, this may be ok.

From this perspective, arm_notify_die() also seems to be a good place?

