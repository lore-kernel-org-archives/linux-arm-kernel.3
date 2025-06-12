Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E369BC7114C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wLh0Bfznwrpy2ODyPunjDZzKz1nyvlK3wv3RxF8avk=; b=VJuJ81L7y8P0jo2DRhBI9lJ1qe
	FNhHN2s7edi1wjcou7tPAxcElAIFsNjBOnwMzBC5HnnqKtTqETlsMk/D2edEiVEosM3w9i0Yp7Ewd
	xeTQTS/qRMYiYRFtKVtPKAhC+Z5AYhLjkJxjNbJXpsLuMo7RfH3HaiaF9BCWSSjfOnjFfnU2D67Dp
	h6KVPX035PKw7c3/T1ISZ0pOG87Sqo01DawBvpzrzc/oVFXRY6GHlyh0kiBavhUtfci+Qe73OcpCu
	HUV3gtTvYEvzfuzVbtYIWCXuqr/MD7Pyeh8j/0/WarUkl+a0eBxydNHvqqTxoWHL7gMCin7vJvw5C
	sE1qpKig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowQ-0000000EXIE-3Sqz;
	Thu, 12 Jun 2025 20:54:30 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPiEM-0000000DV6s-1QNx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:44:35 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a4f7865b22so186897f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749735873; x=1750340673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wLh0Bfznwrpy2ODyPunjDZzKz1nyvlK3wv3RxF8avk=;
        b=IzbySmYp6chKmJdOb5MQ0iUagJf0/1iX+9x/FypZrPdWULEXw0/X2FaYJVyta3rJwz
         SyTqJUC+9si2lfdWFzUoOftYVN29027plzy7sBDpYETH71tniB+C2b5RMidCEUAsCk2P
         vPzJi7J2yhZLtZldRNCzcidc4PHxPq9LC+fzAJwGIbEuhyNu9kdTBzU23dDmdWRyVeLj
         WB12ABM6BO2W7OOdhg7N8PEawmLo1490IZu9mjm54FL3FCPZmg5PTBjGu7gaDjUI/Bj4
         yGTpj/d6ib83eqwJOrsC0Ql9exxHUG5KE0BlSavv9HKFVdmpe2vLSKQM6iL95g6KLDAm
         vyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735873; x=1750340673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wLh0Bfznwrpy2ODyPunjDZzKz1nyvlK3wv3RxF8avk=;
        b=ipfECWHoz7LBVJF/B003y0wt082MayutVI2Z77D1SiIFozo3OW6/QJYzzseDR+XEP9
         3rV2mur+GdFkFGCcuEJcYtBJj154yPQvlPybzLojw24nRFOTRc0S44+guyAjpNFWgQPp
         ioYFIxcmKZLXMRim7Lj/viDABvIadzx7E14CfYKIqptHN/ZWfVCumdiWBioEc+WeZqtt
         68Wnv4DL9kYHIsMRqXXa+qtBjjrGiiLSe99+k6f0VDjAgCKv4MT3Vjb/mLA8cTgB22F8
         BAKOygG2I/30i+qM6VPcQsFdSLEvkBXDyzOGzIoD/8DtYnBqbBYroxuYqSpSylL+HEC1
         EvEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBFkLZ6dZQQc2bEWqLWiaAKmT2qw9r85i9UZ4KMuecXGMuHbveVuqX7fzU9csM/K6DAA4p4uw+ycBCefJHRIWB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8g/4CHm9TGXlSuZwcZzTWY9PmC5hM1DNN5FXy8WWM+8IP9BW7
	HHKFTvOEOtrrXA/rduJ2X4cxMQxiV4vfoNxOJ4Z1U4phU4Y88suLSmwb5TT+dDjUxMI=
X-Gm-Gg: ASbGnctczcI/dqqZgO2MIqVJc3vse56rhCLc2A9IkC9HO020JnZL6wDJcgShdGpBypv
	c2zhIIy1xhBVRTFJlqLwbijN3dqkTMK8MxD2Vw0c4o5lHea1yai9r+hKRFE0tGF1gk0lNBSlpPl
	pROqhM+IIWJJQg4gQDJ5z50l7ZgFnRPJhuQPtUDbFOLKOvDWeJgBz3v2bSa4H0pXTue0fwdhHI7
	5xbfUDbgnteDYd6hmWmdUF6l1AgZ/WtTTV1ugxMqJNy20NDJ0/Uf6FMxqyZkICpP1DrN9vpz2hi
	whKCAsBRYK/qqAFsHbOi2fwMrBXo+RynxJ3RLZcPa+XOZjIUmv8Yo+AyRhIzvllga44FyeCKiQ=
	=
X-Google-Smtp-Source: AGHT+IHtHbOKUROa0ve5oP7CqlT0tuVP3Uhvzz+OcfUoUTB8LdEAWIqsjOFYSVDtkpJs1KvalbK6XQ==
X-Received: by 2002:a05:6000:2409:b0:3a4:e740:cd6e with SMTP id ffacd0b85a97d-3a5586cbc4emr2389747f8f.8.1749735872804;
        Thu, 12 Jun 2025 06:44:32 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976f13sm2053661f8f.4.2025.06.12.06.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:44:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: defconfig: Drop unneeded unselectable sound drivers
Date: Thu, 12 Jun 2025 15:44:23 +0200
Message-ID: <20250612134421.95782-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
References: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=KY0F8+kc7mm5xaiPKfTg64NGT6LMQadpTVG2dcSzIOw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoStm2S0PrTSvMJ4T068lWmaIsuO1xRYGmPZ7xW
 PrQgJMoVw2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaErZtgAKCRDBN2bmhouD
 17NtD/sG7Qwg74MQDSYs/mqC4KOD2fT4ykjXIqRK6biOw7HMjliCiQOw+XynSblUFD9TbDeyzqT
 wIL4LCWYQ6kd47NBX8GSUpB/ShaOaI09o8Nuy1Kvj8aEljhdiGp4ckeF295qq5RG3oWInFtoM5Y
 Ld1HGX2nOK137IibuLsWIZ2ZNYbWdHCfIu6ZJi2KGD016k91JQ7RHI5oe/O48vpG8smsfj88clN
 D+d+D7N3TACVgoKNVdvwcG++7BfJHe/0N0kc/KcYGAZHkZW0RxMRV5CRa5JTFFT8HcofN4enuDQ
 tAJvQkDehFT+nBaBrM7fcnC2yO1q7SPya558nohVVCvhDhTgxuZsMEkH+1HMhwKU9IrEePtSGLB
 kvhxRHRZkeRVjucthVP2BvwQTOyzfsdGGWN/h2bVSY03neVozbnN4xg1jtBDtGDYwQ09NmCpykW
 xuEhh8DUGiQXNfvIgZu2azW39j6MrXpfIPSpY3PUarMkn9Hu/YsUtylj9Nk85JewomYhwYmsdRK
 DoSNGbvJ2vuJG3IOsdCLweB/RzSo3K3RgXz1/OJMl5IcAnQX4zbf/k0QYip6Iz9mrwZNuP5asAc
 hMFMPaGNU2Lri7c8q57FPcMmeXna0xFDfiEBqGfP/ESJTFcH+68lzwGlgAhFImmUaNS3AcKdz38 7U6Cs+MlvUiIVcw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_064434_375546_76621C2A 
X-CRM114-Status: UNSURE (   9.24  )
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

SND_SOC_ES8328 is selected by SND_SOC_ES8328_I2C. SND_SOC_WCD939X is
selected by SND_SOC_WCD939X.  None of these are user-visible options so
their presence in defconfig is redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev
Cc: linux-samsung-soc@vger.kernel.org
---
 arch/arm64/configs/defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 14fcd0a85f5b..a47e1616b4ef 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1057,7 +1057,6 @@ CONFIG_SND_SOC_DA7213=m
 CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
 CONFIG_SND_SOC_ES8316=m
-CONFIG_SND_SOC_ES8328=m
 CONFIG_SND_SOC_ES8328_I2C=m
 CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
@@ -1075,7 +1074,6 @@ CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
 CONFIG_SND_SOC_TLV320AIC3X_I2C=m
 CONFIG_SND_SOC_WCD9335=m
 CONFIG_SND_SOC_WCD934X=m
-CONFIG_SND_SOC_WCD939X=m
 CONFIG_SND_SOC_WCD939X_SDW=m
 CONFIG_SND_SOC_WM8524=m
 CONFIG_SND_SOC_WM8904=m
-- 
2.45.2


