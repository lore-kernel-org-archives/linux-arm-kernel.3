Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6029D44D43
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 10:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dp4kUR3hUNy8TtNgghsqBjXPOg+MIWfra1c2GYmA4sc=; b=deE37z/0njn6HI6F7qY8eDRZuJ
	N4JbDUsuD1UzgL6YoDIDkYz36bXdt4r4Bj/vuVz1853wXgJTWShsytOZVcwooekRwcj1fHjwaGq0e
	8bPN1IiW2/AP9h5T5SWkxl+LfV+W+RSa93G5ZUP1oPHO5o61BjeW5yS8ockW3Au/DpyvMmFdGLkj2
	g2iHf6RJb3Sb/gLsJpL1Yss8nMjluFUjpmz3w8Tir8/atcWr8kOtz7WG4cvQNtHgzToJSTAu5yy5l
	qwxsdxkAhmn93PbCnVvswjPZax0eeEMQa0PwEFdd0TA2rSmSaS/fRJKOXu1VLSOe9S15cxBe3zY7O
	ohRTJAcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8d7K-00000002idW-1PlP;
	Wed, 06 Nov 2024 10:18:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cRr-00000002YxA-2LUs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730885736; x=1762421736;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zRwVKxY/ljPw+PWBx03TIerZJoDRcw2Ws1V9+SjbY18=;
  b=jwcHrydEC6zky2yDLg5qfzEMEVpgqCt2Mg3aXpqPYBXjLI0dIIDT+2X5
   f98s8nagN4PYRn8+NbG4ouwKJzi6ky1tXgyu2fvzUgz8t0Nu9VjiwBqiD
   bKPL+tHlNs0y4MSl/nKnFkgIpuWuucyVK6vBTUVn863pQdPsK0yzIg7Bd
   wTx7sEg9oZYnz/aiPRKtIn0eCG24PtdKtxLhQ2waospc+WOjk9tcaFDzB
   0r8L5gOyG45wz4UBboGGcP5ARe0ERJE0imI3yNYLlch2sA8CNY/hZP4UE
   vTygJiUh82wkZsqqYiMIbLx8dTvJF7370vBwdG5nUAz0ys/D/hJv74P6d
   w==;
X-CSE-ConnectionGUID: 0kVQr9qhRguhY/PD4s+80w==
X-CSE-MsgGUID: 0myGpt/KRoWHTHzzZOyhBQ==
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="33940994"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Nov 2024 02:35:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Nov 2024 02:34:53 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 6 Nov 2024 02:34:44 -0700
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
Subject: [PATCH v5 0/4] MIPI DSI Controller support for SAM9X75 series
Date: Wed, 6 Nov 2024 15:04:25 +0530
Message-ID: <20241106093429.157131-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_013535_746386_975CD258 
X-CRM114-Status: GOOD (  10.61  )
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

This patch series adds support for the Microchip's MIPI DSI Controller
wrapper driver that uses the Synopsys DesignWare MIPI DSI host controller
bridge for SAM9X75 SoC series.

Changelogs are available in respective patches.

Manikandan Muralidharan (4):
  dt-bindings: display: bridge: add sam9x75-mipi-dsi binding
  drm/bridge: add Microchip DSI controller support for sam9x7 SoC series
  MAINTAINERS: add SAM9X7 SoC's Microchip's MIPI DSI host wrapper driver
  ARM: configs: at91: Enable Microchip's MIPI DSI Host Controller
    support

 .../bridge/microchip,sam9x75-mipi-dsi.yaml    | 109 ++++
 MAINTAINERS                                   |   7 +
 arch/arm/configs/at91_dt_defconfig            |   1 +
 drivers/gpu/drm/bridge/Kconfig                |   8 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c     | 545 ++++++++++++++++++
 6 files changed, 671 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-mipi-dsi.yaml
 create mode 100644 drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c

-- 
2.25.1


