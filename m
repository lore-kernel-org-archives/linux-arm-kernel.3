Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EDCCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 18:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2jiMxzLrBGCnGiFph2YhwaDgxU9xojnMTG3GgDsppl0=; b=QSDNjCRfh6MvWbE+mxbZSchjGl
	aN40APuTe9XcGUZpdwSth7YpFtvoBOkQsKlmUwZxGiqJsLUshlfbhFAoED1fsmCjjWS1quxweWU0n
	kOBC4jhamw9UARNbe2zjj8N9VA8gsxYcQgDW/x3J1lAtAqGsLXiFXyn01QkzbAMCe5AXQK9uPtz5U
	Pnmv52YeJ6fXRQIFTqCVs/EpNVBIXRszQfwqvpFkQvF55qEx7hipkqLO51GZiNBhbSY0yGdUHDe3O
	OjtcS5sJxAO0FiRIzhZI+kDHOK8HdnrgYtvXR88X25hddywUYPmk+wtxYU5X17E1jzLIKIP2o2eJ+
	EOhTdOiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAWW-00000002Kny-0RI3;
	Wed, 29 Oct 2025 18:03:52 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAWU-00000002KmT-17ut
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 18:03:51 +0000
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 016BA18E5;
	Wed, 29 Oct 2025 19:01:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761760916;
	bh=/TFHMYzacR+KKyf6nr/tu+/AgmaYyKIjdlhSQxJbZkc=;
	h=From:To:Cc:Subject:Date:From;
	b=VEiYFvDLuZcBJm3aMcWE1e2m8es18R2VmBAtXuBwymttesNg/nBReIQcaPmrt9S1y
	 gcupWSWhA4r8nvBWZC4PxIx1bNW3zFNIWyQBFYVjpdDp2XZXXINWoWYYeYuJ7SUrxG
	 3BOlanenVdbxajRKqjyUur17F0WCGax68AvqS0rw=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: mchehab@kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Frank.Li@nxp.com,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v6 0/4] media: imx-mipi-csis: Get the number of active lanes from mbus_config
Date: Wed, 29 Oct 2025 18:03:17 +0000
Message-ID: <20251029180321.153680-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_110350_447683_8557791E 
X-CRM114-Status: GOOD (  15.89  )
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

Tested on v6.17.3, compile tested on media/next.

---------

Changes v5 -> v6:

- Collected tag for patch 2/4
- Collected tags for patch 3/4
- Changed v4l2_get_active_data_lanes() to return an int so we can check
  for -EINVAL
- Catch -EINVAL in mipi_csis_s_stream()

Changes v4 -> v5:

- Collected tag for patch 2/4
- Updated commit messages on 3/4 and 4/4

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
  media: imx-mipi-csis: Add num_data_lanes to mipi_csis_device
  media: imx-mipi-csis: Support active data lanes differing from maximum

 drivers/media/platform/nxp/imx-mipi-csis.c | 19 ++++++++------
 drivers/media/v4l2-core/v4l2-common.c      | 29 ++++++++++++++++++++++
 include/media/v4l2-common.h                | 20 +++++++++++++++
 3 files changed, 61 insertions(+), 7 deletions(-)

-- 
2.43.0


