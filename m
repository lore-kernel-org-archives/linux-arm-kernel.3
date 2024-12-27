Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9811BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 16:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=npfMp13q1tQsxXMRukSmRqEG6KBpV1Zq2CsR4oTVCfM=; b=1z/aEpF86E8kenwN+H98uY0xxX
	jh/9M/M5A0oVQ7dTaDzPwQD+c6ib8N8mMaLMzI4fzucsLnc4qV5q5TBB/8tncqAtqbpAvtz7Q8Qzp
	M1za3iT2N50fFubvNFptpbGHadUFzbf0bZP/nHLJZ+QV0DX/gDASAPqKC+dhsgjzGUulJJbQ3mvP7
	BB1CjFwEvuzqBi4SC9Uujkd0eppEb4btNVydTpkbImp8w55L5TywR1nmpNoBjjL5a9mSn0QV+aVTV
	q0FZid+fuddIH3CUmTJ4mi1cBT3gHnJIOol+SJBxpoq9kgQYjeYkljhwc6VcPSdYCINK6w2l/Dr4F
	yV9TMZSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDfa-00000000ekt-2Xex;
	Fri, 27 Dec 2024 16:58:38 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDeP-00000000eRv-13P1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:57:26 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa69077b93fso1069398766b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318643; x=1735923443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=npfMp13q1tQsxXMRukSmRqEG6KBpV1Zq2CsR4oTVCfM=;
        b=kQBrq4Nj5OYMzomkcLnp+q9qZqhfjMUf43tzxMqz2vlqMDLc/3gn381wjnEYeECwnp
         E1T7KRkENOmOn0nfvoJuzos2b3Zk+b+DFarY/GXMagSli352ErqlSvfLR68trLvAufHh
         NILTQFUojDfGdzR2ny4KC2X7BkskvJmz/lHRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318643; x=1735923443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=npfMp13q1tQsxXMRukSmRqEG6KBpV1Zq2CsR4oTVCfM=;
        b=JpLsrlERKX3zb/24bASp/8zR8thJHgxpf5u8/l5+QgtBOsVvl+Zot1SXcx6FkIp+jG
         CxdXc2zeurtENTcBWgd9/KzyuHPw+U7tcYIx4LxFG0Z/fNfBfdohmo9rKF6ePNUfvAPF
         pbeKSbh6LWP3WKN9xICh5AwuhD/CqSSZGatVALBbeNvSF0XdD5oFbMRC/wscetg94yzf
         GkSpcaVgGeJUf8PCTuQooHmZrnzgPtujMLFaV0ZlJaeyXgXrEU253VRAFc2FtbSKqnOn
         N/JGzRTQ/ACMJJS/oxnD4G7WvOoSSFJGD1fu3G4Yhrkgq91ViILCDdH5y6v6kfXpYC2U
         Z4pg==
X-Forwarded-Encrypted: i=1; AJvYcCUCIk1O/s3RtJA7mkTTFy3DuFe+5czjac9AwXkLpPHuQrNhMZrGkIvCURKytkk6efcD9O0Y29Rbj+pq+/eimGvx@lists.infradead.org
X-Gm-Message-State: AOJu0YxIQKZ66YzSjpb41Fn6QfTsdVJ7JFHzXW1ldlzHmnN9cgr9dQlc
	xRMhT6V1URC6h+9KLQ55K8cpsf9QFrw3tdCSxJDsobFxYGKerWj6BbpXnQqAYeQ=
X-Gm-Gg: ASbGncusX/0/UGl+GBd0mYWq5T3+nHuIY1+pbeb+ouoAie3KQWpPZf0FTl5LXzZToB7
	50rdR1WE5SLE4NE48hPYhD/ncV1D5AoqmGOw+Ep4kekgyGVbOO/PoN0QcwXPyoCHz7i7jQmRZ6+
	OuhD2phijXxFr01SLLDPBWpJq4VrfKZdRuQKW0ocWDsgv8Lrtrzbjj3j19/smuSdhsHTEGZnsLJ
	PvtpNJohqLLxq6BKZJPIWwxoVGan9P/TWxjmoIms/D0JEtLULeY5sddf/eyYLn7WCTCHCLAN5W1
	YqZX9Ik+Dt+UtvdMV3qfYg==
X-Google-Smtp-Source: AGHT+IES5n2L//hXjZJ3/INKYRA6hW3/84gbWd1/kG9HfUt8dKiZynJTzwMTEUXCKtTORh/cOo9UDQ==
X-Received: by 2002:a17:906:c145:b0:aa6:832b:8d76 with SMTP id a640c23a62f3a-aac2d447677mr2553602566b.12.1735318643006;
        Fri, 27 Dec 2024 08:57:23 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:22 -0800 (PST)
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
Subject: [PATCH v7 00/23] Support spread spectrum clocking for i.MX8N PLLs
Date: Fri, 27 Dec 2024 17:56:03 +0100
Message-ID: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085725_357915_D403B93D 
X-CRM114-Status: GOOD (  17.80  )
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

The series added spectrum spread support for the imx8mn platform only,
but in case it was merged, confirming that the directives and suggestions
made by the maintainers were correctly understood and implemented, I will
extend this support to the imx8mm and imx8mp platforms as well.

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
  dt-bindings: clock: imx8m-clock: add phandle to the anatop
  arm64: dts: imx8mm: add phandle to anatop within CCM
  arm64: dts: imx8mn: add phandle to anatop within CCM
  arm64: dts: imx8mp: add phandle to anatop within CCM
  arm64: dts: imx8mq: add phandle to anatop within CCM
  clk: imx: add hw API imx_anatop_get_clk_hw
  clk: imx: add support for i.MX8MN anatop clock driver
  dt-bindings: clock: imx8m-clock: add PLLs
  arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
  arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
  arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
  dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  clk: imx: pll14xx: support spread spectrum clock generation
  clk: imx8mn: support spread spectrum clock generation

 .../bindings/clock/fsl,imx8m-anatop.yaml      |  53 +++-
 .../bindings/clock/imx8m-clock.yaml           |  84 +++++-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  12 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  12 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  12 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   3 +
 drivers/clk/imx/Makefile                      |   2 +-
 drivers/clk/imx/clk-imx8mm.c                  | 102 +++----
 drivers/clk/imx/clk-imx8mn-anatop.c           | 283 ++++++++++++++++++
 drivers/clk/imx/clk-imx8mn.c                  | 199 ++++++------
 drivers/clk/imx/clk-imx8mp.c                  | 118 ++++----
 drivers/clk/imx/clk-pll14xx.c                 | 134 +++++++++
 drivers/clk/imx/clk.c                         |  15 +
 drivers/clk/imx/clk.h                         |  18 ++
 include/dt-bindings/clock/imx8mm-clock.h      |  76 ++++-
 include/dt-bindings/clock/imx8mn-clock.h      |  64 ++++
 include/dt-bindings/clock/imx8mp-clock.h      |  80 ++++-
 17 files changed, 1032 insertions(+), 235 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mn-anatop.c

-- 
2.43.0


