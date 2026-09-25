Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEEEC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 18:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=; b=hjLvk9a0PulvZIJkNY9ldwfBkh
	psUIZIcVwfmpEU5H+WrfYq7YUZlsvyqmYmxt1YP9PDfl7KJuZ7JfS6OaD3u2+jbFxFPxDk5+XNSXt
	rasC3Yjl4JeM7IhMQ6PK7UztKfFgVDcHhdoEpXccsjS6cYHRls0Khw4vH841yb5rhaM0vuDmD/qy2
	jYDVmEww0K02JwRh4HXPVFOmgw4BBMzG9ZmFwWuP6nDqyz1RkMGaAeOz+nwOYR2OgRM66sYxY1P4m
	0Ss/H/uN2q2NE7tJUAUmK43mUy0hFZ29RcFG4VZ6VEXBmqnyMP9qG7zleoBLQDLvohDefF4gDdtZy
	YhT7urxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAbh-0000000E8Hs-3tDX;
	Fri, 25 Sep 2026 18:25:13 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAbR-0000000E84N-1Bhv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 18:24:58 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ff23af865so8374735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 11:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360696; x=1790965496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=QNDD9QESx5aTJXGo27gKxQ5JWwTwHGt8nQGFUMebDwP+vR/tnj87eOtxg6MO6FxuHi
         8dMb8hpeKKtB4skNSAv44rusBv72ghiXERWDLKTXJYYGlz7Gjgl6gQYSwAXMwGdiH5zJ
         Efta8S6dArI8ZUi/Tq6ZVjrzMuGMn/XOVqDGIG8YBIqCNcfSRDmJ87KaHTuxv79L1Kpq
         9k3WhBbvWhxME2Sh5iXDwcVMCwITl9+he8qCmzJxPwpGAxZ4u4OKuRKXvi3U3B06nCY6
         kIjCU72qeXrsJJiELMG+C5m/PEbqrGmWZKFReoXwWe+8m/l8wwA2Tv0rBcVX//3ptxmk
         Ielg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360696; x=1790965496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=JmF1QSL2vUMbKlrotcpEnLFgAReP1QWdGftOZLOGGcUFuuBBlUROLH21GcZUnFLIE2
         1MHFAp11MWxrD5PFH3CxhAlZRwxhUj2IYp6GytZXqD10+uHMT12FaqzezbNN2G0mtNly
         rnASzUsrCOmixEw2oONldBrFt02+3hjiffz+fczcoq/dRsia79+rtjrl3ilyx9esfLXX
         jCWMvOzBMksF0OaqIcLDkLYk8UrdF3acPaPoks+Yi+aqH/RVkT9gVFY5Mo06VnXW9Hc4
         QoFFNmT18ABDJLmHb0P8uQCI1+AiGGEMM8mW/jYc7c1N1RhMlL3/OUM0fRFjxLqmdDHJ
         hqNA==
X-Forwarded-Encrypted: i=1; AKwUvBwLMFWN+2oQSXj4l4FICHw240qsg9aOofJg6y0jmXy9tfy68H9L9d6bNDZMhy3EqVxumhUROA4ru3OjyF6vVaLS@lists.infradead.org
X-Gm-Message-State: AFuF++kvR3z6t4mTapmWRi1DQxyu6bOw+ROt8jhMRvnK3JlxxwxKFE5h
	v53+oYenxqCKtc7EjX8q0tXH/ONY7TNGOY7qGFnvz5+i9az2wnI7+4WC
X-Gm-Gg: AYBFou1qY3RFo9a09Khm8FHbgQGp6ykfc8shrO//AVx3feBXs1x7vB2zC9kA0GerGoC
	lHWzrwtLr+PJJhIpe40oioJCjlA+53qgas8sLgRyeRgyyg4PXvuId1Tq3TebF8iq3QCuxITMo+m
	IDHlqdVDwW3IWB3JyTElUl8Qu9MmTLdrNf/W0Qn35heNmFXYZUS2zlOxV6ScUcmRXHtkanOYBr1
	0ziIPjQUWmfnJk6ti5NLtlKknaxU5O/zABTZcg/P0UEjkvlROoPpbNfo/aXrzfE1HQje27A3Xu7
	ucvnqs+gXep7MS73n8ZGFwUpZ3K1Kc/dyafhQ8vYmUGsasCUTECo6UMEytuq4xMqlDgmNa7AYlw
	ZhDokR+/8Cks5JCjzk2+Gd2mJKqNt9LlN0MSgjEvHmVKmOnPXqscuxna7J3Wvh3pdOaMHaLkfiz
	g8LHwYYSJMPUfzuXDS1b89NlcMyQ8fVnaBlDG0CtZUpt17L8yiFjsIPDH3KqtRY+smo1OkQh1Rl
	eVWYK9qi5kM+s3nXlydfk111lvBTjd5MJyARwfSQbW9YcK2faUJkTb6fZoVCf9g
X-Received: by 2002:a05:600c:6994:b0:49f:dc71:e609 with SMTP id 5b1f17b1804b1-49fe66e6468mr115600995e9.20.1790360695684;
        Fri, 25 Sep 2026 11:24:55 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm266231245e9.12.2026.09.25.11.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:24:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v23 2/9] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Fri, 25 Sep 2026 20:24:24 +0200
Message-ID: <20260925182435.21207-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925182435.21207-1-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_112457_386184_DC8A418E 
X-CRM114-Status: GOOD (  16.54  )
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

Document support for AN8855 Switch Internal PHY.

Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
PHYs on the MDIO bus.

Each PHY might need to be calibrated to correctly work with the
use of the eFUSE provided by the Switch SoC. This can be enabled by
defining in the PHY node the NVMEM cell properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-phy.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
new file mode 100644
index 000000000000..d2f86116badf
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch Internal PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
+  PHYs on the MDIO bus.
+
+  Each PHY might need to be calibrated to correctly work with the
+  use of the eFUSE provided by the Switch SoC.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ethernet-phy-idc0ff.0410
+  required:
+    - compatible
+
+properties:
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    items:
+      - description: phandle to SoC eFUSE tx_a
+      - description: phandle to SoC eFUSE tx_b
+      - description: phandle to SoC eFUSE tx_c
+      - description: phandle to SoC eFUSE tx_d
+
+  nvmem-cell-names:
+    items:
+      - const: tx_a
+      - const: tx_b
+      - const: tx_c
+      - const: tx_d
+
+required:
+  - compatible
+  - reg
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <1>;
+        };
+
+        ethernet-phy@2 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <2>;
+
+            nvmem-cells = <&shift_sel_port0_tx_a>,
+                          <&shift_sel_port0_tx_b>,
+                          <&shift_sel_port0_tx_c>,
+                          <&shift_sel_port0_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+    };
-- 
2.55.0


