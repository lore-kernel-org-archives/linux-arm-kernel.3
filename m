Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086D6C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JLIiyJlZz3ozzC+5LFb/CVMfu25no9F5QurFvre73RQ=; b=nxePvp60ENvpw7
	9qV9zNIm+7EOKVZR8QowieK1dHlqK8FOpLlTWS4n2VSQ2RBYegtAyE4rt/mUGMV0iYZMlVE5cAuuB
	+zPZm8JGOGfS2v3258AWnGcYDuU1ZOv5DIz+S08lgDXh80ckC7Mp4oJ6o8PYPULiSAiZn0YWPP3W8
	hIQNH95PSM9jGy3APlC5ZYpUNX2CJIE4zO07+elu+1Uf2BqYgxSmHFfvGaFdT/tV4eACKQX2acknF
	2DHyNDn3hGusISMEYS0vq5CYsDz0oZid67DVTfOySZ0Zqja60vm5pfC7YhqRLmchEYsJyVaBZTNn3
	yOCoZDOxI/qfXM+Y9ZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUDT-00000004Emk-0XWs;
	Fri, 23 May 2025 15:21:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIU6Z-00000004DTI-2jAu;
	Fri, 23 May 2025 15:14:41 +0000
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:a882:21a2:2327:ac4f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A4BF346;
	Fri, 23 May 2025 17:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748013251;
	bh=agOJvT2/i6EmhSZhAs95f9ecZVtjJRDEFx8kLbUoK5w=;
	h=From:Subject:Date:To:Cc:From;
	b=fXJ7NTFqAcFttwQE77Ek19k2Gg0g1T6AKnCdXJna7q06cNpUuN0fLt3d2hI4x7CJo
	 tY6UEYwxM8pTKqcYwQImwBGI1lu+IwaaIugEEOPdlqz20h8pcJpw8vXwFEhABKUwlW
	 YeiweFYKxxVio7H9lflBDttID1QmEUlMTbMSZYKw=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Subject: [PATCH v3 0/3] media: rkisp1: Add
 RKISP1_CID_SUPPORTED_PARAMS_BLOCKS ctrl and WDR support
Date: Fri, 23 May 2025 17:14:29 +0200
Message-Id: <20250523-supported-params-and-wdr-v3-0-7283b8536694@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANWQMGgC/43OQQ6CMBCF4auYrh1Sh9aoK+9hXIx0kEZpmymgh
 nB3wZWJG5f/4n15o8osnrM6rEYlPPjsY5ijXK9U1VC4Mng3t0KNVlssIfcpRenYQSKhNgMFBw8
 nsCltuTcXxq0zap4n4do/P/TpPHctsYWuEaZvEDdW740pjNbabAEhd1xTKG73/nr0jinHcIkkr
 qhiu7CNz12U1+fwgAv+x7cBQYOl3c5VZGuD+pc+T9P0BsdqknMOAQAA
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Stefan Klug <stefan.klug@ideasonboard.com>, 
 Paul Elder <paul.elder@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_081439_819272_A986A2C7 
X-CRM114-Status: GOOD (  11.26  )
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

This series adds RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control to query the
parameters blocks that are supported by the current kernel on the
current hardware. This is required to be able to enable/disable the
corresponding algorithms in user space without relying solely on the
kernel version.

In addition to that it includes the WDR patch by Jai which is already in v5 and
was reviewed here:
https://lore.kernel.org/linux-media/20250521231355.GN12514@pendragon.ideasonboard.com/

Version 2 of this series drops the unnecessary initial cleanup patch.
Patch 1 was updated and has a local changelog. Patch 2 is unmodified.

Version 3 splits off the first commit again as it was considered worth
an own patch. Patch 2 was improved a bit based on review comments (see
local changelog).

---
Jai Luthra (1):
      media: rockchip: rkisp1: Add support for Wide Dynamic Range

Stefan Klug (2):
      media: rkisp1: Properly handle result of rkisp1_params_init_vb2_queue()
      media: rkisp1: Add RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control

 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   2 +
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 150 ++++++++++++++++++++-
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |  99 ++++----------
 include/uapi/linux/rkisp1-config.h                 | 103 ++++++++++++++
 include/uapi/linux/v4l2-controls.h                 |   6 +
 5 files changed, 282 insertions(+), 78 deletions(-)
---
base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
change-id: 20250523-supported-params-and-wdr-135394be26d4

Best regards,
-- 
Stefan Klug <stefan.klug@ideasonboard.com>


