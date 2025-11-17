Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C2BCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 10:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nGH95iLjZeZUr2M9AaXa3oZBjoG06z5r8cyQVvmFRTw=; b=m2kiMTdORllyDOY8C6QLChQi1B
	ylCNPJsdCsseOZsHMMvT0UpR0g7zqV7Lh24/s7aGY44Yj2sVqdC4/2AnOoK3DcoVzd8cF3F4LA9lK
	tKEexkADs3K79i7T8txLI9YbJcVOwMSXnyyluxIcX+2XyjE5x2euhHhML4brmocCNsl1Rh2JpPW28
	EdIQdkr9SmH+SNBAD0mDfcCca/zyAQ5cf4nkZUZqf0z7fCP8fpPzAEpSSKUEC8Ccz0EuUhWnKMXiM
	dcgytSiroxOd2LS7gcUo69ClZmnpbh6JvWBSWm7PdeUxD49x82rsUY7v10rbQVjeQKxREUjdIp9gg
	3DwtfsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKw38-0000000Fptp-3Ybe;
	Mon, 17 Nov 2025 10:01:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKw36-0000000FpsT-2UuB;
	Mon, 17 Nov 2025 10:01:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BEAB41A31;
	Mon, 17 Nov 2025 10:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C4A3C19422;
	Mon, 17 Nov 2025 10:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763373687;
	bh=U7vRmfMxxu2hnBi8KL4uNoUJ2y6rwaX3sY9jqWizYHI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=EgUVulQSk6IrjR49E250Z5eogUcv3NROnQ7dvGB4iEL+L79B5G2nXvNcmwlEZohY6
	 rwfdAbtDo6+QFJL5/xmd0rPC3ap3ebl3rhE7AY2+MpafC+6yUIjNjp3NJHLi5LxRFP
	 dP15sdMdHuhCI4EAfm7mK+BY27xcYtVyGUrZR2unuEbyzq+gBP6Pp5qiKdJHVGwLyV
	 12l+yNFJVV/Or6G09EnaMR1cC0nkGYcLbJpdtGrpFsnSTQftLatiZmDTV5IgAoyBj1
	 GpSMIOwc7OoSgknlBQIYHtmT5Jg9V5N20Pw8VgfsYU1rVM7i5lV34Sc74+S54l0Ydl
	 O/0HUUdDF58rA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED66CEBF61;
	Mon, 17 Nov 2025 10:01:26 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH 0/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Date: Mon, 17 Nov 2025 11:01:08 +0100
Message-Id: <20251114-rockchip-mipi-receiver-v1-0-d13086e810dd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGTyGmkC/x2NwQrCMBAFf6Xs2YUmRFB/RTwk66tZrGnY0CKU/
 rvB4wwMs1ODKRrdhp0MmzZdSgd3GkhyLC+wPjuTH/3ZORfYFnlL1sofrcoGgW4wHlOcfAhylQu
 oxyk2cLJYJPe8rPPcZTVM+v3f7o/j+AFfc3NQfQAAAA==
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
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763373685; l=1863;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=U7vRmfMxxu2hnBi8KL4uNoUJ2y6rwaX3sY9jqWizYHI=;
 b=V2eiFY6j5uhsHH4Fimug2DOFegD7zyJEBXg52CjTfy6OV7afZRNtTi0htq66yNivE1qw1k2Cy
 VQwX9b1QOYrCH9yKNBffKHvefIt+KQX5yb7MHPqcjq8VRZeUAQyHwHs
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_020128_683139_27DE1553 
X-CRM114-Status: GOOD (  10.23  )
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

These changes have been discussed and reviewed thoroughly (see [0] and
predecessors). As has been discussed in [0], it would be beneficial to
add support for the split mode (a feature of the Rockchip CSI-2 DPHY)
before integrating the MIPI CSI-2 Receiver into the respective SoC
device tree includes. However, we can readily add the DT binding and
the driver as I am positive they will not need to be changed when this
feature is introduced.

This constitutes a small step towards mainline video capture and camera
support on the Rockchip RK3588.

Looking forward to your comments!

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

[0] https://lore.kernel.org/r/20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com

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



