Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45D4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bH09EUYZUikbeq5h9N9YxfXxQg4ATgGyeFn9CLLtb8M=; b=JMRaqlf170zCEGA8GQyppU0u48
	2/+oeOd4M2nPBdLWagcgY6/xc3fWMmJuFb7v319n4TjWKOK6Cibhf18gq8TL6kflJQJ2iocaXV7WJ
	UIE2hMqwo5Hky5miV3Z7UAUEEMtXjHjpINATDCZkdlkhoMfiHNTyIyznXsO8QG6S91ZftY2f81wlg
	tXCoFyCLXmgm4E2x406hFnmBjPkMt8TW2g+s3XPvj1sG0d1FWx2h9YTRcva54CbtcBX4Wq1JqT8rW
	dPRNaxmcguAYhQ+X7Wx1hoQAcUFjMGp81oTVMdTleaGdsXjaKMpNYOCJhJWMRgVgQrS4JxhCVbZRN
	8ASEDQCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9vb-00000006yaG-3YB2;
	Wed, 12 Feb 2025 10:25:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9b8-00000006ufy-2MAt;
	Wed, 12 Feb 2025 10:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739354641;
	bh=8gwwanPEnjOVfUVp0WRUpBFYyCdDpvG9FjVwyVI7Dbw=;
	h=From:To:Cc:Subject:Date:From;
	b=BhHkKrsqnofPKSE2FYG2N2nqv1F2YW6EkyIil2ayb0kLsgbivUjH4opF5/DWWrqoC
	 Mukn0tu4tA2ChsaLHuwNt3gl4NkfmQ9Sk+wUQEt0zSY8b6J+qOrr4WYfzCfFHKxNwm
	 MLnze3dR+VngLb3k1y5qouk+rVBR4BZ71vP01faL6g5Cb71gOVbliRiTe/+J2SpT5D
	 GOUE6sQ/SgEJlkrZir+uqcqAQwW6Qehe912bA9vz9rbhWWzm9tGzm/WqT42HRjm75V
	 KPDwrMpkQni5kSIQr9QRKGiV0lxxbtqpkXtRY/7r+rf8kme7YWGRmFjeUDpNEv0Xr0
	 Tk5NE32PbBmHA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 224EF17E0C9D;
	Wed, 12 Feb 2025 11:04:00 +0100 (CET)
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
	macpaul.lin@mediatek.com,
	pablo.sun@mediatek.com
Subject: [PATCH v2 1/2] dt-bindings: clock: mediatek,mt8188: Add VDO1_DPI1_HDMI clock
Date: Wed, 12 Feb 2025 11:03:41 +0100
Message-ID: <20250212100342.33618-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_020402_746891_D1D4D608 
X-CRM114-Status: GOOD (  10.11  )
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

Add binding for the HDMI TX clock found in the VDO1 controller.
While at it, also remove the unused CLK_VDO1_NR_CLK.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 include/dt-bindings/clock/mediatek,mt8188-clk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/mediatek,mt8188-clk.h b/include/dt-bindings/clock/mediatek,mt8188-clk.h
index bd5cd100b796..0e87f61c90f4 100644
--- a/include/dt-bindings/clock/mediatek,mt8188-clk.h
+++ b/include/dt-bindings/clock/mediatek,mt8188-clk.h
@@ -721,6 +721,6 @@
 #define CLK_VDO1_DPINTF				58
 #define CLK_VDO1_DISP_MONITOR_DPINTF		59
 #define CLK_VDO1_26M_SLOW			60
-#define CLK_VDO1_NR_CLK				61
+#define CLK_VDO1_DPI1_HDMI			61
 
 #endif /* _DT_BINDINGS_CLK_MT8188_H */
-- 
2.48.1


