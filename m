Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3B4CED617
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 11:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qUTkyR5CvAr7Q+PWBd+lxR2zxT+GYUHujWL/SpXizaM=; b=YDglrrNxRLE5YZKzKY8o4zNV9Q
	3ECLdprQQl+nDid1ke1LZRdN434qC3Rxhk0POjiOGOSeGXFAK3CjEliF7nznK0x9WVoBhsyOodsYM
	zzwqAA4yK7XajSbEcR4xJpzXQYH/iQ6SUKx1tT0W1ddN0P2vYca2pAOKbUTuu42V5dqOlsc/WKz0i
	HaXG/41adUcJScNuPgXHVbYu7BlTx08CxuYsRquzX4r8Q1xNAtjKC+zolmuc8qzZEGLWOz4ksKIOZ
	cbNiI90B98sZMW+3g52S8s4ymRTFgsEuxvBxYBH3gSvJoyUFC8IEaOl5wNCaBImlQYlNQlv3HcOLY
	nf5Rp9qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJdP-00000000JJW-0XZ4;
	Tue, 18 Nov 2025 11:12:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJdM-00000000JI8-2h0b;
	Tue, 18 Nov 2025 11:12:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DFB5A601A7;
	Tue, 18 Nov 2025 11:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1858AC4CEFB;
	Tue, 18 Nov 2025 11:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763464347;
	bh=vg/rAUSulARoX9rCdjKSaqwDFdJwWNhU9fab7PXcE40=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=t5OWcE2nwi4Rmt6g+qorGLI04d+lheTc5Zpi//2kyEX/TIdjlZA4a0MTMRa/YpUjF
	 LlQ9HubJ+1F/640TwZVYvUK+qr5Xr1vWe1EK0DMtNzHLoqYUiLViB5UN0bv8ltU4v8
	 Avcp3ssMyXVmJqummAiZ+Q5FaeLpU1wTal/QEA1wUD1Ibhp9/viMR64vSW3Np/b7IX
	 goxgMHI3mdvvN8MBR5EdFW5fF5jzxB8eLQ9JRQ8l6cIKF0c5ctqoOrROg6dsYBrva0
	 jkRPhzh3LeZcDu9UfCjya8qKyATJ3CH7uNr4HaYAGzHOgNoalNIlosAG9xGbRFYqPb
	 xZrmiX9hvO+uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8939CED609;
	Tue, 18 Nov 2025 11:12:26 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v2 0/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Date: Tue, 18 Nov 2025 12:12:24 +0100
Message-Id: <20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJhUHGkC/4WNQQ7CIBAAv9JwFgNYTfXkP0wPsGxlIy3NokTT9
 O9iP+BxJpnMIjIyYRaXZhGMhTKlqYLZNQKCne4oyVcWRpmj1rqVnOABgWY50kySEZAKslTODqZ
 t4Qwdiho7m1E6thOEmk+vGKucGQd6b7dbXzlQfib+bPOif/bvp2ippNcH1Z2w08r7K6QYrUts9
 5BG0a/r+gUsbyWj1QAAAA==
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763464345; l=2257;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=vg/rAUSulARoX9rCdjKSaqwDFdJwWNhU9fab7PXcE40=;
 b=cjAoIEyEJzBcuSQ30blsRigVfjME6y6fVyfytrVJVdxAX8NqbGz0v4GkzzrQ87JrpJon27Zgg
 9c1PHQrMVyHB4ASS3NMMdvmHX/xCd+KXb9Ew/L5ZT9nr77Bisaoi8Jj
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Habidere,

This series adds support for the Rockchip MIPI CSI-2 Receiver that is
integrated into recent Rockchip SoCs, such as the RK3568 and the RK3588.

These changes have been discussed and reviewed thoroughly in roughly 10
iterations of the rkcif patch series (see [0] and predecessors). Thus,
they should be ready for inclusion in mainline.

However, as has been discussed in [0], it would be beneficial to add
support for the split mode (a feature of the Rockchip CSI-2 DPHY)
before integrating the MIPI CSI-2 Receiver into the respective SoC
device tree includes. We can readily add the DT binding and the driver
as I am positive they will not need to be changed when this feature is
introduced, but there are no patches in the series that introduce the
DT nodes.

This constitutes a small step towards mainline video capture and camera
support on the Rockchip RK3588.

Looking forward to your comments!

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

[0] https://lore.kernel.org/r/20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com

---
Changes in v2:
- dropped one R-b by Bryan, as there were two of them on the same patch
  (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v1-0-d13086e810dd@collabora.com

---
Michael Riesch (3):
      media: dt-bindings: add rockchip mipi csi-2 receiver
      media: rockchip: add driver for the rockchip mipi csi-2 receiver
      arm64: defconfig: enable rockchip mipi csi-2 receiver

 .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 146 ++++
 MAINTAINERS                                        |   7 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/media/platform/rockchip/Kconfig            |   1 +
 drivers/media/platform/rockchip/Makefile           |   1 +
 drivers/media/platform/rockchip/rkcsi/Kconfig      |  16 +
 drivers/media/platform/rockchip/rkcsi/Makefile     |   3 +
 drivers/media/platform/rockchip/rkcsi/rkcsi.c      | 742 +++++++++++++++++++++
 8 files changed, 917 insertions(+)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251114-rockchip-mipi-receiver-0baf244c9c8e

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



