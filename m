Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47F7C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 06:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=; b=qiBArlnKrsuT+KNrF5H3zUehV1
	2rA7O9E6JE7d9OccPNWd3vLCwM23mup7rDnk2VIK2zXdSYYjuoBvO/YupAMJ90Uyt2CMKKIrxocdf
	AJ/qVXKjTR0DIf2k2UzjvyXtIFcM+aIbZCfWpWuc8dPZCRMuiEVMs4EMTOItEGnPf2eaU4oVkrwUc
	aD8qgNeu0NvGvdVutRSDatP9/FQlWc2gAOW4aHDJQirQuOYYNOG2I6X1S5o80GtxDVnShn09gc3dG
	RELFQPmH+venK171p808uwLnbdzBw2uqPnQm7zVcaghbzBP6naTmg3ANukHQAe7an4WBLh+p+oiMp
	CrBJDp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TlS-00000009MSw-3VA4;
	Wed, 23 Apr 2025 06:39:22 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TCf-00000009HjP-0xuo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 06:03:26 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-acacb8743a7so94096566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 23:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388204; x=1745993004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=TGUAUVDYmPpbBBKOsGaJ+TEnR77I8MoT/hyKmyCIg7n4iqZ1+mG5nG4A5YaHyr60iu
         P8kTdwUIEs74uY8ZxKy37e6ZLzeE7kzofrb2YA0AXvCakUkE6vAHli1MlX5pfzsRGM12
         kpdzvHXYdEusJaeoPeVDHD8BoJ8O/v0WzTBbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388204; x=1745993004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=U5+l+nl8bJY/rkRmAMcrTKiT9qFc2fS9od8NtXfO180g4kni7sT1RWBp4nQS6qB5lN
         SFRDYUSkB5u8rg/10OigyJ9D0r2P1ACCLdD1eNQqtMzkLE6/X+2bKTPdreQh0mkXIjGI
         ejfiwecbqpAccR4zHyQyfHMqye19ZFXHM52uwyz2yIlkOwUWQ5N6vtKeOMHpmpIHpfmd
         gaSQQPcI6LELKFKdtRAS+cvElT7A7TO2OOZz487EbkC6kWTJrzVIRqw6cLJLcu/Jy3wt
         /VNK+TId5ddsvItbUCUEOqlHt9gF+KnR0kduljHQkP8S4RsXKaMzZwf5G5BYWpo1J8CH
         VpFw==
X-Forwarded-Encrypted: i=1; AJvYcCW4taK4y8i1xnVGMHcbb/vQM6TmW/eE8tk3RfqiDHor474j1DFZ6RBbfFc+DGWNn3wY375yz5gkJk6tXi8t96y1@lists.infradead.org
X-Gm-Message-State: AOJu0YybhXewoWJ2E//yBWa3+KQbpctnwKS3JIgMF9da7k00SIoOE9jj
	FSgdntqYTKhTxoxQGu14GacLSXvx1hwqpSVWGpzBGqbE7dcrsc9ZNr6ltfFKfec=
X-Gm-Gg: ASbGncvolKf4Z3kDXE9bUuAbwO3JzbY0P5iwOdFeGFYf6hU4PhixK1gqN3kaM6rS6Ue
	fL0gekNnE7GA/ZMRG34WBVMHPNzO5rzjSSguOcG+CoIVCHYbEkq1DEYdUZr3AnwIn7SXTfkdM95
	F7VH3de9GVAhfktEhHZRNkbCxC6N6ZE5cdqlWhV4RNg66rsHcmFF67kwM/tKxA6FzMDooezgRVG
	LWu0kRWiiisuSM0dz3Q5iBcvMetFMxTp/Tl6tTlaeHFWcm87/RDluQlexZwme89eTpV2jtNWP23
	mOtXCPXDargKeXd9OgL4LGwuKeZh35x6rqxGwSsS6k3qCG116veSYA5Eg3dCxuDFuT5z8Kh/JCU
	zKSDPTPAFMziqyR0=
X-Google-Smtp-Source: AGHT+IFZSf+bG+KI7r41cPCeoQNA0TACINpcw/DiMJU59t/n7F33j98DIG9obiHLOdT98I7Ur4zh6A==
X-Received: by 2002:a17:907:1c94:b0:ace:395c:124d with SMTP id a640c23a62f3a-ace3f559e71mr99328266b.25.1745388203852;
        Tue, 22 Apr 2025 23:03:23 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:23 -0700 (PDT)
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
Subject: [PATCH v11 17/18] arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
Date: Wed, 23 Apr 2025 08:02:34 +0200
Message-ID: <20250423060241.95521-18-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_230325_267475_E7B1E793 
X-CRM114-Status: GOOD (  10.49  )
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

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 49be492b5687..01013c1fd61d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -643,9 +643,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MN_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MN_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MN_CLK_A53_SRC>,
 						<&clk IMX8MN_CLK_A53_CORE>,
 						<&clk IMX8MN_CLK_NOC>,
-- 
2.43.0


