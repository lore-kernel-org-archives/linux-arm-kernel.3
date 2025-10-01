Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B99DCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAmdsZZAt5IUy03cjSqnyqolSZP+U8Jzjrl+DHgRd4Y=; b=w0e0PdAXYqigUJ37F0EWRnpK5g
	06DZrxBbL+QQyqosIFfHesScF+3JlH0HEcN7zIUWZEblSQ9BiG4+ljBUWl3Hdt8I3+e17Mr6cwUEt
	T/QGjcOfuns2T1FQ7NmkC0uJp42+uobc8DzASSxA1W7L0QtpKzWr0EzxSp+DGa++lVV8T8cjWjELC
	Be3+AfIxwz8Gc/3zLKRb0u9StqBis38lsjXAuiSuX4LiqM6Tx2JCUc223aO0ofjncF4BeC8QiNfqR
	jSmc/FL0OCBL/tPlQRhvMgOpkhFfiInhn9RTA+1jku6wxQI7mOkas5s2+Iyz0hcG4TdB1j6TdaT29
	AWfMiMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3um7-00000007Krq-04nd;
	Wed, 01 Oct 2025 11:13:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3um1-00000007KgQ-3FaJ;
	Wed, 01 Oct 2025 11:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759317207;
	bh=oS856Sv7qqc6NZ8kQDQSeSOMjUl4B24dYezx24uAEk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SWCYSz5SCYeVRshC+2g71Vcuh91lxVHEFhHf+hQYymfTcTg9Fc5DuEKOegvtTpX0K
	 PZVDM+a2rYVMChKmpzWgK97PPJTC5kFtqM527ZDacaYw7+EyOkdFkiSPh1//euktad
	 4+is0UzGH/yjyp0dX3o+wDxxdwGDbIvY2BpfTijgy312F/3J3PEaeYPC5SZov5RJz2
	 iJVgt5czCc1TLlgb6W0Jk96GGjjx5TdNYzn5C38CFHv6wATMnLZTz4hZO8Oxq8tRq+
	 vcVmzF+ehEAsfQYDrAUF/p/c86vERx4rOfYy1uoXF3CGv+kp6+1pmFcPbCP+PFDEbx
	 0zKK5OYDk+KRw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E6A117E00AC;
	Wed,  1 Oct 2025 13:13:27 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v6 7/9] dt-bindings: iio: adc: mt6359: Allow reg for SPMI PMICs AuxADC
Date: Wed,  1 Oct 2025 13:13:14 +0200
Message-ID: <20251001111316.31828-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001111316.31828-1-angelogioacchino.delregno@collabora.com>
References: <20251001111316.31828-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_041330_002350_A632E558 
X-CRM114-Status: UNSURE (   7.88  )
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

When one or multiple Auxiliary ADC IPs are embedded in a SPMI PMIC
it is reachable at a specific address.

Allow specifying the `reg` property and make it a required one for
MediaTek MT6363/6373 PMICs as those communicate over SPMI and also
disallow it for the others (as it wouldn't be applicable).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../iio/adc/mediatek,mt6359-auxadc.yaml         | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index 5d4ab701f51a..e685e5ee224a 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -25,6 +25,9 @@ properties:
       - mediatek,mt6363-auxadc
       - mediatek,mt6373-auxadc
 
+  reg:
+    maxItems: 1
+
   "#io-channel-cells":
     const: 1
 
@@ -33,3 +36,17 @@ required:
   - "#io-channel-cells"
 
 additionalProperties: false
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - mediatek,mt6363-auxadc
+          - mediatek,mt6373-auxadc
+then:
+  required:
+    - reg
+else:
+  properties:
+    reg: false
-- 
2.51.0


