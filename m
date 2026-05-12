Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0899CD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xf70jF6KOg/SiWMlOWjk6atZ2ryfC9YUcEG9Wm/SIo=; b=adTB3DloFndYGvmHMuVF+BdegW
	qcy24Vp5Pqa2g/RueEfq6ODk11QdgnwhCysHNsLic3fQp72wG5T0Jz69VyrZ7kocv8o/sTrYgvFQI
	gBlkPuqoEVCCxoSMu2topA7PGDHyrXxcDxdp9lq8j3TRekzyXk0g4BbHJnqtWbrbyPYxsfSHoM1fY
	n+PdX2hDiAibcMXYVjF5DIGyKy/oNDogcSds+gE11Lbf6lpd0el1JHt5JW7EhbPYHn/DExhWc9EA2
	cIt/mVvPgHKEL+FDzcjzLaJXKACnpvoDf/v9iWrUY3UJzVEbI+VcpGvxpurItoUl/YfS4gTWzlFmt
	wFPDq0SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhiq-0000000FxCj-0nLf;
	Tue, 12 May 2026 07:40:08 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhin-0000000FxBo-21ZG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 07:40:06 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-36627a0ea23so2034716a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 00:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778571605; x=1779176405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xf70jF6KOg/SiWMlOWjk6atZ2ryfC9YUcEG9Wm/SIo=;
        b=QFfmES/hUUgOvXEv3DRymBqz85OQK2n7GaOddvJp1lUsWSVDtBu9ERd2/0Fh6M19AM
         6DkJp4xtVgNtbRELhTMB2vaW8/YDXJZVZftTjj+3qyqFCZc1gU5S8F5Bi8M38ySjqpkB
         fLtDGjigAgTEF/lA/iLajwbFfAHSm00S8MbFc+z0gz4RHfEOax8SF+wb23cDJjvxM8pO
         NZLOR3zOlh7VlQmpeKG+jbxv8KPCk9mgPf6jz2y2qInngAL1MT6fsWMXa9vwLuSkxcyM
         vkDHxOIzjU8e2sWZgkCTBBkp7mbBT1zibChePf2TWkXVPxRRb/2xJWAdzG/QaCwKIrJb
         2oCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778571605; x=1779176405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7xf70jF6KOg/SiWMlOWjk6atZ2ryfC9YUcEG9Wm/SIo=;
        b=MO6xmJQdbHcanGMLP8iMTPcn6wAvBqpASQZL6LR+PoJIiqf9/ZHZgcwvQb4OemeXCj
         dx0EKDP5gaC30EJscfapWBqcMJcb42bg6zkszeO/yqt6DvXvokWgUh3k2IhxA65jkb9C
         B/Zk5/AGlz6BOmJDKLjc8hKtaVilC9f8wrwD8J3hsaAFO4TW9UezHfUldfYht2hdfrDA
         8GLoOyEiTszDn0ve0s61iOH9QwFe92c4GsnJyj7K8Vv2AaFRWoBWIjn5w7TrG9ubTZ5u
         ZZVGCNMe1MTkF87CYAihO11lFS3i9QtLarDlPlwVV3AgHH10fKEbRhQRq6tE3uBwGlBB
         TsAA==
X-Forwarded-Encrypted: i=1; AFNElJ/8i08pEX8OiqYyfCZ6Ib2nkQH9NcQw5b7bGCTqnlKB1DEeADajxw6ABweUKfJoB9PL1k0wfuUogbrbiw9D7UGb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx21zJjJSJwE27esi8M2kQwwd+RrQJmUCW+gGbg4KM91Wl1K31b
	xxpnK4W1dVuYyswGxWHChKWRDQwnkZmv7Ax5s2dVIla6sRVMKcbz79sB
X-Gm-Gg: Acq92OGxPNRpIHDgH7Y9pEXlMMT2O66G5zdUQCjpOZOr//EIiOgdjePvsxVvcf5uyqW
	izY9tvTwX125VdZ93RS5UXdL9qYQ2yfIpnWLE7v5oONW59Ekh2TKgjwP/AcDm4U5smWAzmNS+D4
	FQjDfo6gDfDLO/+w+UB3QYaHKIIPZlbpNwo40Uqb2gSG1oRgaoTiQxc+an/9O64P6UNoo4znOBP
	9zROnc8DOYEja9EuHQa+O/CyIZSdteGaqN1FPDhg6gK5vLpv9vaXZ/nd3PMU9d9IlB9Q7bBpEuz
	7o7x3YvYqbamDMGpNs3pVPMCAu6AbosOgWo1bEFSvKWhnfvmNmi6iasogRMwewOCkCtZ8sr3xDl
	Uf9YanRk5pvFTfP3MpLbGk57BOyB8tn8uPXwTKZeNBcyN5F2ReWPGHRZ1lk2iPwiLNZ2ExjUx+i
	A73Ev1WQVoO/9RAULnnK7HB95i27ZV4PlekKMcP0b/nRI14wLimAIkr0ypJsUjFH6zU2MizYePL
	e8BThYMaA==
X-Received: by 2002:a17:90b:2808:b0:366:2668:b5b6 with SMTP id 98e67ed59e1d1-3664cd22759mr16575930a91.22.1778571604619;
        Tue, 12 May 2026 00:40:04 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d65ed459sm13264489a91.14.2026.05.12.00.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:40:04 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Tue, 12 May 2026 15:39:51 +0800
Message-Id: <20260512073953.564323-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512073953.564323-1-zychennvt@gmail.com>
References: <20260512073953.564323-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_004005_570832_5D507160 
X-CRM114-Status: GOOD (  14.18  )
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

Add device tree binding documentation for the I2C controller
found in the Nuvoton MA35D1 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
new file mode 100644
index 000000000000..f2c004049d86
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nuvoton,ma35d1-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 I2C Controller
+
+maintainers:
+  - Zi-Yu Chen <zychennvt@gmail.com>
+
+description:
+  The Nuvoton MA35D1 I2C controller supports controller and optional target mode.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description:
+      Desired I2C bus clock frequency in Hz. The absence of this property
+      indicates the default frequency 100 kHz.
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    i2c0: i2c@40800000 {
+      compatible = "nuvoton,ma35d1-i2c";
+      reg = <0x40800000 0x1000>;
+      interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk I2C0_GATE>;
+      clock-frequency = <100000>;
+      resets = <&sys MA35D1_RESET_I2C0>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
-- 
2.34.1


