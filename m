Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9DEC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 17:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okDifKvdAt9bOzQUyi7HcNUDD0Vs7iNNXK17iMvuX8c=; b=W/QKNpF4jj7vod3btiAJh/18P1
	f/5ZHW6UtznzxaYDMv7JQUg8Tm/QPD66aIYwmUl6KLTkns3h6TPe/NkIwddGIDiKfGxgEaioXzG9n
	/5BGYHIoB1PbOFIaFQEFe5giNBZtdMXUFkEK8dHcEQ+/g3r6QP3SV6AgbqHXba16gC7Ptjt3NJ8Q7
	vz0Uh8mA0tr63jMEaoxTnzzq89b9CJsUPg7EwUL3iZTYNxzMf8GzwaM3AX7njGCk4ZowZzYH5jKWW
	FUkshMx0NluhGgPoPmdqDXcL+u123bJUVcFay+VL4sbeNAdftgpgn9q13G5JbAcVWLyTiH66g0STN
	mZUP0B2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trKUY-00000000qbF-2bYx;
	Sun, 09 Mar 2025 17:31:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKRK-00000000pow-0C6Z;
	Sun, 09 Mar 2025 17:27:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf257158fso2632615e9.2;
        Sun, 09 Mar 2025 10:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741541268; x=1742146068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okDifKvdAt9bOzQUyi7HcNUDD0Vs7iNNXK17iMvuX8c=;
        b=jUqcgNEbhjMFs9hLmXsHoY4DpYeZOKq+biy61UD/1GpoEtUl4EFkyF+1lqOyQV94C5
         mLodEc+awTCPV0NRd6EupT0fX55bHvbJIyJRPn7bVQARINhhFwpmzZJsMveUd/aOoK0d
         GjCVG2QLe4N0j5d7xl5rDceSfRTrBGqLt1biygGaYiqBHysH92IpkrrJbWPzDVK53Ny9
         +Gcl6kIANQSELvb/V2U7ZZ49O43anaSlhlxgZE1fkV8+C62kWPEvrbWIAoLQs5D9enKH
         eslUuBEj5eNpPwzzXep3loVtLemB4GWS2psW2I8lNJHTADDTitd02VgtTds1Pton4Tsf
         LtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741541268; x=1742146068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okDifKvdAt9bOzQUyi7HcNUDD0Vs7iNNXK17iMvuX8c=;
        b=lOcg3c8vN2AaWfQpYjXTJ1F0LEQs3uJYkFsTf0CvUrFCNcldnbTcR7WhBGeHxhNrgM
         HpNsKxbQgZFZ3O4iFB3bVxPJnwTBDb6wCS11PT4EsIrWrF/1tlHzc/qOdHwmAFyx7WDp
         XeRASHaaV39fWT/yB143SctcsEYFA/vEiAByweWHJRXZICoeHcccqAeCLW9kwrDWzIq7
         eTykS5MVDI1PoxCqpAYUnf2IgVeohmk4y0JHWTPGip3kLuhyn9FZ4PFALRYtNGIo8rXL
         HaCEQwUYFt/i0AjKnHkgk3eIOGr3Mjd+uQr4uCgWbqjpvL+IzkVSOKCmo+XYDpsZDfCj
         boQw==
X-Forwarded-Encrypted: i=1; AJvYcCViUI7Z72gPdUDh2bGx2ePxaYgKzp7bRlw2tQPOy1H/8WIu5E02VwxIsM3GuYqcM9zNezwWlv8w66HyA54DrCVT@lists.infradead.org, AJvYcCWYSUQZGMSfpI6YmuRsTp9UFY0FZ0hh5sAeSm7JSL42Xpha6N+reUy2i+IeZe5EKs8V1WKnIIbBfW6Rca7J9Ik=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrUgOCqv/xMGwubROa4DrOlNcEJYjn/8HRx2VlZRiMKegGoZ05
	wGIwZYGDdcuxlqq6R04+4DyFpLgGcC/zpIPW65to369rumUMm+8e
X-Gm-Gg: ASbGncvFTZLIHBHGMBjHcY4gqQNVBp68awNvTw+AITasi1198pesjdbi4lZIpd2rSlT
	XZqj/Gs/eZSe52R7H65rylL1fnJGzUtmDrhLPqEAwYVWhLrL8AN9e8R+d3EWlhNaS8mGcO2om4c
	Dof8eGtlW9Sr32lC/b5e56U3lAwKE0BpaZq0oT3eJEgTERtKT1umcwiaLyTKnX3Z689jWZXAODR
	cC0/N5S7sOwflB0JtIJFvLY14DjX+dEeEeRviy5ipQVfzeu3ICF9uobTKDiaJfmOEt0T8c50+hq
	dHqZWjbnoSvD2OMzrIwPweGS0SIPFB1sOoB3akaoWTZRuJYP0xkWSmb+2U8eATYLnlHC1iKc1qd
	GcIt380PCugCemA==
X-Google-Smtp-Source: AGHT+IGWlC28v+QZNJ/lgbeulo94q0WWAcwt9VPHBXhNsULzurzzBKih+g2tRLnY8qpeBrgFYYflTg==
X-Received: by 2002:a5d:6d8c:0:b0:38f:3224:65ff with SMTP id ffacd0b85a97d-39132d16d69mr6047613f8f.5.1741541268141;
        Sun, 09 Mar 2025 10:27:48 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bfdfddcsm12564875f8f.35.2025.03.09.10.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:27:47 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v12 01/13] dt-bindings: nvmem: Document support for Airoha AN8855 Switch EFUSE
Date: Sun,  9 Mar 2025 18:26:46 +0100
Message-ID: <20250309172717.9067-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309172717.9067-1-ansuelsmth@gmail.com>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_102750_085820_BCBEEA9B 
X-CRM114-Status: GOOD (  15.89  )
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
 MAINTAINERS                                   |   8 ++
 2 files changed, 131 insertions(+)
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
diff --git a/MAINTAINERS b/MAINTAINERS
index ffbcd072fb14..576fa7eb7b55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -719,6 +719,14 @@ S:	Supported
 F:	fs/aio.c
 F:	include/linux/*aio*.h
 
+AIROHA DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+
 AIROHA ETHERNET DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.48.1


