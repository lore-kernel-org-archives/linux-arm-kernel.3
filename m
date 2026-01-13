Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83398D0C852
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLrP/cVVrd6XV8OFVfRDXTiwaEY+PLg0nUSVIw6hDqw=; b=TGfxWyhBCN0tbwJ0TGqjrPzpA6
	akcDkmSOuUYu/PDxQEsFtYVVrpqQW7rraIq1BV4pAgKp5ClYZvrGMsQennCdQD0HYgy6MXexNIjEe
	uxWQzDOOTXuNssPTznYC2205bOL9Qxs3z7vU51vt8tRJXkojQ9btHnzdznOlbcfT3rw2iIGPW7PYl
	wqEQoKbRRd35+knKsxClc+H9i8ojOWmBlOJYn68d6BtLS/1hClVs4Y0iIrrLurr3BfSkJdh+mLA/i
	GksPfB48STbjwQNSq3gPAbXuD4Rvd8g1lFwpzNTAszugqNGN9DtVHBSsD1TTRfcC5g90iIqP8xJRc
	AvsHm8MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8X-00000006xGG-0Mwh;
	Tue, 13 Jan 2026 11:00:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8D-00000006wxj-0jVw;
	Tue, 13 Jan 2026 11:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768302009;
	bh=u65weYK7NpMKbZ0GoKI16YVgDU67PXN5aOx/v0oaUKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L7scX0yxN0bR06vP70FHOqwN1Ec6gq8GVw6fQVqQo6cHJkFDmL2Dq1nzzXAP4vIiW
	 J6EaSLLJtIVU38MGQpidFaSnEjJQpmTfKcUNEssmdmi3zsBM1sabNjc3c/CCmCn+td
	 ybWAHDM2+Hjev54IQexvRU1zhhZGktM17oO54Dxy264lp62ZTXWTHb/cDWGp35xWPs
	 xokR095qQhH239bfZX2HOjZGdk/rk4vbK2X0QCqSW1gl16Ia3fJDZmZRjjLttiltyt
	 XfFrZ9ofl/49B7dbIJGRQGXDxReefhG5ZOM8P+gYuMffpZsYcu/AnRwoZYl+I3ydrq
	 i/8aOpumWkxUA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C446617E1513;
	Tue, 13 Jan 2026 12:00:08 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sen.chu@mediatek.com,
	sean.wang@mediatek.com,
	macpaul.lin@mediatek.com,
	lee@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 5/6] arm64: dts: mediatek: mt6795: Fix issues in SCPSYS node
Date: Tue, 13 Jan 2026 11:59:59 +0100
Message-ID: <20260113110000.36953-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
References: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_030013_407786_E9EEBA29 
X-CRM114-Status: GOOD (  10.04  )
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

Add the "mediatek,mt6795-scpsys" compatible to the SCPSYS node
and remove #power-domain-cells (retaining it only in the power
controller subnode) to resolve dtbs_check warnings.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 58833e5135c8..ae2aaa51c9ad 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -287,9 +287,8 @@ pericfg: syscon@10003000 {
 		};
 
 		scpsys: syscon@10006000 {
-			compatible = "syscon", "simple-mfd";
+			compatible = "mediatek,mt6795-scpsys", "syscon", "simple-mfd";
 			reg = <0 0x10006000 0 0x1000>;
-			#power-domain-cells = <1>;
 
 			/* System Power Manager */
 			spm: power-controller {
-- 
2.52.0


