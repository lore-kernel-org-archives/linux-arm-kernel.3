Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52449C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 06:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=; b=RGvU3raQVcECXRzdDCmgiFtBLg
	4SNUd49jLbn6e7MrDTa5F83Dsr2s3OTC5STBWp9d/2QzcsdcrX87gtcArGZ3ACEGAzAbDKwchOTr/
	Zc+QY4TVkETXuS13bbgCUTf9/WAQB1giaVu3Q5yzThXY9ggOvKIi7eEqyQ9K2Qpy1NEYzoY7iIGkP
	DDBI5UHxMMUjBTswoa0BsaBM0OIgx9Qa0dWyqhFcaDdI0Ruo51N7JEvQut8Hs68PvRBFoVKsl/zEq
	8+BSyTx8/zQFBe+kHdi1sgxOqRWg/9p7W/9dqhc7z4vwQwamkGa1GLSRRi0Y5XqzbQVR9bZ+CR2Jy
	AUFhItgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qXW-0000000D4Iz-09O9;
	Thu, 24 Apr 2025 06:58:30 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pyi-0000000Cydo-1PgP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 06:22:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso5004935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 23:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475751; x=1746080551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=qQEFORWljnWREdAMOBTS4PCZgt9DhyS8Gj5/cE08V7E7PhuPpwSWpZCzx2xMHj5SoU
         yU1tWqZDSF/EZFMqmI59TFKkIuoCVXFRXXjcmGV2W3fq0CveJeke1fquGD93Sl7gVYHC
         5/rB4JSB1QUrK1gNbtzHATxs7jMgN3vfGIh1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475751; x=1746080551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=gMcZYUta4szg47zQ0q8UHOC0eLZGK9QJVFNP6/fVEE/Ie1D1kiqPpc7IyiW24piETR
         MuW6SCCByis4koQJOLmrJrg73C6pjoavoXITg8K9fOK09dmHuMstINiyP9KR8CdJh6nR
         hHfSiRBxumk5uuAOBoPMQmK0CkktQ24W2juJ/5Y0v95dDvjwmXPmLIdIz8ucEn5uIfEh
         kUVXZsh45/Z2fZlzs4lO2h7kr5+O50wpqElTRTvhepjYuU6Qy4rm99w3pfp3WRV5SGyX
         4kD+RAvv46pP9AuzuXhbK8nO3RYnq1f62hk3umKS8QszpqxaNjk7nJPsexxeDEeQ+an1
         9E2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQEMU9zFXS117dmYPsYAtHUA0b8htcRfGIKJnzD/XEDZRts99GUPQbfjUAMQsWlfpb2r4eI8YGOfBDWc7cCdMU@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkvx+bMRbwR4+ZMwQjIcRltF6oYNP4+eX72RZyK75yhZj9Wxfm
	AgwYtSHVM4CYcev+2AgkPIYGsL39I4af/Ifzc7PsM8WH+zmGJPm+uHad5W3WV1w=
X-Gm-Gg: ASbGnctwJH5ZyP3Cw3AY0DDM0w5qwqWbLyX0foH/6eSZO6PVfY2a1kASiIkB3yXauJs
	8H5NYO3KgIAuOZ0d9EG1U/jDYwPRXBoNh5A7Nh9dZwr/BM2oyIOgrzrs6L0N0UQTR7oCRcZuIM/
	M0ydXzuNNsw4hrA9dNMeoSF7ueAFseQjVte7rbst7flGMtl9KLx2T6JYz8iEDxOl05mdkins2T2
	45RHflnNY+WfGmdHUFXXuPTaNPK8fDPajuQsE4lZoTBNq4wfGC1Cnl/t/IzKneWhuWJeWK0r/4l
	2q/1eIPwYqmSntimBv7DNJKbaFZglnTIa5Kpf6iEYCVNLUvEoqH7a9mR3ZYD8W0kSZuF53a6Q2y
	dIXr5
X-Google-Smtp-Source: AGHT+IERMp+XWsY4F0x3mSBeRwTvbYJcZ3M/RXSGGiprl/mRX85K/4aqN6WtoEv+WLusrd9qS8Cjww==
X-Received: by 2002:a05:600c:3553:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-4409bcfc11fmr8017185e9.1.1745475750966;
        Wed, 23 Apr 2025 23:22:30 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:30 -0700 (PDT)
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
Subject: [PATCH v12 17/19] arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
Date: Thu, 24 Apr 2025 08:21:47 +0200
Message-ID: <20250424062154.2999219-18-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_232232_379895_5DB6964E 
X-CRM114-Status: GOOD (  10.03  )
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

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 597041a05073..79f4c1ae7d8b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -642,9 +642,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MM_CLK_A53_SRC>,
 						<&clk IMX8MM_CLK_A53_CORE>,
 						<&clk IMX8MM_CLK_NOC>,
-- 
2.43.0


