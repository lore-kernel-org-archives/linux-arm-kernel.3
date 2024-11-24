Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3634E6919E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 22:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bRO0MNVNAIlbEzSSOt3aDRodyjqV1gS4KogB7ApQb4=; b=2/tPu9g6l72xkHiJz7LjjL9O5N
	qQ+iSbrfUd/OuvIXbkFTlzcLcxFy/qkHsobAG2t1bkWCeVce8KLY4MhBKrU3aLmGr0+1xJnDS+64U
	H6xwzdCnNQFDR53yT5nwfWmEtheXsNnyKhgJg4WhjFDEQD9qOUCaVLHxTC05ydIuYCSTfWEqaoD/6
	bn8l6pbFkiyPWoeio0F4wZU2NTw9GKBW1rNSJC0aF3lVDxemP2HyPR0J5VKpS6Qmi2tu9F6Apt9tG
	nxcZtlBiN91YGWh5MV19bSveN6O+bMYfLGTjqZZOnUX92FT9Ux8GrprPlbblGmocBxq1UvoeRvoU5
	CL30lHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFL8l-00000006iFI-3TqT;
	Sun, 24 Nov 2024 22:31:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFL6s-00000006hqV-3Ick
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 22:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E743F5C410C;
	Sun, 24 Nov 2024 22:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2517AC4CECC;
	Sun, 24 Nov 2024 22:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732487381;
	bh=oBmgB4n3U2evvqYhhVMBbKaiZhJ4zZa97cdV6i9zRZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W82RVZGxUOQ2s5evCxvlfUgWaPD6qSBLpUPavraAh4v3Wc+XirzXceBjfYGWqhbg3
	 6mEq35MdUKyd7qwAqYIyJtEomcEZgMlTSz7B3YteKCGA1sdfj+8QbjgTBotx2FACn8
	 V5WyAswZQ9IjMS3858mZLc1OfKX9lW9rXWHWI4Ec5sWXV5/l/JterB+pgWtL3v8Bx9
	 Wjx0cfRDw79yqT49hmKAr/Eycqtp89ViNHdQ1eq7Vd8+IGTKpL8vOs1c8VwKfujqmc
	 +PmmoO2APravNjmNIWPQVZFn5JnCZfmK94XRJRBH3jO/sOsgSWsgMuRoJL9v41nD5s
	 o2LHOifdvKRkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17881E69187;
	Sun, 24 Nov 2024 22:29:41 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Sun, 24 Nov 2024 23:29:24 +0100
Subject: [PATCH 1/5] dt-bindgins: display: Add Apple pre-DCP display
 controller bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241124-adpdrm-v1-1-3191d8e6e49a@gmail.com>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
In-Reply-To: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732487379; l=2711;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=NTNIkjPdOTlJZEDvMknaGPG5ha7ey/9KeGDX3Cvd+fo=;
 b=aEiRFrdmA0I2NmORiFQ0n25DBwKAtSgEjQA1vtAY9JgY15BTKorcuza/Kpb5hFtDSET8waSkN
 UXv3sdP+1LFD5i79mgtG+qRN2dKShhJRlzP0wvWtLVqDSSNrku1HWx5
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_142942_914589_2400DBC6 
X-CRM114-Status: GOOD (  10.53  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add bindings for a secondary display controller present on certain
Apple laptops.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 .../bindings/display/apple,display-pipe.yaml       | 59 ++++++++++++++++++++++
 .../bindings/display/panel/apple,summit.yaml       | 24 +++++++++
 2 files changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/apple,display-pipe.yaml b/Documentation/devicetree/bindings/display/apple,display-pipe.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bd25ddc6e09dd636c0221c854e594113f6011866
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/apple,display-pipe.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/apple,display-pipe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple pre-DCP display controller.
+
+maintainers:
+  - asahi@lists.linux.dev
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+description: |
+  A secondary display controller used to drive the "touchbar" on certain
+  Apple laptops.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - "apple,t8112-display-pipe"
+        - "apple,t8103-display-pipe"
+      - const: "apple,h7-display-pipe"
+
+  reg:
+    minItems: 3
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: be
+      - const: fe
+      - const: mipi
+
+  power-domains: true
+
+  interrupts:
+    minItems: 2
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: be
+      - const: fe
+
+  iommus: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+additionalProperties: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
diff --git a/Documentation/devicetree/bindings/display/panel/apple,summit.yaml b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..dc281c1f52c1ed07cc2f7f804dcfd2f3b4239d89
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/apple,summit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple "Summit" display panel.
+
+maintainers:
+  - asahi@lists.linux.dev
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+properties:
+  compatible:
+    const: apple,summit
+
+  reg:
+    maxItems: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg

-- 
2.47.0



