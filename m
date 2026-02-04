Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E04E95389
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 11:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2UaIeUuJukaRu09s8kWOnUnxj90ShlYs8SjpMhbGueA=; b=uFoAIih1uz2/3uNQnuD1eKLCay
	sWZupLdLJJ4SQmes6YpirWO/O3embF+Aw2BRh34dWYf/DqRZ8WHnA1YGX28lOQXtf4KOgx3DGIy2F
	asi1AY8c1GQJGIXUyY9Ap2RfCkm4LXoCCLO4mv7gvETA57kp0DAk+0GvyMQnToa1E7wi6EscvKW0d
	xMFjsef017gCRkkS/T5JbOQ0WbMdjh+JkcQq8pQ1CiqGIVH8y6tYTy7v5XSa89Ur5A2+/4AEg+W8a
	fgj3sTZInmRKbPMGNJY4iTIMB4sFRWgkH8yqjILwaH51IMwrwgJ+1WOIFseUilN4Zqq4AaqNiigkM
	YQCqj//Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnb0Z-00000008M0o-2Nu6;
	Wed, 04 Feb 2026 11:25:19 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnb0V-00000008Lyn-3C45;
	Wed, 04 Feb 2026 11:25:17 +0000
Received: from t16.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B489BC79;
	Wed,  4 Feb 2026 12:24:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770204269;
	bh=5Nan95yq+Wog55Wh8dTymZ5+cZk1zyjYOzCC7cyupi8=;
	h=From:To:Cc:Subject:Date:From;
	b=aAWLW527Qxg/Z/BwFk7rxJ6ga0kQ/4zc6JLiH7hLKjXo+wNc1JorfTJ6ZXbkNIFNq
	 uNsSv2ZcyzEJ7MJdbAXuf7HFE/GnAGSqZvvKFmTWXeBrKvrAeIo2Yv/d81AXVz4bqn
	 6xOdFi8JkTl4Kwboj/ayO4flF4Bg59x/RKMpn94M=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v1 0/6] media: rkisp1: Add YUV bypass support for rkisp1 
Date: Wed,  4 Feb 2026 11:25:00 +0000
Message-ID: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_032516_229299_B9173005 
X-CRM114-Status: GOOD (  12.61  )
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

Hi all,

"Smart" cameras that do all image processing on the camera module itself
may not have the ability to output image data in RAW formats. These
cameras would require the use of the ISI, which is sometimes not
included in the hardware.

In hotplug systems, it is also impossible to switch between the ISP and
ISI at runtime, meaning if a media pipeline was set up between the
sensor and the rkisp1 ISP capture device, it would not be possible to
switch from a sensor supporting RAW formats to one outputting only YUV.

Thankfully, the ISP can be configured to allow the incoming YUV stream
to "bypass" the ISP blocks, allowing these sensors to be used. It
bypasses all ISP blocks and passes through the resizer, with the input
image data being presented at the output of the ISP to be captured.

In bypass mode, stats buffers are not provided by the ISP.

This series adds support for "YUV bypass", allowing sensors which only
output YUV streams to be used through the rkisp1.

Tested on: v6.18
Compile-tested on: media/next

Isaac Scott (6):
  media: rkisp1-resizer: Add YUV source formats to resizer
  media: rkisp1-isp: Add in_bypass flag for YUV bypass
  media: rkisp1-isp: Add target_format
  media: rkisp1-isp: Propagate sink -> source format in YUV passthough
  media: rkisp1: Give buffers back instead of dropping in bypass mode
  media: rkisp1: Treat 8 bus width and 16 bus width formats the same

 .../platform/rockchip/rkisp1/rkisp1-capture.c |  5 ++++
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 26 ++++++++++++++-----
 .../platform/rockchip/rkisp1/rkisp1-resizer.c | 15 +++++++++++
 4 files changed, 40 insertions(+), 7 deletions(-)

-- 
2.43.0


