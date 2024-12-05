Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08971E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUjYGZM8Wn9lXxLMeS6SbGdYzdUSKeJjfxwmycYz8PI=; b=UEUiEaLUE+CZGbdIXgbCbws4ni
	h/7gmis3GpNj67LkQObrMTdWmPoKXIwi4UYo0A1p9RVZFIQz3wnE6yoRJjq2PHOr/lPkfTI4CM53Q
	+Curizt90CwgXQjUzvxkroKZUbhR0y5eXOonXljwFKC3BSaPkeYwo4YSkI3UYMonccBdpGM4JFkSJ
	fxLwOdX3g64oYFD3HZLwtGFWGrkRxh9hpKHVDKrjZjZ0wRv3NlWR0xYwOmYkNiptY2c9u4PbZrAgy
	egMDhRhuXM/x5vc6xTJUM2EsWP0S/mV/JpgisyLpJP0mqoF0WCT18azN7Oz/CdexA40oUg17ADOsB
	mVbHY7Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJG6x-0000000H2OD-0Lti;
	Thu, 05 Dec 2024 17:57:59 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJG30-0000000H1bH-3XoO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:53:55 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-434a766b475so12319255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 09:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421233; x=1734026033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUjYGZM8Wn9lXxLMeS6SbGdYzdUSKeJjfxwmycYz8PI=;
        b=qgUcH7M1XrGfdr/0Hb7ZtKaMVfFpjQQSqbjyL5WKS+TToqGuPRIwqfITy46fU5eV3i
         UB9BmCoKsnxY4Zw5vLH+h1R2N77HBM1z9ThnebiRKT/ZYFJK8QgxhDVtJjs7icKTcjHf
         ZOoD0IOcpxjZ/ovmbW6A5ONt2UyAoOcZlHYzwZB5UtdPyi/m+mPER9cbqwBYRUXwEfsw
         SOnLKCo4k13YA5+8HDfsNGgIr9+Ut1LN+eKgPR/JTEirD9y8L4vuldn1LpxgNuvEhQd0
         SuJGwApeoT5Y8j6rgI+gvt0BFWKbfWqcZKW4wxjTaTW95/gqxSXTh1R/uiBmihhZXfaK
         8nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421233; x=1734026033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUjYGZM8Wn9lXxLMeS6SbGdYzdUSKeJjfxwmycYz8PI=;
        b=BGRv/JDGc9By+AC3ndU/pZJA03m9QaS1kshx00OftMDFPcwZgY93MhX58Fa1V9Tmlp
         jUL6Kveje1Ur8VuBEboJ/0HCX+fQfb+CxJrdQVc2xREUn+qzNQFVMJzi7Dak8eLJxanV
         BbavuR1qgvwAQbXhPXwI/Np5+WO1bTJuwdJpZP+sWduFJhps1Zi1bYgwyprlopf5BnBq
         tjXKKjuarTN/7+ieMNs4u6fioXjUOnaUVQWdeZBmWSyO1NhndLb8U0CUOWnf2rzXjX21
         PXySLG5p1hlIlK+pQpSkZdNuNn/ZqgEF++7MQOegA7SbS+mU8JvdYdbnqcVzOnGJ3DbJ
         Agew==
X-Forwarded-Encrypted: i=1; AJvYcCX9L2wjfcPcj0RvMQOuCQh29/NqhAAClC8pkhiErmh6st4Mzmnx08c1iUszWxe2garMiu7Tnrtcqi9Po26Q+P84@lists.infradead.org
X-Gm-Message-State: AOJu0YzLf1J6YoKbJPlqBaXcw0PWMYkT6du4iE2MrNu+xNM3mQYYgdTK
	k+qSQRThyy/qQcyB89fxztqlHsfZsQSgc68FFKzGpsUi8QJ8Ru20lXC/HQp7d3w=
X-Gm-Gg: ASbGncuPHdsHDWWMII8bZCs4SV0EmA+a1pCYwtY6Dut/coclFMBQk/3twv4oBUymCZZ
	qNSJNIjcjadG0U0m0ikDxAoXLkivOAeUIL94d1JSApPw1ftcTlCxsoHC1dZIfQlODbTG5x3hAse
	I5Ofc+S+dZ5A1Nj9wM9FBnO+Goc9sd6JK2FEye9ka/4RHPQeEItGgPy7Ak/pcmVzBTgJmMqaR7A
	m+KaS0tYJ5F0g3Rcv8NdzWcZev18f6++HorSMnEce5IIn/l0W1ejrcF4NhUYWjPf/EMLiVYjlmk
	AWjWQedFzkQJx2wXRe8RW5VS8UfFAUyF
X-Google-Smtp-Source: AGHT+IGVQz+uq4dtBtqtBu1Y8X22ebMDa5YP2r6YCdjfCnpf2qvqcplq7ge2zv2BqYCM+IMoonQK5w==
X-Received: by 2002:a05:6000:188f:b0:385:fa3d:1988 with SMTP id ffacd0b85a97d-3862b33d273mr12625f8f.8.1733421233156;
        Thu, 05 Dec 2024 09:53:53 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5280fc4sm67882835e9.24.2024.12.05.09.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:53:50 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	javierm@redhat.com,
	tzimmermann@suse.de,
	daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 3/3] MAINTAINERS: add entry for the samsung exynos ACPM mailbox protocol
Date: Thu,  5 Dec 2024 17:53:45 +0000
Message-ID: <20241205175345.201595-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241205175345.201595-1-tudor.ambarus@linaro.org>
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_095354_879761_B0E8A4EE 
X-CRM114-Status: UNSURE (   8.76  )
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

Add entry for the samsung exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..5cff01641f23 100644
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
@@ -20712,6 +20713,15 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml
+F:	drivers/firmware/samsung/exynos-acpm*
+F:	include/linux/soc/samsung/exynos-acpm-protocol.h
+
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org
-- 
2.47.0.338.g60cca15819-goog


