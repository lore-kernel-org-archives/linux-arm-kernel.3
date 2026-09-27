Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABEBC98328
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 00:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7YAaa+JluQRvW+ay+L84vEKLXHaoKpKPtPkeIjCvyE=; b=QHAVCzD4ovke+2fTCHYEGn+/AR
	aRgSL1NUPIECY+vuLpI1cdoIK56IQ9kdCWWHYzgXB6EQb+V356zdJVNGysji0LCX0LH/okC3d2MDh
	WcKfAQeF4gMZAkBDmOU3WAU/9ySppa8KuMHYd3cdwpVbJYoWk7W4CVto3QXAmNl/s1VtJqP/25ubK
	QuEOattafP0SZOQ6R6fNBtLSQeBg95PakD6oRUnC1uFWg/qv1KYQnr2aa1xV6KE/GfAYBLlofG/dZ
	NMxHgl8sZsQF1/DA6px5c6/2iZFXo1cO6ND6F5g061wgJNsBbzL09Zljfzb2tSrU1lv7pT9fF48xb
	HWTG22+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAcdt-0000000FstU-274v;
	Sun, 27 Sep 2026 00:21:21 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAcdV-0000000Fsjn-3lL2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 00:20:59 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 46e09a7af769-81b46bc1282so128149a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 17:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790468457; x=1791073257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7YAaa+JluQRvW+ay+L84vEKLXHaoKpKPtPkeIjCvyE=;
        b=TmpSqxwR97++fOZlRlAVCKfhKkDNAWMhpSN2RwqZ0rR3hnmatddr+rqQFLhq9AK0G1
         2NkNkOiR7hmSzd2YKkWPmgUtL3S1PJtDUIgIgc1xXc+c7k8PRdhNdd4lR6GG/yYisMjq
         GAvp5MtX89P3sKQkK5/f7ZOSielpNc24YvCzaWqSC0sVAZVD06l1sQdcsL0byGFdVrFX
         V7hF2247qOODzcnCSZuouFkBMQawBS1Ta7cT41tMm9+9nTXp1dBwoYR7pgmdPZou6Np6
         H7rbe2JFHgzQP+l6pMHxOkAQ0nn/YVv1VWhZK1R5crk7eSNS48iuRsgbAcGERGf/wn5f
         LciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790468457; x=1791073257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F7YAaa+JluQRvW+ay+L84vEKLXHaoKpKPtPkeIjCvyE=;
        b=pvsyaAw+/kcWOBhF5+ay1Pl/ljxxRpv1YNH8hEhjbM4Ug/YpHRjIYYfUKscB9QgKdS
         ozmYVjdjSs/83m6D1dJVj0TfaoxZzu+urpCRj1mS8ty5yqZs/iDJoTcvuwhnUH/kgCw5
         3KzVjrYs4dZkxm4b2Z7vqQjnzOqNP88z85s2bIe22GEkS5vvymi69baBReqag3ghFSgL
         FI8XkQSNC9OF/HTTGCm6Xa4/tAPvUIxr9huc85/W+QYvMmse+TgmFIRMstNA4lqzJbIH
         EazGg+syU0noxKP+aV0A8QJ+K3xIy6LFAXd+TvtO/DvFEBtrd1jOwRxam5Z2a+isKhJb
         ZvBg==
X-Forwarded-Encrypted: i=1; AKwUvByiidvxoKvLEHygyFyfnYM39K8t2nFr6li+Vj8+PGXkYqvRbQn7Iz8VwVk41t3tjrUAo31GsXKd7Iq1dG+opf+i@lists.infradead.org
X-Gm-Message-State: AFuF++l0bEr35kOK3G+rfOS9mwqil1Q5yCfLJgM6pPDftxlZ5rjeShCz
	1glelbJ3CD2mnP44kP7EhvNd+CB0Gfn8hESXyv3MVyS5qOYUMS7fXpSh
X-Gm-Gg: AYBFou0kZUKy4Qe/coZcUL8nqEWlqGWCkSg2PRftreS4WvWq2WJf1/SSNqtoaLN7hgw
	Ki5sosgcGPyrvY4BZSMvsPNwk4d+oxlt97oFZFs/+g7q65V6wgtMEut2uY/X5421zBT+JvMkcsH
	AbKT5dGQR1MhG7WMpvtuXdEVaN8F9y7r+7MfOGk6tSVdutqu0gQmFxcZp0dejOSwj752XVn+RbA
	JOjG4JfppSv/AlUMwSQUKw2Dd2eBNxwNvH1gqtBJim4zJs113TrD1WZoyPEjsP8Iw3w7ug8fLLm
	0BWerhfnaEUW0XwXam2worJAZAh/YoI9Wm5DmEUvvtaKjFbYVBYIlpo7VC9wwd0J1+WFBUy53Q5
	iVb2jUsyQ/+bvE4DZZtTlN+Z2q/8exxeQQFTxE+nsl8OAGJMUoibUo916cituUIiJfasoT1r/xu
	DbUdmsZ3zDFckGgaKDveG6NBvc8HLjqkuTeCPfYRQPAzWLF3rNe//fKHsCBWA5lmSlztFgm9Mil
	b7R8Kxs++uorzB3xwLlhg==
X-Received: by 2002:a05:6820:1c8e:b0:6cd:3ffc:64cb with SMTP id 006d021491bc7-6d5baa47035mr5699972eaf.70.1790468456774;
        Sat, 26 Sep 2026 17:20:56 -0700 (PDT)
Received: from tcmichals-5759.lan ([2607:fb91:3584:35a9:66f8:2cb5:aa80:21fd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8828e1ea0sm838989eaf.6.2026.09.26.17.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:20:56 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	jassisinghbrar@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v2 4/7] dt-bindings: remoteproc: add Allwinner sun55i-rproc schema
Date: Sat, 26 Sep 2026 19:20:13 -0500
Message-ID: <20260927002021.797069-5-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927002021.797069-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
 <20260927002021.797069-1-tcmichals@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_172057_950089_A2EF6C06 
X-CRM114-Status: GOOD (  15.05  )
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

Add Device Tree binding schema for the Allwinner XuanTie E907 RISC-V
remote processor subsystem integrated into Allwinner A523, A527, and
T527 (sun55i) SoCs.

The binding defines the memory resources (configuration registers,
SRAM Space 0, SRAM Space 1, and optional remap controller), clocks,
resets, reserved memory regions, and hardware mailbox channels.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../remoteproc/allwinner,sun55i-rproc.yaml    | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml
new file mode 100644
index 000000000000..53e3f4faaa76
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml
@@ -0,0 +1,146 @@
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
+description:
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
+    const: allwinner,sun55i-a523-rproc
+
+  reg:
+    minItems: 1
+    maxItems: 4
+    description:
+      Memory-mapped register regions. The following named regions are
+      supported (all optional except at least one of r_sram or r_sram1) -
+      "cfg" for RISC-V core control and boot-vector registers,
+      "r_sram" for dedicated MCU SRAM Space 0,
+      "r_sram1" for switchable MCU SRAM Space 1,
+      "remap" for the hardware remap control register.
+
+  reg-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      enum:
+        - cfg
+        - r_sram
+        - r_sram1
+        - remap
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: bus
+      - const: core
+      - const: sram
+      - const: msgbox
+      - const: parent
+
+  resets:
+    minItems: 1
+    maxItems: 4
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: cfg
+      - const: core
+      - const: sram
+      - const: msgbox
+
+  mboxes:
+    maxItems: 2
+    description:
+      Exactly two mailbox channels from the Allwinner CPUX_MSGBOX controller,
+      one receive channel (RISC-V-to-ARM) and one transmit channel
+      (ARM-to-RISC-V), used for VirtIO RPMsg kick notifications.
+
+  mbox-names:
+    items:
+      - const: rx
+      - const: tx
+
+  firmware-name:
+    maxItems: 1
+    description:
+      Name of the ELF firmware image to load from /lib/firmware/.
+      Defaults to "riscv-firmware.elf" if not specified.
+
+  memory-region:
+    minItems: 1
+    items:
+      - description: VirtIO vring buffer region (DDR carveout)
+      - description: DRAM firmware execution carveout
+      - description: RemoteProc trace buffer carveout
+
+  memory-region-names:
+    minItems: 1
+    items:
+      - const: vram
+      - const: dram
+      - const: trace
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
+    remoteproc@7130000 {
+        compatible = "allwinner,sun55i-a523-rproc";
+        reg = <0x07130000 0x1000>,
+              <0x07280000 0x40000>,
+              <0x072c0000 0x40000>,
+              <0x07010364 0x4>;
+        reg-names = "cfg", "r_sram", "r_sram1", "remap";
+        clocks = <&mcu_ccu 3>, <&mcu_ccu 4>;
+        clock-names = "bus", "core";
+        resets = <&mcu_ccu 0>, <&mcu_ccu 1>;
+        reset-names = "cfg", "core";
+        mboxes = <&msgbox 8>, <&msgbox 9>;
+        mbox-names = "rx", "tx";
+        firmware-name = "riscv-firmware.elf";
+    };
-- 
2.43.0


