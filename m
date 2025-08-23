Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACF9CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 18:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wubkPIHlAQCtCqH8MG9zg1z8L3GCg/PH1flaUEKCdg=; b=aH5OEax3mMeyvPyXJOI1uYAy2H
	evZh1ri8yuYiNYFF1FKLTtggPUH3MSE4Lmy6EBi64CR33jcco3wW6Aoz6VUIch651gQtWjyMm7NUU
	fSloI1FcdFuE45J/RSK4sRcQ0eVKolu+iI+8JKWqUtt8n07W2nRf8KT+jLnYnI+OvsShE2WLr4Q5a
	GOeXrYOuoMBvSEkQAhzgZAODEHnujpqdWboXs3sk0T+8WhkP5vaSxq6ySJhFS6ocvFdLgDSy6WEUB
	gFC/1IWRHw3EeCAFbt8rqKUBcra2jxRMWLgzXGwxIFZc9XT2xE7JRWz3jEgxkVC8E/s2gPNIALjkL
	HLRXimlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upsga-00000005A6v-3T04;
	Sat, 23 Aug 2025 18:09:52 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqpZ-00000004zXs-3wQj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 16:11:03 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57NGAxYE936213;
	Sat, 23 Aug 2025 11:10:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755965459;
	bh=4wubkPIHlAQCtCqH8MG9zg1z8L3GCg/PH1flaUEKCdg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eKOFKPShQ1HGRm6XS9hh6MJmq5LwgUbbIA1KeAccom/fLsZUgZrg24Dn6K9dl7Tbt
	 vcYRCZU5yF0D8tbvA43+9RpM86xKhGJqfDwnVKHyv0REgeiMhS4z92XCKR7OLFovNH
	 ckWIXymwbyQtU3zRh2VcOVXsUQgu7PxSon8tLGtE=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57NGAxDp239768
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 23 Aug 2025 11:10:59 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 23
 Aug 2025 11:10:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sat, 23 Aug 2025 11:10:58 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57NG9Exb1274978;
	Sat, 23 Aug 2025 11:10:54 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 21/33] Revert "arm64: dts: ti: k3-j721e-beagleboneai64: Fix reversed C6x carveout locations"
Date: Sat, 23 Aug 2025 21:38:49 +0530
Message-ID: <20250823160901.2177841-22-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250823160901.2177841-1-b-padhi@ti.com>
References: <20250823160901.2177841-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_091102_073132_3B67008F 
X-CRM114-Status: GOOD (  10.56  )
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
v2: Changelog:
1. Re-ordered patch from [PATCH 04/33] to [PATCH v2 21/33].

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-5-b-padhi@ti.com/

 arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
index 2ff4cdf1300f..f82966072605 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
@@ -123,7 +123,8 @@ main_r5fss1_core1_memory_region: r5f-memory@a5100000 {
 			no-map;
 		};
 
-		c66_0_dma_memory_region: c66-dma-memory@a6000000 {
+		/* Carveout locations are flipped due to caching */
+		c66_1_dma_memory_region: c66-dma-memory@a6000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6000000 0x00 0x100000>;
 			no-map;
@@ -135,7 +136,8 @@ c66_0_memory_region: c66-memory@a6100000 {
 			no-map;
 		};
 
-		c66_1_dma_memory_region: c66-dma-memory@a7000000 {
+		/* Carveout locations are flipped due to caching */
+		c66_0_dma_memory_region: c66-dma-memory@a7000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7000000 0x00 0x100000>;
 			no-map;
-- 
2.34.1


