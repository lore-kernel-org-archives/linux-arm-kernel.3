Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C4CC1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q26ojWAAylCPuoMLGOHqBQ6+h3mcIEfd6MruX8qYHg8=; b=OsSjdoSSR5USHyjjVNo1dQSiAT
	HhWnFBRwIin0HdYPwO7aUFQd5ebWOOeLGNEhO56Lq50TpBnQMlqTcfQJOBMEbL+9iS318lqlKNqTk
	KMgoOAAg6aKU3XQyNW+HE50fi2BvkQ84LtmmdSufwLfAtk9Oqm2+Bmo8OM7uxJvscOHIsaYg/BPIW
	bjgTe6VqRL3ng5lYXtjmdHLKUGtQQxKd7Oy7wCr8NhQM7bDHFP+YWBeRtUCuYSEVVq9v5rT+YZAXO
	nOkTF0KrenIRaRTEl2VBSVmcdSAnKeQ2VUdPS0O01Ba4lnxOawuZtwgkEAN+yAxxqawphupIXBqR5
	6pllN89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjg-00000008YlJ-2wCb;
	Thu, 27 Feb 2025 19:39:56 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhFj-000000089kK-07sb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:00:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9974B10382D2E;
	Thu, 27 Feb 2025 18:00:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740675642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q26ojWAAylCPuoMLGOHqBQ6+h3mcIEfd6MruX8qYHg8=;
	b=Dht51g+xd3YUY6OVzoH5ZCFVhCw3MS+2/ORkxydauJ/ck/5yRSevkr9YFqUk15eukCUmbv
	si/5W/ge65fTX5WEEO+9fZRC2jeqRgKcdfzKlmKMuoQYPWPG9pYAZJE1p93/SCGJw6ZhxS
	1ho2vAvjHs+B8EBSO1g8fNTXTddD1hJ1NMAHcT5+v5pnqlJJOuTdkFKH8L8oEZ7yzF1ywz
	qruceRJRP76YaxDiqZiVr7c8tH46YWtCDsUKQ5WCz+T1tKzsq2qAO3LIqxPg/ooGYRlnNK
	MDCYKLuiUBUYh7bDp82KYc4sbMrFNib7Wb4TOiL8iB7GF+AhRIZoK7w4yqWstA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH 0/9] arm64: dts: imx95: Add support for Mali G310 GPU
Date: Thu, 27 Feb 2025 17:58:00 +0100
Message-ID: <20250227170012.124768-1-marex@denx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_090051_211072_3287DB19 
X-CRM114-Status: GOOD (  10.90  )
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

The instance of the GPU populated in i.MX95 is the G310.
Add support for the GPUMIX reset via simple-reset driver,
add reset and multiple power domains support into panthor
GPU driver, add iMX95 GPU support into panthor driver and
describe the iMX95 GPU in imx95.dtsi DT.

Marek Vasut (9):
  dt-bindings: reset: imx95-gpu-blk-ctrl: Document Freescale i.MX95 GPU
    reset
  reset: simple: Add support for Freescale i.MX95 GPU reset
  dt-bindings: gpu: mali-valhall-csf: Document optional reset
  drm/panthor: Implement optional reset
  drm/panthor: Implement support for multiple power domains
  drm/panthor: Reset GPU after L2 cache power off
  dt-bindings: gpu: mali-valhall-csf: Document i.MX95 support
  drm/panthor: Add i.MX95 support
  arm64: dts: imx95: Describe Mali G310 GPU

 .../bindings/gpu/arm,mali-valhall-csf.yaml    |  4 +
 .../reset/fsl,imx95-gpu-blk-ctrl.yaml         | 49 ++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 62 +++++++++++++++
 drivers/gpu/drm/panthor/Kconfig               |  1 +
 drivers/gpu/drm/panthor/panthor_device.c      | 79 +++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_device.h      |  8 ++
 drivers/gpu/drm/panthor/panthor_drv.c         |  1 +
 drivers/gpu/drm/panthor/panthor_gpu.c         | 12 +--
 drivers/reset/reset-simple.c                  |  8 ++
 9 files changed, 219 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml

---
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org

-- 
2.47.2


