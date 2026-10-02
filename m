Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A91CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFiozDtXbElFjY52A4C+mnOyigQ9AyYGm8ni+YdlmxI=; b=BRQfSs5GyARqkZh136xgYR1z+n
	w/XQnr+HBTtwPf6eZHkJgjoGCEAEmxlPoszp9u0rsSUaG2e0mD1hx+SRvUgL1fo0GvMGKtFfUIpH7
	xrRs486HAticmYcZM1u/Y6LuJZCVySVH0tCRwqNQ3J5TtM12Tcv1ZAgPPYrUYH/5q0OR3FoRp9xBc
	GSxl/Xhz7uJAms+zi+aI14UdV8clTFbJQGFC5g9NKcl14G3a45HpuIPqTXACUfEEF2sfaAUgUzmTt
	SC/AOm8dzxCkn2Qjutlr4IfQmfxquVDcm0gBEmLiKqreZyioGeGWgah/VDMjQ9uG8pfwgN29hLxgX
	MI4mxG7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChWC-0000000CEH1-05MW;
	Fri, 02 Oct 2026 17:58:00 +0000
Received: from mail-dy1-x1345.google.com ([2607:f8b0:4864:20::1345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChW8-0000000CEEz-3Bz5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:57:58 +0000
Received: by mail-dy1-x1345.google.com with SMTP id 5a478bee46e88-34ef0362d95so2012789eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 10:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790963875; x=1791568675; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pFiozDtXbElFjY52A4C+mnOyigQ9AyYGm8ni+YdlmxI=;
        b=Jzo2Cjos1mD2WvG8u2m2DKbR4qepaHtU3qhN97Td+VsNLh0LdSDzkjq/3Qo0bBvnOz
         aB/od4hVSFicolqbLiESIdY78x91oyZZeB152ayRxtXq84l80UEZb8w26yhVoa16v08J
         ids8T20Nk6YuXNcq4D0BC08stOal0vAdhpXczCZtzNQ/oh+5/Mx0aA0WAVVSIfJ5ABl9
         d1ZM4J0MiW6+m4iGATSBxDsWwDPOpBQmNCxtPg16PEm03V0mRvpw9SA3PJMN43uae8Lp
         tJuZ0A55EC3JZ7JWBfhL2iGj3jm1Y2Qthh8u+agWnWFddK+ev3J7ut4SqcppXJXCShls
         tBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790963875; x=1791568675;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pFiozDtXbElFjY52A4C+mnOyigQ9AyYGm8ni+YdlmxI=;
        b=b0r+2cUHLOBAcBgx/neloXg3F6yTt9saCk73v05v1L2G0dsTp7Pc4gpXmV7JSOzhng
         2DB4x+NspWLWgEGCg0YKh31IrSWlZqRxAl7/PqfYZ3EhapSre+p6TWXI7ON4sJ8NkKxN
         xuvlgItVtor4dlDuUslxkrwlnhwyKbzyQFpZFw+bPpUn+he97XMokju+2H2RtUzsoxYD
         Tsnka0J/nWpSyoHmuDEaSn1zwO+kVcGsbBZcdI2XTHzfig+/mFhr12KpvsOuorXIjEB8
         X//guKkP72RaleTuz63c/x9PEqdZqU2mrwT+8nWLaAfsFo55y0FkY5lIckrUTK2IqKVu
         wqLg==
X-Forwarded-Encrypted: i=1; AKwUvBxvYmHO2CgnfsRZvqEeyPB3KjjTqIy1bLgwlXVQ86pfVWggO5qqvgK80NEA6edItJgiE/s2fcoxyHHeE3l37p8s@lists.infradead.org
X-Gm-Message-State: AFuF++kz7ABqt89J2A2JKtPY82dw/4UGY4tZapM3AQsBnrXH5XQ4ZvmQ
	j64HQ60mqsXQ0CQvUXW8gzUT3M7PC6fFDrsGrQta9cNu0SUFZDPp9iNNfaGiiY/WL2ianPyU1vV
	I5oCtCr0syQ==
X-Received: from dlbrj21.prod.google.com ([2002:a05:7022:f415:b0:146:40d5:dd5c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b045:20b0:14e:516f:441f
 with SMTP id a92af1059eb24-151c30ed59emr226133c88.20.1790963874830; Fri, 02
 Oct 2026 10:57:54 -0700 (PDT)
Date: Fri,  2 Oct 2026 10:57:34 -0700
In-Reply-To: <20261002175738.3242646-1-irogers@google.com>
Mime-Version: 1.0
References: <20261002175738.3242646-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261002175738.3242646-2-irogers@google.com>
Subject: [PATCH v14 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
From: Ian Rogers <irogers@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
	Kernel Maintenance <kernel-list@raspberrypi.com>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Peter Robinson <pbrobinson@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_105756_796044_013688C3 
X-CRM114-Status: GOOD (  15.53  )
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

Add device tree bindings for the Broadcom Raspberry Pi AXI PMU block
found on BCM2835, BCM2711, and BCM2712 SoCs.

Depending on the SoC and security configuration, these PMUs support
either direct MMIO access for the System monitor or routing via the
Raspberry Pi firmware mailbox IPC for the VideoCore VPU monitor.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
new file mode 100644
index 000000000000..fcffa5fc6c02
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
@@ -0,0 +1,71 @@
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
+  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+
+description: |
+  The Broadcom BCM2835 series (including BCM2711 and BCM2712) features hardware
+  performance monitors on the AXI bus for evaluating memory bandwidth and
+  system traffic. Depending on the SoC architecture, multiple monitors exist.
+  The primary monitor evaluates the System fabric, while the secondary monitor
+  evaluates the VideoCore VPU hardware.
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
+    items:
+      - description: System monitor MMIO surface
+      - description: VPU monitor MMIO surface
+    description: |
+      Memory-mapped I/O resource regions for the AXI PMU endpoints.
+      Typically ordered as System monitor, followed by VPU monitor if directly
+      mapped.
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
+              - brcm,bcm2712-axiperf
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@7e009800 {
+        compatible = "brcm,bcm2835-axiperf";
+        reg = <0x7e009800 0x100>,
+              <0x7ee08000 0x100>;
+    };
+  - |
+    pmu@7c012800 {
+        compatible = "brcm,bcm2712-axiperf";
+        reg = <0x7c012800 0x100>;
+    };
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


