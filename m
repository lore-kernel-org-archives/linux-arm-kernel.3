Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE279D185CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 11:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87O3JqIkZHp6I/ueZ3YnKx42k5g2M8EmXTH6VBq5jz0=; b=HrnGF1SaSXh7wvuI76S8Jwx3Gb
	sU+PPQtMIDNYRXs9zAKbeEdFZhA97bmCil4iL/z2dM2L8eosDj7DomWDfyxaSCi4EP263gkuydjKu
	zl1eVcilBlNh9DHts1BSJ+BDI2e91Db3xNAtAi1KF8/5JCSTt3A/VVZZZBiVmL1dDh0m/qBA2gnXa
	A+cxYkQNNBT3+Ae1zNNKDUQ39n23MsOvHH67QhNH0eu0bXVRumlr7pCtdTBZKOSmiiN5+fjvk8KPQ
	l5IDir7cCWoa46dpbGBVf5V/40roXSiGyo1w4VpVmRMCDLrtSBWDJZT/ztTyMEfFQrNeewXqNrq4U
	doiYe2Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnmo-0000000GmRB-3ik7;
	Thu, 08 Jan 2026 11:02:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnmj-0000000GmLW-26Ke;
	Thu, 08 Jan 2026 11:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767870150;
	bh=gw1VaxWzqkyKrA2KxIUxIvewB29jkb6zfBD6Cnr2AVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ST55Cl/be8Fa/ix2tx495kwY7maMiNlOVgAfRBDwMT/EbwANxJbtE7qMSdG4JunKA
	 vD1WBXNOVPku7kPatEmReCNA7MEM4E19JGCHGFHtR9Kn+l6FpGvIthi39x+ZcH51BU
	 YAQt2Vvebpu3cMxTNEIT5CJ3WTcahG+JKY6s9F2lms8k65cP0D+6Ek1zIUqHkMEAvV
	 JAtgd+uMOclMrNnPUetWYcn93kzwvb897z2ljNyJfllLvecWki7RKh2XuyyPDgrqJB
	 yU+Zw+rWzTyVIzozFUMtZTy8/BBktKCBI5lqBVzPtCoyixLTVjoHDuJZdwWMThZNy6
	 89ib0hnK7LKlw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 476B217E1529;
	Thu,  8 Jan 2026 12:02:30 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk+dt@kernel.org
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	conor+dt@kernel.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	atenart@kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 3/4] arm64: dts: marvell: Add SoC specific compatibles to SafeXcel crypto
Date: Thu,  8 Jan 2026 12:02:22 +0100
Message-ID: <20260108110223.20008-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108110223.20008-1-angelogioacchino.delregno@collabora.com>
References: <20260108110223.20008-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_030233_694354_15F09C9D 
X-CRM114-Status: GOOD (  10.15  )
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

Following the changes in the binding for the SafeXcel crypto
engine, add SoC specific compatibles to the existing nodes in
Armada 37xx and CP11x.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi  | 3 ++-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index c612317043ea..87f9367aec12 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -427,7 +427,8 @@ xor11 {
 			};
 
 			crypto: crypto@90000 {
-				compatible = "inside-secure,safexcel-eip97ies";
+				compatible = "marvell,armada-3700-crypto",
+					     "inside-secure,safexcel-eip97ies";
 				reg = <0x90000 0x20000>;
 				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
index d9d409eac259..39599171d51b 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
@@ -512,7 +512,8 @@ CP11X_LABEL(sdhci0): mmc@780000 {
 		};
 
 		CP11X_LABEL(crypto): crypto@800000 {
-			compatible = "inside-secure,safexcel-eip197b";
+			compatible = "marvell,armada-cp110-crypto",
+				     "inside-secure,safexcel-eip197b";
 			reg = <0x800000 0x200000>;
 			interrupts = <88 IRQ_TYPE_LEVEL_HIGH>,
 				<89 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.52.0


