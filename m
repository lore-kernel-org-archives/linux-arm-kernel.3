Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D89CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVFnz052bxUssLjPn/irFYLe8FvTO4x2oRG7kChOyXg=; b=camMNUYSTczsHvPZYYLO0J59Yg
	+orbT+N197FUxYzWBxvEOQp3v9z1OJ6BDHFaUBOQHDlgNmdf8sUmu/oTE2vjXac9xP4lqv8WmF03q
	6aHSHDqpxf3LTb4WimdvEz8N9JYDHuE1mEIDNVUrfG6SDVp8tIzOOPbT4GGrNwH1w7T1c3GbR//m/
	ISBQVgIczHYWVnBruFguSIPm2IdTOFU3KqJxlls4qJEB67cByg40exrBlo6C+FmaGfUIFrKSHP3Bd
	Hb6dlkf1srOwmjRTIne+DcaC52kGoSwzO0GvNBbDdEdYMs+N4KvjyUePsI2q/pvr7iO9E3MVhBNEE
	s8Sms54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJJ-00000000Qat-0DH5;
	Mon, 06 Oct 2025 16:43:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJF-00000000QVq-25RM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Oct 2025 16:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MVFnz052bxUssLjPn/irFYLe8FvTO4x2oRG7kChOyXg=; b=KOYx3Rfpr8d2cYFo0G0rjcGB/4
	Kv6MeU5Q/C0jbZ2NDSwl4HIDkDVqpy74aO2IcQADDpqvYr8gRAvVNlEiNnN2xwiqor2IzL7WKKcSm
	4YyUm/oSRw1CVJcMs2SMfQPkKtoNDsyCN/I9f/4SjtnCrukE5E0BwsKfyLnBp+dnP40JxxgmTJguO
	zChzwatOHc5zaZOb46qjklEaByW596uOi2L+5mA0hc1b7SwTZ9YKnH1y1eHQrfPvk0YTz7HvAAylD
	7G+QozOQFpG4p2ejVZNVzM6TZTp4U9xmbl8ks9VoLY82atUK+/xvAarJf0rbV41JKTq91R+ohynCK
	0mUxnyzw==;
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJC-0000000H3Bk-1fll
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 16:43:36 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so867579166b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 09:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769013; x=1760373813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVFnz052bxUssLjPn/irFYLe8FvTO4x2oRG7kChOyXg=;
        b=J8XqLemZ0JK1XyGg3qaO0FO/Kik18kZCgArHd3qJbrMn27aEVaCEoXkmy5Ew4nJpQw
         SUF3nK2Z49Fzxfi/o+8jq3TiMqg1hO6H/+aF5spTZ2rRoKl8BIo3wxnXjin9O5RVzKty
         sCgFQfHimQOlLOScTEfEvGpMHD/i1kWHRblDPwr9kJy7WDl8PNjLvJOiQFxpTzWeCXLI
         SX8ovsjNXQrqe7KHmmxSgl/WDkI1arwGsgIa/rVtx1ydB8FIh1zI9E0y5ccuoD3A1lNw
         uZBDtPD7Uz1x6D6HJC5qJzlCyEED6qM4P8YzlCkr+pFGL5OyalbvWrUP3qLRvwFFpagW
         FtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769013; x=1760373813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVFnz052bxUssLjPn/irFYLe8FvTO4x2oRG7kChOyXg=;
        b=SRt8PmJAIMWKUtykGAGlwUjHeR04v44VwWi8mqmHgZU72vdQwjiBEJc0Nay89amwq7
         AjAKmVbG+Z5KebFh0H9I7NfrnKKjj0Z8LOJpJ+58Vx1L/+QKMdsDym/f1pYClmioqIrH
         eJp7+A4l8ZEnni+/IQteTJvvwZuvWm3qmsKLhOvuK41wcpo2CEZO4Ko0mHeyCIywdzKR
         HPYsRSFssUyUimm1tSGEdygCZ3kqfUFC09YuwCN84b8Osl36Bx5FMkYEfZ7uOzR0KJec
         MQ3HtXHfQigeByq7HYRp5ieRZpR/q6hZff/OY348e0udMUjdxSID6ApPSvK69wDRPpxE
         BUnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt8b5xZoWbr8Gn/p0GCRpyS2RIPFWGNslsn5AibNloMCUWPg8yzql/P8B1Q+r+p2w3Rgj7ogxKqjI/RNw/9qnv@lists.infradead.org
X-Gm-Message-State: AOJu0YyTLAQFrcwm8rrgynoITZ5Lxe+kNBpMc/DoswDWE3apuDbXvKg5
	PZyYtOAF0jCP5Y75kZuqy5oJmwlJnloL6Q63V2Yx6Ec0rV8VoxXtnG1/+tYSYfKPp8E=
X-Gm-Gg: ASbGncuTZ+py21xgGZTQhd+6L8LLjRCSW8Q+1BNdr2xWkuGphqu4cSEKAR+ZWf9E7Zw
	ZwfqvQeVkklEJuNEk8yummW3BQDPtOm5tcbJzkogrkPwBxSrQZApBbvJRks6XniwQd9+s57hzpe
	Z08j0IrrUis/XS3sGYFkXnuBggmxJzWU5WMEqB2JpP3YpEVe16buEjoT4HZMcWcY09uqHfd0+i1
	Qo6epyJH5Lo3QmvK/KYED68o5BwKqci6IGtE/GyAMNa7F24/PUpiNriloMfvduzRIAvGygeunm4
	Tp3EmE534TR2IsJVNk/n99c3GH/FQYD7hhs5iB+hUm6497XHMb5fmn3pnBdWi750vvBLr0PigXf
	MyqEXo+5TsuiVWjtwY/Wa74BWhPsSqUMmXrZ88coy1IyXTXnLmagoeEXuZd8chYiGgSRP4SJ4M7
	UHlXjNNvuxFHVPe1NPTsvMqUVnAcVRraIRHc5YibbktzRPJwzLlkY=
X-Google-Smtp-Source: AGHT+IFsGub9LAc6/mBjGGGSdlVFrrBBzCQQUOCqnEH/i741mIaqZ3IINkZ5oqZ8jsa69BC1Q2QS0Q==
X-Received: by 2002:a17:907:3d9f:b0:b3e:b226:5bba with SMTP id a640c23a62f3a-b49c23431famr1629117766b.15.1759769012661;
        Mon, 06 Oct 2025 09:43:32 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 17:43:35 +0100
Subject: [PATCH 09/10] pmdomain: samsung: use dev_err() instead of pr_err()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-pd-v1-9-f0cb0c01ea7b@linaro.org>
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
In-Reply-To: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_174334_623985_03326C03 
X-CRM114-Status: GOOD (  12.61  )
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

dev_err() gives us more consistent error messages, which include the
device. Switch to using dev_err().

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index c1b5830b2ad3e8b272dcc8ebc364be49aa7fda7c..06e1b0eaca18205a549c8e8136ee15279eb3089d 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -29,6 +29,7 @@ struct exynos_pm_domain_config {
  */
 struct exynos_pm_domain {
 	struct regmap *regmap;
+	struct device *dev;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
 	u32 configuration_reg;
@@ -53,8 +54,9 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 				       (val & pd->local_pwr_cfg) == pwr,
 				       100, 1 * USEC_PER_MSEC);
 	if (err)
-		pr_err("Power domain %s %sable failed: %d (%#.2x)\n",
-		       domain->name, power_on ? "en" : "dis", err, val);
+		dev_err(pd->dev,
+			"Power domain %s %sable failed: %d (%#.2x)\n",
+			domain->name, power_on ? "en" : "dis", err, val);
 
 	return err;
 }
@@ -116,6 +118,8 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (!pd)
 		return -ENOMEM;
 
+	pd->dev = dev;
+
 	pd->pd.name = exynos_get_domain_name(dev, np);
 	if (!pd->pd.name)
 		return -ENOMEM;

-- 
2.51.0.618.g983fd99d29-goog


