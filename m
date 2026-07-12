Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B398C44506
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 03:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pPMB1E9mxY98sJzlxRNQcBMbjxdnpUE7XN7dpLMKjA0=; b=rvGqn05BKaoq0OgWVi6FeW7ujM
	V6ZJfKaa8OYwWoXYHU7YGDITxJIx7D8IZ2mLiNL/elGeb+YUuFHcu02S/Pz2OwWVkcbEllI/42xC9
	olnVRy6O/QkzwPQ1glYd+Qur6PsmyEEStTlTXV833Bpg7TzH07E0wETZgECZot/lLIQKg+5K60WtQ
	6EaM4xy4Wnrq3xDc7GSpbHKD7d+CzuQIpRxqokII06ODHNUPhlkGzlQX6EbGhepeO2bm+jXAfdeRr
	HrIaV4sgoFgB7kSw7mz53qPDTNt6RAIs+dd3Ewwc0M7l8biT5ORj+AjjkMhBVFDYmaSuAeHCZwBeU
	uVK9XHJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wikQU-000000073IH-1rJ0;
	Sun, 12 Jul 2026 03:00:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wikQS-000000073Ha-2CBd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 03:00:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 569D7439C8;
	Sun, 12 Jul 2026 03:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060991F00A3A;
	Sun, 12 Jul 2026 03:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783825215;
	bh=pPMB1E9mxY98sJzlxRNQcBMbjxdnpUE7XN7dpLMKjA0=;
	h=From:To:Cc:Subject:Date;
	b=bkVxiSuT++4UcUJpwBGKoHrUTiEU37RsXgTTE0IJKdT48S2k9fExAiTIbQzTXllGr
	 ygvejOln/yhZalFw0kdMOnUH2iiCntFPT+m0pmdWCWEEVKitGFSmTIQV6kYF4VzWIy
	 RZ8kmiWRQFVScYk1KvR8xnXH+k2NftNUTgSuPE4q0zqp9ljWN6qRPxrVYOGa9vX3Xr
	 nyzUBHZlFvh7aNe55/C+IFfv+y43SqmMLuQQO1IyQy5hOZQyRD3i30w40TlvwwnC2A
	 c2/W9E9gcIes3wV7x1JBMbetmS3BxuVPRfGAGlRfaEFduRZvBU0OyXkPL2GvDuLRO8
	 UgY6zPYEDtyZA==
Received: by wens.tw (Postfix, from userid 1000)
	id CCC695FDD4; Sun, 12 Jul 2026 11:00:12 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] arm64: allwinner: h616: Support Video Engine
Date: Sun, 12 Jul 2026 11:00:03 +0800
Message-ID: <20260712030011.3778169-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi folks,


This is v3 of my Allwinner H616 Cedrus series. The series is ready to be
merged.

Changes since v2:
- Dropped "drivers:" from cedrus driver patch subject

Changes since v1:
- Fixed IOMMU ports on H616 (patch 7)
- Updated comment about VP9 on H616


This series adds support for the Cedar video engine found in the
Allwinner H616 SoC. On the way, it also fixes some issues with the
DT representation for the Allwinner H6 SoC.

Patch 1 fixes the video engine's number of IOMMU endpoints on the
H6 in the DT binding.

Patch 2 fixes the video engine's number of SRAM regions on the
H6 in the DT binding.

Patch 3 adds a new compatible for the H616's video engine.

Patch 4 adds the new compatible for the H616's video engine to the
cedrus driver.

Patch 5 adds the video engine's missing SRAM region to the H6 dtsi.

Patch 6 adds the video engine's missing IOMMU endpoint to the H6 dtsi.

Patch 7 adds a device node for the video engine to the H616 dtsi.


Patches 1-4 should go through the media tree, while patches 5-7 will go
through the soc tree via the sunxi tree.


Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (6):
  dt-bindings: media: sun4i-a10-video-engine: Fix IOMMU count for H6
  dt-bindings: media: sun4i-a10-video-engine: Fix SRAM count for H6
  dt-bindings: media: sun4i-a10-video-engine: Add H616 compatible
  staging: media: sunxi: cedrus: add H616 variant
  arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for video
    engine
  arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video engine

Jernej Skrabec (1):
  arm64: dts: allwinner: sun50i-h616: Add video engine

 .../allwinner,sun4i-a10-video-engine.yaml     | 45 ++++++++++++++++++-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  4 +-
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 +++++
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  4 ++
 4 files changed, 61 insertions(+), 4 deletions(-)

-- 
2.47.3


