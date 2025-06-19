Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C2BC71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 07:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9s2itYDtKWc+t3xAk6VRrZvb9potPSGRw+GHxNp+XWI=; b=F3bNKl46Hn3pbLEcaSr/mqzfjZ
	Mi7KDqxLY1Ent7TdvVNtFViizoKlo3TFDn6PAtgCS+dzMHazs0KykcAzdbHcjsvoEpuT1zqR5FhH7
	EpxqPhsVMGJjT1pfjgrGN//zMISYriaVND1LDP3P8v8J+jMsoUkz6QOkol2Wanr7QvTyIW7Yr2Y/t
	XpB1cJDBQLtW8ZLLuz+ni8Jbu6MtPVFYyiPJQL5N+4NfeNAozrvF8/YwPNxtf7k5jlzlyTE02wrbU
	sfzygAW3HXD2QPuQ+0E+/t9+JIC8QqdATbereyDIKXpotPQND7NbE4+wEYqTvbcBrU6iGFE0Eabf2
	0vi1Okcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9qj-0000000CJdZ-0nyi;
	Thu, 19 Jun 2025 07:38:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9MV-0000000CFs9-2paR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 07:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750316823; x=1781852823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C4QpgZkZ9IIpsWFHkaQ514mxLlArKqKI3Y9pvUN/FWI=;
  b=Cbgrqgjj8p5BoDnR4/pUmQVR6FJ9f2UQYjPBhShyd/pEXHHf0Ov5WzAH
   hVQ8kF56OoGd9dts94UWylWGnxNEl3tb8Q5cuoH6XGmJ5KyGvOJ0B5tux
   gwTgOJCGUTJWNt+4Sfrnq0KRnvkbM+QfDps3Pxi55XJlwo53uo7Bs7RVb
   zKkveI1S4gfOmzH15xPVWRQtSMxGLXZF1494ffRfilCeIc60Lp80VJ3Tq
   WEZB3yikzcsGCllm1pPsxEuRbyhfSGYfb4aL242D3QPuloci33Pau5A0z
   ZkCPynN3uLkEMNfLrxsu2cg6ORHQaA/f4wlpvsUO/9ZJjtdLUpq4oiwWx
   Q==;
X-CSE-ConnectionGUID: PlQ5gDZlQHSrfxlUJA1/0Q==
X-CSE-MsgGUID: Gh79I1KERw++gOMSoTiWPQ==
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="48018357"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2025 00:07:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Jun 2025 00:06:46 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 19 Jun 2025 00:06:44 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v3 1/2] ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
Date: Thu, 19 Jun 2025 10:06:35 +0300
Message-ID: <20250619070636.8844-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619070636.8844-1-mihai.sain@microchip.com>
References: <20250619070636.8844-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_000703_718323_28505576 
X-CRM114-Status: GOOD (  10.20  )
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

Describe the cache memories according with datasheet chapter 15.2:

- L1 cache configuration with 32KB for both data and instruction cache.
- L2 cache configuration with 256KB unified cache.

Before this patch the kernel reported the warning:

[    0.161955] cacheinfo: Unable to detect cache hierarchy for CPU 0

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index d08d773b1cc5..f123faaa2ef7 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -32,6 +32,16 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			clocks = <&pmc PMC_TYPE_CORE PMC_CPUPLL>;
 			clock-names = "cpu";
+			d-cache-size = <0x8000>;	// L1, 32 KB
+			i-cache-size = <0x8000>;	// L1, 32 KB
+			next-level-cache = <&L2>;
+
+			L2: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x40000>; // L2, 256 KB
+				cache-unified;
+			};
 		};
 	};
 
-- 
2.50.0


