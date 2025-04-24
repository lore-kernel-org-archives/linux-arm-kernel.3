Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9195CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 07:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFzIBseBXs31QtpNYYtETMYlqRrqWSPS6FJ1rAB6aBE=; b=yzBEcgd9eocOE5MYKlwiYzUtKH
	2CFivfOotSQZQ5aIXEghp9VZngQ18C7QArFLxGCFtXxzDhllbF5zSPQYyZRNsHmyLNTvQ5CXWb/IK
	GF9gCmDNYFyVTxd+pNiDYq7o/B5WLhKU27cx45Z407QKYTb/3RMXOteSQx3Q803u8lGpOzhS7nr2f
	yH9lwxPOqW83LkJ9o+f/Nfp6DHqUqo7XTDMNU8MniMTkDTUf8WxZPfEE/k+wN3RQov5KRIcPR7x9u
	shIb16XSdGNmCBGAhYgjf30QJaHZOS6aKt4TStqitSHyf1ds7Ec0kKlM1GSzZIMtZeY1NR9xffcyS
	ZotNLF0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qbT-0000000D4hX-2Inx;
	Thu, 24 Apr 2025 07:02:35 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pyl-0000000Cyf5-2P6d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 06:22:36 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-440685d6afcso5859565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 23:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475754; x=1746080554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFzIBseBXs31QtpNYYtETMYlqRrqWSPS6FJ1rAB6aBE=;
        b=m7fUvA/0PWCOx4viZqBkm3ay4ydH6GyBYcneYZUJeFpjHvvx+M1h7/E8mI/LtLbnzV
         g2xCWGUYNcLZ/DeYh4V20+jEm6/yluWFQmu4OD8EuFKj0oboTB1p2Qz4OGO0fB+ReEwx
         hHhIKp/J13QAm2rJkidOsb2xSA+Zy2SlSlo2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475754; x=1746080554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFzIBseBXs31QtpNYYtETMYlqRrqWSPS6FJ1rAB6aBE=;
        b=e71PLxevTJzfJeDVRaEBR2bzYF8IUhFC3celEBEw06aZgxdrW6yHXyAkQ1Hor/C2sv
         uAwnjufA3Xy4yja6Dv43FHALbNzxU/B3s0s5LvddsAzdwEDiXjaGq+h8qB+CDqWz8317
         ssgMKS/DCSZeQYhhXxwKkrDQYbAugJTRNxux005rD6PVocyPLhPqJr7nQnKrB4MU7pjy
         FatkNUwvoZGt/zp7ghqrkL35GTKcE4ICljLJXqYermjqvobGPlUsXgEMRPWXAm29iieL
         rzLwTQy2BkMCnrhZATC1EFVq+zqqCmisppO/qKvVfKngMtMJUBsCRpfs4V+hTuCdhCzA
         vA3w==
X-Forwarded-Encrypted: i=1; AJvYcCUH4Akw+6bzvFQUZJk6l8jx/1YYp4yXNFEfdV6ZOnpl8qIDXdYfKKrirSEs/bhlxHvtewCDdz2aJ8SBzUyn9llJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6oLjMat13z2n7r/PwqPEluafUVPjG2RiPajJnVNWQqsoSNMpB
	SMdSzCdyC/b4Fm+E3FL6fKyzIKDIV4ZoOBDIPkC4R5J5glvnPCyk7b06ApnTKvQ=
X-Gm-Gg: ASbGnctUor4jdykHGkpd6yY5zKQ18XAx5LEJaAa64wHbTano3WjtaJl41lHO75BAB41
	vLF+YquWNq2sBuj+0rfCTqk1HSBPUdaSRo7/iWa0zPpzEVTU/o8Rdj/ZpPgCz/i/O+VSaWK/1vY
	hCMX43C+8x4oP+TiZ4QgFSU9IM6sVUYy8RxArvpZdQRv0EeyYiPI/7geWtqU8z0Gcp/j8T559aJ
	adXYq8WUlRYgwfZTPtqvdBb2EwFCoV7gQMWGJxdxDkRrr4cPvbxTQeuAZGABYFXrTZ7a4E5k/GH
	aKSMt+oApzda82EWtQkM9tpcFI31fjgWHlrdA27S6dQUirAFMyMAbhzNaBtuIsPfywSjAH1pB44
	OjkU5
X-Google-Smtp-Source: AGHT+IHlkO0fTEbB2RjnKyjqf/3UhcogYgQtKjOhgIefhZdroj8G8F35OQptYoAwMwAcZLh8vRUsvg==
X-Received: by 2002:a05:600c:3b8c:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-4409bd8bd4amr8437045e9.33.1745475754091;
        Wed, 23 Apr 2025 23:22:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
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
Subject: [PATCH v12 19/19] arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
Date: Thu, 24 Apr 2025 08:21:49 +0200
Message-ID: <20250424062154.2999219-20-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_232235_615166_3265C641 
X-CRM114-Status: GOOD (  16.75  )
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

Changes in v12:
- Add the patch
  15/19: arm64: dts: imx8mp-aristainetos3a-som-v1: don't replicate clk properties
  to fix new warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/'

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


