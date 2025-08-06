Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DF2C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 17:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fV6lVtW13D0yu6iCI/jPFRPbDpKGqEPIm6A+8YzQujM=; b=hCT1DKBFcV3KR052Va0GtwOKut
	n00C/so+TeoziP9ZzjU6GGvab7s0IESsqtoGXTPgJQ7LcklLFiyFhTlUBAP6vtk/LQXRpdTit5BXW
	OXHSGPY6TYrfPqPp1h8Us0A6sHHfBYZximu/fDzW4yshVs5tBlPQd+39AL/wgGomFSeAuWI+YmKLZ
	AQyVCQdWqam2FKGPVVeNi/xNo65wJv+/p+a0XAii6O8GbmNLz2iALBXoJ9H8W3YU0rCtO7MwuOx/r
	nZE+/eHPEjTWSFCz/yXwPCaSL7+cKLJq4Jh0RsNnKrtNq8jv1px2PSxmQZslLc+neaFtfU77uuB07
	DmHQxa/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uji5I-0000000FxME-33qp;
	Wed, 06 Aug 2025 17:37:52 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uji2k-0000000Fwlh-1Ub7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 17:35:16 +0000
DKIM-Signature: a=rsa-sha256; bh=fV6lVtW13D0yu6iCI/jPFRPbDpKGqEPIm6A+8YzQujM=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1754501630; v=1; x=1754933630;
 b=tt9i4LuylpZBhSuTuK9fRqLtp9gqEe9lN2eWeJbj22p4QHsOUDtod8ktIIlSwrngs5kXjlE9
 nhSxBJVppkGnhT4bojW9PQIujy0a8Iu35WjrmueQ6ofQvfD1fnEHkUnsj0QhJ+6EcE0/gJGh1lN
 ebmxopqB4UOqe0Xlu95uHfXkDZqrOG1Ng/EsyHVaqAwF/WpDKYwqHIeey0xWOkLZX7tYFsP3sMY
 tKobRVGF4LRNZKMCWVwNjTl2PNwJCqwefOf66XIfI5nqYe386q62NauVhAbwD6bUdao2krTrqxv
 Xxk7w2PjWzQlrIam3J2OzcBJfjU6l7D7QSfP/tqskpchg==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id ee7cda2d; Wed, 06 Aug 2025 19:33:50 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Wed, 06 Aug 2025 19:33:20 +0200
Subject: [PATCH RFC 1/5] dt-bindings: clock: marvell,pxa1908: Add
 simple-mfd, syscon compatible to apmu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250806-pxa1908-genpd-v1-1-16409309fc72@dujemihanovic.xyz>
References: <20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz>
In-Reply-To: <20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2431;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=Z1gEMJiFIFjpRGok6tz/RfwwoNl0Rv2K7M7v3c9mDIw=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBmTJ/5Z0mnWXV+/UbX1oWRn2Pp4jWtV4ZapKw8vnbqc3
 fnxTE31jlIWBjEuBlkxRZbc/47XeD+LbN2evcwAZg4rE8gQBi5OAZhI4VKG/z4zlEJKtGumOxVI
 hNg6yD227M76wvc6UTnRUD9xQtv3DoZ/dgEqycen7nV9sNT/wTU5KyWHb98M6758mGz5WlTjQYw
 EAwA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_103515_413441_FC7B28B0 
X-CRM114-Status: GOOD (  10.22  )
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

Add required syscon and simple-mfd compatibles to the APMU controller.
This is required for the SoC's power domain controller as the registers
are shared. The simple-mfd compatible allows devices whose registers are
completely contained in the APMU range (such as the power domain
controller and potentially more) to be children of the clock controller
node.

Also add an optional power-controller child node to the APMU controller
to accommodate the new power domain driver.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../devicetree/bindings/clock/marvell,pxa1908.yaml | 36 ++++++++++++++++++----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
index 4e78933232b6b925811425f853bedf6e9f01a27d..5e924ebd97e6457191ac021addafd22caba48964 100644
--- a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
+++ b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
@@ -19,11 +19,15 @@ description: |
 
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
+          - const: simple-mfd
+          - const: syscon
 
   reg:
     maxItems: 1
@@ -31,18 +35,38 @@ properties:
   '#clock-cells':
     const: 1
 
+  power-controller:
+    description: |
+      Optional power domain controller node.
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: marvell,pxa1908-power-controller
+
 required:
   - compatible
   - reg
   - '#clock-cells'
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: marvell,pxa1908-apmu
+    then:
+      properties:
+        power-controller: false
+
 additionalProperties: false
 
 examples:
   # APMU block:
   - |
     clock-controller@d4282800 {
-      compatible = "marvell,pxa1908-apmu";
+      compatible = "marvell,pxa1908-apmu", "simple-mfd", "syscon";
       reg = <0xd4282800 0x400>;
       #clock-cells = <1>;
     };

-- 
2.50.1


