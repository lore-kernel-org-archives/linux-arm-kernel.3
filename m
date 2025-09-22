Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E6ECAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pi816NSxpSsHUZbkMSdLHoJH9uRJkzOEaGymZ89+4Gg=; b=u3kOYhFgxiW2vg91XF75txd/TT
	KxhAyrchdsFV4C2TRVI69T4G5MaLbETEW8eo/Hs/jtMzKbj852frJq8iFCgaWrvW6iMOm/owfLiV+
	2E2PhCN5p257TWrfXgGIeGQ8TPx5z9Z664FEhmCN0BTlbpViJ/EnN/TvJ3z9Nq7UECseNLB+LQ4AY
	2WqNWatPZ3bhiX8kvtrUuAjDpjKdHu8TExhhM8JljF+DPDFP4ZbWhVL47ouyUR4Enuri0YT7NyxKG
	FaKfX0hZ1a9+JUxd3kpVPtAfNKa93Vn/T8og0/vgQzmUlJj0VbKAXshElzp4Pt7EhoQ3sZJHj7LTh
	Ns6c1mfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bwe-00000009jtc-2i8p;
	Mon, 22 Sep 2025 08:30:48 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bv9-00000009iLd-1U0v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:29:17 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4cVbkP0p5tzddGH;
	Mon, 22 Sep 2025 16:24:29 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id ECF3F180486;
	Mon, 22 Sep 2025 16:29:06 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.108.232) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 22 Sep 2025 16:29:05 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <arnd@arndb.de>
CC: <Liam.Howlett@oracle.com>, <akpm@linux-foundation.org>, <ardb@kernel.org>,
	<dave@vasilevsky.ca>, <david@redhat.com>, <ebiggers@kernel.org>,
	<kees@kernel.org>, <liaohua4@huawei.com>, <lilinjie8@huawei.com>,
	<linmiaohe@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux@armlinux.org.uk>, <lorenzo.stoakes@oracle.com>, <mhocko@suse.com>,
	<nao.horiguchi@gmail.com>, <nathan@kernel.org>, <peterz@infradead.org>,
	<rmk+kernel@armlinux.org.uk>, <rostedt@goodmis.org>, <rppt@kernel.org>,
	<surenb@google.com>, <vbabka@suse.cz>, <will@kernel.org>,
	<xieyuanbin1@huawei.com>
Subject: Re: [RFC PATCH 1/2] ARM: mm: support memory-failure
Date: Mon, 22 Sep 2025 16:28:43 +0800
Message-ID: <20250922082843.26722-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <727caa4f-5be5-4b59-a10e-8dc9bbc384bf@app.fastmail.com>
References: <727caa4f-5be5-4b59-a10e-8dc9bbc384bf@app.fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.108.232]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_012915_653834_167129BC 
X-CRM114-Status: GOOD (  16.83  )
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

> It would be helpful to be more specific about what you
> want to do with this.
> 
> Are you working on a driver that would actually make use of
> the exported interface?

Thanks for your reply.

Yes, In fact, we have developed a hardware component to detect DDR bit
transitions (software does not sense the detection behavior). Once a bit
transition is detected, an interrupt is reported to the CPU.

On the software side, we have developed a driver module ko to register
the interrupt callback to perform soft page offline to the corresponding
physical pages.

In fact, we will export `soft_offline_page` for ko to use (we can ensure
that it is not called in the interrupt context), but I have looked at the
code and found that `memory_failure_queue` and `memory_failure` can also
be used, which are already exported.

> I see only a very small number of
> drivers that call memory_failure(), and none of them are
> usable on Arm.

I think that not all drivers are in the open source kernel code.
As far as I know, there should be similar third-party drivers in other
architectures that use memory-failure functions, like x86 or arm64.
I am not a specialist in drivers, so if I have made any mistakes,
please correct me.

Xie Yuanbin

