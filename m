Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F30E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gam048ootOPzo1BYL348MdN7mDqE4kD/okgjHVqyGrc=; b=YJu7Tcch5+WUfcxFQidGdP4E/X
	DYPTGHphxoBJ7ShzGMmEGrsntDCDekyjlRrTtmwU+qQykf2KxiLLhNT7EmwxAQxUqGJclVhWKbf36
	CMjRFrcDrqHszOLTbTIvJJ/IBAYPkDOhSGx/ivn6euWApNpLLVvpAciymTqd+r6ihBncrPYq2Voo6
	S0m8VZUbheP2ZLiFrhZI0obAVx4soFOiWNpnmrrC7MljW0Rj3lcnPOchB7swTgttVExvAAeKKA4Cf
	PJc02nTkc5mUYBYvVybxmcA+yxpb47nS/p7qFxD2GbpaoAJUtQbGrXFosoO+90wz6AGWtK/jJnnFc
	WfYSm2/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9ua-0000000Fgv6-1P7P;
	Thu, 05 Dec 2024 11:20:48 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9tY-0000000FgZx-1sMq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:19:45 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa51bf95ce1so144951566b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397582; x=1734002382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gam048ootOPzo1BYL348MdN7mDqE4kD/okgjHVqyGrc=;
        b=giDEVKgWcIKgB/tv7NMlXpzzwMDZD8nHEho22frSnt/OiuuUmHz8Gui0UM51NIcpPV
         ZYS6hXWI+SrVuWjn+ev0rUuFUWCCUNRHJtjx9e+Ay95Jtr7VPquTjvXjSb4Q2JhBYcrd
         fio3CHgxtzfGfkn0FLhbIxW1ePatNVypC+MXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397582; x=1734002382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gam048ootOPzo1BYL348MdN7mDqE4kD/okgjHVqyGrc=;
        b=KoP2vIniqgs2sT8KBUzrlDNSM24UJIFCAgN5i7+rK5tuFJjYPEEjQWIFaaDQs8jns3
         Jz/SlmGA+qizBcYGDT0Hjr+W/Myy8hQlJ5Uq6XgA2oCMdEf1o7S51rwygCEyGtwMbTFD
         HcHIwm/EtVTR1l7WLve9p2MoZORJHw2ggnyIK1LzmDSVylPez1MupyN86IbXnFpKvQet
         AR2beMSii4mp2oz0d7eR+6clyOZaKrfwwNUvIEyS0DbPnoddMKrh49w+DqvwevcttjGU
         0DWsv+99Qw5WHZTdKnHGcO/ii1nCvrFU+nlp5I/nFfUX1LjICcepVVPfqMvqRBd8CoAC
         mpkg==
X-Forwarded-Encrypted: i=1; AJvYcCXJOBfgbO35Xv1fRvGuae21nAQzMc0U/9u4SLidKLVh4Wa4Kc3rUUYZrDI++6IYANDR+3Dh3yvws4k66EnJc2dX@lists.infradead.org
X-Gm-Message-State: AOJu0YxQEgkzPMgoBy8igYorATOnf4b5p0o9emwvg+bG7sHsMzW8KbjW
	qh9zQ7/3RmioCbDdCrh2BSN60d9zuNXGPbVk4JLEZpFVAHTh3DUqmeM6DsoANcU=
X-Gm-Gg: ASbGncvqqP7FIiPFd8vRNQlwAItR9wa/wwN7A1693+iLtlaPWzTKgjC05mBK8ZQhYNu
	TRtphfh3JjXh6U/juga0hr81P+3uNUTaiK6ufOCb1g6h//oOgXneYQNV25r1oxLPD4/q+ly5ivO
	saa1klRWzoxW5qPJvr4ueFeJJzZaVIM/CThqVu9PzQn0xF8M8J98AMJ6ZzFoXPKT5Ny3iMjhpIm
	KOB2jky0sEiWxqDA79AwY+wncCJheuyjUFoPHm50mYeqHs655A8jh6VUcHlMrwUAtdgL7mLa1Tf
	CP5GZJD4W/Hw9lwJX7yKKr9RJXpNcMJ9f7svnh0WPFEXTQ==
X-Google-Smtp-Source: AGHT+IF2SWjIDsKvaimdsUq5AY8I6ysaFyU1+v+YH4Hs4Tgz8lhC8r7Xmrl2RfHy+psFeGdbn3X1oA==
X-Received: by 2002:a17:907:948b:b0:aa5:427d:b101 with SMTP id a640c23a62f3a-aa601824277mr1086282766b.36.1733397582274;
        Thu, 05 Dec 2024 03:19:42 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:41 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
Subject: [PATCH v5 00/20] Support spread spectrum clocking for i.MX8N PLLs
Date: Thu,  5 Dec 2024 12:17:35 +0100
Message-ID: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_031944_531710_1EC26268 
X-CRM114-Status: GOOD (  17.87  )
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

The series adds support for spread spectrum clocking for i.MX8MN
PLLs (audio, video and DRAM). It has been tested for the video PLL on
a board using i.MX8MN.

The patches added in version 4, such as the dt-bindings and the driver
for anatop, were inspired by the extensive email exchange from version 3:
https://lore.kernel.org/imx/20241106090549.3684963-1-dario.binacchi@amarulasolutions.com/

Version 5 adds only a few fixes to some patches, merely addressing
compilation errors and warnings raised by checkpatch, but otherwise
does not alter the structure of version 4.

The series added spectrum spread support for the imx8mn platform only,
but in case it was merged, confirming that the directives and suggestions
made by the maintainers were correctly understood and implemented, I will
extend this support to the imx8mm and imx8mp platforms as well.

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

Dario Binacchi (20):
  dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
  clk: imx8mm: rename video_pll1 to video_pll
  dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
  clk: imx8mp: rename video_pll1 to video_pll
  dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  arm64: dts: imx8mm: add anatop clocks
  arm64: dts: imx8mn: add anatop clocks
  arm64: dts: imx8mp: add anatop clocks
  arm64: dts: imx8mq: add anatop clocks
  dt-bindings: clock: imx8mm: add binding definitions for anatop
  dt-bindings: clock: imx8mn: add binding definitions for anatop
  dt-bindings: clock: imx8mp: add binding definitions for anatop
  clk: imx: add hw API imx8m_anatop_get_clk_hw
  clk: imx: add support for i.MX8MN anatop clock driver
  dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  arm64: dts: imx8mm: add PLLs to clock controller module (ccm)
  arm64: dts: imx8mn: add PLLs to clock controller module (ccm)
  arm64: dts: imx8mp: add PLLs to clock controller module (ccm)
  clk: imx: pll14xx: support spread spectrum clock generation
  clk: imx8mn: support spread spectrum clock generation

 .../bindings/clock/fsl,imx8m-anatop.yaml      |  53 +++-
 .../bindings/clock/imx8m-clock.yaml           |  77 ++++-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   2 +
 drivers/clk/imx/Makefile                      |   2 +-
 drivers/clk/imx/clk-imx8mm.c                  | 102 +++----
 drivers/clk/imx/clk-imx8mn-anatop.c           | 281 ++++++++++++++++++
 drivers/clk/imx/clk-imx8mn.c                  | 188 ++++++------
 drivers/clk/imx/clk-imx8mp.c                  | 118 ++++----
 drivers/clk/imx/clk-pll14xx.c                 | 126 ++++++++
 drivers/clk/imx/clk.c                         |  28 ++
 drivers/clk/imx/clk.h                         |  23 ++
 include/dt-bindings/clock/imx8mm-clock.h      |  78 ++++-
 include/dt-bindings/clock/imx8mn-clock.h      |  67 +++++
 include/dt-bindings/clock/imx8mp-clock.h      |  82 ++++-
 17 files changed, 1026 insertions(+), 234 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mn-anatop.c

-- 
2.43.0


