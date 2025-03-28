Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83677C36011
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=; b=CIAB0WDUxh5wDT323a5C89JzaX
	ffMINHI0RIAHNBDc4ZgRF/paKp+ZrUJKv5rql2TLeqP8NDL+FOSe8fqbM2EdJ4WK/InK6wP5QbMrb
	2Ppx9jPBk9a93MU359PqHXXenwJeqZXpp37V7HpWFuHBv/t9OpsLDvRop/x9mTzMKahYMvmpg6gjB
	YOGhr3Yv+PgPqq2TblIq5ewCW7jmHkN7+ky/7beGACZSVAIDjtZwQ/rk7te/9vk8U9uYiCfRImwcr
	C/Rywv0i4mAP7PP1xd9uMxcvV2B08v60os8lyzhDlKKi20PwPeQzwlhA8XvLwlVS5g0p1tAp+tCq1
	Qh97JYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyANW-0000000DXvr-45Ak;
	Fri, 28 Mar 2025 14:08:10 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nd-0000000DQk3-3PtA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:06 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso3340294a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168664; x=1743773464; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=;
        b=y6k2s6QkTT8zUmymsMFjg2xikzvOJbei51AlxOjwrEP+TdJtv+4x2RTwu7IKjnUINr
         SPhYjmseQ/8Nf0vqy03bMCp79f6WYPEgbeX9Sc5WM7vkMgIrNCbXsZS19IdtZeuchhUp
         kOD6S5FhtW9IWPz7TnA34aDQerKA3UXwXNEMycMIV4FZI+Iah8WuWgKRk86hYEqe+2Mm
         R5glCyiq3q8h6uXCzmUZaFy74GjWZ0gXyqslyeX9KS0R6ctWJHO44N1WfkVJyEWAPH3H
         rxOw+wbLz1s4zhK2AyBrbovHn4lOsbX+QVYiBlW3hl8M1FzoHipH8yicTNe8Ae5E97WV
         1eqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168664; x=1743773464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=;
        b=QEbyu4lasbxqGIu+GdhSiP41B2WkgN+fZ3zCXrnuBUUfIs6Tx0v9ZsUwv6No/3dB9/
         DNXt+r6MI8IzVd6jOo079oSKKhufyVHjyZSWGu8mjkZ+YP0k7ssjKoFH4SwCz1sXlYTS
         b+mok5tVjPGcLYAZWUGcA6uBhlkHd3YM0/ruJT+mRN3cawDzXXCnPUPjxUAynbPbsjJC
         ZK4xlSstHP4zdsByUdXrDBvlv4LoY5o+VZlVC6K1N+/3RsnFLdM+MGLC0d8RWEvroN2o
         KjdLRrHA1WNfdNWpxtmEDkdS1O7cJGrGjBNolFeEh2VgtZ9edJgB+4fmoqOrrNMDRAa3
         VhLw==
X-Forwarded-Encrypted: i=1; AJvYcCXjY9V2mqrdosSEqpJXGXVxbt34HhkXSb6BIO4cAPqcDMOsOcrphz4CmCYVZobQIPF66XIuNXt/IbM+N4Vaxzjv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9xB3PN+oN/2jqdfkAXY0Tr9PrTGu15D8PLe5f7rdj95qsbc1g
	VCYJUGdvfSTpXwvNplaRux1omTmDy6hFaGvHzhI/kITPj6UWrH1myHsbEIBtERY=
X-Gm-Gg: ASbGncv1lDsqNRk2O+aHeSFMjBORsXhy8G4m/lJwDUxn9Rm898nH8O2xIVcSr+AZbAc
	EvFIa5O1fWT4li78dvUVtNj48mzvyxsIw0+igSTARubVZYihcn849QOfdeFoc2ajIEuT1LnkJat
	Ex4TvMdJDgfv5UlIHInrlgJmxbh3VlxRKJA0LFmHeIxFiB1caS+1tYJqx3AHTmcuQpWfpK1EUGb
	ihkBcZm07+OnfGV5mYv0SwqPxuJr/n8xB5CyPE89Bpw+uahAC4u9pRkTkGwWWxa7A4qum6NZqae
	We+aBmJx6eCkQuC4rLX8Rc9kUhB5p14EdvpvlFv1LS8TqBSj3hakbWU5OMqz6YeEBpz3DJMvV5e
	6iUfHbOCdAUek30QBWYRZIRKKTYNX
X-Google-Smtp-Source: AGHT+IH82jsJ04KqxSx2urRuI126Wc6BqmkR0wyKM63ai8QchgotV1y1Ewu8V3BijV087u2FKOXDPg==
X-Received: by 2002:a05:6402:26d0:b0:5e5:c637:b69 with SMTP id 4fb4d7f45d1cf-5ed8df6b334mr7910381a12.6.1743168664240;
        Fri, 28 Mar 2025 06:31:04 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:03 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:06 +0000
Subject: [PATCH v2 20/32] mfd: sec: use sizeof(*var), not sizeof(struct
 type_of_var)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-20-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_063105_858323_CDD4BB3B 
X-CRM114-Status: GOOD (  13.08  )
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

Using sizeof(*var) is generally preferred over using the size of its
open-coded type when allocating memory.

This helps avoiding bugs when the variable type changes but the memory
allocation isn't updated, and it simplifies renaming of the struct if
ever necessary.

No functional change.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 55edeb0f73ff4643f23b9759b115658d3bf03e9a..e8e35f7d5f06b522a953e8f21603e6904401c983 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -163,7 +163,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	struct sec_pmic_dev *sec_pmic;
 	int ret, num_sec_devs;
 
-	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
+	sec_pmic = devm_kzalloc(dev, sizeof(*sec_pmic), GFP_KERNEL);
 	if (!sec_pmic)
 		return -ENOMEM;
 

-- 
2.49.0.472.ge94155a9ec-goog


