Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56236CAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5a/ds1gx4KqC4K8yXIVPx/dn9m17Z3x/DqzQJWTDvYo=; b=AkSfGbDlttEHx7j8y3gA38hD5g
	52AOkxF4G5A3gNYbHA6JX638rRXsRTxrNTCbdp6Wd93gwRc7gBn9vuj+5WLMszh7Asc6TF/xDu2XK
	ONA3y9hSAECoRPab6rSW0B/sraFSsqVjk+rlN0ALfkm8gaIrXoCR9Z2wP6ms1rdOq3RCJ80utQ6oL
	pjz/gNqcqNffhHbW4zM2Qzp7MRSprgMzhtlGdCjbLRyES+4zNHdUq/X43qPPMoDuj5gNfOvM4/Xp0
	8rTpuzqmEvz8kXUmV80+h5ESj3kYtt5Ya0NI+FSTI76zWQqjXQMnkVRA7ta44DVCLulqpinfcD5+R
	oI0iXyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzKL-0000000Ekh8-05BR;
	Wed, 17 Sep 2025 21:04:33 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzKE-0000000EkbS-1Ok0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:04:27 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-76e2efbd84cso2970946d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 14:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758143065; x=1758747865; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5a/ds1gx4KqC4K8yXIVPx/dn9m17Z3x/DqzQJWTDvYo=;
        b=CFKJ+gqJd+g2RZXVWkYos9nSIPrNLJaQH90yAG2GueYjaiTZLiX2IS7Zgq4G4+47TX
         D37gSp7SI0R17d3ok2YlW/gvdpkehQXE/9oep72cHLfvUdw8wBoFanLzuXvc21Dv9+S6
         Mh1TceLJ8U+I4N2BcnW+ORtdhzgUF8yCls18g0cZYvWl9lvnD2L9mSXpyO1H2e312erT
         uvwU131uiBr3W5NyQKaBFJx+/QSG9v43oXKSUbUL63FHeK5FHO992WkPDPsT+8SEbSaz
         uc1nMrP07f7BZhgW8mZI23eOElzNqEqa/qZxS5hT+HSOAqQnaF28+vMIro8PiRm4lC8i
         bz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758143065; x=1758747865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5a/ds1gx4KqC4K8yXIVPx/dn9m17Z3x/DqzQJWTDvYo=;
        b=NNdmzT+YmpJwzcRCpdmW7qPicf1Ion6cE+XbWv4+NmnE11AvafE+5pdibqdtsDIsP5
         nylWvs1iMA7tOiQOs09v4gxvpyBIgHDNx3rGbo3jFQemm+OXqccYgKY187maC7ugZg2M
         7s1UHz/2FvwiQuWk/1c8cxmXanfQrhr10h/UBXzx9wv5uulVfHdrEAXUd5CRtV/20wdI
         2Vozn1mCySiHpWqinrA/6E9CQ4WhcDJhOT4JVtP2kVPsgaZyCEmjP1bG/C6GkWw6nAy+
         xnE4axXafCgy3E6KmvFpNsN4tIbk2cdNUNKb9kwiJ55x20UmyCVifGhNSfblRJr/XApF
         kZfA==
X-Forwarded-Encrypted: i=1; AJvYcCVswIVfO9xa+jyYH5/n3tqiFehej4aNEvlbR/Nwp2ipihFIvOnRFEVpm3ADLmkCarutJqgWSRmc5QcA5jnih339@lists.infradead.org
X-Gm-Message-State: AOJu0YypwsB2E+RNVt3haoaiognMXlbZmBYGDc+yBtbqwvGdXURTx1pi
	1PR37AAV2mlz4J7mKhMVKH0MLIfZVGakQi1ains6J3ktjztoOReMzDAORFjtaQ==
X-Gm-Gg: ASbGnctAodsXV9g5yta/BVf20NJ7sjtL7RToDuViI3gPNBBdFxpiXFazvbqvO3ADOA3
	17nNgbZN6BlnUBmAjB/m2yWMOZHhFGsbvKswaBt01RVsiGU0P4BT5YF9SB/ttO0A+b2yisTISeJ
	j23LOuUrrsoN4UANMBH/DI4ZVNdsHv8Rxx685Y1VfJ4la5Cz0Rmk53PilcUOM2VEDOnUT/jWXs9
	TKO5tzGUFXmCMxl8X0l6Rk08erIU4mIM22X833LDCrMxZ8QDa5SrZ2I/nESXliLa4Q/cC6Onds9
	OS3RcdeO/wy/IYtcFbhlgP3Cdt8i8CwVx2fVOoerb8wP3s1OV3fQau1kqefsYRm8CsjWAaaQe0J
	pb66dyHKeueTGcRKg0cY4T/CcO9IvE1l7GSysiqQSW1kz
X-Google-Smtp-Source: AGHT+IEEobNY5mvQo9Hoc9jbKWSLBHZgY7wKDYM2glD4z7n+JJRlXvy4lKtWRJ8ymIPk5RgLmHss7w==
X-Received: by 2002:ad4:5763:0:b0:77e:aba2:c8a7 with SMTP id 6a1803df08f44-78ecc629010mr31219176d6.13.1758143065008;
        Wed, 17 Sep 2025 14:04:25 -0700 (PDT)
Received: from [127.0.0.1] ([51.8.152.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793543ffae5sm1897226d6.53.2025.09.17.14.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 14:04:24 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Wed, 17 Sep 2025 21:04:22 +0000
Subject: [PATCH v3 2/7] arm64: dts: exynos990: Add sysreg nodes for PERIC0
 and PERIC1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-perics-add-usinodes-v3-2-a3629e4666ef@gmail.com>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
In-Reply-To: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758143062; l=1456;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=JVGWbht0AIun6Qjlh68teSGaROXZ9yv0IlF+VdPftK4=;
 b=6YOZaTcSHvbt6omPx/EzhlCOczx1Vt1JC6Z7lBiY+k+fv+DTJVQr5K5rJxYxFGWXUnLopLalN
 4qogKvi13NmDJL4ihOAbEtFSO5xBLAvVjPCxZuEzyirS5zMFPlakKAf
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_140426_382976_01A72135 
X-CRM114-Status: GOOD (  10.05  )
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


