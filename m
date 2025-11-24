Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559B4CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 03:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mc6O4SdjGVe0glDr2dRtnu/v/hHIP/v2O9TVaWZr76U=; b=N37ncCFRp7/ar5+wWgyZBPWcEx
	5KTlWiZW8Vu3RY1izpO86q/kMFNEH/kxDBAEAUqvqHOlE7ucRxeAufZQuVRAbe4Q+do5f3qLQwf+i
	fK+KVrJYas1vAIt3eL/Kht2VepAjO2opfRksxqn3qOCtOgBbNwR9VKLJywmcfmyPzavgaei4Okjy8
	aWHBi1n9/0zCjNcPND/uRilHWJqsUkB5C1osR8BvFP0gMNktjtn9IdvNWlmvy/miRZack7St7119f
	ktNa7MXWYRedCDj7M6d57HEMnhwBzq+nPqV6CITTVVu0yrkbO5oKgQM/+AawtJnBW2pUHGcXS3Bps
	FVkAgfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNMta-0000000B12r-4C7F;
	Mon, 24 Nov 2025 03:05:43 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNMtY-0000000B12O-07hn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 03:05:41 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 24 Nov
 2025 11:05:30 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 24 Nov 2025 11:05:30 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
Date: Mon, 24 Nov 2025 11:05:14 +0800
Subject: [PATCH] media: aspeed: Fix dram hang at res-change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251124-video_dram_reset-v1-1-9d37229e4ec5@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAGnLI2kC/x3MQQqAIBBA0avErBNSs6CrRITlWLMoYwwJwrsnL
 d/i/xciMmGEoXqBMVGkcBbIuoJ1t+eGglwxqEYZKVUrEjkMs2N7zIwRb7EaLX23WNNrDyW7GD0
 9/3Kccv4AB0H6jmIAAAA=
X-Change-ID: 20251124-video_dram_reset-c531f6ba573f
To: Eddie James <eajames@linux.ibm.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Jammy Huang <jammy_huang@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763953530; l=3275;
 i=jammy_huang@aspeedtech.com; s=20251124; h=from:subject:message-id;
 bh=T6tPkI8Yhq/QCiReLdboMNyc54/4lLjHBMvqDCJv39c=;
 b=eLjDgw5bFeCqwi/if6MHl7scB8sgk6NJB2zQCtHChWUuSG7CfiFUfK7iM21/k5xMbau7Yqt2i
 EqdhlEqPRi6BjXdvgWfAM/l/O1kQmhA1OYr/dMLO9HPhxxrSpxJPXO8
X-Developer-Key: i=jammy_huang@aspeedtech.com; a=ed25519;
 pk=E5YwijeJZZcuDR6srvwNlXrNHvLxwipUg3Mb/xxUF9o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_190540_079253_9D621C7D 
X-CRM114-Status: GOOD (  14.72  )
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

Dram hang could happen in the steps below:
1. start capture/compression
2. out-of-lock watchdog raise irq because of res-change.
3. aspeed_video_irq_res_change do clk-off

At step3, capture/compression could be not accomplished yet. If clk-off
in the middle of video operation, dram controller could hang at ast2500.

Use reset rather than clk-off/on to avoid this problem.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
On Aspeed KVM testing, we found it could lead to dram-hang if
res-change. Although the issue rarely happens, the impact is serious.

To avoid this issue, we use reset only rathar than clk-off/on in
res-change to avoid this issue.
---
 drivers/media/platform/aspeed/aspeed-video.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index b83e432452..41cb96f601 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -26,6 +26,7 @@
 #include <linux/workqueue.h>
 #include <linux/debugfs.h>
 #include <linux/ktime.h>
+#include <linux/reset.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 #include <media/v4l2-ctrls.h>
@@ -310,6 +311,7 @@ struct aspeed_video {
 	void __iomem *base;
 	struct clk *eclk;
 	struct clk *vclk;
+	struct reset_control *reset;
 
 	struct device *dev;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -720,6 +722,13 @@ static void aspeed_video_on(struct aspeed_video *video)
 	set_bit(VIDEO_CLOCKS_ON, &video->flags);
 }
 
+static void aspeed_video_reset(struct aspeed_video *v)
+{
+	reset_control_assert(v->reset);
+	usleep_range(100, 150);
+	reset_control_deassert(v->reset);
+}
+
 static void aspeed_video_bufs_done(struct aspeed_video *video,
 				   enum vb2_buffer_state state)
 {
@@ -742,7 +751,9 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
 
 	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
 
-	aspeed_video_off(video);
+	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
+	aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
+	aspeed_video_reset(video);
 	aspeed_video_bufs_done(video, VB2_BUF_STATE_ERROR);
 
 	schedule_delayed_work(&video->res_work, delay);
@@ -1984,8 +1995,7 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
 		 * Need to force stop any DMA and try and get HW into a good
 		 * state for future calls to start streaming again.
 		 */
-		aspeed_video_off(video);
-		aspeed_video_on(video);
+		aspeed_video_reset(video);
 
 		aspeed_video_init_regs(video);
 
@@ -2230,6 +2240,12 @@ static int aspeed_video_init(struct aspeed_video *video)
 	}
 	dev_info(video->dev, "irq %d\n", irq);
 
+	video->reset = devm_reset_control_get(dev, NULL);
+	if (IS_ERR(video->reset)) {
+		dev_err(dev, "Unable to get reset\n");
+		return PTR_ERR(video->reset);
+	}
+
 	video->eclk = devm_clk_get(dev, "eclk");
 	if (IS_ERR(video->eclk)) {
 		dev_err(dev, "Unable to get ECLK\n");

---
base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
change-id: 20251124-video_dram_reset-c531f6ba573f

Best regards,
-- 
Jammy Huang <jammy_huang@aspeedtech.com>


