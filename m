Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA90DC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jL9fSfmC2gbi7TmBso7gC929m7SW/ZuTWklgZizzx0g=; b=JDVXkxKn0z+4SKizFGLSe6BMcT
	KK7inxkjxVvBEzEBiddLT3VD/L7CsdtIMRXHsF0dlIrHytBYT99iuU7oZ7bICnSafcpatCJzkGqCk
	BDr0j7UX1MmiLjyEp4DG+1IquDVk1W2pi4nJAVrRVp3ywseHN+SD0CDZ3T5Veq1VOwcQ20XUHFWhe
	xSHaBk4rVuQJBBe6LXYpmVGwcKZYK0x2ELq/9PUUURKJcCUfaIkqF5JFNJIhFEE1kU7rYr8R7avBe
	CDUuMhZBiEq7XomXnUlBcHbsCilnDm0TGmP6lpcppsnc2gf8KLEKGjZ527WfpzR7kVZMsEE4IQg3w
	k2uTdb2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLqR-00000003IBk-0lZ0;
	Tue, 04 Mar 2025 06:33:35 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLeE-00000003Ewv-22uB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:20:59 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e50de0b5easo3978848a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 22:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741069257; x=1741674057; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jL9fSfmC2gbi7TmBso7gC929m7SW/ZuTWklgZizzx0g=;
        b=dnp4nrGEu8HWlZhBN5yVsjrZzYBZZG8GCLmwzumu7Yanbj5uxmqboiY2YXXRePxyWa
         Z9Unc0YtNWDnoMXIYqFrenz58829e02WR/W9Z4ZKPhlcgvJBxnpoqCHoBllVyI2v7nVk
         CX3rOc+zjAkRkM6nUo3dwrto3wbINMfMHkPtpqpMqAqXZfw6AkM89wuz8rNIPTJ6npqu
         djklNYksYSEmMaO59qp5DiyS9fYHnu73YQa0nQ61YyMFGk5te5H5oH9Ox6eS71wW4XgC
         FOjcqkDLtdV6bFYJUZZLuXKqPTYTV4R9Rh+TVt+Rf/yNzleoxKrPUiNAAZ/ponPJPp+L
         E18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741069257; x=1741674057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jL9fSfmC2gbi7TmBso7gC929m7SW/ZuTWklgZizzx0g=;
        b=mC6IyU3zlrpQtG1qHZQg0mEHduCrgw1K23McFsblR3QAbRZURF75CjB/CLsG0Qf6GT
         ifjZXN8nCo2zVqZgATa7rlr4wYTGR3C/3+LlvpnP2wM4wxzfq3qTQXouz8cOSIwipfQs
         4OlAxhlBriDogRdhrezVV/XQwCQVnkg7l580RSzgUcxBuVC068sLRbX72Uwuk5TCzhgc
         2lGCmKhLFmdo+HIE6IVTcE8r1sHp946bj6DkOx1s8EoHHQ7lLV2e41L5oKuMQy8tk7i/
         cKeSrysdB933LBX7IYUVggn8ALI8DZrZABNz4nWx6NsasFKSgCExvMOIQPSGMovtx1Ve
         8ZQA==
X-Forwarded-Encrypted: i=1; AJvYcCX16lAqc+9JwLPUF5bQxPKO1rGmhp7raWEIL5K8P/psaslyYpBNeB9v4w5+MZ/YjMyYVy8BOJuPTggBV8hh71DB@lists.infradead.org
X-Gm-Message-State: AOJu0YzYlvHycuDVkT2W6dFChrOsBb7PSB831Ihf0LHeI5TPAeyGCdVb
	hvwAZUnkq+AkXjiMjGnPr1G1UI6EDJhol3eE4l7ZZoFRZKT5YDno
X-Gm-Gg: ASbGncuq0BTh79Gk0Voy9p/MF0VfaV5/bDTYXZ08mJ23XV31Lq3x930DZ5EEKptru1V
	LUAOOAz8cnTObsd/dSBBAHuQ7hRYX0FrTZKYMmk9tHmtMg5hVM64B2BXpy8C6wQd7fLBJomRZ1V
	Xavn32uKYfTtLbQzeSm6Y4re0/2dDzOqR9oGUu852al2vNJs6oLs+q/InQsJ5eTIeEhRS/TcSlx
	0efGtRmj3FzdtoSQZOTgzjMURrm9gJO1YIa66sAlcalEduPisRdcOqcA28kV8CX6nV9+PdTjrZJ
	Eghtcg3Fnmu4/1T+Gaxk0iw8O2FkR+/50x/GWxl7/ygb3QPhDPpQ7iTNjk39ysfcQQOPBXRNJIq
	SiadOaeioCRKUyr0=
X-Google-Smtp-Source: AGHT+IGr724KnADcpi2c0dEd0U5JQgIx/eSdo96OsezNvU5yhQMIVFjmhqBBbY3PVbG19j56JbNieQ==
X-Received: by 2002:a05:6402:40c3:b0:5de:a6a8:5ecc with SMTP id 4fb4d7f45d1cf-5e4d6ad3ac5mr14666247a12.5.1741069256942;
        Mon, 03 Mar 2025 22:20:56 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a663fsm7609036a12.68.2025.03.03.22.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 22:20:56 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Mar 2025 07:20:37 +0100
Subject: [PATCH v6 06/10] mfd: bcm590xx: Add PMU ID/revision parsing
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-bcm59054-v6-6-ae8302358443@gmail.com>
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
In-Reply-To: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741069240; l=4721;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=u2OGhrqZxmDfJ/Q5M7YBVcOptPGc01YX0lvDGgoCLbY=;
 b=nry7wpU4lE1lnu3TQE5uHgkm6KR75IOT9KmCfV6SIJvym1wPCX7c5qmGhVp+bHI2OrXfxc7aj
 ROV991riQRfD8yXs89HXKcxvU5njEY44Fscp7CBVbKxP/odQLHf/adk
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_222058_534753_4F14FB82 
X-CRM114-Status: GOOD (  24.33  )
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

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Adapt to PMUID being passed as device type value
- Rename rev_dig and rev_ana to rev_digital and rev_analog
- Rewrite commit message

Changes in v5:
- Add REG_ prefix to register offset constant names

Changes in v4:
- Added this commit
---
 drivers/mfd/bcm590xx.c       | 63 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/bcm590xx.h | 14 ++++++++++
 2 files changed, 77 insertions(+)

diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
index 4620eed0066fbf1dd691a2e392e967747b4d125b..74dc4ae5ecd5db7fadc56918f63110c1265d4a76 100644
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
@@ -37,6 +46,56 @@ static const struct regmap_config bcm590xx_regmap_config_sec = {
 	.cache_type	= REGCACHE_MAPLE,
 };
 
+/* Map PMU ID value to model name string */
+static const char * const bcm590xx_names[] = {
+	[BCM590XX_PMUID_BCM59054] = "BCM59054",
+	[BCM590XX_PMUID_BCM59056] = "BCM59056",
+};
+
+/*
+ * Parse the version from version registers and make sure it matches
+ * the device type passed to the compatible.
+ */
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
+		dev_err(bcm590xx->dev,
+			"Incorrect ID for %s: expected %x, got %x. Check your DT compatible.\n",
+			bcm590xx_names[bcm590xx->pmu_id], bcm590xx->pmu_id, id);
+		return -EINVAL;
+	}
+
+	/* Get PMU revision and store it in the info struct */
+	ret = regmap_read(bcm590xx->regmap_pri, BCM590XX_REG_PMUREV, &rev);
+	if (ret) {
+		dev_err(bcm590xx->dev, "failed to read PMU revision: %d\n",
+			ret);
+		return ret;
+	}
+
+	bcm590xx->rev_digital = (rev & BCM590XX_PMUREV_DIG_MASK)
+				     >> BCM590XX_PMUREV_DIG_SHIFT;
+
+	bcm590xx->rev_analog = (rev & BCM590XX_PMUREV_ANA_MASK)
+				    >> BCM590XX_PMUREV_ANA_SHIFT;
+
+	dev_info(bcm590xx->dev, "PMU ID 0x%x (%s), revision: digital %d, analog %d",
+		 id, bcm590xx_names[id],
+		 bcm590xx->rev_digital, bcm590xx->rev_analog);
+
+	return 0;
+}
+
 static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 {
 	struct bcm590xx *bcm590xx;
@@ -78,6 +137,10 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
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
2.48.1


