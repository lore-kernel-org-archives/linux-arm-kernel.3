Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A70CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BUON3NcMzSF1mWfu3HxXzDVg+x3bO0PMZLKsvIPiouQ=; b=VkO9jNC9+FU6B5CUTrLabp6Bf/
	fNSth6d5zcLU9qSK2tFvVUCp5JsEdpg0VtidEaNqipKTGfgx2CExNV7q4yBvhgkJ6GNWb0y37QdSO
	7QGAjUkDxpnvZEwzrU+O4NV2W4aLzNhvOM9eib+kqlZqpG4CDDklx1/GJI1/wq/stcD0n11Fk4QFS
	529mY9UIM8Q2Q9o/4ZsjDdoU/R+xeq5uMhHXCwsKTw8UpP2bhjWt1o3mbdcQwqF9bC3HxhLvYaVVO
	6/ghJtDRlkJ31Gg6atE0kZOwt2kxM9O43OwIFYTxynaPediUI+Z8X/NDnGULDxFJsSuNvZ+Ir5k0T
	gEN8VAKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKG8O-0000000GNU4-1qqr;
	Tue, 05 May 2026 13:48:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKG8M-0000000GNS2-218X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:48:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FFFC60181;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D42C2BCB4;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777988901;
	bh=AG0oKwGOLP7O1AKKR+FpbgNj0bCG/wVgOoeQV3TqI0c=;
	h=From:To:Cc:Subject:Date:From;
	b=qQQymP0JMuJLCD/jYY8/0Y0PKc2gOEr7Jedi1Aw2st+I2JzEGvC709NwpL+YHivz2
	 tkYlQSW4xCrOBj+TorwBIVmIXDz47Ym519qG/rR18hdeQvKOSa4Mwy0pjmVw69hcKb
	 MR12+5n2hof8yV4KH8xa6Ho9zLe/ydUU1JNUIa4BpzsF6TR7tzAJ7vdJ03cCJF1dj6
	 GTwoASfa78iolU9CsZOWqozr2ibFTyeim3b7V+V08Y0+xZfjRkMf3mQTG9izHJp9qf
	 JBtIPDpGnZ+MgicoeFDLfNwVwfqUFtOgNVKzAKKAxAtlQh71knfVtl9JW6tHa0askv
	 Baj7+Hj25B+Sw==
Received: by wens.tw (Postfix, from userid 1000)
	id 2B4DD5FEF9; Tue, 05 May 2026 21:48:19 +0800 (CST)
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
Subject: [PATCH 0/7] arm64: allwinner: h616: Support Video Engine
Date: Tue,  5 May 2026 21:48:04 +0800
Message-ID: <20260505134812.408316-1-wens@kernel.org>
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
  drivers: staging: media: sunxi: cedrus: add H616 variant
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


