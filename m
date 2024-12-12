Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE67E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 15:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVrRE6XW5rU6HifNvQnEFiUjGXhcl5ON9ZAwVXIWqo0=; b=Z0qQfJe3P57qvjRseBPb17xKjr
	s1l/n9uqXmLT8AI3vukKqlPOhoLLwuFYkQjCgYEn74XWkh/89WfuZ2fkdOvcI89YRHEdumz1uQvHb
	aQitxsdPwUxKiOvBr1h/5ErDHPlbGQNJno5a1uDuLfzlMDagd7X6bVmqxrzHgcIdzfts0v5IzKcZJ
	st+SfTuWHmnE11TTTLtpxOBngE53vd/XrWXZTwlGHXabGsaCE5cO+ZsASrdx7nhsSgg8eU3qg3q5Z
	cxWFn4dGA8PMPgVilnjiIfCzUl1eV2lHZkocjY89uJNUv0wSZlu+SPvJilsgdlbaglF/BHEi+eK4L
	4vyfj+ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlaf-00000000rTU-1wnC;
	Thu, 12 Dec 2024 15:59:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlOj-00000000oAk-2r2d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 15:46:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43622267b2eso7866285e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 07:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734018400; x=1734623200; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVrRE6XW5rU6HifNvQnEFiUjGXhcl5ON9ZAwVXIWqo0=;
        b=cW4WpaYHTuf5UYzzHi6E9zd8Fqidob01vVGSXRbCCJqOPMmA6+7wYwejTgRbGFGH/w
         Wpd4nf5gJhYMs5Wk6BLagDD0oSfNx7h30yFdPgBMzfrVB8LEXbeZydoagRh72KhsmhFd
         UA0H5jdITnDVXQRPIdPjI3cFFku04XMAfWaIHS3eGLq16d4hMFXHcZNKNsNW0mJMPAyV
         oXEej1DSUo4ARLf2+wkX492YqpZYlXiBOQJvuETb5zFEWN2bFQnaEzcEKIq/smM2lw5k
         t1gtd56IVX3PXK6VbyvPGKOujoo+w4wirB8l8QZTSc1Tdtwmt6VdkdcsachEFJv5KHqq
         3fDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734018400; x=1734623200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVrRE6XW5rU6HifNvQnEFiUjGXhcl5ON9ZAwVXIWqo0=;
        b=mraiasicKGmjUDigE935M2X769e6jDfGHLgfTetgyIbiTptYNNdGsAdLJ2bfogyIKB
         nN344i3LT5QQuh33bVjbWk68LimAwprKBF9VwqexnEk+JPUdUbpjFvW054JpR0mq4Y6d
         r2dgaZRClf5EEjqAi++/N2kF/b+wIA6sDx++H9Yh0/VPf/qjua7OGbJ+/wtfkhNG+9LS
         L+eRD1xdgr5T1m3rUhPv5IlW/pAtS5aQkihkqWoyDYscrTO1ec6eolDMvo0n0HJ1YOMI
         i0pQSaZC2FqVywjbcjrMWr0VWqoEPI2cbSVgTppMuVdblFlFMqh1MNCuvfhP+6mK51X7
         Ybzw==
X-Forwarded-Encrypted: i=1; AJvYcCUrsSlNZw+Mut2S752cIgdFByAvLMRRlvIIUtcbA3J9W4Ehm9S/ZeifZ3UIyMAIVUUlqdhTwp1apx4KQyhLPriG@lists.infradead.org
X-Gm-Message-State: AOJu0YyMCTCq0Kribyd+9zNipidsx1PmFMn1M7ra3dcXBWw0lmDWs8+K
	XFYOAdkLv5VKwujTtuekJRaukdGyK2ldLowMh31W8JNBU1N4RfLdaVLOcvEiwY0=
X-Gm-Gg: ASbGncuS2y1zu9X48F9HC5yI+8i0odjqvQKylApGudv3lYsbpQXL1Rk6vCFTYZRqCS/
	l8aRBV6uh16BnV2qvI55Kj90vmHHxPpi40BdmVzhBZhQ6KM+Quq8QNWTDLt8aNy2YnW1UxTLHam
	fY9CfSMGlu5Mh92uXm2n+3u/snP7gSONSP1B64x1cJqaNNclzKt4raNmH1LMdotS+DvyEpCCQrA
	6S4iPGHH/jxgUXz5tbA7CUScKNL1YB11Kn3AtWBIhlSe/CtUdPCbiYaATni51lMJXK29SlKk9jy
	1v6KiTOrZPV+Mk1vnjLT/hhfuC0pgBYaog==
X-Google-Smtp-Source: AGHT+IEmv9HsSiHLxj+MbudLFonDKiv9j3QNmqqpM+EEqlwltO/STEVmjTawSTry0YWT4U8rduGL5w==
X-Received: by 2002:a05:600c:4450:b0:434:f871:1bbc with SMTP id 5b1f17b1804b1-4361c35e4famr74531555e9.10.1734018400236;
        Thu, 12 Dec 2024 07:46:40 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625550518sm20273075e9.5.2024.12.12.07.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 07:46:39 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 12 Dec 2024 15:46:24 +0000
Subject: [PATCH v4 3/3] MAINTAINERS: add entry for the Samsung Exynos ACPM
 mailbox protocol
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-b4-acpm-v4-upstream-firmware-v4-3-3f18ca64f1b9@linaro.org>
References: <20241212-b4-acpm-v4-upstream-firmware-v4-0-3f18ca64f1b9@linaro.org>
In-Reply-To: <20241212-b4-acpm-v4-upstream-firmware-v4-0-3f18ca64f1b9@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734018396; l=1244;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=0x417ocgxZZ5QKGgDLukuXtP9oxD0Y9ZNW2Fdua1JWo=;
 b=npKxLebFrLzPiTFZxw1n5VtEgvFMwfWOTW7YSWg3qGnbPqy6agTmOeiCk6ysOs7G/4dXNELLx
 9tyEx0yCfyJAiSvUxmtXXrSGhms4XoyEnKcP8VGMLVkjU/FhIFOyE7w
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_074641_719594_B9583A3F 
X-CRM114-Status: UNSURE (   9.21  )
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
index 17daa9ee9384..07d0a360cf66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3023,6 +3023,7 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/clocksource/samsung_pwm_timer.c
+F:	drivers/firmware/samsung/
 F:	drivers/memory/samsung/
 F:	drivers/pwm/pwm-samsung.c
 F:	drivers/soc/samsung/
@@ -20715,6 +20716,15 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
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
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org

-- 
2.47.0.338.g60cca15819-goog


