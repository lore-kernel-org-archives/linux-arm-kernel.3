Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3952FD13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 10:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tjf17nGxadGEosYCdQe1mRaeFLEYOHfj3xwJxxS9C4Y=; b=uh+sfPUH2NA+ChvDlUSAi5GXlD
	3vKMFuwkoNojst0DIaAYuksLIesGVYqrnac4n7Q/u9FSoLjNPeKLflI34Wi2jjUk2P8KdLYGijtAJ
	wtmhTj14kB7VbrnAhVJ3+aIcHkrzae2RP/6rrALt+VX3iXoLcL8atv2tQ6DcZ8Uc8h/Ii/n8lAph1
	VEzBoLZJMvY9qr1jCFav2cpMgIfHB5XzCETWPEVe2paCYVgb46uIVpFmOhm0CC7KGZl4K6TrYw37v
	NOvdml27bqfJQesp+VY7Ji6xNSJcPTYRD6xvkYpvcG1uMiaMTuKZPBzp2jMnfHtnqmlEjqcFrZVkc
	nxoSrUrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MyZ-0000000AOti-3NYm;
	Mon, 28 Oct 2024 10:27:55 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Mwu-0000000AOMv-06CC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 10:26:13 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso578201166b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730111170; x=1730715970; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tjf17nGxadGEosYCdQe1mRaeFLEYOHfj3xwJxxS9C4Y=;
        b=NE9C+ejDXEFiJMGIcIzQB0r6eos3uo6ygO+uHcIS6oMIK7nkbgrmoaIHsVWTdZgNOX
         6+wmItuHdQZvnN9L2j1NpfWvmM4O1BXwwMcHCmIZhn15PoN8FbOt/WNjqj+vkaEQiHvX
         5x/cmeOcjmbOGA06X6NzQo/SpzXkuT4NqjfWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111170; x=1730715970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tjf17nGxadGEosYCdQe1mRaeFLEYOHfj3xwJxxS9C4Y=;
        b=KkmHu0d3In5B3Ss0OkZmSBzpzFiBLS4CI/LGpQ0J3bNbgiLV+g47nwhHUd1+t700rn
         /26/GXXj+Gpow5LXmZfdtzm5cEcEjIFjtkz8K/8sxeIkVOcjxy1wtdbSAc1AXsMM7OUX
         3Y5alt7geSJd9GqxeoqjUu94E6fKeVoM3yv9kKYh3e21c0jBqINXC6OYipHEGVKJ6yjU
         pc/oDID5mUgpIXyDGSPxQFlmjkb4pZ7ppYaM6lJtrTFl8LF7/rGKAUIwSzB1nGMrbNbx
         cYM5ZTdIwBo5BeJCtRor0ettJwIK+OsfY8U7R75lR1kdcwUCv13sh72u2+6+d6t45q3H
         tVNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR4dcZCSp6/udtvqX42jra81FyILYW30wxc1kyIJJtIeNepU/ErZwlO3cpe689adk8vZyGeU2QCfhkiLAyhsgg@lists.infradead.org
X-Gm-Message-State: AOJu0YwJa0hHjkYJbVoPnUFoHzmD/TVnq3t4dPCUimDI/M6TK/av/aWj
	fv6NNek8FVuYCOwBwuYqr9nj4zly34/yCxTWOkXYQu3/6pKKTFYQpn78Uz+yzAM=
X-Google-Smtp-Source: AGHT+IH1B0ko3VIpWkPI4RC1oi+MD1rEEYyYDNnVuUIYAatTCka4T6be6wD1IPac0B/RcE+iH3t9Yg==
X-Received: by 2002:a17:907:3f23:b0:a8a:8d81:97ac with SMTP id a640c23a62f3a-a9de5c9f5f9mr669847666b.4.1730111169568;
        Mon, 28 Oct 2024 03:26:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f297b04sm363613966b.134.2024.10.28.03.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:26:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marek Vasut <marex@denx.de>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [RFC PATCH 00/10] Support simple-framebuffer on imx8m
Date: Mon, 28 Oct 2024 11:25:23 +0100
Message-ID: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_032612_098296_878630AB 
X-CRM114-Status: GOOD (  14.96  )
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

This series is the Linux counterpart of what was sent to U-Boot [1]
for the support of the simple-framebuffer for the BSH SMM S2Pro board.

The need to avoid re-initializing the hardware (power domains,
controllers, bridges, display panels) that has already been initialized
and kept powered on by the bootloader has required updating more than
one YAML file, with the addition of boolean properties to inform the
driver that the corresponding hardware has been initialized and left
on by the bootloader. All these properties are added on the fly by the
bootloader to the various relevant nodes.

Support for the simple framebuffer for the dts of imx8mn-bsh-smm-s2/pro
board has been sent with a separate patch from this series [2].

[1] https://lore.kernel.org/all/20240913095622.72377-18-dario.binacchi@amarulasolutions.com/T/
[2] https://lore.kernel.org/imx/20241024102800.3481574-1-dario.binacchi@amarulasolutions.com/T/


Dario Binacchi (10):
  dt-bindings: soc: imx-blk-ctrl: add 'fsl,power-domains-boot-on'
    property
  pmdomain: imx8m-blk-ctrl: don't turn on a power domain already on
  dt-bindings: power: gpcv2: add 'fsl,boot-on' property
  pmdomain: imx: gpcv2: don't turn on a power domain already on
  dt-bindings: display: panel: add 'syna,boot-on' property
  drm/panel: synaptics-r63353: don't re-activate the panel if already
    setup
  dt-bindings: bridge: samsung-dsim: add 'samsung,boot-on' property
  drm: bridge: samsung-dsim: don't re-activate the bridge if already
    setup
  dt-bindings: lcdif: add 'fsl,boot-on' property
  drm/mxsfb: stop controller and drain FIFOs if already initialized

 .../display/bridge/samsung,mipi-dsim.yaml     |  5 ++
 .../bindings/display/fsl,lcdif.yaml           |  5 ++
 .../display/panel/synaptics,r63353.yaml       |  5 ++
 .../bindings/power/fsl,imx-gpcv2.yaml         |  6 +++
 .../soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml     |  9 ++++
 drivers/gpu/drm/bridge/samsung-dsim.c         | 13 ++++-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  3 ++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h             |  1 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             | 14 ++++-
 .../gpu/drm/panel/panel-synaptics-r63353.c    | 10 +++-
 drivers/pmdomain/imx/gpcv2.c                  | 32 +++++++++++-
 drivers/pmdomain/imx/imx8m-blk-ctrl.c         | 51 ++++++++++++++++++-
 12 files changed, 148 insertions(+), 6 deletions(-)

-- 
2.43.0


