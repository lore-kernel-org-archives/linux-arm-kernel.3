Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F9DCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 12:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pI91YBUn0ODEJ37uAPOBfrBDVY8tx0luGRG7kO6Mtbk=; b=z8HR144xuJw5rJmQU4ZrXYPfCS
	1ilQQsgftx/H74KPNsRw2cAzNX3EunYVlWVKEnF5zoHlGRx/xmNbV6IbMn1TwgyCacKzZ1YemP4JP
	1q/dfPqU3aKIU7THlgXL321XpzyzO3pUnOr4SBcFGAzzuxLr02H+z38IuH+gtFXmQ9dvNW1Zb5qr0
	qkRHXA7HyNYTW8a5Y6M+VN6yPtFR7ISzziwlSdSS5EBCj+FYr6kEhL+8GIIG8zNfymSBaNmMsDnjj
	0zBmosBljgEglGR6Jsxnsg0zcjgphPO+5nrok1W2lrIakFiAxJZS9EmisBt67Vq4oUwibXAacb8Yl
	GZkkVy9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CWL-00000008TzK-1mH4;
	Fri, 10 Oct 2025 12:46:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CWH-00000008Ttr-44s9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 12:46:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-46e4f2696bdso21776755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 05:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760100408; x=1760705208; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pI91YBUn0ODEJ37uAPOBfrBDVY8tx0luGRG7kO6Mtbk=;
        b=gjZGe3b0K6bfU+wG+FNnevCfmznnTO7x+st4HpE8+ME+7JbGTPhU3N3ca9p/CKnmZx
         BgTj4a8PQDeDDyk6NMWuZnxVqIQhqXKPNzNlvXhLOA5o/vLnFXR/6FWlvyWTt5D30OiA
         DkDLEGb1NMLSnvyREHRkfttjYLoNVx2Sv8W/TSc5R+ZsyYakLQfXoEf903nbFYn8u1LA
         2GL3ib6FLFiyzCS9PgP8lL0ORzN2qyZXm4y1F/D9q6mCw6LEpmtyjttF5b66kDRPCDvE
         oIn/pGvmiO60SHxpRbxFjGEpudh5vNhDLUmi2LLk+eqH/JapPej8nwhnGCLHlkXMLhXb
         olfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760100408; x=1760705208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pI91YBUn0ODEJ37uAPOBfrBDVY8tx0luGRG7kO6Mtbk=;
        b=nkWN6SXkwBOYaj3lp7YLEJiWMdM/pb0wxjpjf7Kr5BQmeeWAz3qTwS1KMD+SAfG7AR
         BNxy2b4/05jdeTkcPAJfeEka8ndLoP5CcFoKnKYnOMfF2emI54IKsd2tU45KgQIog+9G
         +J+rt++obcJNn5+np4UYKyCryanB+U+6EnBTPGibHuhyZuzRkcLu8dlIJ8xEfbLTvDE6
         MdClmoiDv0XNkB1GzwJD539HB41ICNu/Yuldl8sMrGO9ics9Q9pM5YY3FqQonCwGOeLL
         3ZKZWIwwydIYNTLaQyBdwWdupAtRUQFkmFual5MaD6tuSJ27tErM8trWesZUQNL/wHu7
         jdcw==
X-Forwarded-Encrypted: i=1; AJvYcCV1gEQM6NEYyvf8JUyND0wdRDRvS0UocUOXSNzOm8MMBwKE4Oj6vqpiTb8AMELAiQ+FGcNlgdEvftjYUGFgD1rW@lists.infradead.org
X-Gm-Message-State: AOJu0YxA8C7q4gBDb7j2k1K4dDIouAX3H7uIHSMV4/9ybLbluErKQKYP
	f2Nd6bzD60SFkC3SYHyGKZZ3aOYq25vh3EBROaWFWWDJv/cAfc0B6jhJ2wzzgKxAWPCsOP3Ukm+
	DtZka
X-Gm-Gg: ASbGncvuf9hjbcuxYKEZpxM46GHQoVjfjbHHPWUtE/i4sSOPPorjX/eybRzOjyFLPyo
	tTNrz0+Mhum4XqUKfWH3lKERcKBccjGEapR5jVG3c8trp5vtLtmouvE46cAZXRD8bVO99c51Xjn
	Ev4Tds/W6G/0VYj3O5n0On9Fsw3hQ7YZwR/koDz4vM5M7+KgMAOIV3IYUmfeJHPtRSpL4g2l/7p
	PsSYtt9al957ahUK0GQ2OC47b7hk9J5xoxbZqAWsWM2bzTZioCLfJIabvMtaCsPqcajiXOWFsJl
	2lrcb+aVeme5n3EOy8d/h0VsfrIuMGJVWOUqw66n2eg9SOKLL5xARnlVJUEliDXb8QqXq1uUeqp
	brzIN2SEzh/tvC4r1oJb1Z6n/3BCn7lmQHJaxkLTsRm9Dzo402zCkiNBC7AP+9OnyyuPYlUhbTy
	XZHj+ed2WKKG/8FVyx8iEwZg==
X-Google-Smtp-Source: AGHT+IF4DKpiRzWSCX0rNDuTrRqKdF56LpWr4xVHOhNz6eYaEJ8Bb9XyBCJmGVJ2NHkQ9GmAaWccdA==
X-Received: by 2002:a05:600c:548d:b0:46e:49fd:5e30 with SMTP id 5b1f17b1804b1-46fa9a8f4e3mr83469915e9.6.1760100408062;
        Fri, 10 Oct 2025 05:46:48 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb484d056sm46376895e9.9.2025.10.10.05.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:46:47 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 10 Oct 2025 12:46:35 +0000
Subject: [PATCH v6 5/6] arm64: defconfig: enable Exynos ACPM clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-acpm-clk-v6-5-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
In-Reply-To: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760100402; l=946;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=g3mKjgBA5eOmM+lFx4cmUAPX+2oV/GnRecyAQho2Lnc=;
 b=NTVzlJxWw7xyeoGeBBqzM/8gvY/1az1ZXvATM9Z29dX7t5LcuktT1BATpk+ooyP6VGq7mm4+T
 lssKF7XBzBZC5cew2mcDdiAvlteaBf9sTDx/nJY7jNJXG2Iu7gwaeJ9
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_054650_076348_EE8690AC 
X-CRM114-Status: GOOD (  10.19  )
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

Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..646097e94efe7f1a18fb59d5b6dfc6268be91383 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,6 +1458,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m

-- 
2.51.0.740.g6adb054d12-goog


