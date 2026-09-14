Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C17C88E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TQrhAY27KCaCunkejF4ZOv0VEjyUJjt516hIqAdhVR4=; b=zzhH+Kzx9t1FuN
	44S3Jxsm3zmSZwNseT1qxyY3TiW7NXbcMK1/FegOcUnzAVVymGE2npTN24a78vDel6TUyCqEYeIwt
	BSTfgOKmP8W4JCfj/fdz8t2feFt5RC/TkzxDQtQJholAYhvF94xyZiC5/hvpiSLrTUhK9JnYzPSPC
	/zhBZ8yyTwX8X5CMtS0NkvoHg6a5Tx0dLZYG/HIGdi5/rxUWXn292mxIdQWCWYLKVvtUaeTjDifIx
	SStkEpHGt4iipu/wBN1oTBN0XRh0gncqc3UbLTaWHjxD5LWVImAAr8PWgrb6gWLkOrpohsfyAiSSA
	1mQG1r2HpCN4Ua9nx1rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65ee-00000003VnC-0MWD;
	Mon, 14 Sep 2026 12:19:24 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65eV-00000003Vhg-0v1t;
	Mon, 14 Sep 2026 12:19:18 +0000
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: lucas.sinn@wolfvision.net
X-PTX-Original-Recipient: conor+dt@kernel.org
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-PTX-Original-Recipient: heiko@sntech.de
X-PTX-Original-Recipient: krzk+dt@kernel.org
X-PTX-Original-Recipient: p.zabel@pengutronix.de
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: devicetree@vger.kernel.org
X-PTX-Original-Recipient: robh@kernel.org
X-PTX-Original-Recipient: s.hauer@pengutronix.de
X-PTX-Original-Recipient: linux-rockchip@lists.infradead.org
X-PTX-Original-Recipient: mchehab@kernel.org
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C16A12009B9;
	Mon, 14 Sep 2026 14:19:10 +0200 (CEST)
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v3 0/4] media: rockchip: Add JPEG decoder driver
Date: Mon, 14 Sep 2026 14:19:03 +0200
Message-Id: <20260914-rockchip-jpegdec-v3-0-3583c376d0d2@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADfmp2oC/23N0QrCIBTG8VcJrzPUpVhXvUd0sfS4nQIVXbIYe
 /fcIAjW5f+D8zsTyZAQMjnvJpKgYMbgazT7HTF96zugaGsTwYRiWnCagnmaHiN9ROgsGMqs0po
 Zp6QypJ7FBA7HlbzeaveYh5De64fCl/WLHbdY4ZRRzTjXQtydZOwSwXevIQWP48ECWcQifhX5R
 xGLolqn5althFIbZZ7nD69WL1f7AAAA
X-Change-ID: 20260821-rockchip-jpegdec-0d6880cf656c
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789388350; l=2815;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=5slpKuydx4cE/DP8HicJnI6eOoZv1uHeyTPo9pAk/TY=;
 b=lgzC1brKImex1us8oON15MMG75YVn97w5oO9GDBV/cu+7ZO1bDVmF2Em/26AVu3087XmUKUGs
 2+hJkjd9Y75BsTLx6iC54vu15OgVdZTeHdVRaFZAYXcz/Y5U7H2gzEP
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_051915_422619_7B81AB7D 
X-CRM114-Status: GOOD (  14.76  )
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

This series adds support for the Rockchip JPEG decoder hardware. The JPEG decoder
is an in-house IP which is integrated into various Rockchip SoCs. The driver is
tested on a RK3588 board but reportedly works on RK3568 as well.

An earlier version of this driver was posted as part of the Hantro
driver [1]. That turned out to be the wrong abstraction, so it was split
up into a series with the Hantro fixes [2] and this series with a
standalone driver, which started over at v1.

[1] https://lore.kernel.org/r/20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de
[2] https://lore.kernel.org/r/20260824-rk3588-jpegdec-v1-0-180a30a2852d@pengutronix.de

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v3:
- Rename binding to rockchip,rk3568-jpegd.yaml to match the compatible
- Link the earlier Hantro based series in the cover letter
- Enable clocks from the runtime PM callbacks, use pm_ptr()
- Protect capture format and crop with a mutex
- Clear bytesused on capture buffers returned without a picture
- Revert padding the capture buffer to the MCU width, it broke 4:1:1
- Add notes on review questions to the driver patch
- Link to v2: https://lore.kernel.org/r/20260825-rockchip-jpegdec-v2-0-86af859a3266@pengutronix.de

Changes in v2:
- rename clocks from aclk/hclk to axi/ahb
- Add missing Signed-off-by
- Fix suspend/resume path
- Pad the capture buffer to the mode's MCU width, not to a macroblock
- Reject a frame header picture size outside the supported range
- Set the capture payload at decode time, not at queue time
- Trim comments in the driver
- Link to v1: https://lore.kernel.org/r/20260824-rockchip-jpegdec-v1-0-8011822bf500@pengutronix.de

---
Sascha Hauer (4):
      media: dt-bindings: Add Rockchip JPEG decoder
      media: rockchip: Add JPEG decoder driver
      arm64: dts: rockchip: rk3588: Add JPEG decoder node
      arm64: dts: rockchip: rk356x: Add JPEG decoder node

 .../bindings/media/rockchip,rk3568-jpegd.yaml      |   92 +
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |   22 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   24 +
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 drivers/media/platform/rockchip/rkjpegd/Kconfig    |   15 +
 drivers/media/platform/rockchip/rkjpegd/Makefile   |    3 +
 .../rockchip/rkjpegd/rkjpegd-vdpu720-regs.h        |  230 ++
 drivers/media/platform/rockchip/rkjpegd/rkjpegd.c  | 2354 ++++++++++++++++++++
 10 files changed, 2751 insertions(+)
---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260821-rockchip-jpegdec-0d6880cf656c

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


