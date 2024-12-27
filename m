Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D107DE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tXcK4MzLANKycoQovw1YV+Lipo6MwZ9hAHR/w3gOEI=; b=nAaUUiym+K5/Qq6svbnVakikCV
	iElenNR1Ogh/jKZITFOZp9OVscOmPUPFG44tGy+e3axdv9NdHybIr/gORr1jCQBI94TJg7thnTpNt
	iHkgi68woXvUZ7Soone3hBDjZi1pSmK+aGp04unPEPLCRTbTfJMIDmKZ3eoUChhCv3dsnrnXVkC7T
	V/0NmTykBOy7f346I8ojZ12DFBryNqGETYyGmyl0Bbf9sENwGsNSLw/oQiQSYln1gPWua2UFyFC+7
	r71vz9uZXKrVxorCcuNiDK7fb1lDGy8itwly8OiXPp4NQfrzTaB9aNCBoZQPgZLiEKe+jfW47goef
	b7X3Y9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRE02-00000000hna-3GZU;
	Fri, 27 Dec 2024 17:19:47 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDes-00000000eay-1KKT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:57:55 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso1094472866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318673; x=1735923473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tXcK4MzLANKycoQovw1YV+Lipo6MwZ9hAHR/w3gOEI=;
        b=eLlpvj4WfZ9ZxxT64/EisjMBc+n09HZ2e7d5XxuId3v4YOg55LXLOexvbBEV5Y2jPj
         2x3j+/PNP2GZuakMbxnB/nriYfg/gnaT65QyAbvjeKxc6DpRkUJJQxPRF0lvaOnqwXzK
         TNEvHz3BH+WgasaamFwchh+XQ0gYJwajRLA5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318673; x=1735923473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tXcK4MzLANKycoQovw1YV+Lipo6MwZ9hAHR/w3gOEI=;
        b=vxWO0MWfvxxjOCdVLst+SyFhkBCb4PeO1vO1lR/oF1efTopnc8Vj5XOHTpVJlqStTT
         V+UNa3ic575EBPdVPxwke4kkGkA0RthNvx/pocJW+Klwpc4BI77R6DC6jFuJWRBF82Oy
         TGzZUWV9tcj6KIhDX9PBbL4vQDl1ZC5j+YHQB3qp4W8dc9nFSomb2rtJ/VneyWajYk7/
         gMYyHmFx2jE8yVMECLdEucRWSVzCsFtcpJi/qNXWo/HZKwJvkVIVoJ/DAOeGfYm94Kyd
         rAcHrivYoK3jZbzNJ35J8uCZoLQs16RYYAKu2ZMC7EAGsg6oAvzLo+QhPnP5Su/Kvp8T
         Yo6g==
X-Forwarded-Encrypted: i=1; AJvYcCWM0VwM2PfAnqZIk3eTmSPZ1wZdaiNkULJVt2z9IGiJ7XVg7+ceQaD4Ivm9U+MdRy0Zfil8gZKtkphCDkveXE2B@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ5RVyexINdLpxQniCt0ePNv1+FPLFL5AxGpnF17C4hvmD6T23
	4E0Wldtic/Z7njVxM2X1iP2mYu1f7Y3cuMTt78p1ZrC0DvhxlG4TepJbMM598mE=
X-Gm-Gg: ASbGncsyaPs5nGkBHR+m4xFNa/ZS/IKU09e+ZE7iA9j+iR4XJEaGBH1I6S341SwEsTK
	9XJSo2jm7oRbmrEdQX/gSY7XzPCsW2EFGhQtHDNPwgJPBDiFf7+w0hvw9b8/pxO3db6CqyGtyj/
	R4oxRv4G5kKfLNM5/IGtwP4U7fA8M5DPdf4Ytvi/Ox1ZTZZlvuapRZaw1vTSvKpfssyZMU03zBf
	Bs8NirH/BNnsvfP+Sixudmihmx6DRqmtOhEKHSVs0Kf2Uq4h2VWTzYEaOISOVTWRzg6hLL4bCnE
	U5PQJHiUXFGHEP7xGEicKw==
X-Google-Smtp-Source: AGHT+IELHXAIGmRFx+PeofZhS2rys3/Tv8YiD1lK/y4zs6kEicZzZbe/K6kVAhiRQW0mq2JcGswPjg==
X-Received: by 2002:a17:906:dc91:b0:aaf:300b:d1f7 with SMTP id a640c23a62f3a-aaf300bd28fmr253744366b.13.1735318672987;
        Fri, 27 Dec 2024 08:57:52 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:52 -0800 (PST)
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
Subject: [PATCH v7 18/23] arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
Date: Fri, 27 Dec 2024 17:56:21 +0100
Message-ID: <20241227165719.3902388-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085754_358395_C772CF32 
X-CRM114-Status: GOOD (  10.07  )
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
index b1a4cc521bf4..c3287978c42b 100644
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
 				fsl,anatop = <&anatop>;
 				assigned-clocks = <&clk IMX8MM_CLK_A53_SRC>,
 						<&clk IMX8MM_CLK_A53_CORE>,
-- 
2.43.0


