Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD802CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7VKM0kGySt6jsEqGEdmnsrJTxTzNoBKKYUnpSNyRaA=; b=oGgMMtN4CGveuTVPyS7WfBCM9I
	c2m3Pl3SCM/3sqHfmkXdFWEyfEwvNjlCil28FN3pIUUGq+QGE6qd+YlqcS8QftPvYF2QrQ3/aqXGF
	zb21J0TuixIKaSUBza+DEcYEKDa58fSWmsMEkMN2bd98qZwZ/LaHQw0cnHrAjroMtB2jUUWxBHYT9
	ymBht4eZZsECwNPLCbRGHhqxBOxUhyl8lFnxtqOosgAATjn9Sd68w91WLfLvXFzSU6FcOpD9LqiQK
	Xah8GFdfxga17le8ck4N3O2lpyHvjCvL+N7XvNadQt3oQHmM1hmqKzobDwDruivmgm28w3ZCEY/a+
	2ZPFVUAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtLO-0000000Ek04-3sD1;
	Wed, 14 Oct 2026 07:24:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKV-0000000EjNo-41FI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:23:17 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48b060ec084so2417610f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962594; x=1792567394; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E7VKM0kGySt6jsEqGEdmnsrJTxTzNoBKKYUnpSNyRaA=;
        b=ho3sf2pS4v8pphVlyl2f9oCsn29WmZH7/bRGykgWnwSj0H/2RXCEoHXYiAFYlYYphV
         jcnZuwojnwlUaOP3Db2bxPKFlcLRkuOpMPNa6dcgh6Tz4cC2P8nMPzb++Sv/Q9OQsmVF
         6HT+Ib9TocU7ZBiY7QEYkUsd9axVlvO0j3DIBDmiVOBNj39LwwjgDwukPdvfPmOqY3yu
         6PZMh183QE1OFl3kZ7nBY1VECMbLQAKvyTqEPVshIyFm/TmfbEfWVD22SbGPZcef0LFi
         ZBBTZ6RyCtC9Cb7eYrs/5ahqSCV4wM0MRC2iOG3cbEcZc2bjoB234qA3B2idTIcCSvXt
         ZU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962594; x=1792567394;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7VKM0kGySt6jsEqGEdmnsrJTxTzNoBKKYUnpSNyRaA=;
        b=Ezfn8forKHJMMPAx05hCwtw8F4owzPvVmyamqQNX+Vvjk4qBkH91a/3BnPyMB5PiPW
         xDfKteVmLdckMc5XGF+UByipQEUDJ9PQAy4lG6qwkH2ArXCfHXTpsT+V/jn5vYpBTYAS
         rDML4Ym7r9NyzbvV0Wa4h07ihjpUECgYQb1JjC95L4i5cpKOPc+fC8ef0Xheixl5eTrD
         qVlKdWr8i7Wq6CTLSH9UmcegwZtzdW8MAJACuC6VF3ko87w1p7wSMlUtJVJVbdE1CjHR
         xcG/DP73+HDY6pmzy2zOztQJGOE6c+CInfNwZwhLivmXg8WV9/nCWRiH2j3M/ZW8kQTr
         nJRA==
X-Gm-Message-State: AFq9FYJwSCUENU2KhIISKFRMX9Zcqx36UQ9dQ5kFqUh8Tr3J1k+CHCRB
	5+Q3WunW/QvL1WupxiaAMnpNhyliWgYsD3lmXJO5yPs19pd+731uj7l0nCmlGe5kIoTHSw==
X-Gm-Gg: AYBFou0KBycDS2gPvKXq+sx1kdbk20xmeLayimjiOotbINV4Wj8alYnrinTqhy2liPV
	C+4qDWt1BwQQ/5t5m3oEMnP/8ygWJFptyuuQ2kDV3Pv+rTL9/BcxPKt19pP79GjlhI3dpykFO+b
	GqA1pjq1eh6uF+19o171eFWsSBi3jgKOgwIKUyCwrZsIbnyq+cxs76fFyf8QhUc+O0890GLHoGn
	2iG4D7yMj3NlJYmXVG1eTLr5dE+08PhtefE5GGI/QGB0eoKjE1VqVurRe1IFtoINss34cV5pc3S
	ZdXr2TXwrm1F+7qAG/tp+hvmfqPk7jiAkkdbJNxM7NtrjvUkEDQz1vVwYTTkZKSvRM7LznKoYRR
	uNGQbULCPvKKuLkv9O36+9lX78nkwJHCOEXfKmylR3+aEaInjOhVFtJgp5YWUWpEvsNW8mkYUXe
	37er9bUhVe/2jH1pC6BsmnsaPalidDyJ6oxIgYpArsh7GuOm+QbthrD3mFHLymE4JJMeTNwk15l
	j7UQUUTTOUQgHbSTRMeKayFXMOFYXgcfwaxd244p2VBCgBebR6tReAT9pM4qj3IPJOH5sou10UT
	GCNoXNLzUOalcAWnOY0Z6WvYbqQVc38cMsw0PDK+bjt85KHNDfbJ44S6H1L37Q==
X-Received: by 2002:adf:e80b:0:b0:487:342:d141 with SMTP id ffacd0b85a97d-48dbaae8b8dmr21050586f8f.23.1791962593943;
        Wed, 14 Oct 2026 00:23:13 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:13 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/24] dt-bindings: spi: Add ZTE ZX family SPI flash controller binding
Date: Wed, 14 Oct 2026 08:20:59 +0100
Message-ID: <20261014072109.1759502-20-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002316_025359_E5EEE790 
X-CRM114-Status: GOOD (  13.92  )
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

Add Device Tree binding for the ZTE ZX family SPI flash controller,
supporting both ZX29 and ZX279128S SoCs.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/spi/zte,zx279128s-spifc.yaml     | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml

diff --git a/Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml b/Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml
new file mode 100644
index 0000000000..201fe46b2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/zte,zx279128s-spifc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s SPI flash controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The SPI flash controller of the ZTE zx279128s runs flash operations (an
+  opcode with optional address, dummy and data phases) on one chip select.
+  The data phase can use one, two or four lines.
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - zte,zx29-qspi
+      - zte,zx279128s-spifc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: work clock, the source of the SPI clock
+      - description: register (APB) clock
+
+  clock-names:
+    items:
+      - const: wclk
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    spi@94406000 {
+        compatible = "zte,zx279128s-spifc";
+        reg = <0x94406000 0x1000>;
+        interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&lsp0crpm ZX279128S_LSP0_SPI_WCLK>,
+                 <&lsp0crpm ZX279128S_LSP0_SPI_PCLK>;
+        clock-names = "wclk", "pclk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            compatible = "spi-nand";
+            reg = <0>;
+            spi-max-frequency = <50000000>;
+            spi-rx-bus-width = <2>;
+        };
+    };
-- 
2.55.0


