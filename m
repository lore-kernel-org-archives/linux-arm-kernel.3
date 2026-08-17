Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63443C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 08:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=; b=4+GaWoFYUSoX/4B4oQ5eelP5CA
	us71Bce6BvM8TNvUtkRB6N6IX1Z4tOeVzkRtuBM6vvEJUjPcI1leFHzBSgraeApMzlKae/XeEKSh/
	9YmXIO2AO6RBstJfKnhaxCebc+DhGm+8a9aBl9MNsPBvwex2NpQ8YVpmP7tJ/kJLm0UqNB6aEm5II
	+53VqpRJ1I+WAbw+C/cUnlVrg2c0Eu020oDWbl9qY0ylag9MoUYUAYbJC0UBCXEwXBhplNkgJvti5
	PTDO0zR0dEFQdwmHxxuAjTUi5p2GIobkSG7qMXg1RBPC6xd2fMhwU9/ixyOpD0PG+lAQSUTXUtRA2
	dOIXiXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsaV-00000005eWX-1oW3;
	Mon, 17 Aug 2026 08:20:55 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsaO-00000005eOy-25EL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 08:20:49 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so2749518f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 01:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954846; x=1787559646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=eRk8MT87b8Yl6Jc/sAO1ZKexTPvdElosOGEIzuzYRegpLr9Kq2ndHnY2Iopftr9oa+
         NpkspSQIs4FRMxkaSg/dkaLDoeHS8pU7ObKeSY3fbddJDfJxAi7zIFf6FTnsqYQOMlq6
         CAdHOsoMNLLGQWgUyg3V9pfm0u0BV31cBIBwogHq9pY1y+fVazvYpIPGKYokiisZ98Ak
         17mArBtPE0DoKPZR4bu8+nfz7DlTtDYunLyU66ERvZKUKWwlZ+fMUv7b5NTtIvDkgVh1
         1Q2miItxp4Umnmdj5VqfViSUqi8X2S9Uf0he3gnTtFPvkA8637Pki7+WLpd/G54YpNtU
         zP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954846; x=1787559646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=Qcg9mTIBB6c059LA13lWL7bYYFCyZqvAa+hGk4YZu5bre0iSROpwrlog1AttJNM4z/
         I4T8U/c4eherzSTHI32lqu1p3cmxb/Cwt6KcPwgGoujvXQOt1EHcE0rsuonGAkGFE4bI
         9PIFDfA/e6pixdHIU3++LzIFfwot4FfH85QyEDS+Le2BRVTv0/c+O++8qeqw13hF4wlG
         KL5WZwuhyGu85T0wjMwXi6KKSIO9HmggpRqs0UUQ1Wpov06mU6UNtcTlUSEXZXtWPsfL
         JTQeGYLDwqtZC5jjk7YJKQOoVr9jiMx70hMq+MAsTthsTX4lDixsmmitUsheFkY2nigP
         TWJg==
X-Forwarded-Encrypted: i=1; AHgh+Rooy9vZ19gc09VxDvUF0cTanXmOCZXkP1VTfGFCEM5Zg6AQwBEoEb1W1oVwIOkh/ynz7IlEHnIDshpbHU+Dq9ZA@lists.infradead.org
X-Gm-Message-State: AOJu0YxG64ozYsf90buLLYclbAp+nOy6pCEUbNXf2BxytMgXNVdwiEK0
	PSl37gAYyfzFEXHplnQ7nDqO7VDjhPTEacg0x/87UEYjbjxXagzTynmD
X-Gm-Gg: AR+sD13PNYAFyz35qKZpc1RsPbeSF6/AaJW97aZnnCbkByRAp7AG+mj7LRNheT0ZF8X
	9/15hc1+wHg1R7f+xcxZtKM4hei3WDV5MZY8cWxDPnLEU0yzoW6CvIG5py6wFMRn07IO6/iXN43
	BudrYV8Su+F+fIqpx8KWpy+OSjUVFhvpArlvCb8id4Svq1QrLstSA+La2fru5P7Vb0cIodHNAD3
	pps7cjiqu8yOTEIRUitqSJF37f+FqxvUsPZWxp9VVtPFPpWGjP+JKXU0fI8kn4jL5rKCYQf9Qz9
	QyRqJJXJ1jgXQtXYMYENFX2bodfY3ctx0hzGTvHSOUg6uvSYsWUT+fbxsXSVZFfkNSSwk4e9ded
	D42Fc/QzpVnfqiyiV25uJqcXIi6rp1Y8+01RyfryoeyiwHteOSM3FHHJnzB4ogI5AmTVYSLj0zF
	9OJ8WAKdhkIwNwoBePhTxqmw4zFJgTwKd0g42XMnGqyEFzX1gD1UaApJ4W0zD9nghs6CdbuB75w
	wKa1xMCfg5jkFjxDpR8MM6Vj9P5JR5mi7MQ4re5zVUSQ97PHE6C6mF9
X-Received: by 2002:a7b:c5ce:0:b0:499:726c:d658 with SMTP id 5b1f17b1804b1-499879bb9e5mr253882715e9.19.1786954846434;
        Mon, 17 Aug 2026 01:20:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:46 -0700 (PDT)
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
Subject: [PATCH net-next v20 02/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Mon, 17 Aug 2026 10:20:23 +0200
Message-ID: <20260817082034.20326-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082034.20326-1-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_012048_573267_F96C5024 
X-CRM114-Status: GOOD (  16.09  )
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
2.53.0


