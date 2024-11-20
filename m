Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2114DD711C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 17:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zzDj6yCZkQ0kdEG+1Z3urXjVDtBBpv3XWtoP1TTQkw8=; b=iPaugu1PVWX4h2F4J0WIzkPxaM
	poalPwRIdk/hNpNGK/wromtNExVUdB8sBE+28YsJtTeZ2i7SNqKPblV2+GzlveOK68jVclOR3+9bl
	NVkbeDPrHcaIRSdeNznjt4lJ+yUBF6JWcXTyhXDygKelER8yzxD5Uc49SlUOxTpOG3/UVs6tw9fIP
	hVsdECITmg4oJ64fiL8b8lGwNQ01I87vURt32e6vJ+vIpDIcLMAS0pr8nCk0KncI4/vGv3+a1GK8X
	BZpwOl31Go3KUPg4lGGWvBs7FZAYZk2N6Ikornuf11wTM7w83NrofBueQmDQ4q2MTPdharMahmXXV
	SIbZDxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDoFS-0000000FtNV-0vER;
	Wed, 20 Nov 2024 17:12:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDoED-0000000Ft4s-1nV3;
	Wed, 20 Nov 2024 17:10:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0582CA432AA;
	Wed, 20 Nov 2024 17:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FF7C4CECD;
	Wed, 20 Nov 2024 17:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732122656;
	bh=VJdjT6ppJprT4unzbTuHlpuOe7eotljxYhNyiiIDt0Y=;
	h=From:To:Cc:Subject:Date:From;
	b=VCAmAgCFc4MqFHVUiXQOtPe3ldhIVEB2Vi3m5p6HeGLxcC/BWIaLuz/2A0b3ZPgsb
	 0G8CSJ49EPe8GodYk6rK3siKIljTgwE5Tuuis6CZm21TkPUCKTq2Azc+qzRGXnUosW
	 V0WQnpFrO3BbzIzo4+onMaVXEnZTnNccTSoyiA9smC/ZZrd6YosgZACnJy7Nw82Gk7
	 HWWgah5+Sbg+YvFflit9WKCGR8LgOBF0KnlnQAi4MwwCnfrU9oNU8//4bpC40qQJj3
	 5cWPsFQcDv66KEUQyU2vDTTbTEvyL569WX8jTDoqYtbVs3Tp8y09c6tcse5eMSsw9A
	 Lv1lGAYd+YQDw==
From: Niklas Cassel <cassel@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Niklas Cassel <cassel@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] arm64: dts: rockchip: rk3588: add msi-parent for pcie3x4_ep
Date: Wed, 20 Nov 2024 18:10:49 +0100
Message-ID: <20241120171048.2839621-2-cassel@kernel.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246; i=cassel@kernel.org; h=from:subject; bh=VJdjT6ppJprT4unzbTuHlpuOe7eotljxYhNyiiIDt0Y=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGNLtJCRWz16pzvmPVeuiPsvs2Q01M49MZPxpbvzUsut2x V+JMge3jlIWBjEuBlkxRRbfHy77i7vdpxxXvGMDM4eVCWQIAxenAEwkKoThn07qattteTXf3Gti txhsmS5ZZ//N7uG81Udl1+U3RHi1KDIy3DJmZznq97ry9LaV337Kq/sUXrDVvCa+4uuX0JXnreb lMwIA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_091057_528712_0DDBD143 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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

Add msi-parent for the pcie3x4_ep PCI endpoint node.

The pcie3x4_ep node should use the same msi-parent as the pcie3x4 node
(which represents the PCIe controller running in Root Complex mode).

The GIC ITS can be used to trigger an IRQ on the endpoint when any of
the endpoint's PCI BARs are written to by the host[1].

[1] https://lore.kernel.org/linux-pci/20241116-ep-msi-v8-0-6f1f68ffd1bb@nxp.com/

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
Hello Heiko, this patch depends on:
https://lore.kernel.org/linux-rockchip/20241107123732.1160063-2-cassel@kernel.org/

 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index 4a950907ea6f..ead151941e84 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -213,6 +213,7 @@ pcie3x4_ep: pcie-ep@fe150000 {
 		interrupt-names = "sys", "pmc", "msg", "legacy", "err",
 				  "dma0", "dma1", "dma2", "dma3";
 		max-link-speed = <3>;
+		msi-parent = <&its1 0x0000>;
 		iommus = <&mmu600_pcie 0x0000>;
 		num-lanes = <4>;
 		phys = <&pcie30phy>;
-- 
2.47.0


