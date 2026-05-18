Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB31CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zvJibun44EqkPjoc/4cozo+e1BqCFTY+qcZkA5yUxN4=; b=txrXClUtR/Z3uuqriNh7AUW5O4
	LjaEQE7nsQyZcEp31XZ0B+GyfUA+wQXaxeeLi08WFVoOtMpvpK0UsS1Kg5jZ8uGWKqk+bTQV/DMZl
	dSLbdRCzAvtRjVb77Jq1zKW0CaG4Mld3syXKZGXq66VEYhJEZRXw1D2fc31XF7XWZS19niSDfzb59
	N/XSQddljs+A52XQh3LPKkodqdVPqF/Y/2LBjo4xsWJ1BglKd/C2TimrS02gw0JazTKXZ/g9lLrWY
	UGd/IiVbfwtYU8mjMZqNEZheXDWoavjmgJCO3WZBLCS32Ix7abzA7TK3bONyFZkdwkxYmNyb7gVhl
	ajj+hkmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvAD-0000000FCrC-0WWN;
	Mon, 18 May 2026 10:25:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvAB-0000000FCql-1bLQ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 10:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=zvJibun44EqkPjoc/4cozo+e1BqCFTY+qcZkA5yUxN4=; b=V59DCNePwpFrLnr1mL8CrNwlz0
	n8p/ReMfdJD7/ZCQDoxbP28EAIXyQWQr4izaSxnCcIOi/3/yfhybOfclK68LMTuVj8ZgSRijl1A+r
	3omInzJ3MgOu8BRB74/QcdpJX8J8naehmHwLfFCFeGTFZXuGYUblQfX3egUmGhzRWvkWRegPQEF5C
	/qijx88tyrF/zwEaKMHCFlOmvrAQnXY6PXBnzRkpuTK0Z1oONyaBGkWk/ibmZIvVBH4QeGAPCkU8f
	AQUSQHkmwCahPb44S99DdJn8J4HWV1gu4MMSJ/qYvF6AasyzIhUUI9F+2CsC2mucHnvcDJ+4CntVP
	WCHkIAxQ==;
Received: from leonov.paulk.fr ([185.233.101.22])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvA8-0000000AkXE-0d55
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:25:30 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 2C9231F80044
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 10:25:19 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 89BAFB407FC; Mon, 18 May 2026 10:25:18 +0000 (UTC)
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 52013B407E7;
	Mon, 18 May 2026 10:24:52 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 00/16] media: sun6i-csi/isp MC-centric support and cleanups
Date: Mon, 18 May 2026 12:24:35 +0200
Message-ID: <20260518102451.417971-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_112528_600634_B03BA02B 
X-CRM114-Status: GOOD (  10.75  )
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

This series first introduces some fixes and new formats to v4l2 format
info, one of which we need for the sun6i-csi driver. Support for
MC-centric format enumeration is then added, along with cleanups and
improvements for both the sun6i-csi and sun6i-isp drivers.

The first 4 patches are already reviewed and ready to go and are
included here as a reminder that this series depends on them.

Arash Golgol (4):
  media: sun6i-csi: bridge: Use V4L2 subdev active state
  media: sun6i-csi: capture: Implement vidioc_enum_framesizes
  media: sun6i-mipi-csi2: Use V4L2 subdev active state
  media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state

Paul Kocialkowski (12):
  media: v4l2-common: Fix NV15_4L4 format info block height
  media: v4l2-common: Add missing tiled format info block sizes
  media: v4l2-common: Add NV12_16L16 pixel format to v4l2 format info
  media: v4l2-common: Add NV12_32L32 pixel format to v4l2 format info
  media: sun6i-csi: Split format validation to a dedicated helper
  media: sun6i-csi: Add support for MC-centric format enumeration
  media: sun6i-csi: Tidy up and unify coding style
  media: sun6i-mipi-csi2: Fix parenthesis alignment
  media: sun6i-isp: Add dummy params link_validate implementation
  media: sun6i-isp: Use V4L2 subdev active state
  media: sun6i-isp: Add support for MC-centric format enumeration
  media: sun6i-isp: Add support for frame size enumeration

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 153 +++++++---------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 168 +++++++++++++-----
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++-----
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
 .../sun8i_a83t_mipi_csi2.c                    | 113 ++++++------
 .../sun8i_a83t_mipi_csi2.h                    |   2 -
 drivers/media/v4l2-core/v4l2-common.c         |  12 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c |  47 ++++-
 .../media/sunxi/sun6i-isp/sun6i_isp_params.c  |  37 +++-
 .../media/sunxi/sun6i-isp/sun6i_isp_params.h  |   4 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 117 ++++++------
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   7 -
 13 files changed, 437 insertions(+), 341 deletions(-)

-- 
2.54.0


