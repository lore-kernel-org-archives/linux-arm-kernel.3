Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5513CC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 21:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozCv4HPZuc40czIPmQ+cRqdAb8c6IBZGMNNibW9zglE=; b=2HGzbQrDKLrDiHOU5rxoVovEsI
	MatKxN/UIeVqyQPHNE29xQMu1BsHiYKd0/PLfNWOm+2FnikcMZOFE9wZFDIEwR4GjJVuUXNFyPVC4
	0zUciGRbL51bRp19qIZPlAtmjabiko72dvqFfobRgse+2WMULrpG83E256t8yRjpmGmkWRRtLn0RJ
	OxucLAxclNY3/4F9VLY7qssOsjnMrGN4q/7dBdE3//kF+cv1m6DH//9St2kfYvLzi2soqv7D6ZfxG
	DRX6bIn3wH8zs345nYBUA6qmgvvRpAwjuJD4MHWQLUCbbuweOfYhI7C77+5lTlkYgXAJUNGCCPzka
	aSnZ8VGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wua-0000000A7d3-2H2k;
	Wed, 16 Sep 2026 21:11:24 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wuX-0000000A7Zo-00kI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:22 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; s=arckey; t=1789593080;
	 b=XphbjpvjCgGpqmSxQo7CXBH6Osq8WikwSyRQgqD4bEBb10KboQJYrWJnn04PEtAewx+efqMZbW
	  Gu1MsK0WCHWMuTC310qQNU5GKtqQE23FqqEfrwEYeqKKlfDbR7IF8B8CFQ3B661NUiahy3UmxE
	  M68weJhpzAap2A49BgmrufajVso33fNdwB/0IuWzN13Ng26ELC1vnk6K41pt2tqsAAycj49SPh
	  1K6t6vLsdtxKyOP5u1wDijNYsXHzjF6/E0g7M1S5y1+wjv1Dz2K0F/nKxvFgUOflpQpIisl23e
	  +1paWeVIRRqkeQ4chWT1uFm7Y9AJ+asf1nTei5yKc75TBw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; s=arckey; t=1789593080;
	bh=sBSOz5pgMUqgONr4Fz29dN7NUC6uaTXwlSKgC8vciFU=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=Z2cCIeIrqMIZElwE38meMtXsZhVHp63g/o8CcRxuEDeD63rId2O779RFIjUsB2fZgN0BXyxsFg
	  Yn4TbEIOrif5IDQFa+7vLBDlg6wGcO7qwq1o3MKYKini7MEXqNrUO0V0hZwblF/3GSsDp7UjNt
	  jwhnaXH13P2PYQ22C+wB+idhMhFUXS6+dM38T9QiQY1vDgqtdIeIoLEo3EWnvRE1d+MIsKFmKa
	  NBx8/WCXBLSoLjmroteK0JHt+gV969eAE0NSlP+605uMt/DcN53+pxcreLiMRxr1eVUV9YXUhs
	  ujvFlux434j33hfkknWtJlI1zXTnQTJ0Nhrkq0iZyMf2HQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=ozCv4HPZuc40czIPmQ+cRqdAb8c6IBZGMNNibW9zglE=; b=0i6tvu8egk5JY67FYHVxAYuigW
	14d/6hZXbmm4AsYsHCBXhKGL44P8zr+/TIbkxdXFBjYnYNPH8wc8nMMMRkdqWsaE2/g4ZdCwV+AC+
	dZLFnNt/Xxoh78p1vfRcRCDP0TiCySr1dprWeC7xZkphNRbBlcIAGzlnmajtfd6s54GE=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-f940.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuU-00000002DTv-1GY9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=ozCv4HPZuc40czIPmQ+cRqdAb8c6IBZGMNNibW9zglE=; b=aGmaix6gZAAhGub8lf8EsCeKgz
	aJZqRVZw1R2ekRS/uRy12L6rk6A0JPfqMNBFKIQ2WKi05+rEjDr+Ltwh/QrTrrxW4kZwTeGxh0aqx
	iav5m65OiYJT84NLRuoOJidr7Oja+qxAsWHMQVObM0wr4jF/Uqrn7Z9Ht9+FP0WZud1g=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuP-0000000058P-1pIJ;
	Wed, 16 Sep 2026 21:11:13 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:53 +0200
Subject: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3369; i=francesco@valla.it;
 h=from:subject:message-id; bh=sBSOz5pgMUqgONr4Fz29dN7NUC6uaTXwlSKgC8vciFU=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWZ9sbJhwKelLrNxuv0dpux/sEX7ya6cD08fllWceq
 Uz8v4FjbkcpC4MYF4OsmCJLyLob9/bMNf+WtoHxEcwcViaQIQxcnAIwEcvJDH9Fkr0c7UySpbR1
 cqJP2PrsWXG1MK7NWdjms1Lt/7ZJRTcZGT7Xn9pQNelF0752nzt7UnhCNr5uLowpVojIXx7qfdd
 Bmx8A
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
X-SGantispam-id: 361fe2eb8776fdc61e1d005936b0757c
X-AntiAbuse: ID - 361fe2eb8776fdc61e1d005936b0757c
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6wuU-00000002DTv-1GY9-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_141121_209707_FDDA004D 
X-CRM114-Status: GOOD (  13.00  )
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

Add a new binding to describe remoteproc-provided virtio devices; while
these are discovered through a resource table parsed by the remoteproc
infrastructure at runtime, their description can be needed to probe
non-discoverable buses (such as I2C) or to link consumers and suppliers.

Each vdev is described by a dedicated "group" node, which then includes
a virtio-device node, which binding is already existent and used by
virtio-mmio. Each vdev shall be stattically linked to a "group" node
using its index inside the resource table as the reg property of the
node; this permits to have multiple instances of the same type of
device.

The binding is intended to be generic and adopted by any remoteproc
provider.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
new file mode 100644
index 000000000000..c4a0d84b1460
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Virtio devices over remoteproc
+
+description: |
+  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
+  and its resource table. For some of them, a device tree node might be needed
+  to describe remote undiscoverable hardware and/or connect consumers and
+  providers.
+
+maintainers:
+  - Francesco Valla <francesco@valla.it>
+
+properties:
+  virtio:
+    description: Contains a group of Virtio devices exposed by the remoteproc.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^vdev@[0-9a-f]+$":
+        type: object
+
+        properties:
+          reg:
+            description: Virtio device index inside the resource table.
+            maxItems: 1
+
+        additionalProperties:
+          type: object
+          $ref: /schemas/virtio/virtio-device.yaml
+          maxItems: 1
+
+        required:
+          - reg
+
+    additionalProperties: false
+
+    required:
+      - '#address-cells'
+      - '#size-cells'
+
+additionalProperties: true
+
+examples:
+  - |
+    remoteproc-cm33 {
+      virtio {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          vdev@0 {
+              reg = <0>;
+
+              gpio {
+                  compatible = "virtio,device29";
+
+                  gpio-controller;
+                  #gpio-cells = <2>;
+              };
+          };
+
+          vdev@1 {
+              reg = <1>;
+
+              i2c {
+                  compatible = "virtio,device22";
+
+                  #address-cells = <1>;
+                  #size-cells = <0>;
+
+                  eeprom@50 {
+                      compatible = "atmel,24c1025";
+                      reg = <0x50>;
+                  };
+              };
+          };
+      };
+    };
+...

-- 
2.55.0


