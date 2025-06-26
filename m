Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD82C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vw4EzE0K5e4aknCIY0FtGD//kTDf6e/8GmBlZiK8kXM=; b=o9AszfF9+D4a0UL4ttW4C+kqdE
	ZYyeOwFctruNZqXw5iNuItXjmFgH62RCmxDkhL96ojV/x38AdqNSVBAxsiDqSfnGiKYGFQSb/R9gM
	XDAslSSuwP4TsaK14sqI3p0IgBEP8fAD7yd0xJCc4LvepUHQusFG2Nf6o2fHWHVJePMeEMX5pgijQ
	sHdYnWHn3a600GODoWwAfuzP1pVFQz1xSw+gc4m1mrOsg+Qq6Xj98xlr5Yf4W2GgsMM9o6ahVF/er
	jyiMYCQfII7ij4BcC4v4rbXATKHBO9+DBndUK23lctov3QpjQtwvktwHzefidttqODE6qEmF/e2jE
	PO+4w3Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvse-0000000D2d5-3Hqt;
	Thu, 26 Jun 2025 23:19:44 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUu4a-0000000Cp6S-32zU;
	Thu, 26 Jun 2025 21:23:58 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso1584340f8f.1;
        Thu, 26 Jun 2025 14:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750973035; x=1751577835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vw4EzE0K5e4aknCIY0FtGD//kTDf6e/8GmBlZiK8kXM=;
        b=UuZ7IV5wxDZR8/WIaVSi1TwNioJ7XSmNlSbvnjoTPuzQGYoIhC4uu5mG51fTxKOtgM
         OU0A7Csi6mJKWZ65j/cqX9yQONm6SM5N5xznTqo8LQrjc2Hq6eC1M4KH1PzuXXXFTe6o
         9g2W/ZkNqlNBqaC61Bg6uQ0MJAb14tpA+VP3cT7mdlcKNAWmzzp1HksnQlR/tUXQfFjI
         a7DwK9RAyiFqGRwiFKd8+bP4Qh7PEf0tzjyT2JRMuuI1qtbsxBN0s5r7Nqs9/smH2QTo
         TpRvmluwneN5zQXcAjNRBBl+zXGxnC+kAiVw8Ikpf6aPTMJeVwATkKQvzrfDfDpamKva
         pTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750973035; x=1751577835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vw4EzE0K5e4aknCIY0FtGD//kTDf6e/8GmBlZiK8kXM=;
        b=bnqB4C/i9z1i2bVRZfEB5AEcpfZ3H2dQBKRw1vkP7eldNuR6Vo9vnLOECd9HCHFK4Z
         BhyDtGazac7hQ9SiV5BjWUNjVWX9RLDunq4QZC0vGHojoxjucT30y/XDhS4jvmHohlMk
         ECl/l/fgyN7LF+nb6k1+Ly3ERBIOOgFQcR+8c2Ch2rvPXFN5YVwnetrRRgRaqOpSyCaY
         W12t1/Q1BKOv7TaxIFkvUfe1SH+3WoeJdRu0Rr+tg7PW69XHhKFzCia08eDOB0yxExQ1
         CiIAx1FKdYwpqELjk7DwiwyJi/ML/krFEFEwI8CEOxkfpsG+wBhJWFu+VQJbXxZsErgd
         UvrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqT7IVP6IPSoApgE7XJPD6ax5Fx4vnqQaiHcymx+rIrXzlizjjimS2Qj6/xVlB63zMUDy78+SmYTduKzdhaL4=@lists.infradead.org, AJvYcCWBuD5jekxFDqXz5zB5MPJ3S3SxpKARZmbTQgPSpjhbpmH2s+TiXja3LMKCjiAvFvAeVPkhPerIg6WrFXPbbbmc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx454qCtU5RXxhI1BURsNltgNKbKyuRQp4knr4suonXa3dlxu+2
	x59/04mw+v+goMthYtDRjIATiHoVT/PVOVihA6ab5axFlMTTaJoiQsav
X-Gm-Gg: ASbGncs0Ijkv8nFJ1w/mFTO8N7yUWpOAFD6Cxb4Za7pPzJajot7tvKipRyYZEKDaxW7
	xf78iqz7i0L03JkFW6lS+V0XeEX7hkb68+qjEkHM2KbVzAOAEArqQDbCVzlYa/2LspvpXiCARho
	ftB6B69M2W3sOHlpUK2z3XWpNaaWpgpKyjRwP/dI0xTwe5g8yq7bl9z7+Z2hppMhLLUEssWWtx4
	T6g5708q/1BYMnUZAGWkfrMPO/ptXMwot5mE62Yl2N6hpi7vKF997ztN/JPrsMVSXFJmRpT96ME
	++SHJ6qx6VTnnJg28ohJaZSjA6Ku81QuCy/BFJ0847AQoL9Xp9quDNq74TzJiVoqr1di1OWH4K8
	KxkrkRqLfol4Uz1yMQS9YjIFx05rBGeA=
X-Google-Smtp-Source: AGHT+IEe89a+1iGAR9o9V05xb+6jRk123zgYHX1NtDrWeh9wpQgDj975ljb14+WFNdYJILRtLM0UQA==
X-Received: by 2002:adf:b64c:0:b0:3a5:39e9:7997 with SMTP id ffacd0b85a97d-3a8fdeff435mr620062f8f.34.1750973034929;
        Thu, 26 Jun 2025 14:23:54 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453835798acsm57186475e9.10.2025.06.26.14.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:23:54 -0700 (PDT)
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
Subject: [net-next PATCH v15 02/12] dt-bindings: net: Document support for Airoha AN8855 Switch PBUS MDIO
Date: Thu, 26 Jun 2025 23:23:01 +0200
Message-ID: <20250626212321.28114-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250626212321.28114-1-ansuelsmth@gmail.com>
References: <20250626212321.28114-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_142356_768439_85B5396A 
X-CRM114-Status: GOOD (  14.40  )
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

Document support for Airoha AN8855 PBUS MDIO. Airoha AN8855 Switch
expose a way to access internal PHYs via Switch register.
This is named internally PBUS and does the function of an MDIO bus
for the internal PHYs.

It does support a maximum of 5 PHYs (matching the number of port
the Switch support)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/net/airoha,an8855-mdio.yaml      | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
new file mode 100644
index 000000000000..c873103d2b66
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 PBUS MDIO
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN8855 Switch expose a way to access internal PHYs via
+  Switch register. This is named internally PBUS and does the function
+  of an MDIO bus for the internal PHYs.
+
+  It does support a maximum of 5 PHYs (matching the number of port
+  the Switch support)
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
-- 
2.48.1


