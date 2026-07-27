Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00035C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gm0aoatWU+Wl/ya7xcS2AWp8FVs9XWr2vfrWP5FnHMk=; b=uxPVONlw+/eQ/QWGNFxdGAtPUV
	TOZSbzTVYQkUixolyKXt7iRJSphawRyO/d0L51zZ+m+gIZLwfo1S68bx8uVDdrGr2R5xTlwqIA4l8
	MvQX7vGU21Uuu6lmZFRpczAqMv3fPn2Vu+1svfXRNogsu2ioLbJJQWfjoJllVPogSjg/6CCc5qrNC
	talllDuwgI/WAlL6lh5V4eOGCcqWbq8FZkfTYgsqlZ5UXm6d8eV8BVg/zR7WWJGxnum9HCPvz6cIE
	Wt03CMTbzPrGzOWeKQziZtVS62V/LRrokMm2qoT7rUlXW21i0v+2JOGG4hFDabN5TCfew+d5TuLOY
	/npJfrvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKxs-00000002m0x-434P;
	Mon, 27 Jul 2026 13:01:53 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKxi-00000002ltm-3dcr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:01:46 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1785157297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gm0aoatWU+Wl/ya7xcS2AWp8FVs9XWr2vfrWP5FnHMk=;
	b=kIK0nAkPTGDGCqrInmM75+kYTtw+K7JeX7brOqW4b2FzHPerv8TE3i78hZDkej3iPMfF7M
	hWBUk/VA3JKUcyWaU2GDwV86yjej7YMYVnvL/E0MM6L6F8NEzcNAgFVjDHwuMKop6WrwQT
	0poefusAL4rSkpEzhFUxtdApbD2DB6HOdySEi5+iRFfiafzaz0qybVjqc7m0i6nt7AFDjL
	azNEvKD15QpmGeLgcdNxokOb7rqUIpR084vqVP1jP2sQXOYhw0rZ5p+MnXgtHDjotImANw
	FnJyMdNnlF7itoAcGosHzVjJXEVxZI//IoheXx4gqV2E/MybzfANhLbVozfbQw==
Date: Mon, 27 Jul 2026 15:00:44 +0200
Subject: [PATCH v4 01/11] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-1-1a515de33093@kontron.de>
References: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
In-Reply-To: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=JGw6dwECTdV/w8d4QCeQ5+KwHjivFvbkjonDtHxJ5Qg=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISs9bNXbqoeMvq/PL3WwW5T2psau2ln1/iVHVn/DdK/q3
 EfrJgt3lLIwiHExyIopskjxW7y2NYv1kT9WHQUzh5UJZAgDF6cATMTgJCPDw5pnhcd1na5u155d
 ej8p73lrhVehy8X48Cdvyl7W9Di/YfgrYF0VfsRo76srLh9LvOc9aSq96Hl4prGE+ZT3sr+fbnj
 PCgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_060143_061300_04F60128 
X-CRM114-Status: GOOD (  10.20  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The driver currently uses the limited MMIO (FSB) interface to access the
OTPs. The intention is to support the firmware interface alongside the
MMIO interface so the driver can pick the interface that is available
(firmware might not be loaded) and fallback to MMIO.

Some SoCs like the i.MX9 family allow full access to the fuses only
through the secure enclave firmware API. Add a property to reference
the secure enclave node and let the driver use the API.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../devicetree/bindings/nvmem/imx-ocotp.yaml       | 23 ++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index a8076d0e2737..f154856bcdec 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -17,10 +17,6 @@ description: |
   i.MX7D/S, i.MX7ULP, i.MX8MQ, i.MX8MM, i.MX8MN i.MX8MP, i.MX93, i.MX94,
   and i.MX95.
 
-allOf:
-  - $ref: nvmem.yaml#
-  - $ref: nvmem-deprecated-cells.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -56,12 +52,31 @@ properties:
   clocks:
     maxItems: 1
 
+  secure-enclave:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: A phandle to the secure enclave node for full access to
+                 the fuses through firmware API.
+
 required:
   - "#address-cells"
   - "#size-cells"
   - compatible
   - reg
 
+allOf:
+  - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - fsl,imx93-ocotp
+    then:
+      properties:
+        secure-enclave: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.55.0


