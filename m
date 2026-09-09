Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00376C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GoU7d3l+LWD0+DIHxWwPqcU7TANMuZU7cVdbP5k2yI0=; b=phaQtTqk19gYx+Iwf/SZQIwzQ5
	5EHEhWG8vMKHojtRAvybCChUQtRc1SMVSi8x3+hSPDJHjWA7AvNoyBHZ7jHxKcUT4V3QbmBAF4dme
	eSQQYM8l2rgG5Ty5bQiVSwchJOxcInClRFYehjXi46ERcIQletrRrH7xZ0uvgTR19FmnqM1yath69
	X3W0VwjwhYcnx8Dn121s2EDueV2bku8SVGv2Pv2/MQ5qu8UBgsONvgo0MZHDGB/Oj3+S6d67njDKK
	kKEZpR9kuXCoGa1FYHEU2b1WFO2GJwW4eZBap1DHa71yYgip7+ynSzHJ6NgCL89aioUVf2es6Hijs
	dq6s1AIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J4J-0000000BvWy-07Fo;
	Wed, 09 Sep 2026 14:14:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J4C-0000000BvR6-1UFE;
	Wed, 09 Sep 2026 14:14:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 872E460218;
	Wed,  9 Sep 2026 14:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BDE4C2BCF4;
	Wed,  9 Sep 2026 14:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788963263;
	bh=uOvO7Uzwwoe+4sbG4xOBTQfvrDD2qD2yTL1O7zXzwnA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cldoZ0+Pddf03c+LoY8QiT/xygNIojZxyh/GWSqBk/xNVRl4zlyQ9r6eSdFrHmjzc
	 vD1h24w13vhlgzpyvz30f7TwljokUtF8thBRG1nA36FPwbkewbWzApRLJyWRTpO74r
	 i0/OizuDDryXBV9c+ff3bzNJjvMjNqj422Ja74fUN7bQYIjb3F6zrm7G/VrG1bvwmW
	 iS5nSl52yoGonsHCAw0YIcb6BnVAztyYTwJhLBRVse6L1Bs6p6PfTVXIA9XHuyiKG8
	 glyDA2evfuhwEoOlSghEGCX+iEWkaelwHfk9X6+rWZIxZyaSd1m1rR+e+LeqqjVLOY
	 +JlxYE4gIbS3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E8AC79FBF;
	Wed,  9 Sep 2026 14:14:23 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH 0/3] iommu/mediatek-v1: fix the driver + mt6572 support
Date: Wed, 09 Sep 2026 17:14:04 +0300
Message-Id: <20260909-6572-iommu-v1-0-de261da09fb2@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDWhoRVXEYvRDkbiJ62KRNxds
 fwW713gyTF5qJMLHB3seV0i8jQBM+IykGAbDTKTKtOyEKrUUvA6z0FYJF2hRVSlgRhsjno+v1n
 T/vahm8js7wHu+wGvI8UlbgAAAA==
X-Change-ID: 20260724-6572-iommu-dae78adaa65c
To: Yong Wu <yong.wu@mediatek.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Roman Vivchar <rva333@protonmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788963261; l=1496;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=uOvO7Uzwwoe+4sbG4xOBTQfvrDD2qD2yTL1O7zXzwnA=;
 b=i0i1FiCTJpC+cIW9dxpYnEDhoPKkkIOIjFygBYU4F309XWXCI9cmMfZ1jrIWHFPCUslryK9Ut
 AV1kpB08YqGA78ZvP3n0xfS1XDtxBw7CPzbjyAHi27A+9Ls0LDEO6in
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series fixes silently broken IOMMU v1 driver and adds mt6572
SoC support.

It appears that currently the driver is not working at all... IOMMU core
will silently reject the component bind unless there's of_xlate callback.
The fix is pretty straightforward - provide of_xlate callback (based on
mtk_iommu gen 2 driver) to let IOMMU attach devices.

This makes DRM subsystem use IOMMU like all gen 2 SoCs do.
It can be verified by reading overlay engine input address.
Before:
~ # devmem 0x14007040 32
0xBB900000

After:
~ # devmem 0x14007040 32
0x00000000

Note the changes weren't tested on mt2701, because I don't have such
hardware.

It's worth mentioning that some bits may apply to mt6582 and 6589,
however, they seem to have L2 cache for IOMMU, therefore patch 3 has
MT6572 IOMMU type, and not MT65XX.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Roman Vivchar (3):
      dt-bindings: iommu: mediatek: add mt6572
      iommu/mediatek-v1: fix IOMMU device binding
      iommu/mediatek-v1: add mt6572 support

 .../devicetree/bindings/iommu/mediatek,iommu.yaml  |   3 +
 drivers/iommu/mtk_iommu_v1.c                       | 158 ++++++++++++---------
 .../memory/mediatek,mt6572-memory-port.h           |  26 ++++
 3 files changed, 123 insertions(+), 64 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260724-6572-iommu-dae78adaa65c

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



