Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5097BCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGzycItuSiWLzePfs0iR8NZ1MGamLLUApmHPBB2Kekk=; b=k2tGGw7QOQvQYCvk8MB/0QD+BZ
	FBpbivaAkYx87fIrpwMYlDKqkqeAYtNFe3C8y4aiaSyjTrlY7xRE/zgDoMOcMucoTcaotHrg24lep
	xMVQG6dwpAPk3lm4wENMvqRcLEilRbSNqRWeP8PtyJVpEebxnh9NiwUOgn6wmME54Kl1AmGNaHBkC
	T+b0WyP89RF9OPRVVks23N+0e1WTuRaOJsGELt5aZ2lpjly904JXT9TOmXsMimX7xfXmlI5rNjHiE
	a1uZ7JXB+dFl6QxkUOteX5+fluUG1nQd03Aum/Dj9iWRt8qshvZvoqKiFREcWKOjV5ayaGyacOpyP
	94HGzhzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofz-000000067TV-0kxQ;
	Fri, 31 Oct 2025 12:56:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofo-000000067MS-0mAT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:56:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-475c9881821so21481725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915366; x=1762520166; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DGzycItuSiWLzePfs0iR8NZ1MGamLLUApmHPBB2Kekk=;
        b=ddt/QVkZiZGPHOgUybIfUkLycK2kvC+JxqLM1hD9zU594OLFwuVmzEemFi84kkUabZ
         PuB1Gatf2dBzSrZ6F3/R6yZDx59W0x1XjfobD7YHIv1FtXuoTQ6WA0Cgw0i6zk8vFoiu
         HsGfR+fvMGxVlmIFvd4cBarVlQfRFFOu43HT+ogBTMho9gWW2zbaMVw/VnhYfR3C5y8L
         Dzjc20fPDdgYiXwqpUSv5dKm92XjujN0oUgWigaVbZeBiQm6kBvl0XIP0CTY1L0KhzTv
         X8X7Hftm4KM9JSs+aWzLCY243w9KlYCEKWjkK/RjYUwcwc0TAu4R9Bmf8L8PNc5A8eP2
         94Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915366; x=1762520166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGzycItuSiWLzePfs0iR8NZ1MGamLLUApmHPBB2Kekk=;
        b=dClqO/SVU9q7+0D/dYBYGIXa9VAsybrdRLOl8+PjynlJbowsOSDvhgRikyyLTcKwwJ
         /325XrcY/gGQO+RDvvKz5aBA0azRy94EyKaUqnMwZ2cboK3d3HhCP2VtB9v+Zzl8LksP
         DPWjTF1SAUVeTAhQT3GVBvZgvryQmZbaZ0DvPATz33jL/dhXMAerpF/pxJIDSjnf7B2G
         op+9ssx1K9xZBefFEo96ZtRjtj63HOt1SuWvFqBJ2xM/23Nhf1r5aJ/HVWWEAST1Xa11
         z6z9vrLEZeW23WWPRfi8A9zt+WOzniBSp/HjF8YZ1/Yyze1JylWVgIrGFaw/D1NuaiDi
         vyYg==
X-Forwarded-Encrypted: i=1; AJvYcCWwVL0/p2H9aDLSlb+IJ0Ste3cjHIGwF/qrS3SxxaJYOwkirb8pdElqC6czvKSw2HHIayBmkvc8QFn2Q/bxZjtW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy56jSe1f7RD/pevDYTYCLitKWDLfxcwQJSN3vAhBM5qey30t+
	TKIfgGBkhD4KZhE08zyc7hen4AoK+TPqhNGh9KW0wr5Bd9d11rECbDnVQ84CtjJC268=
X-Gm-Gg: ASbGncswk6mqY6gQzsVVyjTCf6Qwv8dRA2cgZSpcysk2NgkLwEKnrYsSXBg/Tgcy/nS
	rvP80jfbd0MovFA5VowSa54zKPdnqi5YTnZYlkE7R9reHgUdpNgSxTf+DOvONLJ2IE3AzYfTwg8
	X/DE7yTREvLLB84xEVDaff3vw+H2w2L6FWchn5tNCQE/YuT/OG2TU7Tw5+cMuVklL+Z5x0hbbwN
	z6HE9xGzNdcKDMop3adzGXV7qIkXfzk4VzhtFAvkgPhKqcRCvOAGcB1ZoUN0FVFbHfKTNBbb2ys
	5hOfVJj2/fghp846Xch8z5G4MMai2uruUXHI1IhYYEv5YE2xxL1nicfas3Ipz989pL9+f1jOzIo
	5wsCwzuUKsaL8VsHr/j52qLHnajkVeSGwep2Vt5mWQyfq8V4d/IKJlWY4uNyvhfMQ+RaV35MFkd
	tk81JNGk7qkNfQWReU9+aMRj4btmvcTRG0yraf+j2hxRzdKdTi30jRqBtu4n4wXPk=
X-Google-Smtp-Source: AGHT+IG9pEBdndjx7oyiTadyuA+yWQc7v+Ul4I1Z11B4Hn5fGctLstA/eCvhF1GkcnlxdSMTkGKiJg==
X-Received: by 2002:a05:600c:a010:b0:45f:29eb:2148 with SMTP id 5b1f17b1804b1-477300b9e59mr30491685e9.7.1761915366461;
        Fri, 31 Oct 2025 05:56:06 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:05 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:03 +0000
Subject: [PATCH 04/11] soc: samsung: exynos-chipid: refer to match->data as
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-4-d78d1076b210@linaro.org>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
In-Reply-To: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=2584;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=NNM4SFeVcha76qHLmwleNiSAgrvUgh4usYvH0Mgk4ZM=;
 b=GCMSHfKvpeO2dk9a3N5A3IjogAlj5fNR7z1yJcvLIgqPVwAp/5fsSRsiw6fB0LbtnrI11VbfR
 36PzrnjCSa2BSjpyMjkbPp4HUWtCbdwtVJwpUfjVuKxhc50A4jO8YWI
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_055608_249181_EC5CDCF9 
X-CRM114-Status: GOOD (  14.39  )
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

Be consistent across the driver and refer to match->data as data.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index f5107b8b339e8884d6a67a80650a95441510c66c..ab6bdf24a754a0faf974190c1fa1f99735cbef8e 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -106,7 +106,7 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 
 static int exynos_chipid_probe(struct platform_device *pdev)
 {
-	const struct exynos_chipid_variant *drv_data;
+	const struct exynos_chipid_variant *data;
 	struct exynos_chipid_info *exynos_chipid;
 	struct soc_device_attribute *soc_dev_attr;
 	struct device *dev = &pdev->dev;
@@ -115,8 +115,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	int ret;
 
-	drv_data = of_device_get_match_data(dev);
-	if (!drv_data)
+	data = of_device_get_match_data(dev);
+	if (!data)
 		return -EINVAL;
 
 	exynos_chipid = devm_kzalloc(dev, sizeof(*exynos_chipid), GFP_KERNEL);
@@ -127,7 +127,7 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	ret = exynos_chipid_get_chipid_info(regmap, drv_data, exynos_chipid);
+	ret = exynos_chipid_get_chipid_info(regmap, data, exynos_chipid);
 	if (ret < 0)
 		return ret;
 
@@ -181,13 +181,13 @@ static void exynos_chipid_remove(struct platform_device *pdev)
 	soc_device_unregister(soc_dev);
 }
 
-static const struct exynos_chipid_variant exynos4210_chipid_drv_data = {
+static const struct exynos_chipid_variant exynos4210_chipid_data = {
 	.rev_reg	= 0x0,
 	.main_rev_shift	= 4,
 	.sub_rev_shift	= 0,
 };
 
-static const struct exynos_chipid_variant exynos850_chipid_drv_data = {
+static const struct exynos_chipid_variant exynos850_chipid_data = {
 	.rev_reg	= 0x10,
 	.main_rev_shift	= 20,
 	.sub_rev_shift	= 16,
@@ -196,10 +196,10 @@ static const struct exynos_chipid_variant exynos850_chipid_drv_data = {
 static const struct of_device_id exynos_chipid_of_device_ids[] = {
 	{
 		.compatible	= "samsung,exynos4210-chipid",
-		.data		= &exynos4210_chipid_drv_data,
+		.data		= &exynos4210_chipid_data,
 	}, {
 		.compatible	= "samsung,exynos850-chipid",
-		.data		= &exynos850_chipid_drv_data,
+		.data		= &exynos850_chipid_data,
 	},
 	{ }
 };

-- 
2.51.1.930.gacf6e81ea2-goog


