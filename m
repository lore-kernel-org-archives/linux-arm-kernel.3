Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70855C02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 06:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pGAHS5WS3Dp+e9RRWIzS0hnwndwJa5S1gi9fKGQIAK0=; b=085U5z1D+6AU18Xge5okyZFPCR
	AfQChqj/DY6GKTI1yEs+1ytGkns7KOWRLwhhD8+Qb2te7zWt1QykjtvbO2tNKuCwLMxDGERJjSPBI
	aB3Pfzkzt8jaiCm1xJ1rOWtEr2MMap9LwPyEMDJ73UJpgbBx4KU20Yyk5mgpcYNh19xR8CzCE+O2d
	MXmUvoOJxbsBez1y4e/Hfp8sDY+qVAB8j1CTK0gLSiJjiNXbV8neZKMpw3LIFJU1o8+PgEYNS+w86
	d3Qu/jegFr+fhlfvNbzd4hl8jK5cmbp8AA2wtbXzzQVypd/ZqAX7tW9J8f3x6Av1riKew/bZ5Nw8w
	yIrXv5VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8Dr-000000073Bt-2KWx;
	Tue, 21 Jan 2025 06:58:51 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8CV-000000072ds-17Sb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 06:57:29 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YcdGq1MdBzbp8C;
	Tue, 21 Jan 2025 14:54:11 +0800 (CST)
Received: from dggemv703-chm.china.huawei.com (unknown [10.3.19.46])
	by mail.maildlp.com (Postfix) with ESMTPS id D21421800D1;
	Tue, 21 Jan 2025 14:57:19 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 Jan 2025 14:57:19 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Jan 2025 14:57:17 +0800
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
Subject: [PATCH v1 00/21] hwmon: Fix the type of 'config' in struct hwmon_channel_info to u64
Date: Tue, 21 Jan 2025 14:44:58 +0800
Message-ID: <20250121064519.18974-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.79.22]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_225727_650676_540C09FC 
X-CRM114-Status: GOOD (  10.07  )
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

The hwmon_device_register() is deprecated. When I try to repace it with
hwmon_device_register_with_info() for acpi_power_meter driver, I found that
the power channel attribute in linux/hwmon.h have to extend and is more
than 32 after this replacement.

However, the maximum number of hwmon channel attributes is 32 which is
limited by current hwmon codes. This is not good to add new channel
attribute for some hwmon sensor type and support more channel attribute.

This series are aimed to do this. And also make sure that acpi_power_meter
driver can successfully replace the deprecated hwmon_device_register()
later.

Huisong Li (21):
  hwmon: Fix the type of 'config' in struct hwmon_channel_info to u64
  media: video-i2c: Use HWMON_CHANNEL_INFO macro to simplify code
  net: aquantia: Use HWMON_CHANNEL_INFO macro to simplify code
  net: nfp: Use HWMON_CHANNEL_INFO macro to simplify code
  net: phy: marvell: Use HWMON_CHANNEL_INFO macro to simplify code
  net: phy: marvell10g: Use HWMON_CHANNEL_INFO macro to simplify code
  rtc: ab-eoz9: Use HWMON_CHANNEL_INFO macro to simplify code
  rtc: ds3232: Use HWMON_CHANNEL_INFO macro to simplify code
  w1: w1_therm: w1: Use HWMON_CHANNEL_INFO macro to simplify code
  net: phy: aquantia: Use HWMON_CHANNEL_INFO macro to simplify code
  hwmon: (asus_wmi_sensors) Fix type of 'config' in struct
    hwmon_channel_info to u64
  hwmon: (hp-wmi-sensors) Fix type of 'config' in struct
    hwmon_channel_info to u64
  hwmon: (mr75203) Fix the type of 'config' in struct hwmon_channel_info
    to u64
  hwmon: (pwm-fan) Fix the type of 'config' in struct hwmon_channel_info
    to u64
  hwmon: (scmi-hwmon) Fix the type of 'config' in struct
    hwmon_channel_info to u64
  hwmon: (tmp401) Fix the type of 'config' in struct hwmon_channel_info
    to u64
  hwmon: (tmp421) Fix the type of 'config' in struct hwmon_channel_info
    to u64
  net/mlx5: Fix the type of 'config' in struct hwmon_channel_info to u64
  platform/x86: dell-ddv: Fix the type of 'config' in struct
    hwmon_channel_info to u64
  hwmon: (asus-ec-sensors) Fix the type of 'config' in struct
    hwmon_channel_info to u64
  hwmon: (lm90) Fix the type of 'config' in struct hwmon_channel_info to
    u64

 drivers/hwmon/asus-ec-sensors.c               |   6 +-
 drivers/hwmon/asus_wmi_sensors.c              |   8 +-
 drivers/hwmon/hp-wmi-sensors.c                |   6 +-
 drivers/hwmon/hwmon.c                         |   4 +-
 drivers/hwmon/lm90.c                          |   4 +-
 drivers/hwmon/mr75203.c                       |   6 +-
 drivers/hwmon/pwm-fan.c                       |   4 +-
 drivers/hwmon/scmi-hwmon.c                    |   6 +-
 drivers/hwmon/tmp401.c                        |   4 +-
 drivers/hwmon/tmp421.c                        |   2 +-
 drivers/media/i2c/video-i2c.c                 |  12 +-
 .../ethernet/aquantia/atlantic/aq_drvinfo.c   |  14 +-
 .../net/ethernet/mellanox/mlx5/core/hwmon.c   |   8 +-
 .../net/ethernet/netronome/nfp/nfp_hwmon.c    |  40 +--
 drivers/net/phy/aquantia/aquantia_hwmon.c     |  32 +-
 drivers/net/phy/marvell.c                     |  24 +-
 drivers/net/phy/marvell10g.c                  |  24 +-
 drivers/platform/x86/dell/dell-wmi-ddv.c      |   6 +-
 drivers/rtc/rtc-ab-eoz9.c                     |  24 +-
 drivers/rtc/rtc-ds3232.c                      |  24 +-
 drivers/w1/slaves/w1_therm.c                  |  12 +-
 include/linux/hwmon.h                         | 300 +++++++++---------
 22 files changed, 205 insertions(+), 365 deletions(-)

-- 
2.22.0


