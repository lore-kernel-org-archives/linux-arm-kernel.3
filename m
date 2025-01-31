Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFBCC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 18:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NVDC1BCd9AWkrJth6d12FQxmu1lidyDRyNXZVkh74A=; b=gfj/X4YPk7141Fq8OhkowYsIPG
	ZTqKgAzGGIVyDmSF3ctsIlnVpJuQ+XAA9dGkTdOtQGSurqbQgLgXJ7d9G9mc4v9PuVAP+2wQFYMuF
	d4lMTDD+n4Kg5vjT9NNtXm0cZiarWhpBPsSetxX5+vGDbuJmVAgIyGztojHnV2L4RZphS7KOzGyXw
	7RNVlz0ZBkRPVm3flRQkWa2jHZkxq8tPgxxd27DgYqoiBeQUauQzB68J9OrJOcTosURUxOIPWXi5w
	YIHm0jdGwU+nd9slH17YchBD/EvvbSfPO7k37LrKX4JBl5XL3nlk1tP91F49nDUDkxD/dT3hPWdm/
	nyazTZAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdvd4-0000000BC6C-2Vca;
	Fri, 31 Jan 2025 18:20:35 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdvWj-0000000BBGY-3RSU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 18:14:02 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso3983767a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 10:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738347240; x=1738952040; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NVDC1BCd9AWkrJth6d12FQxmu1lidyDRyNXZVkh74A=;
        b=FZBTEyQW9YV8kci/7OXDugJMy3yj189XyqlRiMihJI5OUiM68W5oJTZHY6VE86uMy8
         zNaF6BlMDg5MHcmmivDyhC48yhObLxTKfg+JaHzoFGWeyDJFmjSIaobtXXA1s6/D4htS
         QVnSvFTYfmQedr6s9nBlv8+KzKzGplxJ3by+UYJG8/80u9ts0bkN5/INoHwjVx1YdPgB
         dE6LXGvFBZmW5/RXkIOq6zybkB4XiIFBL6sXnxn6O+dILWi5l8wQLGGw9+eICbXE+fir
         tlycMDmWnOTMLd9WHF/tGCsKLJDWVuuSHoVwsbPtgYMAAYV1/VJ1rvWNy2eyjqM6BF1A
         CKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738347240; x=1738952040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NVDC1BCd9AWkrJth6d12FQxmu1lidyDRyNXZVkh74A=;
        b=DettilKG5Pajd8DDbg8DIjQk6WLAog6t6VEtBmYhfy7I2iVxBLdC62KvoibqRVDUSM
         vRQ+ShYeeGiF+AVsLPQGR2qvxLnLrINWgJVfQazrZC3s3roFG87smsKStBlB9EKrY5ID
         iLDRqseF3p5CR1EjRGpmvfqACOImVwZTY3PhHeYTcj74ejupdW3qKg/T5iSu32vzxhVz
         najm7MYLybkXxrsbFak8A2mzMaaBneF9sFPsGOddv5Q5n9hTFhGWdsq+NakfZMB2huqS
         MdcW6gV3jlnVgmLa327r1vaKtklMfnzcP1vk/XY9KoIb87PV8k9sgCSmtiChE0KalJf2
         XrNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOe5tCxRIJMOhdPoCDWU9xCTX4e5pH/ZDTHzgJSH/boJVjLu2qEPpMnTBNSoTR61n9DkOZpXuz25OpfVaiyKNB@lists.infradead.org
X-Gm-Message-State: AOJu0YzDoR+1qaEVjrEFHQtHL7+UBrJQWWC/j/2Dm92djSphLuAbYc8L
	WiORYANqrK7X8I8qHYRcXK00GnDjTyl2Bt8n+NoBPtOr4VYYw9pD
X-Gm-Gg: ASbGnctLlVVMH4oo4aQPv8gWmR/lilQyFCQc7WZikPtHC2I3mWnA5y/zjqkso3LraLd
	oehYRv2IBaBcwBeIfJF3/2aMyF5oUSSFLnlHRpPYrADm7vmdI0idg/3antfYfda+jip228QtQ14
	iAfo6DPCgsAnvbeO5fR/elXsAnLpKbhgFHHrmlMsxhEQrRNL4zuBPp8stlkXLbsoAeYlHC03bxF
	TiTdhYDW0QwLdKteyvcKmk0pX68EuKgNrc8CQO8HDjM8Dt18W/Ebg6+y2lPtNR+C26IrxYUEO8d
	dXtKac0nJgtj5Zb9Um1967wJNajksAgADoW61yNA8CBCO1+ZJP862KjTt8fzZA==
X-Google-Smtp-Source: AGHT+IGPJ4/jeRlYVMHKjrZ+UIzlTobg/nm/rOXX+d6UQMedpWf7FGYvaugsiKHBtsVbv1M642DRVQ==
X-Received: by 2002:a05:6402:3589:b0:5dc:6c1:816c with SMTP id 4fb4d7f45d1cf-5dc5efa8ee0mr11648178a12.1.1738347240018;
        Fri, 31 Jan 2025 10:14:00 -0800 (PST)
Received: from hex.my.domain (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff67sm3223744a12.16.2025.01.31.10.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 10:13:59 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 31 Jan 2025 19:13:52 +0100
Subject: [PATCH v3 4/7] mfd: bcm590xx: Add compatible for BCM59054
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-bcm59054-v3-4-bbac52a84787@gmail.com>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
In-Reply-To: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738347232; l=2247;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=xyJ65tKgVjwJHrbcCu1WkIZ9H5kiHix8wXr8hmS3z5Q=;
 b=NFYiDgcC/zL0sAIKvme5gI0kNx29A+DdsA9eTtYWlzcRLUIWrq9TQ7ynUsSAkepeZ8ptUqIGL
 VPpe6VmFv/ABoQ+jZl4f5Bf11K0Ghyy1JUI8P3GHRAZSgsI/FPMMThG
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_101401_859974_398A7820 
X-CRM114-Status: GOOD (  18.55  )
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

The BCM59056 supported by the bcm590xx driver is similar to the
BCM59054 MFD. Add a compatible for it in the driver, in preparation
for extending support of this chip in the bcm590xx regulator driver.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Fix compilation warning about device_type pointer cast type
- Name the device types enum and use it as the type in the MFD struct
---
 drivers/mfd/bcm590xx.c       | 6 +++++-
 include/linux/mfd/bcm590xx.h | 7 +++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
index 8b56786d85d0182acf91da203b5f943556c08422..23036157480e0116301bfa93932c92f5a80010ea 100644
--- a/drivers/mfd/bcm590xx.c
+++ b/drivers/mfd/bcm590xx.c
@@ -50,6 +50,9 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 	bcm590xx->dev = &i2c_pri->dev;
 	bcm590xx->i2c_pri = i2c_pri;
 
+	bcm590xx->device_type = \
+			  (uintptr_t) of_device_get_match_data(bcm590xx->dev);
+
 	bcm590xx->regmap_pri = devm_regmap_init_i2c(i2c_pri,
 						 &bcm590xx_regmap_config_pri);
 	if (IS_ERR(bcm590xx->regmap_pri)) {
@@ -91,7 +94,8 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 }
 
 static const struct of_device_id bcm590xx_of_match[] = {
-	{ .compatible = "brcm,bcm59056" },
+	{ .compatible = "brcm,bcm59054", .data = (void *)BCM59054_TYPE },
+	{ .compatible = "brcm,bcm59056", .data = (void *)BCM59056_TYPE },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bcm590xx_of_match);
diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
index 6b8791da6119b22514447bf1572238b71c8b0e97..b76fb57bf0dd17d51580e93db58ece4a4d6dc5e4 100644
--- a/include/linux/mfd/bcm590xx.h
+++ b/include/linux/mfd/bcm590xx.h
@@ -13,12 +13,19 @@
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 
+/* device types */
+enum bcm590xx_device_type {
+	BCM59054_TYPE,
+	BCM59056_TYPE,
+};
+
 /* max register address */
 #define BCM590XX_MAX_REGISTER_PRI	0xe7
 #define BCM590XX_MAX_REGISTER_SEC	0xf0
 
 struct bcm590xx {
 	struct device *dev;
+	enum bcm590xx_device_type device_type;
 	struct i2c_client *i2c_pri;
 	struct i2c_client *i2c_sec;
 	struct regmap *regmap_pri;

-- 
2.48.1


