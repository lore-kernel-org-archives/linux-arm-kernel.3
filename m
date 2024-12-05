Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285F6E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKhrlzK7pKMmsPY9TXNGvHHUZJEtDgIZ1kDt6TVOg0Y=; b=zWednR54Pe3UB3ZQfYGQvQ8kl3
	MZqaV9PmEH0zy8lL7hKNfjhvOPIrrmjD6fGtSEsEcEVVMEZbRu1ydPsz8PR79WY5KR1liEARhLEHI
	CjwTF4dY7ZeRz4PzjI9YJSosUb2NkL2jlFWDXIRZ7dMGTclOSY3kDUKNOJEWV1ovyqpEhmSLnWGak
	4G6EvRr1L4BgaCZvgBEk3Wxx0qE7JcjKR96v45lydbXU0vFeClYM2GCuxYv8FZonjy8lYPmZTCC/f
	uwwOexhqqtCC8+Ls+bYyiXcjBy1W80DZbELZBkTuEjtEZfJJFsf+5HdiuDd6xymbnGD10nZGjDjyG
	DmWOYXCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFvD-0000000H0Ql-1egs;
	Thu, 05 Dec 2024 17:45:51 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFrE-0000000GzQR-0CeD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:41:45 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4349e1467fbso8603975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 09:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733420503; x=1734025303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKhrlzK7pKMmsPY9TXNGvHHUZJEtDgIZ1kDt6TVOg0Y=;
        b=qYFVK9aiG7qcxdDH3DIvfJR7dGcPAOZr8uQ05TZk89HiuoCd3u0CtfPTju4vnVG5KU
         NQDjxR8zKC+L85gre99PcEHShOqpFhAP/ZYHD+nk16HNmSTQh/4515nkcnB5fxwK8pP6
         kAYH9DpqDM9ngUS0cKMb6qV992we+lh1yn350j10uGQLcfruANcOdiEB3FMt94pIlEZu
         T3xGM+Jbori3zcTFo89ozYAJyrX64ISo046swXKZk9cckZL/1qiwB6dTUcYPgD7ggqv8
         4lCwPvQuEWKxyhLSVgDlg3Sz8qXJtC5284zhIEcUbx7ev3VYTGCXJdNcuNS0gsb3BDrh
         iXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733420503; x=1734025303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKhrlzK7pKMmsPY9TXNGvHHUZJEtDgIZ1kDt6TVOg0Y=;
        b=WDdyJLlTHCbCkb3G7agV0nKruTVua1Mz2FsHzJcZDIvmyhVDneEsARAK9JdfDE/+v0
         TbzoTxV+RrX4/7B0XCTlRWPSdNmyMNRBx8Iw9T4B+D/dAlzSD3h8oo5Q6neEXzDhdVm3
         3W0da+dA/qUSzY4wMkZU7n6FYJHzpJ+SpcgfrXFNNhUzfQsanOhIjQOtpj0NuUD2NxkP
         BiUNryQFFJd6ORdCn0rf+JuA8Uc2whWS1G0STPdMkh2e13+bo/EmqjEa+V1PfmNq1z+l
         yAZaPlm72NuAbIV7y+o3sgSG3J+fXwmvuPO030yk7knzWVv3qa1WKcHDylKH7P+77G1r
         2iGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb2Ju5ReDW+xXev29GYPncT+AWzhk9gBfRImbQYVsZ3F9rhNWg/5LQDq757i6Dv8jm3scQ4HoKFqwpM81LdODX@lists.infradead.org
X-Gm-Message-State: AOJu0YwGIBwMNTjWoMR+fQOmTZ2V84rgqprvig5pZIYIjq0+WBdkLPBj
	WDU02kAywI+4MU60nHtfAYGVG2v7W2AwVtVF5Ea3pvpq6OMctYDso2+APgaCLfI=
X-Gm-Gg: ASbGncttR5EYGDnXWYIqUToFxLX+XdGvkH8G+F5UXuC+B9XxFJ9Xncqo33dNQNfTatL
	ESZWCFgQpF259TgKbbEt8gwtPwsyvpImSlXxw9sDa56sIvlP8gJ02k01Rz++lJPmSkgL3Mt2e/t
	hLJ5o/3ZvwUhnXA+jltRplDHlZNCwdrxq1p8K7V9TyVY4ncHNEU3P7yXBUCvSiMaLnbVhA9Dm00
	LhU5gp8YYqDI/5vFE7rlw5mspEUxHXQ2MjafKmB9WpDZHExpkGVnWg5bWqiIV+7pixnrAE1hfSM
	3oO8nvYifxOM7cv2n77hIUC7hJBTjuTZ
X-Google-Smtp-Source: AGHT+IETTIMwCAt1THUCSfAIoi1qf9ZFSIPgjGWfgvAXtjPszoHVRLgp6w2ts+qYW08bZrcEVzFXEQ==
X-Received: by 2002:a05:600c:350a:b0:434:a7e3:db66 with SMTP id 5b1f17b1804b1-434ddecfe72mr1375775e9.26.1733420502746;
        Thu, 05 Dec 2024 09:41:42 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0d6961sm30318525e9.12.2024.12.05.09.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:41:42 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: jassisinghbrar@gmail.com,
	robh@kernel.org,
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
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 3/3] MAINTAINERS: add entry for samsung exynos mailbox driver
Date: Thu,  5 Dec 2024 17:41:37 +0000
Message-ID: <20241205174137.190545-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241205174137.190545-1-tudor.ambarus@linaro.org>
References: <20241205174137.190545-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_094144_083360_F540F6E7 
X-CRM114-Status: UNSURE (   8.68  )
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

Add entry for the samsung exynos mailbox driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..41a29d1d6e4d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3023,6 +3023,7 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/clocksource/samsung_pwm_timer.c
+F:	drivers/mailbox/exynos-mailbox.c
 F:	drivers/memory/samsung/
 F:	drivers/pwm/pwm-samsung.c
 F:	drivers/soc/samsung/
@@ -20712,6 +20713,14 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS MAILBOX DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/mailbox/samsung,exynos.yaml
+F:	drivers/mailbox/exynos-mailbox.c
+
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org
-- 
2.47.0.338.g60cca15819-goog


