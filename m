Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1A6CED624
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 11:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=LM+4xzvGkofdU8UCUqnDiSvfc6MxCBehihsQGcilaR0=; b=CPVaZVu7rKnCnRt9gvEVpkidk0
	sVVRUc0xGS0TbZEZYrSwBrCsh6HVhdtWSRgLZ4zjxNIuO1BUH7CIYnejgiwfm6SrcVjm/AnZayfFL
	ZTmGt4FJkfmqLU1wdc7gnRAU1hUxeLlW1v8b/PSkww5/w/J9bs5LleAEVz+xKeqkK4lRAlxYX+lkL
	0OHDGno26BrAjkOK6hJ5ZTWqmQ79UYGDawC0AUHv7XPCcWx6EpGxZqtcA3B2RMX2Ue5QJLsXqoJKF
	UfncAW//uB+qN+Cwid0nO4Kz/JtI17dHU/Ff+EoFmlejRAbVol/v1PIzYRuMwOYs90CCWTcHpR5gt
	IVWrMxkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKEg-00000000MZG-3ajZ;
	Tue, 18 Nov 2025 11:51:02 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKEb-00000000MXL-314a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 11:51:00 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251118115052euoutp02bfc0ecab212c73c9ba09f8f34658752b~5F5O66r511162811628euoutp02I
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 11:50:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251118115052euoutp02bfc0ecab212c73c9ba09f8f34658752b~5F5O66r511162811628euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763466652;
	bh=LM+4xzvGkofdU8UCUqnDiSvfc6MxCBehihsQGcilaR0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=XRLApuagX0KWhkUOlqPTUfVHBiqHUrBYkvGxRN1QzseZg2iJlCOMazdHnysRBc/aZ
	 4IwGBqHt70TraL4WmTIY+e8S5V7wSpo7IS17rMdLQdObNHStZ7a/xQWbHJvupQuFXE
	 YMMJWRsRmvJMDGV3YPaINiavao+MAHnLZAcrQDz8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251118115051eucas1p15f688883a4466dd7cabf3550a798c060~5F5OkYnUD1574115741eucas1p1L;
	Tue, 18 Nov 2025 11:50:51 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251118115051eusmtip26ddcaa86ac3b9de24aee86f339f9ae6e~5F5OOiUgk0502105021eusmtip2D;
	Tue, 18 Nov 2025 11:50:51 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Marc Zyngier
	<maz@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: exynos: Rework system wakeup interrupts initialization
Date: Tue, 18 Nov 2025 12:50:37 +0100
Message-Id: <20251118115037.1866871-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251118115051eucas1p15f688883a4466dd7cabf3550a798c060
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251118115051eucas1p15f688883a4466dd7cabf3550a798c060
X-EPHeader: CA
X-CMS-RootMailID: 20251118115051eucas1p15f688883a4466dd7cabf3550a798c060
References: <CGME20251118115051eucas1p15f688883a4466dd7cabf3550a798c060@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_035058_363452_7429BAB2 
X-CRM114-Status: GOOD (  15.33  )
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

Since commit 1b1f04d8271e ("of/irq: Ignore interrupt parent for nodes
without interrupts") it is not possible to get parent interrupt device
node when no 'interrupts' property is specified. Rework the hack used for
initializing the Exynos system wakeup interrupts (PMU controller is a
proxy for SoC RTC interrupts) to get the parent interrupt node by
manually parsing 'interrupt-parent' property.

Fixes: 8b283c025443 ("ARM: exynos4/5: convert pmu wakeup to stacked domains")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This fixes the following boot failure of allmost all ARM 32bit Exynos
boards observed since next-20251118:

/soc/system-controller@10020000: no parent, giving up
OF: of_irq_init: Failed to init /soc/system-controller@10020000 ((ptrval)), parent 00000000
...
8<--- cut here ---
Unable to handle kernel paging request at virtual address 00002008 when read
[00002008] *pgd=00000000
Internal error: Oops: 5 [#1] SMP ARM
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc1-00026-g1b1f04d8271e #16162 PREEMPT
Hardware name: Samsung Exynos (Flattened Device Tree)
PC is at exynos_set_delayed_reset_assertion+0x5c/0xb0
LR is at exynos_set_delayed_reset_assertion+0x80/0xb0
pc : [<c012b9a4>]    lr : [<c012b9c8>]    psr: 80000053
...
Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
Stack: (0xf0825f30 to 0xf0826000)
...
Call trace:
 exynos_set_delayed_reset_assertion from exynos_smp_prepare_cpus+0x10/0x34
 exynos_smp_prepare_cpus from kernel_init_freeable+0x94/0x234
 kernel_init_freeable from kernel_init+0x1c/0x12c
 kernel_init from ret_from_fork+0x14/0x28
Exception stack(0xf0825fb0 to 0xf0825ff8)
...
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland
---
 arch/arm/mach-exynos/suspend.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index 44811faaa4b4..02785342e0c7 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -192,6 +192,7 @@ static int __init exynos_pmu_irq_init(struct device_node *node,
 {
 	struct irq_domain *parent_domain, *domain;
 
+	parent = of_parse_phandle(node, "interrupt-parent", 0);
 	if (!parent) {
 		pr_err("%pOF: no parent, giving up\n", node);
 		return -ENODEV;
-- 
2.34.1


