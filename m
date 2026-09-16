Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB7DC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 21:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtdxP9SpG3f91lH58tgZH/LmN4+UT+dL4jUVq/KII8w=; b=UCyLZ6dt9G6edGYxs8fN9kygGr
	T10ifQpFUNUC0VdVBzjHH3Jazt2/a3/QelHLdbBs6eP2EUuthldPlpqNXAwuhVbzvk7yajBZYtEW/
	w9EHHc9+a2eQcoo/Vf/jQ3Txq+M/3X27yCfAqekglwSgD7Emw3RtHMqR4fZBdcmmDJq8dpfTJzW1F
	Q4mQ3nE2OZmtyu60Ak/kOFnY+cHulHumNoY+acjBpVaXTfZ0OjcU/thVX+xx/ICFYNEiKxk7SIITw
	q1FmKcZp3vLEDf8pqdkAIg/4JpWbxwZMMZw5mD2XdqswDkPcp5jLfiO6EWJ/s6qk3nzig3FsXZX9g
	M/1FFHXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wua-0000000A7cT-15cf;
	Wed, 16 Sep 2026 21:11:24 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wuV-0000000A7ZH-0PmA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:20 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com; s=arckey; t=1789593079;
	 b=qCFvEu5mLBoZAmYe6T7KiE/SSa0Z6KpDj72JDHwvVOu7VXT5e4VsMyHJ5Y2lqjDhxpa4mnUHQN
	  Dv1+4Cf0sFPgOyv2sx8YQKpoRzb313ZBpsrhF0cRJg26FKcUBuy8F1XekeG/f/piKWUPWvsbC4
	  mkqf4KTPWuaQsy6hA3Qqz8v7VOYorIC8t+WGLULZh1tDR4wJkn/jIDkTP5dCSKBcbaV1au6wZO
	  Xb89dlQUxwYmoIQLpFXgKXiKbNNU1bRj1wCbUriVFQN7FeQKn+HIO09TOeBPLLJlywjXexnSRg
	  JtOUMe8gs8WBWOPjYZEHwP/6lYrBqHvoMdvfY1rROjlpbQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com; s=arckey; t=1789593079;
	bh=NrG1vMi7mjuK8rU8iFoqlOm+G1UagPSfu8bXcOD9Q8U=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=ZCHU9M5936DPqLrf3Zn03/T05xwGI++bZBedKQaTdlrr60/eDmocJzUBM190eLp+IizrtNVm1P
	  tMK8h/vcsu0NK1oyS4UxXfQ711ynf6QS+itXShmTVuFmeC2tX7gADmFaVWkeSYPRjLXDpzHZqz
	  DoXqN+1uED1GaIo4ZeuiVs4e1oJ7pfA2+yib20t8DKcD6pTTzzI0nTQJYveRZ248HP/Lh+QsfF
	  LBifkVPkm9QyhO/LSoHJfBaybQ+ExZDQkRU+YcLz4JsjKA/Hv8PArPNTOxamHnTR53YK2t7j3+
	  /aNIpw7ad0ctzcLNsyoHZU9WSXDkxjcypojBSixzrGYX6A==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=dtdxP9SpG3f91lH58tgZH/LmN4+UT+dL4jUVq/KII8w=; b=rUOrSwaST8EHReMpqpqO4f8NR8
	wUb7H8U20NNDh8HQ6KWkv36FKEWXwAHrInIQ5tjJqmVXbCX2JSpFDEBJUw6aoeF8EEd/SSqhaEkwq
	bHLEOzjxcXnglBtjx9UR9lg+d+JoOOxP55fZAduWK5JfuhPpi9WYEuT8LSH3Qj6kIJr4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuS-00000009s9Z-2Cqx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=dtdxP9SpG3f91lH58tgZH/LmN4+UT+dL4jUVq/KII8w=; b=plO3sSjsWcGLFhdB7DYHKt2QdW
	6D5bmj/HOJeqC0VyeoZAt+2yYVUe5UPXvu7h5filkOqLeK6nJQ8rBExiC+QoS88XRauPLiT3I4Qkm
	xUBIqXaq1DN3RgpzHn/5hl5/RV5htN/BpfqfezSrMEDt0xOjGTLIqpOPtlZN77F6t84g=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuO-0000000058P-1JHw;
	Wed, 16 Sep 2026 21:11:12 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:52 +0200
Subject: [PATCH RFC 07/12] dt-bindings: spi: add bindings for spi-virtio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-7-dac8c5eb4aa9@valla.it>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
In-Reply-To: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1663; i=francesco@valla.it;
 h=from:subject:message-id; bh=NrG1vMi7mjuK8rU8iFoqlOm+G1UagPSfu8bXcOD9Q8U=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWZ98//l5341Ys0W3+DuPHQl5fmvt/v83e24Xz1okc
 UGp67lQW0cpC4MYF4OsmCJLyLob9/bMNf+WtoHxEcwcViaQIQxcnAIwkfh0hv+Jb7Z5Xfs0kft/
 1QTGr69cMp//j8k9sJhPnzPJZ/+Ecg9dRobl3truXMKyTPUWuWHnsr4839h8Ku3tpwzdF6rTLkt
 0xHADAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 492b27118d47104310cd2ae754c57a29
X-AntiAbuse: ID - 492b27118d47104310cd2ae754c57a29
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6wuS-00000009s9Z-2Cqx-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_141119_163879_0A2A8C05 
X-CRM114-Status: UNSURE (   8.46  )
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

Add bindings for spi-virtio, based on virtio-device.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 .../devicetree/bindings/spi/spi-virtio.yaml        | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-virtio.yaml b/Documentation/devicetree/bindings/spi/spi-virtio.yaml
new file mode 100644
index 000000000000..1a0a0763bd2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-virtio.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-virtio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Virtio SPI Controller
+
+maintainers:
+  - Francesco Valla <francesco@valla.it>
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+  - $ref: /schemas/virtio/virtio-device.yaml#
+
+description:
+  Virtio SPI device, see /schemas/virtio/virtio-device.yaml for more details.
+
+properties:
+  $nodename:
+    const: spi
+
+  compatible:
+    const: virtio,device2d
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    virtio@3000 {
+        compatible = "virtio,mmio";
+        reg = <0x3000 0x100>;
+        interrupts = <41>;
+
+        spi {
+            compatible = "virtio,device2d";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            sram@0 {
+                compatible = "microchip,mchp23k256";
+                reg = <0>;
+                spi-max-frequency = <20000000>;
+            };
+        };
+    };
+
+...

-- 
2.55.0


