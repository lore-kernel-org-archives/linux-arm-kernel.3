Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8831CC71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dI+YClki4Q+OM8j5JXLpkAENpDyF7Cb60VCru1h+I9Y=; b=u52/NnJMXSm/AVq4UYq0NzHEzU
	TCwmDmPvSY/P4h+14Wr71YnO+8M35ZB+N/2RBsPjZsxDxyNWhYDlTj7LsDsmbaSlVWZKUVNcU+hkx
	R4MwV99u/zu0OX7HYdgAhnujbrSlC9HZ1ZGYW/XPPwZaN/kZz/lmgSN/d+A9XV3tL7gxgt/HgHhkC
	zpJkRW05nqMdEFEjVMEtYBpY3hQTvf77BAEaRgF4MI4RLHBIMJPgRhTWDbY0rEA0/h9EX2yz8v5Q+
	Lj6iaYf1NCduCUJwKpAVgmlbVUu/Z3nGJIBNWHOJNSQ1vkR/jZgCHIf73Qmh0zASjy7FERjwPBE9r
	EOBloBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUGB-0000000BYOG-07qj;
	Wed, 11 Jun 2025 22:49:31 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRuI-0000000B9Cp-1zSN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 20:18:47 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-408d14c7e92so161084b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 13:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749673125; x=1750277925; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dI+YClki4Q+OM8j5JXLpkAENpDyF7Cb60VCru1h+I9Y=;
        b=3R3/q9MfMEDgkNazwNq5svlxJlJmQ4ehBJPEjqTM8yyn6R8xY3h0CALIvtVLvwfQHh
         Hsj3FGHvgrkdqYoR3C1PD5hHe4Xpg6qlHRd1BlGY1AHmuiEgvffTaOyDewscLJJGJqHp
         4L9/bKbm8Rg69IGAa4eZg4g/ozmF9dg5yJ3x0MocNtkCjhTW8y5l32S/IGcqyiYQEGGl
         m1DAjWtdCGchJ3Nnqcw9UogoqotihGo7MCRe1d7CqS6AQ0B8Mt4uM+KqE7CQzVW8Jj1H
         XbzUACUPja6zWj8NjT7wNi65tg3JHW6Oc032e9J79U3oQrkNzxOoqVbc70GnedVXuwyE
         A/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749673125; x=1750277925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dI+YClki4Q+OM8j5JXLpkAENpDyF7Cb60VCru1h+I9Y=;
        b=olUExl1Y6k1u8r6yf6q1SGgxnOuPmZb5lg2NzXM8r7OzTx9zW3WKg0K5QE3jh0Hz/K
         Hwzy6XhE8GXQhPdyIdWsxbExqngCLMEFXEt707IyuJKQU+MFXNAA9kcM/XDowJp20mw/
         ub1GKwm6blG3U35mb9fsPQIJEQamvCp14q59fNVUEObM5iZC1cQ83HYh+26TIkLQ2cAt
         BcYXlYCPcDxyTBs6oTZopNIQa9DcN/SeKDVvtanv5xEmAe6TqAxeGnfp64Tao5mIq8EH
         4MEVIExBHnKmXcRhrImLYJHal2ssv8C7SJEuKeP6pQZ53a+pEBFXBOo23tFEMLkyw/BP
         +3fw==
X-Forwarded-Encrypted: i=1; AJvYcCV+Qz8LuVaBWMGBsCNTq21vpwIi+DceNyKmWgflDd/WWAkYxJUNLmxzxpFSM7hzFK+K8IL2B5L2kMAD0SP/nar/@lists.infradead.org
X-Gm-Message-State: AOJu0YxjKcq0/I8GcAgxplO45ZsxsuyNOpIOhBKGQYCeO7+h5DYbSrQY
	ljZpv3x69qkwe8MMnz/xbKTvziz4SWv55/kbBmkS+EATUAorebz06XB6HcE1CSjuMlU=
X-Gm-Gg: ASbGncuweyzwPOK+j6mMgjFlDYjaSLuDuQFFKRlcUPAiLhRZQcMUGsfu2JsP3BX8vYZ
	8nsoOJPQ0PecW/AtdOlhkv5iZWQv+RfOdj40XUztLJt+jmZIVf5sT4kkOXyeO9Me0w4VNDEKVjh
	pAdvqWfHbWuPqKEb9UmDE8bt60KwKrNbn0rzn67L+j2uZJZk3H+6BYSyk2ZiEeQRpjsDUnxMCPR
	FCe9kazPzlXmxuvbC4TjYw004RpyFpqGQoNOcxR2gHnAwYFUSUc9bZIbehZOHJhD+XlcBNESL7c
	gWTVJEiP26Hzt6GRWFnvy6UDVtvhsORx9AWF4ADDE3o5dyh0KYUOgIZeagbpK2S2JarA
X-Google-Smtp-Source: AGHT+IG+yB4PjXqGam/mFmbhtOtlvWHnGRv/5k7WflE47rsgegPrEoGN/DZYNDmhGQv2uSn8xCKNlA==
X-Received: by 2002:a05:6808:2021:b0:403:2a0d:428b with SMTP id 5614622812f47-40a66af403emr374548b6e.39.1749673125624;
        Wed, 11 Jun 2025 13:18:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a5d80d967sm467732b6e.4.2025.06.11.13.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 13:18:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 15:18:09 -0500
Subject: [PATCH v4 1/3] bus: ts-nbus: validate ts,data-gpios array size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-gpio-set-array-helper-v4-1-fb86a9b499ab@baylibre.com>
References: <20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com>
In-Reply-To: <20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com>
To: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=SFpLyUrSkeov8lTDekLTl8UML1Z5oaveGJ3pRpViCz0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSeSLaTcGiZbGvyVCGhUPWDMAFdGGlhKp9QYAq
 w/8u/EwnpqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEnkiwAKCRDCzCAB/wGP
 wFJ8CACa6UjbtPBARyaIgkjAgp72QK4ZU1HZKfzr8KtlLr5R/CB6QnsNyw4TZMvcAWz1R8miGwK
 rnOoKrQzw+aGBFMT3k/vjRj/Ehsvsfu4W7bFWztvUhRK/1qwRLzvCYaCuNLRC5RYiyIC6MJzcM5
 1GKb1EeWt2KZ3wrqA+7OC6UAhPVG7td3ZBG9Md3rkDtHX/buSAFTEANFbH6uZ9+x3Q/6aiS1Wh+
 IVJDljCJ+oaaoVCOqFqVCre6Zn23FWfV5glFDG1hsak0No0f8a5Boidw1BqPCpQnkk/vGRFklwS
 Gr37dNhGA4ZAKQJhX5AnkMka5GObju10gyRpBCOMz+gcGOl/
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_131846_515968_43084F7D 
X-CRM114-Status: GOOD (  12.35  )
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

Add validation of ts,data-gpios array size during probe. The driver
later hard-codes 8 as the size of the array when using it, so we should
be validating that the array is actually that big to prevent possible
out of bounds accesses.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/bus/ts-nbus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index 2328c48b9b1260e805c631f2aa7379d620084537..d3ee102a13893c83c50e41f7298821f4d7ae3487 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -48,6 +48,10 @@ static int ts_nbus_init_pdata(struct platform_device *pdev,
 		return dev_err_probe(&pdev->dev, PTR_ERR(ts_nbus->data),
 				     "failed to retrieve ts,data-gpio from dts\n");
 
+	if (ts_nbus->data->ndescs != 8)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "invalid number of ts,data-gpios\n");
+
 	ts_nbus->csn = devm_gpiod_get(&pdev->dev, "ts,csn", GPIOD_OUT_HIGH);
 	if (IS_ERR(ts_nbus->csn))
 		return dev_err_probe(&pdev->dev, PTR_ERR(ts_nbus->csn),

-- 
2.43.0


