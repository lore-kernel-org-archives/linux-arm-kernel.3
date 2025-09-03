Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833BCCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 18:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYuv3IrS7IPuMyikGmW/lennhceiqK2zrsQcCIyLu+Y=; b=xMKG40Yd3nQReThHY2YwsWz8bZ
	TjKlKmwFZENLlbPRyyzsOMia2MQNURiRg5qlZRjnMGY7n3H+5IXC2xXqE8IM4983VZa+Xduv3u3VD
	JEkFKv7fib3eosqJxet7p9qIm/2e0kmRsxH0iFEoqBJndXa6ZEM0S1GUtmThpY3DJRcVHXPtkTs/x
	H3NV7YZoqFKVWerHbuXvjcKHmxGvbCevVwSekalaUf3kaJjTWQTEa7dMlm1SqMB6wFOfZtaBG/tY3
	bCOcnxVQRlr15Xr5ZPhcuyzd/ej7UzB1EdeRu6+IprHmlMi0ZW8SLCwupQY1GiQYMTp06zhzIox38
	UHS5TLPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrsL-00000007GCj-2e7P;
	Wed, 03 Sep 2025 18:06:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnyh-00000006f42-3sKq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:56:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45b7d485173so40921445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 06:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756907806; x=1757512606; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYuv3IrS7IPuMyikGmW/lennhceiqK2zrsQcCIyLu+Y=;
        b=yo3o9B8TSkdCww8tTd+VZT6NmvQ6uuDBAIRMhGdWADMnq6xRu29Zekv1Y8Yknf3ulO
         zWwLAHrzwDg/ki2H/eVcrlH04QjGL3yFuR9XjLKfO1IiFw64sYKXT5kFJQoU1puGVWZ2
         qJgdIyHOf872YsNQAzQEY6XSDeuFZ4idBa87x53uY4XfGF/sFjccR/2j6GWnfgLoxn2P
         YBqrxwvLQmhcG2Zbl1wibl+rTTJrJMVudUiDEcSXAxyTN3Yfxtw9gY9wCxb5lnv5EaQy
         WXOIJucI4ZMg/pKTdTw8x/YPfRRy6PazpoIFjkBUdccfRIQE38lWMbNf+ID2JgjpB0br
         Kcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907806; x=1757512606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYuv3IrS7IPuMyikGmW/lennhceiqK2zrsQcCIyLu+Y=;
        b=VnFUwHTKAbqKMcObudh58XkXen1bLuL8fN2qROYHabbHoc0TDyTPmW+nqz1m1AZ2o6
         HdCZm9ftkSkMW9S8tpBDwmwfT6PHWGVgoPXJuCcQMc/hjRTf0lSV4iC4M+3LRiSRYNmv
         G9Uk6dsO0En0V3RoC3hyuv282GzEPvQGP/ExJU06qKgQ6FUzbMkfJkYuaKaI6VGiaP2+
         HOEehk/0emfmmeBNROXbkvMY4JTHk19RnmODZ53Yw7NySakZSfm7X1/VPP+3+nSrE0BC
         EthxW/foOYEl4gsZO/aJ8Ix1xgVuB1YuDS58Gc+l494XJHp7Zp6M/8bE3avLq8tDbb7v
         8TuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0BASgzDdF/7KVV+dsw14hp/OTjk2UuVjKnipVnQAkZu6OyAHEzaheFvU1SCDmV/zexaSwcB0gKBaRfu4/uV1w@lists.infradead.org
X-Gm-Message-State: AOJu0YwD0hp0K+k/2GfJQw/XXzNSALzfrOl8CwDhW1LoYPSVDEuWP09x
	rccEc63Q0kP6F3ZTVxr0zuvrXK7mbKYdmtA+Z9TmKOp5az4+LG2uim5c9by2rWrW21Y=
X-Gm-Gg: ASbGncvaU1dZARUU2/Azqew/wndlzxmwuQhBsCS/7f5d7JsFZbNEQCoOOkVFnopm9fB
	z68rnjFi8bLuqtponzF1Wow4YYVbn5xfvZXNtamab/1LfJKzN5f0p+5PF7SswqZQ5A8rpaRkmBe
	6WbR7yvJecyn/58pFrEHyhxL2O9eCVsSB7yxk0lyyvKR6i4MIeMYdlvVZgvWdAujpzhNVOV8nF3
	XIqnw5oAcWffGmdYK1bq0NeevdH084HKaq4t7Xx8iub2wF7Pz7PI4m7u+Ew746Io+eWWsOvmFkS
	mLIx0KeYIABkcEAbe4c1gCHKsOm4WuyMw9Tyi5ZykOmlbIZzOMfH08jLWvzaYiRtDLZHEG8QLp8
	+FSsd6p+HgRgmo4RgXOX/7syPr+9qO3t5KIBrptFuKEhkhuzl/1cOWgY4c5BS6GyLyZ3Uc4ytfZ
	+R3+92tA38jAFbmwnAgiDR2Bc=
X-Google-Smtp-Source: AGHT+IHYANMgRYGXdNHs2QyGL8QnX2/Tp8baR9s93U+KQIcT5D6VPk22Vpiz9HHftpfRlLtqh7LR+Q==
X-Received: by 2002:a05:600c:358c:b0:45b:9a3b:34aa with SMTP id 5b1f17b1804b1-45b9a3b36d5mr60145985e9.16.1756907806344;
        Wed, 03 Sep 2025 06:56:46 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87632365sm197257135e9.16.2025.09.03.06.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:56:45 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Sep 2025 13:56:41 +0000
Subject: [PATCH v3 4/5] firmware: exynos-acpm: register ACPM clocks pdev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-acpm-clk-v3-4-65ecd42d88c7@linaro.org>
References: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
In-Reply-To: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756907802; l=2606;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=dz7gQjCygFQTHCpzStxcsEQEHazG0z97bLLdbPJU1cI=;
 b=LnTHfH04YTaRtLtGrKsu0l2tPiCHi5kfhymeOk52FGnp5MzLrMabP6gJe0V4GjgInvVmxXtUf
 XE+PInRBnXoA2tDMR/QaB3Bf4NEDZH1HPg1Gifx67K5mHfQZQODjRKi
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_065647_968299_C1D5587C 
X-CRM114-Status: GOOD (  17.45  )
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

Register by hand a platform device for the ACPM clocks.
The ACPM clocks are not modeled as a DT child of ACPM because:
1/ they don't have their own resources.
2/ they are not a block that can be reused. The clock identifying
   data is reduced (clock ID, clock name and mailbox channel ID)
   and may differ from a SoC to another.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 9fa0335ccf5db32892fdf09e8d4b0a885a8f8fb5..0cb269c7046015d4c5fe5731ba0d61d48dcaeee1 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -177,9 +177,11 @@ struct acpm_info {
 /**
  * struct acpm_match_data - of_device_id data.
  * @initdata_base:	offset in SRAM where the channels configuration resides.
+ * @acpm_clk_dev_name:	base name for the ACPM clocks device that we're registering.
  */
 struct acpm_match_data {
 	loff_t initdata_base;
+	const char *acpm_clk_dev_name;
 };
 
 #define client_to_acpm_chan(c) container_of(c, struct acpm_chan, cl)
@@ -604,9 +606,15 @@ static void acpm_setup_ops(struct acpm_info *acpm)
 	pmic_ops->update_reg = acpm_pmic_update_reg;
 }
 
+static void acpm_clk_pdev_unregister(void *data)
+{
+	platform_device_unregister(data);
+}
+
 static int acpm_probe(struct platform_device *pdev)
 {
 	const struct acpm_match_data *match_data;
+	struct platform_device *acpm_clk_pdev;
 	struct device *dev = &pdev->dev;
 	struct device_node *shmem;
 	struct acpm_info *acpm;
@@ -647,6 +655,18 @@ static int acpm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, acpm);
 
+	acpm_clk_pdev = platform_device_register_data(dev,
+						match_data->acpm_clk_dev_name,
+						PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(acpm_clk_pdev))
+		return dev_err_probe(dev, PTR_ERR(acpm_clk_pdev),
+				     "Failed to register ACPM clocks device.\n");
+
+	ret = devm_add_action_or_reset(dev, acpm_clk_pdev_unregister,
+				       acpm_clk_pdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add devm action.\n");
+
 	return devm_of_platform_populate(dev);
 }
 
@@ -746,6 +766,7 @@ EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
+	.acpm_clk_dev_name = "gs101-acpm-clk",
 };
 
 static const struct of_device_id acpm_match[] = {

-- 
2.51.0.338.gd7d06c2dae-goog


