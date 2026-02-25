Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F5EEFD20F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lqh13fNOOvLx5mrC/5lDa2bZKs7ll94a92KwYMHlTt8=; b=gUw8RB0zNuhjk40XgmHyMyezue
	DMqJDkCOzU8gRt8Sn0lZs66798CRzRPl5GvljRv3D1Wwmls42ld7XOVrzeLFkbPbttuLTxhj7l3qg
	fIIhrX/HU04FYVXi1Zy13/FOgNAyBIb2gxsKvvrmCbaosYhnilnu14daS6WaWG9g5bKYYdV/oyM/H
	14d8xRSH1JnuhOwGmtRf/Yd/kgio5GlHRTMeBeYz9zESK7AwJjp2DkKTrMGd5YjT4X7u6BYIMkrQA
	9iupkzcm8xEitLO3viVe3xI8Bh37tKO1uTOSHGIIIX9ea3GNFZj1B8m/pjRC1yBoVwXHnhySIRqsk
	431e8QYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAhf-00000003bHT-3Kpt;
	Wed, 25 Feb 2026 08:57:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAhf-00000003bGQ-0ly3
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Feb 2026 08:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Lqh13fNOOvLx5mrC/5lDa2bZKs7ll94a92KwYMHlTt8=; b=ifH8OL2UpGlE8t9YlafttVDk+n
	ktBPOb6w2jHg59jlBWC2s8DspRWyfl0CPKTjh+AqhNDdxNNmX0mZF3mfmGCe9Esz7QTUpe2Kabec7
	EvSSVHKNJzdDyvlnby0qsEkoIg7VQh1tk4gBDBiJxZprv9MSYVla+INIFHmNct55XFR//K6gR7UAG
	/X0hrgufuEZbqfFVNiZ+LO31Q7wNBg6graZRFftye0tSHU65r1z3T/1m1HcSVPGqmxPMjdQFIPiPu
	+ERqifYgjPKuG84LDo2aIjUPdlfLN5iuypWsBNfK5zxT/QdA8zTJCUGfwO4vYWJPrRMzExhJOdbX9
	ctxHBWew==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAhb-00000008bub-2LL6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 08:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772009823; x=1803545823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nr1GVPhNzWyCMqdmEJR4rllZGATf5oJ49z3JgWx6CNg=;
  b=RxxQ+ZBKUEQP1/62csxsjXijdBavFs/+Yr2riDNVCcuYT3kAyrBofMhh
   NgrvEitrrN0h93RB3V+WfwKg33U9dGMAX0TRrE2V1dfO03kpvqhqiIZYF
   ZPA/uj5KQ0u4TgJDe9YeSZLQ1SIldssGWFMp4HkEAvyKHOul/cXc4M1pW
   xKTMburhEVnmOppbYvELyToUL93+weVoi8o+kRQbhYI96u+Y6of4sS2mF
   lOyJy8ZnAVlnOC3zin6DTf5qE5hV8pvVEd74quaTRjQDxOgioQUSGbOrX
   2wtw6alY0n+Qu+HQU3L+V5ol7gehkjKJaqWj7FLFNqb86cx9hK19KDYX4
   g==;
X-CSE-ConnectionGUID: oTFg5017SyWNf5KTd3fI5A==
X-CSE-MsgGUID: UQtxzmePRqWAEgeer5mqtg==
X-IronPort-AV: E=Sophos;i="6.21,310,1763449200"; 
   d="scan'208";a="53830079"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 01:57:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 25 Feb 2026 01:56:20 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 25 Feb 2026 01:56:11 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
	<rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
	<jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <ebiggers@google.com>, <martin.petersen@oracle.com>,
	<ardb@kernel.org>, <tytso@mit.edu>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: Ryan Wanner <Ryan.Wanner@microchip.com>, Manikandan Muralidharan
	<manikandan.m@microchip.com>
Subject: [PATCH 4/6] ARM: configs: at91: sama7: enable DRM hlcdc support
Date: Wed, 25 Feb 2026 14:24:28 +0530
Message-ID: <20260225085430.480052-5-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260225085430.480052-1-manikandan.m@microchip.com>
References: <20260225085430.480052-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_085704_074889_26ED3E8F 
X-CRM114-Status: UNSURE (   8.26  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add configs for DRM Atmel LCD Controller, Backlight and Simple Panel

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/configs/sama7_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index e2ad9a05566f..c0671318bac4 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -133,6 +133,7 @@ CONFIG_GENERIC_ADC_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_SAMA5D4_WATCHDOG=y
 CONFIG_MFD_ATMEL_FLEXCOM=y
+CONFIG_MFD_ATMEL_HLCDC=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_MCP16502=y
@@ -147,6 +148,11 @@ CONFIG_VIDEO_MICROCHIP_CSI2DC=y
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_IMX274=m
 CONFIG_VIDEO_OV5647=m
+CONFIG_DRM=y
+CONFIG_DRM_ATMEL_HLCDC=y
+CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_PWM=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
@@ -197,6 +203,7 @@ CONFIG_AT91_SAMA5D2_ADC=y
 CONFIG_PAC1934=m
 CONFIG_PWM=y
 CONFIG_PWM_ATMEL=y
+CONFIG_PWM_ATMEL_HLCDC_PWM=y
 CONFIG_MCHP_EIC=y
 CONFIG_RESET_CONTROLLER=y
 CONFIG_NVMEM_MICROCHIP_OTPC=y
-- 
2.25.1


