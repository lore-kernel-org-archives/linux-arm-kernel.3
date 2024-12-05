Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5A6E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biWMPay2nyJxiRsIuM7kfYUrVvGohPt2+JFfoRTvr08=; b=Xsa8YPsPrMT4XKG2MFBXagCBPr
	Y9UzvJCmsOqEKNLjpCwm1pFKS1xfNajjMBSPHR6tZXpyjmwkmqk5jt3nsdx+H9SFaskAjiKX5+owB
	38seivQe/Wx/9Po1i1eGP9pLJRbfwlEYGw9lL1nbqu3qGOKKy7HLEZsZNwz6DwVfRyLc1UfWTEpDZ
	rK1eoFpZsOEXAkA8Jb+GcmqHDG/2ZtBHtxdjxvoThWjeg2i3cZbNO2897G/KYAZhgNUaSUuR4ADN6
	TqLw3QkyyQ75S++c9b47B0SOMkOd/OP8j047EdIShM9a7qgfEMvmTiO+gIjW7Yvi0aDndH214KyZS
	xEDWLlAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJACM-0000000FkWu-2V7w;
	Thu, 05 Dec 2024 11:39:10 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9ty-0000000FglA-3Ryd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:20:11 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53e274f149fso389675e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397609; x=1734002409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biWMPay2nyJxiRsIuM7kfYUrVvGohPt2+JFfoRTvr08=;
        b=qRCLck15C9DBces1YMBxAH7rqDC7lE+hW2aMsgBFOJSrtl7457oBEXtO/bjm+hxWvA
         +MpKwAX9KIi1YwLjtaZFjCbww9R/F6ZDww3TCuEdKSgOfqiYF4WKxNUloJjY4lcWkgl5
         nXjAVE912JTk+lBVwHg7RC/veVPJ1p0011ggo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397609; x=1734002409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biWMPay2nyJxiRsIuM7kfYUrVvGohPt2+JFfoRTvr08=;
        b=qG3PiKXFE+xeqDsK3tr70VavvlB6jKCLWoo577hIYHdzjUABUVa6DLZrQQOGHG+ZtD
         WY6z3bgyY0IvmGc+px2YQf+TXFsJNGnIypzbNEBatIE9gCyN1Lz3vkDDtEkQKe2YTSuC
         7Td9iGknpSx1/VCZtnbeRB+f0bAWi6j/4ykAdjJc+s6cR9lNpVZ9fVAvcnOGucoTrB3X
         9X1/9C0+/1ypuxzURCaF8jsg+3H3UaN4mCDNOsRgtFGSgdRn69Iyg7X80wxTvKJmiVEd
         96SyBxx0bebeJh29UoA70WdrjAgffD+gv4EMSJ0ABrk46vtKwZIjLoul80LjUC1GF2PY
         k+7A==
X-Forwarded-Encrypted: i=1; AJvYcCVFDnkaK38at7QiDLm65AyVkUzKOGxvuDi1oltZ2MYgqQ5NkSoxq6oLMK+jORbnB+Ueaj9IcMVgdo5ZFxwaabYa@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg9OnK+82KOwHxU6Wc9i4TPW2B8ZpIDyVkbUIAbBbKQoaH9g2n
	OiOeJy+v33KfH57TFN74cKPkuX/GI3u+zxkVvUFgVnkzn2aDjw7hnvAxp5y10E0=
X-Gm-Gg: ASbGnctjeySFKoMtjEijO88/k2S+klO0YfVF7NGTn8/N/BMW6HC3hP8tFd2a4a5g31N
	Fh25epLL44pU5TVvmnPsBEO8rmyKnKnazlk0NE22RVno+mznHSZ5qacT0CmmbfHQGwcKSS4pqeE
	ibY0c/yQjpQTyqCJGR6K9M/z6JOAODfAPWcR1SsYYigA1y53/sK9cND5pFvJvMP2cIWEpzZr2lH
	K959jLdyWfexsTSryffeNA1jFJlMX7jtfHcZSkFYrkaihMGO6CmKfMxFF1Xd2SNy7AfbtzKZ+7e
	wSEmOQApPIXSgvIaVJODWhsLJO+Xsu1fdiwADLd2s4pKSw==
X-Google-Smtp-Source: AGHT+IEWp4UoDnwBUpXtmDUlrG4M6Gl9Nup3DKpNDi+ZT2s/ZJqbnUNyO4bcuE37hxKCpJ5erMuTvA==
X-Received: by 2002:a05:6512:b14:b0:53d:edf6:c560 with SMTP id 2adb3069b0e04-53e12a05948mr6199533e87.29.1733397608945;
        Thu, 05 Dec 2024 03:20:08 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:20:07 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 18/20] arm64: dts: imx8mp: add PLLs to clock controller module (ccm)
Date: Thu,  5 Dec 2024 12:17:53 +0100
Message-ID: <20241205111939.1796244-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_032010_859964_3EFDF7DB 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 0b928e173f29..861bd4f4dced 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -751,9 +751,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL1>,
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


