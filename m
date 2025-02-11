Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0668AC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHOUQzUPyOdT3w4jRKuGIg3i9ApsudVpLcIIKx7XFPI=; b=b0TjAvxwnO8DlE+LIVXHJI1Kn5
	gw40C/Ri876wU3Zsx2DhZc3X1FCH8F5gks+QLqxdrfYhq6JCbdlm9/d3lRw0Mi/wavo41TrW2uhbH
	mFcmVM9Ab5cedWMDP8X1zsEeyKnIX5O1Y2R+NOwi0YzsBrTvx0tiOk4/Xj4PfwmJqPOYi3YIqzUSV
	m4aEs9rKgxhfAv4rgCOSFfaARDfTGYnysVT3qN3NcgbBj7BTteuQwWPRhHlvu0VP864c+WArWqX1J
	rnKP1ZsM0SeNNK3BGKd9Lh5HBuYVHHl+MzU3/4/WUdolP76SSiswJjcmmqdKjFfp+OomC10wIc0G+
	JDppPQAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thm5I-000000035hZ-2a3F;
	Tue, 11 Feb 2025 08:57:36 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thm0l-000000034Ww-3aPB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:52:57 +0000
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38dcc6bfbccso2159073f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 00:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739263974; x=1739868774; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHOUQzUPyOdT3w4jRKuGIg3i9ApsudVpLcIIKx7XFPI=;
        b=JFUVJ8aXFKx8xaYrB3IroGSHkCB90r+Syb6plj9Pg3Ai6W+Cozjw0ju6lF5v7tatn1
         kgW6dQ8puhDnkQpkyIZajecAh6bar6YTLXFMmk4Pt1RFbrSUuoXEuMleaUJ8EiaGWvWd
         VIyn8qPwxHrLzC2xyBicD7jWnOalEojT151j8/lbiWRehUWycxZ0Z4T00P1c5I7mhLaM
         BEbtus2Ec6JsFKMjHnAeFWoHsVpHWaE4cLTPKXKwq3SogF8/Px2tGQjh1Dto5TL78LYc
         m24Fd/X2JybCoCfR8rhWDf1fVvLIiVbHyF2qt2+EO2D0Sg0xwAi3n1FVtlfcuiZ961Ml
         xLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263974; x=1739868774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHOUQzUPyOdT3w4jRKuGIg3i9ApsudVpLcIIKx7XFPI=;
        b=UUt8IiuS3Law8r79MJVhZ0CUZKXMn2LpBlqQcH9CU6+U5rK2unbWTxqz/L95reckJY
         7fihBtaaegLvPUnqAdo1qVYNn8FXeDTMxL9ZL8EjB8j/yoAZsQK5EzAkm0VpLG7kVhEh
         WOiMh2RHnk0X9Vx5At/jnca3QQOKptlbHDsVi5c5oNT1D1pJ2SR6aIsQV6enErw0zFyb
         xbXtz4Iz1XmB18kUBGwGkt43MMJwACVBh77zxWn/rUYtJZGh3kfAiSVM2q4sJeqe5hmI
         EQ8bz1jKhfEPIyQKBIbfk7+eQrtXyzZkgKfFiiqX5Y3RHr6qvfpxXlYRTQOaDmTN+iJ4
         +w8g==
X-Forwarded-Encrypted: i=1; AJvYcCWf2TPqvULWXcVzTSwcOqZvb61PNupTU/XiNmiT/BaThpxa8NrFx9mT6iVneAfoQ1MIzPQEw3nZLCCkfXVMN5B5@lists.infradead.org
X-Gm-Message-State: AOJu0YzBOg380Q/YGajMdVhEuoMy3FDhj1V5sstfnnzrSSQg3QzQEeHn
	hhKcZFbj/v7hBGeQNKul1DhzldP7thRr/7dERHF6tDIsIAJTt1A18FdZ+NUhBAQ=
X-Gm-Gg: ASbGncuWJp6apAO9k/4ULpOYO6h/RAgcnJJdKaKnWrkE+yZaWr303qw7utfbK8WxSf/
	Fp4tBxAqjZelKPza44GQ/qs8o6flqABREUzedMKrSge303smzQH1jUpZW80mXCUFcA+VbYpniTg
	1zLJ73Sgplxs4hhYLbGSm/6hqhFhUU7LuRYGcmLLWegB6KPUHO0bg3UVJgRJhsgrNIcw96gH9if
	p2TH6H6hL2P2xcGkb1OLSHnaPqjQ8zRAE64CXAp2bBC5NEfT7RlO/Gs263Fgt8jozwfdOO7Jbxj
	1TuNQgvQ1URZSTUMVmLfrLrmV1EJm2AGFC08Y453fxgEvQMXMIe7J/mLDsFkLiNeAhgYRaw=
X-Google-Smtp-Source: AGHT+IHrkFdDd7iCklHzfZCCf6qXnYWRV7DGmwy6HyhX0bhwjVCEoM+UF6b0MZDOv2RBBD41AthhEg==
X-Received: by 2002:a5d:588d:0:b0:38d:e2ab:1967 with SMTP id ffacd0b85a97d-38de2ab1ab7mr3564345f8f.52.1739263973713;
        Tue, 11 Feb 2025 00:52:53 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d7d4sm207698225e9.10.2025.02.11.00.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:52:53 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 11 Feb 2025 08:52:51 +0000
Subject: [PATCH v8 3/3] MAINTAINERS: add entry for the Samsung Exynos ACPM
 mailbox protocol
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gs101-acpm-v8-3-01d01f522da6@linaro.org>
References: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
In-Reply-To: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739263970; l=1230;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=mxio+qKZ0oCarMDdKVLWSkQ5r9o/ZU/FWiQSXWeFPIk=;
 b=2O1NkUnh2TsrjToYDOxMeBlIfmePDYbb3kMBJmkogPAiIVhuu+RBXSeyCeYc4C6ct+kFEsfXh
 uAbNqfEv/4BBCwU+T03HDvfydAx+8udUwH3S2KEWt1XMlK5Agk6pJdU
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_005255_918673_CA808F14 
X-CRM114-Status: UNSURE (   9.69  )
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

Add entry for the Samsung Exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..79ac2f3abff0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3070,6 +3070,7 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/clocksource/samsung_pwm_timer.c
+F:	drivers/firmware/samsung/
 F:	drivers/mailbox/exynos-mailbox.c
 F:	drivers/memory/samsung/
 F:	drivers/pwm/pwm-samsung.c
@@ -20899,6 +20900,15 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+F:	drivers/firmware/samsung/exynos-acpm*
+F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
+
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.48.1.502.g6dc24dfdaf-goog


