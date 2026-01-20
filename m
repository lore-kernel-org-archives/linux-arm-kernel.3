Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2744D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vfvcWrkZ5jCb574R1sI7PNnWdYTz+NUUS4f8Io7nDf8=; b=1A2AMLh2kovEzAwq5bRvgN4K9G
	mZJR/0OsrIV+oasnXF2Tlgwr2pS1p6SBqNdvJ6wJE3FkJxwqZKT/E1zUoirhv9kEnJR3dCTCkRiBw
	I7LG12ep/ulMEWxPcDUpE3512Tl5FX1M+h6rXNxMmGeqNATkzFP1Pa4gQjGSELN/9ZdCDY95LK2IR
	Qe7yP4hNuFhBTPsPcL3b+nBoAueMtqDYXkwruFE34JllF3ouic9gJtwzHHbbbBTG8QwGMS5VxTpxt
	RgtXkLfazChAKj6KPb364RuddudK0eQQXVjPAzUv1PlCOeqqC5Kgtv+XSUYdOb2nU6Rm+xnkN9X51
	T4OYlbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAko-00000003p1w-2aIG;
	Tue, 20 Jan 2026 12:22:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAkj-00000003oyN-0iGp;
	Tue, 20 Jan 2026 12:22:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0D2A43B93;
	Tue, 20 Jan 2026 12:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69448C16AAE;
	Tue, 20 Jan 2026 12:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768911751;
	bh=xI3XK/W7MN3TODvGHDwVqQLxNB3kgignpElz2ouoedE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bdhHgFK9q11JhzDNwOO5lOKWXf54Y8ylzeb+NMxdWGPIv9fXkCny/IUUSIuj/XLRG
	 oTBrcJXRNYbiWaJgDbBejJZkJ91bGiDKTydfogUjEb1xGkyXZNI17k+LQOEr0xWxe7
	 7mSiseSJoE2yBemF8dIQiZcr8lpbdASwDahBL3aEMYXXUO9A9j+lXT1+HYRpO0LfPw
	 l3eolLGf8B6EV0i/8l+MiuirneVQQfKrVbFlywch1qTTYKy3Ibr9vXddBU+tP3ZkIS
	 G1lQkaphOP7+R5J0YE/0HDoq0XxFx5KRR/6HC2UqJxCzDwhn8n1EgpX06RJ/8TN/OZ
	 M1EjFQQjwZGDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F66FD2ECE9;
	Tue, 20 Jan 2026 12:22:31 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v8 0/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Date: Tue, 20 Jan 2026 13:22:26 +0100
Message-Id: <20251114-rockchip-mipi-receiver-v8-0-bd1cf5cb9588@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJzb2kC/43QTU7EMAwF4KuMsiYozm87K+6BWCSpQyM6TZVCB
 Rr17rizRJXI8lny9yzf2Yo148qulzuruOU1l5lC93RhcfTzO/I8UGZSSAMAmtcSP+KYF37LS+Y
 VI+YNKxfBJ6l17GOHjJaDX5GH6uc40vr8NU00XCqm/P1oe32jPOb1s9SfR/kGx/Tfng244AMo0
 VnsQAzDSyzT5EOp/jmWGzvYTbZRkigMfdBKOZeiPqNUG6WIArpIee+S6s0ZpdsoTZSnN9qEcRB
 GnlGmjTJEaeM9gEvQC39G2TbKEhVcRIu2CyqdUq6NcsdVMiUNfeqDgb/Uvu+/e7fAo5cCAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768911749; l=3584;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=xI3XK/W7MN3TODvGHDwVqQLxNB3kgignpElz2ouoedE=;
 b=c8dBzMuiY14hwKL7xYp8MdP0tAvvQ6oVPsikr49ecWsDas4kEgVMvrYZ3zRVEMs1kEurGoVuh
 ekEKZgxIFDtAn4YUTiTsuO+UbXwu/Te/YGeh+i39IYb8K0WNsqm2Xv/
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_042233_253780_82E81B8D 
X-CRM114-Status: GOOD (  15.14  )
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
Changes in v8:
- moved driver directly to drivers/media/platform/synopsys (Sakari)
- fixed further cosmetic issues (Frank)
- Link to v7: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v7-0-42ff419f9b51@collabora.com

Changes in v7:
- fixed several cosmetic issues (Frank)
- Link to v6: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v6-0-b7ce6e68b3fa@collabora.com

Changes in v6:
- renamed driver to dw-mipi-csi2rx (Sakari)
- fixed return value of v4l2_get_link_freq (this time, really) (Sakari)
- Link to v5: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v5-0-45aa117f190a@collabora.com

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
 drivers/media/platform/synopsys/Kconfig            |  18 +
 drivers/media/platform/synopsys/Makefile           |   2 +
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 726 +++++++++++++++++++++
 6 files changed, 895 insertions(+)
---
base-commit: eb4ee870747c3a77a9c3c84d84efb64bd481013a
change-id: 20251114-rockchip-mipi-receiver-0baf244c9c8e

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



