Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A72CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 18:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UsS4dqSrxqQyi+VfVrN7/Fkk7cMDG+DRbrc2q63ns0c=; b=JcIAxTSs0deJYwQ74oKBy8aja/
	OjICTI1HFXhEw3Ry6Ov43EsOru+oqMqOeQJIUUj1+j9s/hiqZIuE0Gn3qJ0+qAbNIMoAw32qlTMfU
	HzTgwuKDq4wIY5jzcyLUfoiBhpbfqkJw8dLbY8A9s/MAe6ZskThQRKvmWzUAh5+96HznSfsFnEMaD
	c1OZO5RKS5lPPLtR3VN1fuwn2nXBXE1Jz8zftI0SveQL4vddyG8YZrzgofW+1rfNrTmOOP+R+Bvvy
	rAJzcwQHvVVSLAeuPF6WLneU7J/4m5eepQ98magxcmXQSIRThJ6ianFrIySWexUU5W1k4WwrhQSYG
	qYbMRt/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY6jo-0000000BPZi-3DhN;
	Fri, 12 Jun 2026 18:36:16 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY6jl-0000000BPZG-0Q94
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 18:36:15 +0000
Received: by chaosmail.tech (Postfix) id D91181C962C;
	Fri, 12 Jun 2026 18:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1781289367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UsS4dqSrxqQyi+VfVrN7/Fkk7cMDG+DRbrc2q63ns0c=;
	b=cLzecYpO3379MUQW5o4pE5ay4aiiwjREr51eLEUYK5B9Fjqj/B8pT253oF/WYXImOw608/
	c/2u9eUo3N4l4n7ubKhjj2JaAuoVXFEOdtfo6lskWibWlFFuTB1Lu3K4LbgrTa1aWEbD/G
	1RjTTtWduTKCFzYnhIBgh7oX8e0uaNk=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Fri, 12 Jun 2026 20:36:03 +0200
Subject: [PATCH v2] power: supply: macsmc: Support macOS 27 SMC firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-gate-power-v2-1-de76cb9bb7ef@chaosmail.tech>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OQQ7CIBREr9L8tRhgAY0r72G6QPgt32hpAFHT9
 O5C3bp8ycybWSFhJExw6laIWChRmCvIQwfWm3lCRq4ySC4VV0KwyWRkS3hhZHZ0WipnudMj1MI
 ScaT3LrsMP07P6w1tboaW8JRyiJ99rYiW+ysuggnWGyW1FLxXVp/rl5Aehu7HjNbDsG3bF3Ss9
 4O7AAAA
X-Change-ID: 20260611-gate-power-cfd726dc0d7f
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sebastian Reichel <sre@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781289366; l=4184;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=4A/C+EOHO465w2u8xamdqNmkNqrHgUkGdvhtrLwE2lg=;
 b=zoMPXpuIXjYSJqYFvYM9W4fKfd3tt2rqG5nEEW941D4Q6fM6tY3egLexCairjGf7a9qLa561Q
 Av/sJno8GlRDap+GJsoD0s/1O+VMCwdXvjt3giaYCF88YDj7S4MQbQl
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_113613_639471_845DD9B3 
X-CRM114-Status: GOOD (  17.46  )
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

The SMC firmware included in macOS 27 changed the size of BCF0 key from
4 to 1 bytes. This key is used for indicating that battery state is
critically low.

Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v2:
- Addressing review feedback
- Link to v1: https://patch.msgid.link/20260611-gate-power-v1-1-8a62721086c7@chaosmail.tech
---
 drivers/power/supply/macsmc-power.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/power/supply/macsmc-power.c b/drivers/power/supply/macsmc-power.c
index 33ca07460f3a..747315e372bc 100644
--- a/drivers/power/supply/macsmc-power.c
+++ b/drivers/power/supply/macsmc-power.c
@@ -86,6 +86,7 @@ struct macsmc_power {
 	bool has_ch0i; /* Force discharge (Older firmware) */
 	bool has_ch0c; /* Inhibit charge (Older firmware) */
 	bool has_chte; /* Inhibit charge (Modern firmware) */
+	bool bcf0_1byte; /* Battery critical key is 1 byte (Modern firmware) */
 
 	u8 num_cells;
 	int nominal_voltage_mv;
@@ -273,6 +274,19 @@ static int macsmc_battery_get_date(const char *s, int *out)
 	return 0;
 }
 
+static int macsmc_battery_read_bcf0(struct macsmc_power *power, u32 *val)
+{
+	u8 tval = 0;
+	int ret;
+
+	if (!power->bcf0_1byte)
+		return apple_smc_read_u32(power->smc, SMC_KEY(BCF0), val);
+
+	ret = apple_smc_read_u8(power->smc, SMC_KEY(BCF0), &tval);
+	*val = tval;
+	return ret;
+}
+
 static int macsmc_battery_get_capacity_level(struct macsmc_power *power)
 {
 	bool flag;
@@ -280,7 +294,7 @@ static int macsmc_battery_get_capacity_level(struct macsmc_power *power)
 	int ret;
 
 	/* Check for emergency shutdown condition */
-	if (apple_smc_read_u32(power->smc, SMC_KEY(BCF0), &val) >= 0 && val)
+	if (macsmc_battery_read_bcf0(power, &val) >= 0 && val)
 		return POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
 
 	/* Check AC status for whether we could boot in this state */
@@ -577,7 +591,7 @@ static void macsmc_power_critical_work(struct work_struct *wrk)
 	 * Check if SMC flagged the battery as empty.
 	 * We trigger a graceful shutdown to let the OS save data.
 	 */
-	if (apple_smc_read_u32(power->smc, SMC_KEY(BCF0), &bcf0) == 0 && bcf0 != 0) {
+	if (macsmc_battery_read_bcf0(power, &bcf0) == 0 && bcf0 != 0) {
 		power->orderly_shutdown_triggered = true;
 		dev_crit(power->dev, "Battery critical (empty flag set). Triggering orderly shutdown.\n");
 		orderly_poweroff(true);
@@ -616,6 +630,7 @@ static int macsmc_power_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
 	struct power_supply_config psy_cfg = {};
+	struct apple_smc_key_info info;
 	struct macsmc_power *power;
 	bool has_battery = false;
 	bool has_ac_adapter = false;
@@ -714,6 +729,20 @@ static int macsmc_power_probe(struct platform_device *pdev)
 		if (apple_smc_key_exists(smc, SMC_KEY(CH0I)))
 			power->has_ch0i = true;
 
+		ret = apple_smc_get_key_info(power->smc, SMC_KEY(BCF0), &info);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to determine BCF0 key size\n");
+			return ret;
+		}
+		if (info.size == 1)
+			power->bcf0_1byte = true;
+		else if (info.size == 4)
+			power->bcf0_1byte = false;
+		else {
+			dev_err(&pdev->dev, "Unexpected BCF0 key size %d\n", info.size);
+			return -EIO;
+		}
+
 		/* Reset "Optimised Battery Charging" flags to default state */
 		if (power->has_chte)
 			apple_smc_write_u32(smc, SMC_KEY(CHTE), 0);
@@ -766,7 +795,7 @@ static int macsmc_power_probe(struct platform_device *pdev)
 		power->nominal_voltage_mv = MACSMC_NOMINAL_CELL_VOLTAGE_MV * power->num_cells;
 
 		/* Enable critical shutdown notifications by reading status once */
-		apple_smc_read_u32(power->smc, SMC_KEY(BCF0), &val32);
+		macsmc_battery_read_bcf0(power, &val32);
 
 		psy_cfg.drv_data = power;
 		power->batt = devm_power_supply_register(dev, &power->batt_desc, &psy_cfg);

---
base-commit: 9716c086c8e8b141d35aa61f2e96a2e83de212a7
change-id: 20260611-gate-power-cfd726dc0d7f

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


