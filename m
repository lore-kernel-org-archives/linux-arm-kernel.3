Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48904C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 12:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d106TqNSzkY12ISczNEwfjZ5zhpWhqK85bfmJ3moKtE=; b=d9WNEs+rqmnAa9Gq/JuAYDl/tz
	TPte4u/MpDP9Mhy1BjMQMb5qzRoIy7SoARVrEuvylUHK0zrs+ZDG6Ix8rPovFbyzIp6jO/dCEsP6W
	oMkQHYPx7qIUAQ1arYH9le5Nk5bj8KpaTK7HMioW1xOm3GXEPwqiBsHdsBzP/4+n4zcp+NcFEnEHv
	NbSHwrQQ1pa54APJZKlZhz4b35SdWSXdFCTkwWoMn+83zUtUzF5DrLJCr7rx02MxxpLLzdDxJeGLl
	G8JTGhOS1k7qmaFJ2CKxVkxk8lrREYC7AxQ8OseFkkF0w/XweK5FPOllABG/eHk4B77rTk9KLNs/y
	Q2dd5LgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fq7-0000000Bdal-1UmT;
	Fri, 04 Apr 2025 12:08:03 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ffa-0000000BbAx-3Zvb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 11:57:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso1615725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 04:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767829; x=1744372629; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d106TqNSzkY12ISczNEwfjZ5zhpWhqK85bfmJ3moKtE=;
        b=WhbiFZam+O4flKKumj3ZkIuA17feGKZkP9/SxKUNXUlQXn/JtmyQTo0ysJk0GWXyJV
         GzAmfui0hRI2oaCMfswMdvuFU60T2J8aYySsbmuhD2BjvHFI5SqU+QxPF4GBao++9OBB
         YrGS+XS7ZEnoKX2pl9SxFNyrl5V5I4aQrceYSUYg9n/CnrWYcr0YLOtYA2u5y+buqtRt
         r2DC167mprbi3u8vEioRp5XF9FC/KOSeCxGoHcq6dQe67T4fFYTTjDbiyda6c2V1X1FI
         7V+I39Z9+SsZxH3A15gn+yeQTEChMTt84CIS6adPSQuAd+rFzNkCBnsE6jBYFC62r+eu
         LO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767829; x=1744372629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d106TqNSzkY12ISczNEwfjZ5zhpWhqK85bfmJ3moKtE=;
        b=v1LtK/Q5eV1WyZIDbHC1q5y1FexVY4jJzoVHBKOQvgsLVie/5xhtxMH0ifrm5D8Cs/
         IpzZ9/08mN1wkax3t8ze89lU+mxyVCe9dckJrQlkfPjTdFSz1hW3IOP0ECQezrneywNp
         SDGsXtorV1Jma172su2s7ybS5ogKTmzV9otxtZLE2i8dIugU/h+7mWPWyyJAnK54xtH1
         IRWu8LwTExwSSzk6UNfMo/X/E9XrsfTSG/q0Olm+7qEEo4kWIiyWH8CLgdjjTFlCE8Vq
         4kaoVbN7FU+eyGRM+fuUP4aE8JsDs5xw3ak+czb8cK+L+TBcFJnOhRgijnelKhgZxARO
         eFcg==
X-Forwarded-Encrypted: i=1; AJvYcCXTJISX03c7bbctpk9HZvesWFuxlN9f4AdE2SccXdUKPbKXgHncmZKF9eZNdlNhrOBa7JGahjgLKg0XiFJrco5c@lists.infradead.org
X-Gm-Message-State: AOJu0YzCVAOM6GPpQsS7e8q1Qr8d97TjZcsR8U0t2joiUC4iSSiW45T2
	vxW0TqrQKRqWL75C+5vJBu0kmMaoQekmGZnxpvUKi5sBQzLX8Smlkkvlz9O8PfeRwFt19UxglNW
	v
X-Gm-Gg: ASbGncv1QYnZJFmKDV/HnLN/cMwX85Ns1WXiqfsGQr5yEhn/4m7seEuHqadaQPzSacg
	O5i8GwUIjJqIlDRS5Vw7iNjdomE4rP1L94BpuyK1NpLLvrSmPQdDsbNkWeK/D0GILgNgBhkg1cQ
	XMNUbdXms+780xhqHI0CUiI/ytG75L8RFph9fqbOtCr/KZiwmRJO8KYmfDS5BW5eFnlrlGfLkMe
	ldz1jZClj1Few2JQB1yRLsBdgKXkCk8WHJY+90PYY6V1h0Iorw8wnGYpz+ewsEvzcBP7ERY0GJB
	Wqb7LR1tPsbvtB76fSEt4io2YiPUIHzo9gdRo46MOO0cmVFUQqv9JpTrgQpiUk4=
X-Google-Smtp-Source: AGHT+IFUn3Ncq3UJFAd17WQ9Pi1CnRMlttoznJGCzpSMvyRtLW9B9mLaVZY4lCtohUQhqeiWfvicpw==
X-Received: by 2002:a05:600c:3592:b0:439:9ec5:dfa with SMTP id 5b1f17b1804b1-43ecfa18f83mr8121025e9.7.1743767829072;
        Fri, 04 Apr 2025 04:57:09 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:57:01 +0200
Subject: [PATCH 5/5] clk: sunxi: Do not enable by default during compile
 testing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_045710_889292_93CFC3BE 
X-CRM114-Status: GOOD (  11.95  )
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

Enabling the compile test should not cause automatic enabling of all
drivers.  Restrict the default to ARCH also for individual drivers, even
though their choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/sunxi/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
index 1c4e543366ddb76c1669b577c1ac337dc1be616f..5e2f92bfe4120981ab68b175dce798ac8b3268b0 100644
--- a/drivers/clk/sunxi/Kconfig
+++ b/drivers/clk/sunxi/Kconfig
@@ -2,13 +2,13 @@
 menuconfig CLK_SUNXI
 	bool "Legacy clock support for Allwinner SoCs"
 	depends on (ARM && ARCH_SUNXI) || COMPILE_TEST
-	default y
+	default (ARM && ARCH_SUNXI)
 
 if CLK_SUNXI
 
 config CLK_SUNXI_CLOCKS
 	bool "Legacy clock drivers"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock drivers being used on older (A10, A13, A20,
 	  A23, A31, A80) SoCs. These drivers are kept around for
@@ -19,14 +19,14 @@ config CLK_SUNXI_CLOCKS
 
 config CLK_SUNXI_PRCM_SUN6I
 	bool "Legacy A31 PRCM driver"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock driver for the A31 PRCM clocks. Those are
 	  usually needed for the PMIC communication, mostly.
 
 config CLK_SUNXI_PRCM_SUN8I
 	bool "Legacy sun8i PRCM driver"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock driver for the sun8i family PRCM clocks.
 	  Those are usually needed for the PMIC communication,
@@ -34,7 +34,7 @@ config CLK_SUNXI_PRCM_SUN8I
 
 config CLK_SUNXI_PRCM_SUN9I
 	bool "Legacy A80 PRCM driver"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock driver for the A80 PRCM clocks. Those are
 	  usually needed for the PMIC communication, mostly.

-- 
2.45.2


