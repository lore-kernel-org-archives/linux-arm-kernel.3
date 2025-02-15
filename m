Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78730C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSHi7ULc5hxohEMqjG29q4+9VaxsYsZCGB+mI9gBuBk=; b=x05WXiEwN3TPo63lmz9idMRIvR
	nB0KtK3tdGsPrGcyNQ83AKpYTpLANCBja0d9Rf3fu9fuECGB2lsxzbESZpTR+u2GPooWKKYNmc8/E
	L/Ty7c4roWFERPqgyIjOvBqX1Ryp5AMDDGD/aRdF2NjN+otBzzo5UOud0gG8+15TlgOlYxhCPI60x
	kz+wcVNBR8cfRGzpQ/krbnmJIpC2twDBINd+hBYMAOb8sNnAoag8Emf/UyZ7u9FzMFCg9Rm1Siqn/
	tsAVQTr6e0KPSeTihYZdfrtnG1IS8RyGLQaMv6ZveKaZnvGdoFTOjBMksPZwIjnwd7gMPX7LdEsMk
	y/jw92DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEmr-0000000HN2J-1yQZ;
	Sat, 15 Feb 2025 09:48:37 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEeS-0000000HLcS-1jzM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 09:39:57 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-abadccdfe5aso188600466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 01:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739612395; x=1740217195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KSHi7ULc5hxohEMqjG29q4+9VaxsYsZCGB+mI9gBuBk=;
        b=bnnh5MMJ+bbSmIYEZMPLpAugg7eXaSy7SwUqoR3rhzSG/lDCYymFRUa7KDVDioHkPc
         3vYebEQFY0afuXepy36u9RcMaJw0ZGfnt/RoN6Xl8Qlc+QhH6A38hoZxHl29JD+NDM+g
         h9LV5iZa/hhyumO0dZasynPV3oNl3iW2Fzm5cgUs/8dM5wfyZglD6flPbf7NFQlwG2fs
         nS6iGHNFStM7RjC2DMgNThAtPqB0Cq4/IFuWNvruGU29dSSEwu2v9fjg/23b6T+uqQ5q
         WyWweqlyUPwHQMEqZSObcxHCU8C3WIbDEtWJV03yhksCFEhV2H8cGHB9xckhENfhHpVT
         gPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739612395; x=1740217195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSHi7ULc5hxohEMqjG29q4+9VaxsYsZCGB+mI9gBuBk=;
        b=SsnKeyxkulDrJhu/lRgH+Eoarv6G/i8DNkLDCgoBEzcXZsq0kcDQMya8mN3VyoTiNB
         tK+ZR2WlWUlc/lzIAzYLSQ8GtWs/XriqvaCj7VP8+A2e6ktIvCLmvR8gfzcfL3fINq+F
         8skslx0nm/ZfNlH6MjqAAhKbUMHTOKgTESCeBhbd2Kemms9DmX6yq1iQUpwFP269mqxo
         dnu0+eoEuHgJ4G/kuOgvcqPMj1qWKISdRLHm5Me51wXyMJsbBdMKjSghzQOwk+wRYNwv
         SD01QYS7AbQ6RVobq4mP4eQRb6JLElyI/oFQDJfvYbYH0AEWuWqBBSrcancOjDxXWH7Z
         S1vw==
X-Forwarded-Encrypted: i=1; AJvYcCUuekUnb/G4ID03VreB1XSCQnLsWz5UylIJUoP9UQq1d/MhhXhkciPWUS7Hozcq9+fUyD2A2/6bssxJgNLhYulb@lists.infradead.org
X-Gm-Message-State: AOJu0YydpD9qi+Ixd11/GbqTuXViFHTjUa8D44lIBXUFgIB0cYtGxVv0
	5f3oiDESPacJx1RQLX0mJQK/mgd5eSQND3RJjN7roIs0j4F6IQteGY/DGA==
X-Gm-Gg: ASbGncsbILpgQhQGsvzITSVyA7cMjHz6XZkfkp0Xd3xz/G2npiAHrAKVDI6nuSTT2rG
	m/rYAcq54NGyvSEdWAxciGZn4BwhwO+wZpMpUfra+f/HKuDexNmW34L3oFBhp6BIYturJQj/0w1
	gU8LKUfOac9Mjc+5413TuJPtf/MwLZ4+bKVs3j5SwJOW7q0G5Pni58khwB9K9PyikqXWNa3xmzO
	004Qn4KB18iglm2KbLILjKNYllSEC8kWE3CF4Li9KCdevU8gHOhYZ6lsDEISzUpitEZF/j0/yHl
	TMChFZFpFWFs4VaMdC22rfJHCePgepFrH3Z8meT+0aJ1lxtduOB/LpdKZ6TSuA==
X-Google-Smtp-Source: AGHT+IFyrQImPdhkXlUK0i/cJqlYoCjV9CaIt4H7aNflilngOsNxjxgQcObmRoJ4y7oOeBbOZ2j07Q==
X-Received: by 2002:a17:906:31c4:b0:aba:ec4f:fa4 with SMTP id a640c23a62f3a-abb709211d6mr184760766b.12.1739612394478;
        Sat, 15 Feb 2025 01:39:54 -0800 (PST)
Received: from hex.my.domain (83.8.115.239.ipv4.supernova.orange.pl. [83.8.115.239])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb7aecd3d5sm69698966b.148.2025.02.15.01.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 01:39:54 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 15 Feb 2025 10:39:40 +0100
Subject: [PATCH v4 5/9] mfd: bcm590xx: Add PMU ID/revision parsing function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-bcm59054-v4-5-dbfb2d76a855@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739612381; l=4714;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=nlN0yd6P8KVs8h7+hjut7O2QhOwizp6bOkkjTgZWqVw=;
 b=eI1XUZ6UU3sJHiIe+4reovvtp9PCU4kUBpXdOFbfjRTbDlf4dwaNAVSHIPANqcHmVS9JM1Sc9
 Hcq9GfqkhqiC+w7ntxFjoeEhjZSq4/Phktgl4aHVA4JF36mJjIs1Nwa
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_013956_462417_B20F94B1 
X-CRM114-Status: GOOD (  24.39  )
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
different revisions may have slight differences in behavior.

Add a function to parse the data contained in the ID/revision
registers. Use the ID value to verify that the correct compatible is
used; store the revision value as two separate variables, rev_dig
and rev_ana, for later usage.

Also add some known revision values to bcm590xx.h, for convenience
when writing subdevice drivers.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Added this commit
---
 drivers/mfd/bcm590xx.c       | 81 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/bcm590xx.h | 14 ++++++++
 2 files changed, 95 insertions(+)

diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
index 632eb57d0d9e9f20f801fac22eae21b3c46cefd5..094186165efa5a2356a442efdfb4da02ad9be9da 100644
--- a/drivers/mfd/bcm590xx.c
+++ b/drivers/mfd/bcm590xx.c
@@ -17,6 +17,17 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
+/* Under primary I2C address: */
+#define BCM590XX_PMUID			0x1e
+#define BCM590XX_PMUID_BCM59054		0x54
+#define BCM590XX_PMUID_BCM59056		0x56
+
+#define BCM590XX_PMUREV			0x1f
+#define BCM590XX_PMUREV_DIG_MASK	0xF
+#define BCM590XX_PMUREV_DIG_SHIFT	0
+#define BCM590XX_PMUREV_ANA_MASK	0xF0
+#define BCM590XX_PMUREV_ANA_SHIFT	4
+
 static const struct mfd_cell bcm590xx_devs[] = {
 	{
 		.name = "bcm590xx-vregs",
@@ -37,6 +48,72 @@ static const struct regmap_config bcm590xx_regmap_config_sec = {
 	.cache_type	= REGCACHE_MAPLE,
 };
 
+/* Map device_type enum value to model name string */
+static const char * const bcm590xx_names[BCM590XX_TYPE_MAX] = {
+	[BCM59054_TYPE] = "BCM59054",
+	[BCM59056_TYPE] = "BCM59056",
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
+	ret = regmap_read(bcm590xx->regmap_pri, BCM590XX_PMUID, &id);
+	if (ret) {
+		dev_err(bcm590xx->dev, "failed to read PMU ID: %d\n", ret);
+		return ret;
+	}
+
+	switch (bcm590xx->dev_type) {
+	case BCM59054_TYPE:
+		if (id != BCM590XX_PMUID_BCM59054) {
+			dev_err(bcm590xx->dev,
+				"Incorrect ID for BCM59054: expected %x, got %x. Check your DT compatible.\n",
+				BCM590XX_PMUID_BCM59054, id);
+			return -EINVAL;
+		}
+		break;
+	case BCM59056_TYPE:
+		if (id != BCM590XX_PMUID_BCM59056) {
+			dev_err(bcm590xx->dev,
+				"Incorrect ID for BCM59056: expected %x, got %x. Check your DT compatible.\n",
+				BCM590XX_PMUID_BCM59056, id);
+			return -EINVAL;
+		}
+		break;
+	default:
+		dev_err(bcm590xx->dev,
+			"Unknown device type, this is a driver bug!\n");
+		return -EINVAL;
+	}
+
+	/* Get PMU revision and store it in the info struct */
+	ret = regmap_read(bcm590xx->regmap_pri, BCM590XX_PMUREV, &rev);
+	if (ret) {
+		dev_err(bcm590xx->dev, "failed to read PMU revision: %d\n",
+			ret);
+		return ret;
+	}
+
+	bcm590xx->rev_dig = (rev & BCM590XX_PMUREV_DIG_MASK)
+				 >> BCM590XX_PMUREV_DIG_SHIFT;
+
+	bcm590xx->rev_ana = (rev & BCM590XX_PMUREV_ANA_MASK)
+				 >> BCM590XX_PMUREV_ANA_SHIFT;
+
+	dev_info(bcm590xx->dev, "PMU ID 0x%x (%s), revision: dig %d ana %d",
+		 id, bcm590xx_names[bcm590xx->dev_type],
+		 bcm590xx->rev_dig, bcm590xx->rev_ana);
+
+	return 0;
+}
+
 static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 {
 	struct bcm590xx *bcm590xx;
@@ -78,6 +155,10 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
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
index 83e62b5a6c45805bc2acc88ccc7119d86f9ac424..ba1cb3716b383d7a2ee396e0595a3b94d3b4ca5e 100644
--- a/include/linux/mfd/bcm590xx.h
+++ b/include/linux/mfd/bcm590xx.h
@@ -32,6 +32,20 @@ struct bcm590xx {
 	struct regmap *regmap_pri;
 	struct regmap *regmap_sec;
 	unsigned int id;
+
+	/* Chip revision, read from PMUREV reg */
+	u8 rev_dig;
+	u8 rev_ana;
 };
 
+/* Known chip revision IDs */
+#define BCM59054_REV_DIG_A1		1
+#define BCM59054_REV_ANA_A1		2
+
+#define BCM59056_REV_DIG_A0		1
+#define BCM59056_REV_ANA_A0		1
+
+#define BCM59056_REV_DIG_B0		2
+#define BCM59056_REV_ANA_B0		2
+
 #endif /*  __LINUX_MFD_BCM590XX_H */

-- 
2.48.1


