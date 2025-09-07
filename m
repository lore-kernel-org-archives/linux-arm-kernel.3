Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD4DCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 21:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5a/ds1gx4KqC4K8yXIVPx/dn9m17Z3x/DqzQJWTDvYo=; b=ozARVdsAQhESZUKQLMdUSFldDf
	k74096d1+yFRXTbvWEtGfvbZ7Pa89XkrgdBI4iFz1e75tIixjnKHZCLg29+DLQPF5UGZCwUQF0Rgd
	jAwpOUvTmD9mUxYUR1h94i0IAJNeKTv08qBmmy2HYTukdegSZMQjIfB7hCM0I8Hmk1xgX4U1BrTbF
	WYPF3K1FHaZF4emqCLiQqBIxT0X7/F7SfR2mA4qG1HovR/Tl2UWzGFLU31MMuF3mRsSQk7K7rsrL2
	H197vdNMs/MVYwUqnvDJsbsiUuMTucCokUM5uG91p9WmgOMgm08LeAGBKWRNvDhOFwOqul6iClxV3
	XDbDAwUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvN9v-0000000Cy90-04hB;
	Sun, 07 Sep 2025 21:42:51 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvN1Z-0000000Cw1U-3DyB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 21:34:15 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-726549f81a6so40394456d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 14:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757280853; x=1757885653; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5a/ds1gx4KqC4K8yXIVPx/dn9m17Z3x/DqzQJWTDvYo=;
        b=hTYGYVitd5m+GO6Z2/STqHRbD6wF0027PuhSindMXHsUPjlNzVFxklWm9f7iyA+DkE
         Z2onFCQvh57SL/MOaNWBOaR2G07mrUdb9Zgr6+HRPka2iWwzO3bO1hM1EWMG2FzcFmry
         fUk90cAMv+qxHBU/Jv1YecFX/Uz19k0QvkTpvlEy12rr6giNJoYTxhtBJFwQ0l7DvVHA
         n6vnJ3n2efwy1XLMINIkYmcAJeObeYiEknY3oEN6ECt1oR9kdyx5721Q2O+qnoa7j4zM
         vYeFRn4Gd5ZoxcJTvdSOKet+21K53ABoHtx+0rXjOqyhip0jK6fXtGrDE/3upPAj8wnJ
         jbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757280853; x=1757885653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5a/ds1gx4KqC4K8yXIVPx/dn9m17Z3x/DqzQJWTDvYo=;
        b=Q2u5wcleTzPXcLuD9xb0XRl7IQig8LRlRXDh9Xgs+LQfEZkAlafNjpHRh1rRtXpLfQ
         x51ds/LBjCvFtFgFaSHXJ3NpSDUdUlzzG6HexY5vKIRMdBaAC5BChoNgfYoiM/GEhylQ
         ftQNA/O+fXhnSr0IjYAwAgOEbdY5Xt8AnbtrOc/sdFiHA0e2vlmfz5EEc3ke3oLLPW5L
         NKteLPFKEdCZ+V8S/jmKiIdCWf3F8fGVX/mLulnRL4sKQz5X29cnE6yd7bDfNb0aRIIz
         TFh2MgpfnVCFoRhzjk+fEmo5HA8ZSEKU8uDDoBU458tujgHaJdETrKSrFqEj420sSR5o
         j1KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK5ijG+x9gTtTovwN2v1Bke5FujmpHOtIkGXlUDm0rCYdabJ82Io1TNq6Tqy7C17lPjPmCxq1S5+FLxC3jyUHg@lists.infradead.org
X-Gm-Message-State: AOJu0YzOsPBH+C6sbXDiTZ8Zv+mNIVSM2HPYXDopAsgCRXBMQ80FUrvq
	3cGoL5zn9iQVKaQK4J2dW1H4mSKK06mf7azoXd4V8Q72GRsnHz5RriEv
X-Gm-Gg: ASbGncsqivoy748v5fnV+wSejo0/RXI2/U5evmBHdnHlPHTHze6fTUGuE8ByUaw+OWT
	0U5i6axrpSqORuteUNK2XgrZR2BzSEBVfN5vBYW5IjnffIIEJ5lMxFxw5exA9r5Cs0zEffkG4zX
	f60lM+YFGvE512FxH/sQIRJhQ7yPbHffJ5/u5fKXFs/EwaSTfe6Oq+ODm9FFCbOsY1LKA7xw5iK
	SBVEdVMcjNrloaueVQRN6Ilgz1Uh00VROtammtlHdV0TX5Oq8Wst3IAE0lOwm5MPD2QvBc+W4Sw
	W5QCyNdAREiOqDiNtKFOvehCwgCfdtJ5rLEjr9ARXm9JExLKRTjz11J4Xx1iLLNyshsxyt/ZLC2
	C9xIdhpFLfHVMapIMDopcbCgPbdLJc2s=
X-Google-Smtp-Source: AGHT+IHPM+G+GOjO0O2yBOjZ26lUoE+V4XS2kt7UKwhrRNsQwUzyBOaDQpcYiAqKWBmBOwp/wf22UQ==
X-Received: by 2002:ad4:5945:0:b0:70d:cc1b:68d8 with SMTP id 6a1803df08f44-73946e7c091mr61421626d6.60.1757280852658;
        Sun, 07 Sep 2025 14:34:12 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b46660e5sm108637486d6.45.2025.09.07.14.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 14:34:12 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 21:33:58 +0000
Subject: [PATCH 2/8] arm64: dts: exynos990: Add sysreg nodes for PERIC0 and
 PERIC1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v1-2-ae7600491a7f@gmail.com>
References: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
In-Reply-To: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757280850; l=1456;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=JVGWbht0AIun6Qjlh68teSGaROXZ9yv0IlF+VdPftK4=;
 b=x3i6FnOfW1YZIRe0vMTUnnw/gQJifiRBA7EPfOqI9+IlygYAnm2Pxoke4Z29b0nP5dMdbOPDj
 He1ZYf6XHaIC6D7KjMY5ZR/9mmy03Yk54+A3f9trNHJ82N/9scgr55n
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_143413_809577_ADADAD35 
X-CRM114-Status: GOOD (  10.47  )
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

Add syscon nodes for PERIC0 and PERIC1 blocks.
These are required for configuring the USI, SPI and I2C controllers.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 7179109c49d0b0984c8d8eb2d24c0be1c6e015c3..f8e2a31b4b7519b83aa31deefbc40e5edbb8186a 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -260,6 +260,12 @@ cmu_peric0: clock-controller@10400000 {
 			clock-names = "oscclk", "bus", "ip";
 		};
 
+		sysreg_peric0: syscon@10420000 {
+			compatible = "samsung,exynos990-peric0-sysreg", "syscon";
+			reg = <0x10420000 0x10000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_SYSREG_PCLK>;
+		};
+
 		pinctrl_peric0: pinctrl@10430000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10430000 0x1000>;
@@ -277,6 +283,12 @@ cmu_peric1: clock-controller@10700000 {
 			clock-names = "oscclk", "bus", "ip";
 		};
 
+		sysreg_peric1: syscon@10720000 {
+			compatible = "samsung,exynos990-peric1-sysreg", "syscon";
+			reg = <0x10720000 0x10000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SYSREG_PCLK>;
+		};
+
 		pinctrl_peric1: pinctrl@10730000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10730000 0x1000>;

-- 
2.50.1


