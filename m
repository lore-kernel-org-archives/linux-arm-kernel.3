Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F6BC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sA3+ksfmF4WxUqZ/dxVzwLP9w6fsZ/4A2U9h54aCX0E=; b=3NueGO+Rlu0P09Mj1o43MaKsjN
	4DpGa8OR1IRXqw4cDIzYdliTPKy4VZJ90kYeU1Ok6FbKJXth5W1bcd2woQLhKDXJzUZil/Cdz9Kab
	1WzujzJueh1x2T4QU8AK6FupoqIzW7Wj7eFne5HK4xA5bhurXokKHwiRaSxCLeixkjhqjCwrEilOn
	shMiWvi1iSFIPisqDw28lH18saBAKK2BNtat1EHBUjBogxNuTLxVyRQCdGGK7dEgYlkYaiRZf/Y5E
	vWNA75Kbyt/Mgw6vG9MQtftbpEMnFjJo8hUsmDAu3qWe69SX89fpTLrtZGOrahZmoYnLJKYk+04t/
	OZzgL+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXej-00000007dyq-0b77;
	Tue, 17 Jun 2025 14:51:21 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWlV-00000007R9V-0WA1;
	Tue, 17 Jun 2025 13:54:18 +0000
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7A762A6E;
	Tue, 17 Jun 2025 15:54:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750168443;
	bh=LQpsALkTPotTLV0L5B38pVMNZD6nPoEHZMe5t0uCYmY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NHU7vyycIFe0HBI4fykD18fkCNWRJLcihiOR6Xb9oRBhD/2MDLRHkuy4YcDM0yitV
	 Q2fTWUGVLzkljeGrVyxnkFu2hSxHaj3Q9Ef6saGv1cppCXizoUXf0w2cNnTPHKcvdF
	 8i/ardEtnZow0qmslyN5HaJAtvfAFkesHcXL6sow=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 17 Jun 2025 15:54:00 +0200
Subject: [PATCH v8 2/4] media: pisp_be: Remove config validation from
 schedule()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-2-e58ae199c17d@ideasonboard.com>
References: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
In-Reply-To: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3083;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=LQpsALkTPotTLV0L5B38pVMNZD6nPoEHZMe5t0uCYmY=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoUXOEe7cRNKLlBfoyNp4m4u6p8xuPVwbfvEjPn
 apV/+o47TWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaFFzhAAKCRByNAaPFqFW
 PNckEACr0tkqemhNUDeWmwwqOg6XrM4nHAm6A1FMlo9IyBTo0B6fPO/frB3qCVVv9UPybKTrSgh
 8GJ4j0yzPfhAyEBYpmNU2/ghXGCttalOPzgC8YU6prLapngYH4LXncVFsGPF19wqHNZk+9R8sBa
 ktooy16Cw6m4wfl5Huv+9YCZIQ7RuSpluTuiWzdOVSV1Iu+d/M02eDEiCrc1eu2A021VTL07TqK
 ZN22ZtJ6rmKIsKJihvYKuAnAufyjUOY7PhzKOcwFUCE4/YvqGni9wuQnnnfnE2jVhKNEVYguXCN
 mhaNqvnez8g6Nw1r4OvVw2TYzMtzkJq8BsZG2lXzwAjqtWKSSMTYLRsAbQ0MrDp3jbMgi1VwDgU
 MEjBJlbf9vMWwc5mH9xp0Hl+0NguN+9Tsn5q68essJCktZ8/FvP5dvWz7tLg5AwBMzC5TtWM3vp
 GhWOAaJHsSUbkkzhHz50Z07G9J52rfNX1FlQ2wmUT7psI5muXik0jTi5f6qxT67gmrh42HkTCvj
 xrGwj8QmbWXoxUoewggDR/uqYna5+4b8hLuTOQDqMMWb3j9NViIHGtHSZrvY/1Tpo5Z2z8FtSWs
 D21ZT9+xdBHBA6xqPQ4JOTBNXbm7D4FPO7Lk1OeHs9Rh9y7AgCPOqH1323BM33QHsHcPKUsn5l9
 aIBenMFybodxJZw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_065417_323827_838CBD04 
X-CRM114-Status: GOOD (  12.95  )
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

The config parameters buffer is already validated in
pisp_be_validate_config() at .buf_prepare() time.

However some of the same validations are also performed at
pispbe_schedule() time. In particular the function checks that:

1) config.num_tiles is valid
2) At least one of the BAYER or RGB input is enabled

The input config validation is already performed in
pisp_be_validate_config() and while job.hw_enables is modified by
pispbe_xlate_addrs(), the function only resets the input masks if

- there is no input buffer available, but pispbe_prepare_job() fails
  before calling pispbe_xlate_addrs() in this case
- bayer_enable is 0, but in this case rgb_enable is valid as guaranteed
  by pisp_be_validate_config()
- only outputs are reset in rgb_enable

For this reasons there is no need to repeat the check at
pispbe_schedule() time.

The num_tiles validation can be moved to pisp_be_validate_config() as
well. As num_tiles is a u32 it can'be be < 0, so change the sanity
check accordingly.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 25 ++++++----------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index b1449245f39436d02c9c710916e2d0605606a327..92c452891d6c2d68aff9aa269c06fa1af77e3885 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -588,24 +588,6 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
 	pispbe->hw_busy = true;
 	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
 
-	if (job.config->num_tiles <= 0 ||
-	    job.config->num_tiles > PISP_BACK_END_NUM_TILES ||
-	    !((job.hw_enables.bayer_enables | job.hw_enables.rgb_enables) &
-	      PISP_BE_BAYER_ENABLE_INPUT)) {
-		/*
-		 * Bad job. We can't let it proceed as it could lock up
-		 * the hardware, or worse!
-		 *
-		 * For now, just force num_tiles to 0, which causes the
-		 * H/W to do something bizarre but survivable. It
-		 * increments (started,done) counters by more than 1,
-		 * but we seem to survive...
-		 */
-		dev_dbg(pispbe->dev, "Bad job: invalid number of tiles: %u\n",
-			job.config->num_tiles);
-		job.config->num_tiles = 0;
-	}
-
 	pispbe_queue_job(pispbe, &job);
 
 	return;
@@ -703,6 +685,13 @@ static int pisp_be_validate_config(struct pispbe_dev *pispbe,
 		return -EIO;
 	}
 
+	if (config->num_tiles == 0 ||
+	    config->num_tiles > PISP_BACK_END_NUM_TILES) {
+		dev_dbg(dev, "%s: Invalid number of tiles: %d\n", __func__,
+			config->num_tiles);
+		return -EINVAL;
+	}
+
 	/* Ensure output config strides and buffer sizes match the V4L2 formats. */
 	fmt = &pispbe->node[TDN_OUTPUT_NODE].format;
 	if (bayer_enables & PISP_BE_BAYER_ENABLE_TDN_OUTPUT) {

-- 
2.49.0


