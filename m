Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6155ACAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OlWbPM5+AqpAJDET2AiwmC2DT3Tbaw9rbHCLd+SLA4M=; b=48apHpxfYxXaql
	icwoliiQ3KLrrJI8xyshpcnCrgPbKnFNJc1TuHiItOpu7Nag1ib0wqhMwWp0czteLMUjmjjlp/OFX
	gFTFyk978L+N8el/HPRkXoDlXMGB3xmOEpLs6FV1tTgWfCOvfWImOn8yusAPU1MKL7FfKXuL9jun6
	dfsNYLJhY6zmN2emSh29SEz2gS9+js7HxisC8snSMfOnqtY94/7i5E5MZQipZiSKgmYem0TPXITTK
	dkGqkiSJSRnBRngiMp6MO52zIxbnGVMicwTg7v7+f+ohSmcXSYkPfgdDypU4PihIS6gcBnd791GZ5
	KWh94bYiXyej3MzEDYHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oJy-0000000AszD-0yFv;
	Thu, 25 Sep 2025 15:55:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oJf-0000000AsZA-1wgw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:55:33 +0000
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A199C1129;
	Thu, 25 Sep 2025 17:54:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758815641;
	bh=0ASisa2QCpY4l16afQHZBqZmcpyhe0KCgNcO9tJeOGU=;
	h=From:Subject:Date:To:Cc:From;
	b=wcJBW7zeIqgQbrienKha/4I+rYetMbftwZF0xnM0mKxi7yIVL20dbJrxWr0tgsQ6q
	 BHiLky86k2+TIE38E0FE48mF29tH5RJV40Qfpm7b2MvYX69rdYkqk7t6IGh4XR02jL
	 dYtG7N6iayY0wZRI7nsxlZoFsDv1A/k4P9hkWL88=
From: Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v4 0/4] media: imx-mipi-csis: Get the number of active
 lanes from mbus_config
Date: Thu, 25 Sep 2025 16:54:25 +0100
Message-Id: <20250925-active-data-lanes-v4-0-8b54e3d5af6c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALFl1WgC/x3MQQqAIBBA0avIrBsQ0YVdJVpMOdZAWKhEEN49a
 fkW/79QOAsXGNULmW8pcqYOOyhYd0obo4RuMNo47Y1DWqvcjIEq4UGJCy4ueG9j1MYS9O7KHOX
 5n9Pc2gcWWSs0YwAAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Isaac Scott <isaac.scott@ideasonboard.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_085531_642587_9097339A 
X-CRM114-Status: GOOD (  14.85  )
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

Tested on v6.15, compile tested on media/next.

---------

Changes v3 -> v4:

- Updated base tree to media/next
- Used local 'lanes' variable consistently in
  v4l2_get_active_data_lanes()
- Removed device tree references in documentation
- Made comment a single line
- Collected tag for patch 1/4
- Removed unnecessary num_data_lanes assignments in async_register in
  imx-mipi-csis
- Removed some debug print changes
- Checked return value of v4l2_get_active_data_lanes() before assignment
  to csis->num_data_lanes
- Added patch to move redundant debug print in mipi_csis_probe()

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

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
Isaac Scott (4):
      media: v4l: Add helper to get number of active lanes via a pad
      media: imx-mipi-csis: Move redundant debug print in probe
      media: imx-mipi-csis: Store the number of data_lanes configured in dt
      media: imx-mipi-csis: Get number of active lanes via mbus_config

 drivers/media/platform/nxp/imx-mipi-csis.c | 19 ++++++++++++-------
 drivers/media/v4l2-core/v4l2-common.c      | 29 +++++++++++++++++++++++++++++
 include/media/v4l2-common.h                | 20 ++++++++++++++++++++
 3 files changed, 61 insertions(+), 7 deletions(-)
---
base-commit: 40b7a19f321e65789612ebaca966472055dab48c
change-id: 20250925-active-data-lanes-b5d994ff024a

Best regards,
-- 
Isaac Scott <isaac.scott@ideasonboard.com>


