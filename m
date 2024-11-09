Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF157D5E368
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 12:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NYjmB31gxcjk36kydLhN1LaoAFU9bSgURFqpBpxQVM=; b=jIzsfkcYSvJTb+CTN21/zP25cl
	TZ4u8Uhe7PHevHyq++a3EgIhODPEHg37WIyjM+g/HrJhhQBJ8cIlibAqsDjQOvxoiONou2l74O237
	+DG6w2cYtayNKmKb1pNrA5Pg0EyTR6GBRip7VawfE/Ab+X5RUHk9GI14+y4N7dgW+xvuJQ1cV2fZq
	BZp61pccFgYzDRiPra1neE6F0Y1t5zet1l/vRWBM/6InPIpj71qeSWQVgrHloaJ6iFUttwAj2sHC0
	vCp7gXPzsafcoygpLFeNzmLljTzyoUmVSRrpOxjOY4xaKeBy7VTqHK2TBqSNwk+HH07e9OUgOAa3j
	8sJQETdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kzj-0000000DLzJ-3jaw;
	Sat, 09 Nov 2024 12:55:15 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kpc-0000000DKTr-0Ve7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 12:44:49 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9ed49ec0f1so522813166b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 04:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731156286; x=1731761086; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NYjmB31gxcjk36kydLhN1LaoAFU9bSgURFqpBpxQVM=;
        b=GTinBj0KXl6A/nwWtJtl4kqVKk+tJMRY44xFI7Kt9VipwtXNA6ZFM7JJ9djeO6PNdc
         65/KbttKmQb5gGRL7mLY64uzov11NM/kbgxtNxtyjf67hgXwjFvETwu6Hverx80r3kII
         xInil4bhoGbHTqWPE5eD6UblfBR5pAJWv/frLq38DbAMbofEu0VlzkQL8hsqDKUGusIE
         Qh0Kp4Lj/0+xMDersLUsSaMYLOwaYuxHhwciTVNveaDik25FBBDR1ydL5t0XaD48WqoW
         14cnlLj7YRBJxpAR7XtX+1zhoTA4TEuDekHfRnpzgmCRVykmARf9OeDwKGVDba0uvkk8
         3KpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731156286; x=1731761086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NYjmB31gxcjk36kydLhN1LaoAFU9bSgURFqpBpxQVM=;
        b=UcEeSUUV9tT6POrnrWZEf5LY4iOQIdRZHPyPJ3MZa/8qQiUXHWhnu5xRIJRJj929Xd
         6J78jnFj5QDya6pKuHyYhJAjYs88BsZdQwah/uaJX66IdzJxG41TyRT6KefcY79/mE42
         c3mTMDaUmHaESfOz5AkntgydebA5OE1/6SBWLxZURY6+LIAtFfAzyyHcmJgXTnf+2UpX
         3rZARPa5/rJwF1hEowqi1EZOpEoFHjIlmfEWedS8TcYtw30Tp+vQk67iwyolY3Xn7Ayk
         bhuyGbdRIAK2MwV8kCzHjY9YvfvAixOpZRFDbeA61Rl56tygpnK+/AURlyGrXXxPKlBj
         LpiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMxlh/bKL0LNstWxdN/Jp5tauQAlKReJSIcbjOv716QRQBcTKtVFRTbpragbLgh3GCuhtFjcpvsFW1rFqx5ihe@lists.infradead.org
X-Gm-Message-State: AOJu0YxxjaJmenCbpVnbfUaFwmhnewE1dAX95rofqVJCRw7ib7lWn+9t
	Bx6ZVEisxSetlyz8kkAg+6NbJdg/qmO+zA8b5kc3xUbz7igkbLBZ
X-Google-Smtp-Source: AGHT+IHmuYr9plCibE5R6SWQvYCuz+uxGfvZMDTXTYfiyiiZ0cPupHyPtkL4o3yovyQ65WSVh8GayA==
X-Received: by 2002:a17:907:7d8e:b0:a99:f183:ea8a with SMTP id a640c23a62f3a-a9eeff40bb9mr643164866b.28.1731156286012;
        Sat, 09 Nov 2024 04:44:46 -0800 (PST)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03b5d793sm2940166a12.17.2024.11.09.04.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:44:45 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sat, 09 Nov 2024 15:44:34 +0300
Subject: [PATCH 2/4] power: supply: max17042: implement dts shared-irq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-b4-max17042-v1-2-9e2b07e54e76@gmail.com>
References: <20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com>
In-Reply-To: <20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731156277; l=1696;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=mseh9WRqz5C4m+dJG3gKVqO4w2mq1wg/wZdf/mAK3Mc=;
 b=p6RG8L2ppMseJHrGFGFXqKD0cvO/hmr64avCyPTMrXOmpbKJvR/L7yqOw+I7HkKgDykpfAaQc
 K5rjsIUntQwDRGn+xKnFPr/5z2IEZy24Orl7n7sVxJn+1/jtzpqtQCh
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_044448_204363_7392AA88 
X-CRM114-Status: GOOD (  14.54  )
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

If shared-irq specified in device tree, request irq as shared.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/power/supply/max17042_battery.c | 3 ++-
 include/linux/power/max17042_battery.h  | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 496c3e1f2ee6..f3d89d4d5c42 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -933,6 +933,7 @@ max17042_get_of_pdata(struct max17042_chip *chip)
 		pdata->vmin = INT_MIN;
 	if (of_property_read_s32(np, "maxim,over-volt", &pdata->vmax))
 		pdata->vmax = INT_MAX;
+	pdata->is_irq_shared = of_property_read_bool(np, "shared-irq");
 
 	return pdata;
 }
@@ -1109,7 +1110,7 @@ static int max17042_probe(struct i2c_client *client)
 		 * On ACPI systems the IRQ may be handled by ACPI-event code,
 		 * so we need to share (if the ACPI code is willing to share).
 		 */
-		if (acpi_id)
+		if (acpi_id || chip->pdata->is_irq_shared)
 			flags |= IRQF_SHARED | IRQF_PROBE_SHARED;
 
 		ret = devm_request_threaded_irq(&client->dev, client->irq,
diff --git a/include/linux/power/max17042_battery.h b/include/linux/power/max17042_battery.h
index c417abd2ab70..1261dbaa5e8f 100644
--- a/include/linux/power/max17042_battery.h
+++ b/include/linux/power/max17042_battery.h
@@ -250,6 +250,7 @@ struct max17042_platform_data {
 	int num_init_data; /* Number of enties in init_data array */
 	bool enable_current_sense;
 	bool enable_por_init; /* Use POR init from Maxim appnote */
+	bool is_irq_shared;
 
 	/*
 	 * R_sns in micro-ohms.

-- 
2.39.2


