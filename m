Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72317CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84JybEFawvEnVDJfX1degPru+BtEANRZCQyoOyQXNDA=; b=f9I+H3uzeSPtf3imdOaP526Lcn
	qC1K4hstn1MzVdsu4uw5h+RRbRynaKNNA5zyx/u/GhjyinqvVyr/FB3oJDb7+3b7fvty+6FyzxlwQ
	+UHC6/WYEZHs2dEwECjtCeqoN+r0uo0hEpRNO/gdYWRqQ7ZgsPHzX+Oosw3cXHhxFGnZ+zv6eQsFu
	TBSlTPxeUYLdl62zYNizkFMZOilwNQK1gliK/EthkvU1Mb6e4aUvgicj9iUEnYoniz7C+mRW4Ex8i
	UtHMJfvsXnNI3NMBHPIFOdA8oI43d2nQe6PgRQCCNqc3/DLm1eXKSQGZDL/b69w6snChQxmgmhqLT
	mHwL+aeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7F4-0000000HMcJ-3rM2;
	Thu, 21 Aug 2025 15:30:18 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3KP-0000000GjVQ-1Qip
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:19:34 +0000
DKIM-Signature: a=rsa-sha256; bh=84JybEFawvEnVDJfX1degPru+BtEANRZCQyoOyQXNDA=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1755775104; v=1; x=1756207104;
 b=saFAjhys+SAA5w1z6HmhRdMrqBXNWCYwA8VV09AXOYV/8+MSQT0YKeKKqx1Nf92fGzfkcVvA
 71w51cxD3ZndMX34Wg71IUm5odEer/pSah2LLw4KGMsCkQd5otdbvgBnVdlJ22B4Goy18v4lKQ6
 WBrCMf8/xj6C/vDbSgHh55vaGo1pkWaad4lkYch8F8bGVGmtKVB84LqNiqnzcfnVUsLj/yBlUY4
 +IgCJG7NseBgTqByYsAxJgZebrXyR/Lq5wtksQQR+7XT2f5b9jp+Ub9XWqgh23vuRjrN+d0aTc6
 WcqMvZdkJvRuyvUPBnO3y2ZTeXpJAXFteMlUjCZOuFGfQ==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 4562db5e; Thu, 21 Aug 2025 13:18:24 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Thu, 21 Aug 2025 13:17:43 +0200
Subject: [PATCH v2 1/4] dt-bindings: clock: marvell,pxa1908: Add syscon
 compatible to apmu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-pxa1908-genpd-v2-1-eba413edd526@dujemihanovic.xyz>
References: <20250821-pxa1908-genpd-v2-0-eba413edd526@dujemihanovic.xyz>
In-Reply-To: <20250821-pxa1908-genpd-v2-0-eba413edd526@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2011;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=qV8PLaqeW9hgJT+405ZgED/JzPTXaQoHO4G+xKSnioI=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBnLGep6WF9r3Zs+31QsVqBe4MOVhtn5MZJxbudNHn9ac
 WrHK5a9HaUsDGJcDLJiiiy5/x2v8X4W2bo9e5kBzBxWJpAhDFycAjAR0V5Ghk/nfsbwdLxoVX//
 Tj3vjdV/CY5XM/6Hb1VbNmWTW1fonVSG/zXZt4KVp+o9XusWpJ/JllDybr3ivdMeJ+NuCTnt151
 7jhkA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_041933_532023_64F9B254 
X-CRM114-Status: UNSURE (   9.74  )
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

Add required syscon compatible to the APMU controller. This is required
for the SoC's power domain controller as the registers are shared.

Also add a #power-domain-cells property as the node will serve as the
power domain phandle.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
v2:
- Drop simple-mfd
- Add #power-domain-cells
---
 .../devicetree/bindings/clock/marvell,pxa1908.yaml | 30 +++++++++++++++++-----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
index 4e78933232b6b925811425f853bedf6e9f01a27d..6f3a8578fe2a6810911fec5879c07c9ddb34565a 100644
--- a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
+++ b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
@@ -19,11 +19,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - marvell,pxa1908-apbc
-      - marvell,pxa1908-apbcp
-      - marvell,pxa1908-mpmu
-      - marvell,pxa1908-apmu
+    oneOf:
+      - enum:
+          - marvell,pxa1908-apbc
+          - marvell,pxa1908-apbcp
+          - marvell,pxa1908-mpmu
+      - items:
+          - const: marvell,pxa1908-apmu
+          - const: syscon
 
   reg:
     maxItems: 1
@@ -31,6 +34,9 @@ properties:
   '#clock-cells':
     const: 1
 
+  '#power-domain-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -38,11 +44,23 @@ required:
 
 additionalProperties: false
 
+if:
+  not:
+    properties:
+      compatible:
+        contains:
+          const: marvell,pxa1908-apmu
+
+then:
+  properties:
+    '#power-domain-cells': false
+
 examples:
   # APMU block:
   - |
     clock-controller@d4282800 {
-      compatible = "marvell,pxa1908-apmu";
+      compatible = "marvell,pxa1908-apmu", "syscon";
       reg = <0xd4282800 0x400>;
       #clock-cells = <1>;
+      #power-domain-cells = <1>;
     };

-- 
2.50.1


