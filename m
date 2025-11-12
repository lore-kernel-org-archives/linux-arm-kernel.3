Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEB1CD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVPUnWtWGToKWpcPTHZ/hxaM2+CTnOqNCH/2mEyOSiU=; b=HJWiXn915BWAiz4B9EkfXuyPmI
	tzlZ55aqshIcTS+TUL30aayTfHz+v685buoOUmU8Wmxuu0OM3vQ/w/VnTf5dVI8X2mTBAsNoFjc6H
	XO1M+Hf2KPLRwUHkrIE5ar7Y4936xdShxbIXuibUWpA//4226u26+2ZTBqiRgB7xZoTOC0e8xdE0A
	zoLpXi7K/Dc0M6nhY+X6G374OHMtBgYnHvDCDYzY2Pech34hWK1wFEct/XAE+zpipHDE2iRiMD0De
	K8GZ8QomjF4ZH1AZ69M5jucVEMnHFk9GWFINjhVdxjhbBQYb5dEZrtTg6n0NONfhxfgzgasjjF4xg
	sIIPgDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6X1-00000008O09-31UF;
	Wed, 12 Nov 2025 08:48:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6Wx-00000008Nx8-3EEU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:48:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so3900175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 00:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762937322; x=1763542122; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVPUnWtWGToKWpcPTHZ/hxaM2+CTnOqNCH/2mEyOSiU=;
        b=OvEpIoxgss2SSpa1lUP5VT1wsCIpAfH5B2R6HlKZMeE1kw1IzSPQaX9pQRy2puip+n
         sFknB1IbSFDaamKXbcqEcvxLGA10B2t6SCrcLgs4hkvugvfpm3XDYUMegRFhdgT05XS+
         pjwjqzh6HtZaO8wRKY4CWV1Uwk2NPuZQOhgo1rlweiV/Z8LR6Hmi/VzYwhJWMg9fn+89
         bPN4qtz8X7OS79Vh1zt6C/dEY46P5B+crpmSHAIDp5DCWREr98RwL0/43E9m5dqZzA93
         P4K/sEn4V1OO1WBxQj51AHgkBzKFvs/+dL4hzKJNg72FXR5iMryaDQSnu1UqoF+NBbBk
         cMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937322; x=1763542122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BVPUnWtWGToKWpcPTHZ/hxaM2+CTnOqNCH/2mEyOSiU=;
        b=C88c+GZOooFqGezxXFaDIjBUrC/AsTAFOLoiRMMcfAtmHn7QkClm1BEBBN6fpUCAdy
         vAkdrXRcNO9CGQqF6VCWO4uDIh6abmSBH3JnUSueeBqy05xywHIskQiV91vTxeBsc6q9
         TmhD2F9wQDZiCTy6poJWF5D+1LERG7Lyk0ApR73akbZcGBt9PAP42Fl0tSuZ2trXnT4b
         zXAHKLZrmn+El4ikBMph3x9jOPYlNvDkj1sqcX8H6Pxa2g3vLhq3U7QdRRzzpjPzBmDB
         bpWs+p8Sj1jSwukkblltF5zK0HQK+6urOZYUVwALU6/IWhsfPAsUslA18woPfSN6bBdw
         v7ug==
X-Gm-Message-State: AOJu0YzOxj2xDiBaF8DeYbWSmL0UYBtJFxsgEq+WzBTH9Nf2twEu0cA+
	3teSNRcW2ClnAXocpHwr/a/9mEOgD/fYODpynQxXRwCe/88xEWQbozxSeeXXG0uAMyg=
X-Gm-Gg: ASbGncthXDipUbwSp1wYc0zrRXaenqs2R3lJqTUswGtCDiWLAfdcUH0hW6vlJQxnMzg
	Ovh0Dl4kM3gY8dpuipznJLjGyUyqKsfNQR6qSmjEnlYwbM9OG0bg+eXi1qmRlA3gEQpNRoZVJV6
	DfIY8I4rEw9f/Rt5MrLlUf4fVM0bthypZuXqbV3xUii4DCCOVzMCJ9lRZxYbw4GSeWn+XK72lKb
	ViDqOiPwepHcUBwOsA3i9iAsn41QfAGEpQ4w0OzHlz+oVqYMTow94fT3gKuccgcywgi4Yp8RCGq
	TPxNR/mR1/+N8MJ4r6kVEdFGv1rqVDz2XRXshNcQ4hIDrIzYGtv23jHPKVd7fUlTDDUyJ0xolR1
	D1v7IMBc+/xaqBbXfy0n7Y7Hyi4A1VUrSe5vDnvUjwQMXceqKJMsP9Y6Jp8asy3M8mkvp56w8Bl
	ySqF+z+gP64qaZTTaOGFv0HLD0D+4oGqDJcA5314D8FhZ8iC7rqv7u9rnj
X-Google-Smtp-Source: AGHT+IEt7OwDsDcJANR+ViPUh1ScTLjLVqjF1eOouEZusB6zlVJflofXVhyDNqKf92Nzra23MWQEJQ==
X-Received: by 2002:a05:600c:4f8f:b0:46f:b32e:5094 with SMTP id 5b1f17b1804b1-477870a6e5fmr21321335e9.32.1762937321949;
        Wed, 12 Nov 2025 00:48:41 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47789ffea1esm3732645e9.13.2025.11.12.00.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:48:41 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 12 Nov 2025 08:48:22 +0000
Subject: [PATCH 3/4] soc: samsung: exynos-chipid: simplify with
 dev_err_probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-chipid-trivial-v1-3-ec2dea03bd83@linaro.org>
References: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
In-Reply-To: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762937318; l=1084;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=RCAfXidI80M/Q7eFcJ2WvQagTMEdD/ohdv6ENAxLfKc=;
 b=Iuyx1Rcmem+gTbp+iq/ldL4czfZa+yzrFYBAtmElJwUtpSKiugcRP40UAvhwbCRq/MQa7IpyM
 B0bxpDc4AAaBbtxve8UQ6SDwWZlyqRx/xCuMxuy+I4U++uW/w30900h
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_004843_836310_C2487354 
X-CRM114-Status: GOOD (  12.59  )
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

Use dev_err_probe() to make error code handling simpler and to get
the standardized format of the error code ("ENODEV" instead of -19).

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 3671ed718b933a2dbb9e154202bd3235e3efd758..b5866a324d8ae911a5c99d0290328efdcc072dfd 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -143,10 +143,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	soc_dev_attr->soc_id = exynos_product_id_to_soc_id(soc_info.product_id);
-	if (!soc_dev_attr->soc_id) {
-		pr_err("Unknown SoC\n");
-		return -ENODEV;
-	}
+	if (!soc_dev_attr->soc_id)
+		return dev_err_probe(dev, -ENODEV, "Unknown SoC\n");
 
 	/* please note that the actual registration will be deferred */
 	soc_dev = soc_device_register(soc_dev_attr);

-- 
2.51.2.1041.gc1ab5b90ca-goog


