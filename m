Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0F6CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 16:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akBGkOEOlGYhEbnp+4TPffwtf+bndS3xlT3KFEyzqHY=; b=O5iulpdR0HmgAHLtAQfmmA5LMm
	KdRX/iupbR/ZXheMBfjvx6j2z+/RkohWh8BbfqSFiPnKq3XIlNaJ++dx+9uteaSbZv/j2xezie7jA
	bkEK7V+SMYy2Ro5OCK1MP3wzgSwXjrWCcNqABjYKMtXer42UXdPaxh0AzsSbVCaWBp8kxzAQml1nI
	pOYZP/jtExR0wqL6AmBAx9QSA9ILkFLj7ImueWvLC6fY5TqaoNw5Ff/moEabmXg/NbFudIvEyJJts
	Nk9VzGKLO3QYpYIAJHlcvcfazFDU9c22N1PIRD1BFghAFg2NzS7GndWjieec7CYaGh4mABT3fGCSk
	Vi9MZzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfW8-0000000DYc6-0Xb6;
	Tue, 13 Oct 2026 16:38:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfW3-0000000DYYh-1F2Z
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 16:38:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=akBGkOEOlGYhEbnp+4TPffwtf+bndS3xlT3KFEyzqHY=; b=TvwkD8j5kbSjoPyMfmKKVLf8QN
	UAJq82viLOi2pSMAK1fQMk913W4NkCz1lnJbBwJv7RbTtoY4EhSEIlh2WxuuXhaNq5ZHQaHwfXEdr
	ehAx0MOEzeSnfC5P52DI/lqXLIZxV+ct45aw+rQB1rD61EuRiLi6i1cFhFni6yTpVne0uWJNoMcbp
	OLV8TmswGQHSoUMflVRWArcrJZ54lHG1O9nGsWCt0kD5fd0UmKtuw4T/1KkE5McsDIXFVJIWx2Kpw
	0d2EHRNK0jGqMAHTLzZTkv2nMUVpbRWtrjR0I0lMp+rp+JbAlEc9OnlZmia0r6Hck/9VhKA3yfR27
	aYcnD05A==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGfVz-0000000FnYb-3McT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 16:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791909497; x=1823445497;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=+Q3Zno1VCYhLi025pNDCmJZ5SJkmktbvvlNyIe3ul58=;
  b=Li/F6TApbFTjL7DltMfUgvuwLXsA8UcqWKB19iRiLiQsJR2Q80kKWY4m
   VcaQniX4d2gRouCUQ+hy8wx2YX8zSNYAEvms6TY/6828xGDeKUQ8koHZS
   LV8HHHFn3XBg9pVl1tkZqMTritdJHSzrsbKo5W/BjWUoEi/PUBMHDspWA
   KfLB4YrEkVx9xWVoFsP5oW3vE8bDiAqQPfoFy9H/FOLQBpXmPDJJkuFUZ
   MZZHXgVum6JWFHFZWhZhBWRxSCsxjqkXFfUdxHY2g0KUTKzGiRVSUzj4T
   kQ63h9tD9C+HTkQ/sHCatvVquiFd3VvKyqom9fTiRO1PNbppXOqCLxYav
   Q==;
X-CSE-ConnectionGUID: Sp3osUIdQWWTWm3jf6a2zA==
X-CSE-MsgGUID: hbxw1M9VQ1CpZaB/MCeBVQ==
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="64973283"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Oct 2026 09:38:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 13 Oct 2026 09:38:05 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Oct 2026 09:38:01 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Tue, 13 Oct 2026 18:37:27 +0200
Subject: [PATCH v11 5/5] ARM: configs: at91_dt_defconfig: enable GFX2D
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261013-cpitchen-mainline_gfx2d-v11-5-7527f2efab0a@microchip.com>
References: <20261013-cpitchen-mainline_gfx2d-v11-0-7527f2efab0a@microchip.com>
In-Reply-To: <20261013-cpitchen-mainline_gfx2d-v11-0-7527f2efab0a@microchip.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=+Q3Zno1VCYhLi025pNDCmJZ5SJkmktbvvlNyIe3ul58=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9a5uEC+PVJ7HIt7Hz09nzhLY/3rhA8yc+Lqlh75FLxsi
 dsiu3+bO0pZGMS4GGTFFFkOvdnam3n81WO7V6JSMHNYmUCGMHBxCsBEfu5j+MP7cprqJ4Ubkh16
 QTLbF6UGFE3V8vrVFpe5aZ/UFKWbuZsY/nCp9t7wy2Y58Tu1qdWg6QDno+zQBWcsRa6kG+/fsvf
 +RXYA
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_173812_229720_B68DC2C0 
X-CRM114-Status: UNSURE (   9.87  )
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

The GFX2D GPU is embedded in both SAM9X60 and SAM9X75; enable the
driver to use it.

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index 830c6c0dbdaf..2a4a2d4c1865 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -142,6 +142,7 @@ CONFIG_VIDEO_OV2640=m
 CONFIG_VIDEO_OV7740=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
+CONFIG_DRM_MICROCHIP_GFX2D=y
 CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y

-- 
2.53.0


