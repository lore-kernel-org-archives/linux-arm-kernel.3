Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE453C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 06:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwnDSUvK6FGHCaa/OUJvqxFp0aKtITa+jYSMw/i6jvs=; b=ff2KuK017R3//pau6ESJSOdiBI
	17W6Bn3SW/20gRPQWultlk3wYh82hGSKrCnZ3H2uDqAS6QSZi60eNV+rdYqfDFz+TDe7wwwf/Gvyy
	UzbBs2e4aAa/01zlQEYJwow+XLO5ezQtPhAlxdxh7nXqZUIJkCY2Io7NuSg/vriuQYz4WVSrLJsFk
	LMnGTVuV2i3FZ9eQ7l5K7JshxSNWaITe5uBCwAwHHBpFZEZanF2vQOAoXKYI8J+2ZNmCMv2+J+4Ly
	PV34iT+oPhTaXx2AoUa45MxTW7NWarrYZIjo0CfMYga7g2jjgeelcNKoAkoD5aRhhqQG4csOLPEz6
	fTOuSFew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TnO-00000009Mgn-2R3h;
	Wed, 23 Apr 2025 06:41:22 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TCh-00000009Hjn-0U1T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 06:03:28 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac339f53df9so1013311966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 23:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388205; x=1745993005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwnDSUvK6FGHCaa/OUJvqxFp0aKtITa+jYSMw/i6jvs=;
        b=in2YCSdYWgwVLEdqsrU1OFfAw/w7G9fcNCk29VWaBfUSCMYyAtKe75R+M9Cviozhhl
         Vj0eu5XsIBILoBUkC7ZV9CD9cTOmmzon9Jyh1UHp6TtjIx29fDT73UP7ZEj553iyanGg
         m6GSCpeP/FHgixpo6ya8AfpBVkkq2O9nrZeiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388205; x=1745993005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwnDSUvK6FGHCaa/OUJvqxFp0aKtITa+jYSMw/i6jvs=;
        b=Iu+Q6MlrqbkaFJxHBqoegBJI+seGO00I+sQ5J6/X943aKMTY/RmHRPiyDA6o/pq4B8
         67U+P+y954j584LwbMw2qPtWUzcf1plT7V0eUfWRhXVHWargqvijCaH//jVo0wnhmhsR
         dlWX0iF+iZ6oOSISfwr1Nd9MX8r4fSW2+RzV7jW/yHFh67pipNt5EYYju2o0hbf65PKL
         jm/aFwl36mFXbXs1q/bNvINDaDTnwO8DC1C4EhuP/X7O8YEz4hUkDNVBxZ+wfqwX5oj8
         /LU11f0TB0zI64RSpXZf5E/IzZ/XR+2OYjO2rv8xoZIYmJxJ8Z91U0IUkG/bh1YPxUxe
         iubw==
X-Forwarded-Encrypted: i=1; AJvYcCV0+vrGKdTOeXfA73L0biQnPXEDfCrm6yB5SVv1arzoAb+s43lYLnKQhOD49cPt22ezjgM/Ln2FRXv0zEFKdA5v@lists.infradead.org
X-Gm-Message-State: AOJu0YzhGtbFqDB8iNh5260KHhtl/YHvnSvCehA8nngNiXduUPr/ToLV
	P5J0wquMzY7kfhY50ELNoZyHrtCra7GfxepkxQJ5OidkXsEbsk1m/vZDD2W+g28=
X-Gm-Gg: ASbGncuBBjjzdtGfZV+15mtQ1ZxFwl37ldAYDWWioJ6LmdNyvvtc130j/ldO0o66uyQ
	BFtaXVB/vnqyOpWUhhRuTrj1InQNV2WM5a5yT1myR4TruhZ/0LyTgtQcrHTgvbaoHDm8nhvisBH
	D43W0DKvHkm4pNdIIdXXuPOmfUjw8Q6z6K2p8fljefrhHFjbGvJSZglkyWGWU0T205kZVdRQNfh
	92OcGd4aPVaEvdudBuT30qNIKeU3jx+OMHMvozhG9kAxtBb/NiDt8y451O1Vpc69S3SX+yqbndH
	NDENRJVu0BZQjlcnUhA1BE3lx2Ny90ztNdA5dq/QwhmZVaWsfVyJ5CbNPP7pqbIJZRxsDa3eB+Q
	jiaPiEDxftJgTlEA=
X-Google-Smtp-Source: AGHT+IGsUxDaV1VG5VEFOK4UELVg2Pwf+4jwnx9ulQMNovrjSuWKEHY8T3Kxuf+EnYLtMT72UxcKgQ==
X-Received: by 2002:a17:906:7c43:b0:acb:b381:c28b with SMTP id a640c23a62f3a-acbb381cc4dmr568952866b.47.1745388205316;
        Tue, 22 Apr 2025 23:03:25 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 18/18] arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
Date: Wed, 23 Apr 2025 08:02:35 +0200
Message-ID: <20250423060241.95521-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_230327_153709_8AE2AB7C 
X-CRM114-Status: GOOD (  17.09  )
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

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v11:
- Fix conflict while rebasing on master for patches:
  13/18 clk: imx: add support for i.MX8MP anatop clock driver
  14/18 clk: imx8mp: rename ccm_base to base
  15/18 dt-bindings: clock: imx8m-clock: add PLLs
- Add 'Reviewed-by' tag of Peng Fan for patches:
  11/18 clk: imx: add support for i.MX8MM anatop clock driver
  13/18 clk: imx: add support for i.MX8MP anatop clock driver
  14/18 clk: imx8mp: rename ccm_base to base

Changes in v10:
- Drop the v9 patches:
  16/23 dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  17/23 clk: imx: pll14xx: support spread spectrum clock generation
  17/23 clk: imx8mn: support spread spectrum clock generation
  21/23 clk: imx8mp: support spread spectrum clock generation
  23/23 clk: imx8mm: support spread spectrum clock generation

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
- New

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

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 78d71aacd0a5..212596927f0a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -751,9 +751,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MP_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MP_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MP_CLK_A53_SRC>,
 						  <&clk IMX8MP_CLK_A53_CORE>,
 						  <&clk IMX8MP_CLK_NOC>,
-- 
2.43.0


