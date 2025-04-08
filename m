Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE94C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9jOtwj6zr/UlgyzehUvwRXcqVoFIXeaFAL8YGh83i0=; b=TOUGX/enq3XM2P/xTsIUp6eKi7
	duKnkIjUNpbpJovTZU1/K/eJ5Glp9fQe2caze8+4MHpZOGg7Mle29FazVGukPV6s+twDBzMxuT5zV
	BLSYF+woUwsdX1QrlyQ27yw86YjT2r8xtewDobPhJGGzK2PR1hKsabIf73u8A2ufyZ0sEnLAWO2tT
	GksmWU8uJ6yLG8z5JNk/6+/OpRLaaxlmHrHSFm5NeICNHrhnhj+M0qPR+0z89puZr6vYmlkKIWoje
	KwFXuWIcQbgAmbriFRr4GyAeOp2n8m+ueM8NOekuOeuYyDMMSJJMt4OCjMPaQU/vQbjVZ+6U9bGh/
	lr8oVMOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25fM-00000003X4N-0m8t;
	Tue, 08 Apr 2025 09:54:48 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25cs-00000003W2k-2B73;
	Tue, 08 Apr 2025 09:52:15 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39bf44be22fso3555927f8f.0;
        Tue, 08 Apr 2025 02:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744105933; x=1744710733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9jOtwj6zr/UlgyzehUvwRXcqVoFIXeaFAL8YGh83i0=;
        b=RfuMNjOzp77glFYYJc5oZLw+oD/XXiE/+SLUwIiKfZMo+cfDWlc5IGoiuDJ7+9K+qy
         Wi/Sp7B/IsbIE2AyApnqlHm5QtLARz4MVpAmNIsREEm/8iKsMHo45cUE3dCjRYtAeiYG
         B67NYWfx5rAsGlNplqur2YtezPyp8O/CnrqnClv6ojAuAHPZeYj+09q1W8qeRvKEwr27
         00n572sLfZztsYm8GMdTJjJVcqBzGI4+A4dpFysZGG4AZMts6XNNOOcn7of6J6s0Oa2q
         tqX1mQpkgu1eDAbH9YiNo17RsbprrMfYcB592TCuCZ2V03j06xgV1ksxuScgPj2TaA6l
         Ecvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105933; x=1744710733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9jOtwj6zr/UlgyzehUvwRXcqVoFIXeaFAL8YGh83i0=;
        b=vPKgDAKBEe/cTWe7bWYmvEnAv0DRrzlUXEbRUYnDvk2515RGlF0bEDcosLPn1aZzqu
         +yed69MtA6iUOzHtRG/B0ILyFeVAtR12YKTC/03KfR+T3bS/Jq55de/jjAxib3lLxzb5
         kqo7zrS6SKYKsISuYOMckMxORQ2AQ8FdGHelavb7EZLn95qxrrJwUGEqL6+JKLSF4vBL
         TPMDLGJzBReoYUtdipNl8Jg/CGYWWHpJ1qQfEw6GB4DssvktyZm/MVQQ1fE3QhKFjnOh
         YP8NeBQ1+OnyDl5V5ljcWHyUPxB2fzx+KZLo2uCFX9GUgb5BdQgJ5lgfxD2jURhiWKZu
         KlWg==
X-Forwarded-Encrypted: i=1; AJvYcCVRkB3Lg/HHzxEL5lIXEBZeSzrVg46thmY0hf1JEBZAgawvbs3E4qRzhi0vT3Smd2UhjEdWhXprF6rBTg1Vq3Q=@lists.infradead.org, AJvYcCVzS+Lkm7qwtZXf5V50aa2PtAC03eZJOB/g6od2xoIiffOm5N7V2d6IysKdJubPG0ri/VdEXiR0PGUmFnm/c18I@lists.infradead.org
X-Gm-Message-State: AOJu0YzY6RrUEjsV9DoCOvBffGD47Rjc/Hc7eRPU5PWvgWccyMDVCbAS
	Fzt9mN3bhJ4YS6dknPBYxtHMSukmh21VNCKPdpsrPcxaZpNJ1GpV
X-Gm-Gg: ASbGncsF4J9kHdP53DqWU1v1J2WfK/T8usbq5uKT/R6vKAwgDm9NowY/MEanrgpc4+l
	nNb8wZaMk+i/AuH1kRRBpnhamIN8g7/S9V8cLB74SEktYj1mpFvBTCmbACF2hpNRJpJFJYLoY2V
	liZ824/cVUFHEOkEkFuVtOZsPzORFijqyKd9/2l298ESVVZCa5pm8DMl5b6rbEHT6laYZhuxCky
	FHaRSDMMPgOVWUBQ134SmMdMy+f83KC+jgSGdGp4AfFfRyLc7C2zxtRZ0C23cYQh/DbSTuYyBxJ
	29gCmUK60tHi/HxoBbggBrpTAodCn8OIwCtwj1Nal9n1L2LtWp+ATk74F7FJ+AZ27U7DdB7WUUy
	wxCWnZWOHT7/22A==
X-Google-Smtp-Source: AGHT+IFwQXlkEkiv59tTOoBNbBWxAd5ev/Yt4wKxTnHPQXrrp31uVElCwlox+riOCqLgnYPJvB/0CA==
X-Received: by 2002:a05:6000:1862:b0:39c:12ce:1054 with SMTP id ffacd0b85a97d-39d6fc00e59mr9843048f8f.8.1744105932837;
        Tue, 08 Apr 2025 02:52:12 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c3020dacfsm14493310f8f.72.2025.04.08.02.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:52:12 -0700 (PDT)
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v14 01/16] dt-bindings: nvmem: Document support for Airoha AN8855 Switch EFUSE
Date: Tue,  8 Apr 2025 11:51:08 +0200
Message-ID: <20250408095139.51659-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408095139.51659-1-ansuelsmth@gmail.com>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025214_558566_525B666C 
X-CRM114-Status: GOOD (  13.81  )
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
2.48.1


