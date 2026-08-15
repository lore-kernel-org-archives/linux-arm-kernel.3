Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B60FC5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6KgjyY8PrTJFFkciS7ilG7nrDbtEQyBC0oLhg67UQQ=; b=UhqYJVMNqEqjCm3UZKOfviyIL0
	+pVh5fo7O2Dj3dAJ+0WG5uTCti8j+RPydIcVXnRDD74SujVld58lHb74YFRjLxhI2yhhH6cqKGavj
	J9XxrJR3etsJo1Gm7aIe5L1FKGabrEKxRrHp4x98jLrvg5M0OGH746AoCugBp50zJIemxFnIQaLJA
	iBOoNzkOtr11Wog61PUWlvTxrXomtxmkFkNcw6xzJmiKD1baPOZ2ceJ9eXxtAhFYkJ/9YkdpGOZgZ
	iKuoAPYsnM4BoJXzHSCSrcKqzw36pnG4r5uaGzewPu3G1dCAkLIkcY2jhr1XiaGKE3bTE5r9Ir4o2
	PXpwfPyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv9dd-00000003eyi-3SpH;
	Sat, 15 Aug 2026 08:21:09 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv9dR-00000003etw-02XH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 08:21:01 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cbee8d434b8so1242991a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 01:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786782054; x=1787386854; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q6KgjyY8PrTJFFkciS7ilG7nrDbtEQyBC0oLhg67UQQ=;
        b=SXrTaNdf6LUu1QM2n7zKV5Ebkwi/fjU/DZK7CEjxlAZvVYlFrTyYQzCl42a3uNoJk8
         wflT4Nn0a7RpyjGTozsx+8b54wAo3Ugk7rEaq7ibUrQGxwqeSvP8eD/87IJuhziXKCQo
         NWVBTvwMc6Nkqxjm8BJgwjKFOZItcBASknoScqljHptn4+5+BJ/7aP6K2xXJ+7w6zKSb
         60dT+wBxlbEzHzmm2XBqybUu0JqQ6N+XrL8HORSmN4qqqI0HFTLq2w8ZlDCGG3912L5l
         gON7OtiluPg0yyLaAl6kLaLyQVCn24fZB5npsi1WaOlhmPNDGW+yxS4xwBRR9DHbT5wz
         wEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786782054; x=1787386854;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q6KgjyY8PrTJFFkciS7ilG7nrDbtEQyBC0oLhg67UQQ=;
        b=jBzuhL4wonwHH2cC66FGSaGk2gLM0PE1eZY89n0sZwc/SqJee9HlqrNbtdpBNv6BuE
         5lLBfkiqGUNYtV/8nrJhQnJjpz1FsH4AH+y4JxlXpwlXpEV3Xb9JamNe9x+cm7HXpBZv
         GPeUfX3vdbU8r5UeBj0m8SSSScwBLIksUfkinw6weUBySeQ/rVX/cpHlujwo5a7AcDO1
         RvRuuDDmNTCqqGG01eFs0Un7oU0qJbrMO4g7nwaIKBxDHWqFxklFWHWhtjrfDNew95hb
         YLmJQePjsIYz8IsKyYfbS1L7+QMU1iO/c4ocqg7cjwxu5lp6jfiDawtAkNaEpGAhV+Xu
         Da9g==
X-Gm-Message-State: AOJu0Yx8dtE/SnmJhcZYEzx4NK7g3EnTvA0JGSAlLVfYZ61WhFihNXAq
	abCzm9/MZ8aMgV3mWcQZa09JAZMhJJS96jOqsKmUuBu/LPp6Gt4Syjz3M3xJlEKFvRm9zaA58py
	1HBcURv0ddw==
X-Received: from dlj31.prod.google.com ([2002:a05:7022:51f:b0:13b:848c:abaf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:54c3:b0:387:d9cc:7dc3
 with SMTP id 98e67ed59e1d1-3931f61cca5mr15778918a91.21.1786782053769; Sat, 15
 Aug 2026 01:20:53 -0700 (PDT)
Date: Sat, 15 Aug 2026 01:20:46 -0700
In-Reply-To: <20260815082048.4043217-1-irogers@google.com>
Mime-Version: 1.0
References: <cover.1691900000.git.irogers@google.com> <20260815082048.4043217-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260815082048.4043217-2-irogers@google.com>
Subject: [PATCH v12 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Peter Robinson <pbrobinson@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_012057_075097_23A34697 
X-CRM114-Status: GOOD (  14.88  )
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

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
new file mode 100644
index 000000000000..8f8686f67337
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
@@ -0,0 +1,64 @@
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
+additionalProperties: false
+
+examples:
+  - |
+    pmu@7e00a000 {
+        compatible = "brcm,bcm2835-axiperf";
+        reg = <0x7e00a000 0x100>;
+    };
+  - |
+    pmu@7d620000 {
+        compatible = "brcm,bcm2712-axiperf";
+        reg = <0x7d620000 0x100>,
+              <0x7d630000 0x100>;
+    };
-- 
2.55.0.691.gc56d675ccc-goog


