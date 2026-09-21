Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B4FC982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 08:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=; b=PgYTDBosaUxr4oWAuCFELWbfRn
	YFiFVyQUExjG6lpjlPKLKnSiVIxTDHvd2CJPQKr0Yai+1xODGzt17WFeF3GksbdTdKWbHGA5+Fvb/
	vHf5OhpF1iwRjeo5C6jc5DHcj+1DcvHQnxralR/culV9IjUguHQbsclYdyQP7/SeBMX+8ZuwbFaxH
	qkSODNFvjGW3tfF6g/d2V+WtepA/6DJyFnjge8RtO21msMlyPQPUZruhvVmXa7T63fOMDE18S9MFZ
	7wZMpSl9GALcvPwQNGgWGH31RiD5H0IY6WkJHeSkzurHM6mzuVarazUC5Dx+AebggfIDCfl5IeY9M
	GefLml/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZXd-00000001MWb-2hnq;
	Mon, 21 Sep 2026 08:38:25 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZXT-00000001MPr-32SR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 08:38:18 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccda24afso1925225a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 01:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789979895; x=1790584695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=Fit9PYQnnRsDn1FGnG7/lu925zvum0nzR6Ls1qWOmt1R7qqGUSb768FgnuQJQVA+n5
         aCNTon+5GO3LbJeteDdXhYDm5CKEq1XOrMbXMwdZ5W4w8taIFPk1kv7J6n94tvhRMwZL
         GQpsOC29f/y1+WKdxo3CkzLUguRB/Q+ONRQ3iLbATE25nHutTgwS1lvx02q++KviO4Xe
         csKGu+tARmwMvLiUZkAZc37QsrRn271QHADDfcaE+SqQpMMYoYW+omjRtbIGWC1K1dRG
         vc+aIBi3U4L76VwxsNDCt+Cwhx7ldQsAGAgjTXnovx14ikVndTp3pYSNCilL1qU4YBqD
         lxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789979895; x=1790584695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=xn3jsm6srmP7/EbHVFpLZrhPwfL747wn9iGzMI8LZf5fB1a31GjGavw4P887ObUXof
         uKybC7Zh8jnBah3LOTRhOPsXvaLw5eW9nn5R1+gcSHtIHXRvgi3NVtIXgpJfDrgSABAy
         Tsth2kM/x+RcaFN+eEIofsBGqoau4zkJlU6v4bQOPW/Zhq35G3z4+t+hsQ1M71M7iH4h
         ZP2QvukOzG9bk4q6Zw8YjNmhjZbzaT+bV32xNScB/DTFMgxRdzzdZw8bqhmuk6jO9bFj
         lwfxCwRcXvVVvSsAT5UNcO1kIiyXdS0cfaEGn7d6mYfhURtQzKS9KOsC6mW8pZXnGubg
         gmkw==
X-Forwarded-Encrypted: i=1; AKwUvBzctScFiiyE7HA734YptCHUx0tMSjzSpu+t9Ao2D8U8ogPjq/X4WFwZ8hr/fGA1S8bZoqGeSFhxL+m36t9+nVzM@lists.infradead.org
X-Gm-Message-State: AFuF++k6B5D3klU80Cf563D0QNVkEVj2lYCQnuz3yJauXjiGqRjQ9epL
	RiCHQkob2HnfyvxmTH4DOq6BuGjrUlTslhPTfLYPPcW1p/RuQhwQG6WT
X-Gm-Gg: AYBFou1J4PimEBA4yDzqOn2yww1B3XIW8QJ6RRk1sI7SRuw3j26kAVoB2sduab2iOH6
	i4zUgA7zMuj2es1A8UccKT6YOLrrwEMeuzqB6eWm6qfktTwBKiedG8gLdy6id5PcXSJI4sE0fBA
	fDcgIMec8O2PVHhIM6bJFSTE+E56pD+tKZfvREYDHcyoBN6EH355HPWJZckBujSLiIICHm0kAvT
	P2FMXd4BT6nd8AGByER44HLHs17VmZ/cHV2K8egkmzlMz7WzXIgPfdz42b7ZgHoRXy+VTkH7dqv
	zBZ5xjfxFrsHFN3iCsCSXJurH9uZ8CzlLt+f4zh+W8UR8O1TUM9EnytqGbSPK2i331v7lAseQT1
	7me7mFhAc6KwmKfvqq72D5SMMvX2tA4ygauiBXPrGIeNkMNuFvCShOxWpzUNVvslOGZ9Wy0ieQK
	6UcoGeZ6/2Z8wqOt9llVe2Eu97lcnBRaTKmcPZ+d3xkejYvSKEjthr1Qe75WEJAZMKIqHP21L9C
	1BhT6HcdHMqkxmndjhT+AiwL8KQmeu6tgRBuZtvM/rd6rYW+um31yda
X-Received: by 2002:a17:90b:55d0:b0:39e:6a81:c921 with SMTP id 98e67ed59e1d1-39e6a81c9bbmr11542914a91.20.1789979894703;
        Mon, 21 Sep 2026 01:38:14 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6ca50694sm15121508a91.2.2026.09.21.01.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:38:14 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Zi-Yu Chen <zychennvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Mon, 21 Sep 2026 16:37:51 +0800
Message-Id: <20260921083753.1109826-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921083753.1109826-1-zychennvt@gmail.com>
References: <20260921083753.1109826-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_013815_767556_9C14811B 
X-CRM114-Status: GOOD (  14.16  )
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
index 000000000000..0713e1c1ecb8
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
+      interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk I2C0_GATE>;
+      clock-frequency = <100000>;
+      resets = <&sys MA35D1_RESET_I2C0>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
-- 
2.34.1


