Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7B0D41C10
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 07:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUE3vY12//KoqnCyYFqqMApx4MUHBsgCUz0S079pBco=; b=MSQmuD9QlxDmunB5cYSaGZ3v0G
	LXANVds4Kwmh6mrEwO4XUrWP797ToLrQeOLZjmaVGu5HtP+Jl93cRS0o1fjYe3uFtWYNszR/LXs9f
	27KyBAemkdef5Pzrani8SaUoEDpsjDrOCqLQ90su9YImGzroSWVSIVtkcGkF+/0ACb3CphZyD/ggB
	3YdCosc8MnYRInONc5WML+RJDE1CZ4ucIKaYZj92Zm6yVvQ/yhcARYcCQ5rbmGCvvzJiCvgVkv4l1
	LIAzqn1BmOqSUcBAji16xsYWY+i0EMO2i5pgYZaKGWny3dFcGyVHEtGylL97PhNun4Qgvqh55kmEt
	V6q4dYlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB7qi-000000060Ch-3zl9;
	Wed, 13 Nov 2024 07:31:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB7ot-00000005zqa-15y4;
	Wed, 13 Nov 2024 07:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2EF665C580B;
	Wed, 13 Nov 2024 07:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 081BFC4CED2;
	Wed, 13 Nov 2024 07:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731482982;
	bh=hX6rPlW3FmfJmTlPxWCoeB0Q5Nhrn5b2VcTq6dcYeYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cldbD1UHcA8BST3d09yvK6wvZSWygFBoyewWD7nrk2NH0zuOMlqltmbcmStQFu6Lt
	 KxFFG+XeCqaDnna5xqS91X/qCc/2ZDwPpyi0VrR8U3B2CCVVOuh7srvF2g/y9oAgnj
	 Wgc0M3/PVrsQIWcUWP85R7Wieb3BWMfKOBiokvZ8df7ojntdX2Ni3GM3uYjVqF9ia6
	 RY+J4kwltgkxlb+VjGmEKMDAU8lX09tVydV/l2Wm1G9bET3HDq3KaJ+VmfdxAjVL9K
	 ujm+fITNydw+hwdcG40gTVNbbp4dHjVUSMxVz1TtoinuF3CY2Qw5e+tLIxzYFiHiEE
	 idVzXkW4LURkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0FED41C0F;
	Wed, 13 Nov 2024 07:29:41 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 13 Nov 2024 15:29:39 +0800
Subject: [PATCH v6 1/5] dt-bindings: pinctrl: move gpio-cells property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-a4_pinctrl-v6-1-35ba2401ee35@amlogic.com>
References: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
In-Reply-To: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731482979; l=4180;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=qxv4emgVPROFoR8ScbTFnmLM8WUD+O9zBXHAgvRPWts=;
 b=95hEgHD2NGZC5TRpIpdAB5GLXogZK1SArEDVX3xOOhfXvQZ+cNZ1IdEhmVMaTg6NVSRGmO8Jm
 YjpMd9laA+BCcR3N+yBpSLxoX/hUTOD9CRhKxluoiNbUpiUDsh4EBDE
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_232943_439188_3392D3F2 
X-CRM114-Status: UNSURE (   8.52  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Move #gpio-cells property from common yaml file
to lower-level yaml files.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml          | 3 +++
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml      | 3 ---
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml  | 3 +++
 .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml           | 3 +++
 .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml      | 3 +++
 .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml       | 3 +++
 6 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
index d9e0b2c48e84..a43d6d2a336d 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
@@ -38,6 +38,9 @@ patternProperties:
           - const: mux
           - const: gpio
 
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         minItems: 62 # A1
         maxItems: 82 # S4
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
index e707c222a07f..7b2d129845f1 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
@@ -35,9 +35,6 @@ $defs:
     properties:
       gpio-controller: true
 
-      "#gpio-cells":
-        const: 2
-
       gpio-ranges:
         maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
index 108719bde0d0..9488bb7c8da3 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
@@ -36,6 +36,9 @@ patternProperties:
           - const: ds
           - const: gpio
 
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         maxItems: 15
 
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
index dc277f2e2edf..b6f72b2c3d38 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
@@ -38,6 +38,9 @@ patternProperties:
           - const: mux
           - const: ds
 
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         maxItems: 85
 
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
index add83c676327..1315e6203f44 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
@@ -44,6 +44,9 @@ patternProperties:
           - const: pull
           - const: gpio
 
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         minItems: 11 # GXL
         maxItems: 16 # Meson8
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
index 412bbcc276f3..07fc77403c6f 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
@@ -45,6 +45,9 @@ patternProperties:
           - const: pull-enable
           - const: gpio
 
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         minItems: 86 # AXG
         maxItems: 120 # Meson8

-- 
2.37.1



