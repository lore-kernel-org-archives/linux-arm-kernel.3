Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BFECD6E69
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 09:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RwDPS3J+iwGQnJ5j2x+0W+FSjnR5X4EL0UDsDwy7jSE=; b=NngisIWJFUWNjgaPk6NypdpcoU
	MUP6uPU/vnkZbnfRFmLDNfIdvLQgIEEiVbHXW14r6G5dIksXbK476YCv9McEqACu55K8+JUEWbT3d
	zn7BtmhEm3y6N9FW6zgRTofvh2g9251X1uBA28IDD6pBYTAjkYwTk1TaMqEw5ZBE/LMITPJNAkNC2
	ceeTZh280oV2cpnHMrgx/lJ5Li7afg5faB6On2nz3EtS4E49ShycmTJrvK0G8m5lDTsBB8931ioox
	FT/tBR4J+PuVeMzsH6YyHqb40u8aJcS86vcltHUvbmtLHnQtN6t28aJ7qIjx3BSr/Bnk4MYG8PbQA
	82ESh2gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUi1b-0000000EigA-12he;
	Wed, 03 Jun 2026 09:36:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUi1Z-0000000Eifa-2VlI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 09:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=RwDPS3J+iwGQnJ5j2x+0W+FSjnR5X4EL0UDsDwy7jSE=; b=IVwQwH03DTA8GJxyXMcXNchK85
	/QtvHVq7mcf+++ZFkVpFYCXDHWGJL6dOHd3fD2Fm2f2vnNqYWk+xoz/fvy2rrlETQMpvSxQiIHQW3
	foDholov2CX8OMkSbSAIziWyzhS+K+g4LAeXOkqSQZgHIPamzUPWB4RXt7uX0tPnPVsea9LvnEnRa
	b1Yuy/nwYA+wBxUXil3AEIegSpFJLvHhei2IFC9DB9X3nCfUnYdK7yDHSt/rPz9tTTUAaHAQRjRgD
	YHklyfNrQEzrOhvkVwsTjP/dYb1SKbvNTb6pIguEZgElAQjA1AmRBhi7C0ANN2laauWu88Kqe/vRU
	3lPOSKAw==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUi1W-0000000BjSZ-1tk1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 09:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=RwDPS3J+iwGQnJ5j2x+0W+FSjnR5X4EL0UDsDwy7jSE=; b=GNh54dWJosjirEQ+uOMV6AjCUU
	p3cGHsxVlj+LNMuLFMbouYHAAyC15gslju3v3GMxWKz5RBJEaMI9sMjYxN5Y7Z47OjC5MwL6bvVrO
	wYcZCOSxUVgIzoBriLFcDsAHT98LuWwdYdc3/MAX6otBcaHjunirYpkOCjT1JHhEk1U5n8JjBfz+D
	3dugn/tsk2v1nHXRtoTkPr35z3EhAQca6jq3A70uHZsEC8XPAF+KMntBQK88uHSUH93JscXD0kyuW
	zcFOOFv58/byBSwrCRe5Z9UioCEC3aMvZce9o8GsRtft4q+dhU+vtC1Wu6W4AJA2icWn44hZeQZlt
	mL38+wWg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wUi1S-000303-0Z;
	Wed, 03 Jun 2026 11:36:26 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wUi1Q-000Hpl-2T;
	Wed, 03 Jun 2026 11:36:25 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Paul Gerber <paul.gerber@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/4] dt-bindings: arm: fsl: add TQMa8MPxS board
Date: Wed,  3 Jun 2026 11:36:06 +0200
Message-ID: <20260603093621.2504490-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28019/Tue Jun  2 08:33:27 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_103630_585995_1170E186 
X-CRM114-Status: UNSURE (   8.43  )
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

From: Paul Gerber <paul.gerber@tq-group.com>

TQMa8MPxS is a SOM family using NXP i.MX8MP CPU family.
MB-SMARC-2 is an evaluation mainbord for this SOM

The SOM needs a mainboard, therefore we provide two compatibles here:

"tq,imx8mp-<SOM>" for the module and
"tq,imx8mp-<SOM>-<SBC>"

Signed-off-by: Paul Gerber <paul.gerber@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v4:
* None

 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 4d167cf392830..67437c8d669dd 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1310,6 +1310,18 @@ properties:
           - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
           - const: fsl,imx8mp
 
+      - description:
+          TQMa8MPxS is a series of SOM featuring NXP i.MX8MP system-on-chip
+          variants. It has the SMARC-2.0 form factor and is designed to be
+          placed on different carrier boards. All CPU variants use the same
+          device tree hence only one compatible is needed. MB-SMARC-2 is a
+          carrier reference design.
+        items:
+          - enum:
+              - tq,imx8mp-tqma8mpqs-mb-smarc-2    # TQ-Systems GmbH i.MX8MP TQMa8MPQS SOM on MB-SMARC-2
+          - const: tq,imx8mp-tqma8mpqs            # TQ-Systems GmbH i.MX8MP TQMa8MPQS SOM
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.54.0


