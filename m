Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF2DCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 18:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OLBmvaasF2LSEi3ZR2o1HrWy9QPsvaaeIfrmaMHo1Zw=; b=jhGxHslws29HjTjXEcxnNRO5Ni
	o0haiBk75Gw3aHhFnr3n1wFXPi60JCM8Ia2/yKpLUw/vzsgo2AyQfDBV+WbhBNTQdMcyWaw9ZFSXW
	OOqK6aycY/al3nwUCL0DMtrvBTK02k1JoA5UKMwu7zVMehYMWbVCaR4o/pmHgjFdieLR6IcUuLXC2
	t+WYv20jB6MFwp/jhfkBHU2mB5j5TXILcttevaC6xB/O4TWMGT+Wben2TCw/EX6lZ/3IlWUmnSoMs
	DAyTEW3/4ortnrtkcneMrho0oILfL47CNNp48pzKvH3s6phl4/s8PXoDkzSx6TwQ58JED4YCzSxS2
	DnA2ByJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6vWR-00000006vHR-2jHk;
	Thu, 09 Oct 2025 18:37:51 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6vWP-00000006vGL-0S9N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 18:37:50 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7811fa91774so1145577b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760035068; x=1760639868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OLBmvaasF2LSEi3ZR2o1HrWy9QPsvaaeIfrmaMHo1Zw=;
        b=UXURiWK1s3ILfZpkWN4ZL0p0tuZoM//MBhi9nlgq25P8FKMP2x2IxHs1JLlDAE2IG2
         U92TMVD7DKwu8RflmNy668yDYtA+NjBHEJqIwjQg1xz5ViF9YivFtWiJzj862ZN1LP9y
         a/NgLS58XfC63JUSw934gDs6gCKzxJqJ6jXI+IaU2Hvg0Ew/eCWMxBEHV1JOCHz3gc/A
         XRmmQdLSVKIpn8cDxRoVMhO/v5/aJUQamOtNHbrcc9fM6HiooPGfLzvFlW3RDv803cYI
         tUmX9gssLiY9guKiK+qztQ++wJdWoE3E+A+yG3c0g2fbJ+HaTEPg19aZkFcveTdg48xf
         emrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760035068; x=1760639868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLBmvaasF2LSEi3ZR2o1HrWy9QPsvaaeIfrmaMHo1Zw=;
        b=OiriM+Gh3yjvodnEwPMP5rr2eFUr6avVSuHnes3ToLwaVluZ7UHA3Ac4O3RLoEIZU8
         Wt4MdN28gr0wEB0Q1B/MVYBCdS3Mb49TDlf07FCc5JESRMtRQfnyhDDFDK3odLNPnQsT
         rYz2zDvoXgZ05/g+05VrmuP3d+FRkPZHowLO5kewWYQOwTdNgJ5c+TnwES900KDGVH5R
         DuG9baahvkI0B+zmUvKcKs+hUf3gu1/mPrZslHd3tFM26IOrRFJZalJ0RaK+S8tSRNdK
         QFpAN8jYo5tVTshNo6KGoimuU02TWkakwY5KW4ziDOU6oSUQ4scWBFP5nT7429A0ut1u
         4NbA==
X-Forwarded-Encrypted: i=1; AJvYcCX8ptRjGTHBbI4DKBhTr5QUFhCT7sIgqvztZSUzovhwxcWw+af06ufxA+EJotMfHMvX5nFuY3nuULELJQ7WebWF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3Jl3h8xGtAcnolOSkYaAHB8WopIDMZlkDFSrx4dtIpOPfOtB7
	EFDFKMI6mzqV4IlGYhRmSJSSBh+L9DyzwKudm8vuNQm88KF30l7bS98=
X-Gm-Gg: ASbGnctL8jcyS4rb/E3IWVR7Rf6QBevkKVQaN6CsDQG68a8WkLvOJfJGeKsLMf5Kxkh
	FpuO4Y5VqTaSfkJ3BBzAPGkLIEsjI9ubpv623k4Rg8fKMpHe9N54LwpD/hit5rR/9BjdeZqfo35
	oyQ4FP66Plx3syVahaeoN9qmWJ2sQX8x9PzMthuliE1Whv3ZtGAod0jkmVtnbsLapQRe6oSMq+m
	s709p4mWmnALV878sN195mPVC03KdBF762u2Whr7NDgj6MMHvEakGunTYBqx1nogJ3fyV3iI2/E
	xywmxsFoP3YmmLWdM6gC58rFW/cTVcOFiT+aJHw0q8pqEQRIUT7K1xiv2ATsPQ4fWgf/lq6nkU/
	4lUG+NMhE+4kfwfGnbVKK4pX1HGGOIxqPwPi9LYwMZWNT2v9p7AIw8P3dvdj6YwfVCIj3v6dS2o
	g3tiliUO+how==
X-Google-Smtp-Source: AGHT+IHufRCD1gspY8glmM8lax7BUG8ynHHaY9o6yM1T8DIIM/vktiuj0NUkBXjxADybbCWs5+RgFg==
X-Received: by 2002:a05:6a00:1894:b0:776:130f:e1a1 with SMTP id d2e1a72fcca58-79385709579mr9273576b3a.5.1760035067817;
        Thu, 09 Oct 2025 11:37:47 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([171.78.199.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0c3a38sm411630b3a.41.2025.10.09.11.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 11:37:47 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: atharvatiwarilinuxdev@gmail.com,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sebastian Reichel <sre@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] macsmc: check for missing SMC to avoid crash
Date: Fri, 10 Oct 2025 00:07:32 +0530
Message-ID: <20251009183735.1288-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_113749_145119_5701F48C 
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

Users might manually install these drivers
without the core SMC device, causing
a NULL deref. Add a guard and return -ENODEV.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/gpio/gpio-macsmc.c          | 3 +++
 drivers/power/reset/macsmc-reboot.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-macsmc.c b/drivers/gpio/gpio-macsmc.c
index 30ef258e7655..7048b45953bb 100644
--- a/drivers/gpio/gpio-macsmc.c
+++ b/drivers/gpio/gpio-macsmc.c
@@ -238,6 +238,9 @@ static int macsmc_gpio_probe(struct platform_device *pdev)
 	smc_key key;
 	int ret;
 
+	if (!smc)
+		return -ENODEV;
+
 	smcgp = devm_kzalloc(&pdev->dev, sizeof(*smcgp), GFP_KERNEL);
 	if (!smcgp)
 		return -ENOMEM;
diff --git a/drivers/power/reset/macsmc-reboot.c b/drivers/power/reset/macsmc-reboot.c
index e9702acdd366..739f94e4ed7e 100644
--- a/drivers/power/reset/macsmc-reboot.c
+++ b/drivers/power/reset/macsmc-reboot.c
@@ -205,6 +205,9 @@ static int macsmc_reboot_probe(struct platform_device *pdev)
 	struct macsmc_reboot *reboot;
 	int ret, i;
 
+	if (!smc)
+		return -ENODEV;
+
 	reboot = devm_kzalloc(&pdev->dev, sizeof(*reboot), GFP_KERNEL);
 	if (!reboot)
 		return -ENOMEM;
-- 
2.43.0


