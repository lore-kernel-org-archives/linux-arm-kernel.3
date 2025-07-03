Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F412C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 16:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5oIcg25BqOukwmgYiq/lIo4pPfgpOoL5WomNPnqMZZg=; b=aEGTMd44GYViMQH/gYWtWP3W5U
	9suYO/oA5Y4RePpfBesQVzvYvZM5n9aBwJlodDghGHHf6E8aEiwM+lS6lNnUOoaGKnYmCRzSQaXz8
	OSJNDUgO4KgYNty4lBRSIeWcXvFSvJqv4Bh6m7V+Yg31W6SlPoKXf1UwGDpTvUZIMmGEJwXmsZeTF
	5QMT8aeyKIV9hVcrWmmKv70xo2xVGxzEQdPFjo6Fp2y8sezACAfbTsjviewjglK+FJABPJ7VYZv2u
	zngSVAc1SuPcP+9GufmZodSWQhwd/JbDx+wXI9RanzApEECyUsQaytN3BW/nO8czlFgq+Ekm/QZOw
	sneGzlfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMXC-0000000Bx6w-3XwA;
	Thu, 03 Jul 2025 16:11:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKfH-0000000BcDi-3Pb5;
	Thu, 03 Jul 2025 14:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751551910;
	bh=tdLyXltcIoFwobtxtRzgrsZDuNu50xOF9/XzgUdiQJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dJMsU601hrZHvzQasjWjvsYpAkSLp5Yq/JX9OVRV1UJNyhdbfJPUs9EwUcFm2Do54
	 z4jcbL5hZ2WS+1T9TVbKbZuTg6YYQxytbfctZMXn8N60pb+pJ0iOBNIY+DQxbMxwoe
	 KA6PUXH98CYsuUlr/yn8V+4T8eSVwyQcPaOXkCrFiwmABFzXMGRbs4b+TswVBwGgu9
	 4xWpUIQdnF1PG6T83tNpoyY+9YVNVXsDo2gZAoObO7HODKPI1yeG+81W9rS8t2A5Bg
	 ci6ymVIytVK9Ah8rsj1lJ7FUXgxYxDM5qyGArYMKDfgVWdSnWWMdCLOLZYkwdtqXaY
	 7pm7jLa1EByAA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C3A817E07FF;
	Thu,  3 Jul 2025 16:11:49 +0200 (CEST)
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
Subject: [PATCH v2 1/6] dt-bindings: iio: adc: mt6359: Add MT6363 PMIC AuxADC
Date: Thu,  3 Jul 2025 16:11:41 +0200
Message-ID: <20250703141146.171431-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
References: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_071151_993388_2F1819DB 
X-CRM114-Status: GOOD (  11.67  )
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

Add a compatible and channel bindings for MediaTek's MT6363 PMIC,
featuring an Auxiliary ADC IP with 15 ADC channels used for both
internal temperatures and voltages and for external voltage inputs.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../iio/adc/mediatek,mt6359-auxadc.yaml       |  1 +
 .../iio/adc/mediatek,mt6363-auxadc.h          | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6363-auxadc.h

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index 6497c416094d..a94429477e46 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -22,6 +22,7 @@ properties:
       - mediatek,mt6357-auxadc
       - mediatek,mt6358-auxadc
       - mediatek,mt6359-auxadc
+      - mediatek,mt6363-auxadc
 
   "#io-channel-cells":
     const: 1
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6363-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6363-auxadc.h
new file mode 100644
index 000000000000..92d135477d0e
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6363-auxadc.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+
+#ifndef _DT_BINDINGS_MEDIATEK_MT6363_AUXADC_H
+#define _DT_BINDINGS_MEDIATEK_MT6363_AUXADC_H
+
+/* ADC Channel Index */
+#define MT6363_AUXADC_BATADC		0
+#define MT6363_AUXADC_VCDT		1
+#define MT6363_AUXADC_BAT_TEMP		2
+#define MT6363_AUXADC_CHIP_TEMP		3
+#define MT6363_AUXADC_VSYSSNS		4
+#define MT6363_AUXADC_VTREF		5
+#define MT6363_AUXADC_VCORE_TEMP	6
+#define MT6363_AUXADC_VPROC_TEMP	7
+#define MT6363_AUXADC_VGPU_TEMP		8
+#define MT6363_AUXADC_VIN1		9
+#define MT6363_AUXADC_VIN2		10
+#define MT6363_AUXADC_VIN3		11
+#define MT6363_AUXADC_VIN4		12
+#define MT6363_AUXADC_VIN5		13
+#define MT6363_AUXADC_VIN6		14
+#define MT6363_AUXADC_VIN7		15
+
+#endif
-- 
2.49.0


