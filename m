Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09014C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5onGhGKKEfsf2k5TF9MlXDxHozXopiDzBdinAngTivM=; b=VrpACxcW93JWdOsqjxLXWV+30f
	iGYybgvtQMr94Eq7S1nKNfCiaFuQ0ficGcQGQxI+OOJyScBC69+OcyE3psbzshmhnDea1wpogkS8B
	rlnsnuhMsY1AKIeD76rwou5g3xUkhHXRlO5QXltvDG0WLPSVDRUFiQLZC71WNLtHZCuEmrhkjPxJe
	Y5FKPQYpdiW0XmSXvQXxK1nhSvmtcNU+6Ga0+JIejII4qufG2sBB7q/obm3KaDPSUP2zk6TTkskZp
	zwMN5zsmC2rIiIOhsoB08ZHRhBbzGFBjHwz8zTaIf+kt1zrmzj/diwFZHkSIq0A2xjmD3Br7QhwMl
	7hRAiEWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ89X-00000002NUE-1VwL;
	Sat, 18 Jan 2025 12:42:15 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ88G-00000002N6b-0oLt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:40:57 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d982de9547so5901244a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 04:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204054; x=1737808854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5onGhGKKEfsf2k5TF9MlXDxHozXopiDzBdinAngTivM=;
        b=o+3NrPtShU/4tLiGEkSEiHKwNWWmhZGgG/EOFNOB5FEPAe6IYvoi3jy/ts3jgqtf05
         hFavPPlP5bvShEse6yoTOStqeY2XH5qG9MW44j1xqZC8UxFsdmU3EwhWc90ULmc8Xq2/
         d4Hp3al3liDLLnc0o17cXWeu5Ff8e+YLRXRX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204054; x=1737808854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5onGhGKKEfsf2k5TF9MlXDxHozXopiDzBdinAngTivM=;
        b=G9UQwEBBNdfrgJoqavDvZ0KB76JXgvPPD52OcXUOH04UaPJfO1cJdul6SaUQsJOgB0
         D/lyhK+3sRIdVIgTk5f3SWJjH+/THWoMAWQ7Zsr786hd+g10yr2Gms1T9ydRC4zuU4mc
         R+0dmI42IOZyI80rhGLyiafqmIRto8i+ZX5xjcx+doavZqmoJTRqtLuAOJ3DAf72Lz9H
         JBdLwlSS/Iy7JYAaVfy++usZ/IvI+kc5Muh/A+zgRyRuv+sq2cAuksLeOi9KX70WAsBh
         F+kchNWvqajW2z+EjZoyVx8E8UAjpzn48wDdAJ84wepvH7JMgXTz2utGqyFDEH3JH7xD
         WQiw==
X-Forwarded-Encrypted: i=1; AJvYcCVJTO+uVLYOWUr5FIJTANjqMSf81ESTqbB7W4aZkP61fPfm+x1mfvdsuYlO8zjXXjrqJrIncC3YZw++rEJQoGFf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9Rc6S2rpG8HHvdF5butM1MIF0rAtF871QZjABtmcjb1gROpxe
	Z9DrnVTQFTHW1xK95NWOqUywqBzd/6mDsYGSVJwWIx0rKDXNWzHcNeasv9wAB1Y=
X-Gm-Gg: ASbGncvst5L/jp9WXnxpMFAywt5XlnlaHciw0xugvDGE3ZKydDPbZ4dA1qJBevTtDjH
	LrRyJazZAvHxy7Wd7x8/I/OMwontw3PZpgnySf6g4h8HTMr4yazjtjRQuLbzLrwuEYh0NeT+PHk
	8thafxvafIN5DhajMZ0y+NtkXX0pSgdmgMz6DSmeENPBP4zZ0AqlrQTi/oESHgP0IimYJIt93B2
	4OaMNTnS8xIBmx9euDkPA7vcnsxT5uRPNjflQkv+fRfo0LOMQ2z4WpsuhBnOIKqD0wFBZhkM4uW
	TA0GcNAFtYCQWIV2Vdm/B4BjgDKdMtrbUdyJyogFaYFOPWgys5aEjbJEWiZjlXCZa7n95W5phim
	L7OqIPb9Bii11Q8O1UEZte29mLmRA4aT7yZU4
X-Google-Smtp-Source: AGHT+IEjybvZ0WW6CYRPWu4SGI7kaRbjpSjgRz2MqsdM529mQnQ12ESTPBLo6wSjpHehJu8b/HKv+A==
X-Received: by 2002:a17:907:3f97:b0:aa6:82e8:e89b with SMTP id a640c23a62f3a-ab38b166589mr512324966b.28.1737204054044;
        Sat, 18 Jan 2025 04:40:54 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:40:53 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v9 00/23] Support spread spectrum clocking for i.MX8M PLLs
Date: Sat, 18 Jan 2025 13:39:43 +0100
Message-ID: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_044056_254230_078CDD8F 
X-CRM114-Status: GOOD (  16.85  )
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

The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
PLLs (audio, video and DRAM). It has been tested for the video PLL on
boards using i.MX8MN and i.MX8MP.

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
- Fix building warning raised by the kernel test robot for patch
  v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
- Add patches for imx8m{m,p} platforms:
  - 23/23 clk: imx8mm: support spread spectrum clock generation
  - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
  - 21/23 clk: imx8mp: support spread spectrum clock generation
  - 20/23 clk: imx8mp: rename ccm_base to base
  - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
- Drop the patches added in version 7:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
- Add and manage fsl,anatop property as phandle to the anatop node with
  the new patches:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (23):
  dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
  clk: imx8mm: rename video_pll1 to video_pll
  dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
  clk: imx8mp: rename video_pll1 to video_pll
  dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
  arm64: dts: imx8mm: add anatop clocks
  arm64: dts: imx8mn: add anatop clocks
  arm64: dts: imx8mp: add anatop clocks
  arm64: dts: imx8mq: add anatop clocks
  clk: imx: add hw API imx_anatop_get_clk_hw
  clk: imx: add support for i.MX8MN anatop clock driver
  dt-bindings: clock: imx8m-clock: add PLLs
  arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
  arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
  arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
  dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  clk: imx: pll14xx: support spread spectrum clock generation
  clk: imx8mn: support spread spectrum clock generation
  clk: imx: add support for i.MX8MP anatop clock driver
  clk: imx8mp: rename ccm_base to base
  clk: imx8mp: support spread spectrum clock generation
  clk: imx: add support for i.MX8MM anatop clock driver
  clk: imx8mm: support spread spectrum clock generation

 .../bindings/clock/fsl,imx8m-anatop.yaml      |  53 +-
 .../bindings/clock/imx8m-clock.yaml           |  74 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   2 +
 drivers/clk/imx/Makefile                      |   6 +-
 drivers/clk/imx/clk-imx8mm-anatop.c           | 287 ++++++++
 drivers/clk/imx/clk-imx8mm.c                  | 275 ++++---
 drivers/clk/imx/clk-imx8mn-anatop.c           | 283 ++++++++
 drivers/clk/imx/clk-imx8mn.c                  | 196 +++--
 drivers/clk/imx/clk-imx8mp-anatop.c           | 305 ++++++++
 drivers/clk/imx/clk-imx8mp.c                  | 684 +++++++++---------
 drivers/clk/imx/clk-pll14xx.c                 | 134 ++++
 drivers/clk/imx/clk.c                         |  15 +
 drivers/clk/imx/clk.h                         |  18 +
 include/dt-bindings/clock/imx8mm-clock.h      |  76 +-
 include/dt-bindings/clock/imx8mn-clock.h      |  64 ++
 include/dt-bindings/clock/imx8mp-clock.h      |  80 +-
 19 files changed, 1975 insertions(+), 610 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mm-anatop.c
 create mode 100644 drivers/clk/imx/clk-imx8mn-anatop.c
 create mode 100644 drivers/clk/imx/clk-imx8mp-anatop.c

-- 
2.43.0


