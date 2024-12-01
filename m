Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F961D4977B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 18:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+h8roym6BKL4klc060XmQbisU15KKTnjExLT+vczjQ=; b=IOEACjg3g9lVIncllLdA4zoN3W
	X/0x1zqUI1IPJhZ1suegrvOYxn9wRxUeZkFBhtqf2XZi6NTo5b4Qe7BEmN/QvQf1f37f5greY9cby
	MD4BPLaNH14rj6dsQey4bXJH70I2pUzpwjq5p7oNmp+LKyA0xIs33ZWx1ujtvKAE/1Nky1XuvAdkV
	gEP3cRxhUuYNcixN0J8tw+kCQvlOWzUvALPIDBExRPDKWg+p9Gf8ioIOuNUiriG9sEN6EreEsmXfG
	bcmljQnjRotBwtqWvzKAhtO+oBMiRq6G6mJpqCvTO/U8oRH9ZhB5uh3ax304YuXyh0e+5GUWOZ8gd
	8bTG0vBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHoIl-00000004BAR-0RIl;
	Sun, 01 Dec 2024 18:04:11 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo2x-000000048bM-0Vyv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 17:47:52 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa5325af6a0so494521966b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 09:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075269; x=1733680069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+h8roym6BKL4klc060XmQbisU15KKTnjExLT+vczjQ=;
        b=W7LnATUGs99vm/XTOLd+Kiax5HIToiirzF+7e9rO2bp+N7A1/3ahqYfzxgSU8ijQdA
         jWrTn4xU0eAxOU7ECB5mU5w54fPdbobDnMcecq/e44PNGlxBgX/5dIJ7SGnL0Sggg5Xy
         q62r15ME0nXW8E8Zji1TcPmMDuDL1DSZdkoyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075269; x=1733680069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+h8roym6BKL4klc060XmQbisU15KKTnjExLT+vczjQ=;
        b=uvZaBarMI00GLv8Fuo7hJAW43msyxlC9VBDCAfdqLQN4DhYpBaq3d0cnfskpoBp6dv
         BouNdIC9GnVP5FeklaqtJ9o28k13bL7bjeDvtlT6dYh+VIX10SL5URw2pWFDoWEe/5pD
         YJrNFedlgmapCiGcAy8nG/lakdaTYnO0u57geT0GZGREJsc4x4gvcy8PVwlDvlSqD60H
         I91k8Oflg/YCrxPXQSrILrQNs7YGlyaeHqtvqJh/hKkJ0Vl2Fq92PuZXZBKaQX1qyQMC
         i12PiMv55LkbAV9OkuCKnbTtyalvv9dAMv6g3b6jFs0NpM4qUkKQRkyK5aUcpVYKIxgs
         mEYg==
X-Forwarded-Encrypted: i=1; AJvYcCVITE/PEroKB3mOlbgOlrGUoBZlhDZd0W+/85a1VzL8j0A2dtYRVp4ce/AYSLn++5WMLLj48Wke6Wk5ICrLIP8M@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1xywDV2CnMzjv2/nJpwDvkOQW6XUL8uGQLfJm341sMtldXF9e
	GakUFZ/XiZWW1BODk1G11NwWYUEYzAsDpMfLYj5qhXV/WyyHdFLP1DLG/Nq3Zew=
X-Gm-Gg: ASbGncucX6QzPS3UPrbHmkHPZ3xzytWYFlhzqX/KvvpCpkD95bFX0PH3CqTtTKveDiU
	zDOdn6bsGW0vcghd13ZgcN+r24oJSZNJ2nTVKzeYVTkyAfiPIoSFPcfyDtipHkEtR/7g2j/iMNI
	b4dCTh4gsmDtnpJnxNmYBfwDUO4OlKSbLaIv54rZNu89JQXI2a5Q8clGiVcU0aVgXeR3Uo32Cik
	4S+p9SMD3Ldx9AYGzkzZDBcRztNygJtriFxD5x9+geItv61/Y9LNXI+FiuM+LVBMBFy05qF9D/h
	UDHMDUF1XJvzsSEUYlw/fXNd9qt5IYmz9mIYc6w94CQNrRy9a84GqlripW1vEMD5wZiT7ZZsnp+
	ckLacEp4m5aWSGZyT
X-Google-Smtp-Source: AGHT+IHcG2/XEmp2qpnejnJb7rN8m4vpml4qw4y1T/GeofPNf27UqhM/khEJJ1uq/MGoaT5KNjmbrQ==
X-Received: by 2002:a17:906:3145:b0:aa4:9ab1:196c with SMTP id a640c23a62f3a-aa580edf60bmr1451047166b.9.1733075269496;
        Sun, 01 Dec 2024 09:47:49 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:49 -0800 (PST)
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
Subject: [PATCH v4 16/18] arm64: dts: imx8mp: add PLLs to clock controller module (ccm)
Date: Sun,  1 Dec 2024 18:46:16 +0100
Message-ID: <20241201174639.742000-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_094751_157279_BCBBEB70 
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

 - Added in v4

---

(no changes since v1)

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


