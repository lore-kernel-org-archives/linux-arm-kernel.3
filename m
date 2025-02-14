Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E9EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 16:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gIR0AdSggEhgWpMCtVYqLC2S9tpi2gmKnvd/bPSBRfk=; b=txOOzdI22ZCXXiwLjV2aowd2Bb
	1TdOa6oMDdkwqrFyi4CXYoNFp2NJgaJ7kGDTsbJ4XgdvwgU6sZIw1NAUWbPT2k8RVj8FTtAd24fEF
	M4Ej2tNTkNIim6DZAOztEi6GxKB5rI+D5Hi/hHU5eypGjj0t8+U86xuAsFhvWnk0Cy9lFks/P0nQE
	nw0FUnD6z/+WA8fPUVQq215KPuB8UM/1KWqtC7Rii5sGD/3j6Lgp5/vtFYURJ722TxoIYqxDz6kp0
	+YGllQck6sBiSapKwQkXsF6PDWIsfMptbX0VYqq48f2MCndGfmTQrBVA1lD/P/G22SbnI7fP+rvWt
	fNzBFyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiygB-0000000FXRn-0QPP;
	Fri, 14 Feb 2025 16:36:39 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiyeb-0000000FX3o-3zix
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 16:35:03 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-38dd9b3419cso1210706f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 08:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739550900; x=1740155700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gIR0AdSggEhgWpMCtVYqLC2S9tpi2gmKnvd/bPSBRfk=;
        b=etZyQhutulc058EIH0r9fH/atTERH3QOx5U9PW/5Ti8DhE8Zr+b396geH37xyVcgwS
         IB813XT7d/eWE8f+sqWe1XnY/KW3o9KaHDQO0h8sHz2o6jYPkU945HdSiOa4DEEp1sZe
         9cbjOj/wjaizU7e0o+SdXWd9HceedPidryDlwC92WN521H2zEUTOE/fxb6Xyp2aaBNXO
         uQfin0wMZwya0Uwg5Ubu+EA+5VRI1Dj3fZjjMDudR1SSBfSWHvv0usYFRizRcu48DoPE
         fDsIo3TPInnZI/8pVrJR/2zUH9IGOBtDrJUEglM8/Mgcfu5dNoMch4um5Oie9AjoENhf
         KSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739550900; x=1740155700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIR0AdSggEhgWpMCtVYqLC2S9tpi2gmKnvd/bPSBRfk=;
        b=Nt0vRbSfuBtDACnNZh+DuyiZ5W0+Dgj6m5QkuYDmJ0qvsU32zrqG/+FBgcwffK2vBE
         FmWKxPUTjaqns1m4B01QSPcy4tN1E8mXujexHExTncZKv2IS6/L74dtabPB5Zd8HIhf+
         LmaGMtenv0nPFAlZX9hVxPghcS8huV/e6kREONts3fV3SI9GXiuvcZNhzA7THjFTLz98
         uqT/8gOnS0+pfRS6+KcvEmTPJYpubrAgyXVTbcoZF7vV+/VcEwzyFihI9IpcG/PH+hmI
         VAvIRdIWdisIpPJiwH6/U3VvAwsowmKUEtIjTaf5AJFzfDg7uoXV2rYQgrTONMN/3pBW
         3bOg==
X-Forwarded-Encrypted: i=1; AJvYcCXK4JmdUR4jFnMe5tXIr0oz01VXv//q0K4LXvoKE1/MBDRyIIRkIm3CYFvOibcKUusdOsOLFBikafv89s2YIiDE@lists.infradead.org
X-Gm-Message-State: AOJu0YwfxNNHqyM0+c8mJwFRIF5hFV/uoZ+Sky3UVXkN12SKSxqJF2nD
	9KrQF8od490nsGMbVqUNz0B8bjShReIMjNjavmaNVa7hED7IALppRoj2+mX2nec=
X-Gm-Gg: ASbGncufX+4g25ABy/MGklvcPuXnYQ/BKVXgq/WqoehMBXpDoHQK8v6d1fLaFRCz/e1
	K7Kfp7vRuCfjn6TpV24uB6drbzPXuvQ0QJF7aqHJXPEuGuDN6MC39eP6s3ygQxgXRzbgVNwDNeQ
	YkQKSAJtnrKwSDpXI2XPZhKlw1DruPVVur2VGDUm7OV0Vw9SThzWAedUecNU3uZTua8RirPpfIZ
	lHd+74djLnKRu+2JK/sgXQuY9XsHMPkNXfejbKpCH+0z4VmnpHFLr00i8fsuonMKN0NfKeUSyar
	iaavtarD1BWQBm8JaaAeh+PyxGaKMmpDUjkRsjeFBI8hyhRB6P6naqbtyA==
X-Google-Smtp-Source: AGHT+IEMCdXyv0s4XDmuQOjYDPxcnYbsYJNf2NW1B+uWl0/9ePfEAn3vi4ArakFnU8g8DP+8vQOBGw==
X-Received: by 2002:a05:6000:144e:b0:38f:2847:f5d4 with SMTP id ffacd0b85a97d-38f2847f702mr8619632f8f.28.1739550900149;
        Fri, 14 Feb 2025 08:35:00 -0800 (PST)
Received: from localhost (p200300f65f083b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f08:3b04::1b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f2591570esm5111371f8f.59.2025.02.14.08.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 08:34:57 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pwm: clps711x: Drop of_match_ptr() usage for .of_match_table
Date: Fri, 14 Feb 2025 17:34:42 +0100
Message-ID: <20250214163442.192006-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=4nnLvcYtIwwsBUnYwVJaT81gdGfgqczxUSHuHeUAn4c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnr3Cj9X55rnU9bMvi2/DXD1ODz9JH/bAkEqBmE Q9bTYrwZ1iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ69wowAKCRCPgPtYfRL+ TunCCACR8VD3rkxhMiVVhtr0J0Izfxqx6SxRr//tRHgOZs77QV7M63StxkzLLxm2PklQmE/a63U MrIqkSS+N9bTle6bw0iY3b1sAwc3QbmShWtsYsUn0X+QQhaVt3AnRe1Qwt+2NDrmBzcbzpc2uj/ SR6zL0igt9fC0AWsY/Rz/gV3+SuTLnroSJ+Sc3dz9UHzvnAO4L/dqaSXawylNUyXaizDCqCm8SQ HUFdFkPdKXwGZ3nrYhpYJWbGPR662cCI5MSCC/d8n/hXsN19AjkvnSM5WBmWOK+hnIvDrOs/ygT iYMxmiJIWbno4qE8ahMU+uyxn7QukYdX/RTQXvE2gIRwj5Jv
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_083501_995379_E0D9BD6B 
X-CRM114-Status: GOOD (  15.24  )
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

The pwm-clps711x driver depends on ARCH_CLPS711X || COMPILE_TEST. With
the former being an ARCH_MULTI_V4T platform, there is always OF=y when
ARCH_CLPS711X=y, so in practise clps711x_pwm_dt_ids[] is always used.
(And in the case COMPILE_TEST=y + OF=n this only increases the driver
size a bit but still compiles.)

So drop the usage of of_match_ptr().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

inspired by Andy's patch that does a similar thing for pwm-pca9685;
see
https://lore.kernel.org/r/20250214154031.3395014-1-andriy.shevchenko@linux.intel.com.

Best regards
Uwe

 drivers/pwm/pwm-clps711x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-clps711x.c b/drivers/pwm/pwm-clps711x.c
index c950e1dbd2b8..04559a9de718 100644
--- a/drivers/pwm/pwm-clps711x.c
+++ b/drivers/pwm/pwm-clps711x.c
@@ -98,7 +98,7 @@ static int clps711x_pwm_probe(struct platform_device *pdev)
 	return devm_pwmchip_add(&pdev->dev, chip);
 }
 
-static const struct of_device_id __maybe_unused clps711x_pwm_dt_ids[] = {
+static const struct of_device_id clps711x_pwm_dt_ids[] = {
 	{ .compatible = "cirrus,ep7209-pwm", },
 	{ }
 };
@@ -107,7 +107,7 @@ MODULE_DEVICE_TABLE(of, clps711x_pwm_dt_ids);
 static struct platform_driver clps711x_pwm_driver = {
 	.driver = {
 		.name = "clps711x-pwm",
-		.of_match_table = of_match_ptr(clps711x_pwm_dt_ids),
+		.of_match_table = clps711x_pwm_dt_ids,
 	},
 	.probe = clps711x_pwm_probe,
 };

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.47.1


