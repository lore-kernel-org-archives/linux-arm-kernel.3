Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEA0C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 15:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tVdDAyLthEulzKQwcDXevtinu2TUgGTGa8O6iSAk/yI=; b=xRpupStMqorwDbuWonqbrjOMJv
	LgAt2M3aV7RrMSgTFU/cjTdRKH9GZdjwvYWPWmiNmJH8Zg+RCIuqxWF5EeJayy4c/guEEldTTJNHs
	XgltWbh6Q+eXCPscNUMXIQhza4EPVE2JH45+zjpo0i+24KIztsQExFqXxJSJKabu64mHXAejr/Mcv
	+D8wZNzgJc2P2A6kXF9ZwFXzk97gI2E/KzTllgivnmyr0KG6xH6A089FJ2FkTBYdQxeJZUD1wxAWT
	94soB/16/ENzCv3vK9Iioav5MQvbTkwpMXeHM3ynWfngDgShrPeD78bjuVcPA64hbb17QAV5cIfzt
	ytiYCd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCvZ-0000000FxFI-1q0s;
	Thu, 05 Jun 2025 15:54:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCjP-0000000FvmD-40Z1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 15:42:17 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a4ef05f631so112424f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 08:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749138134; x=1749742934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tVdDAyLthEulzKQwcDXevtinu2TUgGTGa8O6iSAk/yI=;
        b=dI3ZuOHYjLck96Giur1HJQ4EFZxelUcgvZ/WW5FAOKopahiHdxE+UXEF3rcY1mo6ew
         6ZluyA0DeDyAsyIZkWqxrov3Fm4CLJCsDJXXlZCrsplks8wznBCUr5sLEhuA6SuzT9Of
         LN7EUb5QNPn/8xNKMDaH8rIXf1VXNHaBoVwFf4aT/lmMIeuYh0CeioT587gptTSxvyRT
         MePdjXW6W7oOGp976aWLVdRHXHY4aPwTJrgWWusXRnZlBC762V0uj3Bf0jgM5CYQH2ln
         IrvL7OdRtmYKTAovIeNCM4dfgP9mYGlRfELqWZg3Vk5iO7gdv9cJLwb/jgfnLJB2GoWh
         RWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749138134; x=1749742934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVdDAyLthEulzKQwcDXevtinu2TUgGTGa8O6iSAk/yI=;
        b=sIoz0AWW4ixj8gjeE4NDiKoYU6y+baSrO+618WpGR7njFa/+3nNOYRnQJVj9epf3J1
         uND3LMtiQH4ncGXbqEEYFFCvtvWqUisLI2b2NHWaEevZ7Rj8OhhwDcZqAnEYE1fDVgPs
         V4TUXLeYg0dyGFdg+dqR1Pas0x74bJheisQoYxWQRTvibzSO8KTraANgZB4kuCNeBFmE
         IeXJfv8pFbM/xOjPCZrEECifo+fLxsaKUsANVshONn8mW8b502sF03Y6MYjVYsWFPTKj
         i96jdcMpQuzWanKuaiu/F0VMajf+9qnGudKdJ0HdE0oiaR/b+7kTvUITONAAaBS0XFWY
         U2Bg==
X-Forwarded-Encrypted: i=1; AJvYcCW2ItQjgXcFtd5bEOPU+5c5jIohjJB1wpCTUHBKqMCUX9727EG3+BwUYRqrZDFw5FOhTdVsCY7Q/qNV2IhN5nI4@lists.infradead.org
X-Gm-Message-State: AOJu0YzrHMjoL/ZgBDhJAQrcOgYRSGHirjMDePWQ5TJvpliqqWeoMBov
	fnk8/Xu+InCRoBIaSDexRVmt6cHPkf8zZSBeNA4znEkiJ8reHL76tg3BhV62+O5POKQ=
X-Gm-Gg: ASbGnctEFMtqxUi2v5tuOCkK3OtpCHjge7WUsAsNw/Cnv6QG5kSLiPf9Lnx2g6KM6de
	C0ztiAEwdkqKFC9vpI+6rN15/2SoyPYRs85JpJS04VCrgEilseiOf/bgXDSS8+oTZol5IKcEoTI
	x0ikNwP++gaheWhP8gvltMQD14pvT4dt44FhCgl4Aw70RBpyPsCGqQAaAFCeoCusVNfBaUR8E8p
	TRv+2cRBKUP+rAWt+9jfj8BgrmX8U7nRPR5FH56cW8wRjGnT9Edu9tMXnSC+Ic00sA+lN4JbxfK
	q4rcsVY/KQUoJm+IkRwnYY19UjCK4gKX0J8OyZooHp3PbPuPTxQUGu3LeXMnFA==
X-Google-Smtp-Source: AGHT+IGB8zTp32oYZZKnFR48cFxcYSk+3m3Vnmwti62tsdDjgd7xtVgNTgLfDutXGVzb9zNCCp91Gg==
X-Received: by 2002:a05:6000:2584:b0:3a3:71fb:7903 with SMTP id ffacd0b85a97d-3a51d96a1c9mr2349476f8f.10.1749138133759;
        Thu, 05 Jun 2025 08:42:13 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00971fasm24478343f8f.77.2025.06.05.08.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 08:42:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: defconfig: Enable camcc and videocc on Qualcomm SM8450+
Date: Thu,  5 Jun 2025 17:42:08 +0200
Message-ID: <20250605154207.141224-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=CGZ2voXzpuqv5BDA6GbB9RzudNSofXOj956vYmHtZYU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoQbrP0MkLBrJusurDZXu7SzvMY+vWTEKuGU3wz
 wI+XkSqD7GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEG6zwAKCRDBN2bmhouD
 17pdD/9V7wk3b2lrT0Qe1evuJIXYVc/IdidpN1nCYzjuzjxPz23EK96jOuuxge/TmZEeXoU3gtJ
 fyoXZ5D8WwmkRv7xNpVDAvBkXTrKjnRURz1NOdL70YO2X0hSrGKUR8YTJhwP5MVDx2byldP2o18
 KnpRNx9koqU8ca0JLyilAtN7fdq0W7iGhSbqaIxXDWHud396bYdOjtOhYWAnQWphX4Mym0DGejM
 X6BotoX/RCWDI5/NrkMyPPmhz+NDe4ubc13/k/IuPrUNO7opSE17lnKsPIO7wV1kbD1AWqkYz/7
 hLWKdYy1lOXPheyXWW14BFB8JezBH/EWliImfiOgkIkpS0XIXMGIxGtp4OvAABRTtVB3PiaCnQF
 6+lVoxNm16MmJabVVVN+QERrQgicvag3fQvPGZKnUM5+e5U55ksfD3+yG+wW7O2lNXw7erHuvHp
 GrMSTD0bi2hpMaXwhmeCIhNQuCoaWffKY1FKNTaAgt4wS29vgVCmZ38WH5JaQwOg50sszdP4reW
 xcaLKGfReFY2SA90GP5BI45juioEb5p1H/QJ725wmLPOTjTuSe7ddfRLVGzVqeHA7/jdTq94q1S
 +WZiqORwCBFWpwK+gTZq4r0/6W4Bc4fOagLuqXTX2PKqi6e5b8qjShL4I40FeEZZZM76FwiPEVX w/Xr1Z2j3a57WCQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_084215_992873_C1201A32 
X-CRM114-Status: UNSURE (   8.90  )
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

Enable the drivers for camera clock controllers on Qualcomm SM8550 and
SM8650 SoC (enabled in all DTS files like SM8550-HDK or SM8650-HDK) and
video clock controllers on Qualcomm SM8450 SoC (enabled in SM8450-HDK
DTS).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1..2ffa590b962f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1404,6 +1404,8 @@ CONFIG_SDM_DISPCC_845=y
 CONFIG_SDM_LPASSCC_845=m
 CONFIG_SDX_GCC_75=y
 CONFIG_SM_CAMCC_8250=m
+CONFIG_SM_CAMCC_8550=m
+CONFIG_SM_CAMCC_8650=m
 CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
 CONFIG_SM_DISPCC_8450=m
@@ -1431,6 +1433,7 @@ CONFIG_SM_VIDEOCC_8250=y
 CONFIG_SM_VIDEOCC_8550=m
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
+CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
 CONFIG_HWSPINLOCK=y
-- 
2.45.2


