Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E6EC02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 07:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vdETTkyg5PsLp5stK18NxEV8bGgGJk72UUmhXx0V6U=; b=xvrC/rHsCw3mTI/wGvl0aJLFe3
	fCIWJAi4zRHDtk6AKdeM5wNetCcYQpWCESxNdpRcwLGLp1ZbYJ2IM9r11nUimGprXNOgZrBRCMLQn
	+O2rnZWskYvZM5NIv0iyUKgJXPCDAclIUjgrR21TWwd2rHjoTfdnS/WisKu/Sr+q4yzbGKNNVp6ao
	k+f2rbqbKvObFz4N1nuIAE+dLhl7jx0Xcjh2Gnq5BrRsb9ikGDwSlwvdkTW2G9tjM+2fY6muagHIA
	oSTmTYAasrnJe49MSGvw+oBQ9D417um0AHTbAIAxgMN2XxaV/772Oj0a/107YYR0ZvhDAhz1nl3Cj
	ThnfBnMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8eB-000000078FB-33Yy;
	Tue, 21 Jan 2025 07:26:03 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8Ct-000000072uM-2Gts
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 06:57:52 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4YcdHC3g37z1V5L4;
	Tue, 21 Jan 2025 14:54:31 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id C910B1400D5;
	Tue, 21 Jan 2025 14:57:49 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Jan 2025 14:57:49 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Jan 2025 14:57:47 +0800
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
Subject: [PATCH v1 21/21] hwmon: (lm90) Fix the type of 'config' in struct hwmon_channel_info to u64
Date: Tue, 21 Jan 2025 14:45:19 +0800
Message-ID: <20250121064519.18974-22-lihuisong@huawei.com>
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
X-CRM114-CacheID: sfid-20250120_225751_770906_9C1C2DC6 
X-CRM114-Status: GOOD (  10.73  )
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
 drivers/hwmon/lm90.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 511d95a0efb3..dbb9d976284f 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -685,8 +685,8 @@ enum lm90_temp_reg_index {
 struct lm90_data {
 	struct i2c_client *client;
 	struct device *hwmon_dev;
-	u32 chip_config[2];
-	u32 channel_config[MAX_CHANNELS + 1];
+	u64 chip_config[2];
+	u64 channel_config[MAX_CHANNELS + 1];
 	const char *channel_label[MAX_CHANNELS];
 	struct hwmon_channel_info chip_info;
 	struct hwmon_channel_info temp_info;
-- 
2.22.0


