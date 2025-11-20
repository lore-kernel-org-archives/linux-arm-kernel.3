Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F202CF8847
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3hYzhfbEc/1h0Rp/vYsV0pqk39zwnFra4S41/QfDJQ=; b=p2fr0dTrK4nYgJu6vFyouya3gF
	pBa1EFY0sVymjzlcUqUVcUFc+ZDX64L7OguaKQwPq1rNd+UXxSxyCXZj6zSDb6J+4JaiCPo9rdPtc
	F5I7vY9jVuriz9JerrrubYkeVH0zjrGCFKTq5T3CSUmQhLxfM1q/ipICd/WdaUsADs/L6R3gOgse9
	N21/BM32PMGHuPQVf2dI+cx6kQ+2jrQaSzxd/8j39BUTDazeySvLjBmNVxfMe9ev6CuCX5EzNqi5Y
	mPh8Zcorn2SZgVgWZvBUoT7WK/csj8eqaMNJmdWRBZ/I+UxjVwjsfFROYR3vOT1RawqWRKeHXCZF6
	i91qVbNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2rE-00000006a8W-17P2;
	Thu, 20 Nov 2025 11:29:48 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2rA-00000006a5d-2POe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:29:45 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso435732f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 03:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763638183; x=1764242983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3hYzhfbEc/1h0Rp/vYsV0pqk39zwnFra4S41/QfDJQ=;
        b=yGoEZdtyiSyoQdOdNIiUS69SxZ1KYbfH8U8YCrVjRCF1bR0RmTCBFGtF60j+No5hxa
         EOy2+cUT33MthoubibqTX0ZXGhHIKcjCfe0+W3qHk+6PEmaqy9cWgifhOYjlLZ8Nm6J+
         jkRsllrH4+4BeQVXMFT42+Ka0jzcsx12xdpuxjOVw68oGudgfm92sOHp/yi7j7YezWro
         teIynFMl2ntjlJaL0tn2NIXp9r/OOOjJ5aDUB4rrfwta7KQsMMw0wLKYP9LM0wGENxvy
         dAYCbg/bwXw51ZMpWwtAO55P16AqEtgtFTdnuFYDJWx8QcOGXFhYdHxiidGxnQSWQ9hf
         sMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638183; x=1764242983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A3hYzhfbEc/1h0Rp/vYsV0pqk39zwnFra4S41/QfDJQ=;
        b=oiuXaM2FrUMIwhv7inbRPBEz8hZwnLI0FrC8tdizIOS7K6tFgQru4IoWDWOmIyAFx/
         zvOKGs+MUuk+Hx5JF1sMD1YYJMQ/8lnsRkC61RZC7/aMCk8uYHHTbdIrkXkrknhubNS2
         7rR5QqQ9Rbsh0YNXDi849HtztTm3Ma5YruojzBjaip6t9bqCnY2MuiecJPXJG4vUf66A
         IG4n2E6iVkGVrwSnrTwWdYFL9Zl+1SWtRY9qdOAGd2V1lzAoiqEgcPnRlQhdIRpeqjvm
         P6M8cw9dcxx3rdsGlLvyuIjdcp91P0YTpgvU/oVq4EA8T9bnnBhC9jXBEcjY+omNQ2j/
         lZfA==
X-Forwarded-Encrypted: i=1; AJvYcCUMgqT+1nGD93zHzfBZ05FYaDW7DTSJP8oi5KiRYKEzxcKg44qMKNLHf53nwLdAUyCgaSrg9NwuKHca5WtvvYjM@lists.infradead.org
X-Gm-Message-State: AOJu0YymqKzsbhkW/2N0Mr5zaTcU04qLzraGfXGvrHApJe8g61lyv42x
	suLvAhNSfC8ot65RJPhShqmhih+eDWW0TJPlnnX9PBVP6ZYTcmjipozKliVfDEixTB8=
X-Gm-Gg: ASbGncuvTejZYGnny2TjjdzvIFhaWB9yIoIrTS2hFqJrmRL6YUQJXb4KWzqrxpUaiQM
	kyd0/W9FsYKJKWuvanqYZgtQ7DWj/yUP7rHxObGRy6aiE5uWYBdlBSTrd7EaktydCFHjgfZq4t8
	LUrws7onuEglrxSU0/NYP5bgDl5mIPD3agEO8QgLI9HGnYRNJxybY/gTwEBO6C2i8B1uWh0biBU
	gK21DKPt6Or6u5fU2jeIq1pKUWVANFb2Ww0sW7L3OIVxY/m732Dr6cbl/A312Cgd/ihHzf5mwbP
	rfSmcCfdDtrQTVBCA8ud5CjPqy+2AAsXjGkLr7JOLgk6l3UbQp7JnHEPjvQWRwNU0K1ICsiXVm7
	HTsYahyMmOolHd5xEP1mmQnzCF7KjELC7mrMeigpfQWJ5iC+wqOmhWTk9Mjp2USLn1RiKycljYr
	hwFvCyrmnbpcD3hYr+bVddkcN7H0R+u5RQOzy7qXM9lEgULID9OOzQlYsJT5/eT2YXb4s=
X-Google-Smtp-Source: AGHT+IG4ntQvX7ciO/wU08V89VgHHrDt7L2n7nGEulisMc35UphimRXBwOW+cZM5Xe/Cnjl9vBsYow==
X-Received: by 2002:a05:6000:22c7:b0:42b:3b55:8929 with SMTP id ffacd0b85a97d-42cb9a2c101mr2454960f8f.19.1763638182983;
        Thu, 20 Nov 2025 03:29:42 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm4961040f8f.11.2025.11.20.03.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:29:42 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 20 Nov 2025 11:29:38 +0000
Subject: [PATCH v3 4/6] soc: samsung: exynos-chipid: downgrade dev_info to
 dev_dbg for soc info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-gs101-chipid-v3-4-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
In-Reply-To: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763638176; l=1017;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Y18z4hcXC90TeZ6W8D9Rbg20IQrWgPSKie5Vj93bfbM=;
 b=x7UrtlIUxcERWQm8HpONr2RHp67YbtcMLunqjbK/iMafjMqh43jKa8vPbr0uc0A3LNBdYp78R
 2RkQ+44aAl/CZIOW58N+VCip6YSMoUJ1DOYB0/MfEsW1dxBkj/FqLOd
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_032944_633571_1C1C6D8C 
X-CRM114-Status: GOOD (  12.07  )
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

The SoC information is exposed to userspace using the standard soc
interface. Downgrade to dev_dbg to stop polluting the console log.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 88d264ef1b8835e15f774ff5a31f5b3de20f74ea..5c8660374269c87ec38ebca242918bd7b1d362e5 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -170,8 +170,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	dev_info(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
-		 soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
+	dev_dbg(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
+		soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
 
 	return 0;
 }

-- 
2.52.0.rc1.455.g30608eb744-goog


