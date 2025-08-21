Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57F4CA0FE0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZDGkCbI9FExqLS81QtpV2fG1o4XMV/pHF1Aw6x0Brcw=; b=B7urIQNjK4ipMR4JWkfympkPwl
	kRo8teonMB4PfIzBxV4uGEuKgzNhGvSDNrH+v7S41ujx4Jq4OKC6ZF0wHSD8hA5oYPjU3E7Wqmt3E
	z8DJupCtcUsyHbQ173XPnbSI/vrZwtXNmmGX0n3cwxahxVril4Vt6n09l6l+D++M0VE/i3AbcuOS/
	ijUPEliW7f/WyKjeCXJ5JQjToUPH4bzUVhABHW+T2PtBr5fTKck0bDuAv5YYi/UWkMBOoqswH+GhE
	CgGunpWsGg3XQ38l0jEPRA8kgShBuk+GUnVQfkvaoTU+tuJWiswXv4mRQU6gj9DmO+WwWdXuRQLAf
	th12eWcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7X-0000000FdXI-20t2;
	Thu, 21 Aug 2025 03:37:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uossd-0000000FHFi-1KvZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:10:12 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 52B171026;
	Thu, 21 Aug 2025 02:09:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755734949;
	bh=8ClzBERjiu/dcdsv4dci9I660kzzTd9ObtnQJZj6cP0=;
	h=From:To:Cc:Subject:Date:From;
	b=SG//Vw4f7pTlBq2sQTDb6r5nhjllRmCn5/QKhcu5ggQMOcaDzpSS2l7VnIUEwKMjW
	 ZazqAHsngmIRZbWnEfzgj46tmXOp8XXNjZtTWjL+rLvigmY/MgIvVnaTJEBL9qGoY8
	 ZQXxN4w5PNm+Zcfcw1D/AT7yuGMPbeSoXsieD2SU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 00/12] media: imx-mipi-csis: Cleanups and debugging improvements
Date: Thu, 21 Aug 2025 03:09:32 +0300
Message-ID: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_171011_503901_9F14CD28 
X-CRM114-Status: GOOD (  16.02  )
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

Patch 01/12 starts by making the v4l2_get_link_freq() function accept a
const media_pad argument. This conflicts with [1], I don't mind rebasing
on top of it. Sakari, if you plan to get that patch merged soon, feel
free to take 01/12 too.

The next three patches, 02/12 to 04/12, are small cleanups. They are new
in this version of the series. Patch 05/12 then aligns the code with the
reference manual for register field names, increasing readability of the
driver when read alongside the hardware documentation. Patch 06/12 fixes
a small alignment issue in register dumps, and patch 07/12 logs per-lane
start of transmission error instead of supporting the first data lane
only, easing debugging of D-PHY issues.

The next two patches deprecate the clock-frequency DT property, which
shouldn't have been added in the first place. Patch 08/12 improves
handling of the clock frequency in the driver, and patch 09/12
deprecates the property in the DT bindings. The driver still supports
the property to ensure backward compatibility.

The last three patches introduce support for multiple output channels
and wire it up in the debugging infrastructure. The CSIS IP core
supports up to 4 output channels, with the number of instantiated
channels being a property of the SoC integration. So far, only the
i.MX8MP is known to have multiple output channels. Patch 10/12 adds a
corresponding DT property, and patch 11/12 adds initial support for that
property in the driver, and uses it to dump per-channel registers and
event counters. Finally, patch 12/12 sets the property in the i.MX8MP
DT.

[1] https://lore.kernel.org/linux-media/20250819094533.2335-3-sakari.ailus@linux.intel.com

Laurent Pinchart (12):
  media: v4l2-common: Constify media_pad argument to
    v4l2_get_link_freq()
  media: imx-mipi-csis: Simplify access to source pad
  media: imx-mipi-csis: Standardize const keyword placement
  media: imx-mipi-csis: Shorten name of subdev state variables
  media: imx-mipi-csis: Rename register macros to match reference manual
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
 drivers/media/platform/nxp/imx-mipi-csis.c    | 348 +++++++++++-------
 drivers/media/v4l2-core/v4l2-common.c         |   2 +-
 include/media/v4l2-common.h                   |   3 +-
 5 files changed, 230 insertions(+), 143 deletions(-)


base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
-- 
Regards,

Laurent Pinchart


