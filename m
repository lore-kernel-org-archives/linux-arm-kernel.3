Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735EFEFD20F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBMamviA6QGAkoJX2HkKW/+0ADcojqDYlaqoV/5ae9E=; b=Lk8nRhyBZuX1qC8baSLUcALalJ
	r0E/GvvlK3P6bCeMMJyx6LbEcW5EkxOvn84VMGK1YL4RDxRpiMKOjWGnO56Cxg2LAYAP3FkyYfyCk
	7+VpCfaVZp0/wVNLspBRP2IXdA2xzknZU2xXZKBCWbW7oeK1SdShTER/N7/4UX2Zw+QHwf2WsATVh
	+w6YAV32E0ObEtHoBT4UC/tfFMS+IpdJBZXHY0xdw7uIoWzVDgu0jw+wOcEnVRMfml0ta9KIeFLYT
	/S2ThrtoEvFo1l4FUj5nxKkCRxze1I7kMD306iyqxr8Qc5jP/n55yjUK88whR7YplNk159s5IcwB3
	9SSDjeIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAho-00000003bO5-0cXF;
	Wed, 25 Feb 2026 08:57:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAhl-00000003bLu-1akT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 08:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772009833; x=1803545833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hETeU/hyyDiwOujFRlHAVoyIbo34onNI4Jg8OLACaz8=;
  b=jON1/RGGbfR80cYx0dM0C3GJMoEAwy5ftsSiRJxcNiRJ/tJZTkQeG9vF
   /Gia0F2PN6qq1eZAw4F6VyEwckls+HkRbVKYP9wFaqvR6GL11hwl/fWQ0
   +kL5E8f4PobMgrwBb6aDlDtB5zWktZVlfGbxv+xv2itY/MlToLwh3gSWP
   Tyd10y93X0TTz036p3VCT+UKMuWBuH734znc8H/yAkeYRnlUCIHPTj6dO
   2R2ekmxhAgRO4StnEZuVpo0ZP9yCeb/IzsQZMXw/LaScEdx3i/b013IsH
   4z6gdx//5VkoT47Yxt2BGevfn/2GqLrvQeoDFTjVYDToz57/thyvOyhnG
   g==;
X-CSE-ConnectionGUID: pcieN23YRomtc3AdpeaIbA==
X-CSE-MsgGUID: es+Ij8gcTD+YURvdwCwnPQ==
X-IronPort-AV: E=Sophos;i="6.21,310,1763449200"; 
   d="scan'208";a="61258828"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Feb 2026 01:57:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 25 Feb 2026 01:56:42 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 25 Feb 2026 01:56:31 -0700
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
CC: Aubin Constans <aubin.constans@microchip.com>, Manikandan Muralidharan
	<manikandan.m@microchip.com>
Subject: [PATCH 6/6] ARM: configs: at91: sama7: enable LVDS serializer support
Date: Wed, 25 Feb 2026 14:24:30 +0530
Message-ID: <20260225085430.480052-7-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260225085430.480052-1-manikandan.m@microchip.com>
References: <20260225085430.480052-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_005713_429372_954A0640 
X-CRM114-Status: UNSURE (   8.91  )
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

From: Aubin Constans <aubin.constans@microchip.com>

Add config support to enable LVDS serializer

Signed-off-by: Aubin Constans <aubin.constans@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/configs/sama7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index 0f1a3abc4640..e52f671ccec4 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -152,6 +152,7 @@ CONFIG_VIDEO_IMX274=m
 CONFIG_VIDEO_OV5647=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
+CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
-- 
2.25.1


