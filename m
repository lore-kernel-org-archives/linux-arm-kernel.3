Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E4CC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cD6ImneTbZLgrwokJknYjihekSDmHnvYNrVpdSfEU20=; b=KQczJiFjuNZ43rKdcWIEN7WhtI
	SKigPGpdF48ONg/fd02y4daI+W62WSHY8FfSsszymM8wQVrXWImw7tO4eh1BY7BfWeTP6mTaptLoz
	e2ZdwqhvtzMVb8+atf422Ea99ip3lARA0Ve0EuJhkomIzKtUrVvuq/rRlLKtlFvSQZAX29nz6KnmO
	TZhXEjSIqYRNO4gBUhVwFeKYTQ0DhwEvv2PiS8h2G4oz/cLLKmI8zhbqWPhEu1ZTmomfwlx/iBqBv
	whwuu8XgY/Nh08ct+f4MySRK3aocJn9qiZtViU3i3W62vQ0d1aLd+5Dhvw0jg/jpo92Jr55KjpUhi
	FlLP+MAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1ip-0000000Bxvc-0ALn;
	Wed, 30 Apr 2025 07:19:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1XU-0000000BwTY-0d6b
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 07:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cD6ImneTbZLgrwokJknYjihekSDmHnvYNrVpdSfEU20=; b=V1Vm6LRMH98ZjC7o1jBs8tyRWN
	lzfv7j/yGa3stzcPjwuFDUwhHm16wdCTw0P95N+LpoPo9/qWQoggVnhCMU3vp55KiFnQdkc4xXAWI
	M1LkB4LYZXLHJg3yXOJMoT1eByoEmCVhS8Jf3Bdo7R5LZtzFaUibFaIkufNkfYZs3fhS0iAMQvk1F
	fFC0xnFMINxU6GydfAlAtFX1crg8hia/frWul53IaBG+AomuZANrQsDGbcuWjfpg4iJa665J/rn4K
	dEXcXs6dd/xF9w13EVp88UWTmT9vrmmp0BekWfZMLFzMXyjmXonpsIIyDYFz29vLc4N38OQr25pwq
	8u7wQGUw==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA1XR-0000000DiOo-0JfZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:07:26 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5f62d3ed994so12385977a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 00:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996842; x=1746601642; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cD6ImneTbZLgrwokJknYjihekSDmHnvYNrVpdSfEU20=;
        b=TUtnkoL9srjt2Tx7y6hWhq2wdE3cMF/D7sPmtcFHnO8dpOleWmkr00WYDLQoTMWDOz
         tvCKsd0rfeO3GZ+qMJbsLNDzFlRMVyeSzRSppFIl8jyxd3rKDCkijJ0w5eT24L0hWMUM
         oRxV0KnoxBBo5XtJNwOc/Mk8WpSPum5cZj0KJ2pebT2v+8xtxXjbAemwoBZZZR404LyE
         1yZvG+Rt/Ye2z2cXzjfXdTFmjSR2jznFbgku4ze1DZw/+Acg9kinRkAC9l+GqA15uWCP
         euwLZpU91AkVGMfsa68N4eg4zvwvCYNJqRL9lTD/xG808ociWt78LNwvq3Pq4toUwse5
         9Fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996842; x=1746601642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cD6ImneTbZLgrwokJknYjihekSDmHnvYNrVpdSfEU20=;
        b=d2R1LeURi7AbIJaFf8eo5bFIrSgdwp7+pn2paVQ80ERzLLtJFpgks1kUK8xM2i4vJJ
         asCAnwM3nX2eqcgFji4U5dpZXuHWrgIEb2/wrOfsWjhc8809wCgrT/4RxE3Xfx3LW9WX
         78vCKXL1TFNpm5wDO1tFgsO5ELTjpuYAilIe7G2RjOxk1dPCOkPkDdY6+08xh7Q3aMVB
         6U/zjAhSN28eRWXSWvdifOfPopWcDbzemx1rv54zHtSB7FXJhW72dURBLIXzXP4qoHun
         cAACpZfi6NJmFCspSq+c57OAEXQRPBMP4kCstrT2uP/l3PvotoopC8Odlv424VY1T2rf
         N7Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUuAWHJOSnrDNFUL4VEqXVhIc6BuLGb2tWDfuivDZDOL5mhpO1HYLhdJsSK6UXa+3MvKvtgZowXB0xGOLm9hAoL@lists.infradead.org
X-Gm-Message-State: AOJu0YyRjdKK5P8AlkxdJTRFNmaDPSMEy7UAwIgfWB5mTSDFijo89HfM
	6QDUqIC9BRRF6HZqQrfiyyzGhxKITFiKqXME0OV+ha5vCS5dKS5T
X-Gm-Gg: ASbGncvDjF9YVP24v0CbUlxtDLMRM45rpPvCbPxAebTYJaZ6Fj2D8yJNbRctRUx3umh
	FybyBDEoDHduFlvbXPDduX8G1XReM6yVUwphJI/DlPzTsut/Xt/Viog7vXaIQ1ABZyLpNQlPxmQ
	pybQBG0JRAuR0yUL4LU+6mkTJMQbGJVygF4PzmWILBeT1St/uhNzUf9J041ukGvawgaVL7w9JNI
	M7scacQhJeX04PsAsInjf8jyEnH8oItjbP8eMgrPHGn1aPVJS13c4oynxkFrgYNJEcp5z6eM7YG
	rNudLtFXZm1t/ESoEuEPkhyecgxiNymIay0ZM3wnvjjS1TYRwuY26BaqFwQkjhFEdnNUwmfDFMr
	UlyPj4k7hO9I=
X-Google-Smtp-Source: AGHT+IGTmonP8lEQxPUe4+oqb7+h22XT+VgaurBIKax7fSsbyEcBfqFkDB+r6vn3YQ8nh6mF4wMIGQ==
X-Received: by 2002:a05:6402:3908:b0:5de:dfd0:9d22 with SMTP id 4fb4d7f45d1cf-5f89be215b0mr1696983a12.22.1745996842190;
        Wed, 30 Apr 2025 00:07:22 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fec3csm8334314a12.19.2025.04.30.00.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:07:21 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 09:07:09 +0200
Subject: [PATCH v8 5/9] mfd: bcm590xx: Add PMU ID/revision parsing function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-bcm59054-v8-5-e4cf638169a4@gmail.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
In-Reply-To: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745996831; l=4951;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=oshNtINoRsSFDWTdpPPGeVt4iGXHtOoyizgpkqWGffU=;
 b=NDvp2UQqXb+hpcsJM/1xalrnDkt5HfT8naRR1sH9LrdV5bfruYkKVT+pgO/qdI2Fp9jnpAiJw
 KUHZsQj+6vyBkR2lKABbq+NGQpETqiEjFKp5iHU27TFNrXkBH+6wVl4
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_080725_374290_B8063608 
X-CRM114-Status: GOOD (  23.53  )
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
 drivers/mfd/bcm590xx.c       | 55 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/bcm590xx.h | 14 +++++++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
index 4620eed0066fbf1dd691a2e392e967747b4d125b..12d0db4237e79fcfcb2af4a0d93961b6239a3863 100644
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
@@ -37,6 +46,48 @@ static const struct regmap_config bcm590xx_regmap_config_sec = {
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
+		 id, bcm590xx_names[id],
+		 bcm590xx->rev_digital, bcm590xx->rev_analog);
+
+	return 0;
+}
+
 static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 {
 	struct bcm590xx *bcm590xx;
@@ -78,6 +129,10 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
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


