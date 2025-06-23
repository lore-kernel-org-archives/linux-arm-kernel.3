Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE159C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 20:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNbtXfoROOGENnIhj0St4Ujr/IfUrEe2EoIgQH/TUrU=; b=wSQ9H+M4+FZpFtGNKgBneZurg6
	oSkiV517sm8mpYuIjCoS2dE3XZDTaNaxczFV4k8KEz2jWtMCazjZU93DdU6NXh+gSb+1JWCQ5l5KY
	PNvI/TtpMVFe/aRjE75Mb18m/Z46/IHuDuj5MrdwrjgbLCLrSk4dG6TG2+ldDyJL687v6XCVla4QX
	FzRjbwcY+WoA1qQ/hY8W/a5H4YKlG9vWecGU/F2GO1XQnqi0CeHbiLD3KCDYaoDroMrKhSrVDrYAy
	2n/N+eyd02PKzXNWar9UmU3iwJKJv8j9a3dJXoPATCdHAS9xDkArQqfauVSgUFRKZLbiwptZ9nUxF
	BsMq/Nrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnii-00000003vDs-0WS7;
	Mon, 23 Jun 2025 20:24:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfsI-00000002bH4-3vII;
	Mon, 23 Jun 2025 12:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680129;
	bh=4dKUDczoGa8qRf5DezoFpKNCqMG6eX7Drv2Hgw9/NU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K1GIhk6hefmyESPFFNmpyVCTUjipAWfpTZ6FhEgKsIL72MJ63mobznJmA8+udb+V1
	 N6RLlAbzhfb/35KcZhk8WqOADYXgg9eSK4YJnXpeIcn0Dvc4ZVwY0acXEEkUh44PWD
	 fWIlY6ofF5c4cdH8KdoCF/In7D5ee2uj1Zb8AwUQ44JqghmM/LLmWx9nGBkytjA4Ss
	 B6OAV61/tQ378rSi9O3PY+BdBWP9iMCtCRLVCrNotCwjJF4YAFcxdnrThRXlvvIUqc
	 zeZHr279I1LOg18e9cbv0z38ak0XQ4SJSg2ECaJqpJjrEPsYXuxz0ywIKJDBC978PJ
	 wDGZg4EmGnptg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C6EAA17E0342;
	Mon, 23 Jun 2025 14:02:08 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	y.oudjana@protonmail.com,
	fshao@chromium.org,
	wenst@chromium.org,
	lihongbo22@huawei.com,
	mandyjh.liu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 11/13] dt-bindings: power: Add support for MT8196 power controllers
Date: Mon, 23 Jun 2025 14:01:52 +0200
Message-ID: <20250623120154.109429-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
References: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050211_124596_252C943B 
X-CRM114-Status: GOOD (  13.19  )
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../power/mediatek,power-controller.yaml      |  4 ++
 .../dt-bindings/power/mediatek,mt8196-power.h | 58 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 include/dt-bindings/power/mediatek,mt8196-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 2530c873bb3c..f55fe2c3060d 100644
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
@@ -160,6 +163,7 @@ allOf:
           contains:
             enum:
               - mediatek,mt8183-power-controller
+              - mediatek,mt8196-power-controller
     then:
       properties:
         mediatek,bus-protection:
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
+#endif /* _DT_BINDINGS_POWER_MT8188_POWER_H */
-- 
2.49.0


