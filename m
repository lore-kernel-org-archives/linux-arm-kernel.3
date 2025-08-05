Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F19C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 08:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzAoLMPZ6K/BX5zg4eUBEmit4NxnBT1zJC+olici2Oc=; b=WmnIk5VUB4kTPxVcpQQ1N5TaF8
	bzVWNYrxkjeuXg9u5CiZCe864dNsIS49Fs+ufgGleuIvrE+ticsm11x0OsyC+vaLoHAqvua40wwFd
	9cZbjr9mqwC5soamp3Igaev4SVCfhvfdOuXpMiSeB4fDXy+kkZ7QuDCB9/plcLvEC+x40fTTG/r7b
	4srOYuNOBTSLu9eVd284iNVVE7jCj/ACnWWgjMi4MRJT18JsweEKplrCA0BMB5K+xUg6zG19PosMV
	3831PbSsHbjWjEB48hzsGR+aTI8Hzuc/z/ndGdVS3fveP3dNSbfRJsGEfac00uvTAZjaD13Af2NvF
	HwQbIg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCfG-0000000C6fD-1r8O;
	Tue, 05 Aug 2025 08:04:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCPY-0000000C460-2AiE;
	Tue, 05 Aug 2025 07:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754380119;
	bh=t7Rehz1Jrb0D0nap14L/kwRSRhOnQ0fHBCl9LYwxpeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qqZTmbMeyuJR1FWoWPIBn1q+u7lDZJx4B4wh8yjAynf3RZJxGZ/opTOFlFSkWsW1S
	 iBtcbDLbFd/TLDVUf/tY69GZWW8AhBPmfkDtHiDyxwTisq5hqv5JRtiug6edzvMT8B
	 woC6N3DzykUt9EJ4eDT+1kg671SfdT8VD2D5pIrsRGVo64VbOOENky9pRjHTv5TVNE
	 o0687OyuN3EnnLhUjtELTcm9Cn00gabEy6gpe7F2omk2ME0PQsUIkq1gMLRuHP+Sm8
	 mwupupeSJbWle1e6j2jSyP5V+ZPbdSDNt7zI7Z4X4HaEI9Vr8Y/uJf/kcf4mEWDJCm
	 fL4J9S+Dx3LVg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4CBB117E07E6;
	Tue,  5 Aug 2025 09:48:38 +0200 (CEST)
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
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v3 03/10] dt-bindings: power: mediatek: Document access-controllers property
Date: Tue,  5 Aug 2025 09:47:39 +0200
Message-ID: <20250805074746.29457-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
References: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_004840_699177_02F5FA2A 
X-CRM114-Status: GOOD (  10.56  )
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

Allow specifying access-controllers in the main power controller
node and deprecate the old mediatek,infracfg, mediatek,infracfg-nao
and mediatek,smi properties located in the children.

This is done in order to both simplify the power controller
nodes and in preparation for adding support for new generation
SoCs like MT8196/MT6991 and other variants, which will need
to set protection on new busses.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../power/mediatek,power-controller.yaml      | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 9c7cc632abee..500d98921581 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -44,6 +44,15 @@ properties:
   '#size-cells':
     const: 0
 
+  access-controllers:
+    description:
+      A number of phandles to external blocks to set and clear the required
+      bits to enable or disable bus protection, necessary to avoid any bus
+      faults while enabling or disabling a power domain.
+      For example, this may hold phandles to INFRACFG and SMI.
+    minItems: 1
+    maxItems: 3
+
 patternProperties:
   "^power-domain@[0-9a-f]+$":
     $ref: "#/$defs/power-domain-node"
@@ -123,14 +132,17 @@ $defs:
       mediatek,infracfg:
         $ref: /schemas/types.yaml#/definitions/phandle
         description: phandle to the device containing the INFRACFG register range.
+        deprecated: true
 
       mediatek,infracfg-nao:
         $ref: /schemas/types.yaml#/definitions/phandle
         description: phandle to the device containing the INFRACFG-NAO register range.
+        deprecated: true
 
       mediatek,smi:
         $ref: /schemas/types.yaml#/definitions/phandle
         description: phandle to the device containing the SMI register range.
+        deprecated: true
 
     required:
       - reg
@@ -138,6 +150,31 @@ $defs:
 required:
   - compatible
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8183-power-controller
+    then:
+      properties:
+        access-controllers:
+          minItems: 2
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8365-power-controller
+    then:
+      properties:
+        access-controllers:
+          minItems: 3
+          maxItems: 3
+
 additionalProperties: false
 
 examples:
-- 
2.50.1


