Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F36E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKBqqVzUazoTUC6/yMcXD0RTpolmdsbtts4tQH1K7PI=; b=Yo5NuRwS/H+huvYzH0WVATuBIX
	ww/jGDWDUpbA6rkIDzylIo9tGQ0d0Td8FtbJPhGaugctFU0ImN4fiudZSHftObmaZ+0wnlwYzEnsA
	dOILFNL1Q4m9ErX0GbXEfKrYPvZHgvCLP2VHCZaT9VzYxqizQ9s/zf9Us5XWUh4wViEitfvSQJ0Am
	4GKJ4Wsvo2kNwsRbB2tYCtfvlUeMs2T6v3fE4bmhZzZISL2gAWK0WyiiWJ+k45bzhmrEhmGLClP/s
	dRrREN+Yns6lgXA/0ygY1xZXYXILFX76bQIPgN0OhO+htHL31iOfaiJ7l7m9C1ANsq2Sescc8Iunr
	znCEzbDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrq2-0000000GNmc-1UPP;
	Wed, 18 Dec 2024 11:03:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrh9-0000000GLGu-06wZ;
	Wed, 18 Dec 2024 10:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734519261;
	bh=OsjV3elgMWob1PcNsx0uzAzBC5S2A9aK2c3a0YIZJWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rtwn3GkV1oiRZ4RaWsyO5f65mq/RNZ0Ht8J+TheL+5gXDy7QgEAHKpuFJuuBSqf6i
	 SQPbjhHRRV8jJIzwI9gq8WDfY+iWA0uSp092Xpuc5DDH0DBYc78XujUZMte1U95tYV
	 CnGK3i3DqWEAiokZ+N74PtzYVFXirH1Ucd5AstF/lhYfBhrSpAnHp5QS9RZrdsRtnB
	 0nsnc6JGQMeKzol64/K3VYhUt31pUeAJenhy14IPvIQpt5HMrHnLBgv41mkXJWUT9p
	 LPFOpWOOahLLGV9FuIHD+e5WaJ5AWfVZ9yP1KHH9qzIEfZz1h7CvahQbOeL3RV2Oa4
	 5N0JpXkgAGrsw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DB8817E3614;
	Wed, 18 Dec 2024 11:54:20 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	u.kleine-koenig@baylibre.com,
	amergnat@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com,
	macpaul.lin@mediatek.com
Subject: [PATCH v1 1/2] dt-bindings: clock: mediatek,mt8188: Add VDO1_DPI1_HDMI clock
Date: Wed, 18 Dec 2024 11:54:14 +0100
Message-ID: <20241218105415.39206-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241218105415.39206-1-angelogioacchino.delregno@collabora.com>
References: <20241218105415.39206-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_025423_234133_3D4809D2 
X-CRM114-Status: UNSURE (   9.11  )
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

Add binding for the HDMI TX clock found in the VDO1 controller

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 include/dt-bindings/clock/mediatek,mt8188-clk.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/mediatek,mt8188-clk.h b/include/dt-bindings/clock/mediatek,mt8188-clk.h
index bd5cd100b796..8af44560a74c 100644
--- a/include/dt-bindings/clock/mediatek,mt8188-clk.h
+++ b/include/dt-bindings/clock/mediatek,mt8188-clk.h
@@ -721,6 +721,7 @@
 #define CLK_VDO1_DPINTF				58
 #define CLK_VDO1_DISP_MONITOR_DPINTF		59
 #define CLK_VDO1_26M_SLOW			60
-#define CLK_VDO1_NR_CLK				61
+#define CLK_VDO1_DPI1_HDMI			61
+#define CLK_VDO1_NR_CLK				62
 
 #endif /* _DT_BINDINGS_CLK_MT8188_H */
-- 
2.46.1


