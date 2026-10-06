Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA67CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 12:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akBGkOEOlGYhEbnp+4TPffwtf+bndS3xlT3KFEyzqHY=; b=eKKJLveeF6NxTmuaUrTDYBqG1m
	ma9cZDPYVNVpXBjVQdzY3xOEYlgTlFieNDUSufDW3pRvS2XKQdGwmxaYvWJELTF7XjIKtXPP7Skrt
	7y/xmVqn0PI1dHUJB+YUYp41p1k5ED4//o+nTOW6GfJguHyPOQS8FtI8xWGqDw4gMJ+91XJgjH5QR
	Db9BQvq+XjPLntwQ8ykUGIC7MGOAWHWF0/HFg60Xx0pOjd+6LfG1YwOEd7JoTs7x01iGABml0gdJ8
	cm4b6HjKIZKSM3XLC8iSL7TJBZyQnzVuw+qdmEvxzABPk9Dq+ehoJLL77t9V5aqKpX2IAb6Njnd+x
	ASi/MeEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4jg-00000000oUQ-05Qy;
	Tue, 06 Oct 2026 12:57:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4jd-00000000oSt-3ScQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 12:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791291453; x=1822827453;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=+Q3Zno1VCYhLi025pNDCmJZ5SJkmktbvvlNyIe3ul58=;
  b=lz84O4qyCppGrkFMZFjTllZeRfRZIh6m7YNFBXWgYZyJKnzu4JHf8nSX
   83roldnTLhuDuq/ZnuZzPcLTD0Y0i1jgKOAgSF3vo39B92i7AkY77enFX
   WlRlhf+6PJp8NUhTIm45qpMU9Z9ZYBEGWDrDor4gpvwn4im6IobriwAXA
   WO+8nb+Xj+D1Biv1WxcwMTp1uuXKQ1opIf5kFGy8jiUwjvMHmy8Rl3gR8
   CYX5BTALC1hmGu271DDXGuW+31WQoZ96yg6pBAYs4GOdf0hbskwuV6J0A
   4i1hMS76qL/s0TpXXg3DRyEF4OPdRzVjYrl0kO1eJhpZSGMVj/I3L4rUn
   A==;
X-CSE-ConnectionGUID: vU3/LpuqTP+rAwCQWYX82Q==
X-CSE-MsgGUID: 4W1bAGaSTt+THGjIvn7Ggg==
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="231739361"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:57:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Tue, 6 Oct 2026 05:57:32 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 6 Oct 2026 05:57:28 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Tue, 6 Oct 2026 14:56:37 +0200
Subject: [PATCH v9 5/5] ARM: configs: at91_dt_defconfig: enable GFX2D
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261006-cpitchen-mainline_gfx2d-v9-5-74bd3df2e183@microchip.com>
References: <20261006-cpitchen-mainline_gfx2d-v9-0-74bd3df2e183@microchip.com>
In-Reply-To: <20261006-cpitchen-mainline_gfx2d-v9-0-74bd3df2e183@microchip.com>
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
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9aRD4p2EQ+sn1r1z5g9e2HVkWmaHibf3uiu/Xxh1c+fl
 1xVVGad7yhlYRDjYpAVU2Q59GZrb+bxV4/tXolKwcxhZQIZwsDFKQATyZ3AyPBq9+L8nXeXVrzN
 fC749XS0u6FP13SWw3VMFc4H9U73tNUyMvyMOL/z3qJFljFOvlNVyqpcnt7XSbATebfWt2mqAM+
 iUk4A
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_055734_266812_CBEB6D30 
X-CRM114-Status: UNSURE (   8.75  )
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


