Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7AFCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 08:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sd33oz6pbfPjDa5fACSSUfY22ie6IIiUvimEtQAlO1M=; b=TSd3cuG4P7uPq9AhL7yG9zUv5q
	vjMH8AEMjmz5Pq+/Qtt3xHFBT3u1dlRw1tathwtXN60M/MpXai3wYM8dmK4Ah6lrLm4ZZ5hXpawtm
	WoJbOJNYnrVz0hJAxp9QaCAyuFjEV1Q2r3oxupcAqwQgmUYDn3kZfJozOPN5nRG1bI211gkVfNXA9
	h3zJRX8sevBUN4ZdCNxERT6MFsJiT/cKl5aUtjTZ94z50se1GpyQtvfGRyhvDCJlSzERSlfw5O+JA
	DOA1sNXkl7usFzLcSn+YRjw6aBb4Aob6EHbggk7+f619yghVhUwtRXnxMHP/37PjcSfdp/HpG8ZMx
	uXc/vF4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1xl-0000000Aruu-1Psr;
	Fri, 26 Jun 2026 08:31:01 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1xi-0000000ArtW-18BP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 08:31:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sd33oz6pbfPjDa5fACSSUfY22ie6IIiUvimEtQAlO1M=;
	b=VvMoTbz+cRX0X3hr5ZE6K73zzFaOmm8P1u38thRtHaA1psp3g8AL+h/oS8q2lh7oi33Ia2DTc
	qcHgDenkqBpgUjnqBMI1HsP0xm9nYZNAaz3dkFKVk44TMjrqJRz+a86AsKw+Pm2gW2QBbSCNEs0
	2ckhjTOmtUk4EshtQcNCJi0=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gmpYf3ZgTz12LG1;
	Fri, 26 Jun 2026 16:21:58 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 77AFE40575;
	Fri, 26 Jun 2026 16:30:44 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 26 Jun 2026 16:30:43 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>, <bigeasy@linutronix.de>,
	<rmk+kernel@armlinux.org.uk>
CC: <clrkwllms@kernel.org>, <rostedt@goodmis.org>, <linusw@kernel.org>,
	<arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-rt-devel@lists.linux.dev>,
	<liaohua4@huawei.com>, <lilinjie8@huawei.com>, Xie Yuanbin
	<xieyuanbin1@huawei.com>
Subject: Re: [PATCH] ARM: enable interrupts when arm_notify_die() is handling user mode errors
Date: Fri, 26 Jun 2026 16:29:53 +0800
Message-ID: <20260626082953.47503-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625152159.WtO_S3i7@linutronix.de>
References: <20260625152159.WtO_S3i7@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_013058_792656_DF704F12 
X-CRM114-Status: GOOD (  13.07  )
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

On Thu, 25 Jun 2026 17:21:59 +0200,Sebastian Andrzej Siewior wrote:
> Why would the latter be not appropriate?.
> Anyway, in the kernel case you do die() which disables interrupts as of
> oops_begin(). It does later restore the state in oops_end() and invokes
> make_task_dead(). This one will complain if either preemption or
> interrupts are disabled and reset both.
>
> Should you get that far and not panic() earlier (due to in_interrupt()
> for instance) then interrupts will be later enabled before that kernel
> thread is killed. So it could be done earlier or not, at this point the
> system is pretty much done.

My personal view is as follows: First, an Unhandled kernel fault indicates
that the kernel has encountered an error, which is different from an
Unhandled user fault. An Unhandled user fault can be artificially
constructed by user programs, whereas a healthy kernel, in theory, should
not trigger an Unhandled kernel fault.

When a kernel has already encountered a fault, I think that printing fault
information is more meaningful than improving the kernel's real-time
performance. Imagine this: The interrupts enable here, and at the same
time an interrupt arrives, and then another kernel error is triggered
within the interrupt context. The log would be a disaster.

But no matter what, the above are merely my personal views,
and I respect the maintainer's opinions.

