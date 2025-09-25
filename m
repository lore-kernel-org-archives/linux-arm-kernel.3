Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ABFCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZEr/DunUodcbsHjhFeEGbYikZRjo3YM0O9AspiM+UY=; b=MHKVqVz87xE0uNkW3oK0EjFe0F
	UiM5m2yTQ4pBGZpRyoVEoMYNKe8xEyp/ndgqqd9nRbnF13u0+0VTNjf7dqx5qN3mVbCIHhKdMmvNo
	jpTJqEBOYERvv8Y8JRYc9Pq/+ha0I1UN69MsCywbuXmzwYGjlUeIJiKU9Q9owJ6VL3DuFAGeIB3kR
	ZBy0K6wSqZzC4G2i3389RgpXdxiNbcgVo2kTo6F1WwiDBpKhaqej7/hfdNME2nL2swZqKNKM/8k7q
	CabYJ7QoElERuNkeNxyk+BAkmOg28Ht8se64H4cIarTE+z1FSdkkuVKZPSOENQURMlnsN21B0z5yG
	SCtWn9OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1n0R-0000000A4rc-0UNK;
	Thu, 25 Sep 2025 14:31:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1n0O-0000000A4mh-2d1v;
	Thu, 25 Sep 2025 14:31:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758810690;
	bh=3fkmVe49ZqkNZbH1Ddxixn6eJb+ThovqAzK3HkVrxFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nwiWN0H5lhiw9Rka8oEhxPOK0qcEqmntHsIVnB/MfUgYc85hSxMu5ExsMAZZTzhlK
	 tUR/4A7Nl5gJlPgwOQ+rRH5kPudgeq6s4RFwDCPdAI9+br3K/6MDX+XousJKWvoGuE
	 Yp2XNgLnD747g7hOG4lboL0sGUpUYsmj6dxpu4X3RLieLYpueFwHnK3UGHUf0q71D9
	 geDUCVc7PeQ7gCWeYFdLUctZVGcxzpMcZ+yG6GdVTYvMt+YylQoSlhkFNYDNr5V9si
	 EP+CZNvngFF+T4tb9NdnS+Tpll/RV5v/lHu2/wnpTKZZFfl3b4dqXxGqsMDD2Y5ts4
	 LsFDD0u4MCHRw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 81DAF17E1389;
	Thu, 25 Sep 2025 16:31:29 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ulf.hansson@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	fshao@chromium.org,
	y.oudjana@protonmail.com,
	wenst@chromium.org,
	mandyjh.liu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 1/5] dt-bindings: power: Add support for MT8196 power controllers
Date: Thu, 25 Sep 2025 16:31:12 +0200
Message-ID: <20250925143122.39796-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925143122.39796-1-angelogioacchino.delregno@collabora.com>
References: <20250925143122.39796-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_073132_836562_5FD40C90 
X-CRM114-Status: GOOD (  14.10  )
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

Add support for the power controllers found in the MediaTek MT8196
Chromebook SoC.

This chip has three power controllers, two of which located in the
SCP subsystems (where one can be directly controlled and the other
can be controlled only through the HW Voter IP), and one located
in the Multimedia HFRP subsystem, controllable only through the HW
Voter IP.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../power/mediatek,power-controller.yaml      |  4 ++
 .../dt-bindings/power/mediatek,mt8196-power.h | 58 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 include/dt-bindings/power/mediatek,mt8196-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 500d98921581..f8a13928f615 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -33,6 +33,9 @@ properties:
       - mediatek,mt8188-power-controller
       - mediatek,mt8192-power-controller
       - mediatek,mt8195-power-controller
+      - mediatek,mt8196-hwv-hfrp-power-controller
+      - mediatek,mt8196-hwv-scp-power-controller
+      - mediatek,mt8196-power-controller
       - mediatek,mt8365-power-controller
 
   '#power-domain-cells':
@@ -157,6 +160,7 @@ allOf:
           contains:
             enum:
               - mediatek,mt8183-power-controller
+              - mediatek,mt8196-power-controller
     then:
       properties:
         access-controllers:
diff --git a/include/dt-bindings/power/mediatek,mt8196-power.h b/include/dt-bindings/power/mediatek,mt8196-power.h
new file mode 100644
index 000000000000..c12f0fe8f4c1
--- /dev/null
+++ b/include/dt-bindings/power/mediatek,mt8196-power.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2025 Collabora Ltd
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT8196_POWER_H
+#define _DT_BINDINGS_POWER_MT8196_POWER_H
+
+/* SCPSYS Secure Power Manager - Direct Control */
+#define MT8196_POWER_DOMAIN_MD				0
+#define MT8196_POWER_DOMAIN_CONN			1
+#define MT8196_POWER_DOMAIN_SSUSB_P0			2
+#define MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0		3
+#define MT8196_POWER_DOMAIN_SSUSB_P1			4
+#define MT8196_POWER_DOMAIN_SSUSB_P23			5
+#define MT8196_POWER_DOMAIN_SSUSB_PHY_P2		6
+#define MT8196_POWER_DOMAIN_PEXTP_MAC0			7
+#define MT8196_POWER_DOMAIN_PEXTP_MAC1			8
+#define MT8196_POWER_DOMAIN_PEXTP_MAC2			9
+#define MT8196_POWER_DOMAIN_PEXTP_PHY0			10
+#define MT8196_POWER_DOMAIN_PEXTP_PHY1			11
+#define MT8196_POWER_DOMAIN_PEXTP_PHY2			12
+#define MT8196_POWER_DOMAIN_AUDIO			13
+#define MT8196_POWER_DOMAIN_ADSP_TOP_DORMANT		14
+#define MT8196_POWER_DOMAIN_ADSP_INFRA			15
+#define MT8196_POWER_DOMAIN_ADSP_AO			16
+
+/* SCPSYS Secure Power Manager - HW Voter */
+#define MT8196_POWER_DOMAIN_MM_PROC_DORMANT		0
+#define MT8196_POWER_DOMAIN_SSR				1
+
+/* HFRPSYS MultiMedia Power Control (MMPC) - HW Voter */
+#define MT8196_POWER_DOMAIN_VDE0			0
+#define MT8196_POWER_DOMAIN_VDE1			1
+#define MT8196_POWER_DOMAIN_VDE_VCORE0			2
+#define MT8196_POWER_DOMAIN_VEN0			3
+#define MT8196_POWER_DOMAIN_VEN1			4
+#define MT8196_POWER_DOMAIN_VEN2			5
+#define MT8196_POWER_DOMAIN_DISP_VCORE			6
+#define MT8196_POWER_DOMAIN_DIS0_DORMANT		7
+#define MT8196_POWER_DOMAIN_DIS1_DORMANT		8
+#define MT8196_POWER_DOMAIN_OVL0_DORMANT		9
+#define MT8196_POWER_DOMAIN_OVL1_DORMANT		10
+#define MT8196_POWER_DOMAIN_DISP_EDPTX_DORMANT		11
+#define MT8196_POWER_DOMAIN_DISP_DPTX_DORMANT		12
+#define MT8196_POWER_DOMAIN_MML0_SHUTDOWN		13
+#define MT8196_POWER_DOMAIN_MML1_SHUTDOWN		14
+#define MT8196_POWER_DOMAIN_MM_INFRA0			15
+#define MT8196_POWER_DOMAIN_MM_INFRA1			16
+#define MT8196_POWER_DOMAIN_MM_INFRA_AO			17
+#define MT8196_POWER_DOMAIN_CSI_BS_RX			18
+#define MT8196_POWER_DOMAIN_CSI_LS_RX			19
+#define MT8196_POWER_DOMAIN_DSI_PHY0			20
+#define MT8196_POWER_DOMAIN_DSI_PHY1			21
+#define MT8196_POWER_DOMAIN_DSI_PHY2			22
+
+#endif /* _DT_BINDINGS_POWER_MT8196_POWER_H */
-- 
2.51.0


