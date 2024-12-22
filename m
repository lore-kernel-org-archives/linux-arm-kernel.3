Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B78E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biWMPay2nyJxiRsIuM7kfYUrVvGohPt2+JFfoRTvr08=; b=lgZGFSucLIXSehvgTtcXCBxyyl
	eLgTknyIhr8WpZrHe6070E5yr8M6pPbSYTWZPPdgigBOwv01o7X+5kfE094u8HOng+yAG4oZpgS/Y
	6D+31IT7JJkLc0ekH56PqPlh/KlsPuG3uckDiSWtt6wnFzetymXYLZMj92xGCvYTLjy48l7ii81J9
	+a6bn3NZrAYZ7F7SfzX/5wq+RtRE5Ic7iT6uFiy/P8QsxqIF4P/MLhJGraUEFlKs05p5Y0MSM1gqa
	MLewopjzg9Za6pvS9xT4SNUE34knlynsoaadKqr079S5aXfQrDjtc90Kqfm1ooHIgbAb/1QB160kZ
	elJiEynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPgy-00000008aN1-1dc3;
	Sun, 22 Dec 2024 17:24:36 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPP3-00000008Xui-4Bba
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:06:07 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso542019366b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887164; x=1735491964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biWMPay2nyJxiRsIuM7kfYUrVvGohPt2+JFfoRTvr08=;
        b=L7JKARx5Hfm0XMTwhSuSebnfwz481fJLKrLVxS7ZkIOjc/CNj5TNaHrB1yny43csV7
         jtvayfksSGg8zHHycMRwqWhQuoTBx0Rc9xmQoUStrD0u+KtDtk3FOkJu7NL4g6mLgmXC
         coyeWmDDZFnB/w1Plxf+FwwgsbzOMiSpTGa6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887164; x=1735491964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biWMPay2nyJxiRsIuM7kfYUrVvGohPt2+JFfoRTvr08=;
        b=Zcq69OmKXjMPIMmB3Y73bLZcP0X+y/BgYT0HjSyU79mgl93qHN8B7Bm7h1An3qwZ7E
         dWQP/7/uozpVtewIrlUNWQvpL4BHdWgx0E+o9qKOtgALdA3dMZwWeR8tZ4JNs3omr/ey
         FpeCUhcIZfWEPcFD1siEtUFPXNITWvis2ScMATHQmKWnLRqX6vgaA2HjuNvd/N0Xmpbl
         hX5lmVfrZqqMMXC0++cxZnCd7oHYRKPigAR2zUFRp5FWxSWcI0/bMbH2Fng7hZmS4BFH
         Tl8jvD6P/0YkES6R0GCgFkEUTE2ea9jtlkcyuX+KG7OINs9EG4H8r9x6V0zWyLKwSXrP
         BoFg==
X-Forwarded-Encrypted: i=1; AJvYcCXsk3Sj4Z9qs5sRBIkoWM1NfgGtYmDmIrbQ7HNyBfAfr3B5l3JRMmesVIpabx13Qhne3S2dL21AKm8zJqoxTGN5@lists.infradead.org
X-Gm-Message-State: AOJu0YzWtWfFLuUdHrRmrPVSkxCZGdMX8kF3tCffCLZJDGdYMaXgPTkD
	waBTALZNOK+jB/TSb1pb/5S/7n39n0nf31HQ3rcktVIOC6HHi8QWRGFle8LDNAg=
X-Gm-Gg: ASbGnct9ex6QI+QPchYijjp0Mm4zEeVdsi64MNLHeebNvdDOISGZ7jIdnaYxrcLC8y+
	OBybTUA504LYkrBGx0zqquFZHtpOXGIYqx9RE+W835IFQi16ejpOlx+Eyvt68KLTon2QrqJDTWs
	7u8j9Zr0gcbKstFKUJ74g3X/gy4R9dLLzi7sW6nOgQmTA+n9AFJIdJTt3C21KZ8qhe+Kzg6NjXX
	59wtRYujuvbjGt8pivX5UKLhflWaPYxr1UBwoJvIbUKSHASY0zz9tBdUm32wpSpN9mNzDPqtoEr
	LheQCfbiMbwhbwm3oQdd62uxup9EaqmVjZQDqmIW06zq8w==
X-Google-Smtp-Source: AGHT+IHS1WqgQkIx/Sdk7zlN3zZOAZuNbmdvKuf/0PVXS4VuRqhbEOl7O6hKLHRinTiVbfdiOSnO1A==
X-Received: by 2002:a17:907:3f12:b0:aa6:7220:f12f with SMTP id a640c23a62f3a-aac2ad8abccmr1116056966b.18.1734887164295;
        Sun, 22 Dec 2024 09:06:04 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:06:03 -0800 (PST)
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
Subject: [PATCH v6 15/18] arm64: dts: imx8mp: add PLLs to clock controller module (ccm)
Date: Sun, 22 Dec 2024 18:04:30 +0100
Message-ID: <20241222170534.3621453-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_090606_038523_38D96F62 
X-CRM114-Status: UNSURE (   9.88  )
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


