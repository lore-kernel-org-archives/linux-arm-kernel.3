Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CE1C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2NdId1ozjR949P6fBcdgfhadjWxpSqZ7R8aXjvMQIE=; b=W0PNL56c9cJUIYNQliJxrooYzW
	PFYaTU07Rw/DKc5ZjkHf58XDOjnvM+wUnjaNNNXXM6EzBjIEdzG0K8sFPnkHNKxZ/aqxhtV0RyBNC
	pCgGtvloZXwUQ/f38XgmQwJauUNYfZuei0WP7h5kSx+9Iv7IR5tyk/RKn22YfqN4GKuLXZbs5jXts
	HABH0m+mOw1qlm3bS8HDv2kpHwDtuzhuTgWsdXpc4eofrIgUm7pbHWR9CMq5DnLKGI5cfmSIDxYv7
	h9NjgTCcciRBPhoO22+yDB5IRG3zmnxVfo1WlSQntdwml8gAW8QUSRFVS1CuMbzNp3CA3BcHu3dnJ
	/r1pafFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnc8B-00000007CaD-3Mwc;
	Thu, 27 Feb 2025 11:32:43 +0000
Received: from mail-m21471.qiye.163.com ([117.135.214.71])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbgE-0000000759T-45fN;
	Thu, 27 Feb 2025 11:03:52 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c65b3593;
	Thu, 27 Feb 2025 19:03:45 +0800 (GMT+08:00)
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
Subject: [PATCH v2 2/2] iio: adc: rockchip_saradc: add rk3562
Date: Thu, 27 Feb 2025 19:03:43 +0800
Message-Id: <20250227110343.2342017-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227110343.2342017-1-kever.yang@rock-chips.com>
References: <20250227110343.2342017-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQksfGlZDSkgdHR5DHx0eGEpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a954713a96603afkunmc65b3593
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PhQ6Pio5SDIcEQ0hKB1KMk4U
	HTQaCTNVSlVKTE9LTU5PSUlNQ0NNVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSktINwY+
DKIM-Signature: a=rsa-sha256;
	b=d14/TOtjg9Yv9IjbpxXKPiLx6J8K3jXLTfVGaC3MteGr+YUR1nakxXWmFC7YaspoSIZyajxEvl5bHRL7Dm33sLHHrc1OYfS1Z+sYcm6DqbJmhmBy05Pa3BVKUuK7DmPzkOp1MNqsg3X71TBqy1/l9tvrp21dafzoC//1S3mkqXE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=v2NdId1ozjR949P6fBcdgfhadjWxpSqZ7R8aXjvMQIE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_030351_293322_E9E4F012 
X-CRM114-Status: UNSURE (   8.68  )
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

Changes in v2: None

 drivers/iio/adc/rockchip_saradc.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip_saradc.c
index a29e54754c8f..9995f95bafe0 100644
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


