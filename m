Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDD0CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 13:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebSoV5XiUnrw+INdzHAjw6zeV1hjAXXoo/TgIsxQyzk=; b=44pmn/djR05kiHHhIMob7o1VMs
	shJ1KCMwRs8lyprVLEgPQrqsqmbBcdlGC7cxjyiRhBZzwHsOB3inw54jnCnezjXcP1wiifRJxmPSb
	qRr1S2d6jTjJK9Yrom96UOPjPIUSdGnyAhsFXnY2D7kngV2jxeMsrwFVMRWvjTZb4rzBqse2yUa5O
	ypIr5o3OOUVqmOHFykxjbFJm+wKyJDRJ8a93L1pzdsTjdXlmtEcuh60EE8SsRn1LoltwRd77p1Mj1
	WxEgzTW6+hOXWhkY4var2DWGethCuEczNz9D0bNye2S6yYiagBWCEoDVoYu22qY1nH2CHdnloTB71
	Hemn5hxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEo2F-00000004Rac-1Tfc;
	Thu, 08 Oct 2026 13:19:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEo2D-00000004RZm-09iv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 13:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791465585; x=1823001585;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=90E4Y3iv3wZWZ7rk6RLZc9iA+z4ETFdFADS8b0uLgEQ=;
  b=F3YTr9fP/6LpY7UcSt5SpUZnZnMgGGPLGbmSwYXQtaSTBjWJv+YRt+A2
   96PgxZ+tmCww5RQYRMmAVBauUwjzuA8x+rHglyeyinN2zB6GClpu+i+K5
   yYh5/j/LwbgzeedD7lQjr9CwnbDHTn/lQ/373wTnMtFWR5zrsD3RGKYod
   4rXAMPH0cP1LlPB1/2wqek8U8lzgWbkgTSJjsVt2gX40lu/DQRae5067X
   nciPG6wmuwCDQnqm1OchwA3GiV8vRJ9AkoIY8mIuJW3NSX3sUSV+OMexA
   dEXAmYHCm7vs2LyIdxoc823XkJtkFXvX/Y9tM5eLw2At6OIrocz71Xat7
   w==;
X-CSE-ConnectionGUID: +622eI16QE6ee81ArI64fQ==
X-CSE-MsgGUID: Z8DGjZI9Tiuopdsb1Eu7hg==
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="296168800"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 06:19:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Thu, 8 Oct 2026 06:19:42 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 8 Oct 2026 06:19:38 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Thu, 8 Oct 2026 15:19:04 +0200
Subject: [PATCH v10 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261008-cpitchen-mainline_gfx2d-v10-4-67ca2477b3d5@microchip.com>
References: <20261008-cpitchen-mainline_gfx2d-v10-0-67ca2477b3d5@microchip.com>
In-Reply-To: <20261008-cpitchen-mainline_gfx2d-v10-0-67ca2477b3d5@microchip.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Cyrille Pitchen <cyrille.pitchen@microchip.com>, Manikandan Muralidharan
	<manikandan.m@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=90E4Y3iv3wZWZ7rk6RLZc9iA+z4ETFdFADS8b0uLgEQ=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9bxGWF87UrsfKl/4/o/9xre2D9vxradgs5v77M8vmj68
 Z7R/NKqjlIWBjEuBlkxRZZDb7b2Zh5/9djulagUzBxWJpAhDFycAjCRGwsZ/ikYl/9gYBN/vsPh
 2gKjZ102v1x3TfSRvP5qz9ub8+dZSScz/NO+soxdceGOufzHzXkUDbMq/v4UVpt0eav6IseThbL
 C71kA
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_061945_088040_471B202F 
X-CRM114-Status: UNSURE (   9.40  )
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

Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index c680a5033b6b..5450fddf89dd 100644
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
2.53.0


