Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0942D2ED12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Qw33CcAARNM4wqwGlJt8an5UAQMcFZLLzwCYW9E3Xw=; b=VawXcjrUadFyl5thIdvKiM0MEr
	CdHnwwSx2/ABF1XxSxVI2USuUfzutgkXPeKtmNXXd4BAOPDl8mSmhS1racnkMUMihWYoGB/eIf4hI
	hWnhtk/oL7P/lMyHAsWY4QqmXyGTx1H9rozOg03Hi3GxfHxl4dhzy14y6D9a2VkB2FYXf2kFAOjVz
	1SDsQCo7tEtj7TOnyGpbu8NcL5nfVW49zMYxj0pzPwY60GVW6CMqthjtfkH0WBHn1DdQnZmd44Eiv
	Dw30rYlRF9CDKDL0+1EuirLEw0RXdCynGUNU+HGKeGHAZBGMblzJbaAN5qR11Uczob1ZyhfA37Xil
	gjM+uyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAVN-00000003mqG-2NXA;
	Tue, 20 Jan 2026 12:06:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAVH-00000003mnm-114Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768910793; x=1800446793;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=C71JsLsXZTzDeNE29wxM5SpxjiRFCgffC1Vj45wWDMI=;
  b=jMxWyc0FGq5aKZmZBElQP0Xh0dSiinylYS/FxsWE9qvfgQAlnc7Ezc0r
   mVCjScjmksHd1fbZMqhhV/Ulij/YdLpl3FxEstjb2wRyJVTWeYL1YDN57
   ISfL8rIjHsysOi3qOUsr7r4dgWs7epap+r6sqU2ly5AabEOnX+BS0eL9l
   Lu4nKMphyn7+6zuRAVAlN/75QAojcK3qt4tsk2XcrtGem+2TVmeXrMrzj
   t802cjhTvOEV9YbYF5un/Z3w0NZHSkvUbBZfJwUS26IHf6G6fi0sj+Uu7
   /YZeJiTHBDah7DXgeiSPPcdIJjdJ8jrC0HEfGEsr1bueq6VRhD5DhcxuB
   g==;
X-CSE-ConnectionGUID: cs3Ol+IYSlGMTOzGTXpEYQ==
X-CSE-MsgGUID: 2u6Oa5lxSUOSLPaebV6n4w==
X-IronPort-AV: E=Sophos;i="6.21,240,1763449200"; 
   d="scan'208";a="59182655"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:06:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 20 Jan 2026 05:06:11 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 20 Jan 2026 05:06:07 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Tue, 20 Jan 2026 13:05:36 +0100
Subject: [PATCH v6 3/5] ARM: dts: microchip: sam9x60: Add GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260120-cpitchen-mainline_gfx2d-v6-3-1a16cd1d70b8@microchip.com>
References: <20260120-cpitchen-mainline_gfx2d-v6-0-1a16cd1d70b8@microchip.com>
In-Reply-To: <20260120-cpitchen-mainline_gfx2d-v6-0-1a16cd1d70b8@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=926;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=C71JsLsXZTzDeNE29wxM5SpxjiRFCgffC1Vj45wWDMI=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ2Z+/sKCNYXJs/h9ba1v3301/fUJ/3MvJpyykJJpaLV7l
 vC9wHxtRykLgxgXg6yYIsuhN1t7M4+/emz3SlQKZg4rE8gQBi5OAZjIgtcMfwU27NyxdpZldde5
 COG7r6Z947RYtP9SQdNsNo2pE0Nyui4x/E+zdZ5Xs+qf65slUrJc9TaTxGrz1ooVb/21/tiOC1O
 zmNkA
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_040635_314550_0EF9C7AF 
X-CRM114-Status: GOOD (  10.06  )
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
 arch/arm/boot/dts/microchip/sam9x60.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index b075865e6a7688005d471665459b3f6f1f26f7a4..58d0a2ce9218999e469dc435e21acd8837a4bcad 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -353,6 +353,14 @@ AT91_XDMAC_DT_PERID(26))>,
 				status = "disabled";
 			};
 
+			gpu: gpu@f0018000 {
+				compatible = "microchip,sam9x60-gfx2d";
+				reg = <0xf0018000 0x100>;
+				interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
+				status = "disabled";
+			};
+
 			i2s: i2s@f001c000 {
 				compatible = "microchip,sam9x60-i2smcc";
 				reg = <0xf001c000 0x100>;

-- 
2.51.0


