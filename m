Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3598CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 10:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChviDbhUfCmoDYToKi0u7IDUGqco1S+gE4cgdACQ2Mg=; b=tzsQqhvJ269dY3A+YviNQ89LYj
	11Hu4sdyjWh+IjCtElTNgr4IG77eICBliR7px2J8VN+1gotyhkWrln0RHLvO0zvVS5lCX/o7vQ5aw
	kD89/gRVCWPTSOpwudWMaaK1ymcxVrW2y1NSsOiVu8DBE3T8bZ6Ijs1nSIy3Im1NTSnilgITrXquv
	7bOTbJAe62LzAZibij2kEplLj1vc9l5K9u3k/gX0aRt5OzNIsxLpS9VH9/aTOigFm1WNvvmob393o
	kl1G02mVQbNLG2HaPQxh/8Q7uZXm17pvVSD2pxwPvTm3PxNHaXOfotH11GTCRFa7zK1rxxsx/7ivV
	ESShOkDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJWU-0000000H3m1-3O7c;
	Fri, 07 Nov 2025 10:16:50 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJWQ-0000000H3hW-1701
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 10:16:47 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vHJWH-0003HZ-Nv; Fri, 07 Nov 2025 11:16:37 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Fri, 07 Nov 2025 11:16:35 +0100
Subject: [PATCH 3/3] media: imx-csi: use media_pad_is_streaming helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-media-imx-cleanup-v1-3-f82a693c28f4@pengutronix.de>
References: <20251107-media-imx-cleanup-v1-0-f82a693c28f4@pengutronix.de>
In-Reply-To: <20251107-media-imx-cleanup-v1-0-f82a693c28f4@pengutronix.de>
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_021646_306796_FFFA388B 
X-CRM114-Status: GOOD (  11.11  )
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

The media_pad_is_streaming helper is explicitly for checking, if a pad
has been started with media_pipeline_start. Use it instead of relying on
the implicit knowledge, that a pad that has a pipeline is streaming.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/staging/media/imx/imx-media-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 6d69f69c16c1..4ea9b3fc59d0 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -774,7 +774,7 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
 			__media_pipeline_stop(pad);
 	} else {
 		v4l2_subdev_call(sd, video, s_stream, 0);
-		if (media_pad_pipeline(pad))
+		if (media_pad_is_streaming(pad))
 			__media_pipeline_stop(pad);
 	}
 

-- 
2.47.3


