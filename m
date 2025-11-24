Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744FFCFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5709uEBG2Uy+VI1LipKnJ6HbxTIyBuRpWdTcKY3NT90=; b=mPaZVZBWvXKfhk3UiVaOHAXsqf
	lJ5iuztsCmCsF2XFYG/cEdrQ17FODJsQ45PacMdbV8jkkHRlD43BFkcTMKewbGtcrS2mZhO43ePpH
	teAhZ46NSPKC3D9CP/F7A1zTZM0LeHKlOonAq3KFpedrnnp3Op3Wx+dk1XPDtiNqjAI4fRWJ9Dy8v
	CtapVMG6sIwjxwHWL3ibDbI9AcE1KiQKc+Tzv1/7CqGu8Mm58rL9tAutlOpGXmfBg26beJDc1MJIX
	9Yy/S69arx4mq3YfcTtm86nLHb8RPmS190yMAJP1Bq1g/vMZNXi0G+0j0YEqs7n/Hl2MrGgGjd9Pz
	0LdVZz3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVNJ-0000000Bbme-0dTl;
	Mon, 24 Nov 2025 12:08:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVNA-0000000BbjO-3HYu
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 24 Nov 2025 12:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5709uEBG2Uy+VI1LipKnJ6HbxTIyBuRpWdTcKY3NT90=; b=bpwj0NyptzvMkQUfp+NAgRy2ds
	IZQhDBZBsttE9zDvVi1ds458qjX3Qx4TgdW0pz3+gbqjGaOr5bCKdH5bqr5k+Y0BWjvBmdWkEYL6g
	rVMxVDZgx2rstOjAyVWt6YnBp7ZBOqilxnSHhYXpgCv2wNpPYGwAsSBeybx8xfIxt0RmXpXxGvMjv
	tNLBP3GMgxmS7UQwXdtD2f+5Eix1SBQQEvJcG9bKqYh9MNVIjsfTWd0xYdS/RX0gN7kVdWKLWqNHb
	Tski3tyuEcNDh51mngZNz8k7LHI/TYQEvpv0qJHRcURZ/wZBTIiYVt+tSSJuRQZ7Tg3iwRn91YD3g
	h8PHjRkA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUVW-00000003bfe-0P1n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 11:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763986125; x=1795522125;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=9ej8J1aZ3loXRs29McB2qWVnK7bVOI1xJP2oRmJpeJc=;
  b=wkcnKSji64xoA9qtkCDuPDNsGtEbZufudOF0wmHJ2Ryb0okFyB5DG1jn
   ZGFKR+xOryLFNxUpDuPDqL14DWGr1wmjj0jq51M/F5mFUygMfUsGvATtt
   /IznlbEFRwMgI2Fhxj+CtXswbE8xU5+zUd5cyHvOY9ehHhcKv7zM3pVh4
   CxaPWicGFN1fSqQIiysVLaekpudxQ3xxnNbwei2SyJQaGvXK9eyvYMQU8
   +ttCRt8AJJ1V+wQdid7MNbTERofjgpxfx6Xw9CbE1Cvw1ewMqgKMBz/oO
   IAe/BHaODgwuUmwKucegchwg3TYlrCY/du/ulLX72DPDgPhILUhakfI4E
   A==;
X-CSE-ConnectionGUID: gUF4PjAbQbmCnyQvE/5J6g==
X-CSE-MsgGUID: lMvotyy9QcWUti+rtlo/qw==
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="216913327"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 05:08:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Mon, 24 Nov 2025 05:08:16 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 24 Nov 2025 05:08:13 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Mon, 24 Nov 2025 13:07:20 +0100
Subject: [PATCH v3 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251124-cpitchen-mainline_gfx2d-v3-4-607f8c407286@microchip.com>
References: <20251124-cpitchen-mainline_gfx2d-v3-0-607f8c407286@microchip.com>
In-Reply-To: <20251124-cpitchen-mainline_gfx2d-v3-0-607f8c407286@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=9ej8J1aZ3loXRs29McB2qWVnK7bVOI1xJP2oRmJpeJc=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ6aK1zwdAROlVrWvy9ubpkk0TNg0f8mOGWHm04I61+r/8
 113Uza/o5SFQYyLQVZMkeXQm629mcdfPbZ7JSoFM4eVCWQIAxenAEzk+S+GP9yaP9dGKfhLhWuw
 +ZUtjj9qNukhp+Wrf35z5slq6zpWNjAyzI/Qm3DbubEigLdg4s3jPxaVfpl6R+nUnitZ77N8Jn4
 34wIA
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_111322_782074_4B262E81 
X-CRM114-Status: GOOD (  10.25  )
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
index 46dacbbd201ddb68a7456d6fe1afafa59db90ec8..79a82962264f51c4c243530b9dad9010f8cf1347 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -292,6 +292,14 @@ AT91_XDMAC_DT_PERID(26))>,
 			status = "disabled";
 		};
 
+		gpu: gpu@f0018000 {
+			compatible = "microchip,sam9x7-gfx2d";
+			reg = <0xf0018000 0x4000>;
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


