Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478DCCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qN+9Nh7UEIyQdcOnN3rR32056vw2TRuOg5ceKeN42QM=; b=fLSuxrSRmZYVjxqfT/VY0mayuV
	TXwh1ED1SG8kYVuPCVAbFlJLWQU+uE/sYFU2aLWJCAe61RhjyedQbz0tVLcFq9Z46K/lNCdfkafNo
	2QLgU+d2thM7WPSgwoX0NSun4+VIvs6TNNBCONwIDWvyDdVjKnABFVsSCLza4ZenHtQzleGXhA5sx
	uvAwhC2g7qWsm04wKVROxcDZJeQi+6mCbHz3mBIWrEQCUtOe8iqDOmWL3pz1BquQxan1wNItogydR
	E/5+Z/bwdEMUrsdNuBvxjzOiIWaQ0LZhpBzw4z4iPsp9n7JalQ1MH70HbQnoiL6SZD9nmus8MXpwK
	jhfcTSMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6X1-00000008NzH-03nz;
	Wed, 12 Nov 2025 08:48:47 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6Ww-00000008Nwk-23Uu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:48:43 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4775ae77516so5756735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 00:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762937321; x=1763542121; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qN+9Nh7UEIyQdcOnN3rR32056vw2TRuOg5ceKeN42QM=;
        b=XFIcAZtDw/Hac+ZUbefoki9g2EffI89YYPKCjfyL94/gx9A+l1FeVdWjOuD5eLuCX0
         qAtoTfY5KGZpVYiGBPd78WgnYJsVb9lEZSBvNrplWUft1HFdcYATWp1bqclGV0+2P3K+
         ZY6KPIbktvcN6fjoi5iBBFiYCheUx8UbecQKERwYS/phFYOOBhJTrB+tdAAnRX6jyUH9
         3ugGUqviR7rFFEpumQwVl+az8s2GNrwdmQilPfobBhUuXT+Fi7BErmV7XzkoBvZx4F9M
         IZrXOI9UX5q4RGZL/+QpfSH1CMlreIkRT44wH+6LMUHcPN+gJt08rar0jjMkHYH3Ugo3
         4CZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937321; x=1763542121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qN+9Nh7UEIyQdcOnN3rR32056vw2TRuOg5ceKeN42QM=;
        b=HMDYkYrnuTU4Xi2AeofrdKRbwgZrLsVH6sTtA6Y3Gj6/sRHyeaUfC+bA0cPgNx1PAA
         PP3ZphgmIXxvpbAX/D0NN/qCmkLabqvdqNxWi+NRElglufGcgmQFFwbES3grgtreRkuI
         f3BoqDMOxFTX97ns3j+s9OyduYjRiFqIa6us1SWntTWx15M0cQxzOcOJfOKjzqmszI8N
         ciJ4wzGKMiR7cD7gFHeEWLC/5Cz4+5L7bjwgDPPtRKH+iLQ5WKLxl+DHcg1e4944+Vnc
         OLI+qdWEs2f/GqoRKI4XQKbTkt0sG3nXBsKQ1UyD7g32iluV7T0gTXH3Uvf9TEZNlRgi
         bcZw==
X-Gm-Message-State: AOJu0YwV5g5kdmcvKziKCGP6ZeYbRyIYG7L6fEDQI57tlSngYLOFXyw5
	tzMpNYzMaGDlvRdTzJTxOgZl8YU89LFytAIQrpXdSJzqant7D9qzrNbFGScishXNEFM=
X-Gm-Gg: ASbGncsXN7YLy/i/NtZ5PQ2uvpYZ42iiK2kTUb0KS0Focg6ooZUZPIIcaZA9a9AjNO0
	gefwy2Tvb1otEsnZ8BNRnCl04gf6KnbVtTMv2x33hMNi6RXMTleX/HwnFKvIsxBe7LWB2MzSzH+
	+32i94OAa4A+7GhkqtawVXYrI9NUvrsF3QbNcSC6CAm8LTQTfvO2PgHuAODzDygzWZKEZEE+okV
	sGxMPwlHjNXzYUcAE8cCJwnWUbuuOBWW5jQ1Qy9QwseEYZ2ESrjgjqHty7/FKh/d2CYXfGexbyd
	LX//F/fmJrrQ8/GPd7h2j86K552rmYNQkapxgtqouXj50AUrNEoNDBPHILyYwDeWSrRSiVa5K+h
	hxqLMvC9F+J09wVp0jQqGYtrgBYJsR/2DJ+Ik/M8GAdVKl21tUf61nPErMFnFneDAdbxHBveAfM
	GyKnqf3ggEaApYyCzuafOUDoc96C6FZnXBbFNC0VaYezh+nLn60KU2euXu
X-Google-Smtp-Source: AGHT+IHnN70HcY6VqId76V2Fium0LoTjsjCOhICOnZah512u7vpBHuld1VklT35Nc8Jl0M9VCj6zfw==
X-Received: by 2002:a05:600c:5488:b0:475:dc5c:3a89 with SMTP id 5b1f17b1804b1-477870bdf2amr21149885e9.34.1762937320671;
        Wed, 12 Nov 2025 00:48:40 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47789ffea1esm3732645e9.13.2025.11.12.00.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:48:39 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 12 Nov 2025 08:48:20 +0000
Subject: [PATCH 1/4] soc: samsung: exynos-chipid: prepend exynos_ to a
 method's name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-chipid-trivial-v1-1-ec2dea03bd83@linaro.org>
References: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
In-Reply-To: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762937318; l=1239;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7druEga/Beb9/UD0KVweY5n8TbkTPFBJtmEG9o1IjOw=;
 b=N1mZw0ORtHrf96WaYt+Xj7F23BBnNpcHrGV8KfTAnUSHyfJr92KB7oKg0NxAi49zaCk5kHrph
 0efls+TZc5WA/It36WYBngiDFYhBUehpqOeChlNefq4Hizd3mAQWTWO
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_004842_551225_A6F34377 
X-CRM114-Status: GOOD (  12.84  )
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
product_id_to_soc_id(). Add a blank line to make things readable.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index d3b4b5508e0c808ee9f7b0039073ef57915d60fc..cdab1d4326b9de5df477a0545839b7b8b402d55d 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -70,7 +70,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOSAUTOV920", 0x0A920000 },
 };
 
-static const char *product_id_to_soc_id(unsigned int product_id)
+static const char *exynos_product_id_to_soc_id(unsigned int product_id)
 {
 	int i;
 
@@ -141,7 +141,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 						soc_info.revision);
 	if (!soc_dev_attr->revision)
 		return -ENOMEM;
-	soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
+
+	soc_dev_attr->soc_id = exynos_product_id_to_soc_id(soc_info.product_id);
 	if (!soc_dev_attr->soc_id) {
 		pr_err("Unknown SoC\n");
 		return -ENODEV;

-- 
2.51.2.1041.gc1ab5b90ca-goog


