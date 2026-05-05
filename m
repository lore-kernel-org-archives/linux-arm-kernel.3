Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15443CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AFkvwk1yHFeeDLYag5Oi8EMMsCVOXTu0Co6nMK2/h4=; b=UFfyxCkBRwItn5eRbtpNAM9Zb3
	vkWnX1HfXEy8gfzoFH97cZ7qZdQQ8GaCcrPv05I5bJ6I1u5974A82P6R21nLMV92gndE+YT9hkEJg
	eCcyAqDIKO2BG+HucxKd8gcgT3Kaaeygmv2HDaVbu96sq/IQBS3OG+bXEO7ssOys19O/F0l3l7Ci5
	dToC4jK2kh6sJR4cIZWCKyQRSLcqsKPxL72zJ5l2+7L56I7qxRXl2PBh7g4WPkcEGJ4mCHTefTJKa
	zkMJy0R0GixCW3afFcxctCaaHWZ+i2wsmIKChv8c6fdcVgcbTI8sTOAfjhidtT7nWOKvicgz0/1G+
	EXiHthSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFb6-0000000GIGn-1CDr;
	Tue, 05 May 2026 13:14:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFb1-0000000GIC8-2C7d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:13:56 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso50545825e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 06:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777986834; x=1778591634; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AFkvwk1yHFeeDLYag5Oi8EMMsCVOXTu0Co6nMK2/h4=;
        b=cCIGVXmtXnk6GLm5FCHRBU+JwVQtvZnLJyGWC4TzCbnmJRPNPBwo6fXmeE7/HIInws
         r6Hb0o+DFgKIBfxBg6ZEd6jWmiAwmPOHGmKCeW8OR7Ea5t9Qo9jeSperbKcbHSR+mbxc
         VClP11a6zGrLwbkJiG7yyZ9jFBrvb62mxdkvzjhR8dEjhBKJF/OjJtsD1Mw9RLZfl1S/
         gpJJlAU2DtwFWSfwhCMJ6i/FIfiE6gpB+R4yWYxcumUvEEScnkALEfZwYYeQeLvJiht7
         T22FGJaAyIHt5XmOEimKEgrlm6QD+DB+q+GqTPZUTvN/PSnGFNTaSV9bT4EXJzwK+ZSU
         yHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986834; x=1778591634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4AFkvwk1yHFeeDLYag5Oi8EMMsCVOXTu0Co6nMK2/h4=;
        b=Hf6LZeaez5TKpcJ2WJfI4lGOSYVZjxBWMmc4Lj5hkFbfWOvEuAE/M6a0ym4tYBTIfa
         Wkz9BXvmIKkcwg0XDX99SwptUqcvWnDFf0VwPfotK0p0DwVnESl9nmg9Rlf6kH45dCYv
         XE4cbiKjB4WdvxB/RpEiOozFhAtcszBvoI7ra1xQZ0p5zKl7MQCqDf3PfC6Ch0ENE0y9
         xgYeiGhJWd72Uw1uA8OR/RQm2w90bPCiGR8xRWp/6yj2UV7SjZj8rXhN1D+rBHnhgUg9
         GDIqLg6TY4mxF1pTq/CcwxW1Q/N+NBEAX3xFXdwvGYZw8NcGqtiSm9jG1unDf5f/zFGG
         r3bw==
X-Forwarded-Encrypted: i=1; AFNElJ/VjDmx/5i0Vu/4qMaAD2AB9xpyuRGIxNJ5ZuPWhP4IfiwSa/hyG52BOcdG8IHx+XcPwGRqBS2sllg7zcj4u6JH@lists.infradead.org
X-Gm-Message-State: AOJu0YzHMocR2Fr1Ojs5UjcUvpznRFneqKjN7GZL6fh03M0nXoECtQSG
	ZvhgtItiw1glKF6wx4JvsSVA+sSDP0egZmD7+ctI3YzjYqKUpOV8hjBd3Ia23pxu83E=
X-Gm-Gg: AeBDietEQPtag0cqgMDa6myxzel3OgC8s5+u1ibU3m4uDOMQmI3vx+v/x9hfm+YReQQ
	kXJ9s4B0byB2xsnodEq80Ya3Lv18eBANIba8DaqE925rLR5QeJbNiCSvbVuNmPE7vjqegz1/RFL
	mRfNz189vcRBe7k+eb/8SNGZpe7pbKAiPURrA8bu2OxqR7G55YwQ9ZAAGvetePoxNXXlS/r4eM4
	guNGvWbknTlt5jfPWbyOMw0M43NCeJgMP2ujlkDAfYk/kWvvZTv3xR3GBj9YwAjEnrw0yjOUrOS
	Micq4CtKe8Pok+p1NwqhY64CNyZpv7YqYvEW8wrl3naNxtWh9ftcs8aDrVZYM9Q6GAQEFuQIPwC
	fSD9f8Mzt9amwW4EVkO/2REXbB5Wt4upkJKTPWsO5hwH8YpC+3OkPaN1yL86+anI3z39FN290NC
	ekainEg3W87FnXt3BX1Ld6fvwIX8X+bjh2+dh9fLQDEZOyjtfUuNvotv443r2AMlHDWDOqCJtpE
	1M+eT15E2N8TDQYWq0N3PGHWoGh
X-Received: by 2002:a05:600c:5296:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-48d17fe008emr47062135e9.0.1777986833570;
        Tue, 05 May 2026 06:13:53 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb72a17sm366599525e9.6.2026.05.05.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:13:53 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 05 May 2026 13:13:01 +0000
Subject: [PATCH v5 4/7] firmware: samsung: acpm: Add memory barrier before
 advancing RX pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-acpm-fixes-sashiko-reports-v5-4-43b5ee7f1674@linaro.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777986831; l=2113;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=wZGIg1WvrcZuYhDQpreZS8xozMJIsonW/o4iqtdaJ6c=;
 b=vzW22Fo9gyaBKn9uKemzB9qhAaJduQL/9Ushx5qlHjwMWCJOJHUz+8hJn8xmalmTzQus8kfYn
 MCGqMwi9nOYByz3EpsQutQNfFuol5X6gMNNK0rl0Glzn7AHBpqYO299
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_061355_573972_0C71E79B 
X-CRM114-Status: GOOD (  12.58  )
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

Sashiko identified a silent data corruption in [1].

In acpm_get_rx(), the driver reads the response payload from SRAM using
__ioread32_copy() and subsequently updates the hardware RX rear pointer
via writel().

On weakly ordered architectures like ARM64, writel() provides a write
memory barrier (wmb()), which strictly orders prior writes against
subsequent writes. However, it does not order prior reads against
subsequent writes. Consequently, the CPU is permitted to reorder the
writel() store to become globally visible before the payload reads
have completed.

If this reordering occurs, the firmware may observe the updated rear
pointer, assume the queue slot is available, and overwrite the SRAM
payload while the kernel is still actively reading from it, leading
to silent data corruption.

Fix this by inserting a full memory barrier (mb()) before the writel()
to guarantee that all payload reads have completed before the hardware
queue pointer is advanced.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad%40linaro.org
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 9766425a44ab..a9449bc33bd0 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -5,6 +5,7 @@
  * Copyright 2024 Linaro Ltd.
  */
 
+#include <asm/barrier.h>
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
 #include <linux/bits.h>
@@ -278,6 +279,9 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 		i = (i + 1) % achan->qlen;
 	} while (i != rx_front);
 
+	/* Ensure all payload reads complete before advancing the rear pointer */
+	mb();
+
 	/* We saved all responses, mark RX empty. */
 	writel(rx_front, achan->rx.rear);
 

-- 
2.54.0.545.g6539524ca2-goog


