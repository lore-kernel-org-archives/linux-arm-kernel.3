Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C430DCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=kIMYOv6s//qZZkoCLbDvARcCpDfB5MBd/nSeBfKH2VM=; b=ZwKDLdO2OfzM5AI4u1RpbNXdTb
	ySFkzpHMK76MmulN/fEHRvKYSCXgIlIRL5AYXomNJhFtCKTIQEtgij8KVtc9hTkS6MLI8faVuBMzG
	NjmjyywUxUl4LbbYGzxzyoFzSu2pHLBro4jv0p+SlGjCeSDfLPp3niHBWTXnOlN4QNon01moobEpn
	g1KjiY5hOYA/IVZtxQjEK5cg9xoEc27U3Q3/beCGaBrdZ0Gwm+x4MODEsVjOLAHgZlqLDdpUY8/6W
	UrhrU8botqgHheja1feTPqqR4+cSeWFD/lZ1rPgBTmN5H3uBeh09UMzYjo70H/zyKovDa8wzjRyOm
	U9ByAv7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE2X-0000000FDOQ-2SEJ;
	Wed, 27 Aug 2025 11:10:05 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDMn-0000000F3wq-2S4Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:27:00 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250827102651euoutp0130426eda1eb392371fdd73be1a1c6472~fmNL2p5Kz1630516305euoutp01e
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 10:26:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250827102651euoutp0130426eda1eb392371fdd73be1a1c6472~fmNL2p5Kz1630516305euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756290411;
	bh=kIMYOv6s//qZZkoCLbDvARcCpDfB5MBd/nSeBfKH2VM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=PytEsFU3at0qV0EB6I+GAJATmXCia9OKKOuVBHHI932PmIYEdrYMSeLWIwNglHdWG
	 Tovx/Qqz0AnJphhIDHI0pOLbzmlie4Ea56J9Uq6geW1VlxPibJluZF1MZVuePp5CCA
	 Cs6O3X0SvG4YRPrxaXaVssh76+F65NybQhILI8Ig=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3~fmNK0PAmT2376023760eucas1p1Z;
	Wed, 27 Aug 2025 10:26:50 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250827102649eusmtip14a7c3f2eb31bf6b008892068161c8f1c~fmNJnvdY52203622036eusmtip1W;
	Wed, 27 Aug 2025 10:26:49 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Krzysztof
	Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Ingo
	Molnar <mingo@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Youngmin Nam <youngmin.nam@samsung.com>
Subject: [PATCH] clocksource/drivers/exynos_mct: Use percpu interrupts only
 on ARM64
Date: Wed, 27 Aug 2025 12:26:45 +0200
Message-Id: <20250827102645.1964659-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3
X-EPHeader: CA
X-CMS-RootMailID: 20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3
References: <CGME20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_032658_057053_CDE5F388 
X-CRM114-Status: GOOD (  12.55  )
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

For some unknown reasons forcing percpu interrupts for local timers
breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
flag only when driver is compiled for newer ARM64 architecture.

Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clocksource/exynos_mct.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 62febeb4e1de..fece6bbc190e 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -603,7 +603,8 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 			if (request_irq(mct_irq,
 					exynos4_mct_tick_isr,
 					IRQF_TIMER | IRQF_NOBALANCING |
-					IRQF_PERCPU,
+					(IS_ENABLED(CONFIG_ARM64) ?
+					 IRQF_PERCPU : 0),
 					pcpu_mevt->name, pcpu_mevt)) {
 				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
 									cpu);
-- 
2.34.1


