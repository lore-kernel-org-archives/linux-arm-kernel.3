Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7E0C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjqavUzXhlRngMpEfMckLBVam9YAxzxi7lB7pPi6XCQ=; b=fJ6jbwlybTV97WZCee1mI/MvdE
	a0ZLuaOF0JqbDoRWqbz4m33NkQfibn5zMijGIohZEx6QMU0rMpN/2oD1X6hkBAwzib3c8fYStyz+o
	L24i2BPhTswE2lITjASRsv3/TcnKUrIZahjGFZd/F9vn9KEPDlDfupd6KVp4wqoNYMj5s44AaTlKS
	fpkclgzvD68LrDTQB1Q5DuXCjc6nYqU/nNJehixQyjRpR7dNgM1rLMudsG7kdPwK0Hv5+ym4xczQA
	s/Di2uY/7FOUPnvYbeHF30mWLpXmfxWZzxluFGBtpBZYv9W0SGm+AKv3OHBCX4RBjlQyqKbmjZCB8
	P4NF+V6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiLH-000000035Sb-00z7;
	Mon, 23 Jun 2025 14:40:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfrr-00000002b4V-1VT1;
	Mon, 23 Jun 2025 12:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680102;
	bh=gbtG8/FPSoapFfBK9PFojeL8xN0vfOSrk+SUI+ArA44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DbtqbiGrPGc0dZ9y8hjZ9cDu/guznwGPO+PpujFkXw7zinQ6dMIHoghLtlg1UXGMF
	 IOQ0GqcE8mQel7ATHIV8MkDGoaSaEGAyAgpmwCJRJTy+4M/1If5hMnwvwjQhUQwetp
	 QcvPygO/MET03byT5A8W5EYeKrfsHC+2ISSGdt22gDS0rv3fjNcRmVytUDpHG+UzsK
	 pGtoNVI+0zpG1T0ogrDRwUwmb846qGsEpC7T8rKGPJZInEpt/D9YVFaeUkSp2ay2r0
	 YkYZqPmoG44xH/5HV0dO+GczA64eEp/utF9asBLjrYHttUSk+u9WyEX0gvJztd6H2S
	 VoIqSiRPwoabQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C46617E0EC0;
	Mon, 23 Jun 2025 14:01:41 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 1/2] dt-bindings: firmware: Add MediaTek TinySYS SCMI Extension protocol
Date: Mon, 23 Jun 2025 14:01:35 +0200
Message-ID: <20250623120136.109311-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
References: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050143_546621_05B4A834 
X-CRM114-Status: GOOD (  10.41  )
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

Add the MediaTek TinySYS SCMI Extension protocol as found on a
number of SoCs, including MT6895 and MT8196.

This includes controls and power state notifications for the GPU,
CPU Memory latency Manager (cm_mgr), SLBC, SSPM and others.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../firmware/mediatek,mt6895-scmi.yaml        | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml

diff --git a/Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml b/Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml
new file mode 100644
index 000000000000..98a5b81983b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2025 Collabora Ltd
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/mediatek,mt6895-scmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek System Control and Management Interface(SCMI) Vendor Protocols Extension
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+properties:
+  protocol@80:
+    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x80
+
+additionalProperties: true
-- 
2.49.0


