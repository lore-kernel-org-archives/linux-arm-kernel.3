Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08EECA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 11:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zJ6lk10drS8kog/BCmHNRXmgQlXNVZUkPyO4hnEXlIs=; b=HhyF2VtAvxX3GPzigf+LQ0jIgo
	nKVcwhqqfL9sId19+Fle54QqErrZehrP00tmlt521uWJDgO8cOW1xaGGiD1beW1BrxoxPS6eqPEC0
	BYZQqBgAAovK39oacNJv4TG7rTwf7xYUpb+wxDokjcEoak4emDL8bDrIGaHop8JFnddyoeDVBAdPc
	8uwwMdRtoua2jpRNUmoUyIhwMsWnV6UztjkzFRUWcOnuYmuMs+KpJkNEu4kEzZhQ0j/JR4MDRxolW
	r6F7PvBNH9sb68sxpiDgOh/6lDqbmJzwoXiFBuuHME640sKuAm26UvZw9pJtQri8FX86QRYpoRFnP
	Y3F7nYfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlaG-00000006DoY-3jYy;
	Wed, 03 Sep 2025 11:23:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utke4-000000065SF-1OIw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 10:23:17 +0000
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A277A982;
	Wed,  3 Sep 2025 12:22:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756894924;
	bh=GbcLAdAhFKI9Ex7GIGV1fgOFZiAQOcEHxjTZZhi1/kw=;
	h=From:To:Cc:Subject:Date:From;
	b=JxgJgN5k0EjPF1CIuYMT1+2TtAjMpHWrC5RxIg8Kj2tPMVQsWxh+C28GuFMkA26Uy
	 GPJpN5dbvhbgPsdjIid5iXS0i8UHRVwGEBz3SgDbivbLS4nGLPBneTe75HhYNLWF24
	 QX8sQ71uRGV4zzobYJ1wOArfTX24rEVbaK54uhjk=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil@kernel.org,
	nicolas.dufresne@collabora.com,
	sakari.ailus@linux.intel.com,
	tomi.valkeinen@ideasonboard.com,
	jonas@kwiboo.se,
	dan.scally+renesas@ideasonboard.com,
	m.szyprowski@samsung.com,
	mehdi.djait@linux.intel.com,
	niklas.soderlund+renesas@ragnatech.se,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v2 0/3] media: imx-mipi-csis: Get the number of active lanes from mbus_config
Date: Wed,  3 Sep 2025 11:22:39 +0100
Message-ID: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_032316_507266_EF368D16 
X-CRM114-Status: GOOD (  13.07  )
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

Tested on v6.15, compile tested on v6.17-rc4.

---------

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


