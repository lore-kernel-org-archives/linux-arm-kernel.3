Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AB9C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 16:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3d4H5SqpPhzlmBUOysQirCvm7gTNOfVyC8wrEDNiEa8=; b=VKrQXoknufhdAC7HwPeNPNWLVy
	cIfcgIBG6HG3FUmoXRhjM8ROs8aFiMXMd3bhdwMTJqlMsKZRuFgleoC5Mq2nrf/L0V3uaIug792GQ
	6yzaVp1LOmIg9dTfR9uFyG1XEp6oeczdc0fOTO+hfP9ZzUFLl7UO4rSGX4Q7rjV4Dc7z6ecjet+qj
	1zel0oMxXLbsXu6Y9FZulx1vI1t8h352+1T5uS7PCjRIujkDnNSokgswAAYOqvqjGzM+FlKUtHQOI
	gAROd2I/YFK9fPEhWDRgZKmmcW9tWsbbSCi5dfiSdv330OsuAeW6BYZBoEXKovhgdoU+h87rEFUQH
	MgHn2f1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMZX-0000000BxcM-0Vum;
	Thu, 03 Jul 2025 16:14:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKfI-0000000BcDw-2F88;
	Thu, 03 Jul 2025 14:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751551911;
	bh=dUr3Q+DSchYobd41/4+P5VYa5M9JhY9sPEfGAIXPGDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=isfIq4LFKpUwnFve/+7L+1g1y0jJtzUA1KvwcD0OpSWdmNSzaeFTdw1Z2H2NmwnO/
	 1T7PREN51tCA438ivgHIANdjp9NQyEhQ88d2oAy0uAxcMUvQt4w7Pilaf2qp48ENmF
	 P966iulAN1DIHLfCIqC7K49BqSb6qO/IiS929HrFjkMYL9cX5tZiZ9xQWwf1ZKznWu
	 OUCioz6/4bzAzxilj0mqgk8gg5H/7RpPT9qbh7iwC+cpWFVTjJ0/idfmK0bZEIXqRx
	 LMop5M1e7FNa7PCOmimxysKvUvEpsAY9qV+99Z8RkwpR9IlczEi7Npg8lgQgP1PP8c
	 ymPpzzbhzAHWw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 513EA17E09C6;
	Thu,  3 Jul 2025 16:11:50 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2 2/6] dt-bindings: iio: adc: mt6359: Add MT6373 PMIC AuxADC
Date: Thu,  3 Jul 2025 16:11:42 +0200
Message-ID: <20250703141146.171431-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
References: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_071152_726132_CC7511B1 
X-CRM114-Status: GOOD (  11.13  )
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

Add a compatible and channel bindings for MediaTek's MT6373 PMIC,
featuring an Auxiliary ADC IP with 15 ADC channels for external
(SoC) temperatures and external voltage inputs.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../iio/adc/mediatek,mt6359-auxadc.yaml       |  1 +
 .../iio/adc/mediatek,mt6373-auxadc.h          | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6373-auxadc.h

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index a94429477e46..5d4ab701f51a 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -23,6 +23,7 @@ properties:
       - mediatek,mt6358-auxadc
       - mediatek,mt6359-auxadc
       - mediatek,mt6363-auxadc
+      - mediatek,mt6373-auxadc
 
   "#io-channel-cells":
     const: 1
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6373-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6373-auxadc.h
new file mode 100644
index 000000000000..17cab86d355e
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6373-auxadc.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+
+#ifndef _DT_BINDINGS_MEDIATEK_MT6373_AUXADC_H
+#define _DT_BINDINGS_MEDIATEK_MT6373_AUXADC_H
+
+/* ADC Channel Index */
+#define MT6373_AUXADC_CHIP_TEMP		0
+#define MT6373_AUXADC_VCORE_TEMP	1
+#define MT6373_AUXADC_VPROC_TEMP	2
+#define MT6373_AUXADC_VGPU_TEMP		3
+#define MT6373_AUXADC_VIN1		4
+#define MT6373_AUXADC_VIN2		5
+#define MT6373_AUXADC_VIN3		6
+#define MT6373_AUXADC_VIN4		7
+#define MT6373_AUXADC_VIN5		8
+#define MT6373_AUXADC_VIN6		9
+#define MT6373_AUXADC_VIN7		10
+
+#endif
-- 
2.49.0


