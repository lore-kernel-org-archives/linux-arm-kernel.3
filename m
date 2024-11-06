Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39275D44D46
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 11:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOfsrYatElDPmRlbi7+lKWcskNLKvTB4jMYwQHbO72c=; b=c/N5kHSmutyZg+IYbSE7een0t6
	k6h5jNtyAhAWH2wtRDA+9WMZqhfhWI7NE5n+spl0JflKM6t11dYo42q8WV+nIK+rs9t8FWqz7Nyvy
	lqgCg2uJ65lWkYmd6aIo3U7O0a1LAB7cqvOhWWLADzE/OF4v8Z53299Zg/ACGZj4a4jjEjDdZW1SZ
	kBaARds13o6nXgK+ZsfghIxmI4kGQf0NvQW1kOoG69ZiXWMEhKRLAWe9xVPWNGPp8FuXkvvmI76XH
	nTQxzM7glrbFN5BPtFZO6yMrOvjKQyIgdXQ2eRQgEVy22VLiF5TFkyAhUuWsywt5TWNO6GbcdlnqC
	KK7T35og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dmn-00000002rJr-1yB2;
	Wed, 06 Nov 2024 11:01:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cvC-00000002g1b-0XyH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 10:05:57 +0000
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEC061F0D;
	Wed,  6 Nov 2024 11:05:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730887543;
	bh=GIh8ffFOaeFmTPT3AaowZKFMAhna0qeJyLGXGIJyY9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jrC3ON2mh+aevAjPt62cCeckCgCAxf/mFHSOFvnAX7kql0dBdqz0nku739nEQFOIq
	 sWOrw0ev4yWjETKYTFZPVvhk8D5JeEQhgBQNRSBn2UPPjSOfS0Nw4VyxFJh8XkKV5F
	 KOU9YGVirMKpr+eAkJSX/6I4Br6EEG7FgZGUnskA=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@iki.fi,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v8 12/17] media: platform: Fill stats buffer on ISP_START
Date: Wed,  6 Nov 2024 10:05:29 +0000
Message-Id: <20241106100534.768400-13-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106100534.768400-1-dan.scally@ideasonboard.com>
References: <20241106100534.768400-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_020554_432900_3BC2F975 
X-CRM114-Status: GOOD (  15.85  )
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

On ISP_START, fill the stats buffer by reading out the metering space
in the ISP's memory. This is done for the non-active config just as
the dma transfer of the registers is. To acheive that, move the
checking of the current config outside of mali_c55_swap_next_config()
so we can use it for both functions.

Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v8:

	- None

Changes in v7:

	- Reworked how the config is swapped on ISP start

Changes in v6:

	- None

Changes in v5:

	- New patch

 .../platform/arm/mali-c55/mali-c55-core.c     | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index b225d41f8000..8c6cae9a3a4d 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -625,12 +625,6 @@ static int mali_c55_check_hwcfg(struct mali_c55 *mali_c55)
 static void mali_c55_swap_next_config(struct mali_c55 *mali_c55)
 {
 	struct mali_c55_context *ctx = mali_c55_get_active_context(mali_c55);
-	u32 curr_config;
-
-	curr_config = mali_c55_read(mali_c55, MALI_C55_REG_PING_PONG_READ);
-	curr_config = (curr_config & MALI_C55_REG_PING_PONG_READ_MASK)
-		      >> (ffs(MALI_C55_REG_PING_PONG_READ_MASK) - 1);
-	mali_c55->next_config = curr_config ^ 1;
 
 	mali_c55_config_write(ctx, mali_c55->next_config ?
 			      MALI_C55_CONFIG_PING : MALI_C55_CONFIG_PONG,
@@ -651,6 +645,7 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
 	struct device *dev = context;
 	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
 	u32 interrupt_status;
+	u32 curr_config;
 	unsigned int i;
 
 	interrupt_status = mali_c55_read(mali_c55,
@@ -675,6 +670,22 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
 			if (mali_c55->capabilities & MALI_C55_GPS_DS_PIPE_FITTED)
 				mali_c55_set_next_buffer(&mali_c55->cap_devs[MALI_C55_CAP_DEV_DS]);
 
+			/*
+			 * When the ISP starts a frame we have some work to do:
+			 *
+			 * 1. Copy over the config for the **next** frame
+			 * 2. Read out the metering stats for the **last** frame
+			 */
+
+			curr_config = mali_c55_read(mali_c55,
+						    MALI_C55_REG_PING_PONG_READ);
+			curr_config &= MALI_C55_REG_PING_PONG_READ_MASK;
+			curr_config >>= ffs(MALI_C55_REG_PING_PONG_READ_MASK) - 1;
+			mali_c55->next_config = curr_config ^ 1;
+
+			mali_c55_stats_fill_buffer(mali_c55,
+				mali_c55->next_config ? MALI_C55_CONFIG_PING :
+				MALI_C55_CONFIG_PONG);
 			mali_c55_swap_next_config(mali_c55);
 
 			break;
-- 
2.34.1


