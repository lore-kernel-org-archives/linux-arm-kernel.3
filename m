Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE8BC5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 17:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bxun1+XcUQPkfOWhYiSaIea5dLp4q6zAXzjsMiENZc=; b=FdmYBK72HB8dyR8LnuwTGbqYvo
	DD32ciKRnSCtTWKqpl5frkiRlJKXteu7kc1gEptDIAM7BEQmeW4ynuzja1RZUPWmEFRX+v3ZzUdS1
	FrHl5kbkeGOYabYRSPL32AXz4bPusZSRCflOXDhLD+BL9QpH1t9fINdLbnZsgQW21laxBHFGm6RdM
	eiwM6RS0Q+oCWA96BYisod9Ft69woHTdzftuzMrR0qw5yQLFJjeVTgkRqyu3jYG8oxKI6yc9Z3e1j
	+87k1ro1sxFtpQ8pIvSMded84ZOruS0TVturm1pzIlM/xtiRQQvJVl826Gfi8zTPEdBE6SlTo8yGM
	Mg2WKQ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvIAa-00000003ypU-1Duu;
	Sat, 15 Aug 2026 17:27:44 +0000
Received: from mail-pj1-x1045.google.com ([2607:f8b0:4864:20::1045])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvIAR-00000003ykk-3eXP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 17:27:38 +0000
Received: by mail-pj1-x1045.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so2300839a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 10:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786814854; x=1787419654; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8bxun1+XcUQPkfOWhYiSaIea5dLp4q6zAXzjsMiENZc=;
        b=eag5zfxzdPBy7iTSwmsfdlVhqvl4hIQC3xZsNMWYr8lMsodLCgRjoLypQhTiu5FFSB
         UvJpoyP77eIX2heaZz+/JkFit3rjt7tH3chdungt5v6NBsIUqzKUmSAiLPEJK2x9WgVZ
         /TW9HMMnUNDW7DcYaTJduwnX3Hc4XjCeP+Zi2dabEtFjpsRfnuyagIHmB62SQS/rAfCG
         ieuO2l9m9wdkXev+WDMOMTwOlaucVup1Osl9RLKVjZ6PTNtxkECmJDs6aCZM4ZeSWOTw
         Q9v0Fnv+SxAdYBqJtL4k97jBD0C7SseBirwNJDlYbFhw7vK+ZbeN5ou5onrrw0XfxhRs
         /YmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786814854; x=1787419654;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bxun1+XcUQPkfOWhYiSaIea5dLp4q6zAXzjsMiENZc=;
        b=oOTiQSLmC7443XPtuKnu7G1pxqOAcmAm0MQ60cPF6zlWfRB3zhGXFiXsqoADfkkwPm
         rrOQHJZEPPm2v4x70YnoEFzGlwQZbRnqc1Vk5Swgcgnltgbcq7+9r05JIZP07+EdX9zm
         QU1S1j9FO/B5RngeQZ2y76pv1jSo3r9PgpuZ1zF9RIr4byoknDO2cHUyRPyfv7B48f4E
         Tk/+AbophyGHQtSLWxyHA1Oeq6ZYk5Rhd0hiYqc28mA2dGJijwqODvG2j009j/NAyA0c
         W732zNgbVHt3S4hQKukVJIrAUfdHVsx/Lc6/gC2Tlriu1P7f6i8svs9y4sapuHnE0yPy
         xXtw==
X-Gm-Message-State: AOJu0YxVxrPKJ2lDWjkiX0oDJj8vrt6vkRrbxqfCkF8X6JvyToo+th6l
	0+8kPwQsJFgiPEej8/Z+nOlvVRT8eUQ2c0STWPq6dJvpu39qlaSQvByXZV/FqskcUtuhKjx+7gu
	LXAMZXS8kig==
X-Received: from dlam8-n2.prod.google.com ([2002:a05:701b:2088:20b0:141:3391:9814])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5884:b0:38f:efed:5445
 with SMTP id 98e67ed59e1d1-3933b7c3b7cmr16272330a91.4.1786814853706; Sat, 15
 Aug 2026 10:27:33 -0700 (PDT)
Date: Sat, 15 Aug 2026 10:27:10 -0700
In-Reply-To: <20260815172712.50119-1-irogers@google.com>
Mime-Version: 1.0
References: <20260815082048.4043217-1-irogers@google.com> <20260815172712.50119-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260815172712.50119-2-irogers@google.com>
Subject: [PATCH v13 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, florian.fainelli@broadcom.com, 
	linux-perf-users@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	pbrobinson@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_102736_944706_48F05A7E 
X-CRM114-Status: GOOD (  14.53  )
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

Add Device Tree bindings for the Broadcom AXI PMU hardware blocks present
in the Raspberry Pi SoC line (BCM2835, BCM2711, BCM2712).

Depending on the SoC and security configuration, these PMUs support either
direct MMIO access or routing via the Raspberry Pi firmware Mailbox IPC.
The bindings support defining 1 or 2 backing MMIO regions natively map
the system and VPU control surfaces.

Assisted-by: Antigravity:gemini-3.6-flash
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
new file mode 100644
index 000000000000..8a4857aa448c
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/brcm,bcm2835-axiperf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835/2711/2712 AXI Performance Monitor
+
+maintainers:
+  - Ian Rogers <irogers@google.com>
+
+description: |
+  The Broadcom BCM2835 series (including BCM2711 and BCM2712) features hardware
+  performance monitors on the AXI bus for evaluating memory bandwidth and
+  system traffic. Depending on the SoC architecture, multiple monitors exist.
+  The primary
+  monitor evaluates the System fabric, while the secondary monitor evaluates the
+  VideoCore VPU hardware.
+
+  Older silicon generally restricts direct MMIO access to the VPU endpoints,
+  requiring them to be accessed over the Raspberry Pi firmware mailbox
+  interface. If the VPU endpoints are memory-mapped, they are supplied as
+  secondary resources.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2835-axiperf
+      - brcm,bcm2711-axiperf
+      - brcm,bcm2712-axiperf
+
+  reg:
+    minItems: 1
+    maxItems: 2
+    description: |
+      Memory-mapped I/O resource regions for the AXI PMU endpoints.
+      Typically ordered as System monitor, followed by VPU monitor if directly
+      mapped.
+
+  firmware:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the Raspberry Pi firmware node. Required on older silicon
+      (BCM2835-BCM2711) where VideoCore VPU endpoints are exclusively accessed
+      via firmware mailbox IPC.
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,bcm2835-axiperf
+              - brcm,bcm2711-axiperf
+    then:
+      required:
+        - firmware
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@7e00a000 {
+        compatible = "brcm,bcm2835-axiperf";
+        reg = <0x7e00a000 0x100>;
+        firmware = <&firmware>;
+    };
+  - |
+    pmu@7d620000 {
+        compatible = "brcm,bcm2712-axiperf";
+        reg = <0x7d620000 0x100>,
+              <0x7d630000 0x100>;
+    };
-- 
2.55.0.691.gc56d675ccc-goog


