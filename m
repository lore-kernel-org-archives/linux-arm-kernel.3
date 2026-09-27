Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87383C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 00:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5J3pzpTC8euWZ64R9GaI6gZQCXcNFJ4o9q8CcjL5ik=; b=cMLif6YqLeqRdLvf0teXoSMQxL
	U7gwaTJ5lUP7jCYmuT1Oegxc1YaKvVw1Rt10fUS1MaumFfpN70laWSJlLGVyyh3I7+j7oq4U3LuR6
	LENeNrbNfdbvbNUNcmPluvYzJ6pDK2gMGqL++nyXtcNEw6/mhiqfuLYz3V41KRgRRLsbCLTXwkz4y
	5k5nFA0lCDMXVLbcB+t0tLABCXYMFPkmYx/vjAdF3T74vaYlZLU/VoT4ir8XYIOtXzNcoGtkzg9vA
	DFsuaRIsU9M/+6DJ3X7NNPeCbt7NHVvdsmHcTm83QVS2oALEX7R/48kND+0KboYDUvwGo6/NFfXs1
	tTFt8ecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAcdW-0000000FskA-3Q6e;
	Sun, 27 Sep 2026 00:20:58 +0000
Received: from mail-oo2-x28.google.com ([2607:f8b0:4864:31::28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAcdN-0000000Fshz-3Spq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 00:20:51 +0000
Received: by mail-oo2-x28.google.com with SMTP id 46e09a7af769-81a8d9a166fso420677a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 17:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790468448; x=1791073248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5J3pzpTC8euWZ64R9GaI6gZQCXcNFJ4o9q8CcjL5ik=;
        b=DCmujcu4RCKvhRTBUeGNDRtpYbyT5ATiVFalGgzq4lYPe8/liYQM4erk3rgFIZXcWZ
         192UEKQTLpgsLxwxatBCBVUv5Y4Z6b5sjV5qzY8OVsOt6mMMr3FWbG07Dg+H8d1wq5og
         LrTFIO5qYJzBfs6qmvuFJ5B/K8jpWfTKh1vt7c/zHex4022Ue62uXyYVwZPC2Ty+siVM
         bM3a8o79VY3zboa/afUB5NSYgvi9y+D8CN3XOO6GhK9CwUVLTxM4D0gGibu25Z4yZcDo
         KnZ/1Lgt7fLaQ1i7dnRZMKaJxbH6uru/aylufTbm7oVK2eiMI1+1SuRW3Tc6TwIediOp
         gUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790468448; x=1791073248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5J3pzpTC8euWZ64R9GaI6gZQCXcNFJ4o9q8CcjL5ik=;
        b=BD1j8HSOFwUhgbZSZV3ypbccpNyh3D886rDEX2LSAn/g0dUGdIxcvKwZDVcK9udIIm
         TcJE1supgbAMcgp3Y/viT4WTCWfAYkCbT8c6Z3NLWnYfzK/GRF9mZCyEpkAyHgnODago
         reyiZdbeiIOfIGKjuI3SrB8PY3s3VAOdSc9zSw2tzA3QszngNb0BexeSr6Nqf+dNca20
         V+I0PQuY5XZHlzKY9AraYTiLStQ9gAKQgnwtzHqRnU7D8N58yS1Eop6zjwlEVP3umjZU
         WZ7hGiAj+js9o9wjvZ+6TUQJDWIeG0Y0UWRdp/VsOfdMxIuv9emZNNGvqvUvW8v50J4/
         LU3A==
X-Forwarded-Encrypted: i=1; AKwUvByG1q3hSW5SnJOoNUkeEfpO1L0vD8MgQuyaYLcyJ3bL8UCMU8vdQnED3TM19rOVZcixOPrc1MkxuOwCeDrbScqg@lists.infradead.org
X-Gm-Message-State: AFuF++nCJJPYlYgJWqtBH2TFiHcwQfSHq4qKYPnEnYYCDFkyWnS8dmna
	hHFoQXpLKTrwPGCaapSbhOBuKoSss5+zCWqRoCbMAcVfz6xZm69axfnZ
X-Gm-Gg: AYBFou39OCvhwjhuJlusSazRcYqOfLD1EqGvvl+NxkiUADGLSoV0NZvQ0C4t7B5lGhX
	akjAXL/eqngFB5i5CzZMBzGmUry12Ity0SHDwzLq9/NHXxR5LLBC37Hc/dtFzhrd0k3kfZif3Zp
	eU3hxeff2tjs2ylcrFoqw4pc2xiBElFJSP9RqujJSvIrvyEcgaAHLX8jZ8LfcdTEAEogEr1DjPg
	PIUNB03Oy6a50Gh9r/LrXO8BkbsXvT55sxzejl9/Luqi065PEjFbSf1UWMovuVVhHRc5sLe1urg
	uyzJXeOQ8YOss3onUjcvt3WJxBAneWPChUfx+padApNHzr/zaHqhxPnb5eGsZXfd1+8G+IhNik3
	RYDwSl8BALKAsXdeew2aiv+tqgLplKkdDtMIXcuof+gqBcGewU5PU7qcl9PLB9TT69tNtP5bpS/
	+/bPY2lybj8KqJQIufGju3ClNlmcYi22jAghbzMbUT3rUWRuA23JQovsKQo1K1ZDLQ1S/mly4zm
	M7HmKa0De0wh3m/p0pc+g==
X-Received: by 2002:a05:6820:290e:b0:6d8:6dcf:54c7 with SMTP id 006d021491bc7-6d86dcf582fmr353279eaf.82.1790468448578;
        Sat, 26 Sep 2026 17:20:48 -0700 (PDT)
Received: from tcmichals-5759.lan ([2607:fb91:3584:35a9:66f8:2cb5:aa80:21fd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8828e1ea0sm838989eaf.6.2026.09.26.17.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:20:47 -0700 (PDT)
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
Subject: [PATCH v2 1/7] dt-bindings: mailbox: add Allwinner sun55i msgbox schema
Date: Sat, 26 Sep 2026 19:20:10 -0500
Message-ID: <20260927002021.797069-2-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927002021.797069-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
 <20260927002021.797069-1-tcmichals@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_172049_872236_912E3474 
X-CRM114-Status: GOOD (  14.92  )
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

Add Device Tree binding schema for the Allwinner 4-port hardware
Message Box controller found on sun55i (A523, A527, T527) and
sun60i (A733) SoCs.

The message box connects the ARM Cortex-A55 host cluster to the
HiFi4 Audio DSP, Power Management Unit (CPUS), and XuanTie RISC-V
co-processor across 12 logical channels with 8-entry hardware FIFOs.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../mailbox/allwinner,sun55i-a523-msgbox.yaml | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
new file mode 100644
index 000000000000..6b0c7ff70c9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/allwinner,sun55i-a523-msgbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner sun55i 4-Port Message Box
+
+maintainers:
+  - Tim Michals <tcmichals@gmail.com>
+  - Samuel Holland <samuel@sholland.org>
+
+description:
+  The hardware message box on sun55i (A523, A527, T527) and sun60i (A733)
+  SoCs is a 4-port multi-processor mailbox controller connecting the ARM
+  Cortex-A55 host cluster, HiFi4 Audio DSP, Power Management Unit (CPUS),
+  and XuanTie RISC-V co-processor.
+
+  It features independent 256-byte register banks for each processor port,
+  12 logical channels on the host (4 per remote processor), and 8-entry
+  hardware FIFOs with level interrupts.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun55i-a523-msgbox
+      - allwinner,sun55i-t527-msgbox
+      - allwinner,sun60i-a733-msgbox
+
+  reg:
+    maxItems: 4
+    description:
+      Register banks for each of the four processor ports. Each port has
+      an independent 256-byte register bank.
+
+  reg-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+    description:
+      One interrupt per processor port in port order (arm, dsp, cpus, rv).
+      The ARM host port interrupt is required; remote port interrupts are
+      optional. Use interrupt-names to identify which ports are present when
+      providing a partial list.
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      enum:
+        - arm
+        - dsp
+        - cpus
+        - rv
+
+  '#mbox-cells':
+    const: 1
+    description: "channel number (0-11: 0-3 CPUS, 4-7 DSP, 8-11 RISC-V)"
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - resets
+  - interrupts
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mailbox@3003000 {
+        compatible = "allwinner,sun55i-a523-msgbox";
+        reg = <0x03003000 0x1000>,
+              <0x07094000 0x1000>,
+              <0x07120000 0x1000>,
+              <0x07136000 0x1000>;
+        reg-names = "arm", "dsp", "cpus", "rv";
+        clocks = <&ccu 120>;
+        resets = <&ccu 45>;
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "arm", "dsp", "cpus", "rv";
+        #mbox-cells = <1>;
+    };
-- 
2.43.0


