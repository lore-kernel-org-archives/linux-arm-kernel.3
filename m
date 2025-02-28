Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23441C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=; b=DaQIgGaZHO4wg8uF9zsJbVjbEO
	YqFdUiwN1kAKDMKgoE1fatzxlMUJB6cO8+U5iguIdNQ4mq1clGHffsO9wJanIqbXoisX0BlGDvzGW
	BdwK//bvROCsWfqtReJi+6vVeYCC6E/DNnpgL6N+mSAGiEnjxPjkf5RFK9iwtqb2nuV6QmPNXbhru
	1gODZyIPzJtfl+kF/cGuEzqD0zdcQXYUS4WfKPIMH56gc6jsPeTbaO5TqOo6LtQd2AxszBk3YRsCw
	d02oq7oW+YpRZ68JSGRDpIorXTk2Fg4zeLLknRH7BAdtj2KJI1qVeHXjZfS6JkyyiVWpJrHao7ofZ
	buPDbBvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1At-0000000BDqT-1EXo;
	Fri, 28 Feb 2025 14:17:11 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11S-0000000BB5K-2naS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:27 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e05717755bso3097484a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751645; x=1741356445; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=;
        b=jeU2JtskMdAYZtNYJ8cEX2hQiiFRABy15ZOpG+7C3G+2Brg3oejPx1FemRGjnRXTyc
         3G5Q0LpfOvREynm1O7rtv9W7qI/CLpTONiHzThsbP7FmYuTWPy29Kh7N94ezawSEEXMh
         hd3oljXol9S1QIasSrTRyappJOVYuONc6uAwL2iknvlJCW4ypE87hKuncG+ui1i4TEQf
         uhPH2T56QzfZyHYLqvN/6wc3WPsEBxZ/sX+gEoUO9SQhrflkdO7XOuetK8F91hgxtzQ2
         BwNGPu2ikkxKOPYHVclXI1spoVBWtHfH/fLnq2mdeOkHJlEGz+gq3EyUQvXBSxZ5UVE3
         IKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751645; x=1741356445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=;
        b=AIqQ9vUugQ+hX/3bVPbznv0XTy3ir+cL+RuK//LYj0OdLwC1DYV4147stDEPkzqMS6
         fy37WxKKOoj0wVy1hnM7UHt26i22EFckQk0IZkYOOBExZJEuJ1QbD0ty4lL5BvHduvH6
         OYxiHrXtw0d1NC0DhKtrvSYED72kcYBhN4XtlP1JK6gC0rP1+bUUy2L00FkB7DDvF0lh
         VCjwVYXeQar5+eIebEtJ7nJSQaFKY6TLorRZTv0rkHZ3Xaa+Wgnk8wjR+LwS0Sf1hkjf
         hHhP7Em9Gca0pfXEsB2y98aUX77Qxbf8uZAlF8vu9Amlety8GM35ZjGfewFOg+OmQjEy
         nDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE8rXUHHYjtfIPrwjEPechzUHp7+vU7Iy7AobvOCKttNiQiMSgU3ix51xTIfCLU7V4o7vNcbDiLL6AKwc9Ozdv@lists.infradead.org
X-Gm-Message-State: AOJu0YxUxNRukkuJVcNDflGNxb2KhsWuzz8eBJucWWqu3EjdT/FlQ4mM
	vUGPaNO1TjnjoT8hg2SIyIjAAny0tHAxxyJltpBzIYXjDN9ZI1i5eJTKSdTJLcE=
X-Gm-Gg: ASbGncscFH9uFjp0Ixvu/eyqCm+QZjBk6ttdwWtOT0x5KvxinXgjU/eKhxoyr+3xRaf
	Enf4hA7N3mfRTLFr+YaxkPVEIivNGa66UC9jEDteEgJEIZVPvPwT7Ti+mHcENNRZ359+v+blvHU
	mbfEfz3M5rhpJENlHt2EuC3qvaaHsrhHhGYAzOZgeHVhCDmx8roGhkeznDonGwno40BciAJiJ88
	zqyW9VD0ZG6Qe+MtXScBz8du52HrHbTY0PuVXcXR3P8dckEgaESgDWvAOBU+A8he6fUJX6/BD85
	XkjB64YFXRg+EhRJzl1ISEwFUmLy+GLigwtQTNR8SH2vAwjr4UKD89Xn4sZyD1ZEEdfGiKIUvl2
	yMS4HOKGskg==
X-Google-Smtp-Source: AGHT+IFjP5A5it0oOhAqjGMiq+zBlLn6/wyStXZ9TEpg3CsfQx18Ux73fzaAw5ZlIGleu7roV3QB1Q==
X-Received: by 2002:a05:6402:84d:b0:5df:5188:11cc with SMTP id 4fb4d7f45d1cf-5e4d6b702a7mr2552045a12.20.1740751645245;
        Fri, 28 Feb 2025 06:07:25 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:24 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:18 +0000
Subject: [PATCH 05/18] rtc: ep93xx: drop needless struct ep93xx_rtc::rtc
 member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-5-b44cec078481@linaro.org>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_060726_710241_7CD86F77 
X-CRM114-Status: GOOD (  14.95  )
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

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-ep93xx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-ep93xx.c b/drivers/rtc/rtc-ep93xx.c
index 1fdd20d01560ef4fae2b996cf366b4f812329225..dcdcdd06f30d1ff6d0939f6bcad2c17c03c5a65e 100644
--- a/drivers/rtc/rtc-ep93xx.c
+++ b/drivers/rtc/rtc-ep93xx.c
@@ -28,7 +28,6 @@
 
 struct ep93xx_rtc {
 	void __iomem	*mmio_base;
-	struct rtc_device *rtc;
 };
 
 static int ep93xx_rtc_get_swcomp(struct device *dev, unsigned short *preload,
@@ -123,6 +122,7 @@ static const struct attribute_group ep93xx_rtc_sysfs_files = {
 static int ep93xx_rtc_probe(struct platform_device *pdev)
 {
 	struct ep93xx_rtc *ep93xx_rtc;
+	struct rtc_device *rtc;
 	int err;
 
 	ep93xx_rtc = devm_kzalloc(&pdev->dev, sizeof(*ep93xx_rtc), GFP_KERNEL);
@@ -135,18 +135,18 @@ static int ep93xx_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ep93xx_rtc);
 
-	ep93xx_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(ep93xx_rtc->rtc))
-		return PTR_ERR(ep93xx_rtc->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	ep93xx_rtc->rtc->ops = &ep93xx_rtc_ops;
-	ep93xx_rtc->rtc->range_max = U32_MAX;
+	rtc->ops = &ep93xx_rtc_ops;
+	rtc->range_max = U32_MAX;
 
-	err = rtc_add_group(ep93xx_rtc->rtc, &ep93xx_rtc_sysfs_files);
+	err = rtc_add_group(rtc, &ep93xx_rtc_sysfs_files);
 	if (err)
 		return err;
 
-	return devm_rtc_register_device(ep93xx_rtc->rtc);
+	return devm_rtc_register_device(rtc);
 }
 
 static const struct of_device_id ep93xx_rtc_of_ids[] = {

-- 
2.48.1.711.g2feabab25a-goog


