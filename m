Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB9DC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOVxH9t50z2mxC0bReHcwFEZS+zI/QXisi8z9/R9uFA=; b=aEmaQmTf1esMafyk+tE+EvyDDS
	DkKOFmq/9tDqxr7CEDw163QqkETSRXOL4LDjwtS+8o1qbaOeKHorzmOn6/zto78UdDbCcg7nVZotf
	XMgZ8DCIdQTQ3plJ6hvAz1g+075XmE70se+g9A0DF27H8jn/r5Nl44YIf77D3ZABBGhQxmZIVMBsY
	HcTHnTKGfG5KB+5MCUX3DMQR+SgZ/PrUI9Ej9dcNyUR6tY9zPAjejsoUk3YJADR3IHSxQ38pErG4A
	Op+iwaaNO7Y4P7kWIn5p3CcHaxjHZX0q2bcuF+2xGX0/kftURNYfoVq5TEa0pM0+8WIUyzsS2N1kD
	5T4AZQeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uI2-0000000B6kN-3rko;
	Thu, 10 Apr 2025 15:58:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t4M-0000000AsKC-2scO;
	Thu, 10 Apr 2025 14:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744295993;
	bh=UM8eRGMMrRlZ9igteIR0+9yJOLiReCR0kDQJdYbv4lA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZmOQdVz9NGS7NtFcyLuTddjNxN/VL6lXI10K5TmTGBFSR+g4LggqeFGpH3bYffs96
	 zCVbGjwNHHlKNUictGQELTvAUbebWiIf34aCRUGIuiInyxvI7NFmLqc8fE8A2ZMSSI
	 0c+eqKx4Rv5aqtfEnVli1ceZntCv2/RbvJGr2e6kpuVbLbEjEz/cQHJNIWGU3ZhvmT
	 Ls3Bb5mZnSEMQ6k5aHgu1BKThYHDFzd7cflyMd9pKMivsqHKi7zmvjPnaTQuG0AGZt
	 BBZ0o6uVJpwK2WDqTzftQJrpY4Hsr6yss4Rr/hFGxiJuK17OYFDagSwog/J+/k0Kqt
	 eVGcsYEuJNobg==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 45AD717E0CA7;
	Thu, 10 Apr 2025 16:39:51 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	fshao@chromium.org,
	y.oudjana@protonmail.com,
	wenst@chromium.org,
	lihongbo22@huawei.com,
	mandyjh.liu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/3] dt-bindings: power: mediatek: Support Dimensity 1200 MT6893 MTCMOS
Date: Thu, 10 Apr 2025 16:39:42 +0200
Message-ID: <20250410143944.475773-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410143944.475773-1-angelogioacchino.delregno@collabora.com>
References: <20250410143944.475773-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_073954_875136_B89CAB7C 
X-CRM114-Status: GOOD (  10.98  )
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

Add support for the Power Domains (MTCMOS) integrated into the
MediaTek Dimensity 1200 (MT6893) SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../power/mediatek,power-controller.yaml      |  2 ++
 .../dt-bindings/power/mediatek,mt6893-power.h | 35 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 include/dt-bindings/power/mediatek,mt6893-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 591a080ca3ff..9c7cc632abee 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -25,6 +25,7 @@ properties:
     enum:
       - mediatek,mt6735-power-controller
       - mediatek,mt6795-power-controller
+      - mediatek,mt6893-power-controller
       - mediatek,mt8167-power-controller
       - mediatek,mt8173-power-controller
       - mediatek,mt8183-power-controller
@@ -88,6 +89,7 @@ $defs:
         description: |
           Power domain index. Valid values are defined in:
               "include/dt-bindings/power/mt6795-power.h" - for MT8167 type power domain.
+              "include/dt-bindings/power/mediatek,mt6893-power.h" - for MT6893 type power domain.
               "include/dt-bindings/power/mt8167-power.h" - for MT8167 type power domain.
               "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
               "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
diff --git a/include/dt-bindings/power/mediatek,mt6893-power.h b/include/dt-bindings/power/mediatek,mt6893-power.h
new file mode 100644
index 000000000000..aeab51bb2ad8
--- /dev/null
+++ b/include/dt-bindings/power/mediatek,mt6893-power.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2025 Collabora Ltd
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT6893_POWER_H
+#define _DT_BINDINGS_POWER_MT6893_POWER_H
+
+#define MT6893_POWER_DOMAIN_CONN		0
+#define MT6893_POWER_DOMAIN_MFG0		1
+#define MT6893_POWER_DOMAIN_MFG1		2
+#define MT6893_POWER_DOMAIN_MFG2		3
+#define MT6893_POWER_DOMAIN_MFG3		4
+#define MT6893_POWER_DOMAIN_MFG4		5
+#define MT6893_POWER_DOMAIN_MFG5		6
+#define MT6893_POWER_DOMAIN_MFG6		7
+#define MT6893_POWER_DOMAIN_ISP			8
+#define MT6893_POWER_DOMAIN_ISP2		9
+#define MT6893_POWER_DOMAIN_IPE			10
+#define MT6893_POWER_DOMAIN_VDEC0		11
+#define MT6893_POWER_DOMAIN_VDEC1		12
+#define MT6893_POWER_DOMAIN_VENC0		13
+#define MT6893_POWER_DOMAIN_VENC1		14
+#define MT6893_POWER_DOMAIN_MDP			15
+#define MT6893_POWER_DOMAIN_DISP		16
+#define MT6893_POWER_DOMAIN_AUDIO		17
+#define MT6893_POWER_DOMAIN_ADSP		18
+#define MT6893_POWER_DOMAIN_CAM			19
+#define MT6893_POWER_DOMAIN_CAM_RAWA		20
+#define MT6893_POWER_DOMAIN_CAM_RAWB		21
+#define MT6893_POWER_DOMAIN_CAM_RAWC		22
+#define MT6893_POWER_DOMAIN_DP_TX		23
+
+#endif /* _DT_BINDINGS_POWER_MT6893_POWER_H */
-- 
2.49.0


