Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30B6C982DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQ2lTEyh9T+AWwJXsBgXvEk8Ip07SEOMmNsBvj/vfkI=; b=JEkSeXM2IXEpeWmEafxCP0Wry5
	u0VBCr0vm8zdOcxyFmbwJxr11CDDv09c7R3WZlZM/HwmncY/FfExCoyGW6BxKOYQpXi3kL9uBITrR
	VAthzglpSsOJG5c2Pd8P/avuMlC4CXH8cjuYGehz+Fd+YA6q4CEAFXaqOXT+GBHH/m8neUX+rVF7a
	rvagVFqluolcLRR9xlPqtvLmHz9052jRSD+U0LgeCbbjPnaBkrCPxQ2ovU6Ga7+j3A5gtVXIYbg/N
	TDkiW5eLqvPMq7eQE4Lk59T/+whlUD0Pp+9vCgX0Gm1QQ/9W9wzwei1p6nD0ujX1UPTVlc6Prez8+
	+2CgBE6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rTx-000000046ht-1GCz;
	Tue, 22 Sep 2026 03:47:49 +0000
Received: from mail-yx2-x0e.google.com ([2607:f8b0:4864:41::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rTn-000000046f4-1987
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:47:41 +0000
Received: by mail-yx2-x0e.google.com with SMTP id 00721157ae682-89666eea29cso27194687b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 20:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790048858; x=1790653658; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YQ2lTEyh9T+AWwJXsBgXvEk8Ip07SEOMmNsBvj/vfkI=;
        b=GD/FUgVIJ+sdzaZ+DyjpKlERI3FZB6EdUYE1nPw+z1zq/XqNMsEAdF8x+JNF6JQgI9
         cddDRe0metND1kpPPO5k52QEv5SpYJsBDfgzuaDJaqeQtjw56SgvSQWD9ac0IyADUV42
         z/rL4CTWlxGyMy5kbjwr9QfWnvK+wzpqMX1ov4t54BCP0ntRzVvhTfA/hbA3qCJNb2XE
         Qfx+OFstJOIMp7VuA/cheyjrqGmEcQBpsrQUdftKEWN6+VF8ADhjaTtJYCEPshnbfGzX
         kXlqFifCOGckoBJ08esfurglSdSn9dXBwd+RVlNWIZ//NI2e5Bqe94Xi219jSUr3PTpC
         136Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048858; x=1790653658;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQ2lTEyh9T+AWwJXsBgXvEk8Ip07SEOMmNsBvj/vfkI=;
        b=pIoR1d58KfSchJM2lHHkFid1/a3e2xFBzZr0CVLG2zrpicUyYe1e2pzozcFnrZw3dR
         IQL7YBoO6b7llxwaLXDG/e474TD3++F0M2vptQjYlyvX6EyHTp4cfVOderOCT9iYgeh0
         Sj+AUZXipQqj+/J7O159DWQ7yZaMr0aFPgXFbXyVJVkVpJzMx5coMidpfKms+5m9XwsN
         rJ73vBEPjeuMz0PQIY7j4OEs1T96BVJEofVMWv40rsNu2hFrmLoCxA53sx1b3nu2mO0N
         x7ItDrXg6O9CjciY54d8A9b3HCk1SfGnLo7OPOcAK/0gs12I7JJ8ysdzhvsIWag9bp8p
         7nZw==
X-Forwarded-Encrypted: i=1; AKwUvBxf6UDwBonDdplf8ZEA+BND5lNoJMSqerM7Sbe7WJNtjTmQcxKoInJRX/Gwk+Wh3/izGoNc/428qBAPDPiSbL2H@lists.infradead.org
X-Gm-Message-State: AFuF++n9iiAsyedAweku8vJo7qVl7smpcsbnQW3WA81buLpk4ULRybyO
	3vdKEI1PeOurkCLoK6HeJ7QN0pYvzId5E3TVyFHwYKunTvX+T8zlykrg
X-Gm-Gg: AYBFou1OX8TtZEjMtY1cKIGh/hxGewttpWpqJRYjDnZLYCMRhGzKxIJtAp21d3LLyZv
	s1VtxlFHiK8E7+8iPT7SqZjVfsOPaWQ9kloxH9+hhiJeDVbdeo6odY7YDIkfjM7d2SgWuWlgYt4
	Ng8JUiP0l6/Woo2Jk8Z7G+bZU0w5fBhnA3q5DWB+XRedn2hP2Pw+IasKzU0aKKDDnecR1TYC+jI
	OA9bVVjOEOC5ZMQ/IRPQMwkU8DZEGnoEYqNPyD3nbM8ni0Eb59mLHUaceJP16+yiaxfZ1vt0NYZ
	ct+JlVZeKuZX02Y8wOPr5FeQPQnk1rsgCUlpTjhPG/CTEcaCkGUW+xtSKKU0EiADfFV0l/jzUtu
	GSyafjG1UvBNPQUSiUbEHN1gFMX3o/SbxUEgyT2UvZZpKaMHD25T+VXm63WjxV82rWbcPZueExw
	kakzgdFlY1ebzEyzHeEd8EdbA7bsPLWC+K1YNPGR1DoApZWn9pMdXKp6/t0/OlwMTIdQ==
X-Received: by 2002:a05:690c:ec7:b0:89c:41f9:b8a5 with SMTP id 00721157ae682-89c41f9beabmr22270597b3.3.1790048857960;
        Mon, 21 Sep 2026 20:47:37 -0700 (PDT)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2bd79e82bsm1822337b3.5.2026.09.21.20.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:47:37 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Tim Michals <tcmichals@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/7] dt-bindings: remoteproc: add allwinner sun55i rproc binding
Date: Mon, 21 Sep 2026 22:47:08 -0500
Message-ID: <20260922034711.190253-5-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922034711.190253-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_204740_300389_20DE2155 
X-CRM114-Status: GOOD (  15.59  )
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

Add Device Tree binding schema for the Allwinner XuanTie E906/E907
RISC-V remote processor found on A523, A527, and T527 SoCs.

The remoteproc node manages the co-processor lifecycle (clocks, resets,
boot vector) and IPC (hardware mailbox). Memory regions are expressed
via reg entries named "cfg", "r_sram", "r_sram1", and "remap".

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../remoteproc/allwinner,sun55i-rproc.yaml    | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml
new file mode 100644
index 000000000000..5d8b929f60b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/allwinner,sun55i-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner XuanTie E906/E907 RISC-V Remoteproc
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+  - Samuel Holland <samuel@sholland.org>
+  - Tim Michals <tcmichals@gmail.com>
+
+description: |
+  The Allwinner T527, A527, and A523 (sun55i) SoCs integrate a T-Head
+  (XuanTie) E906 or E907 RISC-V co-processor alongside the ARM Cortex-A55
+  cluster. The co-processor runs bare-metal firmware loaded and lifecycle-
+  managed by the Linux remoteproc framework.
+
+  The driver controls CCU-integrated clocks (bus, core) and resets
+  (cfg, core), programs the hardware boot-vector register, maps
+  internal SRAM (SRAM_A3) windows, and connects to the Allwinner
+  hardware mailbox (CPUX_MSGBOX) for VirtIO RPMsg IPC.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun55i-a523-rproc
+      - allwinner,sun55i-a527-rproc
+      - allwinner,sun55i-t527-rproc
+
+  reg:
+    minItems: 1
+    maxItems: 4
+    description: |
+      Memory-mapped register regions. The following named regions are
+      supported (all optional except at least one of r_sram or r_sram1):
+        "cfg"    - RISC-V core control and boot-vector registers (0x07130000)
+        "r_sram" - Dedicated MCU SRAM Space 0 (0x07280000 / 0x07200000; 256-512 KB)
+        "r_sram1"- Switchable MCU SRAM Space 1 / SRAMA3_2 (0x072c0000 / 0x07280000; 256-512 KB)
+        "remap"  - Hardware Remap Control Register (offset 0x364)
+
+  reg-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      enum: [cfg, r_sram, r_sram1, remap]
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+    description: |
+      CCU clocks required for co-processor operation. Typical clocks are
+      "parent" (PLL source), "bus" (interconnect gate), "core" (CPU gate),
+      "sram" (SRAM interconnect gate), and "msgbox" (mailbox interconnect gate).
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
+    items:
+      enum: [parent, bus, core, sram, msgbox]
+
+  resets:
+    minItems: 1
+    maxItems: 4
+    description: |
+      CCU reset lines. Typical resets are "cfg" (configuration block),
+      "core" (CPU core), "sram" (SRAM interconnect), and "msgbox" (mailbox interconnect).
+
+  reset-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      enum: [cfg, core, sram, msgbox]
+
+  mboxes:
+    minItems: 2
+    maxItems: 2
+    description:
+      Exactly two mailbox channels from the Allwinner CPUX_MSGBOX controller —
+      one receive channel (RISC-V-to-ARM) and one transmit channel
+      (ARM-to-RISC-V) — used for VirtIO RPMsg kick notifications.
+
+  mbox-names:
+    items:
+      - const: rx
+      - const: tx
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Name of the ELF firmware image to load from /lib/firmware/.
+      Defaults to "riscv-firmware.elf" if not specified.
+
+  memory-region:
+    description:
+      Optional phandle list of reserved memory regions for VirtIO vring
+      buffers or DDR carveouts. Region names "vram" and "dram" are
+      recognized; "trace" selects the RemoteProc trace buffer carveout.
+
+  memory-region-names:
+    description:
+      Names corresponding to the memory-region phandle list entries.
+      Recognized values are "vram", "dram", and "trace".
+
+  interrupts:
+    maxItems: 1
+    description:
+      Optional hardware crash-notification interrupt. When present the
+      driver calls rproc_report_crash() on assertion.
+
+  interrupt-names:
+    items:
+      - const: crash
+
+  status: true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - mboxes
+  - mbox-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun55i-a523-ccu.h>
+    #include <dt-bindings/reset/sun55i-a523-ccu.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    remoteproc@7130000 {
+        compatible = "allwinner,sun55i-a523-rproc";
+        reg = <0x07130000 0x1000>,
+              <0x07280000 0x40000>,
+              <0x072c0000 0x40000>,
+              <0x07010364 0x4>;
+        reg-names = "cfg", "r_sram", "r_sram1", "remap";
+        clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+                 <&mcu_ccu CLK_MCU_RISCV>;
+        clock-names = "bus", "core";
+        resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+                 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>;
+        reset-names = "cfg", "core";
+        mboxes = <&msgbox 0>, <&msgbox 1>;
+        mbox-names = "rx", "tx";
+        firmware-name = "testBasic.elf";
-- 
2.53.0


