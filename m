Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DA0C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 01:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hjmCOU7/uhA2+L6wbt2c30nT+R/zwMCwKB+eVYC894=; b=diqaiHLw5P+Wmb9rMCaJ9/xmwu
	SA8t3Ue+zqLzSXDlw07Qonr/NR5HaCgx+hWo4FZuTD5BILKuwP2+9Xju/Bl4LFwwsbQEC2cBmrZJB
	+q4tvC+xhRWQvPp2XNMiMviEokIImTIvmYvGXxnLDZxYd+mdODMaEBhYddW0Gf3zWW7EEDfFqNK2v
	Q00w5UGekWprFxfp0Eo1/MsB5g5B2cytucAFNwPEvuXRl5wSw0VW5R5XFSh3Av9XRbuZp6k24aTdC
	Jo1LI8J4WowPCmq4iYJ1JrhB/swok1KvhvOLIARU/dQpTG/F3M47JUaujccTf1vugwmSScA4rlAS/
	fbRQCVVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMj9-0000000CpOt-2ecd;
	Fri, 07 Mar 2025 01:42:15 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMKj-0000000CmIu-2Qrf;
	Fri, 07 Mar 2025 01:17:02 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6dcd4f1aaccso21259236d6.2;
        Thu, 06 Mar 2025 17:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741310220; x=1741915020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hjmCOU7/uhA2+L6wbt2c30nT+R/zwMCwKB+eVYC894=;
        b=dgdSpKEpy7vK+DPvn14rG4cORX6Tul0zK+ghPrwgcCGldCmItUf1StQ5iKiZs3Yi3n
         TIT3gEbGhq49MSMpT17sIXwSsWYv/HRBd68c1Dazrv4s+GLAvKBhNXN1r9JfDhc60mvR
         mfk1RMZn11TVV0b0XjSQK5BrKEI2JfHJyZS98s+DlbdD4rRBhwQK/oYCy8zvvrwnMEmi
         Fiaof8a1rYQ1EKpPtbdQaKwJJMxcfbB0ECcbWhhO2rB/UE4pFB7npsimZZ8RYbdS2ZcW
         YXH4QEsGuiNP9/kGXENb4WOmu0AspfHdiNX9O1lhsP+kPUG1U6+tEpC6ZYVO3AucqWPX
         MPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741310220; x=1741915020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hjmCOU7/uhA2+L6wbt2c30nT+R/zwMCwKB+eVYC894=;
        b=Z6xenDMFT5GnL5GXWuKBFoFy6si47b2ehkKKPq9IVgVjZLyVq/252SV7UTbFocasBj
         c7HELJzsEVF2/mVSHg9m4eLb4Kra70AVw3kypkcjgSLfGXKh2Fxr85GFssWCwm1q/Ho/
         0m7lS6gNSoybXDzCQnUujzRQ07irtsVUBUsgzkOeSYgVCltaW4SrisSorha/wSTjuoNp
         VMfjDalu1mBi7aXFZfLrboPdwx71XjwNKyfO5JAOexoN3ZgZJjhL8A2JsitSixHM4+Iv
         xJiWW+m2j7xlrKkeX6vu9vajKs7yrBQMM4CtMS+qgelffjRRzqKpgRat2nYK0kyPalKB
         WQjg==
X-Forwarded-Encrypted: i=1; AJvYcCV7dzP2as+gkrCDoKN4MlE0bbzzY0GLqIEsPDWzVQ94ofryBqd7odN5VzXE+u/q6NsibKy7drlbakvqHUW5Ska2@lists.infradead.org, AJvYcCXxRqrXOJbuPL61SxfhTKzg2/l1FQMhSSo0Q3JTPwI8+O/k3ahRtn9wmxo45q1BV1olzn5/8zdDbOFgWIo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRaEpUaOHm6fV0YqS1Ze4VipBswCQ4bj6EXY/gC/B9e/xDtNX2
	v/XCJPDHRWYX14JmgzHj9elD3VpZ7367B3bnQgcfvakokCDeaW1F
X-Gm-Gg: ASbGnctgALxmXNd8wzqnoWm3CIGRGfRH6dCysFfxAY6KKkTc8wE+0zp0uBtL3AR+/te
	PN/9xBX7FbrwV+yvHUAOJIUd5jbqUb+2Za8Rzhn49hdkxy1NhZ15zSTGa+b4wP31wdig/IPT5Lq
	rlC3atZG+sVI0bjEDyW6dplV32vz8sJeOkpCoZ1G4Q4nyAMB0LjbqsxmksBKBVlZB3ddvT3JmSW
	TJKSKyy5QDeEtDnqthQewYVvmlLvNN2mTed6UYrNxiDElwGdHs5hSfReP84ekKAxATKf50BvEwV
	jNMZSKBXxfOIQbl5j3oc
X-Google-Smtp-Source: AGHT+IGLrdmWP/DPnT7w5ju6tPX8ko4QQGUEjeJXPFNnzgqBis94wAJsjfYZjIZPTsiSqztQL3GYoQ==
X-Received: by 2002:a05:6214:b69:b0:6e4:442c:2888 with SMTP id 6a1803df08f44-6e9006cb8e2mr17002256d6.39.1741310220402;
        Thu, 06 Mar 2025 17:17:00 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4751d96f378sm13978491cf.30.2025.03.06.17.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 17:16:59 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Vladimir Oltean <olteanv@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next v7 1/4] dt-bindings: net: Add support for Sophgo SG2044 dwmac
Date: Fri,  7 Mar 2025 09:16:14 +0800
Message-ID: <20250307011623.440792-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307011623.440792-1-inochiama@gmail.com>
References: <20250307011623.440792-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_171701_619836_2E5A58C2 
X-CRM114-Status: GOOD (  13.91  )
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

The GMAC IP on SG2044 is almost a standard Synopsys DesignWare
MAC (version 5.30a) with some extra clock.

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 126 ++++++++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index c7004eaa8eae..3f0aa46d798e 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -32,6 +32,7 @@ select:
           - snps,dwmac-4.20a
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
+          - snps,dwmac-5.30a
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
@@ -98,8 +99,10 @@ properties:
         - snps,dwmac-4.20a
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
+        - snps,dwmac-5.30a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
+        - sophgo,sg2044-dwmac
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
         - tesla,fsd-ethqos
@@ -632,6 +635,7 @@ allOf:
                 - snps,dwmac-4.20a
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
+                - snps,dwmac-5.30a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
new file mode 100644
index 000000000000..4dd2dc9c678b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2044 DWMAC glue layer
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - sophgo,sg2044-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: sophgo,sg2044-dwmac
+      - const: snps,dwmac-5.30a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: PTP clock
+      - description: TX clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+      - const: tx
+
+  dma-noncoherent: true
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: stmmaceth
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ethernet@30006000 {
+      compatible = "sophgo,sg2044-dwmac", "snps,dwmac-5.30a";
+      reg = <0x30006000 0x4000>;
+      clocks = <&clk 151>, <&clk 152>, <&clk 154>;
+      clock-names = "stmmaceth", "ptp_ref", "tx";
+      interrupt-parent = <&intc>;
+      interrupts = <296 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "macirq";
+      resets = <&rst 30>;
+      reset-names = "stmmaceth";
+      snps,multicast-filter-bins = <0>;
+      snps,perfect-filter-entries = <1>;
+      snps,aal;
+      snps,tso;
+      snps,txpbl = <32>;
+      snps,rxpbl = <32>;
+      snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+      snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+      snps,axi-config = <&gmac0_stmmac_axi_setup>;
+      status = "disabled";
+
+      gmac0_mtl_rx_setup: rx-queues-config {
+        snps,rx-queues-to-use = <8>;
+        snps,rx-sched-wsp;
+        queue0 {};
+        queue1 {};
+        queue2 {};
+        queue3 {};
+        queue4 {};
+        queue5 {};
+        queue6 {};
+        queue7 {};
+      };
+
+      gmac0_mtl_tx_setup: tx-queues-config {
+        snps,tx-queues-to-use = <8>;
+        queue0 {};
+        queue1 {};
+        queue2 {};
+        queue3 {};
+        queue4 {};
+        queue5 {};
+        queue6 {};
+        queue7 {};
+      };
+
+      gmac0_stmmac_axi_setup: stmmac-axi-config {
+        snps,blen = <16 8 4 0 0 0 0>;
+        snps,wr_osr_lmt = <1>;
+        snps,rd_osr_lmt = <2>;
+      };
+    };
-- 
2.48.1


