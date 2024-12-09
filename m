Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE0CE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrfKZP3tJ9WsEejHMZ4V/5fjg5zBVFfkgDQECLE5uKc=; b=1Ya++RvvtNZvtbKlauLOS+t75L
	v+gV+OLtGDlGYErdCkYgA/FRowouC24TASIdBn3H6WFTRX29WfvYPI6kRgdggwCf27Yddg4pIeKT/
	b4WGnzl9zXdeInL8T144rIIYXie1ZY8DxMSJIan0OIsookunKw4y/Ucu2fxm/jdsyBJlSMuLtzAOA
	9Wr0OrsvRbsMXUR8WRxHGTtf15JkZPm7Jv0RWoFv1lhz+DZtZrC1nBWQ+UrMV62aIISCH5848taS1
	uCVDsVLbwasgptu1CuEwP15mIXo71NzfiNxB3YqGdnhtn+EijPPI0yy9Wey6qPw7o4l24Ek1oXJN1
	TgG0xZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKe85-000000084QR-3Kdl;
	Mon, 09 Dec 2024 13:48:53 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKe52-000000083Xh-1Cdl;
	Mon, 09 Dec 2024 13:45:45 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3862f32a33eso1201360f8f.3;
        Mon, 09 Dec 2024 05:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733751942; x=1734356742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UrfKZP3tJ9WsEejHMZ4V/5fjg5zBVFfkgDQECLE5uKc=;
        b=FSuQDtYjOgq4DWTy/EKkzsOTq367CJRDmrzPraZzVGEEGha2evGrOpNtOK2rz23Y5k
         wQZQhL22NOFCfBjwGSWBeZ7bprZe1cHX7d2B1YunqBg7OpXyaBH0lF1w4BCruszVfWDs
         rwJazSC6uOh3OTDeQbSQo93YWjhZcgARP1tdgg5xKfghcO34IVyc9yzKPtBLPFjOPOZG
         90Zi6r8MQjtx4pft4HKomRRJ3ryRQ73FJPNFH2o6Ku9S6oJAFazw0drKpA7mffuT1MuQ
         S1lh4Bq7QNNJBvyhVy+Ot+EWZ2ldjwrGfPRLJh7JgCWUNMRjOfvvdhoBswR+lL1U5ol7
         1DHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733751942; x=1734356742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UrfKZP3tJ9WsEejHMZ4V/5fjg5zBVFfkgDQECLE5uKc=;
        b=uWN9gCLk0/aDu4LTkE3q4mJWsQtlPhuORPgu546yR6gvyteLMQ4aLWSU1kQIT8z4VD
         5WrNVZGWTMzFRe5Uq5+yXYM55pnQNcqAPkXkzuGBkteX7gbETNl8NeTpUkpCc9vwb59b
         3euxhrtnJqjISKIMktKN7yNnHUnf6LJ/nPghwogMzyUh7aWmEUmm/btLdBuJ8fH1fI6+
         IeZxGy99NE3IpMYOXAsRg2OG30zzjqXSFJxL9gudF7usJtma8i09SqswnM5tL5k5GIGn
         K2u1n7E79Mz10+Fd3NQnUtgimjYHm89vZyC1Wn3CEsPl+jd+xZNHb7dBLe/zWoUqAFef
         rgwg==
X-Forwarded-Encrypted: i=1; AJvYcCWgT/f55y8OYhZ49eul+9HWkBbQjKhaafKVZRDlReWnpDYNjtVqfejZsb85sY1McHOjLJQSNwUqArFWpdCFtEB+@lists.infradead.org, AJvYcCXj9C7G+plQBMf/y1l/CgpoaeCcY6HvhpfPV3TvExQmYfBmAowDo28KvXW/rr9lyxg7wxc+2xHxtckdpXN+YcU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFDEVh/Ztexw4pg7lVOEtuNpMzYbIxjc4OHd8kldENXe64Smw7
	hrThihy1DiDSsBh083U0f/wcNIslUm7nJAvWMb6wY+2C0Avkc+og
X-Gm-Gg: ASbGncvwjuih8e+AFtMZeQVQ/fVNqDs6MDMZSY1c+x8+zgWImnTE4bNheGa/Teo4Ec7
	k6ioDsb04GS5f8v+ZY1o0zAMq92TBwc9DNj6CoaJ28XOU77F+BrdWFWYTtv7B/v7Qzg0+GqSJCY
	uzjFRMuJ4dNs7ORrhJu3r8Vz+7bvVCbxqL0sfctAEbPd0hjvOwgPsToiYTmlYD6X2WHrixWAKJy
	fxIaswS24d6cgmSUIkQbnYwIxJdlOsGRtCK3AxptU76DkwucR7mulbj2MYVTXBAwk625712Mf63
	9jOSKPojXd2Z9dZmOcI=
X-Google-Smtp-Source: AGHT+IG1t0zuoMvdGZ8S9jBd3wrS4chupreEkuLilib87ae3Cn8VtV9KroYa6SltKRQXEwSb9kONag==
X-Received: by 2002:a05:6000:178b:b0:385:f821:e97e with SMTP id ffacd0b85a97d-386453d2c19mr375325f8f.9.1733751942262;
        Mon, 09 Dec 2024 05:45:42 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434f30bceadsm62705135e9.41.2024.12.09.05.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 05:45:41 -0800 (PST)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v11 2/9] dt-bindings: net: Document support for Airoha AN8855 Switch Virtual MDIO
Date: Mon,  9 Dec 2024 14:44:19 +0100
Message-ID: <20241209134459.27110-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241209134459.27110-1-ansuelsmth@gmail.com>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_054544_323000_C6F16EAF 
X-CRM114-Status: GOOD (  17.65  )
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

Document support for Airoha AN8855 Virtual MDIO Passtrough. This is needed
as AN8855 require special handling as the same address on the MDIO bus is
shared for both Switch and PHY and special handling for the page
configuration is needed to switch accessing to Switch address space
or PHY.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/net/airoha,an8855-mdio.yaml      | 56 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
new file mode 100644
index 000000000000..3078277bf478
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 MDIO Passtrough
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN8855 Virtual MDIO Passtrough. This is needed as AN8855
+  require special handling as the same address on the MDIO bus is
+  shared for both Switch and PHY and special handling for the page
+  configuration is needed to switch accessing to Switch address space
+  or PHY.
+
+$ref: /schemas/net/mdio.yaml#
+
+properties:
+  compatible:
+    const: airoha,an8855-mdio
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        compatible = "airoha,an8855-mdio";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        internal_phy1: phy@1 {
+            reg = <1>;
+        };
+
+        internal_phy2: phy@2 {
+            reg = <2>;
+        };
+
+        internal_phy3: phy@3 {
+            reg = <3>;
+        };
+
+        internal_phy4: phy@4 {
+            reg = <4>;
+        };
+
+        internal_phy5: phy@5 {
+            reg = <5>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 53ef66eef473..e3569fe5f3de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -717,6 +717,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
 F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
 
 AIROHA ETHERNET DRIVER
-- 
2.45.2


