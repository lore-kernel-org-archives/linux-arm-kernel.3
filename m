Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1A9CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNW6pVpgXkG7O+Kgp8YtS4/oYggLDHSWVvfCvakisrc=; b=gDYnhqggav/Sm3/0K1eebuta0w
	HeTx9b8W3pdY2u9gFlr3fLng+dlC3/lgMexL3D9gPE5xrwZBbQdPE/yiLIPeEW1Z7GhJ2oMRY9WGk
	RPDcd6id47WBPLzt46EFiy2CP0F90fR35XkZs+q46AyB+Hnrrf95bz+x9bxNYvkTt+G3TYmQlUd/v
	dyxwWH20t04lNHoHubQOS7Qim2JlkTTvpt1RTHAs2SoMhU35uxPT/KBThQfXkj0/okUHDUGygmHB4
	U3DuF47N+NSpOPOTewS/KLyNIxg+Nbo8uGqShTMscHgg7lDqdw8J0GzvIaylacsGxmJosMKWkDHde
	AKR+41DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIq6p-00000007MyN-3fRg;
	Tue, 11 Nov 2025 15:16:39 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIq6n-00000007MxH-22uo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 15:16:39 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id C7E08213E8;
	Tue, 11 Nov 2025 16:16:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1762874192;
	bh=CNW6pVpgXkG7O+Kgp8YtS4/oYggLDHSWVvfCvakisrc=; h=From:To:Subject;
	b=Nxjzr93oD5jzSI9aeEOizp70cHgWsw4mpFSLTnz+AAN97vyqupIVxZh8PKYHOePxz
	 DlI2lM7UykQyj0+h81WyYw9nhhYOymdOi2KTj0ud5kHCdsW2h7/N+wcBSFCCvQGKw5
	 C+a3SJ52e2gtsK+30Wl6GmRjcM1scorM3HfnX1nfTRwfJR8j+WiueiHd7VJjfrLUng
	 tGGpkD4QWdj7WXSieKRymknOJidfbd6EK/WBpsAEk/4OaDKpYw2O6xZMdSANI5sTSD
	 3h3QZP/XRxN9+zXNcklUQfwX0ulwq8QpZ9jHAuR3XXTnYaRnVne9a0wSLzSk+iDUJj
	 0tJOHNlst3+Mw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add Toradex SMARC iMX95
Date: Tue, 11 Nov 2025 16:16:13 +0100
Message-ID: <20251111151618.70132-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111151618.70132-1-francesco@dolcini.it>
References: <20251111151618.70132-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_071637_756146_D2C42389 
X-CRM114-Status: UNSURE (   6.92  )
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

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

Add DT compatible strings for Toradex SMARC iMX95 SoM and
Toradex SMARC Development carrier board.

Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/smarc-development-board-kit
Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2: Added acked-by conor
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 21b7168d61f5..ca42ddd95345 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1442,6 +1442,12 @@ properties:
           - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
           - const: fsl,imx95
 
+      - description: Toradex Boards with SMARC iMX95 Modules
+        items:
+          - const: toradex,smarc-imx95-dev # Toradex SMARC iMX95 on Toradex SMARC Development Board
+          - const: toradex,smarc-imx95     # Toradex SMARC iMX95 Module
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:
-- 
2.47.3


