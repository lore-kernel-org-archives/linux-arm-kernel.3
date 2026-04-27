Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C696FF8869
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xfcec3d2oELkX+F8ksbnLWsp1V1TC87fqGSb/6ZmXtE=; b=MsFkXKlWOXSDTiHvByKks+iWD3
	wxTzP0dwekkpkDndFdFIBX9iF5xIeNUW1JjEbr1+aAg0NH4Bx6vbXHofi5aIyNfu/DC/H90Obv3Lr
	PzlQuTUs3PHp7wIrt4uOtNwGLb/nifGmb7wBXyiVFdeMxSZdX4hvr5XYkW38eU/zKcuXij553aKMj
	3lljQL+IFnHYVD2LXhMv2d+oJ/T3qEmjN6/iOX1//qAMdhJFsivIRjgQ2Q/kIGKp33+t6qNQiDXyG
	iI+2/XLqeHC/54hhT+4/w5HfKT0cFJBbyUi7AVojfYyDf5Gv7cGF0LCqXsQbqUv5QrvOkwXtCOyhe
	BewEj6ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVV-0000000H9QW-13G1;
	Mon, 27 Apr 2026 15:04:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVT-0000000H9PV-20HP
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 15:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Xfcec3d2oELkX+F8ksbnLWsp1V1TC87fqGSb/6ZmXtE=; b=FvjFDEwm4sGx38ro5Yo/8fj6sq
	wIuJWCtyaZb5WDkjkGkhm9EpHEtbNCRaBR8i+A2i1O/1xkwh1IOMko1Resx5Ik1Kp0YmLkxIH2uWt
	afjvZ8p0MEKm8q+SQ5tNsve5JH4fkiJn1ulzwZvWQilGIs9EszeDlavnxZBTC6LKCE8+fPnaKrEzI
	k7D5gdsOK2hAPNtV5OK6aFFNdtsybzBgXzpo5OAc+iBwhVXq2mznAzbHQtOytIyDrvpHT7R2UX0vc
	Hl9qobPhO8rpWQAurKbejE535YRYskzoBc8qSRXsXMkUOoZPS/e2MGAOvosln7isUdjhNfssjzSFU
	S1a0mT/w==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVP-00000000tAJ-3Urv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:04:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso88309945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777302254; x=1777907054; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xfcec3d2oELkX+F8ksbnLWsp1V1TC87fqGSb/6ZmXtE=;
        b=XR+Wbpg0ckI1jy5STlOGiGT8FUOEa4LubJzkfjtUldRtmL51CSorJd6ATWcGE+lITT
         f3eiKp0r7cu4aDI6AWbJPjoQ8cQx4HxAP1wGhMbMMG3b7/sbDOt3Uqwpi2guR7vmNztu
         reT/q/HPOG3zwqj5xaqhujW8KP0LR16Amz1mth3hx5UvrxnW7+8+sWi5YqSiGqzfm2gD
         gwmRkv5aTWX6GL4q4I/eYnWMXpHxPQXuZczIuIA6TRbi6V+cz/3BuagIn/b088tqL1J0
         ophcL40+YgA8sjrZ/orQlWcR5EMGpPlIDXjRzeO3vYoUNCtAGhmEc8Jgq+ghw82UBWir
         NCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302254; x=1777907054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xfcec3d2oELkX+F8ksbnLWsp1V1TC87fqGSb/6ZmXtE=;
        b=fQ/NYxFNuZpJADM0GIfdvdxdKg+Fi6qu+0RhE4YwSv0ykkf+b/P7m+onXUfr/xbuYt
         6L3w5XET7twSN7rVcQteutmfHse293KTJYvBzOlp6y5kVZ7cXXa895xod/yeu6Cj1DHq
         dXogmPXKATyIObCpu+DaOTmske81qPUS2CeJXlRPEFCpdr51ErHopP+59jdS+bwaRj+I
         YekSZlkoMJ0aJCCqqfh4w9w4/5P2akUG/Wn31qsydwsl8llb00fbbolBGEQk5+wVOu+Y
         7dixVTl7OfUfvMXJFxyfOJ0Ovyp5rkMLPxubmrm89tgv+FqQcspB61nGfU+NeOZ9iI7X
         bj3A==
X-Forwarded-Encrypted: i=1; AFNElJ/woC3GnLQ0A2JQCQOjRW8i0Nx8eEaZupwCL/Zo1D5mFwZL3YGEVwyB06/k9IGD9Lznzq8Q6O21vX4xb3dO5ULW@lists.infradead.org
X-Gm-Message-State: AOJu0YyyqfdunA3SqnCmx8Ba6EfsVWoMAOFRpNGzy8rA/nu7ozECDzcU
	0jTOpC1FPPeY502TKNHRNZyESrVEZgJId6WxCHMW6Vtv7UMwcppBkWDfyJX9Lhhrk+8=
X-Gm-Gg: AeBDietd6ytxTb3UvkJeX0dZAvhYEOm8ZCLkC5cKO28WQxcWybS11Ea7BH8lFXDVDln
	GBdvO7Mak4/eEXWFmCJZjPfjgGS2vUnyN9/pS+SjPwpS4sCTAZrpQyI7GCz5ZqpMwME5dM9APF2
	YsjxEgThpQ5mbIP6XMd+fERA/72xFCYk4j+EP5IdioPtmI4YkTdBhqIO2z+BkhDa/7LwXu18ONm
	GhtOnr/bmfzyD/k1gxERhkzxe3qU9elP527AAEyLQn5c0nOM3Ns16wG6lHyRC2OpGnu4/hKpJks
	xYEtXub/az1wAqXSKWkuny5x9VmkmT7wpeZCzNZwjRJRPTQ1mDup4sBCSO2TO1zcpLss7xpa5ST
	hi3ix6XtH0vLn8xORCNaowmhbcqlQ2boT18Ekd1lnJjFfGa3yw3iruhC6yKEwj17GaQDP2nVj0k
	6YTh2KnoKiaO5tVfrj3KXP7X+yc2txPWUbDSgHIzs9SM2aoac08sNokfIyHhYCaquQWwb459Tdy
	37YJm1P8mKnk8BwiQ==
X-Received: by 2002:a05:600c:888b:b0:488:c40b:c8bf with SMTP id 5b1f17b1804b1-488fb73d234mr527219795e9.2.1777302254188;
        Mon, 27 Apr 2026 08:04:14 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm235370215e9.26.2026.04.27.08.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:04:13 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 27 Apr 2026 15:04:08 +0000
Subject: [PATCH v2 3/6] firmware: samsung: acpm: Fix dummy stubs to return
 ERR_PTR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-acpm-fixes-sashiko-reports-v2-3-1ff8de94a997@linaro.org>
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
In-Reply-To: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777302249; l=1847;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=fB8OyE4pYKQPjuNbbE1A8QI3wwuWeF5JuYv3jd8eSZs=;
 b=KohU9VKCfVuIuMOhYROvJR+HIea1m6feyQAHQ9e2Mpn0g4X2Wbh/yKKVyVJF9PPGgjh7Ab6d8
 EfSIXn22EfOCWktI5TyxXcMHyE/XyGEbK9k3ED3GJnlMfiiN9DlvX6v
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_160416_030290_B2DEDB79 
X-CRM114-Status: GOOD (  13.82  )
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

Sashiko identified a potential NULL pointer dereference [1].

The dummy stub implementation for devm_acpm_get_by_node() returns NULL
when CONFIG_EXYNOS_ACPM_PROTOCOL is disabled.

However, the active implementation of this function returns an ERR_PTR
on failure, and the consumer driver checks the return value using
IS_ERR(). Because IS_ERR(NULL) evaluates to false, returning NULL from
the stub tricks consumer drivers into treating the NULL return as a
valid handle. Subsequent attempts to access handle->ops result in a
fatal NULL pointer dereference.

Fix this by returning ERR_PTR(-ENODEV) in the disabled configuration
to correctly propagate the disabled state and match the API contract.

Cc: stable@vger.kernel.org
Fixes: 6837c006d4e7 ("firmware: exynos-acpm: add empty method to allow compile test")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 include/linux/firmware/samsung/exynos-acpm-protocol.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 13f17dc4443b..d4db2796a6fb 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -8,6 +8,7 @@
 #ifndef __EXYNOS_ACPM_PROTOCOL_H
 #define __EXYNOS_ACPM_PROTOCOL_H
 
+#include <linux/err.h>
 #include <linux/types.h>
 
 struct acpm_handle;
@@ -57,7 +58,7 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 							struct device_node *np)
 {
-	return NULL;
+	return ERR_PTR(-ENODEV);
 }
 #endif
 

-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


