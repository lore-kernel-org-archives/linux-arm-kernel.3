Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAC1CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 01:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grnlztG7UYsYqQMC7zz6egWWB2Zgq5/oqI4cPgpS/bU=; b=Z1dov4sLo4xC455E7Uvjp9BO+k
	2NEQQlGR8ZBhxy0K4JbBg+8cfJ3NSO6yghUFIHe3VjOfVNq63UFRkHfWaQh5XKDk9ocgG9O4OZGiT
	D16bSPr9wjk755mr9gJfpGUsHOAOIYySK1Do4MwE0GQO+jkxvJa9SLCUv2KdRLoHFm2xBi2hdsD3C
	XzPNzOUEvxGjaOaRqZ5E1FEerj5pfXApT9DRwHHeAZbHWMJdbZHLNw5Hg6rMCJaCv1QG8DWXwqSLz
	yhpavjlrL0DrGOvlTKYEZqca29zVRlyPvwBHoVceB7G6pvx3pGQkJ7TIOQ45gY9JUgO6nk92rrZUC
	qFGNZRnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uygpx-00000009pFO-0kjd;
	Wed, 17 Sep 2025 01:19:57 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uygpu-00000009pEF-0gHx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 01:19:55 +0000
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 72718EC0217;
	Tue, 16 Sep 2025 21:19:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 16 Sep 2025 21:19:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1758071993; x=
	1758158393; bh=grnlztG7UYsYqQMC7zz6egWWB2Zgq5/oqI4cPgpS/bU=; b=Y
	xkVH3dzEcoOIogHvMHdcKMQFiExx7G2kmPU5wRm4rlH5IenjWXRrlqOAUIQKV974
	4EuCq2nUDaWrPiKqRQV7a+eqsnfB4ozlEtS2lNsFWGkIRKs/Q5sBakICPhtBmbHX
	zajuGQFgrkkPOzQ/k2b8S8S8QPsD07k+jBfQf0ceUDtxqr8agv6dDXoCV5ZOwkRO
	a5u0w3nxlb8RYIuC/SDKAiMhbw/33jIx0Rqbw5GVVQFKp1zESJ4WNzSwj78VFV5z
	ZP2gR3LPWaTbRQEGUcb8zMSwmYNfeQnSu2F2Aazez2opFXnRHNH4YAr0yPiQkX8H
	M4vPZY2OKTzViI1SzPdOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1758071993; x=1758158393; bh=g
	rnlztG7UYsYqQMC7zz6egWWB2Zgq5/oqI4cPgpS/bU=; b=UB/vZThn7BH7UzkdP
	g1OmUxgo8qSjX25/rmBWESb7snR31atsrog1PbE3fS1IFKEv44OVkD+f7r0/UhI+
	Qp/SbGG+wQgxEei7sOhAvRwtE77ifCObW6iBvYCSYewGQuMDN43yBbeN5pNb1vCg
	gsltR/kz51uCT6UhOERlxGFrTM8Tnqqdlowfk6DMJUr4MOhdcHO/XOEvSfVRckTf
	08JtBpe6NKyNrllujG7LGor5/wNOOffpB8W3Fh+O0HTeH5X/CPKRkP6WmKSlOCZA
	zxF/21julguqHw91SZrU/2VE6CfiTQylqzhp1MueVEVNFE1ul5Dx4ibWAoT2fLy/
	UGVtw==
X-ME-Sender: <xms:uQzKaFpdWffUaOjgyg5vYS0Wc9ubR5t6jY3ENocDkdPO3xp0xS4WmA>
    <xme:uQzKaKN7l-gDNTQSbHn8SKiTffmYtBazl64WenW7-gapD5E_WUSyJI5gdW496QYGl
    3s3bbRuN_bR2HEtpoc>
X-ME-Received: <xmr:uQzKaF3r9fxwvZWhfwoMzoKGuvUPCcX6A_uAFmTDbMntEhsF7BKavIGD5HVFQv3BuxCFjS8TDzSWVZiYQMkwhkGNV92KRqwI7kTK9Yajr5KgZfCgUUSy9muULbl5Fo7Orq9qzHnxihv355MFQG0wKCwOL3M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegvdduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforghthhgvficu
    ofgtuehrihguvgcuoehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruheqnecuggftrf
    grthhtvghrnheptdevffeihffgudeihffgudduvdeuueekteekvdeihfegveelgfffveeg
    hfegiefgnecuffhomhgrihhnpehtrhgrvhgvrhhsvgdrtghomhdrrghupdguvghvihgtvg
    htrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruhdpnhgspghrtghpthhtoh
    epkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvvhhitggvthhrvggvsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrh
    hnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhhrgif
    nhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvggvsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehmrghtthesthhrrghvvghrshgvrdgtohhmrdgr
    uh
X-ME-Proxy: <xmx:uQzKaBB6c1M309Jr_EuY_XQdfw297VwrXu1iJSOyKq_SPrE0rcERuQ>
    <xmx:uQzKaKKIFTDg2XXrqQGSAnBRKPKIv9cFP89a-aoEBgFRTdhTn3O2-A>
    <xmx:uQzKaClv5lS7xMdBg1IDV537WNDjSCNkxKpO2O-KLx-W8uszxf9seQ>
    <xmx:uQzKaLYmz_7PR3HFlRGasaTEl2NpWJfKOVjRIZqt7h0EDAoPf6gzcw>
    <xmx:uQzKaOc6P5AgwCuZcvz9qDVLYjL50d2c0nvCTQzQlYTXJCnGMmRx0wOa>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 21:19:50 -0400 (EDT)
From: Mathew McBride <matt@traverse.com.au>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v4 1/2] dt-bindings: embedded-controller: add Traverse Ten64 board controller
Date: Wed, 17 Sep 2025 11:19:39 +1000
Message-ID: <20250917011940.9880-2-matt@traverse.com.au>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250917011940.9880-1-matt@traverse.com.au>
References: <20250917011940.9880-1-matt@traverse.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_181954_573368_4443DC37 
X-CRM114-Status: GOOD (  12.33  )
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

Add device tree binding for the board (micro)controller on Ten64 family
boards[1].

The schema is simple and is (presently) only consumed by U-Boot, but it
is possible nvmem, watchdog and other features could be described in
the future, as well as extension to future Traverse boards.

[1] https://ten64doc.traverse.com.au/hardware/microcontroller/

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
 .../traverse,ten64-controller.yaml            | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/traverse,ten64-controller.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/traverse,ten64-controller.yaml b/Documentation/devicetree/bindings/embedded-controller/traverse,ten64-controller.yaml
new file mode 100644
index 0000000000000..08d02c4df8732
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/traverse,ten64-controller.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/traverse,ten64-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Traverse Ten64 board microcontroller
+
+maintainers:
+  - Mathew McBride <matt@traverse.com.au>
+
+description: |
+  The board microcontroller on the Ten64 board family is responsible for
+  management of power sources on the board, as well as signalling the SoC
+  to power on and reset.
+
+properties:
+  compatible:
+    const: traverse,ten64-controller
+
+  reg:
+    const: 0x7e
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        board-controller@7e {
+            compatible = "traverse,ten64-controller";
+            reg = <0x7e>;
+        };
+    };
-- 
2.45.1


