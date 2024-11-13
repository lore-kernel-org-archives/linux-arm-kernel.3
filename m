Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41592D41C24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 09:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKRz0Pld2uiaKKmx6wRpgmS9uOUxp2oa94Y6eMdb1I4=; b=OS0DgqGu1iJ2oXQlj04Qt7ZDxq
	bcG3bvykuUK4/QavdgNihLhsy3R+XNNOF4/AHO35jEkoFRdAi7KPPmPNOBKpxHlejr74bjFeRAm4z
	4NwrduaHlgbaWzsmhJSkxW87BLbolGb5uNQeDWDH80zNHNSMgnvvAsu1koTEzCfONnN5IxshHdx1/
	VqKYBp7cH8JmnVA/qkdWlOyOWLHPRbGfU5bfcH2P/cXI0Gx0DE5JxrD3xg8BdjgddTUm9PfiMbzN7
	6MW3f+qAEbj0IAH7NPm0xecMPjSX3IWh+apqK4YPwJGolzUq1Nc1SV70LIkza18FPyte/Xf/qMMQe
	z1Q9xW4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9re-00000006Ggu-3eVJ;
	Wed, 13 Nov 2024 09:40:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9of-00000006G86-1EcR;
	Wed, 13 Nov 2024 09:37:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0CF8AA40207;
	Wed, 13 Nov 2024 09:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB38EC4CED2;
	Wed, 13 Nov 2024 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731490655;
	bh=wPBe1Ne97A1i8ZbAL/kYQUIE50R8f1hyGC9apeCSxRo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZfDuVQjiR8bL6TeUXNRcAfE3GNMeHJBHgKvWEkjNJiaSO1yWlaRB10lQNVHfGArKs
	 mYGfePpDbnrmxKGkLKVb/eC/pHVAvYhyv1x9C4MqLGZJJQIo7W84YAHTgAo08NXRuo
	 so2U90lnVSY4R+KCJNmWNktIrgtT+HJNv4CYFyuCPMYVqEFQo5lstsB5ltPqB3+Cd0
	 mrEi8+gDtKmZFicoy/kUAOxojn3VuyZP7XeW3gFqU8HXwW+rewjCN6XHwe8e5yi6rz
	 A5sR7KmiT+pDhQJlww8AMIhj4vYsfTbXKCUP8HP29ojFjIuiizuVZgCQANJ9Satzt+
	 jos8Ruhf+nJlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75A6D41C26;
	Wed, 13 Nov 2024 09:37:35 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 13 Nov 2024 17:37:28 +0800
Subject: [PATCH v7 1/5] dt-bindings: pinctrl: move gpio-cells and
 gpio-controller property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-a4_pinctrl-v7-1-0546a20c1c22@amlogic.com>
References: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
In-Reply-To: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731490653; l=4395;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=9MmCznmDm9mVPvWwuBcONM77WszO1Q8hkiP9QjVbjvU=;
 b=xxRS3+wJ0rR+qFhpzkDhhya4g7/CA1N/WcYSR/mS22omOlz0acXcjZtfbtSK77kO4ZHM7d3Ja
 RpYQ0TeV9pmD4Z0BDdjeTenVC90AV3MgHr5g110+30+5koqqOmRD3+n
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_013737_517110_2AFBA563 
X-CRM114-Status: UNSURE (   7.85  )
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

Move #gpio-cells and gpio-controller properties from common yaml file
to lower-level yaml files.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml        | 5 +++++
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml    | 5 -----
 .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml           | 5 +++++
 .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml         | 5 +++++
 .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml    | 5 +++++
 .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml     | 5 +++++
 6 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
index d9e0b2c48e84..f841367878a0 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
@@ -38,6 +38,11 @@ patternProperties:
           - const: mux
           - const: gpio
 
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         minItems: 62 # A1
         maxItems: 82 # S4
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
index e707c222a07f..e3765010f6a8 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
@@ -33,11 +33,6 @@ $defs:
     type: object
 
     properties:
-      gpio-controller: true
-
-      "#gpio-cells":
-        const: 2
-
       gpio-ranges:
         maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
index 108719bde0d0..47607ba59237 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
@@ -36,6 +36,11 @@ patternProperties:
           - const: ds
           - const: gpio
 
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         maxItems: 15
 
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
index dc277f2e2edf..adbcda6ce18e 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
@@ -38,6 +38,11 @@ patternProperties:
           - const: mux
           - const: ds
 
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         maxItems: 85
 
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
index add83c676327..15e04f2ef9e8 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
@@ -44,6 +44,11 @@ patternProperties:
           - const: pull
           - const: gpio
 
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         minItems: 11 # GXL
         maxItems: 16 # Meson8
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
index 412bbcc276f3..c63e057cca92 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
@@ -45,6 +45,11 @@ patternProperties:
           - const: pull-enable
           - const: gpio
 
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         minItems: 86 # AXG
         maxItems: 120 # Meson8

-- 
2.37.1



