Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EC8CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nmx16AlzlkksRnHkq3B5FB3VAm7yIRxWMnzYKgN7RuY=; b=OWOsPAxf2VQZ4koyY6q3BZ2SFW
	Pp5eWMW7I3w8s+xeaK+QNkbJgJuJZ5CRXCol4RATIUtEm8N314B4PsOgNzihJEbXJn6v3xgq+NqIP
	hG6uMFUd8hoX7rgjGaF+IY5dpExwE/ryFMLGUdeCnEXXiFvXdJ+hKSoveyhF3GSkwBlaer+t98jNk
	oOPeUz8jC/M8ChBREzWlHpWqxo6bQhxQKwaeeR+qFXsDjn/HAKGZKj1wW/tMzIkM9obZ1smN1CP1r
	xb8CqdThbajEfaSKz8PUeZ5bTCXZwUbF6buI4JnkLtyOS+ZTtETnyL/O+V+fz7i9cZwyQsXxMfgwR
	00DrqVpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsFH-00000004tmE-23Xv;
	Tue, 09 Sep 2025 06:54:27 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvmSh-00000003I0G-2vJg;
	Tue, 09 Sep 2025 00:43:56 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3da9ad0c1f4so3482064f8f.3;
        Mon, 08 Sep 2025 17:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757378634; x=1757983434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nmx16AlzlkksRnHkq3B5FB3VAm7yIRxWMnzYKgN7RuY=;
        b=Mro6M13rVBfw4QbGMhvrfiLzk3fAt2VTn4zbnJO1Op6Tt/4kCkjUj+CPPyN/Un++Mv
         3w/xnzapFcirHv7py3JA0SWN5QjTgBL3uR0ibL6nTLOv24NtRpZbnm0hlTD59OiYIP0w
         cz6gLckqcag3WSYlwOb8VLrxGDLKvMPLHkFw8jGgCw8B5HyJ5ChkjbExsaURXkI39RKO
         Bq6acD+Ydeu8FUN/V1WLM45VgHKtlVqEsNCS2Vvtk4iSvfGZUr6w+omDAOOegemqXBQ2
         jvZTRn0cyf/rsXPuzB1kMFVf2PRBPiZUV2Eu0zz00837OFc7w+XDujyfzF7afLK7vxYW
         uEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757378634; x=1757983434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nmx16AlzlkksRnHkq3B5FB3VAm7yIRxWMnzYKgN7RuY=;
        b=wVmf0i5DbSwtjXPei1NVTvczBSck4mfH6EKggrVvafP0T9ZyNdHAYwkTfhvJIAfRpH
         XQchBhoqIjjwU2+Vk53KcV6z2hibqpYTcImzSXIZevJ+vyKa4AnteEbAn91neTgvtl7V
         dyHsFGtj1gA+/jtZqqz8h3tSvKa6CkPtv9qZ1L8OR5bHTMmUJs2kXPiqr2kVksz6+3WX
         P7GK+B6HmAtb+MVox6874HikxFzKlvJuOWBd7aw5vpfmdkZSO0v5AH3MWZv6TGDRhygG
         H1xMosdQZC9l6Cp2m1DCu+YfyoKPC6U04ItEoyHnIP1HlyZd5wuPDsJ5jbrC6hci5Zvl
         W9hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC22cn+22zNW2cDsbW+kgaozcA+orvaeObUjYopCdjEyD9mnTlDqxDK/+cr8L70L0JnSyrDCt6Hc95saICOeA=@lists.infradead.org, AJvYcCXT3rjcvW05UvvfN2XC0AxwqIGA5fWv2IOKQN/O8voV6NChmyh6kUQVsvKNXEMZuOuNoq8jnxKFWNN6GQsK5aoz@lists.infradead.org
X-Gm-Message-State: AOJu0YzfEIMpJL8ED5fOr8LHQxqlnDegIR2GSgumaLzF8D/f5sHWxQuX
	66MpUzJcoG6J/GqM0owrELtBuJkvj6gkSk0VgeMsrKo2O17QSTICTjZO
X-Gm-Gg: ASbGncuP58WAPZYlOS4sWQhG67wb77R7tKsqMQI+zjC5WkbOdgX9uJoMZSABVc1mrsH
	geIZEOK5PXWULqOgUExnc4FSJjzhBOZLS9XX7ICY0qx4aeTEWninqBBFcYMsd9c3kVWc1bfGnnD
	8g5gBgTAAj8Y0glZf3qaOWAgTtTinULYgHW9SZxfZiWW05TUI0UiMNL7hnySMCTtzGrb0Oh5/ij
	AFNkVp0hfKXWxY4WfRTWWfxWm8V9Ne2hHr2Sy/rh7SGmVeaca3OPqo4+1BMLk4MExO4OsOrtEjj
	H5S+dxp8bcCQnMD21FCrZMQX31DMse/DLYZ7bwKsSaO7Alkt9mYaFdndx7yBe5gqlnAZPj1rZI8
	3NbOUhkDKxQzueoAUEpeAbEP2i29QEq78yO+tYuNFO3ERjdQgP/Yg88/xJVQ1U/ofbcYtcnUIXA
	sqFApYoQ==
X-Google-Smtp-Source: AGHT+IESx0fJHFXRG2Rri2o/ks5Z5D53jIuAyZX9MuOPL7aq0mWvBElDcU1PoycLOVAYKiiF9zyY/A==
X-Received: by 2002:a05:6000:2886:b0:3e2:e079:ab32 with SMTP id ffacd0b85a97d-3e642309dc7mr9103174f8f.7.1757378633838;
        Mon, 08 Sep 2025 17:43:53 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45decf8759esm13526385e9.23.2025.09.08.17.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 17:43:52 -0700 (PDT)
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
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v16 01/10] dt-bindings: nvmem: Document support for Airoha AN8855 Switch EFUSE
Date: Tue,  9 Sep 2025 02:43:32 +0200
Message-ID: <20250909004343.18790-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909004343.18790-1-ansuelsmth@gmail.com>
References: <20250909004343.18790-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_174355_734044_6CF167E7 
X-CRM114-Status: GOOD (  13.62  )
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

Document support for Airoha AN8855 Switch EFUSE used to calibrate
internal PHYs and store additional configuration info.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/nvmem/airoha,an8855-efuse.yaml   | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml b/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
new file mode 100644
index 000000000000..9802d9ea2176
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/airoha,an8855-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch EFUSE
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN8855 EFUSE used to calibrate internal PHYs and store additional
+  configuration info.
+
+$ref: nvmem.yaml#
+
+properties:
+  compatible:
+    const: airoha,an8855-efuse
+
+  '#nvmem-cell-cells':
+    const: 0
+
+required:
+  - compatible
+  - '#nvmem-cell-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    efuse {
+        compatible = "airoha,an8855-efuse";
+
+        #nvmem-cell-cells = <0>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+               reg = <0xc 0x4>;
+            };
+
+            shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                reg = <0x10 0x4>;
+            };
+
+            shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                reg = <0x14 0x4>;
+            };
+
+            shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+               reg = <0x18 0x4>;
+            };
+
+            shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+               reg = <0x1c 0x4>;
+            };
+
+            shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+               reg = <0x20 0x4>;
+            };
+
+            shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+               reg = <0x24 0x4>;
+            };
+
+            shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+               reg = <0x28 0x4>;
+            };
+
+            shift_sel_port2_tx_a: shift-sel-port2-tx-a@2c {
+                reg = <0x2c 0x4>;
+            };
+
+            shift_sel_port2_tx_b: shift-sel-port2-tx-b@30 {
+                reg = <0x30 0x4>;
+            };
+
+            shift_sel_port2_tx_c: shift-sel-port2-tx-c@34 {
+                reg = <0x34 0x4>;
+            };
+
+            shift_sel_port2_tx_d: shift-sel-port2-tx-d@38 {
+                reg = <0x38 0x4>;
+            };
+
+            shift_sel_port3_tx_a: shift-sel-port3-tx-a@4c {
+                reg = <0x4c 0x4>;
+            };
+
+            shift_sel_port3_tx_b: shift-sel-port3-tx-b@50 {
+                reg = <0x50 0x4>;
+            };
+
+            shift_sel_port3_tx_c: shift-sel-port3-tx-c@54 {
+               reg = <0x54 0x4>;
+            };
+
+            shift_sel_port3_tx_d: shift-sel-port3-tx-d@58 {
+               reg = <0x58 0x4>;
+            };
+
+            shift_sel_port4_tx_a: shift-sel-port4-tx-a@5c {
+                reg = <0x5c 0x4>;
+            };
+
+            shift_sel_port4_tx_b: shift-sel-port4-tx-b@60 {
+                reg = <0x60 0x4>;
+            };
+
+            shift_sel_port4_tx_c: shift-sel-port4-tx-c@64 {
+                reg = <0x64 0x4>;
+            };
+
+            shift_sel_port4_tx_d: shift-sel-port4-tx-d@68 {
+                reg = <0x68 0x4>;
+            };
+        };
+    };
-- 
2.51.0


