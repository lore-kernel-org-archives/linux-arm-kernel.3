Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D680E107BCD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 17:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3Tr+EOVNjFikO+pt3lraizy5EqqhT7+FGRXctKnnEKg=; b=EXr1dWv24+CUKi
	DgXgVYP/XYh3BCokifE+fmV0cfh43KJzpiCVoLfdywNOEsYMYxie1t0pVw9Z8KzKPWGsZk577rzMq
	KIzKX12DY48/x+I9zDskwREIDXIJUWxOk+yOOGIdiJ0/H4LYTc+o7Kj/nG80bdyF9tnO1Ky4HWJXx
	w8LO444eU3juwci592Rozcc1wuyLK7EgKFfVZrqArU73jnEE7pieDVxXLNvrZYFi1+MOiImu04RtB
	STEsjX6U59Ga0IGizeCmoIZ1OkI1/v//uZUtF/p/OLi9Qgnm/M37YNLIfbAVu2U8/2b1qyYB89UmF
	ATa7R29E/8N8FsHzemEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16lN-00000000nob-3M7O;
	Fri, 13 Mar 2026 17:57:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16lJ-00000000nlc-2MhF;
	Fri, 13 Mar 2026 17:57:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773424641;
	bh=zoRJcc+9LulL0mfzN2JJ+x4jgcsK4gDEhoHOhad868s=;
	h=From:Subject:Date:To:Cc:From;
	b=ni5gyQtlBVHDrrjUKVh1j8mnsqSIUA+MVOmT53faStbFBl4hqZ3y9YhLleUH9E/MZ
	 dFk4jF06iv5Q2Ohzc5WF3AlCCOw5PAwGDrmXIKYkjNSXEMx+RYREYkkevi6hjQzUiC
	 YpmROe6eRSsNSVLdQUVPk2qMu4kBPanA871THdi5UyKKN/SjRimjcW/3bZziXRIP+B
	 2JTc0m+3Fp9V9eyfVqEWDeFA4u+SVlWtRVOLIhTE5xkO8ln4P3zBOfc5jaOcTofR2F
	 visyTMoKVLdQxY1jcz+J6QqAYQ5En5sMXijnDlNEWD+I3LAqRapMY3aif8sUsuKsyf
	 LXI1Q8gQVTNnQ==
Received: from jupiter.universe (dyndsl-091-248-210-078.ewe-ip-backbone.de [91.248.210.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6AB5A17E0454;
	Fri, 13 Mar 2026 18:57:21 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 23B47480026; Fri, 13 Mar 2026 18:57:21 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3 00/12] phy: rockchip: usbdp: Fixes, DP 1-lane support
 and cleanups
Date: Fri, 13 Mar 2026 18:57:09 +0100
Message-Id: <20260313-rockchip-usbdp-cleanup-v3-0-3e8fe89a35b5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPVPtGkC/4XNTQrCMBCG4auUrI0kUxKpK+8hLvIzscHahMQGp
 fTupl2JIC7fD+aZmWRMHjM5NjNJWHz2YazR7hpiejVekXpbmwADyYC1NAVzM72PdMraRmoGVOM
 UqdCis04LyVVL6nFM6Pxzg8+X2r3Pj5Be25/C1/UvWThllEslXQdo+UGeTBgGpUNSexPuZGULf
 FD8NwWV0vKABkC4TuI3tSzLGwipEbMLAQAA
X-Change-ID: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=zoRJcc+9LulL0mfzN2JJ+x4jgcsK4gDEhoHOhad868s=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGm0UADABW9YDxyY68d7afn9D1cIo5jsgg45q
 VO38rNb9o0vi4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJptFAAAAoJENju1/PI
 O/qaG4EQAJzOGESyYslWAQIb4dMQ0kLRYZT3mv4tvLmYE+PalDRUV2Ps5nVMU5QJro3lk4Pv1/D
 SSoIP2TAPDFV7ftpEj4I1uMZIeqLi/n5oQPxiGnpoQSov0QE5ZxrCoNFZc0oN3GGvWkIEhKfxyq
 92UzdQ8VPc5hZia+UrOp+askt+aE3Qml2eptzbfJx9a4CqhKPzAIUSTXPfM3QvU1ixnIAl94OXv
 w/ZNd6vqoOmTQq8+733HhffwnglMG6bo9Gk6nmVaTVqLi2Y5Dx6IGU62ame+OBs6cMG6UpEptIe
 n9SO6fJt5SUYv56fwbXV8imc2H3OeWRnMPPY5nCdnzvPvcG86rGl5CjDXnfdRZcBgYoiwcpfDwA
 Ov9/kuacn3M3YAkp/1jth4NxcvC4xU5tV9+8QLpUp/jcjcKUWfqaSnEATCNBp1Gl3GFaUJnLD+H
 FzO+ncOcuzTbakC+ra6OGrv63JOmT3EwMyRmsAAQ9TlQfZctBaqXIjFtLYwuHjONvvK1pgFlmdr
 O/8g6miiKPl5krjtXwnOd7I6b5KJMMX+/vaTwIaIsOruFfxCy67j0Xb5Ym0kJtB9it4Alfsqr0j
 QpKbHcfzMPtR9VxUVI4+CRx518miuwLbefAb9fak0Ukf7dLh7Dg4PqM/FfEQRshClt5JD2IwTx3
 lO2PdK8IzQo0iTCuz5x42BA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_105725_766679_7EA75B70 
X-CRM114-Status: GOOD (  10.88  )
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

This series overhauls the Rockchip USBDP driver; apart from a
a bunch of cleanups and small improvements the main goal is to
get the driver ready for proper USB-C DP AltMode support.

Once this series has landed, it unblocks enabling proper USB-C
DP AltMode on the RK3588 and RK3576 platforms incl. runtime PM
for the Synopsys DesignWare DisplayPort controller.

Apart from this series, further changes are required on the
DRM side. There are no compile-time dependencies between the
DRM side and the PHY side, but the PHY side must be applied
to avoid SErrors once runtime PM is added to the DisplayPort
controller driver. Thus it would be really good to land this
series in the next merge window.

Changes in v3:
- Link to v2: https://lore.kernel.org/r/20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com
- Add patch to register the USBDP PHY as DRM bridge
- Add patch to describe ports in DT binding (used by the DRM bridge)
- Add patch to drop HPD handling from the PHY

Changes in v2:
- Link to v1: https://lore.kernel.org/r/20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com
- Added new patches to fix USB3 SError

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Frank Wang (1):
      phy: rockchip: usbdp: Amend SSC modulation deviation

Sebastian Reichel (9):
      dt-bindings: phy: rockchip-usbdp: add improved ports scheme
      phy: rockchip: usbdp: Do not loose USB3 PHY status
      phy: rockchip: usbdp: Keep clocks running on PHY re-init
      phy: rockchip: usbdp: Add missing mode_change update
      phy: rockchip: usbdp: Rename DP lane functions
      phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
      phy: rockchip: usbdp: Cleanup DP lane selection function
      phy: rockchip: usbdp: Register DP aux bridge
      phy: rockchip: usbdp: Drop DP HPD handling

William Wu (1):
      phy: rockchip: usbdp: Fix LFPS detect threshold control

Zhang Yubing (1):
      phy: rockchip: usbdp: Support single-lane DP

 .../bindings/phy/phy-rockchip-usbdp.yaml           |  23 +++
 drivers/phy/rockchip/Kconfig                       |   2 +
 drivers/phy/rockchip/phy-rockchip-usbdp.c          | 158 +++++++--------------
 3 files changed, 74 insertions(+), 109 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


