Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84655C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 10:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iiNUR2t26Uu7+OW1iXl8pE11P0d1ljLW8CEOcUnql5c=; b=I3kJps9PAMH0XHa3/t6edETbG5
	fdK/1MqfuPFMaIz9KcOzGD+okP5fiMv+il0SzfZl+O2GtkduokhxtPpupn4kHFFJ5f+uI6QqsuBXS
	k3RnyAHwE2IhTDVpn030OoA39I7GydwyCS2m+ne1n5Wq4QvW/RtdP5XqMmdci4KVZDH2BmiYthwVb
	BocuxlQAp/uBlVER+74VEKBFpotDP52ygHs+oDQs3ofhpvU3mElr2AnalbBsYPbSkw6uBOTYKLrAM
	6ChvehChiVWxwvfKNJYsPf+LVTX/SkSt8RslzOtYzGvb80ki0i9fMiF5WixvhPQ7ahPTi35SGA+W6
	cwh3q+kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dhh-00000005MeO-2xb1;
	Tue, 15 Apr 2025 10:39:45 +0000
Received: from mail-m49241.qiye.163.com ([45.254.49.241])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4daN-00000005LIy-1ViM;
	Tue, 15 Apr 2025 10:32:12 +0000
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11f2f600c;
	Tue, 15 Apr 2025 18:32:07 +0800 (GMT+08:00)
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
Subject: [PATCH v3 1/3] dt-bindings: nvmem: rockchip,otp: Add support for rk3562 and rk3568
Date: Tue, 15 Apr 2025 18:32:01 +0800
Message-Id: <20250415103203.82972-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415103203.82972-1-kever.yang@rock-chips.com>
References: <20250415103203.82972-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ0xIVkkeGkhDTEMdSkIYGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a963901956e03afkunm11f2f600c
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PVE6PRw*NzJRMBgIMh4dIi4w
	GgpPCiJVSlVKTE9PTEpISklDQklDVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUhNTU43Bg++
DKIM-Signature: a=rsa-sha256;
	b=Fpvav24r00q9fYbGPkYAhH/bkoQv1u1vQmhEWGHRQNhoex6kebUG3A5krHs2i2h3fOqORNA6vqk3FqWVIAZbfmLkhzl6y/o+57CdlQgp/2FV4Bdn3tFyQDgB0e8PCWYxSQfY3QrqyNm1ytP5ozwjq0Ghp04uvIoTNLqI11gjDo4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=iiNUR2t26Uu7+OW1iXl8pE11P0d1ljLW8CEOcUnql5c=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_033211_589029_1426D7BF 
X-CRM114-Status: UNSURE (   8.62  )
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

Changes in v3:
- update the clock name from "usr" to "otp" and re-order to sync with
 other soc.

Changes in v2:
- Update the commit message and add maxItems in schema.

 .../bindings/nvmem/rockchip,otp.yaml          | 53 ++++++++++++++++---
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
index a44d44b32809..8b257662f282 100644
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
+            - const: otp
+            - const: apb_pclk
+            - const: phy
+            - const: sbpi
+        resets:
+          minItems: 4
+          maxItems: 4
+        reset-names:
+          items:
+            - const: otp
+            - const: apb
+            - const: phy
+            - const: sbpi
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


