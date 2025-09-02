Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFC2CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AE+C1WgV7UwNd3pLh9lQDj1/1l/Oj2ofxSGM6ePL1Q=; b=Iv1Vd0RyrdjzCyaTV5c+jYBrn5
	nGay6NosDdgKb95REulEf5aN5rYvz6AtQvBp/10yhvaOzNCjkQCuF40XLH22PbvC/V9G9MOATaoS2
	Ai0e74eIKpR2mBTGsoO9LmISGlzP7yj38FMH2dMjEcrSuTqsV7x2jiSRIengieZRMwrA5n1dkp5Ey
	2pSVwtpnN6ylUAETheXCG2ZowbiutPM+0ZSnxoiU7KfiIn2lJVF9lIAfzMwx7R8hUf/BN3FPA4hzs
	xslKM5pSZD9LdeKA5GlCUrfa+meHpozsEhAV36UN8psDKhCKF6meH8yw38ceN7Na4N+1NtvnaqV0E
	qrf98+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ9Y-0000000HHea-16ZT;
	Tue, 02 Sep 2025 12:30:24 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNcQ-0000000GTIK-1c5j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:48:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45b7e69570bso25815105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 02:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756806481; x=1757411281; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+AE+C1WgV7UwNd3pLh9lQDj1/1l/Oj2ofxSGM6ePL1Q=;
        b=U2rgcs+nl5+3M/YE0D0iAGLY6YmU/3M04wkjqglXvCGYhEhEpeoETORW0dQAKxuC/R
         yOvlR5Y2G8e7JaMc2mTDpFyDGeCaUIqhj/4ZXoCyCJvMkyAKqTVnIe7DOzwCLTNuTn1c
         f4b/u46mcHQLlO7iaS7o3exeLoYDauPkp0e2LAdXupzI1sSS493hIHkpzYn51VZwTQw+
         dtKqAJaMUuaGKqDTjcP24eDZEy41Sfski/gixVZkAOGxm8BSD6OxuU04JFa+C73mVlui
         aRpn1uwvBv138fIVcREig2ErnKWozN4e2Hee9neyc/U1BCK+Oo+ajssMLrnqj1lMKwgF
         2Ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756806481; x=1757411281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AE+C1WgV7UwNd3pLh9lQDj1/1l/Oj2ofxSGM6ePL1Q=;
        b=reBTopxIr1ZrAlQnMOYopX/bJHPEHIFUcrAZV7LZWSK5r/FI4jdecwXXr77AkWhGWI
         rmszo1DiKwWXONffvHE2XRvj93778uuFr2gEa+J6voCtSeEJMFLLxtSKc2quwIEDx1KK
         EPuvAguQLtogLJmeWsQwPoEFj8djRGwiZj9DScdref118OGQj195arbhG2Zd4x1jlByf
         li35Dbt8Hfunn1AUZaNsykFnScq3VWSqjPAVh2PjiNxL+gWo78LVU72RrsOxawVBJHjF
         9ydAz5gZdDtn+ox7A3LeaCbP+thubfoFNnvG+gaNmHXWtTweO9npM8rnRxXQk+ICz7QN
         SlXA==
X-Forwarded-Encrypted: i=1; AJvYcCWsc8cdhrkjnAcyYdgBfPLQ6ecpk0kDQzBJRcz9suXX1uAw15aOG12x/NYcaLkHUDbyYGt/fD8LeaV0FMm1Oc0x@lists.infradead.org
X-Gm-Message-State: AOJu0YwLDomk9lqiUyYizrGR3YNw0SdVoSjyGjkl1EWB00SaMleNAxg7
	apJ+ShFFQ1RsWNakereGTOszdVzMQCanu99ggU17y8MM4DEOf2+IG8gE6a+qkUakW2E=
X-Gm-Gg: ASbGncsRmulSsnXpNvO4RPSjdPNyAOTZ+q7rnj/X34oingod5lZlj7fvtR48JGP4gKH
	5p1HVvRPVwAvhy81wW3zb8D2SffkoM8CDa7PeGuaMZ5ytTAg8qqSF4UboX6jdXrkS04+NeeC42O
	d1sunRm9dk4AyJhWYfh2vZc3cOxqIJCxwbkfwthL35UBAb7aWSwOCPwuo4N7vrld5NDYqyXXLiv
	sTy8CObIjUpdLe6lUGFNDKxefrlOOuQV0MI+/fbSgox95Qn/S0bpdwLYZIm7u1UpMX65rqaTSvg
	DpTBYghskvMASh2xuduKc983DHwL8Ziz5pd6cp6A95LTekrKKhBaSi4EAwUmZJMQVWJ1cRu3v9i
	SZ2MhVByNg9AorKyHf/7uGHUeFA0=
X-Google-Smtp-Source: AGHT+IHkum6MUnPnlTSyYdYK5PmduwrE+Bc7PlnDr2fgc28ulaODsmsfkztByA9uDZd9M5QRVY6Ofw==
X-Received: by 2002:a05:600c:3153:b0:458:a559:a693 with SMTP id 5b1f17b1804b1-45b8557047amr89974305e9.18.1756806480844;
        Tue, 02 Sep 2025 02:48:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6f0d32a2sm294964805e9.9.2025.09.02.02.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:48:00 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:47:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org
Subject: [PATCH v3 3/3] arm64: dts: s32g: Add device tree information for the
 OCOTP driver
Message-ID: <7877e1958fa92df92b2b5229365c86493c620c8c.1756800543.git.dan.carpenter@linaro.org>
References: <cover.1756800543.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1756800543.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_024802_423940_98815797 
X-CRM114-Status: GOOD (  13.07  )
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

Add the device tree information for the S32G On Chip One-Time
Programmable Controller (OCOTP) chip.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: Add the device tree entry in the correct location based on
    the 0x400a4000 address.
v2: change "ocotp: ocotp@400a4000 {" to "ocotp: nvmem@400a4000 {"
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 7 +++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 6a7cc7b33754..d6a9f61394d3 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -355,6 +355,13 @@ serdes_presence: serdes-presence@100 {
 			};
 		};
 
+		ocotp: nvmem@400a4000 {
+			compatible = "nxp,s32g2-ocotp";
+			reg = <0x400a4000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		edma0: dma-controller@40144000 {
 			compatible = "nxp,s32g2-edma";
 			reg = <0x40144000 0x24000>,
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 61ee08f0cfdc..f0e2a2907431 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -408,6 +408,13 @@ serdes_presence: serdes-presence@100 {
 			};
 		};
 
+		ocotp: nvmem@400a4000 {
+			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
+			reg = <0x400a4000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		edma0: dma-controller@40144000 {
 			compatible = "nxp,s32g3-edma", "nxp,s32g2-edma";
 			reg = <0x40144000 0x24000>,
-- 
2.47.2


