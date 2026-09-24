Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C9FC98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMiLzq9i2T7hnkODYgCpXEhyVPT7UC5o9DbVtj7kdfM=; b=isTVuVBOlBCfHOs+n1akFU+UWe
	VHveGH9JqoQ7ZHT8AYHlhmilA2U0MeFnvy/MxkNNVDCr+ECIzWurSWWSK/kFoUKCenE9TTWBeUvgF
	cMmYiSSzgnTSzA5Ss9ORbR+o1PddQqgqCZapXXiivWb6tpu670kH8Hcy9Vq/Ha6wnMn7VQJKVgq5O
	yeFJetZFzJnFY+SuEdZsb62P5MZOLbNJU+tjk+tX1goIN4ZKNmyqxougfss+/XGME5uiBfJLwubWh
	X7pgl6dsxmC2lf09GqSH23bIj5+fNlbLI6lvvFXzEvrBr+n0jxeIvilCF3PY/vmT+z6Ibwba1KtsX
	GnIwf7jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dPI-0000000ADCY-0afT;
	Thu, 24 Sep 2026 06:58:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dP5-0000000AD7L-3IiE
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 06:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uMiLzq9i2T7hnkODYgCpXEhyVPT7UC5o9DbVtj7kdfM=; b=RayFu6Q0yL4+BkXd1Bps/6YQ6t
	PyK0yvegdvc/njht3x5VvqxBktzJueA13hPjq0WzXJbDIRgs77TYuP9G4sl3/fpCuzhxbHLO0WZBK
	rQWObcSaRk/vpBiiUXK73OKY4CoamTlXQ0hTca9lejrdaQ0IEuXpuNj9LnxacZx07dhp/BoNugmN4
	NFb6J0/LXxv0H9AtKEFUV6KVBHanDP/t6pjAktOup9ONRuX/vmf0qYpx1KNm3j0kC1/uWYOzyB2JU
	W9udSLt7vXMFG7YvgGWx0+TyNq66QgDgQQJjI92r98hkZV+MyXpLDOoYYMJDVNQIZhmv19L/TyriP
	K6awFtmQ==;
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9dOy-0000000FckE-1l1O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:57:55 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4FD2720230;
	Thu, 24 Sep 2026 08:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790233067;
	bh=uMiLzq9i2T7hnkODYgCpXEhyVPT7UC5o9DbVtj7kdfM=; h=From:To:Subject;
	b=Qpey4FCwcVeMI9QWXtX2RX7SLt8mPCtss3pODGJOXP78bTflpCLdKgJ/hTxTwkJcE
	 HbKwGZSdbNUtxu+VWgyJtZhSmM9Vr8DlVY9EwINCQtpwE8J0oivEuw2g+MsFN+bKeU
	 PXye/g/pyQQh00mpZ1KyzahbKYEJRhGwBbBPWSrzthN0wI+jh2isOA3/HZoaef2Sxh
	 qXxeSIxrLQhKKqWsmzUeZVN8cDzhcnhNNIIxkMFYzYVSjWjzBeH0WmHJVxFLbLkNCm
	 trqOGpUEs9PM6AR/p39aYcm4QsfvQhosfe82dF3QFhju2l9c3Q2LOiETJvjryloNK3
	 00aBxMK0bKHyA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/7] dt-bindings: arm: fsl: Add Toradex OSM iMX91/iMX93
Date: Thu, 24 Sep 2026 08:57:28 +0200
Message-ID: <20260924065735.17678-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924065735.17678-1-francesco@dolcini.it>
References: <20260924065735.17678-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_075753_103990_EBC1C414 
X-CRM114-Status: UNSURE (   6.38  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add bindings for the Toradex OSM iMX91 and OSM iMX93 SoMs and the
OSM Development Board they can be mated with.

The Toradex OSM iMX91 and OSM iMX93 are OSM 1.2-compliant SoMs based
on the NXP i.MX91 and i.MX93 SoCs, respectively.

Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx91
Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx93
Link: https://www.toradex.com/products/carrier-board/osm-development-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v3: rebased
v2:
 - add acked-by
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index f3c73510c18b..e563d96e4ff7 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1537,6 +1537,12 @@ properties:
           - const: toradex,lino-imx91
           - const: fsl,imx91
 
+      - description: i.MX91 boards with Toradex OSM Modules
+        items:
+          - const: toradex,osm-imx91-dev # OSM iMX91 Module on OSM Dev Board
+          - const: toradex,osm-imx91
+          - const: fsl,imx91
+
       - description: i.MX93 based Boards
         items:
           - enum:
@@ -1557,6 +1563,12 @@ properties:
           - const: toradex,lino-imx93
           - const: fsl,imx93
 
+      - description: i.MX93 boards with Toradex OSM Modules
+        items:
+          - const: toradex,osm-imx93-dev # OSM iMX93 Module on OSM Dev Board
+          - const: toradex,osm-imx93
+          - const: fsl,imx93
+
       - description: i.MX94 based Boards
         items:
           - enum:
-- 
2.47.3


