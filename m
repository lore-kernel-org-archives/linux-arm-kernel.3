Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC7DC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 07:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/V6ZI2OZNRhsiztzQ19rB4uCxJV79LqIsZvYaEKBF/s=; b=FRO4OREUswyA+eV7bOVr463ZxJ
	gO6+P5hB3/SWSD7b7tSW74LTxiDpoUW8Ua5q3X82mzGWFN7Qr3VxasyQcuOTD+EbmA2KzV44PEw0N
	aBGkSWlKes2KxdshrulXaZAxWgEPWsFkvRVtV9Mn8ViON+6aU+6U7kcH9xJcnFlOChMimtJIRF/KH
	ViAv+/OjqQVVWKGA2kQgeaObnbEAiIVroIT6nfM0ntPHX1g/dRke3Ud+Go6Gh5E/DrvQJbCmm1tHN
	SK92JRAEdAnn0kI9ouqyhxviXbcWcIAePfufD1rUiZMg/f8RBOc3koCDHu59VUlOqrJ+r3eRQvzrW
	/r7mOa7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8GN-000000073pY-3vYz;
	Tue, 21 Jan 2025 07:01:27 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8CW-000000072eR-3mKv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 06:57:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4YcdLy3R0Pz20pDJ;
	Tue, 21 Jan 2025 14:57:46 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 4B2511A0188;
	Tue, 21 Jan 2025 14:57:21 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Jan 2025 14:57:21 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Jan 2025 14:57:19 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <linux-hwmon@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <arm-scmi@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<oss-drivers@corigine.com>, <linux-rdma@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <linuxarm@huawei.com>,
	<linux@roeck-us.net>, <jdelvare@suse.com>, <kernel@maidavale.org>,
	<pauk.denis@gmail.com>, <james@equiv.tech>, <sudeep.holla@arm.com>,
	<cristian.marussi@arm.com>, <matt@ranostay.sg>, <mchehab@kernel.org>,
	<irusskikh@marvell.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<saeedm@nvidia.com>, <leon@kernel.org>, <tariqt@nvidia.com>,
	<louis.peens@corigine.com>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
	<kabel@kernel.org>, <W_Armin@gmx.de>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <alexandre.belloni@bootlin.com>,
	<krzk@kernel.org>, <jonathan.cameron@huawei.com>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v1 01/21] hwmon: Fix the type of 'config' in struct hwmon_channel_info to u64
Date: Tue, 21 Jan 2025 14:44:59 +0800
Message-ID: <20250121064519.18974-2-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20250121064519.18974-1-lihuisong@huawei.com>
References: <20250121064519.18974-1-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.79.22]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_225729_333488_EBEC0E27 
X-CRM114-Status: GOOD (  12.16  )
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

Currently, the maximum number of hwmon channel attributes is 32 which is
limited by current hwmon core codes. And the power attributes are up to 31.
It's already encountered the issue of not adding attribute name to power
channel attribute.

So fix the type of 'config' in struct hwmon_channel_info to u64 so as to
support more attributes. For this goal, the following points are needed to
be done:
(1) Fix the type of 'config' in hwmon_channel_info structure to u64.
(2) Modify hwmon_num_channel_attrs() with hweight64.
(3) Type of BIT(xxx) in linux/hwmon.h is 'UL', need to modify to BIT_ULL.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/hwmon/hwmon.c |   4 +-
 include/linux/hwmon.h | 300 +++++++++++++++++++++---------------------
 2 files changed, 152 insertions(+), 152 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 9703d60e9bbf..1fe8fa12cc60 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -790,7 +790,7 @@ static int hwmon_num_channel_attrs(const struct hwmon_channel_info *info)
 	int i, n;
 
 	for (i = n = 0; info->config[i]; i++)
-		n += hweight32(info->config[i]);
+		n += hweight64(info->config[i]);
 
 	return n;
 }
@@ -811,7 +811,7 @@ static int hwmon_genattrs(const void *drvdata,
 	template_size = __templates_size[info->type];
 
 	for (i = 0; info->config[i]; i++) {
-		u32 attr_mask = info->config[i];
+		u64 attr_mask = info->config[i];
 		u32 attr;
 
 		while (attr_mask) {
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 3a63dff62d03..544266a58d07 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -48,20 +48,20 @@ enum hwmon_chip_attributes {
 	hwmon_chip_pec,
 };
 
-#define HWMON_C_TEMP_RESET_HISTORY	BIT(hwmon_chip_temp_reset_history)
-#define HWMON_C_IN_RESET_HISTORY	BIT(hwmon_chip_in_reset_history)
-#define HWMON_C_CURR_RESET_HISTORY	BIT(hwmon_chip_curr_reset_history)
-#define HWMON_C_POWER_RESET_HISTORY	BIT(hwmon_chip_power_reset_history)
-#define HWMON_C_REGISTER_TZ		BIT(hwmon_chip_register_tz)
-#define HWMON_C_UPDATE_INTERVAL		BIT(hwmon_chip_update_interval)
-#define HWMON_C_ALARMS			BIT(hwmon_chip_alarms)
-#define HWMON_C_SAMPLES			BIT(hwmon_chip_samples)
-#define HWMON_C_CURR_SAMPLES		BIT(hwmon_chip_curr_samples)
-#define HWMON_C_IN_SAMPLES		BIT(hwmon_chip_in_samples)
-#define HWMON_C_POWER_SAMPLES		BIT(hwmon_chip_power_samples)
-#define HWMON_C_TEMP_SAMPLES		BIT(hwmon_chip_temp_samples)
-#define HWMON_C_BEEP_ENABLE		BIT(hwmon_chip_beep_enable)
-#define HWMON_C_PEC			BIT(hwmon_chip_pec)
+#define HWMON_C_TEMP_RESET_HISTORY	BIT_ULL(hwmon_chip_temp_reset_history)
+#define HWMON_C_IN_RESET_HISTORY	BIT_ULL(hwmon_chip_in_reset_history)
+#define HWMON_C_CURR_RESET_HISTORY	BIT_ULL(hwmon_chip_curr_reset_history)
+#define HWMON_C_POWER_RESET_HISTORY	BIT_ULL(hwmon_chip_power_reset_history)
+#define HWMON_C_REGISTER_TZ		BIT_ULL(hwmon_chip_register_tz)
+#define HWMON_C_UPDATE_INTERVAL		BIT_ULL(hwmon_chip_update_interval)
+#define HWMON_C_ALARMS			BIT_ULL(hwmon_chip_alarms)
+#define HWMON_C_SAMPLES			BIT_ULL(hwmon_chip_samples)
+#define HWMON_C_CURR_SAMPLES		BIT_ULL(hwmon_chip_curr_samples)
+#define HWMON_C_IN_SAMPLES		BIT_ULL(hwmon_chip_in_samples)
+#define HWMON_C_POWER_SAMPLES		BIT_ULL(hwmon_chip_power_samples)
+#define HWMON_C_TEMP_SAMPLES		BIT_ULL(hwmon_chip_temp_samples)
+#define HWMON_C_BEEP_ENABLE		BIT_ULL(hwmon_chip_beep_enable)
+#define HWMON_C_PEC			BIT_ULL(hwmon_chip_pec)
 
 enum hwmon_temp_attributes {
 	hwmon_temp_enable,
@@ -94,34 +94,34 @@ enum hwmon_temp_attributes {
 	hwmon_temp_beep,
 };
 
-#define HWMON_T_ENABLE		BIT(hwmon_temp_enable)
-#define HWMON_T_INPUT		BIT(hwmon_temp_input)
-#define HWMON_T_TYPE		BIT(hwmon_temp_type)
-#define HWMON_T_LCRIT		BIT(hwmon_temp_lcrit)
-#define HWMON_T_LCRIT_HYST	BIT(hwmon_temp_lcrit_hyst)
-#define HWMON_T_MIN		BIT(hwmon_temp_min)
-#define HWMON_T_MIN_HYST	BIT(hwmon_temp_min_hyst)
-#define HWMON_T_MAX		BIT(hwmon_temp_max)
-#define HWMON_T_MAX_HYST	BIT(hwmon_temp_max_hyst)
-#define HWMON_T_CRIT		BIT(hwmon_temp_crit)
-#define HWMON_T_CRIT_HYST	BIT(hwmon_temp_crit_hyst)
-#define HWMON_T_EMERGENCY	BIT(hwmon_temp_emergency)
-#define HWMON_T_EMERGENCY_HYST	BIT(hwmon_temp_emergency_hyst)
-#define HWMON_T_ALARM		BIT(hwmon_temp_alarm)
-#define HWMON_T_MIN_ALARM	BIT(hwmon_temp_min_alarm)
-#define HWMON_T_MAX_ALARM	BIT(hwmon_temp_max_alarm)
-#define HWMON_T_CRIT_ALARM	BIT(hwmon_temp_crit_alarm)
-#define HWMON_T_LCRIT_ALARM	BIT(hwmon_temp_lcrit_alarm)
-#define HWMON_T_EMERGENCY_ALARM	BIT(hwmon_temp_emergency_alarm)
-#define HWMON_T_FAULT		BIT(hwmon_temp_fault)
-#define HWMON_T_OFFSET		BIT(hwmon_temp_offset)
-#define HWMON_T_LABEL		BIT(hwmon_temp_label)
-#define HWMON_T_LOWEST		BIT(hwmon_temp_lowest)
-#define HWMON_T_HIGHEST		BIT(hwmon_temp_highest)
-#define HWMON_T_RESET_HISTORY	BIT(hwmon_temp_reset_history)
-#define HWMON_T_RATED_MIN	BIT(hwmon_temp_rated_min)
-#define HWMON_T_RATED_MAX	BIT(hwmon_temp_rated_max)
-#define HWMON_T_BEEP		BIT(hwmon_temp_beep)
+#define HWMON_T_ENABLE		BIT_ULL(hwmon_temp_enable)
+#define HWMON_T_INPUT		BIT_ULL(hwmon_temp_input)
+#define HWMON_T_TYPE		BIT_ULL(hwmon_temp_type)
+#define HWMON_T_LCRIT		BIT_ULL(hwmon_temp_lcrit)
+#define HWMON_T_LCRIT_HYST	BIT_ULL(hwmon_temp_lcrit_hyst)
+#define HWMON_T_MIN		BIT_ULL(hwmon_temp_min)
+#define HWMON_T_MIN_HYST	BIT_ULL(hwmon_temp_min_hyst)
+#define HWMON_T_MAX		BIT_ULL(hwmon_temp_max)
+#define HWMON_T_MAX_HYST	BIT_ULL(hwmon_temp_max_hyst)
+#define HWMON_T_CRIT		BIT_ULL(hwmon_temp_crit)
+#define HWMON_T_CRIT_HYST	BIT_ULL(hwmon_temp_crit_hyst)
+#define HWMON_T_EMERGENCY	BIT_ULL(hwmon_temp_emergency)
+#define HWMON_T_EMERGENCY_HYST	BIT_ULL(hwmon_temp_emergency_hyst)
+#define HWMON_T_ALARM		BIT_ULL(hwmon_temp_alarm)
+#define HWMON_T_MIN_ALARM	BIT_ULL(hwmon_temp_min_alarm)
+#define HWMON_T_MAX_ALARM	BIT_ULL(hwmon_temp_max_alarm)
+#define HWMON_T_CRIT_ALARM	BIT_ULL(hwmon_temp_crit_alarm)
+#define HWMON_T_LCRIT_ALARM	BIT_ULL(hwmon_temp_lcrit_alarm)
+#define HWMON_T_EMERGENCY_ALARM	BIT_ULL(hwmon_temp_emergency_alarm)
+#define HWMON_T_FAULT		BIT_ULL(hwmon_temp_fault)
+#define HWMON_T_OFFSET		BIT_ULL(hwmon_temp_offset)
+#define HWMON_T_LABEL		BIT_ULL(hwmon_temp_label)
+#define HWMON_T_LOWEST		BIT_ULL(hwmon_temp_lowest)
+#define HWMON_T_HIGHEST		BIT_ULL(hwmon_temp_highest)
+#define HWMON_T_RESET_HISTORY	BIT_ULL(hwmon_temp_reset_history)
+#define HWMON_T_RATED_MIN	BIT_ULL(hwmon_temp_rated_min)
+#define HWMON_T_RATED_MAX	BIT_ULL(hwmon_temp_rated_max)
+#define HWMON_T_BEEP		BIT_ULL(hwmon_temp_beep)
 
 enum hwmon_in_attributes {
 	hwmon_in_enable,
@@ -146,26 +146,26 @@ enum hwmon_in_attributes {
 	hwmon_in_fault,
 };
 
-#define HWMON_I_ENABLE		BIT(hwmon_in_enable)
-#define HWMON_I_INPUT		BIT(hwmon_in_input)
-#define HWMON_I_MIN		BIT(hwmon_in_min)
-#define HWMON_I_MAX		BIT(hwmon_in_max)
-#define HWMON_I_LCRIT		BIT(hwmon_in_lcrit)
-#define HWMON_I_CRIT		BIT(hwmon_in_crit)
-#define HWMON_I_AVERAGE		BIT(hwmon_in_average)
-#define HWMON_I_LOWEST		BIT(hwmon_in_lowest)
-#define HWMON_I_HIGHEST		BIT(hwmon_in_highest)
-#define HWMON_I_RESET_HISTORY	BIT(hwmon_in_reset_history)
-#define HWMON_I_LABEL		BIT(hwmon_in_label)
-#define HWMON_I_ALARM		BIT(hwmon_in_alarm)
-#define HWMON_I_MIN_ALARM	BIT(hwmon_in_min_alarm)
-#define HWMON_I_MAX_ALARM	BIT(hwmon_in_max_alarm)
-#define HWMON_I_LCRIT_ALARM	BIT(hwmon_in_lcrit_alarm)
-#define HWMON_I_CRIT_ALARM	BIT(hwmon_in_crit_alarm)
-#define HWMON_I_RATED_MIN	BIT(hwmon_in_rated_min)
-#define HWMON_I_RATED_MAX	BIT(hwmon_in_rated_max)
-#define HWMON_I_BEEP		BIT(hwmon_in_beep)
-#define HWMON_I_FAULT		BIT(hwmon_in_fault)
+#define HWMON_I_ENABLE		BIT_ULL(hwmon_in_enable)
+#define HWMON_I_INPUT		BIT_ULL(hwmon_in_input)
+#define HWMON_I_MIN		BIT_ULL(hwmon_in_min)
+#define HWMON_I_MAX		BIT_ULL(hwmon_in_max)
+#define HWMON_I_LCRIT		BIT_ULL(hwmon_in_lcrit)
+#define HWMON_I_CRIT		BIT_ULL(hwmon_in_crit)
+#define HWMON_I_AVERAGE		BIT_ULL(hwmon_in_average)
+#define HWMON_I_LOWEST		BIT_ULL(hwmon_in_lowest)
+#define HWMON_I_HIGHEST		BIT_ULL(hwmon_in_highest)
+#define HWMON_I_RESET_HISTORY	BIT_ULL(hwmon_in_reset_history)
+#define HWMON_I_LABEL		BIT_ULL(hwmon_in_label)
+#define HWMON_I_ALARM		BIT_ULL(hwmon_in_alarm)
+#define HWMON_I_MIN_ALARM	BIT_ULL(hwmon_in_min_alarm)
+#define HWMON_I_MAX_ALARM	BIT_ULL(hwmon_in_max_alarm)
+#define HWMON_I_LCRIT_ALARM	BIT_ULL(hwmon_in_lcrit_alarm)
+#define HWMON_I_CRIT_ALARM	BIT_ULL(hwmon_in_crit_alarm)
+#define HWMON_I_RATED_MIN	BIT_ULL(hwmon_in_rated_min)
+#define HWMON_I_RATED_MAX	BIT_ULL(hwmon_in_rated_max)
+#define HWMON_I_BEEP		BIT_ULL(hwmon_in_beep)
+#define HWMON_I_FAULT		BIT_ULL(hwmon_in_fault)
 
 enum hwmon_curr_attributes {
 	hwmon_curr_enable,
@@ -189,25 +189,25 @@ enum hwmon_curr_attributes {
 	hwmon_curr_beep,
 };
 
-#define HWMON_C_ENABLE		BIT(hwmon_curr_enable)
-#define HWMON_C_INPUT		BIT(hwmon_curr_input)
-#define HWMON_C_MIN		BIT(hwmon_curr_min)
-#define HWMON_C_MAX		BIT(hwmon_curr_max)
-#define HWMON_C_LCRIT		BIT(hwmon_curr_lcrit)
-#define HWMON_C_CRIT		BIT(hwmon_curr_crit)
-#define HWMON_C_AVERAGE		BIT(hwmon_curr_average)
-#define HWMON_C_LOWEST		BIT(hwmon_curr_lowest)
-#define HWMON_C_HIGHEST		BIT(hwmon_curr_highest)
-#define HWMON_C_RESET_HISTORY	BIT(hwmon_curr_reset_history)
-#define HWMON_C_LABEL		BIT(hwmon_curr_label)
-#define HWMON_C_ALARM		BIT(hwmon_curr_alarm)
-#define HWMON_C_MIN_ALARM	BIT(hwmon_curr_min_alarm)
-#define HWMON_C_MAX_ALARM	BIT(hwmon_curr_max_alarm)
-#define HWMON_C_LCRIT_ALARM	BIT(hwmon_curr_lcrit_alarm)
-#define HWMON_C_CRIT_ALARM	BIT(hwmon_curr_crit_alarm)
-#define HWMON_C_RATED_MIN	BIT(hwmon_curr_rated_min)
-#define HWMON_C_RATED_MAX	BIT(hwmon_curr_rated_max)
-#define HWMON_C_BEEP		BIT(hwmon_curr_beep)
+#define HWMON_C_ENABLE		BIT_ULL(hwmon_curr_enable)
+#define HWMON_C_INPUT		BIT_ULL(hwmon_curr_input)
+#define HWMON_C_MIN		BIT_ULL(hwmon_curr_min)
+#define HWMON_C_MAX		BIT_ULL(hwmon_curr_max)
+#define HWMON_C_LCRIT		BIT_ULL(hwmon_curr_lcrit)
+#define HWMON_C_CRIT		BIT_ULL(hwmon_curr_crit)
+#define HWMON_C_AVERAGE		BIT_ULL(hwmon_curr_average)
+#define HWMON_C_LOWEST		BIT_ULL(hwmon_curr_lowest)
+#define HWMON_C_HIGHEST		BIT_ULL(hwmon_curr_highest)
+#define HWMON_C_RESET_HISTORY	BIT_ULL(hwmon_curr_reset_history)
+#define HWMON_C_LABEL		BIT_ULL(hwmon_curr_label)
+#define HWMON_C_ALARM		BIT_ULL(hwmon_curr_alarm)
+#define HWMON_C_MIN_ALARM	BIT_ULL(hwmon_curr_min_alarm)
+#define HWMON_C_MAX_ALARM	BIT_ULL(hwmon_curr_max_alarm)
+#define HWMON_C_LCRIT_ALARM	BIT_ULL(hwmon_curr_lcrit_alarm)
+#define HWMON_C_CRIT_ALARM	BIT_ULL(hwmon_curr_crit_alarm)
+#define HWMON_C_RATED_MIN	BIT_ULL(hwmon_curr_rated_min)
+#define HWMON_C_RATED_MAX	BIT_ULL(hwmon_curr_rated_max)
+#define HWMON_C_BEEP		BIT_ULL(hwmon_curr_beep)
 
 enum hwmon_power_attributes {
 	hwmon_power_enable,
@@ -243,37 +243,37 @@ enum hwmon_power_attributes {
 	hwmon_power_rated_max,
 };
 
-#define HWMON_P_ENABLE			BIT(hwmon_power_enable)
-#define HWMON_P_AVERAGE			BIT(hwmon_power_average)
-#define HWMON_P_AVERAGE_INTERVAL	BIT(hwmon_power_average_interval)
-#define HWMON_P_AVERAGE_INTERVAL_MAX	BIT(hwmon_power_average_interval_max)
-#define HWMON_P_AVERAGE_INTERVAL_MIN	BIT(hwmon_power_average_interval_min)
-#define HWMON_P_AVERAGE_HIGHEST		BIT(hwmon_power_average_highest)
-#define HWMON_P_AVERAGE_LOWEST		BIT(hwmon_power_average_lowest)
-#define HWMON_P_AVERAGE_MAX		BIT(hwmon_power_average_max)
-#define HWMON_P_AVERAGE_MIN		BIT(hwmon_power_average_min)
-#define HWMON_P_INPUT			BIT(hwmon_power_input)
-#define HWMON_P_INPUT_HIGHEST		BIT(hwmon_power_input_highest)
-#define HWMON_P_INPUT_LOWEST		BIT(hwmon_power_input_lowest)
-#define HWMON_P_RESET_HISTORY		BIT(hwmon_power_reset_history)
-#define HWMON_P_ACCURACY		BIT(hwmon_power_accuracy)
-#define HWMON_P_CAP			BIT(hwmon_power_cap)
-#define HWMON_P_CAP_HYST		BIT(hwmon_power_cap_hyst)
-#define HWMON_P_CAP_MAX			BIT(hwmon_power_cap_max)
-#define HWMON_P_CAP_MIN			BIT(hwmon_power_cap_min)
-#define HWMON_P_MIN			BIT(hwmon_power_min)
-#define HWMON_P_MAX			BIT(hwmon_power_max)
-#define HWMON_P_LCRIT			BIT(hwmon_power_lcrit)
-#define HWMON_P_CRIT			BIT(hwmon_power_crit)
-#define HWMON_P_LABEL			BIT(hwmon_power_label)
-#define HWMON_P_ALARM			BIT(hwmon_power_alarm)
-#define HWMON_P_CAP_ALARM		BIT(hwmon_power_cap_alarm)
-#define HWMON_P_MIN_ALARM		BIT(hwmon_power_min_alarm)
-#define HWMON_P_MAX_ALARM		BIT(hwmon_power_max_alarm)
-#define HWMON_P_LCRIT_ALARM		BIT(hwmon_power_lcrit_alarm)
-#define HWMON_P_CRIT_ALARM		BIT(hwmon_power_crit_alarm)
-#define HWMON_P_RATED_MIN		BIT(hwmon_power_rated_min)
-#define HWMON_P_RATED_MAX		BIT(hwmon_power_rated_max)
+#define HWMON_P_ENABLE			BIT_ULL(hwmon_power_enable)
+#define HWMON_P_AVERAGE			BIT_ULL(hwmon_power_average)
+#define HWMON_P_AVERAGE_INTERVAL	BIT_ULL(hwmon_power_average_interval)
+#define HWMON_P_AVERAGE_INTERVAL_MAX	BIT_ULL(hwmon_power_average_interval_max)
+#define HWMON_P_AVERAGE_INTERVAL_MIN	BIT_ULL(hwmon_power_average_interval_min)
+#define HWMON_P_AVERAGE_HIGHEST		BIT_ULL(hwmon_power_average_highest)
+#define HWMON_P_AVERAGE_LOWEST		BIT_ULL(hwmon_power_average_lowest)
+#define HWMON_P_AVERAGE_MAX		BIT_ULL(hwmon_power_average_max)
+#define HWMON_P_AVERAGE_MIN		BIT_ULL(hwmon_power_average_min)
+#define HWMON_P_INPUT			BIT_ULL(hwmon_power_input)
+#define HWMON_P_INPUT_HIGHEST		BIT_ULL(hwmon_power_input_highest)
+#define HWMON_P_INPUT_LOWEST		BIT_ULL(hwmon_power_input_lowest)
+#define HWMON_P_RESET_HISTORY		BIT_ULL(hwmon_power_reset_history)
+#define HWMON_P_ACCURACY		BIT_ULL(hwmon_power_accuracy)
+#define HWMON_P_CAP			BIT_ULL(hwmon_power_cap)
+#define HWMON_P_CAP_HYST		BIT_ULL(hwmon_power_cap_hyst)
+#define HWMON_P_CAP_MAX			BIT_ULL(hwmon_power_cap_max)
+#define HWMON_P_CAP_MIN			BIT_ULL(hwmon_power_cap_min)
+#define HWMON_P_MIN			BIT_ULL(hwmon_power_min)
+#define HWMON_P_MAX			BIT_ULL(hwmon_power_max)
+#define HWMON_P_LCRIT			BIT_ULL(hwmon_power_lcrit)
+#define HWMON_P_CRIT			BIT_ULL(hwmon_power_crit)
+#define HWMON_P_LABEL			BIT_ULL(hwmon_power_label)
+#define HWMON_P_ALARM			BIT_ULL(hwmon_power_alarm)
+#define HWMON_P_CAP_ALARM		BIT_ULL(hwmon_power_cap_alarm)
+#define HWMON_P_MIN_ALARM		BIT_ULL(hwmon_power_min_alarm)
+#define HWMON_P_MAX_ALARM		BIT_ULL(hwmon_power_max_alarm)
+#define HWMON_P_LCRIT_ALARM		BIT_ULL(hwmon_power_lcrit_alarm)
+#define HWMON_P_CRIT_ALARM		BIT_ULL(hwmon_power_crit_alarm)
+#define HWMON_P_RATED_MIN		BIT_ULL(hwmon_power_rated_min)
+#define HWMON_P_RATED_MAX		BIT_ULL(hwmon_power_rated_max)
 
 enum hwmon_energy_attributes {
 	hwmon_energy_enable,
@@ -281,9 +281,9 @@ enum hwmon_energy_attributes {
 	hwmon_energy_label,
 };
 
-#define HWMON_E_ENABLE			BIT(hwmon_energy_enable)
-#define HWMON_E_INPUT			BIT(hwmon_energy_input)
-#define HWMON_E_LABEL			BIT(hwmon_energy_label)
+#define HWMON_E_ENABLE			BIT_ULL(hwmon_energy_enable)
+#define HWMON_E_INPUT			BIT_ULL(hwmon_energy_input)
+#define HWMON_E_LABEL			BIT_ULL(hwmon_energy_label)
 
 enum hwmon_humidity_attributes {
 	hwmon_humidity_enable,
@@ -301,19 +301,19 @@ enum hwmon_humidity_attributes {
 	hwmon_humidity_max_alarm,
 };
 
-#define HWMON_H_ENABLE			BIT(hwmon_humidity_enable)
-#define HWMON_H_INPUT			BIT(hwmon_humidity_input)
-#define HWMON_H_LABEL			BIT(hwmon_humidity_label)
-#define HWMON_H_MIN			BIT(hwmon_humidity_min)
-#define HWMON_H_MIN_HYST		BIT(hwmon_humidity_min_hyst)
-#define HWMON_H_MAX			BIT(hwmon_humidity_max)
-#define HWMON_H_MAX_HYST		BIT(hwmon_humidity_max_hyst)
-#define HWMON_H_ALARM			BIT(hwmon_humidity_alarm)
-#define HWMON_H_FAULT			BIT(hwmon_humidity_fault)
-#define HWMON_H_RATED_MIN		BIT(hwmon_humidity_rated_min)
-#define HWMON_H_RATED_MAX		BIT(hwmon_humidity_rated_max)
-#define HWMON_H_MIN_ALARM		BIT(hwmon_humidity_min_alarm)
-#define HWMON_H_MAX_ALARM		BIT(hwmon_humidity_max_alarm)
+#define HWMON_H_ENABLE			BIT_ULL(hwmon_humidity_enable)
+#define HWMON_H_INPUT			BIT_ULL(hwmon_humidity_input)
+#define HWMON_H_LABEL			BIT_ULL(hwmon_humidity_label)
+#define HWMON_H_MIN			BIT_ULL(hwmon_humidity_min)
+#define HWMON_H_MIN_HYST		BIT_ULL(hwmon_humidity_min_hyst)
+#define HWMON_H_MAX			BIT_ULL(hwmon_humidity_max)
+#define HWMON_H_MAX_HYST		BIT_ULL(hwmon_humidity_max_hyst)
+#define HWMON_H_ALARM			BIT_ULL(hwmon_humidity_alarm)
+#define HWMON_H_FAULT			BIT_ULL(hwmon_humidity_fault)
+#define HWMON_H_RATED_MIN		BIT_ULL(hwmon_humidity_rated_min)
+#define HWMON_H_RATED_MAX		BIT_ULL(hwmon_humidity_rated_max)
+#define HWMON_H_MIN_ALARM		BIT_ULL(hwmon_humidity_min_alarm)
+#define HWMON_H_MAX_ALARM		BIT_ULL(hwmon_humidity_max_alarm)
 
 enum hwmon_fan_attributes {
 	hwmon_fan_enable,
@@ -331,19 +331,19 @@ enum hwmon_fan_attributes {
 	hwmon_fan_beep,
 };
 
-#define HWMON_F_ENABLE			BIT(hwmon_fan_enable)
-#define HWMON_F_INPUT			BIT(hwmon_fan_input)
-#define HWMON_F_LABEL			BIT(hwmon_fan_label)
-#define HWMON_F_MIN			BIT(hwmon_fan_min)
-#define HWMON_F_MAX			BIT(hwmon_fan_max)
-#define HWMON_F_DIV			BIT(hwmon_fan_div)
-#define HWMON_F_PULSES			BIT(hwmon_fan_pulses)
-#define HWMON_F_TARGET			BIT(hwmon_fan_target)
-#define HWMON_F_ALARM			BIT(hwmon_fan_alarm)
-#define HWMON_F_MIN_ALARM		BIT(hwmon_fan_min_alarm)
-#define HWMON_F_MAX_ALARM		BIT(hwmon_fan_max_alarm)
-#define HWMON_F_FAULT			BIT(hwmon_fan_fault)
-#define HWMON_F_BEEP			BIT(hwmon_fan_beep)
+#define HWMON_F_ENABLE			BIT_ULL(hwmon_fan_enable)
+#define HWMON_F_INPUT			BIT_ULL(hwmon_fan_input)
+#define HWMON_F_LABEL			BIT_ULL(hwmon_fan_label)
+#define HWMON_F_MIN			BIT_ULL(hwmon_fan_min)
+#define HWMON_F_MAX			BIT_ULL(hwmon_fan_max)
+#define HWMON_F_DIV			BIT_ULL(hwmon_fan_div)
+#define HWMON_F_PULSES			BIT_ULL(hwmon_fan_pulses)
+#define HWMON_F_TARGET			BIT_ULL(hwmon_fan_target)
+#define HWMON_F_ALARM			BIT_ULL(hwmon_fan_alarm)
+#define HWMON_F_MIN_ALARM		BIT_ULL(hwmon_fan_min_alarm)
+#define HWMON_F_MAX_ALARM		BIT_ULL(hwmon_fan_max_alarm)
+#define HWMON_F_FAULT			BIT_ULL(hwmon_fan_fault)
+#define HWMON_F_BEEP			BIT_ULL(hwmon_fan_beep)
 
 enum hwmon_pwm_attributes {
 	hwmon_pwm_input,
@@ -353,18 +353,18 @@ enum hwmon_pwm_attributes {
 	hwmon_pwm_auto_channels_temp,
 };
 
-#define HWMON_PWM_INPUT			BIT(hwmon_pwm_input)
-#define HWMON_PWM_ENABLE		BIT(hwmon_pwm_enable)
-#define HWMON_PWM_MODE			BIT(hwmon_pwm_mode)
-#define HWMON_PWM_FREQ			BIT(hwmon_pwm_freq)
-#define HWMON_PWM_AUTO_CHANNELS_TEMP	BIT(hwmon_pwm_auto_channels_temp)
+#define HWMON_PWM_INPUT			BIT_ULL(hwmon_pwm_input)
+#define HWMON_PWM_ENABLE		BIT_ULL(hwmon_pwm_enable)
+#define HWMON_PWM_MODE			BIT_ULL(hwmon_pwm_mode)
+#define HWMON_PWM_FREQ			BIT_ULL(hwmon_pwm_freq)
+#define HWMON_PWM_AUTO_CHANNELS_TEMP	BIT_ULL(hwmon_pwm_auto_channels_temp)
 
 enum hwmon_intrusion_attributes {
 	hwmon_intrusion_alarm,
 	hwmon_intrusion_beep,
 };
-#define HWMON_INTRUSION_ALARM		BIT(hwmon_intrusion_alarm)
-#define HWMON_INTRUSION_BEEP		BIT(hwmon_intrusion_beep)
+#define HWMON_INTRUSION_ALARM		BIT_ULL(hwmon_intrusion_alarm)
+#define HWMON_INTRUSION_BEEP		BIT_ULL(hwmon_intrusion_beep)
 
 /**
  * struct hwmon_ops - hwmon device operations
@@ -433,13 +433,13 @@ struct hwmon_ops {
  */
 struct hwmon_channel_info {
 	enum hwmon_sensor_types type;
-	const u32 *config;
+	const u64 *config;
 };
 
 #define HWMON_CHANNEL_INFO(stype, ...)		\
 	(&(const struct hwmon_channel_info) {	\
 		.type = hwmon_##stype,		\
-		.config = (const u32 []) {	\
+		.config = (const u64 []) {	\
 			__VA_ARGS__, 0		\
 		}				\
 	})
-- 
2.22.0


