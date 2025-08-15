Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D43CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 07:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGNseYWJek5Azr5uNJhZwVkFVh/FoAy6ND+2oSz2dvs=; b=vcELAbMWrZqwgHDafw4bDVCN/d
	XCIaNDEtmb7TWT7hf48FrOGfIaXhypEOq6pyxZKKcK3j103PWASMxoJX7DEGkMzN2rH545w2y2PpS
	InxpYfP+/4tE3KksUpgXzcSxBHsvr6H2DS8Xq9q+/DJiOmLddPpUGc2mwm0ia8/HHOG086lT2CZMR
	Qf7Xh8Cnm/JCtvYzd81bpBZn/qOkB4JuOrmyEnuRwECqgbi/w7ghype3IlfMooWAuw8fz6K7SyTdx
	7XbULFYw6BByeCojxaZGgHt2zxN9/yLDM2txMcEBvEEomu0ydZJhQpfjzxmjMwrrBBaSMCyjmOTsS
	73KuNaCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umoaA-00000001hJm-0qoE;
	Fri, 15 Aug 2025 07:10:34 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umoV3-00000001gAg-1D6n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 07:05:18 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-afcb731caaaso231711866b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 00:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755241516; x=1755846316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGNseYWJek5Azr5uNJhZwVkFVh/FoAy6ND+2oSz2dvs=;
        b=g35kUpigCw2aE+5R/3vYKQuDZPcspRQmlEU+Qubwep0F8q0GKOGNZ8RPrJ1koHubrt
         XQSVu5sIrv8LLFjzM5wn7C4d6rpCfhTr+5PBinu3WL55iAskHQScA3DSvh80Dr8RIgiY
         /wNuq2XnG7fzWuDtgKkO4ei5tvkYa8p6B59cF6MR61BbX4vOL+6IxcduSvyszSMiw+T3
         CGHW4gJX4NynF4XdSxImWsTE7PPvHcVNH2LCSmVqyiuEqk6rcF/YJDHsTkCgSnL+xUtb
         WqDuKZE984rI/nilGWLFEaZwPN6xQzoEZvt/OTsqoDaW4Uz1hRdh5gSPrJvNqnLE1a7T
         qeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755241516; x=1755846316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGNseYWJek5Azr5uNJhZwVkFVh/FoAy6ND+2oSz2dvs=;
        b=IlqwJhcoQPQiaLU/IONu59aWnKzj9tr5vMpdn2IGm9KwWWKDKeHAQhE0iaxxVWIPhT
         6kL2gjhm2ahfuvd02xeIe5QaswIvmo3TNkoYZjM6VTp8mrTvJFzvAJ0fxOluMf2pwZBL
         4cPhAX5QsobIeF+7+iGOz5cd+BIMRFWOWYxvnSHksp4cF1iPFBpxGKM1YVi/y4aQV1rz
         GapWzLicIkBeXo2d2eeViQpXNWxm83OAGcTuNZUnuLH6xhfeufRNOsbyhJRaeLpnXrei
         LAmfBx5mrcDmVZSfpMIG90+2SYmO+fmkdHmvoYXISk0QUoP/Tez85MCOhzZV8YMgzJZn
         8kaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr2i+aV5Y2zoPfDPbjYi6rKksL/hBozgMwRqb85TcnV6kUh+YXXbLd5PVIDmfyGeumA/lLfSevT0Kvtvzpl/sa@lists.infradead.org
X-Gm-Message-State: AOJu0YyDXox2xwpTKJIs9ihsiRrruw2dZQC1XRAC3YJIOgW4nl3Kiqp7
	QKrRQBksNZ+cN/KKILz5bPRTFP16R5Lco5f5idUDyfgX8xSyzH+a9+5ukyYuWg==
X-Gm-Gg: ASbGncu1elEBRmZnPbZJvNF31/xNMrdJH2+TysSqEPHoCkxb2TGOQbCCjppZWo92MjZ
	rLfhxIfRJTvO/zdPRIrZOFToPl2grL70MIW0xuml/rTXuCEx1Y945HeZOVspuq0McGTu23v1REv
	az6wlVT4cuYyyK0fHZX9RHt/PPalHyjOIStlNpDOF0NySB1YFb99gq+mwbq30Q2pbe3wgFXIWMr
	u2I/iqjUuhdQ2vrsxACyLrbqGgO51Iv47cWGY6Z3b7zYDhojXfQeRJPwR+kNWf98xahbAq68MAR
	MbpsH3UkFo80+8C9Hq+ropA2KhgEVeHvuaQRgZRnXUrn6dwDPtOgHclZmFczhxdHzEbaJSxQl4A
	FXViREQ13k3HLtsovsYYitiZ5t5plrHqIQ/lI/U9sZAN3GIfFRnJzDIaUx2kxJpFeeI8VLMdOMr
	cxIGfa5dO4
X-Google-Smtp-Source: AGHT+IGj7vBYUE1quBMaFjbNLwReG7Th8g72pDzSLCH8avdjLFGI6YWDdzOBtuyrxZNJ6yrn4QIfCw==
X-Received: by 2002:a17:907:7ea8:b0:af9:38ed:5b49 with SMTP id a640c23a62f3a-afcdc2062c1mr90228266b.5.1755241515430;
        Fri, 15 Aug 2025 00:05:15 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfcb2ddsm74269266b.74.2025.08.15.00.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 00:05:14 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
Date: Fri, 15 Aug 2025 10:04:57 +0300
Message-ID: <20250815070500.3275491-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_000517_339573_AD751884 
X-CRM114-Status: GOOD (  12.06  )
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

The '2' in 'hsi2c23' was missed while making the device tree. Fix that so
we can properly reference the node.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
index f618ff290..5877da7ba 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
@@ -1438,7 +1438,7 @@ i3c11_bus: i3c11-bus-pins {
 		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
 	};
 
-	hsi223_bus: hsi2c23-bus-pins {
+	hsi2c23_bus: hsi2c23-bus-pins {
 		samsung,pins = "gpp11-2", "gpp11-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-- 
2.43.0


