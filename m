Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D297CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rmIZzpNYw4iuaMtlBe0TWRnshpwI8xdwTKBVTxnKOrQ=; b=3p7g/B9B1Akit8CnjxzpTokjdn
	SnXLNoE7YRLRYVBL2i+f2Sr9XO84W9OA4YVbRCsLpzugRTUyVBkjq2pCfr7wPJwcBLIwbNgi5W8t9
	9eJW+SN/oCW42NrNyeCmG8WgruSsuHWHhQKu1bdLVBesnyzlT3WP1gxUsyfwej/KzW3oX4nS0HNGG
	c4uPEttoginxf0SvvcStSGfwrkzZfn7OMBFa+pj5OqyCmfrmavXfM6Zcp9QwgxtL2MINk8oBu5HSn
	NXHgWNpkBRKkRJW9H/RgbfCLpG53fDXbhjKIICCD6VF+YrmYVzxQ1B413CZKM/QgKdkTJEANENSK9
	nu4ZQl3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiOI-00000006pDX-28KX;
	Mon, 19 Oct 2026 08:06:42 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiOA-00000006p9v-1k5l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=rmIZzpNYw4iuaMtlBe0TWRnshpwI8xdwTKBVTxnKOrQ=; b=hYrp29RghoKuhGCxfDkVFMHQf2
	2IYSHroCwxNy8BV8eZUbxK+OI7GqffjfwGQ7yERaFZISUbg7/A9RqHZpLa1Sf0hT/yPdNHdmCz3C1
	gIan9rjepzzlQvwP3QUfiklD7zIOr4dDYkGg+nrd443SUYuANkPmhkpiQn61700KQwv6MU8QNR84E
	gmddCUKN+X/pTOeKno5YA3O/FbmVKgCQR+XUcMPgpSqZhz4+wBWd/o7MP35bsUJDfCvze17kGJVpu
	0qpkTZnLq4/xLp3qgN9xSFYnPCM+P3zSJWSujeyrwG7yEYw7xeertyDoJHYkswHB1FQd2O7vTqFYb
	GnX8HziQ==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xIiO1-000DG5-0t;
	Mon, 19 Oct 2026 10:06:25 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xIiO0-00046E-2i;
	Mon, 19 Oct 2026 10:06:24 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v3 0/5] LVDS support for TQMa8Xx
Date: Mon, 19 Oct 2026 10:06:15 +0200
Message-ID: <20261019080621.194103-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28158/Mon Oct 19 08:26:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_010635_542356_D4E92333 
X-CRM114-Status: GOOD (  10.70  )
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

Hi,

this series adds the LVDS support for TQMa8Xx on MBa8Xx. It is based on
next-20261016.

Patch 1 is based on v9 series from Liu Ying [1] but uses patternProperties
instead.

The patches 2 & 3 are from an earlier v9 series from Liu Ying [1], with a
smallmodification in patch 3 (changes mentioned there).

Patches 4 and 5 add the overlay for LVDS support.

Thanks to Liu for providing the DT patches earlier on.

Changes in v3 include fixes to Sashiko findings. The changelog is in
the individual patches.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20250414035028.1561475-17-victor.liu@nxp.com

Alexander Stein (3):
  dt-bindings: firmware: fsl,scu: Add imx8qxp-pixel-link nodes
  arm64: dts: freescale: Add LVDS overlays for TQMa8Xx
  arm64: dts: freescale: Add dual-channel LVDS overlay for TQMa8Xx

Liu Ying (2):
  arm64: dts: imx8qxp: Add display controller subsystem
  arm64: dts: imx8qxp: Add MIPI-LVDS combo subsystems

 .../devicetree/bindings/firmware/fsl,scu.yaml |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |  14 +
 .../arm64/boot/dts/freescale/imx8-ss-dc0.dtsi | 412 +++++++++++++++
 .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     | 254 ++++++++++
 .../dts/freescale/imx8qxp-ss-mipi-lvds.dtsi   | 467 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   7 +-
 .../dts/freescale/mba8xx-lvds-g133han01.dtso  | 160 ++++++
 .../freescale/mba8xx-lvds0-tm070jvhg33.dtso   |  88 ++++
 .../freescale/mba8xx-lvds1-tm070jvhg33.dtso   |  88 ++++
 arch/arm64/boot/dts/freescale/mba8xx.dtsi     |  58 ++-
 10 files changed, 1550 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/mba8xx-lvds-g133han01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/mba8xx-lvds0-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/mba8xx-lvds1-tm070jvhg33.dtso

-- 
2.55.0


