Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3A3CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8gSrlWZZB1Zip76MzC2e9lNbcSF7eMp1Btfkx+qUvrU=; b=iR+tmykULf1aTh
	5Cd3X49GUeIdL/aAzQMvf8q63tHkHx9nWA/X+BZu891GzrWCJWJRM/DUForlWoKZ0e2HPN3g0fUq2
	eTZ8ADY3YQtxNg1s13Wn305nTZbeBeC214X8xaylVFvb4vY9W8Mt0Sy2QeRbHbaxpPSXBBtkAMx8e
	dYO9Ez0tcdsnJ1iPnAE+JfVrqds7SxtGrL8ldv9foAuFImep6MKbF4+hvtrLoiutht1JXOzK5k/3b
	2gfOk89oiB5mf0TM/TnKkboIvrPS6/c6owkzpDTD+kO4+6RJFJ18NjeGD1T7Qb6KWV2Hz4w/lbjeD
	lcgN3OsTgLJMGSTVUpYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy96S-00000004Hmp-022Z;
	Mon, 15 Sep 2025 13:18:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy96P-00000004Hl9-3Lzk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 13:18:43 +0000
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E43D11744;
	Mon, 15 Sep 2025 15:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757942240;
	bh=K168Nz0/cSOMcDV5Ibjm1ORQDmfgPC7IGoVfDOOSL+o=;
	h=From:Subject:Date:To:Cc:From;
	b=oPi9ooxIybJfeENFQJOqbO+uh9kdSW9cB4wvM25ugmvLs02/B/0MVG1zAyEN+P4Cx
	 QFJySqYsAu3RSOOW9DWY9XKdj6DBkyFFVHjWths/W3RSoLJKl69++RXsIo6EHPXDPp
	 Ox5B/qNAvS2bS8lvGMlgEQStM+oi3nrqGr4zGOKU=
From: Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v3 0/3] media: imx-mipi-csis: Get the number of active
 lanes from mbus_config
Date: Mon, 15 Sep 2025 14:18:32 +0100
Message-Id: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACgSyGgC/03MTQ6CMBBA4auYrh3SHwroynsYF0M7wCTSmrYSE
 8LdbVy5/Bbv7SJTYsrietpFoo0zx1BhzifhFgwzAftqoaW28qIsrOM7g4th4hnQFd4Inhgog2r
 R28H1qIZO1PyVaOLPb31/VE8prlCWRPg3lEZJrVvTKNsZq3tQwBnRNdnFUm7sCXMMY8TkGxdXc
 Rxfb9mITrIAAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>, Isaac Scott <isaac.scott@ideasonboard.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_061841_981245_2089E3D0 
X-CRM114-Status: GOOD (  15.80  )
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

It is possible that the number of desired active MIPI CSI2 data lanes
does not match the maximum listed in device tree. Add a helper function
to v4l2_common that calls the get_mbus_config op to get the number of
actively used data lanes in drivers that support it.

Compare it to the number of lanes configured in device tree, and if its
invalid, use the number present in device tree.

This series also uses the helper in imx-mipi-csis driver to set the
currently configured num_data_lanes, while keeping track of the number
of data lanes set in device tree to ensure we can still use all possible
lanes if we need to, and the upstream subdev driver requests them.

Tested on v6.15, compile tested on v6.17-rc6.

---------

Changes v2 -> v3:

- Rename dt_lanes to max_data_lanes
- Remove check for < 0 on unsigned int max_data_lanes in
  v4l2_get_active_data_lanes()
- Added comment to explain that mbus_config is expected to be zeroed at
  init in drivers implementing get_mbus_config subdev pad op
- Wrapped signature in header file and source for
  v4l2_get_active_data_lanes()
- Added kernel-doc documentation for v4l2_get_active_data_lanes()
- Added debug message to indicate an invalid number of active lanes
- Changed csis->max_data_lanes to csis->num_data_lanes
- Changed uses of csis->bus.num_data_lanes to csis->num_data_lanes where
  appropriate to make csis->bus immutable after probe

Changes v1 -> v2:

- Added helper function to get active data lanes in v4l2-common
- Store the maximum data lanes possible, as configured in device tree
- Added media: prefix to commit titles

Isaac Scott (3):
  media: v4l: Add helper to get number of active lanes via a pad
  media: imx-mipi-csis: Store the number of data_lanes configured in dt
  media: imx-mipi-csis: Get number of active lanes via mbus_config

 drivers/media/platform/nxp/imx-mipi-csis.c |  8 ++++++-
 drivers/media/v4l2-core/v4l2-common.c      | 25 ++++++++++++++++++++++
 include/media/v4l2-common.h                |  1 +
 3 files changed, 33 insertions(+), 1 deletion(-)

--
2.43.0

---
Isaac Scott (3):
      media: v4l: Add helper to get number of active lanes via a pad
      media: imx-mipi-csis: Store the number of data_lanes configured in dt
      media: imx-mipi-csis: Get number of active lanes via mbus_config

 drivers/media/platform/nxp/imx-mipi-csis.c | 17 +++++++++++-----
 drivers/media/v4l2-core/v4l2-common.c      | 32 ++++++++++++++++++++++++++++++
 include/media/v4l2-common.h                | 21 ++++++++++++++++++++
 3 files changed, 65 insertions(+), 5 deletions(-)
---
base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
change-id: 20250915-mbus-config-active-lanes-14ad58c7a186

Best regards,
-- 
Isaac Scott <isaac.scott@ideasonboard.com>


