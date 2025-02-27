Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27F0C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qPdG0uqXJNCLpi+c8n+pbqoC1a0sWOgDfdz7/HqC6dE=; b=xSeFsbi4p8QEB2hYdtP9g6LuGo
	ZIZyjoRETSstMD2uLnKNnxmZd81aNoOn+nR8OMXJz9Y+g9GfZYHEPVetRezXmx47dZeQsKLUyMfkD
	zw6eA5Pbso2iiWhrNWNt8gpdVNQk8YxiaJN1NbE2Flnqp5HSv2KLprjL+ikN83ldZyUGKLvZhYaKa
	6RCjyyn1P15VPH/JhP0IdlXFLZTClHGQiRkkKOhQGCUIheolZKDQv6p2RpS7VHnWugabbYi/Drd3v
	Eg195uQ8QSAlPVTTYEgzdGXSKZy3WBDm4+1kfKRZY78JwAScycL83Z+YW9jdsMp4IPswkY1XwIoCU
	G6Qc8tnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbw4-000000079R6-3Tq7;
	Thu, 27 Feb 2025 11:20:12 +0000
Received: from mail-m32117.qiye.163.com ([220.197.32.117])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbkO-000000076L6-27gv;
	Thu, 27 Feb 2025 11:08:09 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c65b37d9;
	Thu, 27 Feb 2025 19:08:05 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: nvmem: rockchip,otp: Add support for rk3562 and rk3568
Date: Thu, 27 Feb 2025 19:08:02 +0800
Message-Id: <20250227110804.2342976-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk0aH1ZOHUwZGkhNGUNOTR9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9547179f2b03afkunmc65b37d9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PBQ6TAw5MjIWNw1JEhQxLilN
	CQIaCjFVSlVKTE9LTU5PT0NNSENNVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJTEtPNwY+
DKIM-Signature: a=rsa-sha256;
	b=hspV/toZNKfN8Mbx1pRYGbdIchgyFEK23TYRO89SrNo6eUGZZ9ZjFplwfLsJsKzcdU9px4owG7jeGH9ZGJgDarEPrIEjE4BSA0XGr75HULNHQ+jfsjBMF3Pe5bZARBaiENe2VtHIcYtPulKO5eqsgqLZjlLN+PAzDcbKE1xdA2A=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=qPdG0uqXJNCLpi+c8n+pbqoC1a0sWOgDfdz7/HqC6dE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_030808_692903_B8766E77 
X-CRM114-Status: UNSURE (   7.53  )
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

Add compatible entry for the otp controller in rk3562 and rk3568, add schema
for different clock names for new entry.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v2:
- Update the commit message and add maxItems in schema.

 .../bindings/nvmem/rockchip,otp.yaml          | 53 ++++++++++++++++---
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
index a44d44b32809..7572f4a1d73b 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - rockchip,px30-otp
       - rockchip,rk3308-otp
+      - rockchip,rk3562-otp
+      - rockchip,rk3568-otp
       - rockchip,rk3588-otp
 
   reg:
@@ -25,19 +27,15 @@ properties:
 
   clock-names:
     minItems: 3
-    items:
-      - const: otp
-      - const: apb_pclk
-      - const: phy
-      - const: arb
+    maxItems: 4
 
   resets:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
   reset-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
 required:
   - compatible
@@ -62,12 +60,45 @@ allOf:
       properties:
         clocks:
           maxItems: 3
+        clock-names:
+          items:
+            - const: otp
+            - const: apb_pclk
+            - const: phy
         resets:
           maxItems: 1
         reset-names:
           items:
             - const: phy
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3562-otp
+              - rockchip,rk3568-otp
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: usr
+            - const: sbpi
+            - const: apb_pclk
+            - const: phy
+        resets:
+          minItems: 4
+          maxItems: 4
+        reset-names:
+          items:
+            - const: usr
+            - const: sbpi
+            - const: apb
+            - const: phy
+
   - if:
       properties:
         compatible:
@@ -78,8 +109,16 @@ allOf:
       properties:
         clocks:
           minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: otp
+            - const: apb_pclk
+            - const: phy
+            - const: arb
         resets:
           minItems: 3
+          maxItems: 3
         reset-names:
           items:
             - const: otp
-- 
2.25.1


