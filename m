Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E95C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 13:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4P+9YYxB1B8jeQzw5l7aA97BogFgZ3fz8Vfdsh/rqY=; b=QV+eNfwnOXhVhDTHccVdCplAE2
	//JBcZ1VOgp8j7P+6VLPM3WU8YismisCG5xXQOLXK+pVLHW2KfSJQ9EWmBZFh9m/7vFKwE67kybyT
	dWgHKI7w+bAhzKiUKr9DbTl6gwqNFDI1e3J6nZq20cuYRiI9yySa/KlqT2RJN0exmm9YpyKz18oVm
	3wxfjiEXKf4e6LBUaxIBvSDxYpx2tTu/RHajjb/oa3kegpZ3SDgRQj86AF5EH57WIvJKPH9VpfI+v
	VQJw0Jp8dSsVCGZo5cF10g/nOHKv59s3zc5iYa6Bw7LybFfE+mMc2XGf3eVKdGrmzya7troZIlSVq
	f1FXZ4Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThMy-00000002tbQ-28ki;
	Mon, 23 Jun 2025 13:37:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfqk-00000002act-3OG8;
	Mon, 23 Jun 2025 12:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680033;
	bh=CZEgYbfBy7FB1rq1F534XxN+O0ZjjDodFZAWk6TJxVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K6IXMrnots+VxqoED35PFiKhotry7PESAi9bWxLFA7wECQLtuHZ4I47xjfRE2H9m3
	 PqNb512qcE8XGkmN9k8KtjekgpZ2ya+f/yYM2MjsI71B4loE9GKIcQauNsBW9/APqR
	 DdCFR9gXlUBbMFVeybJm1/aTUflm3xjCWIUGY6szaGaFGrGTq8TrNr19ODCZXzSNR+
	 pPgI4y7K+XcRRBlAO7CmJCSKtKYFfgh3fv8iRceMoeDfG8Agz3ryhivQqocKHPYB/e
	 BL6Lu/kUijIo8dawgMdPQ7AQUqnMa9XCFkOcH2c9wIKskZeeIyBsTF/h/RIOb/thkL
	 OOgj2qnEbC8Vg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD6AB17E05BD;
	Mon, 23 Jun 2025 14:00:32 +0200 (CEST)
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
	kernel@collabora.com
Subject: [PATCH v1 1/5] dt-bindings: iio: adc: mt6359: Add bindings for MT6363 PMIC AuxADC
Date: Mon, 23 Jun 2025 14:00:24 +0200
Message-ID: <20250623120028.108809-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
References: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050034_992285_C2F0C5C8 
X-CRM114-Status: GOOD (  11.60  )
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


