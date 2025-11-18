Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C79CEDD8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 13:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gwKtEZS9ATY9MzLxT6ci8qfNsIOwy9wsbqfh/IjTRA=; b=13PibVKzD4LDoS26us5usuFx5A
	xS2YgllRMs4CaehAE8iEK4aswa2WV946D6RORhq86OLogV4D4GgIIeX3+4fIa6vo/uwxCYKb7sxVK
	HoKbc/y+J1DWknbixQ6Yzk83DBCexxVGDJG0Gml+rjxzd3o0vFvlpZSnBepKi7wZAxzgtbVVDuTYi
	u89WxUcssTyN83zvsONRXFX9YyfNLl2cGOWvJkxTQE/7X8vDB0+B0BjO7DGEH2Bj6d9FlR55GYu2c
	mAuMC44GtkoRCi3Ky1A8QQIgElT7b3myn8QB2bXj1R7PXTsYrpColMvZswbc062LpGGlltKapx4UB
	Kk8NaSkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMCV-00000000VZl-0BzM;
	Tue, 18 Nov 2025 13:56:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMBz-00000000V3X-1n4G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 13:56:24 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso19703955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 05:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474182; x=1764078982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gwKtEZS9ATY9MzLxT6ci8qfNsIOwy9wsbqfh/IjTRA=;
        b=jz7A7kNWl0Wn4UteX10guOZ/sjywzlItxfTQ0DrZ8vhw79+Rrc64xGRkXwTTvPLa35
         So02F4CBr5lojkBOk/ZrnDXz27LgsnU1jU63N5IC8+mKBPCNGWlGQ2GQMB6p13Dj4zwz
         M263FrFijfZSL5077/3aypWJafrwdhBuH2qY7KdDosDDYixbkskeUyb5Q5cIRcuV7KIC
         EfmV+iwyWauVwl12Kq3qHYjOsEyq26tqZ9egnPYFXLegHVmSi+c3S+uvP2eH1dDK8ig6
         Q2czsDDufuGB9mSAgnuAmyMFXzdW2SCKgTQygIQL/D6wG5CvAqhtDiKrhYWWZQkjLfhT
         uxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474182; x=1764078982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3gwKtEZS9ATY9MzLxT6ci8qfNsIOwy9wsbqfh/IjTRA=;
        b=Qoc7lCrv3mNM4f/EW8630QO6Va25Y5whyjmRV5uoD9roTFvpj13QwwYw/ysNcJu0IK
         4eUEJX2TXQ6iYE9HpgrCSC6Wq+nUnvc8iHRDQ2TNiVqmTxMpAXjk3H68eqV1bwlAzXi1
         G5Z3OHU+Sg1ZJT80NuImCg2KYBnIeQn2R8xIt9j8Wf2j7qYffILb/c0Q998EfNPMIfED
         k29pQAbtmD9iaAU5qjbhJRQMOS6Gkv8gSFz3Ps7/hCpGYR4ISDwvFTKxWf/zJzQVYBmP
         cmgF2W0QnsxuInxTunWBfD/Ceajxzbp7zrBqdcaVgsJmRCOcyzNsWa+CI6MUYiM+sknT
         KxPw==
X-Forwarded-Encrypted: i=1; AJvYcCVmgGFU6MAbZe0c/JBw/Fq+JBZHBKtl0txOTSkR8w9aTGssdewYU0N5YauA69747V8O4RaauQ1fZ8P3rfUDqPHU@lists.infradead.org
X-Gm-Message-State: AOJu0YxCLND3eSe1ghSBV4gOk9D4yu9TjwMcAYfmLgQRyzHUZoRxNGUZ
	Ge6Az8prNGLdOCX65g0AsYh0SmE8UPUWL63AQAwCueuVmWbIyl7ZJfDbAI5yAgwbO04=
X-Gm-Gg: ASbGnctJygnOrMye4jPC2jwDhLrsFsVfRrHHu1Jf4eC2NB/l7ghjA6GzyUFcookuH4V
	IpMwb3lQMSFMyZSnSuhsg29JPLqez2tzGWbZl3kMFiHcw7rXjrKeeWYbadJGQ9H8nr4zBFgq0ux
	rJlgV6LEnGAP2K4p6PqU48Db/ev25LYAJ1gB+W9NcpOii+oANoguF509Qk7yw4p6qYo6pCMGPka
	jX7f2icVeJk52z/zVrDIGjV9wSy4jfc+pK54H5cd3avWbGHsa0LclO1yLPVgffQ2YqzbEzhpl3+
	wp1kLVDH/9H7xy0L6/lgegK5XBRtDyYCGgY8A40iEgqpVwHKEumirwJsc7bYR6ChmckG1FppJWs
	lYxcTnx8dLDtfR86GQcJiBqnCj8KKdfOypvTfUkoezK62TL0qCpJ3ghu/TFkVlJAWdLCPO6BL5i
	cW8RByMldD1RjwrXuf+8KIa+Sm3Z5rgjIrvgg6gnmdpJOMmlKc9Ncq8VWvNmNoVm3/lily/QJdj
	DozzA==
X-Google-Smtp-Source: AGHT+IFa8oKgKktdspxmJlkG4/viJN34IUfCpO+WsyI4R07URExLBajDeg8RAjbULRVDTx5x7IMutw==
X-Received: by 2002:a5d:584a:0:b0:425:86da:325f with SMTP id ffacd0b85a97d-42ca8cd213cmr3206208f8f.27.1763474181596;
        Tue, 18 Nov 2025 05:56:21 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm32728666f8f.3.2025.11.18.05.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:56:21 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 18 Nov 2025 13:56:12 +0000
Subject: [PATCH v2 5/7] soc: samsung: exynos-chipid: rename method
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-gs101-chipid-v2-5-e9f1e7460e35@linaro.org>
References: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
In-Reply-To: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763474177; l=1394;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=pz2vFfFg816pMsi1tjWB3WxH9y8mdbvU/JiEbCPeYpo=;
 b=wh9h+nJ2m38labT5RhsxjuLGzrUVsY6uL+fQUguC27NBHoTBMpaM1lMG18cS30VkIg8IBfNdw
 8Bp6rNoERAVBlMoO6MNx4mWs7Y7PSqel07YFbs2s2TXzaQRhQaL3WaF
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_055623_511729_7AEAF948 
X-CRM114-Status: GOOD (  13.38  )
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

s/product_id_to_soc_id/exynos_product_id_to_name.
Prepend exynos_ to avoid name space pollution. The method translates the
product id to a name, rename the method to make that clear. While
touching the code where it is called, add a blank line for readability
purposes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index e7dbe1bc45d6af58527125f512c0ff22c03a9629..7ed7f44b6ae5357b71fee3994e4a4265aa870d41 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -77,7 +77,7 @@ static const struct exynos_soc_id {
 	{ "GS101", 0x9845000 },
 };
 
-static const char *product_id_to_soc_id(unsigned int product_id)
+static const char *exynos_product_id_to_name(unsigned int product_id)
 {
 	int i;
 
@@ -204,7 +204,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 						soc_info.revision);
 	if (!soc_dev_attr->revision)
 		return -ENOMEM;
-	soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
+
+	soc_dev_attr->soc_id = exynos_product_id_to_name(soc_info.product_id);
 	if (!soc_dev_attr->soc_id)
 		return dev_err_probe(dev, -ENODEV, "Unknown SoC\n");
 

-- 
2.52.0.rc1.455.g30608eb744-goog


