Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F8EFEA830
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 07:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fzYr866Y+nhDeVzwxBplwIhb3zjPYVx7VrTJzl9KpOQ=; b=fHniTtimwv10NVzz6x0O6HmPTZ
	Hb3xPeXdMqc6MVSsPOg8wvxeHzdKJuhCepdIg2Rw/qS2o4Qp3QPpI0g8QErRSOE3ECQh6hG+BVKBM
	K1Pa/rlI8Gt49R10KbAFC1pur5onlUjc1186n9v5Ydjx48a7UnB2hgsee6Zq5oowFFKezPMPKKa+7
	2w32PERoRO0rvbnAdbTwMHxjAieZB1HPTi7YzoicuBqx/ZfWfdTR1UpPCjsfz3+0AnAfu0ZNOYcwv
	uOFkLOE9/6nXTSymVacp2C2IZynt9R2tHdlcKzgl0X+LOS6z6n7PaZKroqLWe6J/4iEQ+mmoWghDF
	4H3CHEmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8F-00000002syV-2Cqd;
	Wed, 25 Mar 2026 07:58:27 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8C-00000002sxd-34yt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 07:58:26 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a8fba3f769so29198155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 00:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774425504; x=1775030304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fzYr866Y+nhDeVzwxBplwIhb3zjPYVx7VrTJzl9KpOQ=;
        b=OYKaTvpTbJbN8WOEzmTQ6ibvPMMJ2tg1Kh9FCfHsEh2Mp3CSn4f+rDX5gAPQkT+Sa5
         40AnKKdyZ5Vkl3eThg40mAs0am29mNZzdmHC225K0HeLTHAVyDSSkE8HlvP+5f++4flj
         +1mww75hA4OqshWXRIyGZ5qytFG5waBRTUbmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425504; x=1775030304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzYr866Y+nhDeVzwxBplwIhb3zjPYVx7VrTJzl9KpOQ=;
        b=EiMNYmn75S6b2d6uw9TIxjDIUSasY2kz0/J3lc2Vip2oYwhm5DQJ+/Rx5hoFNbeDLG
         mrz6RwELrF/IeKVqFr1kBKO1JufsKCipwdX6aBrS0J/k/dtfDpEQQXx96jtK/tFoDfpe
         l5Lz7Z9OXZ/i1ib7yRJ/tl1Te/ttt0BeiNhMaE+HfCtAvVtY5pkUPc1Fni11Z4jcsdeo
         ME7aGzPqeC1G7Q15CzguCqHhV1oV43OaRN//DuZbMOKGkeUlq+U195Cf3vvWARIg46TN
         TJ8B0aNGFUD8ng0W/c0XPz1Om06pY3xZ+w+QOY74cDYp/p4N1dCPreuQUjtbXsGwqPax
         YrVA==
X-Forwarded-Encrypted: i=1; AJvYcCXUzGnPHIHl5daWtm5tosIEzuBGLKTdRKQiIJGVISfXvslc3qWARSz+zyOCQ/d+A/XSEZ+v25FLCZpgqBHL3Joo@lists.infradead.org
X-Gm-Message-State: AOJu0YxXB7qLjBmb0QRrT7Vd9n2P8MupmiOcCZZ5WCU7faJ45A2o1dly
	/sC+EuKJFUPDvZI2Au1mrJ3LQ/fGk/9mHaUbQChWh//hw4XQDyBSmARw65JVWTOXyg==
X-Gm-Gg: ATEYQzzYvo2yZHRI9MYH1MdZfk5oi3OvkVPe1ibc1dEhqi6Kwe38wz5NxjuaHpLVPUF
	/X8YcC9vTgDwoupeGwnn+v6aoLRM1qepazvb9Bvk5KvL9N6H6sd9G2wolTyJMZxT9q5VagxhEP8
	SBaDOxv4r3JcI82LcVOk4eoPbIw/GjpvkTGhPaVwgFEj32fCvGZ3w64Lc6T7ejzuo9Tun6hVIJ/
	8ZKZWQXfG0weKL4WwYqBVnkEprIy7n72kEMHgAbm8M2aN00shqGIiS9/ctO6Bt8Jkll6luJzys8
	glBXB2bTp/8myamWHY2AWe8ikPkeSdmHzWA8uATfpO6e2FbTaq1rXWsQpGVLCG4qrxlRGxapNcr
	mwm/eVDVxwLztIa1hgWK8p9KkmKNER4YW6AR/5Uj+Q0yfUu68jRPkgwqZ+vxHQRXzV3wZkipPPJ
	chO188IzM9sJYB6z6V0lSkhxhxZRdR2p1GuMz61hsfZWGpXR3WX8qGPJpzWxHweyvNB48C39gGx
	EYhTMA=
X-Received: by 2002:a17:903:37c3:b0:2b0:5aab:c40a with SMTP id d9443c01a7336-2b0b0af4c01mr28590075ad.31.1774425503648;
        Wed, 25 Mar 2026 00:58:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7ff0:bee3:7d45:eab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm219682465ad.60.2026.03.25.00.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:58:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Icenowy Zheng <icenowy@aosc.io>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] powervr: MT8173 GPU support
Date: Wed, 25 Mar 2026 15:19:44 +0800
Message-ID: <20260325071951.544031-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_005824_834347_E126BE43 
X-CRM114-Status: GOOD (  21.86  )
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

Hi everyone,

This is v2 of my MT8173 PowerVR GPU support series.

Changes since v1:
- Adapted to changed DT bindings
- Dropped driver change
- Use same power domain for "a" and "b" GPU power domains

This update was requested by Icenowy.


This series enables the PowerVR GPU found in the MT8173 SoC, found in
some Chromebooks.

This version is different from the initial powervr driver submission [1]
in that it splits out the GPU glue layer support out of the powervr
driver and into a separate clock and power domain driver. The glue code
is otherwise the same, and also the same as found in the ChromeOS
kernels, with some extra comments and macro names added where possible.

Patch 1 adds a binding for the glue layer, called mfgtop. The glue layer
contains clock and power controls for the GPU.

Patch 2 adds a driver for the glue layer.

Patch 3 adds an entry for the MT8173 GPU and 6XT series to the PowerVR
binding.

Patch 4 adds an entry for the PowerVR 6XT series GPU to the driver.

Patch 5 corrects the clock for the GPU (called MFG) power domain.

Patch 6 adds device nodes for the GPU and glue layer to the MT8173 dtsi
file.

Patch 2 and 6 depend on patch 1 to build. I suppose some common
immutable tree would be needed from the MediaTek maintainers.

The kernel driver successfully probes the hardware and loads the
"rogue_4.40.2.51_v1.fw" firmware provided by Imagination Technologies [2].
Userspace was tested with Mesa 24.0.8 from Debian Trixie rebuilt with
the powervr vulkan driver enabled. `vulkaninfo` gives some information
about the GPU (attached at the end), but running the `triangle` example
from the Sascha Willems demos [3] with -DUSE_D2D_WSI=ON as recommended [4]
failed with:

    Can't find a display and a display mode!

Same program worked correctly on a BeaglePlay and displayed a color
gradient triangle. Not sure what went wrong here.

Anyway, please have a look and test.


Thanks
ChenYu

[1] https://lore.kernel.org/dri-devel/20220815165156.118212-2-sarah.walker@imgtec.com/
[2] https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powervr
[3] https://github.com/SaschaWillems/Vulkan
[4] https://lore.kernel.org/dri-devel/f2b2671e-5acc-4dec-9c2e-3c9cd2e1f19e@imgtec.com/

Chen-Yu Tsai (5):
  dt-bindings: clock: mediatek: Add mt8173 mfgtop
  clk: mediatek: Add mt8173-mfgtop driver
  dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
  arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
  arm64: dts: mediatek: mt8173: Add GPU device nodes

 .../clock/mediatek,mt8173-mfgtop.yaml         |  70 +++++
 .../bindings/gpu/img,powervr-rogue.yaml       |   1 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  33 ++-
 drivers/clk/mediatek/Kconfig                  |   9 +
 drivers/clk/mediatek/Makefile                 |   1 +
 drivers/clk/mediatek/clk-mt8173-mfgtop.c      | 243 ++++++++++++++++++
 include/dt-bindings/clock/mt8173-clk.h        |   7 +
 7 files changed, 363 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c

-- 
2.53.0.1018.g2bb0e51243-goog


