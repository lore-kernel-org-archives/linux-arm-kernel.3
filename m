Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D39BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 15:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TaUvhDdO+Maqo1aCBynZBzHYvFhLU0Qys957Ro6kYr0=; b=PUzKw1pYDUcDwE
	xCcMD1xD/tf2K3b7dfllS8cmI7ldTxYXuTs7hARZDOF7YibORdJNflFCTO1aJoklyknCbIHULdYrK
	qA1hU8GJUiD+1ulgs08I/VHzXiT3TvsJzWQLGsHVBEuBnYE0vH82/VM57KtYmygCvMkzSjxpq8Zyy
	M9KmbSX8zodX3h+r++3Zxu59KsdK3t4DbZa5h098kAs/Ho0pwUQPZEm6bfSAqzG1H7RYdNzYKLucG
	5ZDAAbj99vfJdenO/W19pIM/JpAvLGgdCZHigM79qmfnlaTIDpDIt0gfZKjk3wt9rn10zgWQgDmy0
	iGAZE1Qo7oq4KiyFnI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfI7-0000000DuXL-0QRq;
	Wed, 05 Nov 2025 15:19:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfI4-0000000DuVf-14b7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 15:19:17 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vGfHy-0002IK-1b; Wed, 05 Nov 2025 16:19:10 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 0/2] media: staging: imx: fix multiple video input
Date: Wed, 05 Nov 2025 16:18:48 +0100
Message-Id: <20251105-media-imx-fixes-v1-0-99e48b4f5cbc@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANhqC2kC/x3LQQqAIBBA0avIrBtQQYSuEi1Mx5qFFgohiHdPW
 j4+v0OlwlRhFR0KvVz5zhNqEeAvl09CDtOgpTZKSYOJAjvk1DByo4rOU7TW28MpDfN6Cv1hTts
 +xge4w6S6YQAAAA==
X-Change-ID: 20251105-media-imx-fixes-acef77c7ba12
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
 Michael Tretter <michael.tretter@pengutronix.de>, 
 Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_071916_298839_1521CB81 
X-CRM114-Status: GOOD (  12.34  )
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

If the IMX media pipeline is configured to receive multiple video
inputs, the second input stream may be broken on start. This happens if
the IMX CSI hardware has to be reconfigured for the second stream, while
the first stream is already running.

The IMX CSI driver configures the IMX CSI in the link_validate callback.
The media pipeline is only validated on the first start. Thus, any later
start of the media pipeline skips the validation and directly starts
streaming. This may leave the hardware in an inconsistent state compared
to the driver configuration. Moving the hardware configuration to the
stream start to make sure that the hardware is configured correctly.

Patch 1 removes the caching of the upstream mbus_config in
csi_link_validate and explicitly request the mbus_config in csi_start,
to get rid of this implicit dependency.

Patch 2 actually moves the hardware register setting from
csi_link_validate to csi_start to fix the skipped hardware
reconfiguration.

Signed-off-by: Michael Tretter <michael.tretter@pengutronix.de>
---
Michael Tretter (2):
      media: staging: imx: request mbus_config in csi_start
      media: staging: imx: configure src_mux in csi_start

 drivers/staging/media/imx/imx-media-csi.c | 84 ++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 36 deletions(-)
---
base-commit: 27afd6e066cfd80ddbe22a4a11b99174ac89cced
change-id: 20251105-media-imx-fixes-acef77c7ba12

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>


