Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7827BC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 07:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hd4Kpa5IvSZ6E/Y2fSZEK6KNA00ArC6MZyv8u4p8ZTU=; b=sCjVACqZl1ilz8nB1LYuRtQZDP
	ltPY5tS/JC+AOKHmUQ3u6behhVBcZRCejVxUwQIXrWhTg8Df9EBnyPWcchwNYTiz1vSp5ibH8uHQu
	Q4k6y9zMRrLRUzHawiHklMHlHv8j5TCOsoJRJY3aTGoRE7U1Zg3/ykyD4tjYexNpdsBJrXHch45dh
	h/swK/qwk47H9+yzgYaX8DpMImyoEmkOTlC9JuPnBRJ1pEIBJMDMsUpGxt4Rn4/2nIZLDdNq0nJxI
	jfJO6mRORLFhPu72oG6DM6M0N9xhBuHR0vqqWbZd4ofnzI/U8jc+EDNMuf1D2UOQp6OWATST+2/b9
	TjQhgT9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8LP-0000000758M-2XYe;
	Tue, 21 Jan 2025 07:06:39 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8Ce-000000072gj-08Gb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 06:57:38 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YcdGv5HzSz1kygl;
	Tue, 21 Jan 2025 14:54:15 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 0AA851400D5;
	Tue, 21 Jan 2025 14:57:33 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Jan 2025 14:57:32 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Jan 2025 14:57:25 +0800
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
Subject: [PATCH v1 05/21] net: phy: marvell: Use HWMON_CHANNEL_INFO macro to simplify code
Date: Tue, 21 Jan 2025 14:45:03 +0800
Message-ID: <20250121064519.18974-6-lihuisong@huawei.com>
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
X-CRM114-CacheID: sfid-20250120_225736_228150_10C021AD 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

Use HWMON_CHANNEL_INFO macro to simplify code.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/net/phy/marvell.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 44e1927de499..dd254e36ca8a 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -3124,33 +3124,13 @@ static umode_t marvell_hwmon_is_visible(const void *data,
 	}
 }
 
-static u32 marvell_hwmon_chip_config[] = {
-	HWMON_C_REGISTER_TZ,
-	0
-};
-
-static const struct hwmon_channel_info marvell_hwmon_chip = {
-	.type = hwmon_chip,
-	.config = marvell_hwmon_chip_config,
-};
-
 /* we can define HWMON_T_CRIT and HWMON_T_MAX_ALARM even though these are not
  * defined for all PHYs, because the hwmon code checks whether the attributes
  * exists via the .is_visible method
  */
-static u32 marvell_hwmon_temp_config[] = {
-	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_MAX_ALARM,
-	0
-};
-
-static const struct hwmon_channel_info marvell_hwmon_temp = {
-	.type = hwmon_temp,
-	.config = marvell_hwmon_temp_config,
-};
-
 static const struct hwmon_channel_info * const marvell_hwmon_info[] = {
-	&marvell_hwmon_chip,
-	&marvell_hwmon_temp,
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_MAX_ALARM),
 	NULL
 };
 
-- 
2.22.0


