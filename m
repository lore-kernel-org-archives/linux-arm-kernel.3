Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A326BC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Ic/0Xe88bpVQ1K2LP6tYIkZ9tLwnecoFfoF6m5efNc=; b=jwA87O8Tyh4sLDKKqVMUAtaJ4r
	xiWfpW38qRi+z2brb/v1vfxebupZq7DA4ciXnm5AG2bNASeuPSvwRaUQ2NDAuKThqTuumcIrnW50U
	YHtJ8sz2ZZ0jHXgxi9U3STb+Lim7tqZDDDi52ouZFXJ9BhkeiSejp1b5m5ycmMoeK5MvNB31DHO+Z
	100//5xMt+XxzR9xZFxf7OM/7geC1NjpBWoq2V1DFi9QnFrXjXEH1BfxseLuOy//FIZSFNg/p+dLG
	B6QWWCfA7BvzMv4GqPFv9HR4eYZJgFWvxsJxlzuWiKlT/V/K1WRVhEayTCknc1rPqyh99SHyOmTls
	yjJcDS+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUMK-00000001sdD-10p1;
	Sun, 23 Mar 2025 23:04:00 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyg-00000001p8B-1DyY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:35 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ac25520a289so683589166b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769572; x=1743374372; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Ic/0Xe88bpVQ1K2LP6tYIkZ9tLwnecoFfoF6m5efNc=;
        b=hTUAPGKT/uqkfKO0WG8gfVxbo/U97V+wO15emvH43I6xG/MZypEPMVZn34FhA6YJvq
         Dble+NNlfLt+NovLRxuOWiZBCqVFk994ih3ibrAZc+MhdVBm4LzwfmgXjxLEvOaHjMWR
         J9FIjjj2k2AcCt6CwbGazddhr//4tB1k19pSEDvFffLEP0deyBYh0rxzB5q+i1VK54ij
         i5x6YUECm5npXbmsxEu9oUUunZ73bh44j4qjKZImfWfrM4RqMOgZwGivhd4D4Nf3juG+
         AIRpiViPh7fZByrs/TSsMHq6a9nJEGWPxJl1CjlHZhJGyBpycgfmE8ZsJy7MtBNIHAzO
         wViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769572; x=1743374372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Ic/0Xe88bpVQ1K2LP6tYIkZ9tLwnecoFfoF6m5efNc=;
        b=a36B+LTs+3N7CIEUmvh+hBWn5IvBd4C7HjgaLy6OAdNjfYTZ19MTBOnHX0KLgv/i2R
         V/eApoivvxNPEQpMW70GlbDlbfYYsbPtYMCyZd4T+0dfbPXwftHsOh1gzJyzE7+cG3T/
         +VhAyKq2UXi1WaJPBzYgVD5YE14LqWDF3NSYibTrVlmGT71oIWB/0oFXsc9Gj6iHiLeb
         6SOGMlaUKoUD8WAMpicb2MsHbKAPsXWAZ7n5L0OzbLmU5qoI7DAkyubzCDcd8r5T1pKf
         Vj8E6M0hcbIStb1hWcgCCQf/O98+DrOBu9Pfqac6Ya+6gUdctdYLiFlrDJgtGrCIbgYP
         8gAg==
X-Forwarded-Encrypted: i=1; AJvYcCUwkatRyDDoDSt53tLmVWvFrFawxa5zc5Uozy9ek2K+zD1z/5BnZntKhOH0WdJJl+gSYJBW7HAc3UfZSqp8IqJL@lists.infradead.org
X-Gm-Message-State: AOJu0YwiivExYAbfSc/JQDdY5M0PUOLI4qKCRZAO/k05mVbOtvLion4S
	gaOzscP4GtuXkY33ziPmAefaNWRxyaPvgYO54jTDEtf92GeZ4ug5CrC4dyEYWbY=
X-Gm-Gg: ASbGncvFvgUFDj9wKRqhCI1gnWGkDU6uVXcw58Wh02bHUliCddU6tk8NlQ45j3WwyOt
	CeN0zKC56i1UOEdGHN8kbnzF5zMqWxOu0RZMdIe3B9E47NiMlHnqY5DbcC6mqJNMhZu7kuedkEy
	Y9Hv4HkVuTbwVy+kKQIeGCWT15bl8LePbtz0DK3ea3jaVNMHZSqlAtC+xRevVVDgjXUOQ9c3dd9
	/PAxiTMhhVZxzud7mkiO67UvISs5ugJWzR/2nRDC8elRQoOfsrCC5Yc/vQRF9gVNOpSnPaiBEoX
	AmMnR/bLeOwNja65RuGHLlC5on8zWNzHlfo2CQHztL0WTMEBq9dhAZOKtwrqESi/sSzJ/LeRkwX
	Ny/Abmpo3yx2br3HpxdTj+PPcTSI2
X-Google-Smtp-Source: AGHT+IHSWJYMmiilFq0GtP25G1GQAXzOeFA4uM6WttlSQSDa4D8BZIvbWko1AKzeqQZza3T/DLDdOw==
X-Received: by 2002:a17:907:d785:b0:ac3:3e40:e182 with SMTP id a640c23a62f3a-ac3f20f29c6mr1017949366b.19.1742769572496;
        Sun, 23 Mar 2025 15:39:32 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:31 +0000
Subject: [PATCH 15/34] mfd: sec: use dev_err_probe() where appropriate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-15-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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
X-CRM114-CacheID: sfid-20250323_153934_330645_0A40C5DE 
X-CRM114-Status: GOOD (  12.92  )
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

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

While at it, harmonise some error messages.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c |  6 +++---
 drivers/mfd/sec-i2c.c    | 10 +++-------
 drivers/mfd/sec-irq.c    | 14 +++++++-------
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index fcf7668efd3215ad70d81916ede249ed5f9d45ae..5e084e2c389ea6d509393be93f7e2d39a795a60c 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -211,9 +211,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 		num_sec_devs = ARRAY_SIZE(s2mpu05_devs);
 		break;
 	default:
-		dev_err(sec_pmic->dev, "Unsupported device type %lu\n",
-			sec_pmic->device_type);
-		return -EINVAL;
+		return dev_err_probe(sec_pmic->dev, -EINVAL,
+				     "Unsupported device type %lu\n",
+				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
 				   NULL, 0, NULL);
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index ba0efb30877bf668fed7476a5e247e0dd4095806..ce1e5af9215a305fbb55157ae4e7bfb9aace86b8 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -152,7 +152,6 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	const struct regmap_config *regmap;
 	unsigned long device_type;
 	struct regmap *regmap_pmic;
-	int ret;
 
 	sec_pmic_i2c_parse_dt_pdata(&client->dev, &probedata);
 
@@ -186,12 +185,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	}
 
 	regmap_pmic = devm_regmap_init_i2c(client, regmap);
-	if (IS_ERR(regmap_pmic)) {
-		ret = PTR_ERR(regmap_pmic);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(regmap_pmic))
+		return dev_err_probe(&client->dev, PTR_ERR(regmap_pmic),
+				     "regmap init failed\n");
 
 	return sec_pmic_probe(&client->dev, device_type, client->irq,
 			      regmap_pmic, &probedata, client);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 4afac3aa0a582994bf04c41768c1c788c54ee2e9..d05c8b66c35f2a1356d7c641484404628870ed42 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -488,18 +488,18 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 		sec_irq_chip = &s2mpu05_irq_chip;
 		break;
 	default:
-		dev_err(sec_pmic->dev, "Unknown device type %lu\n",
-			sec_pmic->device_type);
-		return -EINVAL;
+		return dev_err_probe(sec_pmic->dev, -EINVAL,
+				     "Unsupported device type %lu\n",
+				     sec_pmic->device_type);
 	}
 
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0) {
-		dev_err(sec_pmic->dev, "Failed to register IRQ chip: %d\n", ret);
-		return ret;
-	}
+	if (ret != 0)
+		return dev_err_probe(sec_pmic->dev, ret,
+				     "Failed to add %s IRQ chip\n",
+				     sec_irq_chip->name);
 
 	/*
 	 * The rtc-s5m driver requests S2MPS14_IRQ_RTCA0 also for S2MPS11

-- 
2.49.0.395.g12beb8f557-goog


