Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029DEC9EC6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfSuhfTTjfrgbpjKtMUwVk4vgDTTQ6DN1hEyfT3Ju1M=; b=lypdFktnI1n8EpNiuQ2TSAQ5Kx
	tAEmyEGWLmUtu/urkR7uwJkJlFdeTsjTIDGEUDR4RQdFsiHDppiile22p8GRS3dcb5++3EcUzx8rh
	eEHEzcOPJ5HfKn+rTPIawuLKJpzQ7cqNmjKd3F3wnNYpC3SSYzNxakf7Mkc4Bu8taGl+yWoFXfUWb
	AX3UtKC2YBp4Kkm1h39FdOauqvX6eSMREU8Wm7GATECYRZJ9PCisKqufbf9X3svfbt2tdLUkZaJX6
	8rYhiem54+3ust39gVa/jBVr2iVpy1qQKugDjjVD7F7WAPQd6LtqgdsNgadA9Bd+1/7jfCUF4WFaP
	Z5VHcJ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFxk-00000005Ed0-2IC9;
	Mon, 12 Jan 2026 11:19:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFxe-00000005EYj-1Fyv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 11:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768216790; x=1799752790;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=0szjEvMiEGlcssl+EUr72h1PstkrFcFYIOp9mvH/YK0=;
  b=vJyuKxELiOBXAImy7PV/EohqMVNPI9VuKAoCqm4dH5MSSH1PZtLPLOUn
   MUbW8mbW0hFNB85Ykz6qkvasvsyzGryhf918GL59t7VzTvrO9IqTNK7GK
   iSnRy1cHRlcEDz+xvcAhLZFiYqZjPRuS30029t4+GGoVJk917wYVvgKEQ
   SaEQu3g/hpgeVdDXeMNrWZ4V4n7Yj3pE4/lsT/O7SgArqxXI3oyCRya2s
   yO2PV+HHUJ+YdqjEzP5uBK3QbXg0z0CNygkupK6DZIAZbzm90/Y86hZlY
   VUgTlFeKXOw54O0LK1mIq4IbE9fv6kwz22jVZjwFG2EO8ck32YPHvRJFe
   w==;
X-CSE-ConnectionGUID: 2FQW9J3NQsejMtiFniwPwQ==
X-CSE-MsgGUID: y6IdOM5VT9mC8QxaizR6YA==
X-IronPort-AV: E=Sophos;i="6.21,219,1763449200"; 
   d="scan'208";a="58675296"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Jan 2026 04:19:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 12 Jan 2026 04:19:16 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 12 Jan 2026 04:19:13 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Mon, 12 Jan 2026 12:18:00 +0100
Subject: [PATCH v4 5/5] ARM: configs: at91_dt_defconfig: enable GFX2D
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260112-cpitchen-mainline_gfx2d-v4-5-f210041ad343@microchip.com>
References: <20260112-cpitchen-mainline_gfx2d-v4-0-f210041ad343@microchip.com>
In-Reply-To: <20260112-cpitchen-mainline_gfx2d-v4-0-f210041ad343@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=751;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=0szjEvMiEGlcssl+EUr72h1PstkrFcFYIOp9mvH/YK0=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ2bKjXlREXbtn7X37WCVPdf4XFlqT5GVzbu8guUC2QXfL
 Czzn8V0lLIwiHExyIopshx6s7U38/irx3avRKVg5rAygQxh4OIUgIms2snIMFNEhsHWahZb1N4P
 Cya43BHQW79it9Z6/6DwZXOE5klcDWf4Z1y8ZvNRjXfL5ok12B8wMvm5smmywX7btYeedL6atZ3
 vKxMA
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_031950_387531_5F62B6F3 
X-CRM114-Status: UNSURE (   9.70  )
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

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index 4f1153098b16f4a93ff21f05ec73cc569f4ebe64..b38fb185670c05e74e09f6341128be5908c86451 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -144,6 +144,7 @@ CONFIG_VIDEO_OV2640=m
 CONFIG_VIDEO_OV7740=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
+CONFIG_DRM_MICROCHIP_GFX2D=y
 CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y

-- 
2.51.0


