Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D814FC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4P9pRhWW/sjLQ83WTz3Z/4Q0VYy6unEjW7rRciIOYFY=; b=KhD3z6QHmOMR7VrerJGzPC4qHc
	urmFHpSW1vWpspztifeTGIf+KCZwxNV8CDzeisU4I5udAth50AGejg4A3QlUa3hBOvMkk9Z6nFi4E
	akx2u3uDKTQ2OHmd9B4PmsxzBzt9sL6x+1AbDYsZ10vyISsSsLhLxcbDx8YwVca7JJWRAGGouqz5X
	tc892FWYLJdB7NdiyeR1HyBYdbHzB9+abPjOKBdh9ZxBxWUzjBQ+1WXoWHqyQAyjDkBEdw4IfL+2a
	AZxtOa7KUuVrjs7EoPdc9+sVmVZ2v0BunQLyshVOnNuApMsLXgxfrMlmmg6w/f9BfY3s3aiT6oOd1
	VrBwbaaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXS0Y-0000000Cfnn-3Lvp;
	Thu, 03 Jul 2025 22:02:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXOkE-0000000CF4q-1K5u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 18:33:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 16527A537FA;
	Thu,  3 Jul 2025 18:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95AC2C4CEE3;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567592;
	bh=GncYf9X2oA31TYye7DaUgi5Js+6gPq6VIcXaYOMi3r4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UN1ALmzwZ6bsOhZ9sEsVrEJIN/1ItpN6otlmAD/U6NXSxvQ4jlsM6oMR8MyxF/3eb
	 EZZKwktdxyxbU7eZzqjYHMeuL0BHfAs7dCbQBcSz1kMy7O2rwjH8hI6cgSpyrOBMZd
	 zivpykfNtBPczC71dUotDtrE+1VFASdAQgpBzB9I2I/emuhYQ5wNMJGN+x3ay7zkQO
	 iJ7yCuqQOjrl5hctz3klm3HwYoMZEvmoN39gfsOyeyKFPYPA7OMQ8UyPOUPTDxTwpy
	 Frp3sdKuMEoX6H6SemNKT6K98xqkcZw9akMVgnm9HYSuEQWk6ZwjdtMCNizXAAz9XT
	 7O8a8RVJjJosQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E6DC83030;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Subject: [PATCH v2 0/4] media: imx8qxp: add parallel camera support
Date: Thu, 03 Jul 2025 14:33:05 -0400
Message-Id: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOHMZmgC/1XMSwrCMBSF4a2UOzaShy2pI/chRcpNtHeQNCYSI
 iV7NxYnDv8D59sg2Ug2wbnbINpMiVbfQh46wGX2D8vItAbJZc8HOTByRT9LuAWcHTO6F1JpdVK
 ooF1CtHcqO3edWi+UXmt873oW3/UHKf4PZcE4s4hGaTOOkouLL+GIq4Op1voBiKkSVKYAAAA=
X-Change-ID: 20250626-imx8qxp_pcam-d851238343c3
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Zhipeng Wang <zhipeng.wang_1@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751567591; l=2021;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=GncYf9X2oA31TYye7DaUgi5Js+6gPq6VIcXaYOMi3r4=;
 b=d8M8uU0lP7VvBvBdTdRf18XypZa/rv3UYjM9qkcsk0J/9tqRXx5HW9r63W5fCReeAhwYq/IO5
 DOCsPxh/PvKCNSAfqe07sTFdPwEEaZXYxDCVwdXWu4qk0kh0pwPszx9
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_113314_518622_4C7CE443 
X-CRM114-Status: GOOD (  10.97  )
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add parallel camera support for i.MX8 chips.

The below patch to add new format support to test ov5640 sensor
   media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes

The bindings and driver for parallel CSI
   dt-bindings: media: add i.MX parallel csi support
   media: nxp: add V4L2 subdev driver for parallel CSI

DTS part need depend on previous MIPI CSI patches.
  https://lore.kernel.org/imx/20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com/

  arm64: dts: imx8: add parellel csi nodes
  arm64: dts: imx8qxp-mek: add parallel ov5640 camera support

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- remove patch media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
  because pcif controller convert 2x8 to 1x16 to match isi's input
- rename comaptible string to fsl,imx8qxp-pcif
- See each patches's change log for detail
- Link to v1: https://lore.kernel.org/r/20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com

---
Alice Yuan (2):
      dt-bindings: media: add i.MX parallel csi support
      media: nxp: add V4L2 subdev driver for parallel CSI

Frank Li (2):
      arm64: dts: imx8: add parallel CSI node
      arm64: dts: imx8qxp-mek: add parallel ov5640 camera support

 .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 109 +++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  13 +
 .../dts/freescale/imx8qxp-mek-ov5640-parallel.dtso |  82 ++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  27 +
 drivers/media/platform/nxp/Kconfig                 |  11 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx-parallel-csi.c      | 944 +++++++++++++++++++++
 9 files changed, 1192 insertions(+)
---
base-commit: 93355cfe8aec9e47fc93fbc940f1bbeedd62e249
change-id: 20250626-imx8qxp_pcam-d851238343c3

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>



