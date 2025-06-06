Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16B0C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 10:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4qcksG7kBfJfRp18aWDNsqzcVUHxFO+EPP7YXzEuMs=; b=RbeuWhASGNTcfKqu94MPWpDq1k
	ovFkoUTJemrgihYEMXbIysT8/RnDIYJF++fPvJk2pqX2eL/DhFEUyYisOvDKo74Tgu5PILc584Wix
	StecAEyH+AFD9TJ0QhkumN2M30bmLMzz7WDJ6bj8nFKln/F48U2UF/r2bThkxnaucm2i3GTfIX6AL
	qfxYoZuTmcEGdugSiSuG9/0PxOiPmcfu3AaMMEEk1dmgnsjeZHKUYaYi//ny7DS8jUS9hkkh1FN4m
	jI2pgCo3eSGb6kTgvYAUu65sTrg55aP/+2ZqroJcfdI3gXgKlMduUvtVpvu5xnbfphUNUPC0MDG6H
	+Pv+BA5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUZn-000000004cY-2s5h;
	Fri, 06 Jun 2025 10:45:31 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUKQ-000000002tX-13sN;
	Fri, 06 Jun 2025 10:29:40 +0000
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93FEB1449;
	Fri,  6 Jun 2025 12:29:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749205768;
	bh=9MM74xoBnZjeb+7dlcAgIXr4ZI2P++CHv1REUpu+GeY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=er7gwa/tSh7C4H/PxSZsAhdzkpBC6d9YzX0Xc1X+dcVMz4NsSoRAqbo7uSCi9gPRO
	 ujHcJvb+EYg2cT8HfW3Tqwa6qjZtK5nvIfBofSR1Iy5V51YdSdnV/X1tc63Q9WW9Hd
	 nDT5vSrL4edUEMVsQIrpRxNrX6Hr2Hv5APrL442o=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 06 Jun 2025 12:29:22 +0200
Subject: [PATCH v7 2/4] media: pisp_be: Remove config validation from
 schedule()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-2-46169f0622b7@ideasonboard.com>
References: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
In-Reply-To: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
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
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2974;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=9MM74xoBnZjeb+7dlcAgIXr4ZI2P++CHv1REUpu+GeY=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoQsMJrEbciS8x2BHdIWih/2w10/v2vY3ocpNYy
 +Fd9/iyT8KJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaELDCQAKCRByNAaPFqFW
 PGTXD/0UhSC7RVmTpo7+6azLUS7zBmkMT5p/G08Lu2Wz9NEezo5GvXp2P4dx3ruWpU6OowFF/1W
 tPjwlj4rC1K1ZG0ZSt1xQFsmr76YjKRUrAHJIsaaKoYYnskRlOKZ2DereCPP2XePKeA7EGp9/iZ
 bx9uNfBMbyPvProqMdb65iuiwawNCXQMOUxjGabt5Wi0m0cT9WiEYeULiJE7xDwgRg461bIh1rE
 n5CVOC+crpNPBCsUa9ZEQjvKJSCu9sL1hBYupMDV/U6DE39oeNyKbgwZjGxtY6lX+D2HI691YHP
 snqwIL+fk52+jAr2PJq6ra0waUAEtQmNFVWD5i+3C98KJ+fbZNIfxA77trkJwCjnoaiQiCHM579
 2Msc4h0secTqAh+4K0AE/HJR4BkKK3ifXaXnfu9boznO0KCYlYFIpOoHA5ZoVfpRHm/mYBiI/M/
 Wow6KHFqzkaFB14cd/STuDAV2CVB9mePsvcyl9x4Tz0FP0tY8YTe3FyaBmkI32S1rtnjjqKrTh8
 wPnH6hR9iEsmvqhNShfZ57smIAPazXg/+eSZTTiS3bBhN9Tf85ruh8WBD1wHd2u6dqoOSqN0Tul
 Nj8Dqbm0WyPR3xNtvBSCpokm4Ek1Hk0Dnesf4upKXwH8WCxTbEksz9HUFDpXTEa3S0G6/a1BhVw
 2hXbLEgfTTTgQGA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_032938_432626_0A075A7A 
X-CRM114-Status: GOOD (  13.16  )
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

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 25 ++++++----------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index b1449245f394..92c452891d6c 100644
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


