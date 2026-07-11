Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4DAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 08:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BqTPpzuvZrixISR9QYSmrDSTNk2cgTef1nAy5K2DnE4=; b=iFFZZLXB5eQy7T/5VoWzqNkGI/
	YFKwnbjPGCIq1yjcXSkrlKgVbuJeTfbp2oqDiYBGt2GYfAnCvHYns/ot/sHXp3WmWtvc7GmjqoGx7
	aHGtz5bxVUfDdpuis2SrXlcg+Z/xh/7Rf+gzddLye4EbiGk/AiAM2zint1XxgloIbjJVEG5J55zoZ
	br9EJAKwjPOJG6D8Evtjy15bUH8pZS8MAg98FLonMdBKcn/77WxWNeC0JnXItM2eKoVrbQ+TPNOZj
	/byZsCiNSYvuIbP+6jNPYwK4IIWNi+etl7GU0yqNCKwlm53YdEWqpllBrQqE7gABSP3Q2FXLCh+fY
	oK6rVEjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wipbC-00000007GYP-2FuY;
	Sun, 12 Jul 2026 08:31:42 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wipb8-00000007GXJ-0wqY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 08:31:40 +0000
Received: by chaosmail.tech (Postfix) id 2256B1C8673;
	Sat, 11 Jul 2026 22:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1783810207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BqTPpzuvZrixISR9QYSmrDSTNk2cgTef1nAy5K2DnE4=;
	b=T3xlR0454W0UcaNa9HsYGVt63N1K7Vvfn2XsjjAWPW9fTA2Bz4vtxrWWCPBArqroirWByc
	w6PDEYFcp4SMFyebriPEtY7G7y7NHwSqmIOWB/onHKNjWjcMVA/39mAbIBlCmID5QTZlbX
	bC72qJ9MPc1pMJlmXyGANLEZeyMinaw=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sun, 12 Jul 2026 00:48:56 +0200
Subject: [PATCH v4] power: supply: macsmc: Support macOS 27 SMC firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-gate-power-v4-1-aa59c6583247@chaosmail.tech>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OOw7CMBAE0Ksg1xjFG+QPFfdAFP6sEyMgyA4BF
 OXu2KEBkXKkfTM7koQxYCK71UgiDiGF7prDdr0ittXXBmlwOROogFecMdroHumte2Ck1jsB3Nn
 KCU8yuEX04TmXHY6fnO7mhLYvDeWiDanv4mteG1i5WyweGGVUag4CWCW5Ffv8S5cuOpw3PdqWl
 PYBvj38eMjeoeDWKGME+kVff3lQP74u+1uQ2qja11L9+Wma3teBhBI7AQAA
X-Change-ID: 20260611-gate-power-cfd726dc0d7f
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sebastian Reichel <sre@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Peisach <jpeisach@ubuntu.com>, stable@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783810207; l=6328;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=9hEttOjxUo4x8VZA0u6Zh8it9IZ1e1B/QRSppPFee94=;
 b=7RHM7NDNYULbELZ142reJuoDQRRO402Ewn+zyEZnHcC7TyyVJz9M7AfU8S7PqkuPAeVuvmB+s
 n9R19EQxBTyC/6f4EFmEQIRIqTJkdvjL0/9ivANdcprnByU9Kcme7hx
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_013138_732973_5CD58F0C 
X-CRM114-Status: GOOD (  18.60  )
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
critically low. In addition, B0RM key has changed endianness.

Reviewed-by: Sven Peter <sven@kernel.org>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Reviewed-by: Janne Grunau <j@jannau.net>
Cc: stable@vger.kernel.org
Fixes: 0ebf821cf6c7 ("power: supply: Add macsmc-power driver for Apple Silicon")
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v4:
- Also fix B0RM endianness
- Link to v3: https://patch.msgid.link/20260629-gate-power-v3-1-8428ab93f389@chaosmail.tech

Changes in v3:
- Minor style fixes
- R-b tags and Cc stable
- Rebase on 7.2
- Link to v2: https://patch.msgid.link/20260612-gate-power-v2-1-de76cb9bb7ef@chaosmail.tech

Changes in v2:
- Addressing review feedback
- Link to v1: https://patch.msgid.link/20260611-gate-power-v1-1-8a62721086c7@chaosmail.tech
---
 drivers/power/supply/macsmc-power.c | 52 +++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/power/supply/macsmc-power.c b/drivers/power/supply/macsmc-power.c
index ced07f71e0a8..ef735f86394e 100644
--- a/drivers/power/supply/macsmc-power.c
+++ b/drivers/power/supply/macsmc-power.c
@@ -86,6 +86,11 @@ struct macsmc_power {
 	bool has_ch0i; /* Force discharge (Older firmware) */
 	bool has_ch0c; /* Inhibit charge (Older firmware) */
 	bool has_chte; /* Inhibit charge (Modern firmware) */
+	/*
+	 * Battery critical key is 1 byte and charge key is little endian
+	 * (Modern firmware)
+	 */
+	bool fw_ge_27;
 
 	u8 num_cells;
 	int nominal_voltage_mv;
@@ -273,6 +278,20 @@ static int macsmc_battery_get_date(const char *s, int *out)
 	return 0;
 }
 
+static int macsmc_battery_read_bcf0(struct macsmc_power *power, u32 *val)
+{
+	u8 tval = 0;
+	int ret;
+
+	if (power->fw_ge_27) {
+		ret = apple_smc_read_u8(power->smc, SMC_KEY(BCF0), &tval);
+		*val = tval;
+		return ret;
+	}
+
+	return apple_smc_read_u32(power->smc, SMC_KEY(BCF0), val);
+}
+
 static int macsmc_battery_get_capacity_level(struct macsmc_power *power)
 {
 	bool flag;
@@ -280,7 +299,7 @@ static int macsmc_battery_get_capacity_level(struct macsmc_power *power)
 	int ret;
 
 	/* Check for emergency shutdown condition */
-	if (apple_smc_read_u32(power->smc, SMC_KEY(BCF0), &val) >= 0 && val)
+	if (macsmc_battery_read_bcf0(power, &val) >= 0 && val)
 		return POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
 
 	/* Check AC status for whether we could boot in this state */
@@ -303,6 +322,12 @@ static int macsmc_battery_get_capacity_level(struct macsmc_power *power)
 		return POWER_SUPPLY_CAPACITY_LEVEL_NORMAL;
 }
 
+static s16 macsmc_swap_b0rm(struct macsmc_power *power, s16 b0rm)
+{
+	/* B0RM was Big Endian, likely pass through from TI gas gauge */
+	return power->fw_ge_27 ? b0rm : (s16)swab16(b0rm);
+}
+
 static int macsmc_battery_get_property(struct power_supply *psy,
 				       enum power_supply_property psp,
 				       union power_supply_propval *val)
@@ -397,8 +422,7 @@ static int macsmc_battery_get_property(struct power_supply *psy,
 		break;
 	case POWER_SUPPLY_PROP_CHARGE_NOW:
 		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0RM), &vu16);
-		/* B0RM is Big Endian, likely pass through from TI gas gauge */
-		val->intval = (s16)swab16(vu16) * 1000;
+		val->intval = macsmc_swap_b0rm(power, vu16) * 1000;
 		break;
 	case POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN:
 		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0DC), &vu16);
@@ -410,8 +434,7 @@ static int macsmc_battery_get_property(struct power_supply *psy,
 		break;
 	case POWER_SUPPLY_PROP_ENERGY_NOW:
 		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0RM), &vu16);
-		/* B0RM is Big Endian, likely pass through from TI gas gauge */
-		val->intval = (s16)swab16(vu16) * power->nominal_voltage_mv;
+		val->intval = macsmc_swap_b0rm(power, vu16) * power->nominal_voltage_mv;
 		break;
 	case POWER_SUPPLY_PROP_TEMP:
 		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0AT), &vu16);
@@ -577,7 +600,7 @@ static void macsmc_power_critical_work(struct work_struct *wrk)
 	 * Check if SMC flagged the battery as empty.
 	 * We trigger a graceful shutdown to let the OS save data.
 	 */
-	if (apple_smc_read_u32(power->smc, SMC_KEY(BCF0), &bcf0) == 0 && bcf0 != 0) {
+	if (macsmc_battery_read_bcf0(power, &bcf0) == 0 && bcf0 != 0) {
 		power->orderly_shutdown_triggered = true;
 		dev_crit(power->dev, "Battery critical (empty flag set). Triggering orderly shutdown.\n");
 		orderly_poweroff(true);
@@ -616,6 +639,7 @@ static int macsmc_power_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
 	struct power_supply_config psy_cfg = {};
+	struct apple_smc_key_info info;
 	struct macsmc_power *power;
 	bool has_battery = false;
 	bool has_ac_adapter = false;
@@ -714,6 +738,20 @@ static int macsmc_power_probe(struct platform_device *pdev)
 		if (apple_smc_key_exists(smc, SMC_KEY(CH0I)))
 			power->has_ch0i = true;
 
+		ret = apple_smc_get_key_info(power->smc, SMC_KEY(BCF0), &info);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to determine BCF0 key size\n");
+			return ret;
+		}
+		if (info.size == 1)
+			power->fw_ge_27 = true;
+		else if (info.size == 4)
+			power->fw_ge_27 = false;
+		else {
+			dev_err(&pdev->dev, "Unexpected BCF0 key size %d\n", info.size);
+			return -EIO;
+		}
+
 		/* Reset "Optimised Battery Charging" flags to default state */
 		if (power->has_chte)
 			apple_smc_write_u32(smc, SMC_KEY(CHTE), 0);
@@ -766,7 +804,7 @@ static int macsmc_power_probe(struct platform_device *pdev)
 		power->nominal_voltage_mv = MACSMC_NOMINAL_CELL_VOLTAGE_MV * power->num_cells;
 
 		/* Enable critical shutdown notifications by reading status once */
-		apple_smc_read_u32(power->smc, SMC_KEY(BCF0), &val32);
+		macsmc_battery_read_bcf0(power, &val32);
 
 		psy_cfg.drv_data = power;
 		power->batt = devm_power_supply_register(dev, &power->batt_desc, &psy_cfg);

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260611-gate-power-cfd726dc0d7f

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


