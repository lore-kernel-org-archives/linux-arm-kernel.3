Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14999C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6iF9XDEbaIplAtmrsCBBxY1vgXUOaIijCD0bkF3jCo=; b=g0Ydfq17KfgoSECbsgjh2gecVl
	oT2WIPMj9P3/LazPu0Ss12D3BPX3cwuz/0Ssbo1WtDshY6N7KfTr9zURjVw88g2n6Ywe98u0KpW2S
	RwVzOPDmGXs9sz1mM8q4m+y1LgMmLVmkiITj/X3SwzLDW0YrfZlnG/Ad+crYOtcqrc+C4jwffxS0x
	v24ETPvmkRK4MykWkeIZJhczn2/1G9Vwl/dXWnAbqVD6ZDS3fZBOhSaR8Zh4ACCboidlZ0DEM2+j6
	+uM3iKpQtZkgfuTrLAn42Obae93f+/ImDZutjeL1kFtU4YutoJ2vaf+Ill4NYWomq6b6VmjZYuYU2
	QVQQoWMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI4C-00000009fXg-2oFs;
	Mon, 13 Jul 2026 14:55:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI43-00000009fQH-1WwW
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 14:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=c6iF9XDEbaIplAtmrsCBBxY1vgXUOaIijCD0bkF3jCo=; b=Zo6qRzEy0SGqyps0zzFiZQqzNp
	LnqaXhgEkFbeMkYQ+ZlTCFMNaNJtnC8qzhHQPFQlA0uAtvY8NofI+faF7E+idNgP7Ep6s9/rKeJ9s
	hDEylG0J1U1vmC9DXMc8rzz/JEXuQ4KHqt16IjuVHOb5lLDWMboeaYLCV8T+3wTstxQ+kzdVG9nQV
	ZpcNq3YPgtSt2LhiKALLiRhwJ378esV0Dn5Q/4EgDQ0Gdp1YEU7ouW1Xq16fshrbRvy8cWuCK9PT2
	YNoovvprjaquuuAWdjqDMSgt1pLwYz3O2ncR/aiRgsj0ohCEP1exlM6fI2mH2j4yEHboo8oJlZMDJ
	L0nStlnw==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjI3z-0000000BjtB-196S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:55:22 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1783954516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c6iF9XDEbaIplAtmrsCBBxY1vgXUOaIijCD0bkF3jCo=;
	b=Vyk9s0tHAYfyOa2Kab+MzsLNfE6QrJDFb9FMln3P6l0Zc6yENjya9hATh2402sLf6FdDvo
	2ZFAVDAXSpXdtOrjCMI+cFoaHqmwg5SIGksTLanUUWhPGJ6sbhp2G/qcqtMWuDVD/xVvok
	r0Xdcw1SRslgZooDi1p6BfELyDqtzTXy76M7aQ2vcX2R0Rhk/3q8Wn4ZKsMZF8FiRSCxYK
	i+JdM68jbWHs7ysu1TytSlLsSc/13vdml8YPu+k0TrD9h26pGjRJCcas45f0da6mp/i5Qs
	SOUNqLfyK0gwL9JV7s4zCQk9wcfntx3cD/NEtKQF2H+s0sPNrNOrcqQftsPrvg==
Date: Mon, 13 Jul 2026 16:53:37 +0200
Subject: [PATCH v2 01/10] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-1-b8266d93514b@kontron.de>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
In-Reply-To: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
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
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=Ll3DwEtNXqNyJE9cnd67/HZkEW9Unihh2hJcAMhBqO4=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvkT6B68qcTVm9497jpMDmUujy463Xx2Bypy3NNPn1es
 Mu3f1ZzRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwETeHmJkWPd7z5ScL24bF3xY
 +UNx/7zti5Quryy603vR7KPvpOK8+WcY/ultO+i6xNu2xk99bYPwx7cbXtn8sDhcHfVtxeI/CyM
 F5jIAAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_155519_584891_D7DE6E8F 
X-CRM114-Status: UNSURE (   9.90  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The driver currently uses the limited MMIO (FSB) interface to access the
OTPs. The intention is to support the firmware interface alongside the
MMIO interface so the driver can pick the interface that is available
(firmware might not be loaded) and fallback to MMIO.

Some SoCs like the i.MX9 family allow full access to the fuses only
through the secure enclave firmware API. Add a property to reference
the secure enclave node and let the driver use the API.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index a8076d0e2737..70901218871e 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -20,6 +20,16 @@ description: |
 allOf:
   - $ref: nvmem.yaml#
   - $ref: nvmem-deprecated-cells.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - fsl,imx93-ocotp
+    then:
+      properties:
+        secure-enclave:
+          $ref: /schemas/types.yaml#/definitions/phandle
+          description: A phandle to the secure enclave node
 
 properties:
   compatible:

-- 
2.55.0


