Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC5DC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 14:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mR8vek708mey7dvWITWOPQyHzE3AVZqWOWLGafjCLZU=; b=x/wnPp62EeC54/2TmbM0Dv18ZD
	HynAwsaPVtktQeIS0y7Dc4pGRSs0jytwXML/YuezX8D1Y1b6prksG5xbTGoolghmQ5j58JvxEtvYG
	Pdu5d0Bo8VIooddrb1ByCdi2rW1mqfPIEJbay3HM1uTdEl7YiotjEhVsnjApcjEZu/VQa9DewLIq1
	VHkJ0ZCUonqbKjrVbPio9IwoSpqj2wr0JS3Sy7vmZlFz8epTftZa7HYNlDnzIzlXJh0RfrTVUCrBW
	Se/yAAVBNRLKvQVw881GUkvpGtDPoGV2ZkpMo6E1PZuYzcFz/FyV44OLX5NM9Kz8sRWJwPA6rfkRt
	xfJdxR6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGPg-00000000cby-0GJu;
	Mon, 31 Mar 2025 14:46:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGE7-00000000ZdT-04qQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:35:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 85326A41DAC;
	Mon, 31 Mar 2025 14:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D241DC4CEE4;
	Mon, 31 Mar 2025 14:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743431698;
	bh=4lFmDVlO5QQIKxlq97M+xkBou2knFsS2ZM+0LhTToB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TjNjnNb4zO2+XU55a9rZrU/9lq+MNB0fu8WEA1MTp/Lhk4Xty52wop7pwtQNBhfA6
	 2oiUGqcZ1wYLMw/GymyJq1o4rF1ovka6aDlclYdr5j58S/6WBiPFmD4mssm7vUVA3X
	 +o8WepcrInuVJIu+rHVQeEIBDHS5tmAe630L1cvBzYcNoNgAm/ieoNX+5n1js6geNP
	 Eu2tj14T4TquKXZiN2M02LuP3R2jcOdYNZWi1Kd/RaQyJmSegWa+CjIJMu+L+5lJ+a
	 Wek9CNZNFn0OquMP0dIPkM6ptexPvybGCQdW7I5eh6WavMyYx9bLcQckGqk4V6cctc
	 4DHxnL3HC2ZPg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 03/16] irqchip/gic-v3: Add Rockchip 3568002 erratum workaround
Date: Mon, 31 Mar 2025 10:34:37 -0400
Message-Id: <20250331143450.1685242-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331143450.1685242-1-sashal@kernel.org>
References: <20250331143450.1685242-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_073459_186297_B7EA9B93 
X-CRM114-Status: GOOD (  13.63  )
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

From: Dmitry Osipenko <dmitry.osipenko@collabora.com>

[ Upstream commit 2d81e1bb625238d40a686ed909ff3e1abab7556a ]

Rockchip RK3566/RK3568 GIC600 integration has DDR addressing
limited to the first 32bit of physical address space. Rockchip
assigned Erratum ID #3568002 for this issue. Add driver quirk for
this Rockchip GIC Erratum.

Note, that the 0x0201743b GIC600 ID is not Rockchip-specific and is
common for many ARM GICv3 implementations. Hence, there is an extra
of_machine_is_compatible() check.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/all/20250216221634.364158-2-dmitry.osipenko@collabora.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          |  9 ++++++++
 drivers/irqchip/irq-gic-v3-its.c            | 23 ++++++++++++++++++++-
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index b42fea07c5cec..ab87b3499b386 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -283,6 +283,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Rockchip       | RK3588          | #3588001        | ROCKCHIP_ERRATUM_3588001    |
 +----------------+-----------------+-----------------+-----------------------------+
+| Rockchip       | RK3568          | #3568002        | ROCKCHIP_ERRATUM_3568002    |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Fujitsu        | A64FX           | E#010001        | FUJITSU_ERRATUM_010001      |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 100570a048c5e..4531ed216d50c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1298,6 +1298,15 @@ config NVIDIA_CARMEL_CNP_ERRATUM
 
 	  If unsure, say Y.
 
+config ROCKCHIP_ERRATUM_3568002
+	bool "Rockchip 3568002: GIC600 can not access physical addresses higher than 4GB"
+	default y
+	help
+	  The Rockchip RK3566 and RK3568 GIC600 SoC integrations have AXI
+	  addressing limited to the first 32bit of physical address space.
+
+	  If unsure, say Y.
+
 config ROCKCHIP_ERRATUM_3588001
 	bool "Rockchip 3588001: GIC600 can not support shareability attributes"
 	default y
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 8c3ec5734f1ef..f30ed281882ff 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -205,13 +205,15 @@ static DEFINE_IDA(its_vpeid_ida);
 #define gic_data_rdist_rd_base()	(gic_data_rdist()->rd_base)
 #define gic_data_rdist_vlpi_base()	(gic_data_rdist_rd_base() + SZ_128K)
 
+static gfp_t gfp_flags_quirk;
+
 static struct page *its_alloc_pages_node(int node, gfp_t gfp,
 					 unsigned int order)
 {
 	struct page *page;
 	int ret = 0;
 
-	page = alloc_pages_node(node, gfp, order);
+	page = alloc_pages_node(node, gfp | gfp_flags_quirk, order);
 
 	if (!page)
 		return NULL;
@@ -4887,6 +4889,17 @@ static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
 	return true;
 }
 
+static bool __maybe_unused its_enable_rk3568002(void *data)
+{
+	if (!of_machine_is_compatible("rockchip,rk3566") &&
+	    !of_machine_is_compatible("rockchip,rk3568"))
+		return false;
+
+	gfp_flags_quirk |= GFP_DMA32;
+
+	return true;
+}
+
 static const struct gic_quirk its_quirks[] = {
 #ifdef CONFIG_CAVIUM_ERRATUM_22375
 	{
@@ -4954,6 +4967,14 @@ static const struct gic_quirk its_quirks[] = {
 		.property = "dma-noncoherent",
 		.init   = its_set_non_coherent,
 	},
+#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
+	{
+		.desc   = "ITS: Rockchip erratum RK3568002",
+		.iidr   = 0x0201743b,
+		.mask   = 0xffffffff,
+		.init   = its_enable_rk3568002,
+	},
+#endif
 	{
 	}
 };
-- 
2.39.5


