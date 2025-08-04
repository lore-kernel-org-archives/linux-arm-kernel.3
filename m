Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCBBC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 16:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txCGfkTtBsBSyGuNpD8Xj+5OLa4IbnLzvuc16UnT9Y8=; b=z//+B6fSO6FI6fyzkn3kEC7EGP
	pS0ftjvLcRb4O3ajkenrbB33SBgfygpD5Ta+o3FYBCPL+frPzwb6kM7vrxHu6gLc8hD3XEhF9VKdj
	QPGsKSHn6tu87OT3pkuBIpf/OH1acdk3IxV0+SKJOoT19D6+3epS4S/2yLULlb+Ui+Vg2tx+oKxT+
	Jh+MZ0oQ5OSEh/8dnK3aDhrEiO712B81ZS8dwuVKGIZ2xG3y3gOwLhcsPocdru+zbOrxmm8EHogLG
	jObV5MdtQmEgvxfDw7oK3vJXE/IaEzMdbd+lHFJNGqhFqhYig9xPUb3jmHIn/0A9F0eHp6GHlQ8ss
	4DnIOAaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiy1V-0000000AyWF-3P2e;
	Mon, 04 Aug 2025 16:26:53 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixWw-0000000Atie-2BRS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 15:55:19 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-61557997574so6859224a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 08:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322917; x=1754927717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txCGfkTtBsBSyGuNpD8Xj+5OLa4IbnLzvuc16UnT9Y8=;
        b=I3mbbdptGoFmA25pXotzGuDnaD2v5zNgeawUHRiLQeykDevTdFhv7+jH6SBsn75Orf
         I4go4fV2rmkF04Fao4isgqA06PIdbhVfcazbAkBhQYgtJKscKIQ0xXHKL7oAsThjK7y3
         K1YqIIwI2KUX7KeSJPdmfYnyUwP7Emr4D6eZW3Rc9tbnWdhSAipiSmAF5rO3kjrT59C0
         UKqsnb06IfEvUf5NgInjqRda1jcxxYN9rRC1BoNjmDP9chXXqjTwL3k4DjzviNTFqDPH
         aPg9b6pzrhZrj0dP9aXPph0KVTj3YkwMealMwl4SQiEg7fYtZkKsaL+TRDMV1dChmk0x
         crqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322917; x=1754927717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txCGfkTtBsBSyGuNpD8Xj+5OLa4IbnLzvuc16UnT9Y8=;
        b=fLZkOoujUu+QUFWROjD7biAtlGoGf81EK7vJcu2gnvKZzrFO++mEvRG7gXPauLSsMX
         SxdLIUpsC4Alb8RMtpH/NwlI/tK0nFtJ6pRegrSd0Jwh3zvwOj2z0f39qIwgMVWjkEtf
         1eHghhUxfajPtJXCnQR8Og3mETayAEeeTuGIhNSHTu4qOZGfqyepU09zO224uqmqdIqF
         HkU0vYPSJmCx4NUww+iaxJNdqzYZ2EewRv48X++6o9hujPmUZYEFpRtsaWy8Ke9S8WCs
         CkwC/4CfFRZ4IH8ihWmP7h+US+B44yn+5EsWlOwebFx0wPh4NraKmiiQ3NfsCXx+Y05y
         03jA==
X-Forwarded-Encrypted: i=1; AJvYcCVDi7xg7+q1k4SO1YJ5KLC8vBgDeB2jlHW0swoLzeJbHcHL/dQ1oEdBHGjn4U5Qy7K6sswYNWDPD98vddjc3ZXv@lists.infradead.org
X-Gm-Message-State: AOJu0YxNzqvF9KYGJW393DGmyvYh+lWaOV2mMZhJXD9mWmQ7Zbv79Vlu
	0SHiyppUOlW2q1+eM0osaYuoQq+5fL+itCYnMuwEE3TkrndqzV5Yzi2I
X-Gm-Gg: ASbGncsNKulXhPR9pqK9wc9Ws853fU5zgiJqy4AuR/IJnnMYGWH/05XWGmJ6zybZg1s
	k8z7ESTsiDfwpQIri2UWX7bCBzta4CWit18os+jT5UxTVoUeQem8NTAxcdOxs+Ryq5AErRjRhTT
	ToJa0ObVHfAYeIYSLsTTYHtwOPUUkjl8n0AXtwHBJAKgfryyFLQHB5xuIdhmNyiUjLORgjA2rnY
	j60yKOybqbsPh1oCIBUAYVMr27LIFio0c5X/7AiBksahD8uErxyIE44j3YCwrJ1yCbcJ1Vzg82G
	0yniyXys3MDv+5PkxVgN+t9U/0yepmsT6uCwWUfF4wCKfTCtatk8IC3wTUthlSLdKUrttgxc9YL
	wGq40w7zhVt2sXFuq+oXb5iMDfTjH12o+HeARCGBl3bG4cLNqvA7kfOwPtFA=
X-Google-Smtp-Source: AGHT+IFE9fsToHPB1HzXL7CA2N5HVySncDZwT+zwwfREXgYG8O5U9/e+DlJl3UaSJhFPEZ4jMCwWYA==
X-Received: by 2002:a17:907:9721:b0:af9:3d0a:f392 with SMTP id a640c23a62f3a-af9400202f7mr1152845866b.15.1754322916887;
        Mon, 04 Aug 2025 08:55:16 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a075a74sm761114266b.17.2025.08.04.08.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:55:16 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 3/7] dt-bindings: clock: document 8ULP's SIM LPAV
Date: Mon,  4 Aug 2025 11:54:03 -0400
Message-Id: <20250804155407.285353-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_085518_571960_311757E0 
X-CRM114-Status: GOOD (  14.15  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add documentation for i.MX8ULP's SIM LPAV module.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml  | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml

diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
new file mode 100644
index 000000000000..ef44f50921f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/fsl,imx8ulp-sim-lpav.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8ULP LPAV System Integration Module (SIM)
+
+maintainers:
+  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
+
+description:
+  The i.MX8ULP LPAV subsystem contains a block control module known as
+  SIM LPAV, which offers functionalities such as clock gating or reset
+  line assertion/de-assertion.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,imx8ulp-sim-lpav
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: lpav_bus
+      - const: hifi_core
+      - const: hifi_plat
+
+  '#clock-cells':
+    const: 1
+    description: clock ID
+
+  '#reset-cells':
+    const: 1
+    description: reset ID
+
+  mux-controller:
+    $ref: /schemas/mux/reg-mux.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8ulp-clock.h>
+
+    clock-controller@2da50000 {
+        compatible = "fsl,imx8ulp-sim-lpav", "syscon";
+        reg = <0x2da50000 0x10000>;
+        clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
+                 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
+                 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
+        clock-names = "lpav_bus", "hifi_core", "hifi_plat";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
-- 
2.34.1


