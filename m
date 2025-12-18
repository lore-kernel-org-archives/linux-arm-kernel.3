Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9FCD68BF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 09:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqDz70xrwbH2Zuxo+FeUrD+FdmO1g5h2F2RrD5lymF4=; b=uvfUfj7T3Sj384x6FjYzFmKepL
	1ansRkqSAtaj+CrFty8bzrH1eUsSl1sf3y5K5bAw+xctbfUtKIL+ud/3qPkWr0iXTLRmCLB2MNsRQ
	HZujI6nuescz+OeOSuVUq2M79reGMZ2P1054dDEgTGYEplS9+GVy9m5W+4FharUO9LRFX/1xxOn8x
	zWOhmZXUOM8Lw0Hgw8fHqMGWUi1o3FQXM2QbzoKVzNrbzxYw25DV5jOmlJwnQf/YdpHDJsVRf5rjv
	UNH3TCShNBaPQWLvVsgsJvdz+wzvwtLM7TUUWHt7gfzSyHSwq+rHhcycOSWNCjUIxPOH37FW4qTkz
	CDCTnxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAF5-000000088e8-21lH;
	Thu, 18 Dec 2025 09:24:15 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAEw-000000088aW-45n3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 09:24:08 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vWAEo-0002J4-KB; Thu, 18 Dec 2025 10:23:58 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Thu, 18 Dec 2025 10:23:51 +0100
Subject: [PATCH v2 3/3] media: imx-csi: use media_pad_is_streaming helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-media-imx-cleanup-v2-3-9e3e3c269f7f@pengutronix.de>
References: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
In-Reply-To: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-staging@lists.linux.dev, Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_012407_038724_D549C2C2 
X-CRM114-Status: GOOD (  11.22  )
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

The media_pad_is_streaming() helper is explicitly intended to check
whether a pad has been started with media_pipeline_start(). Use it
instead of relying on the implicit assumption that a pad with a
pipeline is streaming.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- Update commit message as suggested by Frank Li
---
 drivers/staging/media/imx/imx-media-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index bd9af147a801..1a2e5e40c99c 100644
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


