Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD31CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5bQKcGZPGlffL4xllSsfKrdEOsWOcECNuw+3JH48HP0=; b=nVl9bnchhndLyjiN5Oa0angGDU
	GCx5NmMaXh+JeTsf4UeOabAhmEW9cAQgTkqpayq2z/+0tY/SQrX1zS3Vo4HnQVmXa/wvaIo5iEDjo
	bqdEHn9akXwBVoRVeGBgVhD3lCCtmNOJ8CrWYwkRwdpfMINhByg92CPO201nLKVWMjjxr8FivvhXH
	0AgKrFJ+l7zHIKGsq7uj9B6rDM8vn8z09YX7+tX3hVZygQl41a3rgGH46DwzfKIBZs7mouDq2xra6
	HAI5UBV7vufDo/fh4R3VU0En6aYzU+Q7rxdF4mi1NUSPPO0/QdSsvvDUSj6we0uOUDEQScahul/gc
	i3BDDEeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqj-00000002I29-2z9O;
	Fri, 22 Aug 2025 11:22:25 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFdT-000000012M1-3LB9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 00:28:06 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 77C36228;
	Fri, 22 Aug 2025 02:26:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822418;
	bh=hvocuKs0+lw53BxD/QtBS2ovnPYm5W3zP08TmRzB3Eg=;
	h=From:To:Cc:Subject:Date:From;
	b=F9J1ksJ7ShlCf2QiTyLFtXUeecI3jn8g0Iz2Er3pQMMVky6EqM+YG/3wic5ZcHmes
	 Ig0cgiOtD4ZwGmuDsP2Z9aFJM+Lan6d6bw/EvDiXutQkUQyJI13MhicK+Ti+xHmFnT
	 M1miaP9s/xGxH4eg0qcKUWf9ZRFoBizFbAQaEUEM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 00/13] media: imx-mipi-csis: Cleanups and debugging improvements
Date: Fri, 22 Aug 2025 03:27:20 +0300
Message-ID: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_172804_014045_8906C376 
X-CRM114-Status: GOOD (  15.30  )
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

Hello,

This patch series bring a few miscellaneous improvements to the
imx-mipi-csis driver, and in particular improves the debugging
infrastructure.

Patch 01/13 starts by making the v4l2_get_link_freq() function accept a
const media_pad argument. This conflicts with [1], I don't mind rebasing
on top of it. Sakari, if you plan to get that patch merged soon, feel
free to take 01/13 too.

The next three patches, 02/13 to 04/13, are small cleanups. Patch 05/13
then aligns the code with the reference manual for register field names,
increasing readability of the driver when read alongside the hardware
documentation. Patch 06/13 (new in this version) also improves the
register macros by standardizing usage of GENMASK. Patch 07/13 fixes a
small alignment issue in register dumps, and patch 08/13 logs per-lane
start of transmission error instead of supporting the first data lane
only, easing debugging of D-PHY issues.

The next two patches deprecate the clock-frequency DT property, which
shouldn't have been added in the first place. Patch 09/13 improves
handling of the clock frequency in the driver, and patch 10/13
deprecates the property in the DT bindings. The driver still supports
the property to ensure backward compatibility.

The last three patches introduce support for multiple output channels
and wire it up in the debugging infrastructure. The CSIS IP core
supports up to 4 output channels, with the number of instantiated
channels being a property of the SoC integration. So far, only the
i.MX8MP is known to have multiple output channels. Patch 11/13 adds a
corresponding DT property, and patch 12/13 adds initial support for that
property in the driver, and uses it to dump per-channel registers and
event counters. Finally, patch 13/13 sets the property in the i.MX8MP
DT.

[1] https://lore.kernel.org/linux-media/20250819094533.2335-3-sakari.ailus@linux.intel.com

Laurent Pinchart (13):
  media: v4l2-common: Constify media_pad argument to
    v4l2_get_link_freq()
  media: imx-mipi-csis: Simplify access to source pad
  media: imx-mipi-csis: Standardize const keyword placement
  media: imx-mipi-csis: Shorten name of subdev state variables
  media: imx-mipi-csis: Rename register macros to match reference manual
  media: imx-mipi-csis: Use GENMASK for all register field masks
  media: imx-mipi-csis: Fix field alignment in register dump
  media: imx-mipi-csis: Log per-lane start of transmission errors
  media: imx-mipi-csis: Only set clock rate when specified in DT
  dt-bindings: media: nxp,imx-mipi-csi2: Mark clock-frequency as
    deprecated
  dt-bindings: media: nxp,imx-mipi-csi2: Add fsl,num-channels property
  media: imx-mipi-csis: Initial support for multiple output channels
  arm64: dts: imx8mp: Specify the number of channels for CSI-2 receivers

 .../bindings/media/nxp,imx-mipi-csi2.yaml     |  18 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   2 +
 drivers/media/platform/nxp/imx-mipi-csis.c    | 353 +++++++++++-------
 drivers/media/v4l2-core/v4l2-common.c         |   2 +-
 include/media/v4l2-common.h                   |   3 +-
 5 files changed, 232 insertions(+), 146 deletions(-)


base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
-- 
Regards,

Laurent Pinchart


