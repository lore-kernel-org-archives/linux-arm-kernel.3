Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C8FCD3440
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vWl+8/JImjyD4t9bOUMvA2yHONgs8yy+5gzvJcqLaJQ=; b=SSpwgo+iKswmvrmQ3ulOojt1O5
	McaKsQ7/wi3y1p5xEkajzJv78k+HTTdp4i91w/nOAXL5aT3kxSOhEUYyK0fyn0F76MzPuSMlQTKL0
	MGFK+3E7qBTV0gWp7q5H6XtRT6UsivMjsarirCTfDMCiFIXHBxKMj3EakQvrv2jp/Aa3vJ+s4kswA
	6O/lJI8ssTuolP90fq+P0JCUceHLILyv/Fo8XElGcTvP5ccf2MZR/DSfXb0Z5b5IcjAdZvvlYN0Gh
	SWN279Y8y/elbBj0B4e4OWffdXK9WVF1IFnfQbIZrkhIf8zdcQO8JAkk+cuCRu51Bnlt5oFWzgOFL
	i8yuGtjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKG8P-0000000GNVI-1VFA;
	Tue, 05 May 2026 13:48:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKG8O-0000000GNTP-1BQ8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B4204601EE;
	Tue,  5 May 2026 13:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEFAC2BCB4;
	Tue,  5 May 2026 13:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777988903;
	bh=wQgoGnngpTZW96/wSsSOQkYRjEid39CqoW4AdwUk8c8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qY0vU1hDz1VGwqEpu4PenJ508SsBSxkOb1qgmmPdpiJ2EfsOm1pO609+2NfbE8JoM
	 pQbhf+pZsGm7MebPGD3iRGI83ydhaddTYGDgZ2PlEQi+K8pz1JStqeUSfiU163lo1D
	 WBxsFpK6f+bTzjtioTM53vpnatbL2ZMwwD1md5VsZgTkbiDCSO//vPE1H3iTNMioah
	 ItKyfJoWunJyYNxO62qtVRmnxMrSyaLY3TtFtFZ+Vf3dfJih8dOG6dWbLB0BfE0p8r
	 iM4MMD1z17jqpB/8TKvd0mftJgY9vJLkfLAopSeIf0EXWNYZMl2Ctbp7j4nYrvdWoD
	 dOSzIKAgXOEsw==
Received: by wens.tw (Postfix, from userid 1000)
	id 61B5A5FFEA; Tue, 05 May 2026 21:48:19 +0800 (CST)
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
Subject: [PATCH 6/7] arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video engine
Date: Tue,  5 May 2026 21:48:10 +0800
Message-ID: <20260505134812.408316-7-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505134812.408316-1-wens@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
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

The video engine on the H6 actually has two IOMMU ports. The one already
listed is simply named "VE" in the user manual. The missing one is named
"VE_R" and is probably either read-only or used for reference frames.
Either way, it should be listed.

Add a reference to the "VE_R" IOMMU port to the video engine node.

Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 88c6e3e105c0..48c771223af4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -206,7 +206,7 @@ video-codec@1c0e000 {
 			resets = <&ccu RST_BUS_VE>;
 			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 			allwinner,sram = <&ve_sram 1>, <&de2_sram 1>;
-			iommus = <&iommu 3>;
+			iommus = <&iommu 3>, <&iommu 1>;
 		};
 
 		gpu: gpu@1800000 {
-- 
2.47.3


