Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C97E98E10
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ek3xJzl2gLILGX5ltmbFFthW51YW/PW8EOlusxLWJOQ=; b=o34ILfxfHKwuUJRzQfK/zfrOH4
	ChE2AiXIgs5qX+S2zFMaiDhqAutiLoexwb16zsK4d2tMe1YCiVUbkVkpvRF+CIQ1UUq4bfOjWWumM
	FbVZGcjzxL83NKLMlnVQxjwWqlhPiyaqTd9Y3KhinjQzektHzKWSg6ukQGjy9Ti4+kfpL9WkpyoLt
	Aj4pqWPpkOi7QZWU+xnQRXqiZrz3gdSOdoOeUmt6lcEO2Hh2rKc7RwJjKnXUSLZYgZxytemsG+Cm7
	OlC27QAiv+9tZ0S+U+WNzqtN9KRBBEwcxJ9iFktB6hwdKElrBXxK4WH4KtFxhSLGqw9r6zH9z0Ijd
	1irCMnxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT3I-000000002Jn-03lL;
	Mon, 23 Feb 2026 10:20:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT3F-000000002IA-2SGy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1771842029; x=1803378029;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fxh20OoRIDIJw2Z8F3GMbn8xf8EQoWg+ERVhvDDIVg8=;
  b=vkq/ZuMCjxvJiOaqYnFA5ENiZgjr33FwZsrgG/mrhSsR5MWjALH4cFKu
   jj2JtczR+vhvAnKqVfo+3cwi0va2DJq3j7ExvRPfqIEA6coo+DHD96kfq
   7AVVH6wXQNhSO6Df31wCMhC5vrhIuOmb6m2KZMTr11WgfTN6Cpdldkz6T
   2oke+r1qfsehquZlp5SbGlOLkjs3ntb0syYeCIKO6xUgP9kfkidmAUwbZ
   Eka3UaxNUhgmAv3/oqDsM3QemNtKA39kndmCE1ye/KYZs+rAG87QCsLma
   zvdjqI8MlgueBfTGq+G0/Rwv6ilOsxc3S+iEq0wDJQ+A2ORsGVdWOxLZ1
   Q==;
X-CSE-ConnectionGUID: xLxJrVz4SA+TZ2kb8t2UqQ==
X-CSE-MsgGUID: VwZNW30OScC7E8KufsFKmw==
X-IronPort-AV: E=Sophos;i="6.21,306,1763449200"; 
   d="scan'208";a="220994669"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 03:20:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 23 Feb 2026 03:19:48 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Feb 2026 03:19:43 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v3 0/4]  Add LVDS display support and PLL handling
Date: Mon, 23 Feb 2026 15:49:16 +0530
Message-ID: <20260223101920.284697-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_022029_725313_C1D1C6CA 
X-CRM114-Status: UNSURE (   9.14  )
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

Hi all,

This patch series adds LVDS display support for the Atmel HLCDC driver
and introduces ATMEL_XLCDC_CLKBYP flags and proper handling of the
LVDS PLL clock required for such panels.

The Atmel XLCDC IP supports multiple output types — Parallel RGB, MIPI
DSI, and LVDS. While the existing implementation handles RGB and MIPI
displays using the LCD generic clock (sys_clk), LVDS panels require the
dedicated LVDS PLL clock (lvds_pll_clk).Configuring the LVDS PLL clock
rate automatically based on the panel pixel clock, eliminates the need
for assigned-clock-rates entries in the device tree

Change logs are mentioned in individual patches

Dharma Balasubiramani (1):
  drm: atmel-hlcdc: configure LVDS PLL clock rate for LVDS Displays

Manikandan Muralidharan (3):
  mfd: atmel-hlcdc: fetch LVDS PLL clock for LVDS display
  drm: atmel-hlcdc: bypass clock divider for LVDS displays
  drm: atmel-hlcdc: add support for LVDS output formats

 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 139 +++++++++++++-----
 drivers/mfd/atmel-hlcdc.c                     |  13 +-
 include/linux/mfd/atmel-hlcdc.h               |   2 +
 3 files changed, 118 insertions(+), 36 deletions(-)

-- 
2.25.1


