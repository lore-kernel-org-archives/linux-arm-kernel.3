Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB65C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 20:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhhHYs4KoUp1Dmqe4WieRh0AOyBX59ZVEuUqlgb/Xa8=; b=J1lBDf0pfmlW66w0FXX7aZokvU
	yZBLCcn/LV+AjGVrPde6zQB5GH6EXAeYmHCwUPqZm+Sj1jfeTjRv4m9DKiWZnxYIc57t+iTtdCfIn
	YUkDStikGN6cnpONt9pnaIiBlvgPx02jDTP1dtoYY7M1GCJdxI3bXeR++AhBFqMOqMs6W6svCq7oF
	JYTx5BkUmqIccBg4rgHpebJKj8E9MWOpsaGhPz5ZFpiKmPtEYPzTk3hCodCvAiN9ttFY0t3VL+HSr
	NpV7ZyGR9zYyxTsatIB3vhEfP35VthWDBxT0U+6QTJKosEV6darvWgBSfz1y7PcBKEGX/TJi/a44L
	+svLzNug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8PKr-00000000lHG-0HaP;
	Fri, 25 Apr 2025 20:07:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8P2W-00000000iCK-1n3K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 19:48:49 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cf89f81c5so2492995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 12:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745610527; x=1746215327; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhhHYs4KoUp1Dmqe4WieRh0AOyBX59ZVEuUqlgb/Xa8=;
        b=g1cMDrbo5iVqxlL9r5D3+kjKEmH6c93hnt1+tPf7sL0MVgDHZjhpP8PrE2/B+jeouu
         hA84su0x4A92yf1Z0oOQCZyYQ2OAFnM7jhojZ/QVACVMcGxObN3I2SUVyv1BTQgjDIpR
         qQ6QaarHdvEvLQDG6wfWzR3KXMOyLw6yGAHWnnpqBXbfy13gv6l/8a1WYewW9GvUSBBO
         ILDYDGYLxGRzTwLPSEPe1NFYs8X5XNLAz7nFV6pcuuXE5Gt3w8E8WbB/1zUgeDPmi4T5
         0Z8xLSh5hxtkaHPiigkM0gEdEwdgZq50Xj+RZn6g8P6gpDt2m8EzXkxsOHrtTELyP1IB
         pDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610527; x=1746215327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhhHYs4KoUp1Dmqe4WieRh0AOyBX59ZVEuUqlgb/Xa8=;
        b=asijH9Iws9wKDzCnpk3t9K51f811YmH4yaerrTAs+haN599QOa08tXl2zzJOBAUncI
         8nfQcFbosl4Q/68y4xEdCXb1J+mt9UTl2uQX8ectoMBKkGy2RzwVsQPifFTx27P/DpuE
         GB/TQX7a4xuoPvlqWuOljmU5dUz+2d8hM6wKli5+qUV0urMg30vwrTobO7Mj69lamzAa
         4WZu4bJsitBFA5pEUYksjLnD6IOocpwCF2du+cq9bQ+mumkp+Z+5PSZCKOsRRkbMFR99
         AKlXYA1LY1VJTYSTEJb6MhqiNqXMDuehIIXPVrBoclsQ8LopLrtNg1gVy6Z/TXx7iHmA
         Szmg==
X-Forwarded-Encrypted: i=1; AJvYcCX0sgbwB/VQ491s3/7YnbipZlWkbNf/3HmAyk3z2wABy4H0rUXUxqjqsLqEjEDWC/5qxX2zFOod8Y9ROREenpta@lists.infradead.org
X-Gm-Message-State: AOJu0Yxru+Taum0SMuXWTtShRLuYNTxeHwtzNGSHWzPnLdg23SPe7AE7
	WVuU+A73cO3+djNrE4rX+0hgCmlQG1RB95BRyew7eEaZMuqHaGW6aPWLIxdhs0Y=
X-Gm-Gg: ASbGncuC9zXnuZdWFwZNVePcLql7oYVDtMaqKFFR7EFPiA9KGfujwvH54jo/dNPlcqV
	7dbfGutD8q12U25fIJe1l27zi8M26FvrhKwN2M5DZIX9vL9aPzmtdRxpAOJb2Py93Hqz767DqO9
	3rfOY8BSAQ3UmJnymJyBXYPVulexOHOrn/IyUCcPqrd7U3Kbl08MkYCIvS58gQcuLBDRMD3KQal
	QITFREXqCdJ9QSwQknuxQ1njySQfN5bORQR/1wTtFuMJiUHEjxY47OTavKm+VgmL3U1fRSJGUQm
	RE5Ie74RcsbqFeEjSqYtOQ1bSZAq9bgcdpoUYRcALLjsGvvi37883AxmaLs=
X-Google-Smtp-Source: AGHT+IFLaTSeRSUUGpyQQF47LNee1uEGXqbvZf8eFCoZYl+D6T7aT4sNdv5ZKx6ouKFqA9TQ2uy0OA==
X-Received: by 2002:a05:600c:4e16:b0:439:9a5a:d3bb with SMTP id 5b1f17b1804b1-440a65bb214mr12389145e9.2.1745610526742;
        Fri, 25 Apr 2025 12:48:46 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2e59sm65922335e9.16.2025.04.25.12.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:48:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 25 Apr 2025 21:48:29 +0200
Subject: [PATCH 6/6] arm64: dts: imx8qm: Add Ethernet aliases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dts-imx-aliases-ethernet-v1-6-15b9d5cca611@linaro.org>
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
In-Reply-To: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+HtaD1MMcC10nD909Zao9y6H0hANNmhyPMSU9hKMrJ8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoC+cT4fIlFtHdioeWVc2xOwVr9yZQOrIxjezPT
 BqQvIyvneCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAvnEwAKCRDBN2bmhouD
 10o+D/9wX+DtmPtvlcmDr/mCEaqmlp0wvwGsyDcSTM9w60nfSI5reGe0MqXrtxsvZrs8lKFxznN
 3PjNwe+ZxecVp/9kOaAe6EVlhj3Q3aFouo02F6cM/kLI6W2mVqMj38LgcYgZWbl6ZvP1LxCRXhL
 ezNXFaxF2/0Xhn04nJK22kvW3YgWWwJRyuobDQCd+ihOmaIf2NoOv5xWD58TnjCcsCjNlrbnaPH
 7xRfa4/5zH9LS3YMHTJ8ha9Q0Zh0nDZhoox4fFnFKIr2B2l02aBp2udtZAbaHG0hdjv5LhLp3p+
 ffbw/A5KcrbbJpA/VibMR4w4g9gJtTtRltZ4RJ/bOEGfFM+rzRc9uN+SLTodvJyyE2PJIjRUDB7
 Q3bj0You2XJ7zg/URj/sAbVZzEzAVm8A+4nvAY1E8w4Ib93yWrdWK6C8ns2JSFtu/tAt0D4rUyS
 4Q0Yn2eUr5XEru36ARlvLY5/bMIZIv3t5YBmK7zO/I6i82ILF8eJU1LTqUg0GXl+tddS+8iVn55
 2l74XGR2x7nM+kIr6Lie5OxOZu7h+ncENhB3hj/ZgSmMFSKEQiBTotGYgThX/0q3YrLwLAim3QK
 iHgqpgfu1my2QweV+ZXDV6RpemOo2CZi1XjMpkiDxi1xC8UjjnI/lMI8Mms7NK9J+1ewKm/AHxO
 56TGfJW6cEQJtHg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_124848_481752_B3D1CCC4 
X-CRM114-Status: GOOD (  10.89  )
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

Add Ethernet aliases for predictable names and for firmware or
bootloader to fill up MAC address.

Suggested-by: Francesco Dolcini <francesco@dolcini.it>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi       | 2 ++
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi | 1 +
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi | 1 +
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts              | 5 +++++
 4 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
index dc127298715b3cf73ad93d25aff7b7b56e4049ab..8f976124053e196a556cb9ddf8ff8768ca332099 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
@@ -5,6 +5,8 @@
 
 / {
 	aliases {
+		ethernet0 = &fec1;
+		ethernet1 = &fec2;
 		rtc0 = &rtc_i2c;
 		rtc1 = &rtc;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
index d4a1ad528f650d16e9de22e2e21d2e2cc684163e..28e64cc63e644f249b16c37d4a555667bea2f5c2 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
@@ -7,6 +7,7 @@
 
 / {
 	aliases {
+		ethernet0 = &fec1;
 		rtc0 = &rtc_i2c;
 		rtc1 = &rtc;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
index 5e132c83e1b26b19840aac12d2c1014811c75c78..1f10f31e1e4d40d489e41cc8e65e8673330af07e 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
@@ -7,6 +7,7 @@
 
 / {
 	aliases {
+		ethernet0 = &fec1;
 		rtc0 = &rtc_i2c;
 		rtc1 = &rtc;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 353f825a8ac5db1ac70d1560318c134d188ae7ef..f0bc77cf07b7da73cbb7b438a045fd56ca921d9b 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -13,6 +13,11 @@ / {
 	model = "Freescale i.MX8QM MEK";
 	compatible = "fsl,imx8qm-mek", "fsl,imx8qm";
 
+	aliases {
+		ethernet0 = &fec1;
+		ethernet1 = &fec2;
+	};
+
 	chosen {
 		stdout-path = &lpuart0;
 	};

-- 
2.45.2


