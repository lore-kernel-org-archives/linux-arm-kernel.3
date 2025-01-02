Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A9BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 21:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ud7PsJsut6RiZUie7gXQBvGk8UPj/heMFBlNIkw2jkE=; b=PDJ23MHn/+bd9pLlyzkwkOKMbR
	quxXUEGMTIx4b9PqPb+qoDbSo+pTudRuqO4Bzy7fWF3QzntkfCcAS7elvaPzLiiyXHD0UNCy8pis8
	fI0SiS0bqSwxZZAAbMCsL+DBV2mLLzsd8Ll4YCzZbC7H8SaIvIiWb7tVcQTBVJET4pi/kWeHoWpcX
	SZ204O/02J/2kHGPnaS304FayEEKgf2wJjfXjEuxSPcOnlFTY4QTzl4ljIMNmcxKBti0APxxWOm9G
	A3TFeyPFAGFON/Xe4i4cPu+qO1rCCRZmHos6AJ3C4A1TXyKxak2lWmrIQM7oJGuUhfEAnktvq6/T7
	hSmh/ggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSNW-0000000BSmS-1DjI;
	Thu, 02 Jan 2025 21:05:14 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSHb-0000000BRqc-2fYa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 20:59:08 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so18852938a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 12:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735851546; x=1736456346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ud7PsJsut6RiZUie7gXQBvGk8UPj/heMFBlNIkw2jkE=;
        b=NN/djQohOOeBYT+2A4xLU4pbi+9G0bWs0DNdoUMteTo2joyEQcreb+8eLhBrOw6Xc8
         gzUUwamS0iY/XJqmhQAtDnWA/Tc/rYPBgQQAxhSHAe40I5WMh7/g14mI/SNmNYVEayFV
         KBRdhMdEQfTZHD8Xx5g5+De1hWSomuqNu84G00hW2uKwanvA+YK1YYDSrPuMMMz1N8zR
         hDZ5RhgWXFSjFjZP0ED2rWipNUNbNyDNF9KDOWE1B5VvQocebwSMh9FKRGKG/CzTmcSj
         +LQmiSss7fRbwVlXmzk+1jjWbMZfSjaSxKTOsdfIKUXTAO62E0FrEBae+vLxY4paRdEV
         Q53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735851546; x=1736456346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ud7PsJsut6RiZUie7gXQBvGk8UPj/heMFBlNIkw2jkE=;
        b=i4SUCCPvc5S33+8fofdZVkQp+SD48PR2gXwmLB7XdbCrvqBbQu5oAIWKGvTRRVU3Q1
         4AYyGAk65CFS8KBbOx8AyraLt/2DoxVK10q1fYL4unChvBedFs5VabHDENxm5Zdbp4L5
         VM+4g0Z6sJ1fzqJYltzhx2nFW1uHiGp7btI1+DcAU+ukabC7bGFycxsf7oEXI13dJ3IQ
         Tl1tta+B2zrdIrr1KKFzZ2Dx6gq6Cq+bTFn9XhWPOUF6ZGMsHmGLM1XNKNm261bhZ/Aq
         V7mIRSkRFcQ/0L3rF85pmZ7TiD+htuqoskPK0esHBU4WSHj/4k0aNfowYkPaiWRS9p+H
         p+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWJcNz895bMRVKB+4dSCrrrWlEJFu6lkWexk5SCXnzd48axKUU3vDToO2a0AB8VFuMFCk/ohDPzEjjSDHyfXN/p@lists.infradead.org
X-Gm-Message-State: AOJu0YyXPl7woXq/Dd5FEfH9hYq4lWEch4qg0ntDmpjNZPrtIeJ10uWI
	meIO+mZrl8m+tGi4oW8RYCGjHIy392t4eJQmbAEUil+NNU/B0GGa
X-Gm-Gg: ASbGncvhvNKnuM+px8KxS9KOwko951BOVtpU68gfPDyb0XjFr4XZJ+e4mUXalM/ZUUR
	VQpc+UZXLr0TohfcPgCqywXCYqx19tZqaa2P3Xw4WxPGHGnParz8avfK4dHY4RoT4n2nPMLZ1GW
	VpRzD7zsRrhFiLQiK3GKCVMKntzuaAxc9MnI69ATUmXCpB9x8qOBs04k9auYrOn3ld0CjqMl7HB
	g59egMX22MUNrQqAWwduNn82SwAqc457C70uWcPMqRaxMsTueTZA505EYLRKk0YJF4SrLFcdo6z
	gBNQDj0ND84=
X-Google-Smtp-Source: AGHT+IE4jMJcKrz5vfMV9R5af6veXwOvNy+Ggg5xTG8Bq48eb3GvnXf01/g7KbEfw7Z1ZhMWSK9TUA==
X-Received: by 2002:a05:6402:354b:b0:5d3:cfd0:8d3f with SMTP id 4fb4d7f45d1cf-5d81ddfd82bmr40759079a12.24.1735851546217;
        Thu, 02 Jan 2025 12:59:06 -0800 (PST)
Received: from ivaylo-T580.. (85-118-76-61.mtel.net. [85.118.76.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f397sm19231026a12.22.2025.01.02.12.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 12:59:05 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] arm64: dts: exynos8895: add a node for mmc
Date: Thu,  2 Jan 2025 22:58:45 +0200
Message-ID: <20250102205846.223955-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102205846.223955-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250102205846.223955-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_125907_673781_2AF9731A 
X-CRM114-Status: GOOD (  12.97  )
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

Add an MMC node in order to allow devices with that SoC to make use of
it. It's typically used as a secondary storage option for SD cards. In
the vendor kernels, it's labelled as mmc_2, but since there don't seem to
be any other blocks, treat it as the only MMC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index f5551832a..537d3eae0 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -1296,6 +1296,20 @@ pinctrl_fsys1: pinctrl@11430000 {
 			interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		mmc: mmc@11500000 {
+			compatible = "samsung,exynos8895-dw-mshc-smu",
+				     "samsung,exynos7-dw-mshc-smu";
+			reg = <0x11500000 0x2000>;
+			clocks = <&cmu_fsys1 CLK_GOUT_FSYS1_MMC_CARD_I_ACLK>,
+				 <&cmu_fsys1 CLK_GOUT_FSYS1_MMC_CARD_SDCLKIN>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <64>;
+			interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pinctrl_abox: pinctrl@13e60000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x13e60000 0x1000>;
-- 
2.43.0


