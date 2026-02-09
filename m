Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DB1E7E0BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 09:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AARFgzC0fMBE8JmsK8jIEnXa+E8kpDdgl2llKeN1/Q=; b=mrNzyGOzINiU+6Rv66s99VxIJ3
	+M6eq6jC9rWC/kPDDdr5J/QM5uOvfsGjRrS+2mOkuLO+s2ReHjZP6wyKzzQMQDRjKRosPoDsq6eP4
	2vWWqvBQ4PyrkiltILV4U/Gvyo3EfBjsIYXdX5F8NWMMjXEeivnb1akLraSHb/HBc7lSjYIQ443mc
	qOBW0bqXLaTl6BwuADeqzjEsrQA1QiWeMyseq078MuSKWY6nm/88yf7jGZ7/RyZXb3G82yhhK3tAP
	KVKZL+/zXW5swXcoLj045bky6u6GAM0YgLHhk3SqOarNo11bBi55w/Gmrfsv4GwuteqzsV6QDIVHS
	L2wEF9gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpO1U-0000000FCFg-3DL6;
	Mon, 09 Feb 2026 09:57:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpO1R-0000000FCFL-1j0p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 09:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770631057; x=1802167057;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=SJcXwEjPwEyF7P0cinELr017oWH1qV9HtV7GDFf2afM=;
  b=zzHvW2cdsx6SmUJMcl600aa5RDYIkq5QwtYwr8FVPsy9iCFGNb9oO7qu
   10mRLvnXrcZqLEJjho4GDEppRyrZ83z/Uh5jbjX2YPcsUxEKAYzAzwvB0
   e4Yeb8oN/6Sw3wThFu8GtUX5uvBnLsMON/Yr3JcehgcZ/2HQlO5EPvvOe
   kr57Dr/Rq0xe1VS2NvKoRWnGIUGpSYqmMqJoLB/qE8ZZP8axOwCkXf25Y
   /4dzShem+oENfQI2QMDjOSHks1EVPz05zaDXuAbbHLyiSF2ercNXcmHbN
   vuz+DqmETCgVCvQudl7qnAyYxV0oGhs9JKVrfssJaJ7+YFnF53VZB1e1S
   g==;
X-CSE-ConnectionGUID: n6GCMgA6T7aR0CMTfKvLPw==
X-CSE-MsgGUID: zONayUfETLyU0Yifo9Z7gw==
X-IronPort-AV: E=Sophos;i="6.21,281,1763449200"; 
   d="scan'208";a="220421091"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 02:57:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 9 Feb 2026 02:57:24 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 9 Feb 2026 02:57:21 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Mon, 9 Feb 2026 10:56:47 +0100
Subject: [PATCH v7 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260209-cpitchen-mainline_gfx2d-v7-4-0c12e64a0950@microchip.com>
References: <20260209-cpitchen-mainline_gfx2d-v7-0-0c12e64a0950@microchip.com>
In-Reply-To: <20260209-cpitchen-mainline_gfx2d-v7-0-0c12e64a0950@microchip.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Cyrille Pitchen <cyrille.pitchen@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=935;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=SJcXwEjPwEyF7P0cinELr017oWH1qV9HtV7GDFf2afM=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ2bn+jyr2ede1H9dx3b7RPtaAcN5jpu8XTZOCvlw9Iz8K
 2lVOe9HHaUsDGJcDLJiiiyH3mztzTz+6rHdK1EpmDmsTCBDGLg4BWAib8QYGXqDr5279Ohqyv/D
 f25kP7u+4BT308ypOx9/Obrj2E67yw97Gf7nLHR86rh6rZTN4a6Nn72SW2r+WOn3bmv4vTEnyfX
 bVENmAA==
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_015737_751264_AF9DD57D 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

Add support for the GFX2D GPU.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index 46dacbbd201ddb68a7456d6fe1afafa59db90ec8..44ad05af7f969c2c6c13310a85c07375442388e6 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -292,6 +292,14 @@ AT91_XDMAC_DT_PERID(26))>,
 			status = "disabled";
 		};
 
+		gpu: gpu@f0018000 {
+			compatible = "microchip,sam9x7-gfx2d";
+			reg = <0xf0018000 0x100>;
+			interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
+			status = "disabled";
+		};
+
 		i2s: i2s@f001c000 {
 			compatible = "microchip,sam9x7-i2smcc", "microchip,sam9x60-i2smcc";
 			reg = <0xf001c000 0x100>;

-- 
2.51.0


