Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0127C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pR8uwAyXOrR6BQhUMXBC/VDlghiJUVBw4dT2CrtlLU=; b=mXOp/wluGjpEn7LrH7JiiXcEF9
	OnP5BsRtQThYxKrsco9INs/SkKGwRy42k0z966N1uU7RlHhJSbQHJ53/kJfh2nPh15ApYXYjL5sp2
	4r6Lbe47WPSYZtYEH9kxX80MlFmcfpLWQhQLpGQyzIdopalu44VBQbwbOYbNZChnKWMeH4dxh2IsY
	/KhGrsLXHZmLKQK2PreyACnZTW/mtK+Y2Ibyyt7MsLXJ27COHk0EJWB0QvgfaiTASjkgBZd8QPYoU
	E3S+uqikK8o23ij3qZwxsxYiQYvHmKPV6GhL1m62lnC0Do4t7jLBLVblzkDiK5jcfYBbFTU/UfBhs
	ddeUB/vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkP8-00000001Tus-0zuP;
	Thu, 09 Jul 2026 08:46:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkP5-00000001Tsi-08N3;
	Thu, 09 Jul 2026 08:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783586801;
	bh=n2rtxDpW28tQqpUdcTdDJfoTHpu2QkpMLw+Abe0Jg3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l/sG9Al+KdlJ/5lPCLhdl4zSUn5svMza+wyH4aPuQMuFYldRmvWolcDhYxIFdvwaG
	 JxJuSSBSfRj7ufqlqdSnSBYKztqzbwWTUI8r6wv50C0N4O6nCd9kogTLYe6pC/Q+iI
	 QZAMQ+8Ba5kdbbico2oFB7hlVnIZhen6Z/riymPahNP+Q8Pgf/8WoTQZqNnWSTqhsk
	 76PvbHZVWSKiya++k+4aS5bTGzrgqMbTlpy5E4t77OGVql3fugO5pI4wBslDwpWBpj
	 IbT5sstqgqOhlfeJKdW4WyRgwtt7zPF5id2GPd+DfxvtTaqivovg5VNVfQE64NDQyF
	 bqwTcfNs7ZzhQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D13F17E0CDE;
	Thu, 09 Jul 2026 10:46:40 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ulfh@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	irving-ch.lin@mediatek.com,
	macpaul.lin@mediatek.com,
	aford173@gmail.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	justin.yeh@mediatek.com,
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/5] dt-bindings: power: mediatek: Add support for MT8196 direct HFRP
Date: Thu,  9 Jul 2026 10:46:31 +0200
Message-ID: <20260709084635.24912-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com>
References: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_014643_221367_8793CE95 
X-CRM114-Status: UNSURE (   9.58  )
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

Add support for the HFRPSYS direct control power domains in the
MT8196 SoC, controlling power for the DisplayPort and for the
Embedded DisplayPort Transmitter IPs.

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/power/mediatek,power-controller.yaml  | 1 +
 include/dt-bindings/power/mediatek,mt8196-power.h             | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 07f046277f8a..070c6e5666dc 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -34,6 +34,7 @@ properties:
       - mediatek,mt8189-power-controller
       - mediatek,mt8192-power-controller
       - mediatek,mt8195-power-controller
+      - mediatek,mt8196-hfrp-power-controller
       - mediatek,mt8196-hwv-hfrp-power-controller
       - mediatek,mt8196-hwv-scp-power-controller
       - mediatek,mt8196-power-controller
diff --git a/include/dt-bindings/power/mediatek,mt8196-power.h b/include/dt-bindings/power/mediatek,mt8196-power.h
index 0f622a93c807..085790bf8124 100644
--- a/include/dt-bindings/power/mediatek,mt8196-power.h
+++ b/include/dt-bindings/power/mediatek,mt8196-power.h
@@ -30,6 +30,10 @@
 #define MT8196_POWER_DOMAIN_MM_PROC_DORMANT		0
 #define MT8196_POWER_DOMAIN_SSR				1
 
+/* HFRPSYS Multimedia Power Control (MMPC) - Direct Control */
+#define MT8196_POWER_DOMAIN_EDPTX			0
+#define MT8196_POWER_DOMAIN_DPTX			1
+
 /* HFRPSYS MultiMedia Power Control (MMPC) - HW Voter */
 #define MT8196_POWER_DOMAIN_VDE0			0
 #define MT8196_POWER_DOMAIN_VDE1			1
-- 
2.54.0


