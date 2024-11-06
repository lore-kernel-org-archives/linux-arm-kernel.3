Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A868D44D42
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 10:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvyWvwlc5ClEIDefoEdOBOTcyH2LHxN3rgWjmQ01Hbs=; b=UkdjvsWXXVkKx4TVfwh8GFl7rt
	6gIohJqges17gUHM1UbJJAYtz2rJRS8eLfu1Jr0UJukZnQBhtfeROa7/IN9L+v7QhA15zWRl7KIIG
	wqxaYKysj2LIyUNZo58fxEvpnX5MKh8Bm0KhwsG1TzeC+d7ns9RUU/cxccT/Kwd23c2X1Ls2Xuvmt
	eKrB8lXnGVomLq0fH/onAKSCWvEZ2oI5r0wrqbzW/JjB92YZKQFmawsUgLG21BbOcAhe8QfdispI3
	+f6xAFNQYta4nNoJvdIQj7OIc1u3ENVjDV+WKL0Ddq1X8fnM806LoFch+gWAR3FfAZy56X40HyMT4
	nqGzwx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dCT-00000002jZ0-0guz;
	Wed, 06 Nov 2024 10:23:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cRt-00000002YxE-1M4s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730885738; x=1762421738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sfhNgfxD/3Djavd5D660Vk0CxS/6EFO0/1T8Wa3ccko=;
  b=dngBIfmd2WLnhFARYxLHJt0kpX/5xivHZRNIhvhkSYL6Vq6Q2+fJ+Y5n
   AbkQgs+neZ3sEtGkMNyBvT8fgU2fp0Wdj9G43UcAzPXpFFosJA/NFE6wH
   P0vg84wZQZJKE7zo0CG9WFL4i6XLUTEwhs+Px6NbDqIqYdTwU4i6ve2aB
   oqZGyoR6oV5vU66CtIKAmsuFSpmpEQFC9PoVN/ZL68EIAxpLViMeqjvzy
   Fxp8ykMKYH+2j6l9Qd2zpDJrzrYlKJRc12cIm3j1LtovAWBUFm2pVTMnW
   zGrcK0ufW99O5non0LceNdVJkyL5P9sf8ONP5957iJmCUKYdswg+huxEz
   A==;
X-CSE-ConnectionGUID: GdrssbasS4SjtXCG3mVUjg==
X-CSE-MsgGUID: nRT8SzJJQGymEi6NCk+q8Q==
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="33940998"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Nov 2024 02:35:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Nov 2024 02:35:31 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 6 Nov 2024 02:35:21 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
	<rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
	<jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux@armlinux.org.uk>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<dharma.b@microchip.com>, <arnd@arndb.de>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v5 4/4] ARM: configs: at91: Enable Microchip's MIPI DSI Host Controller support
Date: Wed, 6 Nov 2024 15:04:29 +0530
Message-ID: <20241106093429.157131-5-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106093429.157131-1-manikandan.m@microchip.com>
References: <20241106093429.157131-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_013537_470996_A8421F45 
X-CRM114-Status: UNSURE (   8.77  )
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

Enable the Microchip's DSI controller wrapper driver that uses
the Synopsys DesignWare MIPI DSI host controller bridge.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index 2022a7fca0f9..3ff89e27e770 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -145,6 +145,7 @@ CONFIG_VIDEO_OV7740=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
 CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
+CONFIG_DRM_MICROCHIP_DW_MIPI_DSI=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y
 CONFIG_FB_ATMEL=y
-- 
2.25.1


