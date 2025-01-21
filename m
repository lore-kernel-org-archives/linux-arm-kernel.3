Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5FAC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 07:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzQBA76RiD1ProaozO8PBLTX/CItps8YK2eM8csu978=; b=hyIXmErtYYcwtCdCzZHwOSjZFq
	VS6+gU8N4rcU/YfmTSP2NtGwzQ8STLjuDKx/D9qfCQ/1l9q0AHnHTjTlEtnoVp2QqKT5Uaz186rDh
	UVpLwpIP3BPWxXNuhJAAjNYkS2RgIpjm0eT0bYmA1JFvGP57F9U94FZnnrh+95sqQuG5RbVgjh5U/
	+V21ftFVm6WpXOXC+/jF1QsZyYA/VazMtiSt1WVFrE6LKu7N/cQ7tPLDTvZw/qjj3A2vWZGoPFxcb
	w2Z/M2cynq30Cnz/VhDsadlX7BR4cFevfbVo0Bg9kUn29CNaxbuZ0QdMUyhW+ohUH6Ytkkt3H05sI
	T4foarMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8aQ-000000077qq-3aFY;
	Tue, 21 Jan 2025 07:22:10 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8Cp-000000072rI-0zJV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 06:57:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YcdHG4ZBczgbt5;
	Tue, 21 Jan 2025 14:54:34 +0800 (CST)
Received: from dggemv704-chm.china.huawei.com (unknown [10.3.19.47])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A2FE1800D1;
	Tue, 21 Jan 2025 14:57:45 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 Jan 2025 14:57:45 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Jan 2025 14:57:43 +0800
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
Subject: [PATCH v1 18/21] net/mlx5: Fix the type of 'config' in struct hwmon_channel_info to u64
Date: Tue, 21 Jan 2025 14:45:16 +0800
Message-ID: <20250121064519.18974-19-lihuisong@huawei.com>
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
X-CRM114-CacheID: sfid-20250120_225747_613515_2D17AE78 
X-CRM114-Status: GOOD (  12.23  )
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
 drivers/net/ethernet/mellanox/mlx5/core/hwmon.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/hwmon.c b/drivers/net/ethernet/mellanox/mlx5/core/hwmon.c
index 353f81dccd1c..fe39b97d214e 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/hwmon.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/hwmon.c
@@ -30,9 +30,9 @@ struct mlx5_hwmon {
 	struct mlx5_core_dev *mdev;
 	struct device *hwmon_dev;
 	struct hwmon_channel_info chip_info;
-	u32 chip_channel_config[CHIP_CONFIG_NUM + 1];
+	u64 chip_channel_config[CHIP_CONFIG_NUM + 1];
 	struct hwmon_channel_info temp_info;
-	u32 *temp_channel_config;
+	u64 *temp_channel_config;
 	const struct hwmon_channel_info *channel_info[CHANNELS_TYPE_NUM + 1];
 	struct hwmon_chip_info chip;
 	struct temp_channel_desc *temp_channel_desc;
@@ -233,14 +233,14 @@ static void mlx5_hwmon_channel_info_init(struct mlx5_hwmon *hwmon)
 	hwmon->channel_info[1] = &hwmon->temp_info;
 
 	hwmon->chip_channel_config[0] = HWMON_C_REGISTER_TZ;
-	hwmon->chip_info.config = (const u32 *)hwmon->chip_channel_config;
+	hwmon->chip_info.config = (const u64 *)hwmon->chip_channel_config;
 	hwmon->chip_info.type = hwmon_chip;
 
 	for (i = 0; i < hwmon->asic_platform_scount + hwmon->module_scount; i++)
 		hwmon->temp_channel_config[i] = HWMON_T_INPUT | HWMON_T_HIGHEST | HWMON_T_CRIT |
 					     HWMON_T_RESET_HISTORY | HWMON_T_LABEL;
 
-	hwmon->temp_info.config = (const u32 *)hwmon->temp_channel_config;
+	hwmon->temp_info.config = (const u64 *)hwmon->temp_channel_config;
 	hwmon->temp_info.type = hwmon_temp;
 }
 
-- 
2.22.0


