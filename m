Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC5ACCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOHP7nyDdbsMDvdN2HPmSUfNbw9SBzb4pYxZJwfsKCY=; b=EtEkSiOHaQ0iV5WGtw88fYe3ad
	HFWyaPN/u3dE54rXC+f+KUIprn6KPUHXllrWMB4M/5Gu+u/I/9+uVlipzwvN67LtRBhu0u41Q66rI
	tjvjbF6e3g9/ZM0Hcn3+c1eUacwon8i1tw7bapOW7+Awul7TKIU2JMjuJEr6pqnetCzP+35UKZZdQ
	aokAZ781h8DzI/xbLTXmPRGVRoLAb4kmjizoBnH41Iy7vw9SLjKaevuSgrGHTIe07kakXC5m+tigW
	WkJDD+oF4JL1LI0C1YSPKS0jlBt47Teu8wiuVRQ7NTmYEV2zNq4VcjyaZ2PppQzzKAL029UDlxZi8
	jEvNoWQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEog0-000000067Vh-2C6r;
	Fri, 31 Oct 2025 12:56:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofr-000000067PC-44vC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:56:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47728f914a4so11195155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915370; x=1762520170; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOHP7nyDdbsMDvdN2HPmSUfNbw9SBzb4pYxZJwfsKCY=;
        b=TUzAw3CeZLxxmvDGOZU/nL80QmcLeKkygwSACJya97/MP5gdV1lGomnqGGHkCwExAI
         ZYWD2defvGPAgDZMREBHknBdEVxIyMUb/8AtqHa7duMkFfuXR7oYOtIsfXOLEoXReWwS
         boBTsFgu0BJUhFswo12AZ5skXhq7kiFm5DJ9xAnDnpcjl5DKxCFv9cGbEQtQ7srFaMaJ
         yE4Omeq/uVJ2K+CkJDpEEMk5V4aVZtg4OXaB4zgfDUZTPXzBBZMxAwVe+8HCUWsUmYlC
         m3vwi2Z0m91vBgSb1xNbWOoYK+WrFZfZckUiN1dQ2R1f3081b/HY80cUtdM8dt2VTNGs
         Y27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915370; x=1762520170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOHP7nyDdbsMDvdN2HPmSUfNbw9SBzb4pYxZJwfsKCY=;
        b=R5PBSOAKKzC9DPMSzeaFRP+redh+QTwoYwWwX4Qr6AE7KUKh+tNZCvOTGVzCIYWzr2
         v+Ufv5nFbn3bicjNNR8cawQgSvmVt6QYEIFESdCJRQW142u/Ei6rYmRNmQbuqwdWzIfy
         kVsyrQG+Meyh7Smx3fg0KajbgWa7HvrBCwvKsVWWbJuifvOS5Y18LuB1/iMKkk3POmut
         yN9cIMFtnFPSMFBgZXEsXW9YBUS4uRiJiDnYHqeqsWvegQVvxeN0yIm5Y3cioEpGB2ed
         MunBoaFz6b47Lk0uyJZKi5cm2/HhyHB5UyeCe7oaW/rwvzs0j4bID+YoLTzfvBaLpVLh
         5rwg==
X-Forwarded-Encrypted: i=1; AJvYcCXrVaXTQP8xWLz4qkbCQy+79u+4+wZAS4KX8k/hJDs2lTwFITLMjmbn96Zy0+Mr7F9OGmFz4QmZtvquabzsNanR@lists.infradead.org
X-Gm-Message-State: AOJu0YxzOONmMCTIuF0gbC+OyTJmeL/fSs0npwwJehRns19Sz6HR9Zix
	8afqnpZ6pZO9itoEnfJhKvFw49YKr3sKJRIaE3TGfp6Bd963XWal4JnylwWP2S5q1rk=
X-Gm-Gg: ASbGnctxPp5cG0aUcrnjlt705jiCFSIZTxBR8Pdjq+WNrWE9xI82CJiIeZJIB/FE6dT
	IfY8G2uXQddadDUyMvuwyx7ug7VS4nAjNFBvy2Lg+233WEroKMB9MIaqZDYMQZjRYa8Bl5DgbZo
	fF27oOYsTSv412mBvt7zsT/W52fxOXkB6NG8zz+ImH9VDOXIez3dxgkvrPG3brZ5X7D3NQtubuF
	T71crKETRDsKxW0/Tp3bNu70bka+o3KaJme9eS7UZ/C9xSaUGwI0mLFfaB7umZ7YNaiEyn+iG+D
	eQ96AUwpcqSCc16FKYeYHr4vMSteG7JqJ4IcjL3BA3tFSIujKo3emmN4rft8JvCNImEAy9JSjeb
	hV6Qm1Hc2fSECX+Hr2AvC1zX7Uz8m9gBJci3Q/6HSGYJ7zSWxO5ezDOF/z9J7dmpk0lXbCuh1PI
	lV2Yyy0BIXHB1UBsRtqt0Urc+kVudx9Gvzftw4ZClcygz1X31dIUpstJhMFkp8hTwHtE2VgMzlc
	g==
X-Google-Smtp-Source: AGHT+IG5tkb1EJ/8aJ1Ee+rlCTIqPTTaT+zFP2s7onbxjS1ItcgDWPxmaFF+3jJVap3Qn/JSHQQtdg==
X-Received: by 2002:a05:600c:a345:b0:471:1717:421 with SMTP id 5b1f17b1804b1-47730872584mr29116745e9.19.1761915369981;
        Fri, 31 Oct 2025 05:56:09 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:09 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:07 +0000
Subject: [PATCH 08/11] soc: samsung: exynos-chipid: prepend exynos_ to a
 method's name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-8-d78d1076b210@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=1201;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=9SkaUUiz7kTIzusyZvFJbNhQMbW11/ifo4mNZna+tJU=;
 b=nVOMdUvG1eXJr+DmGEMwRP9k/VrvAUTj6to5NckxRVaBgVO0QjELdEXrxI7Wq+M6ZeX/ijI4h
 dh24nYIEhqCBdabs7dGrkSupGP7jmC0xwBudDXgEZ9PZzzmF0vMd5kr
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_055612_067392_11CB889E 
X-CRM114-Status: GOOD (  12.22  )
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

Avoid name space pollution and prepend exynos_ to
product_id_to_soc_id().

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 9c43c615167e4bbf15d00d42c2e52cc64d7dae1a..92cd5dfc0a9b641428d0d047cfefd4256a893ac0 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -84,7 +84,7 @@ static const struct exynos_soc_id {
 	{ "GS101", 0x09845000 },
 };
 
-static const char *product_id_to_soc_id(unsigned int product_id)
+static const char *exynos_product_id_to_soc_id(unsigned int product_id)
 {
 	int i;
 
@@ -222,7 +222,7 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 						exynos_chipid->revision);
 	if (!soc_dev_attr->revision)
 		return -ENOMEM;
-	soc_dev_attr->soc_id = product_id_to_soc_id(exynos_chipid->product_id);
+	soc_dev_attr->soc_id = exynos_product_id_to_soc_id(exynos_chipid->product_id);
 	if (!soc_dev_attr->soc_id) {
 		pr_err("Unknown SoC\n");
 		return -ENODEV;

-- 
2.51.1.930.gacf6e81ea2-goog


