Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0279D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 01:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=In5Ymo73nmHkrOlmrEIqIHf+K2Funf1kBVHFkcyRhAI=; b=Y3XbYNbnA9BHm5mghApDFf4Xkp
	mSiknY7FkjjwIXRgaRkRK/BlEW+ofS0+iTBSuF3MjXkNmPpr+oLYgPQ3Lim05IJR1CNeEZYLHj2PZ
	WPcANKfmhJiNFDB44e3rxmTs3odKWpVGlTENJo0TrC/JmgqKHtDlGBC6ZaTti7xGvoUubRJ7MVITA
	eTRomoNkDn9LYtuDsX9pBk2iR+7Y6SNS4rVlN1IT+IGy+URsviGr12kauLe0e6wHHzAGkxt0TgAgm
	oTKUnGAMXd2z6UUAUc/hoyI6PJA4cTUhp08EHEhSk/AvS8/LXwUNQLgPA7GMtcW15rQ1KL5fa2Slb
	qh2NxUuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOnUN-0000000HPPe-2YPs;
	Fri, 28 Nov 2025 01:41:35 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOnUK-0000000HPOj-1PEu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 01:41:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=In5Ymo73nmHkrOlmrEIqIHf+K2Funf1kBVHFkcyRhAI=;
	b=VuQi7oK10MFLxjtp0Nt9p8KnjFRw3EKbb3nAypChtdHZ0Eb9wiY6zpsaHTUrZ0nlAs7ltkXw2
	xB2mlmV6Nx6ocAZNWJXvl6gesQs+AsWLpVSxLHN9nAjH2wIzhi3eE09l+OtettYcZ8bzrFnI4jR
	g4OGgo8RVawvK0gG7bh4gag=
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4dHbYr66WxzpStw;
	Fri, 28 Nov 2025 09:39:12 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 0165B1804F2;
	Fri, 28 Nov 2025 09:41:23 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 28 Nov 2025 09:41:21 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <viro@zeniv.linux.org.uk>, <linux@armlinux.org.uk>, <will@kernel.org>,
	<david.laight@runbox.com>, <rmk+kernel@armlinux.org.uk>
CC: <bigeasy@linutronix.de>, <brauner@kernel.org>, <jack@suse.cz>,
	<nico@fluxnic.net>, <akpm@linux-foundation.org>, <hch@lst.de>,
	<jack@suse.com>, <wozizhi@huaweicloud.com>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>, <catalin.marinas@arm.com>, <rppt@kernel.org>,
	<vbabka@suse.cz>, <pfalcato@suse.de>, <lorenzo.stoakes@oracle.com>,
	<kuninori.morimoto.gx@renesas.com>, <tony@atomide.com>, <arnd@arndb.de>,
	<punitagrawal@gmail.com>, <rjw@rjwysocki.net>, <marc.zyngier@arm.com>,
	<lilinjie8@huawei.com>, <liaohua4@huawei.com>, <wangkefeng.wang@huawei.com>,
	<pangliyuan1@huawei.com>, Xie Yuanbin <xieyuanbin1@huawei.com>
Subject: Re: [RFC PATCH] vfs: Fix might sleep in load_unaligned_zeropad() with rcu read lock held
Date: Fri, 28 Nov 2025 09:39:35 +0800
Message-ID: <20251128013935.3539-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251126192640.GD3538@ZenIV>
References: <20251126192640.GD3538@ZenIV>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_174132_820000_234ACB75 
X-CRM114-Status: GOOD (  17.05  )
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

On Wed, 26 Nov 2025 19:26:40 +0000, Al Viro wrote:
> For quick and dirty variant (on current tree), how about
> adding
> 	if (unlikely(addr > TASK_SIZE) && !user_mode(regs))
> 		goto no_context;
>
> right after
>
> 	if (!ttbr0_usermode_access_allowed(regs))
> 		goto no_context;
>
> in do_page_fault() there?
>
> NOTE: that might or might not break vdso; I don't think it would, but...

On Wed, 26 Nov 2025 23:31:00 +0000, Russell King wrote:
> Now, for 32-bit ARM, I think I am coming to the conclusion that Al's
> suggestion is probably the easiest solution. However, whether it has
> side effects, I couldn't say - the 32-bit ARM fault code has been
> modified by quite a few people in ways I don't yet understand, so I
> can't be certain at the moment whether it would cause problems.
>
> I think the only thing to do is to try the solution and see what
> breaks. I'm not in a position to be able to do that as, having not
> had reason to touch 32-bit ARM for years, I don't have a hackable
> platform nearby. Maybe Xie Yuanbin can test it?

Hi, Al Viro and Russell King!

I moved the judgment forward to before local_irq_enable() and submitted
a new patch:
Link: https://lore.kernel.org/20251127140109.191657-1-xieyuanbin1@huawei.com

This is because there's another bug I reported before that also requires
a similar judgment, but before the interrupt is enabled.
Link: https://lore.kernel.org/20250925025744.6807-1-xieyuanbin1@huawei.com

I hope this can fix both of these bugs.

It is closer to the x86's implementation and works well in current tests.
Could you please take a look? Thanks you very much!

Xie Yuanbin

