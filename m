Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200AEE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWTpV5unBG06xQWRz5c8PNc7qqWDa9gYmL9khDtzsDU=; b=3twdk8hAMWZmOqRhL44H968LJM
	QgkY5EMPuyLIrPTvOaHZt8A6pwHxM7amKuZMgnGrsrRX7e3R1bjSHRwzYYJ0ok7grA+yIIJcqiId8
	Q2Uru5ORJVwnGqU5em02yr3fX4SWVpIWRNVSkpie8fybQFLfFv9ffA7d+VdYxclqlD7iM3T7sc6wx
	ioR6OkfPjYinTnf2XElTXDfa3V8CmyDKomEVB4/qzLuYuAfybl1xgJbElEvH8tscKGterd/H1cqox
	oGh8gAxPmaIEUBRto64hdHI4IPSx39VtcOmnEPyuRWiQStLewNBYUK7oDqUmHVPfMq1AhZEyJucJP
	4cztDnCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1UZ-0000000BdMD-0rkd;
	Tue, 24 Dec 2024 09:46:19 +0000
Received: from mail-m127102.qiye.163.com ([115.236.127.102])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1PE-0000000BcTe-3uDW;
	Tue, 24 Dec 2024 09:40:50 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aa905c9;
	Tue, 24 Dec 2024 17:40:45 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Simon Xue <xxm@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jonathan Cameron <jic23@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] iio: adc: rockchip_saradc: add rk3562
Date: Tue, 24 Dec 2024 17:40:42 +0800
Message-Id: <20241224094042.3816483-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241224094042.3816483-1-kever.yang@rock-chips.com>
References: <20241224094042.3816483-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkpCSlZMQ04dSRoaGBkdQklWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f80a4f9d03afkunm6aa905c9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pgw6SAw6MDIPDEo9LDosMQxD
	SwkKCxVVSlVKTEhOS0hISU9NTUlNVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJS0NLNwY+
DKIM-Signature: a=rsa-sha256;
	b=SIs43kcIBQ30JV3HyXMPTAWyOMs6KfJjb+mkdOCVarF0/E8XQiVPn6gccY36DEBc+mLUjzEqQP6U+A5yZfWXJwj7iPh8TzLlX8kvcg6XYYO3yMX8Bnlsh/mUlAtqO8osdzALlliB1jwaMoY/0Dgv8atw0OMs1DQZCcq575C5hsU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=PWTpV5unBG06xQWRz5c8PNc7qqWDa9gYmL9khDtzsDU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_014049_147249_F8F4762E 
X-CRM114-Status: UNSURE (   8.27  )
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

From: Simon Xue <xxm@rock-chips.com>

rk3562 is using v2 saradc with 8 channels.

Signed-off-by: Simon Xue <xxm@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

 drivers/iio/adc/rockchip_saradc.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip_saradc.c
index 240cfa391674..7c8a9d37d245 100644
--- a/drivers/iio/adc/rockchip_saradc.c
+++ b/drivers/iio/adc/rockchip_saradc.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Rockchip Successive Approximation Register (SAR) A/D Converter
- * Copyright (C) 2014 ROCKCHIP, Inc.
+ * Copyright (C) 2014 Rockchip Electronics Co., Ltd.
  */
 
 #include <linux/bitfield.h>
@@ -275,6 +275,25 @@ static const struct rockchip_saradc_data rk3399_saradc_data = {
 	.power_down = rockchip_saradc_power_down_v1,
 };
 
+static const struct iio_chan_spec rockchip_rk3562_saradc_iio_channels[] = {
+	SARADC_CHANNEL(0, "adc0", 10),
+	SARADC_CHANNEL(1, "adc1", 10),
+	SARADC_CHANNEL(2, "adc2", 10),
+	SARADC_CHANNEL(3, "adc3", 10),
+	SARADC_CHANNEL(4, "adc4", 10),
+	SARADC_CHANNEL(5, "adc5", 10),
+	SARADC_CHANNEL(6, "adc6", 10),
+	SARADC_CHANNEL(7, "adc7", 10),
+};
+
+static const struct rockchip_saradc_data rk3562_saradc_data = {
+	.channels = rockchip_rk3562_saradc_iio_channels,
+	.num_channels = ARRAY_SIZE(rockchip_rk3562_saradc_iio_channels),
+	.clk_rate = 1000000,
+	.start = rockchip_saradc_start_v2,
+	.read = rockchip_saradc_read_v2,
+};
+
 static const struct iio_chan_spec rockchip_rk3568_saradc_iio_channels[] = {
 	SARADC_CHANNEL(0, "adc0", 10),
 	SARADC_CHANNEL(1, "adc1", 10),
@@ -324,6 +343,9 @@ static const struct of_device_id rockchip_saradc_match[] = {
 	}, {
 		.compatible = "rockchip,rk3399-saradc",
 		.data = &rk3399_saradc_data,
+	}, {
+		.compatible = "rockchip,rk3562-saradc",
+		.data = &rk3562_saradc_data,
 	}, {
 		.compatible = "rockchip,rk3568-saradc",
 		.data = &rk3568_saradc_data,
-- 
2.25.1


