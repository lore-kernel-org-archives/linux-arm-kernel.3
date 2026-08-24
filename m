Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5FEC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 06:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B1TIKoPh5y2uqIH+yMpH/vOvj7YbPPPVe5tfJJfLRaE=; b=H6L1lcCvy4z8hB
	6aQY7VkzfL3Xyz12eVBGrposFS2cKyIZAnYD8Y9gwXtGLhwvnp7yit3dZtIry/cWXIEmcE5jQa69O
	1Dt+VqeWw92hnksOLDzVtAdLkCjIaMQcQfN4JyR2Jz2jysS41gHFqNMoBNDmOxm6qsALPMwCpuShC
	qlgrdRE3wwqTmHh3/rWF85WmiSWLfUoenVAv8wohfP/lUS6/P5qq/WLjtUAsxkElb8TjoTjqqooeY
	+Q9/lpndQGgFH4Yufp9iOyIZhIRDqeGpe5XBN9WghcgI7aWub9UsZq+CcpJh9R9R4cFNwq9pOhorj
	IikTzscFWFRvi+a5v31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyOLU-0000000G0Zv-335A;
	Mon, 24 Aug 2026 06:39:48 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyOLM-0000000G0WL-14cA;
	Mon, 24 Aug 2026 06:39:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C1DEF200F4F;
	Mon, 24 Aug 2026 08:39:35 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wyOLH-0033ic-2A;
	Mon, 24 Aug 2026 08:39:35 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wyOLH-0000000DClv-22qh;
	Mon, 24 Aug 2026 08:39:35 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 0/3] media: verisilicon: Fix error paths in hantro drivers
Date: Mon, 24 Aug 2026 08:39:33 +0200
Message-Id: <20260824-rk3588-jpegdec-v1-0-180a30a2852d@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACXni2oC/3XMQQ6CMBCF4auQWVtDKeKUlfcwLEw7LaNJIS0SD
 Ondrexd/i953w6JIlOCvtoh0sqJp1BCniow4yN4EmxLQ1M3XY1Si/hSF0TxnMlbMgI1SeNag6g
 RymmO5Hg7wPtQeuS0TPFz+Kv8rX+pVYpaKGWvrbFOddrcZgr+vcQp8Ha2BEPO+Qs7L4PfsQAAA
 A==
X-Change-ID: 20260819-rk3588-jpegdec-89e1cf4c8898
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787553575; l=1639;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=Yr7A6reUyyDCMEF4I5SVOxrskAXy24WpmyQEjcaemrw=;
 b=Z9lYl9pt+cU57E8Z3IdiQ6jOYE0qMgAAci9SQfGPbifR8CQ9ds8PSD++6ezUflWNP05L7a0bN
 H8yQOMUwqeHBbBx2gMkoruwEo5h9TggfH3AxjaTZbSyOLsHkSdChLD2
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_233940_458288_D1355884 
X-CRM114-Status: GOOD (  10.34  )
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

This contains the Hantro error path patches previously sent as
part of "media: verisilicon: Add RK3588 VPU720 JPEG decoder" [1] as a
separate series. As the Rockchip JPEG decoder turned out to be no Hantro
compatible hardware at all I'll continue that as another series. This
series now contains the useful stuff from [1] with Nicolas comments to
the first patch addressed.

[1] https://lore.kernel.org/all/20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de/

---
Sascha Hauer (3):
      media: verisilicon: Fix the cleanup when a codec ->run() fails
      media: verisilicon: Complete the request on the ->run() error paths
      media: verisilicon: Allow the EOS event to be subscribed

 drivers/media/platform/verisilicon/hantro_drv.c    | 35 ++++++++++++++++++++--
 .../platform/verisilicon/hantro_g1_h264_dec.c      |  4 ++-
 .../media/platform/verisilicon/hantro_g1_vp8_dec.c |  4 ++-
 .../platform/verisilicon/hantro_g2_hevc_dec.c      |  9 ++++--
 .../media/platform/verisilicon/hantro_g2_vp9_dec.c |  2 +-
 drivers/media/platform/verisilicon/hantro_hw.h     |  1 +
 drivers/media/platform/verisilicon/hantro_v4l2.c   | 13 +++++++-
 .../verisilicon/rockchip_vpu2_hw_h264_dec.c        |  4 ++-
 .../verisilicon/rockchip_vpu2_hw_jpeg_enc.c        |  4 ++-
 .../verisilicon/rockchip_vpu2_hw_vp8_dec.c         |  4 ++-
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       |  3 +-
 11 files changed, 70 insertions(+), 13 deletions(-)
---
base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
change-id: 20260819-rk3588-jpegdec-89e1cf4c8898

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


