Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35A5C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 09:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lmr3YaTLm2TMny3Haqb4MzDdaWsOi7W4RHKlgDAQeoc=; b=JkKZ6QR6YFVBvY8xtvxCgAyJru
	UXwYi+b2gYEAxBXvoMf4GPfv0wdyGzAO0uQmSbKah7b8392t8ZKkdeYryT4XmOpCsWvgyNSU6F4Vp
	ZUoPp8g5Vs/jUyyrvRYPK1PTj2g9EJc1SpIBt30B2LtDJoofde8wFK5pbRP9lAW8TMhlGYgYYUpdI
	nyjfgFE4tBIo/Gm78Ei/5bnftxXV8texfJhvjcJR9UdsGlxnd+uwo0YQeu1pavNFhZQHgpIWs5JOm
	SMRHE/YdbVdUtWFkjMxnVgKfdPOOWBi8uS7v/IJUpUuMcNGjd9C6Nk+SxdDcuX6PqYeQCFa0n3USO
	909XTQYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjElR-0000000HMs0-3Aed;
	Sat, 15 Feb 2025 09:47:09 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEeQ-0000000HLbg-147Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 09:39:55 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5de56ff9851so5105015a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 01:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739612392; x=1740217192; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lmr3YaTLm2TMny3Haqb4MzDdaWsOi7W4RHKlgDAQeoc=;
        b=bsPgOii25lb0gc2OVeU+7fSq8YgowmtIisHEbw57NIZ3UYmzuN6NlduY91rTJqvo1G
         qO6unUrVovSZjDy0h7rs2SfIDnR5OXfRB7CTF/f7BoG+I/XgObhsld7kvhZIsui6FnhN
         b1copFDNbkJkD74ODVH2s5iXXo7+MbI+1nZhO/8QkN7sAbb43QfXfgm2vTIdKMfesEh/
         3kIRqKlsWMAqob3vv9/GsorvdLYoDQZNWqodlljUQJtji9cYFMjpc9xZFAkKE+QMe8BL
         bgPYPAaDAwEctv95peWvoZ/eESWCvYXWxcmPz/kgMoyDRo5hOTK5v/vUsSG9213POLZT
         T/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739612392; x=1740217192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lmr3YaTLm2TMny3Haqb4MzDdaWsOi7W4RHKlgDAQeoc=;
        b=R6IkFFHZEkbOzKpWELLSqwAOcsH77qwaKl+PT3a5w41xL2w/lfGtipGsria0bfIbS6
         H8pGxeiyl31RiVT7II7ELBNxkmdD8b9cQrroI3aDiJAqmGNnWlHF4f3C40jelm1UQVXI
         3foNVI4caXyTELygAU/f16VX5L2uwJoGmGz80UyNPJSKXDvqviLX7ePUnEKhWiB/uJzC
         NT2H18wUtIKuCqTzEuL2nR0BcBW6Ra5V2vRLcnIF2RLuAkqJ6hALv/BJRTKE6L9r0yE3
         F79IQYBMO7i8blrPPpXNrnrU7Zqt52JgWze8q36u/yhG2F8em6Db2VZqh6qFbydSmIi6
         Hdag==
X-Forwarded-Encrypted: i=1; AJvYcCX3I4nlF3rJN+PMvFmnOSJq5H497FQBRL7CLeuhMfAyBXh0jdkoV/lkV8UtihKYjHqpM0pjlRGGa/O8o1EHr5ix@lists.infradead.org
X-Gm-Message-State: AOJu0YxDVNC0HO7NV+hvS8ZKILHFtiMvRzvoTeCArR05dDPJXLAmLZvQ
	68HsKxe6DqOFyAqeM5y+DAy1RtKb3Hd4xwE20CXA6ncOTroVWK+y
X-Gm-Gg: ASbGncsVjIl2jHFPygh8PuqGQOKA0KWfG1kwk6RgOOPsAf6ipWgM4D8NZYfHx6WgiXw
	cFmLimTzIi8NGWswuY/TWD2vAuwrGQzqtqUk7i8ENxmeta9L7BgDIbWJ3UBFgv6y2lDCkAW5qz9
	GSY0DCOjWEqdVw0ZCa3C1YZlROUupdK2Fumx5rXa+HifOKK73I5Lg6vW1i1JCjTMiVc2MVyQiZd
	0ehPWEbKZaWi5SGDmRTVDPSTMwGGtgMDcjqHdpY3IlmsPQQO7XRDsARvb+V21WHulpggWpFN/CR
	FfZs4y1OcJ53ih4ydHmuZplJjObiDgAEVkQHl0D/yA4ubTKDhpFrd1Kf1Tz/aw==
X-Google-Smtp-Source: AGHT+IHtTXRio0IX06KOJvwoIMmlRaNtlLQCehWw0G/jGNUuBFc/oOUVGLxub/bXrDSDqkRPvqMN7Q==
X-Received: by 2002:a17:906:6a0c:b0:ab6:621a:f87e with SMTP id a640c23a62f3a-abb70de28e8mr203210866b.41.1739612392466;
        Sat, 15 Feb 2025 01:39:52 -0800 (PST)
Received: from hex.my.domain (83.8.115.239.ipv4.supernova.orange.pl. [83.8.115.239])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb7aecd3d5sm69698966b.148.2025.02.15.01.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 01:39:52 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 15 Feb 2025 10:39:39 +0100
Subject: [PATCH v4 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-bcm59054-v4-4-dbfb2d76a855@gmail.com>
References: <20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com>
In-Reply-To: <20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739612381; l=2626;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=t1GHjMmU0ognTEYJZcAOAhbfDin+9ghT43s1MEvfcck=;
 b=RI7LbX6FOYxKwKO5J3j4rVS2/w7E9TrebFBzOHQhttEmNKSR0kMMUamL2Z3ORnLJfWXP+Yzyn
 HzjcYFHR+11BeG0xkJbBEnDlocdF6zjqJYkOshq74kGlY0L9C6aZ4ll
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_013954_298923_3ACA27EB 
X-CRM114-Status: GOOD (  18.73  )
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

The BCM59054 is another chip from the BCM590xx line of PMUs,
commonly used on devices with the BCM21664/BCM23550 chipsets.

Prepare the BCM590xx driver for supporting other devices by
adding a "bcm590xx_dev_type" enum with supported chip types
and store it in the MFD data struct as "dev_type". Then, add
a DT compatible for the BCM59054, and provide the device type
as OF match data.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Rewrite commit message description
- Rename "device_type" member to "dev_type"
- Drop awkward line break to fit function call
- Add PMU ID/revision parsing function

Changes in v3:
- Fix compilation warning about device_type pointer cast type
- Name the device types enum and use it as the type in the MFD struct
---
 drivers/mfd/bcm590xx.c       | 5 ++++-
 include/linux/mfd/bcm590xx.h | 8 ++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
index 8b56786d85d0182acf91da203b5f943556c08422..632eb57d0d9e9f20f801fac22eae21b3c46cefd5 100644
--- a/drivers/mfd/bcm590xx.c
+++ b/drivers/mfd/bcm590xx.c
@@ -50,6 +50,8 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 	bcm590xx->dev = &i2c_pri->dev;
 	bcm590xx->i2c_pri = i2c_pri;
 
+	bcm590xx->dev_type = (uintptr_t) of_device_get_match_data(bcm590xx->dev);
+
 	bcm590xx->regmap_pri = devm_regmap_init_i2c(i2c_pri,
 						 &bcm590xx_regmap_config_pri);
 	if (IS_ERR(bcm590xx->regmap_pri)) {
@@ -91,7 +93,8 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 }
 
 static const struct of_device_id bcm590xx_of_match[] = {
-	{ .compatible = "brcm,bcm59056" },
+	{ .compatible = "brcm,bcm59054", .data = (void *)BCM59054_TYPE },
+	{ .compatible = "brcm,bcm59056", .data = (void *)BCM59056_TYPE },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bcm590xx_of_match);
diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
index 6b8791da6119b22514447bf1572238b71c8b0e97..83e62b5a6c45805bc2acc88ccc7119d86f9ac424 100644
--- a/include/linux/mfd/bcm590xx.h
+++ b/include/linux/mfd/bcm590xx.h
@@ -13,12 +13,20 @@
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 
+/* device types */
+enum bcm590xx_dev_type {
+	BCM59054_TYPE,
+	BCM59056_TYPE,
+	BCM590XX_TYPE_MAX,
+};
+
 /* max register address */
 #define BCM590XX_MAX_REGISTER_PRI	0xe7
 #define BCM590XX_MAX_REGISTER_SEC	0xf0
 
 struct bcm590xx {
 	struct device *dev;
+	enum bcm590xx_dev_type dev_type;
 	struct i2c_client *i2c_pri;
 	struct i2c_client *i2c_sec;
 	struct regmap *regmap_pri;

-- 
2.48.1


