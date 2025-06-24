Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CC0C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+MqIOFNRJ3iFcWe2+ZNr4wPLX6LJuQAzvpwDCjIk/I=; b=AKA6o6uH5xXWgWMOjKIWW2IkGu
	e9XjH41ett3R8gcB8/L4znjLDFYclgyr5UyKDW2wGwILuMPTSlutQjzV5I0MqxzJvlPIVVXybNYgI
	VD6XZ54lW40IeGjx8Rn38CD2mHltgyau4gwVZVZXzCYABq0b50kDUbV53xyraY9jG5Xjjb/uwu9pI
	2X+c/cHwzKUcXSz05iDg7ovdlvdR+GfssRbOYI3utGqGsa/Rn4G9pL1jbMVGAhaLu8xrlM5DK5W5U
	IaqP/VKZKJMNwmzNCqx0khCMWQw4AcsLX1ndP719e37+/P/rAI/kOtiJ6lrzNlxV2l4xXR7XX3DAs
	KKpp7HOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5oB-00000006ADC-2NMu;
	Tue, 24 Jun 2025 15:43:39 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45U-00000005nAB-3Gok;
	Tue, 24 Jun 2025 13:53:25 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-553b9eb2299so5461837e87.0;
        Tue, 24 Jun 2025 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773203; x=1751378003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+MqIOFNRJ3iFcWe2+ZNr4wPLX6LJuQAzvpwDCjIk/I=;
        b=Oz3oTGkXt71OWKb4yOif+vyKyjl6sSp2N/nvYIZse4rRzYsCOy4cVHv+H6XZCTn+9O
         mL5Oum8ca/nTXxVJf76bMoTqXmZzrIuC4a62XxR1nYtO0Le8JgYPMsl3uo9FnpXBd7Wd
         CGKEn+sI3rTbZ6JL5bp+Dy8ThpatMQXy9aoweuPTPJ8q6Qi7dc3E3MjXK+lf1IQMgOMC
         nUlmHo0axil2DRvcbsqOAfnnYKdxf4F8J2S4Yov3k49FlLXsNfbYwSVor55iruSTzK8X
         bMVOBrYTjzPM2kC2HhvwOoelY8lXuz0DcEDXpf+OikdSQJr1VKxB54c2ZHrsYhjdRkhR
         zDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773203; x=1751378003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+MqIOFNRJ3iFcWe2+ZNr4wPLX6LJuQAzvpwDCjIk/I=;
        b=DhQ9m6zfH8lS79vvZM8tZQYqa6AGL4EFJul1mVRBGSA1JkIpsXp294lPdBKFA3VH2i
         34O7uBwdx+kG5NPtRsh0QRphHdT2wnKUdCaU8OYKgcnpigoQA2u2CT9/Er4TKqc/oreG
         fDyDm+2VZO40REG49q1+flArRrXhRI9ArT/wpTduLRkk1JhzpT34VdIGXFRPG+Nul9PG
         eHXBA1y9X/n0VcNMvHV433zK9Og7caED//jktEvEKe5Kly+F6R24pGJqRFQdwrUAcmJz
         jXPLBV6eBhWWzxzJYCHN3XJA9y2If18gqClid1pBjizHSoPfJt6V3UGnnkBLLCMCP02m
         K+fg==
X-Forwarded-Encrypted: i=1; AJvYcCUvII/hQkmblyq5d6lXt3dCidS6vpfq9osMjl3LI/FWhEN9veeRQO2l9osp/oMXeFu9PrRSqcXBojzuXG+IKNcEFg==@lists.infradead.org, AJvYcCW0Wun0ZTZ8eTHvwOc3cyP8s2wdkHuk1W97FmW3JTYM/8ZuSFt0sEWOKBgYnEkmvg6549sa2SSH2LUYndab@lists.infradead.org
X-Gm-Message-State: AOJu0YxT6coV/0kWHDd2icT1CJNslyzxUvLKsM33Da7SMkqbtqq7F6nt
	qxTE6iG12fJUhLwKn778LEvepRZ9ZBa0LX/bYFSFy6V5VNu/3RyLMLk4
X-Gm-Gg: ASbGncvnzg7zewEFIECxjGUVFu53oYqVFkgrJx//WglvGeBe2P5IRjqiM6PNQFV8Otw
	gGGcNdZnGFO+FoRhd3uRIQmf1WN173+EAyOgmFdutx4CNghcRLPrLwJQS1yX/pkuY2Nfy6J6/5A
	2jp5RKkrULF6xgXJCDRBNy0xaAwM1bm9AF8ECg5ZYT3P13jd+8rlAyLK1Jnu8t5xUXMmzdATJjN
	ZWmp5AhuuhOTqy9gUXQ6dpUiLb0fEUlmz7KHJq/oLbTojQ1C5YNTPGMhqj83KtSYrTOl/+GJG9p
	an3+KonOmXBmqZXg+Hd0/+j2NLzcQ/L3n7tKNCWoQTL7ET/ujjNdnN7r316atwEl5JIzDD9fM2H
	hhOZHiiAK51w5yKF38TVq8o7FsddZd7q3txTZs+UCZ9FZglAGCz5neEnofUjL3Q==
X-Google-Smtp-Source: AGHT+IEG3Nmxe5EPT7OWfXxcoBanx3ekkm42DOccYSN8J0OD87zwEToOOU3f+GyCigT3lhowCdOmDg==
X-Received: by 2002:a05:6512:2395:b0:553:2308:1ac5 with SMTP id 2adb3069b0e04-554f5c817e2mr1016483e87.4.1750773202777;
        Tue, 24 Jun 2025 06:53:22 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:22 -0700 (PDT)
From: Alexey Romanov <romanov.alexey2000@gmail.com>
To: neil.armstrong@linaro.org,
	clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v12 13/22] crypto: amlogic - Add support for G12-series
Date: Tue, 24 Jun 2025 16:52:05 +0300
Message-Id: <20250624135214.1355051-14-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065324_816258_EC3D1C3A 
X-CRM114-Status: UNSURE (   9.17  )
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

Tested via tcrypt module and with custom tests.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 0f4b3db85031..6529ae24b75f 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -282,11 +282,23 @@ static const struct meson_pdata meson_gxl_pdata = {
 	.support_192bit_key = true,
 };
 
+static const struct meson_pdata meson_g12a_pdata = {
+	.descs_reg = 0x0,
+	.status_reg = 0x8,
+	.setup_desc_cnt = 1,
+	.hasher_supported = true,
+	.support_192bit_key = false,
+};
+
 static const struct of_device_id meson_crypto_of_match_table[] = {
 	{
 		.compatible = "amlogic,gxl-crypto",
 		.data = &meson_gxl_pdata,
 	},
+	{
+		.compatible = "amlogic,g12a-crypto",
+		.data = &meson_g12a_pdata,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
-- 
2.34.1


