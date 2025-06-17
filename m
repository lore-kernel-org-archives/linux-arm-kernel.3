Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FBEC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSzLRMIwhNa1PLh0/bLmocwiN3a3AKs28tTNKBLJb/Y=; b=4faccA9GmIS8D8VPaVUmpZeU4Q
	OFYCL4fyXp4oFkMtH6DslisNFwIoqxk05l1ANeu7tyOtpMiSYPP7TqfIbtgRygFhmPgOzdMV3Xpf3
	e6nV9t/qajUF/GWA7LKoqnfAopBHg3VVD555LQkHgm3+5bGBB+NcopInWrO/kab7M1oXRS2R6XygC
	7uGn7SLGW5zfDxc9+7szO2h+UxqFMBQ0fYwo0ERrvyC0y2Zg87Sl9s7EapkphoDiC16Ecj2tr/dtF
	Dzl4P6kcgpQU/uJcG5Qv+ynSd+w/JTL1m6V161CFIPgvqI5pL+S+VhqfqTz+niCP916iT+ziBO6vU
	TnyOUXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZrM-00000007zwP-1aPW;
	Tue, 17 Jun 2025 17:12:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYrl-00000007pzD-0dp1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 16:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750176532; x=1781712532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EB5X8t9uCWFld+ZhEZJ+i1WeKs1OXWAYq6WKGW2AoXU=;
  b=SY5uid+St05GEiUMp95Z0TfKzZlMMn+621lb74nFynobAb441hYwpCPc
   Q7hfo5PORvvIVRexjfR00JRnKOTnnx3Tm0KAlbgBK15T2JKddsCv1Z0gy
   yhIgDebfo7Z03qfvwFRWtT+SCEDBK2I0AzqBoVRx994MdyhMISznWUV6P
   FRJ5u2/A4vLIKymKF1uj2Gpx4jrC+Ii0PL6hmXey1nva5zCH1ZI4OPwG6
   ou/46g8ZWM0eRGIeVuiOpdUHyqjp1JdBNi6FtAjbEDeAiuR2Zr1vLhw1V
   2m4H1Cctkr48fFx5uRsO2gOaoTz3nD+lWS3xFxiCK9cEja2qBbRpuAAvy
   Q==;
X-CSE-ConnectionGUID: nTbCTdliQ7eOQ0UC/OTqRA==
X-CSE-MsgGUID: L+mGEzq9Q8uyf7PV/8cibw==
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="210388674"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2025 09:08:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Jun 2025 09:08:25 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 17 Jun 2025 09:08:25 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v5 2/3] ARM: dts: microchip: sama7d65: Add clock name property
Date: Tue, 17 Jun 2025 09:08:41 -0700
Message-ID: <3878ae6d0016d46f0c91bd379146d575d5d336aa.1750175453.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750175453.git.Ryan.Wanner@microchip.com>
References: <cover.1750175453.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_090853_258235_2A2BCB18 
X-CRM114-Status: GOOD (  10.50  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add clock-output-names to the xtal nodes, so the driver can correctly
register the main and slow xtal.

This fixes the issue of the SoC clock driver not being able to find
the main xtal and slow xtal correctly causing a bad clock tree.

Fixes: 261dcfad1b59 ("ARM: dts: microchip: add sama7d65 SoC DT")
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index d08d773b1cc5..f96b073a7db5 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -38,11 +38,13 @@ cpu0: cpu@0 {
 	clocks {
 		main_xtal: clock-mainxtal {
 			compatible = "fixed-clock";
+			clock-output-names = "main_xtal";
 			#clock-cells = <0>;
 		};
 
 		slow_xtal: clock-slowxtal {
 			compatible = "fixed-clock";
+			clock-output-names = "slow_xtal";
 			#clock-cells = <0>;
 		};
 	};
-- 
2.43.0


