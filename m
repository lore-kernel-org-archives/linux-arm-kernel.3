Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291FBC71150
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dI+YClki4Q+OM8j5JXLpkAENpDyF7Cb60VCru1h+I9Y=; b=x8YZxL5YnWCeo5wsh9lmyAILCw
	DqadprfNJ+wOg+0R3InmGngwyeD/t9JFdBpZ7jvMmPr+wSZ6ZHt/4H2ypN4LfYTbuLOFWipEluDt9
	Pg0gvyGYr+sXfTT08GCcYdpiWldZrQ2kS7QHQxHOKoM9b2oJIZ4VH0ekf/2dMn4tlf4tkQiuzP/ET
	fEjAUSUxD/nqaWWxq2BUz+xyr8/gAcqZKUK3SajxjAbb7XATlSjujxINiH0WQUHIQNQpbjDSJqlbA
	LyqeRgKPkDtWiHVvG/rgpF7bVpIIoD9yjOBKKsFfvvoygKE6AgD9qntjcnFCBed6aOperTRaNZDjc
	mDogBTKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9wF-0000000HQEN-3Hip;
	Fri, 13 Jun 2025 19:19:43 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9ZQ-0000000HN1L-2A8P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 18:56:09 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-60634f82c77so716159eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 11:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749840967; x=1750445767; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dI+YClki4Q+OM8j5JXLpkAENpDyF7Cb60VCru1h+I9Y=;
        b=q2KqaO74mY+0FGhobHCxgPfHMCKbIxk6r2Htq3OJfs5tu52Y0ubKsFvndBNuoJSRNI
         yuOaeTIcpOemdVNlNTk3EWUKWc3XimipwUyfmwbDQeMS0L1ui2LVp9qJOMbgt5YorLLQ
         Z+O/000AyuxtN8iAKep9u4aLiNMJwr3yY5trFeBAEC6AijQHWsltzgbMuvlk1wjXIe5p
         3ioKGXEk1A2KhPLTh5yK/T9ARSUmlF3bm53UgxW+fmbdomVQqGk7YYvvlsvSkvmlmZFJ
         zociogpfRKxt4mDSNJ+yCHAf42w/P0g2o6qh5qI2YHOmu1Ql244Sorp8hZaIdOgTHtDx
         B/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749840967; x=1750445767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dI+YClki4Q+OM8j5JXLpkAENpDyF7Cb60VCru1h+I9Y=;
        b=Y7Y8gVx8o2oOE5eeVRb7p+KFmWpqldPrwCFathGSkLlR8pP+sLNxAHisjTRQIaK56V
         LMjniJqAWHbapXSPQJuoheTlPs6ihTMt8bYT0Rc7u7YY6IsCNmxT77/3Bhy2H1pdNd7c
         k1UZHBPVX9qwYHgarNtmdS/v/p5MdtejAdFIAnPy9VK/thQGU4E9Fvf2/Q0+eK0xYlpe
         kmlYNka3XQ2cL+zfu3gS78gxvtl9wr01X87oHg0qFA4pLk12jVn4O8JDQuOQfkZ19Nin
         ZV8CTc0UUbQGr6YRqFYXqLM+QNB1qmP6W8O+IT1UTbIltn2fr0Ih5qk4tG16PjG+kI0x
         1hpg==
X-Forwarded-Encrypted: i=1; AJvYcCWo278UCwdtRrV21uTH0u3w/5J8jrDXededtYW8JPuzITBkMoSdgxydojc0v4TdYfsg3De/o/pTd8TxmKxpWjHf@lists.infradead.org
X-Gm-Message-State: AOJu0YxZthdJMGIkUrl9XUePbUptmuPtmpLd0MVDNfQ74PfdezJDrxC/
	Hj5LyurWqFcNiIQTRiufmF7n7Uy0S1NMLdKpV25BmAR77Cjs5ImF8rQk9DsuKZ/CzOI=
X-Gm-Gg: ASbGnct5IkEdu+M9MWQbaPcmFkjSk8gzFg8loKaLxCNmqj4+AUD5okqLVrH6bc0jwd+
	SY2pbUowSe963LXfeW4I1AYYHrBjBVrfiwqfII9YhoaE9GEKL3P/tTnZNpXv3sxGXDFc0u/N4iy
	W5xpeqSm+99WeJ70nnNfBrPUamS7zyw8C9pU1Lxg3CmFWwvHoq01ZcO+qNH5Ccmmc2A/wl5RbBx
	tAaawpidDOjKblsPg2t2TP5IU69JWZnZ1GMa6JimBBnO2smxFHmJGm6uc6TehSD5qqLxqJi8Vy9
	l49EaP6QhrC2PZCB4bI8zxn26QbS1vrJj0qXsgOZWI/+Iabel8nHpjp+acRtNeVcjFc=
X-Google-Smtp-Source: AGHT+IHIDNuqhtDyrUFqLqhDihe2otHFXjR2z0Uj0/IxHd8WHsBb5KQ/hfkoGSBN5gTvsdjyeJ771A==
X-Received: by 2002:a05:6820:2220:b0:60b:d6f1:7c50 with SMTP id 006d021491bc7-61110dfc503mr554725eaf.0.1749840967556;
        Fri, 13 Jun 2025 11:56:07 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108f07e08sm256244eaf.27.2025.06.13.11.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 11:56:06 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 13 Jun 2025 13:55:28 -0500
Subject: [PATCH v5 1/3] bus: ts-nbus: validate ts,data-gpios array size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-gpio-set-array-helper-v5-1-273fab50cc8e@baylibre.com>
References: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
In-Reply-To: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=SFpLyUrSkeov8lTDekLTl8UML1Z5oaveGJ3pRpViCz0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoTHQuTsVQSh+FA+OKrMbq7r95SDLAKurmzl6n4
 eF3OJTvep2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEx0LgAKCRDCzCAB/wGP
 wLf/CACNf5sXMZSBwHrR52sDXKkT4pw+mfyzKQkTvQU/RNoOzSFHeNzl3etvgs8aItFSQTCaZDH
 +Kn1nNY/N/mbvJKdZpsMAD/LgP5aR3hLOcp+IfbZ1pzhZj3uMQ8XXf0VVGzRhEVhy/z/sIzJZpi
 bA2KUclSU5ndPJZS96FRk+LAbirsKK97ExHRQFZFC8xgl0II20W/hPiGtdgs5A/1YeGynRLaomM
 3s9oScLTVwynnmJT4qlp0I2iFLDFrL1qz65UzoUG3nUabTPNVmjHfYqNSOsYfzXW8bfZemySSAD
 ZfmCDJLVCIdbBRkoiY/FfEcScqIm2bvrZwi+vSvvOwjU54BE
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_115608_561559_2A4A251D 
X-CRM114-Status: GOOD (  12.37  )
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


