Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76D6E77173
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2hCs9DBY1WcnrRGyr88Evw8OuCDQNrA4ENDf/4vgOw=; b=htsgb1va1w3sac8LQr/Nh5fADn
	xHDJt8v1SqLMuVyzWbq3zRGJDKVkpBm28WGQib4tKxp+i2JSvZ3j3d1g4Yk8OjTDU88bJtUeaPmGp
	nCyQPa/8MdUCPYIW7VL8sHNEp36ofKjGUqrhIO1lcAaQT/w6lzQrEA7V1hyYi8oYSFlnUet+uaT59
	RHhIBO76KUuuv0JIKdUdLICwa3/u5zVrDGmCGz5uAFgThv0DvY7NhZTYgF0mGnusBhoR9YJEhnyxx
	dss04nlzgsvyDecMTKIRekvfpbjluWNFME4Hf8a3RjTnMRci4I3ZvW+TIi8YMzqtnx/D73IhCAm3c
	NHVr+jtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAAO-0000000FkHe-1j2b;
	Thu, 05 Dec 2024 11:37:08 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9tu-0000000Fgjm-4779
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:20:08 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa1e6ecd353so124115866b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397606; x=1734002406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2hCs9DBY1WcnrRGyr88Evw8OuCDQNrA4ENDf/4vgOw=;
        b=dQQrXPFulV2C0/vWEqQoor8R0mrRpddSE71mNkIf0kX1VePCH+0H/1nqavin2BkJdr
         jzGpAt/9D3Qmxi+0E9/p7W9sM7FKwp8I6WJA/IjFq6f9w1l1yODm8hAQiIxgxuJ53jjs
         UkcZ9ujJsbTIz2aYIHL+BEglGYOgvOsgXj52Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397606; x=1734002406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2hCs9DBY1WcnrRGyr88Evw8OuCDQNrA4ENDf/4vgOw=;
        b=TxSR6TX5Ql8plhkbd0oRlOWjddbweWGQQoQoWRZXkopcmg4AbHUCrdndMq70ApvPtV
         8yqm/75mkE2soIEAs6P1XdmV5Apby8oLYY6gVdaDOYApF10uL34u17i9raIFyAYtzkNY
         oP6O6K6O44qBrcrH/vMy759UGeohALBF0chEDRdstKHZrFc8wY7sIzEk/64jdYZcGiBq
         wTQQxYiS48LhMIERTvSVBpUYSXSNFjnb09MINih9MNWv5l/FfhULmeUc7ui0YJBO2GMj
         CB6HyI9bVOG3dLA5U3AePcZb0Q/oc5O98rSiPftd9LPxD2G0dOruRFOXBdx0+DOLrw/3
         11NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAq6yV13i5OoVsLgD2jgXNHcgvbIz0qOHgQ83eHshRQ5SkggON3Bmxw+xp05KsCM3QDnHZHNJB8B2MfUk/MhdQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp34fOWMJU0pFv3m7gewmi7bzCbGN0VGHJck+m7KZcUAqpSIK0
	8mezu8ig56/IWuGkl204I2tF/+JSwLZWIXVAb2CyF/FrQpIz7RrDrHGOCKCmTzY=
X-Gm-Gg: ASbGnctlS0NWyv66YKBKhxuOSvyWqgHchEMvSAFqkN0LHCQoyu0TY14Kwp1+bfZvtG+
	BX6Be7+hF6dwEqKNInUesKDhBk0Z80W5CJiPp1ZKFSOpN07JzDp6ES2fhrcSVkAieJmprDOL4Fb
	Eorbd/XhP0js5+nTUBc7hEoAhqHcRSt0C65tcBo3Mme95VYtKPpJjO0LjvsKLX2A+bapfzlaZ+j
	Zl8afRQbvHD8qyHriqTVWOXL7hYxTlCwhSsPkZMpJvBxT6VoH2KNPOqdvHktYIvleNYMZAT157B
	iHI8kTreqKxCWe26MBdGNlUJ7alMmxU24hTVIEz9CepcOg==
X-Google-Smtp-Source: AGHT+IGLZBaBqNRrXV0+VIf1ktSUUHHblEKAcaf8kiN8Y4lBfRjDCw12pclWyLXl1FgMMkHkUf47Qw==
X-Received: by 2002:a05:6402:280a:b0:5d0:fb1a:afe2 with SMTP id 4fb4d7f45d1cf-5d10cb5645bmr16989909a12.10.1733397605738;
        Thu, 05 Dec 2024 03:20:05 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:20:05 -0800 (PST)
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
Subject: [PATCH v5 16/20] arm64: dts: imx8mm: add PLLs to clock controller module (ccm)
Date: Thu,  5 Dec 2024 12:17:51 +0100
Message-ID: <20241205111939.1796244-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_032007_018632_8D785712 
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

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 597041a05073..0b35aecb6755 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -642,9 +642,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
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


