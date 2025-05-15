Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261F1C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 14:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/WfdUoQ5QD4GDYBilFtU0HBfo7TFHkHqD8++md7MIY=; b=qO7p/7pyYYWyhi8zPS8Aq60mbw
	ncRGEQVCNyplLVE1nxHhHAKpVJ0Frqyv7ZWpp4xCJ+9RwUffxhQ+RJF7+wzXWumhn9taaabhq/tKn
	dTk5JROuBhG7jPmmfLgRLMUBNMrqzPr8TemVyXRFYLTHXbvZx6B8X8iFWWPlPGJxblO03MiPI3SVb
	2nfyFbSObUc+WPztIdSGsvQcLQdYtjXy14K5ZnYgrUslrmx4mlE06D8NARn2ZZTnoLeYd7siMv1UG
	jQg0K+hgZZlLK0aLPMPhLOL9Uyp5P2tNoEYgSV43T3oOwjHjoOloNB+8hu3WJ03+Mhv0LTdwWnoAd
	UieOKFpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZXz-00000000soz-0NDK;
	Thu, 15 May 2025 14:26:55 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZO5-00000000qwU-4Aqx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 14:16:43 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so1518138a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 07:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747318600; x=1747923400; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/WfdUoQ5QD4GDYBilFtU0HBfo7TFHkHqD8++md7MIY=;
        b=aTEvN4Pu6nsPHfSalA49QXT2wpP/jaWvpoz4LNWWSc6O3UYPFkd/HTWjtW6Mb5Gal0
         4eQge3AkAAZBnASPrgNnaLIgSWcX83KcpuXZxXBBYQ70ZdEpj2UEBbcJKUJpZ4TSdWs4
         OYM6oHEzu7ymrJkREMEclqpv9m/4IZK7mjh7OU3EYbVIV/CDF9vcLEHl8bVq+Jpnl7Ym
         vNmvZEmSR7Xe2QK3uFM/BK1k7cBiU1e3JY/2v6kBYmipLGsiYW91R2Nih0ikl8rRy5vY
         C222Rbg7K7ssi+tJhI1nezqaZ3olrLTjgrldHDFfTgVmAxU/HgdYobXeIx8eBa/iU8EI
         fP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747318600; x=1747923400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/WfdUoQ5QD4GDYBilFtU0HBfo7TFHkHqD8++md7MIY=;
        b=DAGJJPf3ZSxKsNaalHc/A9218nDIOzlOMimlxSqrImNTVC4jm4KdQidtQRTCI688nx
         225KNuNDj3OyXPA5KgVupyGTRWi9JzvG4dKxDVJYf7/62f/Oj80EsI9bRChDipnHH5tj
         YROsWmlxotXj9h1hvGRPKgfRRKTYwteTIzme/W6mMra5QqfvPTg99F6n+MKxNT5RhLK2
         wuh0QFBERgY/ar47F/BsiNncMIxPw6bCPc6Phtzrf3IosNduX2qCPQIii8goTMoI10fx
         rwa9CLQetKBwbYb0j9a46MVJ9B7FIHQvk5Sh7ShiipzGBB9Mq9TG0QAaHCLuXDseAXA2
         Gbzg==
X-Forwarded-Encrypted: i=1; AJvYcCUE0JwkTJD5nuBb2TcAYMw8iHF8haohvyJL0FfjneOtYTMI+hQ+no9r+jOEbHL8nt9oLutzvlGAOcNl/qHGL7BI@lists.infradead.org
X-Gm-Message-State: AOJu0YwaxpaY+ZKC3KCpEELKiE0ryFZYYzT1DQd33zZfkS2li9gign9w
	v+gERIFpjm05VucL5f9igzEvM6B7fuFeuVqjPO11ogUjBeu0l3JF
X-Gm-Gg: ASbGncvUREG95yk7bni7UwAHmrYGiavb2gi0cLcOTTgdv+VJoRLzWzCUrIsCiM1z6og
	7VOzWPF6eyrtUQB3MnY71hDrNPKbUFFeugEIk19Lyeaz8moHa9G5cWlb6nciXdkucipUY7BCWqC
	oPUrpeA9sNR4E1T8dlfuc1SXKbvBgmePtodfmKMnRPOx4D1lP06cH5rf9GRf5ByQKrK5D6JRWwy
	IdrqxsAb+7D5JzuqJgO+qizLpvuWP4sXJAW8Bhp1RDN+e/HmYDzshagvQCQMuwy+jrsPFx7Iuwh
	+pLaO+xEZzo93tUBLN5ddXKZhahsopfDiDlChmtOmcz8vnbeqo8smdgBZzqzbsO5r+AFWTKcRTb
	VNl+WGLupxO4SBu3tFn+Lsw==
X-Google-Smtp-Source: AGHT+IEhyNkA8VJM9/cJc7DMu/0IOaUkfY0AVt3v1S+4Tfr+/lPZznmy4RVgI8KquchWx9x3Q2hFNQ==
X-Received: by 2002:a17:906:3384:b0:ad5:1bf5:491d with SMTP id a640c23a62f3a-ad51bf553c2mr147419266b.59.1747318600018;
        Thu, 15 May 2025 07:16:40 -0700 (PDT)
Received: from hex.my.domain (83.11.178.15.ipv4.supernova.orange.pl. [83.11.178.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8535sm1110143966b.8.2025.05.15.07.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:16:39 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 15 May 2025 16:16:31 +0200
Subject: [PATCH v9 4/8] mfd: bcm590xx: Add PMU ID/revision parsing function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-bcm59054-v9-4-14ba0ea2ea5b@gmail.com>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
In-Reply-To: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747318592; l=5066;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=7r2n9E5maekIC6E/9ReFUMYNXP68DM7OrhQ/lKISE6k=;
 b=C9WPeMJxWx8zoGh32NInJgnukZPwWI+VD16PmrEOepg024tBcuUQMSbekkWl5t1vq4tMF7wFb
 am5HXBF+5R2BGvtJtajlLU6Gkq4Y115SLRB4ozvR1Ceh84fk7YM1c5h
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_071642_038070_C99FFEFE 
X-CRM114-Status: GOOD (  23.76  )
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

The BCM590xx PMUs have two I2C registers for reading the PMU ID
and revision. The revision is useful for subdevice drivers, since
different revisions may have slight differences in behavior (for
example - BCM59054 has different regulator configurations for
revision A0 and A1).

Check the PMU ID register and make sure it matches the DT compatible.
Fetch the digital and analog revision from the PMUREV register
so that it can be used in subdevice drivers.

Also add some known revision values to bcm590xx.h, for convenience
when writing subdevice drivers.

Reviewed-by: Stanislav Jakubek <stano.jakubek@gmail.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v9:
- Put params to dev_dbg print on one line

Changes in v8:
- Change PMU ID print from dev_info to dev_dbg
- Unwrap some lines and let them go up to 100 chars
- Drop comment above bcm590xx_parse_version (keep the comments inside
  the function, they make it a bit more clear what's happening since
  it's doing two separate things)

Changes in v7:
- Return -ENODEV on PMU ID mismatch
- Drop "Check your DT compatible" from ID mismatch error message

Changes in v6:
- Adapt to PMUID being passed as device type value
- Rename rev_dig and rev_ana to rev_digital and rev_analog
- Rewrite commit message

Changes in v5:
- Add REG_ prefix to register offset constant names

Changes in v4:
- Added this commit
---
 drivers/mfd/bcm590xx.c       | 54 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/bcm590xx.h | 14 ++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
index 4620eed0066fbf1dd691a2e392e967747b4d125b..5a8456bbd63f65b9260f05ef6546c026bf822bae 100644
--- a/drivers/mfd/bcm590xx.c
+++ b/drivers/mfd/bcm590xx.c
@@ -17,6 +17,15 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
+/* Under primary I2C address: */
+#define BCM590XX_REG_PMUID		0x1e
+
+#define BCM590XX_REG_PMUREV		0x1f
+#define BCM590XX_PMUREV_DIG_MASK	0xF
+#define BCM590XX_PMUREV_DIG_SHIFT	0
+#define BCM590XX_PMUREV_ANA_MASK	0xF0
+#define BCM590XX_PMUREV_ANA_SHIFT	4
+
 static const struct mfd_cell bcm590xx_devs[] = {
 	{
 		.name = "bcm590xx-vregs",
@@ -37,6 +46,47 @@ static const struct regmap_config bcm590xx_regmap_config_sec = {
 	.cache_type	= REGCACHE_MAPLE,
 };
 
+/* Map PMU ID value to model name string */
+static const char * const bcm590xx_names[] = {
+	[BCM590XX_PMUID_BCM59054] = "BCM59054",
+	[BCM590XX_PMUID_BCM59056] = "BCM59056",
+};
+
+static int bcm590xx_parse_version(struct bcm590xx *bcm590xx)
+{
+	unsigned int id, rev;
+	int ret;
+
+	/* Get PMU ID and verify that it matches compatible */
+	ret = regmap_read(bcm590xx->regmap_pri, BCM590XX_REG_PMUID, &id);
+	if (ret) {
+		dev_err(bcm590xx->dev, "failed to read PMU ID: %d\n", ret);
+		return ret;
+	}
+
+	if (id != bcm590xx->pmu_id) {
+		dev_err(bcm590xx->dev, "Incorrect ID for %s: expected %x, got %x.\n",
+			bcm590xx_names[bcm590xx->pmu_id], bcm590xx->pmu_id, id);
+		return -ENODEV;
+	}
+
+	/* Get PMU revision and store it in the info struct */
+	ret = regmap_read(bcm590xx->regmap_pri, BCM590XX_REG_PMUREV, &rev);
+	if (ret) {
+		dev_err(bcm590xx->dev, "failed to read PMU revision: %d\n", ret);
+		return ret;
+	}
+
+	bcm590xx->rev_digital = (rev & BCM590XX_PMUREV_DIG_MASK) >> BCM590XX_PMUREV_DIG_SHIFT;
+
+	bcm590xx->rev_analog = (rev & BCM590XX_PMUREV_ANA_MASK) >> BCM590XX_PMUREV_ANA_SHIFT;
+
+	dev_dbg(bcm590xx->dev, "PMU ID 0x%x (%s), revision: digital %d, analog %d",
+		 id, bcm590xx_names[id], bcm590xx->rev_digital, bcm590xx->rev_analog);
+
+	return 0;
+}
+
 static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 {
 	struct bcm590xx *bcm590xx;
@@ -78,6 +128,10 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 		goto err;
 	}
 
+	ret = bcm590xx_parse_version(bcm590xx);
+	if (ret)
+		goto err;
+
 	ret = devm_mfd_add_devices(&i2c_pri->dev, -1, bcm590xx_devs,
 				   ARRAY_SIZE(bcm590xx_devs), NULL, 0, NULL);
 	if (ret < 0) {
diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
index 8d146e3b102a7dbce6f4dbab9f8ae5a9c4e68c0e..fbc458e94bef923ca1b69afe2cac944adf6fedf8 100644
--- a/include/linux/mfd/bcm590xx.h
+++ b/include/linux/mfd/bcm590xx.h
@@ -17,6 +17,16 @@
 #define BCM590XX_PMUID_BCM59054		0x54
 #define BCM590XX_PMUID_BCM59056		0x56
 
+/* Known chip revision IDs */
+#define BCM59054_REV_DIGITAL_A1		1
+#define BCM59054_REV_ANALOG_A1		2
+
+#define BCM59056_REV_DIGITAL_A0		1
+#define BCM59056_REV_ANALOG_A0		1
+
+#define BCM59056_REV_DIGITAL_B0		2
+#define BCM59056_REV_ANALOG_B0		2
+
 /* max register address */
 #define BCM590XX_MAX_REGISTER_PRI	0xe7
 #define BCM590XX_MAX_REGISTER_SEC	0xf0
@@ -30,6 +40,10 @@ struct bcm590xx {
 
 	/* PMU ID value; also used as device type */
 	u8 pmu_id;
+
+	/* Chip revision, read from PMUREV reg */
+	u8 rev_digital;
+	u8 rev_analog;
 };
 
 #endif /*  __LINUX_MFD_BCM590XX_H */

-- 
2.49.0


