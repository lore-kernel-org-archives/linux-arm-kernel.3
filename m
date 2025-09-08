Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833F2CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0G5fMfFq368J1CSgGKkpxs50mM6teQ4fVzBMLGiUHY=; b=1+7qKAdBUy9jJACog2qjcqYC3K
	Lhhxt0Jo2iorIHzjPua+IvUbEW78jk/RjYfpATNPIVGj8eWRvRpez1cEbUgRlf2l2sWHWrxMI2XpU
	P6FoAiq1lPohFlzTNdhZ2slhf0ZMyuyblHdjiWMHHW/tfbxxPGXd3XPSZpf36PTixWgr3Epa9TOh4
	5GXd6S4RzwY+MzlP/avk59WPrUyRj1dE8C8OlrvlSJjadsDR1vokoeYpn8fjuFFHL2OtBTL6C86we
	YZVQbweShBi5UFeLmT2m0ZdlFssM6OSotV52OfTo5v708whoyIu9HyaQIvaHClvwGjP5R9ps856vM
	gK51cZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfPl-000000016ek-2Uvr;
	Mon, 08 Sep 2025 17:12:25 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvctQ-000000007Rj-3dA6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:30:54 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588EUoS2071690;
	Mon, 8 Sep 2025 09:30:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757341850;
	bh=Q0G5fMfFq368J1CSgGKkpxs50mM6teQ4fVzBMLGiUHY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EeXrUvXnwb/y7fILvJFgRrf7vGiWAZNuw3eaPp4Uqvp+GzkCu8ZKz43K1tjsx2EO1
	 d6gb5mHTWbtE9NZV6pA5/M9mkbp1fO1iZteeLnM/AQCwjRAzp1vuSYAzf9FjJegdsC
	 JqKJU97mzaKFHraMtQhLjSKx/GAlByyE/DxwxhBM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588EUowA3835561
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 09:30:50 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 09:30:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 09:30:47 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588ESed01037553;
	Mon, 8 Sep 2025 09:30:43 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <d-gole@ti.com>, <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 22/34] Revert "arm64: dts: ti: k3-j721e-beagleboneai64: Fix reversed C6x carveout locations"
Date: Mon, 8 Sep 2025 19:58:14 +0530
Message-ID: <20250908142826.1828676-23-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908142826.1828676-1-b-padhi@ti.com>
References: <20250908142826.1828676-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_073052_993694_7D47804C 
X-CRM114-Status: GOOD (  11.01  )
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

This reverts commit 1a314099b7559690fe23cdf3300dfff6e830ecb1.

The C6x carveouts are reversed intentionally. This is due to the
requirement to keep the DMA memory region as non-cached, however the
minimum granular cache region for C6x is 16MB. So, C66x_0 marks the
entire C66x_1 16MB memory carveouts as non-cached, and uses the DMA
memory region of C66x_1 as its own, and vice-versa.

This was also called out in the original commit which introduced these
reversed carveouts:
	"The minimum granularity on the Cache settings on C66x DSP
	cores is 16MB, so the DMA memory regions are chosen such that
	they are in separate 16MB regions for each DSP, while reserving
	a total of 16 MB for each DSP and not changing the overall DSP
        remoteproc carveouts."

Fixes: 1a314099b755 ("arm64: dts: ti: k3-j721e-beagleboneai64: Fix reversed C6x carveout locations")
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v4: Changelog:
1. Updaed node names to 'memory@addr'

Link to v3:
https://lore.kernel.org/all/20250905051846.1189612-22-b-padhi@ti.com/

v3: Changelog:
1. None

Link to v2:
https://lore.kernel.org/all/20250823160901.2177841-22-b-padhi@ti.com/

v2: Changelog:
1. Re-ordered patch from [PATCH 04/33] to [PATCH v2 21/33].

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-5-b-padhi@ti.com/

 arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
index 66c4614f9e42..92f5e4a14a49 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
@@ -123,7 +123,8 @@ main_r5fss1_core1_memory_region: memory@a5100000 {
 			no-map;
 		};
 
-		c66_0_dma_memory_region: memory@a6000000 {
+		/* Carveout locations are flipped due to caching */
+		c66_1_dma_memory_region: memory@a6000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6000000 0x00 0x100000>;
 			no-map;
@@ -135,7 +136,8 @@ c66_0_memory_region: memory@a6100000 {
 			no-map;
 		};
 
-		c66_1_dma_memory_region: memory@a7000000 {
+		/* Carveout locations are flipped due to caching */
+		c66_0_dma_memory_region: memory@a7000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7000000 0x00 0x100000>;
 			no-map;
-- 
2.34.1


