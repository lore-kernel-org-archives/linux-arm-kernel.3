Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43EBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2hCs9DBY1WcnrRGyr88Evw8OuCDQNrA4ENDf/4vgOw=; b=qPHvVn9PfYsYJWsNHQDS/hLt1B
	vhfLK8D7DCbKpZ9+kdsEcQ66VMjEWtcVNd1kP1Gq5/zeKCRSVAkxSos0sFOJrkr3zYOVEbgRofERq
	Y3yeob1B0pEoiStQ9BxxF5CinYWmFXcBOrK4xyODHps+Tp4jpQxt/oMiNSdayVFr7yrLFUFtGjeB3
	zMRltSQBPwadPsdZ4Qkek5U0aVa9g857mRmMpahR+j1Zu3a/ch+ljh9nSHEw3TWWmFumby6rRfF7E
	7j5pNWCNXFmZnar0CW5z0vVfbFJ5Pjx+rAYFG7QLNXdzlZbgLtbgGlIsUcMS6ivZy3uXbFWiRQoZv
	akMTScwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPeh-00000008aAp-3YFj;
	Sun, 22 Dec 2024 17:22:15 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPP0-00000008XtN-3NK0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:06:03 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aab9e281bc0so652680766b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887161; x=1735491961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2hCs9DBY1WcnrRGyr88Evw8OuCDQNrA4ENDf/4vgOw=;
        b=Lgd45C0/TlSi7yFA8cuZXCC0Z7KrD7mdp5jgBSVEZ00/K5QATGHxd2rd81waVlptQz
         P/zsrfrdbcfthQGvJ7Nnff/UzqGf02haWqBmOPbzoSwMbCP/U8Yk7G4fnxY+fcv99n5e
         B5dVRTsA2Jmt1xjhKv2RY9xL3iwRkhiqvrbVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887161; x=1735491961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2hCs9DBY1WcnrRGyr88Evw8OuCDQNrA4ENDf/4vgOw=;
        b=M2hUkaCToJ3Dkkvqrl/DLU2uqOx86wZiO1ISt8aTyWDWMZ2Em91zIVJoINCWdvCZj8
         Fv6vfgt19eVjXuY5xcOs+y48/8xeA4mP4ZGDb/mNS5Vqnrfl6ObJmaXYT7Ki9lbhHs0l
         a5r7WMkJDKrztzrAQY/zBws3DrwlOv37LbfHJBJnFy6UwdjVeFB90q2uW8BFrRF4mkRW
         m6KxpLPg8fhtzNJ3axs7VwqY8huD+EQcZ/i8iZ1rsmyKiPGyYH5+AZ+u0cRAUAzSCZnW
         o71GYpN6Ts2KGtMxhtdu0BomX7uRG9T9mbLDdEqHww0BNmgcVZexyHpU2UXumQq76j6j
         h7rw==
X-Forwarded-Encrypted: i=1; AJvYcCWE8vTDu7eBl2qC2F08lSw5qai4KSqm2ftd3poZ02GgvhFupAbkDrint5WWpkUtmOrE3I6g6eCAK5F8qWTGM9bw@lists.infradead.org
X-Gm-Message-State: AOJu0YyHa4AeqNFmYzuLmhv7MEFM25CvgaRvpQeC247FxD776qNByeO9
	Sn675snvF0yiGlSbli0KNcxg5jrrdX1gkmwzZK0gjhn6J82Vn3AZVL43oSPVLzE=
X-Gm-Gg: ASbGncvg8iJFux6WOH2gcIKn33F6XJL3irVMTytxysVOMSS+Lw4jx2JmP8KByhtN4r4
	SxkHHlRCq7WIDTshBW0D6wrE0uIW5BrvgySvEdYyPpQFiXlfSVGXriRYqCtwsKJLnkT5wL8lVNq
	tOwlLYHOGRaU8n5oB+zJzgHN9V2EvunEG5BVzNC5mKs2PSu7HMkt1j2HWO24BHBB9kkTGBNt2QO
	wGi4miWRDDh0GwlHoXAFiCdhIB0yHR8dH5NR70tTcCktQPMnXHSER5y8gM3Vx7wLUMNvAcghF6J
	/0FOT1slNp62hbnIjL9dsvYXuxYIj8Qa+6V4dxD1cnHb+A==
X-Google-Smtp-Source: AGHT+IGrdnp4N/NaiyuFY3WnBeZDVSq9Cn43U29rzxiI+9WQh541chHbCDz39sJDsX8w3trYGW8osA==
X-Received: by 2002:a17:907:c20d:b0:aae:8490:9429 with SMTP id a640c23a62f3a-aae84909672mr543216266b.34.1734887161008;
        Sun, 22 Dec 2024 09:06:01 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:06:00 -0800 (PST)
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
Subject: [PATCH v6 13/18] arm64: dts: imx8mm: add PLLs to clock controller module (ccm)
Date: Sun, 22 Dec 2024 18:04:28 +0100
Message-ID: <20241222170534.3621453-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_090602_846975_4A1D58F6 
X-CRM114-Status: UNSURE (   9.90  )
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


