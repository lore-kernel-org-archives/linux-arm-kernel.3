Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7620C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 07:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Znoke7uxMfSXzCuSqntlv8X3hUnl/UgGIP5keBDGFkc=; b=zn4ZCrPOLj8/GWtyQT/a/cj8H1
	aL3+OqCnipGlzru+85bz4QmthHwaPMBvoP8olrBK9rTl3ldtQumeC8mD1U7jum8i3CS5GETKERWEQ
	KyHPbLJN8rq9y5/3kwqh30H+fmXfkkQosIVOC5R0JuSV4pJpqZottIdycXQCvNrbwYYN9b2wkcWWw
	lJBU3hlbvF7CNpxWA+yvtbxWP0DaaNBrvbFS4OMOgjR3jsMlHH92xaAUaLqqYZmMHwFFkyQyqfWr5
	rQw9C/6BaR69+uA7BF/5FRH6IS9e93AatIGqiglpsxY7VO7Crh95Mvyct2TiIuEJ9JDdDktnmtD8I
	eGQhrKPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8QQ-0000000767r-1WC6;
	Tue, 21 Jan 2025 07:11:50 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8Cf-000000072j1-1LaZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 06:57:39 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YcdJr3NG6zrRgr;
	Tue, 21 Jan 2025 14:55:56 +0800 (CST)
Received: from dggemv711-chm.china.huawei.com (unknown [10.1.198.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 8C292140203;
	Tue, 21 Jan 2025 14:57:35 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 Jan 2025 14:57:35 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Jan 2025 14:57:33 +0800
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
Subject: [PATCH v1 11/21] hwmon: (asus_wmi_sensors) Fix type of 'config' in struct hwmon_channel_info to u64
Date: Tue, 21 Jan 2025 14:45:09 +0800
Message-ID: <20250121064519.18974-12-lihuisong@huawei.com>
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
X-CRM114-CacheID: sfid-20250120_225737_721727_92C3EC35 
X-CRM114-Status: GOOD (  11.03  )
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

The type of 'config' in struct hwmon_channel_info has been fixed to u64.
Modify the related code in driver to avoid compiling failure.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/hwmon/asus_wmi_sensors.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/asus_wmi_sensors.c b/drivers/hwmon/asus_wmi_sensors.c
index c2dd7ff882f2..9593674fc5df 100644
--- a/drivers/hwmon/asus_wmi_sensors.c
+++ b/drivers/hwmon/asus_wmi_sensors.c
@@ -126,7 +126,7 @@ static enum hwmon_sensor_types asus_data_types[] = {
 	[WATER_FLOW]	= hwmon_fan,
 };
 
-static u32 hwmon_attributes[hwmon_max] = {
+static u64 hwmon_attributes[hwmon_max] = {
 	[hwmon_chip]	= HWMON_C_REGISTER_TZ,
 	[hwmon_temp]	= HWMON_T_INPUT | HWMON_T_LABEL,
 	[hwmon_in]	= HWMON_I_INPUT | HWMON_I_LABEL,
@@ -248,9 +248,9 @@ static int asus_wmi_get_item_count(u32 *count)
 
 static int asus_wmi_hwmon_add_chan_info(struct hwmon_channel_info *asus_wmi_hwmon_chan,
 					struct device *dev, int num,
-					enum hwmon_sensor_types type, u32 config)
+					enum hwmon_sensor_types type, u64 config)
 {
-	u32 *cfg;
+	u64 *cfg;
 
 	cfg = devm_kcalloc(dev, num + 1, sizeof(*cfg), GFP_KERNEL);
 	if (!cfg)
@@ -258,7 +258,7 @@ static int asus_wmi_hwmon_add_chan_info(struct hwmon_channel_info *asus_wmi_hwmo
 
 	asus_wmi_hwmon_chan->type = type;
 	asus_wmi_hwmon_chan->config = cfg;
-	memset32(cfg, config, num);
+	memset64(cfg, config, num);
 
 	return 0;
 }
-- 
2.22.0


