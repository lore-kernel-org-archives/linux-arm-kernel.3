Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58403FA3753
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 17:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EI6exDOLRjBe+FyiSQivcEtmRGYVkSqXDNbNah1htvg=; b=T3NBcshl5Bd1hBXpYi6d5rOE/w
	Z96no4GaDVcczF6Q1dzbJ+Bt5NIGt6U0vr3f+ws6PNRkLwGWoV4cpZLDEfdwf2QYaqv0BPry1PCPJ
	eGqg81uWLQDni8pulYCkHQWQbr5usPvLD5SoIJrDwfYPpBmhO5FRZxXuhtX1KNTQDshHT954xNAp9
	GKD1g5F3xtxnQQl/gmwzJn2AJMDzXP4Z+85uOVHSOLknlc5Dsl8rncgiRtFsG/LhikyeSSuz0BJs3
	Dvh5fPqmFCfs9OJi0JBA1HH2v/swBvdfWXizNHwIWVcwi6+dtAVzS6V0PmCiTDON+WFAd3Z/oDHb1
	hK2OP25Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiXC-00000008Wf6-35d7;
	Fri, 02 Jan 2026 17:01:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiX9-00000008Wds-41ir
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 17:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1767373311; x=1798909311;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZY+Hrf2RDJpz96DFkZH7AD1GmvyE3tVeKZ338mKSv/g=;
  b=meMO5ritwuXdyrQITL0khI7Sow9KJ3p5i6oR+B6i8WNdkHoVJxN3CC1X
   e/Hu9zBdEUzXgAAJLMdCLA5KhZ3qcqJBirYIewEPDsAvArmVJKi2uokUU
   YT5isoGJ0lcomjfHyB4A9f5gpwSNjWFGEWiV1LylxQpN7vOnVoiWxMh2V
   IclJs2mjqlMtIxaq8WEEMSSI1MAUQyMsfzuqaR7sqWuApKfauZ4KVbDdX
   sCWGg6x6ziTzj7W2k2UpkcmZEjxKI4GbYAeUPp2MU92kK/7v938m545Xc
   OFEa6c4ePeDKUfGockv8VcG5HpNNzGP4DDtKcFMS2s/PZDYdis06tvRw8
   Q==;
X-CSE-ConnectionGUID: dCrVUlstT/WCgDlJ76zoeQ==
X-CSE-MsgGUID: bmfnSXGJRcikdFj1WZvODw==
X-IronPort-AV: E=Sophos;i="6.21,197,1763449200"; 
   d="scan'208";a="58167746"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 10:01:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 2 Jan 2026 10:01:40 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 2 Jan 2026 10:01:38 -0700
From: <nicolas.ferre@microchip.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Balamanikandan Gunasundar
	<balamanikandan.gunasundar@microchip.com>, Ryan Wanner
	<ryan.wanner@microchip.com>, Conor Dooley <conor.dooley@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>, <stable@vger.kernel.org>
Subject: [PATCH 2/5] ARM: dts: microchip: sama7d65: fix size-cells property for i2c3
Date: Fri, 2 Jan 2026 18:01:31 +0100
Message-ID: <20260102170135.70717-3-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102170135.70717-1-nicolas.ferre@microchip.com>
References: <20260102170135.70717-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_090152_005926_24CD9A67 
X-CRM114-Status: GOOD (  12.31  )
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

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Fix the #size-cells property for i2c3 node and remove the dtbs_check
error telling that "#size-cells: 0 was expected" from schema
atmel,at91sam-i2c.yaml and i2c-controller.yaml.

Fixes: b51e4aea3ecf ("ARM: dts: microchip: sama7d65: Add FLEXCOMs to sama7d65 SoC")
Cc: <stable@vger.kernel.org> # 6.16+
Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 5f3a7b178aa7..868045c650a7 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -527,7 +527,7 @@ i2c3: i2c@600 {
 				interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 37>;
 				#address-cells = <1>;
-				#size-cells = <1>;
+				#size-cells = <0>;
 				dmas = <&dma0 AT91_XDMAC_DT_PERID(12)>,
 				       <&dma0 AT91_XDMAC_DT_PERID(11)>;
 				dma-names = "tx", "rx";
-- 
2.43.0


