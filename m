Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E80BD4899D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 13:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gqz53b+6Ito4KiAO6L91I71+s9fiIjIU+81g33g1ouo=; b=bTk+26m38mtmODnEjFgYcnJjOH
	Bz5yGTXDP+2Y8rs7c7dXieDS/s9kfO8ypOb8xEiCUtHy+36+fTRCBlN33ZOo6oQLZ3W2A3y8LS2rs
	TGC6+HwiQy3kslfo/LSxmTs94FwTPH4Dv2Ibb5OgIzoGmSE4gY8mSEuN13FKpqxWPTWijWRlJfyU2
	pzJLBEjrVycAthSN3Sk7URSLtMNvm/p8aP2svTQEfv0Qt5OAnP1gXv7tPwYZ2hBrS8yIqfO/O1KwA
	QHF7qRMKwePxD5SKnYm7cxtV9gK/je+TKjNn67o+dJ5+QX3WZgjhvwFVGUN2aiTuh9D9qNe7cvjHE
	CQmLB4Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjVK-0000000E8aj-0CTt;
	Fri, 16 Jan 2026 13:04:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjVG-0000000E8YQ-3jEr;
	Fri, 16 Jan 2026 13:04:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D16A43BF1;
	Fri, 16 Jan 2026 13:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F50DC19421;
	Fri, 16 Jan 2026 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768568678;
	bh=s2u8m8fuVkjMI3E13P6pDYyB9Q5oNtLOKw3ocBqevlc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NfZ8UOrcoQMjryn6xeXIyXn8rksoIiGG0wzJtWtI2orPUvskYsDaOsbNsI24L3hhr
	 Qhkqh+To59sU4DJy+V4dW3OU+J6Ho1amAcFd1YBSJ77v8IAZId/ZYAbH1+zXF9r5pE
	 uYG+O2xaYkBMeYMlcZvLsNV5tCWiPPHhx2dIUPUaiY5c5mhbQqZz7QlCc2l9Fda6rm
	 0MNLLSxcabSZuwwwBb5L5p/2tWdQZtQRL3kEAiJBhncXjnsoz69A9jeF2in6++TkmL
	 LRSYg7G/2kGVAafcbuMZGF43mkOvNF//VDe1CNrPUzwwHweMFWnlDrSm7ehz3+RLng
	 Jx+oCncl1WUZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43603D4A5E8;
	Fri, 16 Jan 2026 13:04:38 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v5 0/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Date: Fri, 16 Jan 2026 14:02:45 +0100
Message-Id: <20251114-rockchip-mipi-receiver-v5-0-45aa117f190a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPU2amkC/43Qz2rDMAwG8FcpPs/D/9IkPe09yg62LC9iaRzs1
 WyUvPvUHkdhOX4C/T6hm6hYCKs4HW6iYKNKeeHQvRwETH75QEmRszDKdFprJ0uGT5holRdaSRY
 EpIZFquCTcQ5GGFDwcvAVZSh+gYnXl+s883AtmOj70XZ+5zxR/crl51He9H36b0/TUsmorRqOO
 GgV4xvkefYhF/8K+SLubDP7KMMUhjE4a/s+gXtG2X2UZUrzRdb7Ptmxe0a5fZRjyvMbjwkhqs7
 8pbZt+wXdkrLstgEAAA==
To: Michael Riesch <michael.riesch@collabora.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>, 
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
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768568676; l=3068;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=s2u8m8fuVkjMI3E13P6pDYyB9Q5oNtLOKw3ocBqevlc=;
 b=Qob6j5XB8O1JAgrJjNnzezkslqHY1BeUYjMVSnGwA+hcJVIGV9nGSj5c09h0yHdjgC1xGDKyw
 L+cmpk6ubMjBPRg9/aKoUqjNsvOMcWSWufl0mhImhm2EM+SvEfjD+rg
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_050439_615711_7F0A1AAF 
X-CRM114-Status: GOOD (  14.95  )
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

According to Rockchip, this core is NOT the Synopsys MIPI CSI-2 Host, but
it features a compatible register layout (thanks Chaoyi for the
clarification).

As pointed out by Frank, we should thus rename the driver and place it
under drivers/media/platform/synopsys to facilitate re-use of this code
for similar IP cores.

As has been discussed in [0], it would be beneficial to add support 
for the split mode (a feature of the Rockchip CSI-2 DPHY) before
integrating the MIPI CSI-2 Receiver into the respective SoC device tree
includes. However, we can readily add the DT binding and the driver
as I am positive they will not need to be changed significantly when this
feature is introduced.

This constitutes a small step towards mainline video capture and camera
support on the Rockchip RK3588.

Looking forward to your comments!

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

[0] https://lore.kernel.org/r/20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com

---
Changes in v5:
- fixed indentation in struct platform_driver ... (Sakari)
- fixed return value in case v4l2_get_link_freq returns 0 (Sakari)
- switched from pm_runtime_put_sync() to pm_runtime_put() (Sakari)
- Link to v4: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v4-0-a9c86fecd052@collabora.com

Changes in v4:
- moved driver to drivers/media/platform/synopsys and renamed it (Frank)
- addresse review comments by Sakari
- Link to v3: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v3-0-16e83aa7f395@collabora.com

Changes in v3:
- rebased onto v6.19/recent media-committers/next
- Link to v2: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com

Changes in v2:
- dropped one R-b by Bryan, as there were two of them on the same patch
  (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v1-0-d13086e810dd@collabora.com

---
Michael Riesch (3):
      media: dt-bindings: add rockchip mipi csi-2 receiver
      media: synopsys: add driver for the designware mipi csi-2 receiver
      arm64: defconfig: enable designware mipi csi-2 receiver

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 141 ++++
 MAINTAINERS                                        |   7 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/media/platform/synopsys/Kconfig            |   1 +
 drivers/media/platform/synopsys/Makefile           |   1 +
 .../media/platform/synopsys/dw-mipi-csi2/Kconfig   |  17 +
 .../media/platform/synopsys/dw-mipi-csi2/Makefile  |   2 +
 .../platform/synopsys/dw-mipi-csi2/dw-mipi-csi2.c  | 735 +++++++++++++++++++++
 8 files changed, 905 insertions(+)
---
base-commit: dc6c52205bdaddf1dc259497a958402b35c01fe2
change-id: 20251114-rockchip-mipi-receiver-0baf244c9c8e

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



