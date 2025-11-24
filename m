Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B7ECFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 11:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zlmg1xkb7zZ5qt1lQzDBttMbvIYcJyKcwVMP6LG+6Dc=; b=NyrhPrvGJ5IlRVqe/OQKuzb6aN
	J0D5WcbNi99tDaJGqI3RhHZvFofJkt/7Xb/u9oU8hddBmIJSfRQYtOCRZ5XzpSyu0qfI9st5CoflU
	UqKOE+iRmnv4SUZ2PJblqEe3PJwRAEBN7BJkNrLKxipTX3yoH8kBD2gFshxMYSCqgOWGR5VLJVox7
	aKWjsARwvogD8b90IzAyKJWCGRhdplOjIHAjnl0Uzxafn+He3ySc3hS86p6ggURUxzcCi+SOcWdac
	2o6+hmuqp0l3c2BF631P26jdZtFv8YRbaS4l9IDx4EDaJYAmQxO4Xi48Shd8TtnsynT940/vp0t09
	DIG4v71A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUPl-0000000BVGt-2I3N;
	Mon, 24 Nov 2025 11:07:25 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUPe-0000000BVBb-0ASv;
	Mon, 24 Nov 2025 11:07:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763982429; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bFfbTLZfWfaFRzQkfyCkVjo2MZlYw4vaD/R5LoEC8aL4QASSsbE3xZG0EJ6WrFMX8LqWWXXcGaVAeO15iMUcbiJ3vvZMnF6Xs7CWxNAwXAMfBcmwAPyAbyr7JflPJMe+Y9AinrTeTBOv51prp4ewyBLzZ8opVFBgYbndIxnOi14=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763982429; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Zlmg1xkb7zZ5qt1lQzDBttMbvIYcJyKcwVMP6LG+6Dc=; 
	b=WQVXY+aATl+94dOiXyjf/nTMbVaLf+mro1cBXcFowQDXKO6oUliVPftsEVz+RF7U0Ly55Q1NtlsoBkTsqRCbuO91mxpeJhS/OhQfTrxfWn//wRYMpAuZ7pSH5NogKhC1VWv8BIvv9z1OI+WqsdmKHCuH9K0tj6r4FwyCI1vzp2s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763982429;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Zlmg1xkb7zZ5qt1lQzDBttMbvIYcJyKcwVMP6LG+6Dc=;
	b=V1FiJuhojXdSc/Lp5LfrkqnNi/N8EHUgWdTOHaM8OE5YafmSysvzD6c+Squ/t2oh
	Sx0q0a+0H9bxGtFFbgr9PuowFFUSpxDfkIchFFN/MANwZnd1Ph4dAL7aaLewo/ZZiK6
	9rze27RJd3frip5SsLylUZicelRsG5WA/Ihrz5w8=
Received: by mx.zohomail.com with SMTPS id 176398242729632.7829396468984;
	Mon, 24 Nov 2025 03:07:07 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 24 Nov 2025 12:06:52 +0100
Subject: [PATCH v2 03/13] dt-bindings: interconnect: mt8183-emi: Add
 support for MT8196 EMI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-mt8196-dvfsrc-v2-3-d9c1334db9f3@collabora.com>
References: <20251124-mt8196-dvfsrc-v2-0-d9c1334db9f3@collabora.com>
In-Reply-To: <20251124-mt8196-dvfsrc-v2-0-d9c1334db9f3@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Henry Chen <henryc.chen@mediatek.com>, Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_030718_183892_1751780C 
X-CRM114-Status: GOOD (  11.65  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Add a new compatible for the External Memory Interface Interconnect
found on the MediaTek MT8196 Chromebook SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../bindings/interconnect/mediatek,mt8183-emi.yaml |  1 +
 include/dt-bindings/interconnect/mediatek,mt8196.h | 48 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml b/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
index 017c8478b2a7..1fb8ccb558fb 100644
--- a/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
+++ b/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
@@ -40,6 +40,7 @@ properties:
     enum:
       - mediatek,mt8183-emi
       - mediatek,mt8195-emi
+      - mediatek,mt8196-emi
 
   '#interconnect-cells':
     const: 1
diff --git a/include/dt-bindings/interconnect/mediatek,mt8196.h b/include/dt-bindings/interconnect/mediatek,mt8196.h
new file mode 100644
index 000000000000..de700fa73223
--- /dev/null
+++ b/include/dt-bindings/interconnect/mediatek,mt8196.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_MEDIATEK_MT8196_H
+#define __DT_BINDINGS_INTERCONNECT_MEDIATEK_MT8196_H
+
+#define SLAVE_DDR_EMI		0
+#define MASTER_MCUSYS		1
+#define MASTER_MCU_0		2
+#define MASTER_MCU_1		3
+#define MASTER_MCU_2		4
+#define MASTER_MCU_3		5
+#define MASTER_MCU_4		6
+#define MASTER_GPUSYS		7
+#define MASTER_MMSYS		8
+#define MASTER_MM_VPU		9
+#define MASTER_MM_DISP		10
+#define MASTER_MM_VDEC		11
+#define MASTER_MM_VENC		12
+#define MASTER_MM_CAM		13
+#define MASTER_MM_IMG		14
+#define MASTER_MM_MDP		15
+#define MASTER_VPUSYS		16
+#define MASTER_VPU_0		17
+#define MASTER_VPU_1		18
+#define MASTER_MDLASYS		19
+#define MASTER_MDLA_0		20
+#define MASTER_UFS		21
+#define MASTER_PCIE		22
+#define MASTER_USB		23
+#define MASTER_WIFI		24
+#define MASTER_BT		25
+#define MASTER_NETSYS		26
+#define MASTER_DBGIF		27
+#define SLAVE_HRT_DDR_EMI	28
+#define MASTER_HRT_MMSYS	29
+#define MASTER_HRT_MM_DISP	30
+#define MASTER_HRT_MM_VDEC	31
+#define MASTER_HRT_MM_VENC	32
+#define MASTER_HRT_MM_CAM	33
+#define MASTER_HRT_MM_IMG	34
+#define MASTER_HRT_MM_MDP	35
+#define MASTER_HRT_ADSP		36
+#define MASTER_HRT_DBGIF	37
+#endif

-- 
2.52.0


