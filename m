Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC88C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 01:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vLltFnJZ4LI56eX9cxtEO30QLyqD6LE0cWK7CHEjXRQ=; b=3StsL50MImI2ID1RIFh4ygLM6U
	Bc8ZL6Sv9kxKT3j6dqWfKSd8a5mgQWIgugba6K3K9vGbNVG12wwqTlBebbVJLSphRWA/6DMw9QtOu
	Y5N36wjchRgbER8sXPjYuC9GsAb3FC6SNaFDqwbWtRs6u8cIYdfT6rV7cKNkFZJcVjHUqqtekpEbo
	6o6eYacaJkodexkxzwHjDMbd7Q38rI5DC6BCi6HSlFeCF6h8cSwFhYOZrUUUprcswjAz/kqna4bIX
	zLjYA14aiAoEhLuqJy6znUyvuAU3ZtU/HrXE4z60uaQX4OQbXm/4D3Dpki71rZ8ujIAZ5gbji0oA0
	yrQj8yfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOR0E-00000003Dka-1RVM;
	Mon, 09 Jun 2025 01:08:42 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPul-00000003AAf-2JxY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 23:59:00 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB33AF0B;
	Mon,  9 Jun 2025 01:58:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749427126;
	bh=ipYLzcWZGX+tRjCGL9FXxMB6odXJQholEUrDk82Bo5g=;
	h=From:To:Cc:Subject:Date:From;
	b=L4VOCFaJ4mNEABey+F4VUdugQ06jGHxt3Cr60m6TG1llpUNoqEf6hFTDylT9v9DdV
	 EVZVhLpEOjZ/7E2LA44KoaeJoEeNXBaNd5rF5ik3L/g2C0LIK+TYz3Kig5XExJA8w2
	 o9olAbNSUjUw8bIWzMd6LMM0XlDG9BCPr2PVrXXY=
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
Subject: [PATCH 0/8] media: imx-mipi-csis: Cleanups and debugging improvements
Date: Mon,  9 Jun 2025 02:58:32 +0300
Message-ID: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_165859_916489_0A703880 
X-CRM114-Status: GOOD (  12.47  )
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

Patch 1/8 starts by aligning the code with the reference manual for
register field names, increasing readability of the driver when read
alongside the hardware documentation. Patch 2/8 then fixes a small
alignment issue in register dumps. Patch 3/8 logs per-lane start of
transmission error instead of supporting the first data lane only,
easing debugging of D-PHY issues.

The next two patches deprecate the clock-frequency DT property, which
shouldn't have been added in the first place. Patch 4/8 improves
handling of the clock frequency in the driver, and patch 5/8 deprecates
the property in the DT bindings. The driver still supports the property
to ensure backward compatibility.

The last three patches introduce support for multiple output channels
and wire it up in the debugging infrastructure. The CSIS IP core
supports up to 4 output channels, with the number of instantiated
channels being a property of the SoC integration. So far, only the
i.MX8MP is known to have multiple output channels. Patch 6/8 adds a
corresponding DT property, and patch 7/8 sets it in the i.MX8MP DT.
Patch 8/8 then adds initial support for that property in the driver, and
uses it to dump per-channel registers and event counters.

Laurent Pinchart (8):
  media: imx-mipi-csis: Rename register macros to match reference manual
  media: imx-mipi-csis: Fix field alignment in register dump
  media: imx-mipi-csis: Log per-lane start of transmission errors
  media: imx-mipi-csis: Only set clock rate when specified in DT
  dt-bindings: media: nxp,imx-mipi-csi2: Mark clock-frequency as
    deprecated
  dt-bindings: media: nxp,imx-mipi-csi2: Add fsl,num-channels property
  arm64: dts: imx8mp: Specify the number of channels for CSI-2 receivers
  media: imx-mipi-csis: Initial support for multiple output channels

 .../bindings/media/nxp,imx-mipi-csi2.yaml     |  18 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   2 +
 drivers/media/platform/nxp/imx-mipi-csis.c    | 311 +++++++++++-------
 3 files changed, 211 insertions(+), 120 deletions(-)


base-commit: 3c699df678515355e871141e142adae3bbf44216
prerequisite-patch-id: 7200af6e6d693b425b5cdb9ae6be1c55e23e2a45
-- 
Regards,

Laurent Pinchart


