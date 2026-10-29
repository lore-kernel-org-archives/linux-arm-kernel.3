Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E494606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cglSva6p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7D4WWcgpY9Rx/WzLn/080IBar+xdg1pQrFCdgvE70ME=; b=cglSva6pndOsbQ
	ruh5O2abn1CDySDY+jmT1w0kopmyrJajFI7nG61hwq3i25akGq7WM94KTQ+7TjjVftpuz9N4jYdRA
	9UUUI8jTw58WjyjGV98PTcEwdhObA8g5X9RhJW8uXg/+/lyuIfk9DW2z1Z1kz2agbb7Ua+f7nzGT4
	UOcclhBHo2GHSlEITyyug6GY4R5VM1t/qNCBkedOQLohomtCLccnQuSngSsYz5sXPqfQuZaFCbk05
	hjanZBHUGePD9f0Fhr/VciSqB0Uo1Y9jQV/XzP5j4Am2/oDpk8UMikv6nXNIQZPmtL2dCurVrYbDR
	XiQxKhZIDXQ2M27QTT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPuj-00000009IDc-25CF;
	Thu, 29 Oct 2026 13:11:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPuf-00000009IAt-1Poc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:11:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A8C360207;
	Thu, 29 Oct 2026 13:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 451851F01829;
	Thu, 29 Oct 2026 13:11:20 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Biju Das <biju.das.au@gmail.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/9] dt-bindings: can: renesas,rcar-canfd: Document R-Car X5H support
Date: Thu, 29 Oct 2026 14:11:02 +0100
Message-ID: <2b91003767a4089e21d8fdaf9892aa99d0fcd45c.1793278754.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793278754.git.geert+renesas@glider.be>
References: <cover.1793278754.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document support for the Controller Area Network Flexible Data Rate
(CAN-FD) modules as found on R-Car X5H, which is the first member of the
R-Car Gen5 family.  It is a further evolution of the CAN-FD block found
on R-Car Gen4 SoCs, adding Freedom From Interference and Virtual Machine
support.

Binding-wise, the major difference is the split of global and
per-channel interrupts (like on RZ/G2L), and the addition of Virtual
Machine interrupts.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Do we need the VM interrupts, or are they meant for the hypervisor?
If yes, should we add a third option for interrupts and interrupt-names:
  - 2 global interrupts,
  - 8 VM interrupts,
  - 8 (= number of channels) x 3 channel interrupts,
so we can easily restrict the number of interrupts when a variant with
less than 8 channels appears?
---
 .../bindings/net/can/renesas,rcar-canfd.yaml  | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index 470d178e5faccf6a..2d36d63b281e30b2 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -40,6 +40,11 @@ properties:
               - renesas,r8a779h0-canfd     # R-Car V4M
           - const: renesas,rcar-gen4-canfd # R-Car Gen4
 
+      - items:
+          - enum:
+              - renesas,r8a78000-canfd     # R-Car X5H
+          - const: renesas,rcar-gen5-canfd # R-Car Gen5
+
       - items:
           - enum:
               - renesas,r9a07g043-canfd    # RZ/G2UL and RZ/Five
@@ -86,6 +91,36 @@ properties:
           - description: CAN5 error interrupt
           - description: CAN5 transmit interrupt
           - description: CAN5 transmit/receive FIFO receive completion interrupt
+          - description: CAN6 error interrupt
+          - description: CAN6 transmit interrupt
+          - description: CAN6 transmit/receive FIFO receive completion interrupt
+          - description: CAN7 error interrupt
+          - description: CAN7 transmit interrupt
+          - description: CAN7 transmit/receive FIFO receive completion interrupt
+          - description: Virtual Machine 0 transmit interrupt
+          - description: Virtual Machine 0 receive interrupt
+          - description: Virtual Machine 0 error interrupt
+          - description: Virtual Machine 1 transmit interrupt
+          - description: Virtual Machine 1 receive interrupt
+          - description: Virtual Machine 1 error interrupt
+          - description: Virtual Machine 2 transmit interrupt
+          - description: Virtual Machine 2 receive interrupt
+          - description: Virtual Machine 2 error interrupt
+          - description: Virtual Machine 3 transmit interrupt
+          - description: Virtual Machine 3 receive interrupt
+          - description: Virtual Machine 3 error interrupt
+          - description: Virtual Machine 4 transmit interrupt
+          - description: Virtual Machine 4 receive interrupt
+          - description: Virtual Machine 4 error interrupt
+          - description: Virtual Machine 5 transmit interrupt
+          - description: Virtual Machine 5 receive interrupt
+          - description: Virtual Machine 5 error interrupt
+          - description: Virtual Machine 6 transmit interrupt
+          - description: Virtual Machine 6 receive interrupt
+          - description: Virtual Machine 6 error interrupt
+          - description: Virtual Machine 7 transmit interrupt
+          - description: Virtual Machine 7 receive interrupt
+          - description: Virtual Machine 7 error interrupt
         minItems: 8
 
   interrupt-names:
@@ -114,6 +149,36 @@ properties:
           - const: ch5_err
           - const: ch5_rec
           - const: ch5_trx
+          - const: ch6_err
+          - const: ch6_rec
+          - const: ch6_trx
+          - const: ch7_err
+          - const: ch7_rec
+          - const: ch7_trx
+          - const: vm0_tx
+          - const: vm0_rx
+          - const: vm0_err
+          - const: vm1_tx
+          - const: vm1_rx
+          - const: vm1_err
+          - const: vm2_tx
+          - const: vm2_rx
+          - const: vm2_err
+          - const: vm3_tx
+          - const: vm3_rx
+          - const: vm3_err
+          - const: vm4_tx
+          - const: vm4_rx
+          - const: vm4_err
+          - const: vm5_tx
+          - const: vm5_rx
+          - const: vm5_err
+          - const: vm6_tx
+          - const: vm6_rx
+          - const: vm6_err
+          - const: vm7_tx
+          - const: vm7_rx
+          - const: vm7_err
         minItems: 8
 
   clocks:
@@ -232,6 +297,22 @@ allOf:
         resets:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rcar-gen5-canfd
+    then:
+      properties:
+        interrupts:
+          minItems: 50
+
+        interrupt-names:
+          minItems: 50
+
+        resets:
+          maxItems: 1
+
   - if:
       properties:
         compatible:
@@ -241,9 +322,11 @@ allOf:
       properties:
         interrupts:
           minItems: 20
+          maxItems: 20
 
         interrupt-names:
           minItems: 20
+          maxItems: 20
 
         resets:
           minItems: 2
@@ -354,6 +437,7 @@ allOf:
             enum:
               - renesas,rcar-gen3-canfd
               - renesas,rcar-gen4-canfd
+              - renesas,rcar-gen5-canfd
     then:
       required:
         - resets
-- 
2.43.0


