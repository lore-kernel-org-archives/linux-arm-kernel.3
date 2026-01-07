Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125D8D0D16C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 19:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=quK5ciOPGpJvzJstcVp2ODwhOQdezz2oTPhzvAyikRU=; b=SVY/oekmJOypU73dn5X+BEDyV9
	r+bfLAe6+KpJjsKsDqdPIi0W+Jlw0FuKlCJIFg+Y2ad2qsff/2O3kwc4+Naz8EqryHgI4zXEkBaOi
	u7fCoIXuG8VYCtlnlTRWIyqpQfMjeCCdyoslJNz8FFKKKndjRmLoHp2Wy0oMAuyEv/RtD/W2ZEzw7
	QKfe25g9z+IcZ7YkhBqGmJJNDJ4bWcGUXzLnPzVTV12GJnQaXoXoLUBh3UhatHsxV1wgopRs8RzbI
	WD487WTj9SMN4kjBnDUUQrd3qg6TWtqWnhndQwAGw1QCuSxPwgcRc2QhY8yDwITG5svXf4Uwa3Wcv
	W3sE6ytQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZTf-0000000FZDM-2nyv;
	Wed, 07 Jan 2026 19:45:57 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZTY-0000000FZCR-1ZdS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 19:45:53 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b7277324054so431129266b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 11:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1767815146; x=1768419946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=quK5ciOPGpJvzJstcVp2ODwhOQdezz2oTPhzvAyikRU=;
        b=kz4gDW544xCneky+JMQTh3TfCfQ3FEhSNG0b9yJorNiWDWa6v6rYOD0KspbW3cyWGn
         a0bi1xBPrXA40Bpxs2IheHABCKNikSS6v/zjUFVG08YQOMQDe+4llyKTiCfnP6TjSP4M
         /GWadoFRgTpOiniTHKGkiuEi1iNRPOJHXO3ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767815146; x=1768419946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quK5ciOPGpJvzJstcVp2ODwhOQdezz2oTPhzvAyikRU=;
        b=VBhh58Gv3iNF948ri8w0/n9l1R1hOo2GkMWgkfwFJN0CTOWVJtct6KY5hHw6tkVEao
         /bFZiBiYUm57JBtBrrRtwPkq7oqd7eW/slrl3wMLIzJ83XuPfSYYBSkz2n+EEaVH4idt
         rqkRtSXD3Rl7ylsalCpxLmhJXmCCQ3Bw5F97z82A+IQy0x6axOceiehXftSAWHZk5l3u
         jo4YDT2jKHcGDbMRqJUjkHq3QQjx1z3FVJGx86gRBbALshw/IMRXJwjQ3dNzCZSoWkQ3
         2H89WxsedXttXFDB0kqwGyOt1p0ZkQqRQFDBqfTp+JFlC4M0QZ6QeFg++QPb+vY8zoUl
         GLUg==
X-Forwarded-Encrypted: i=1; AJvYcCUKyVBwYCQGQ/2ItjYyv+JPzZ6oLypr9+z2fde/3ZokugvftyEmHVsVzv2UCNZfOON41Kuj3Mn2oHJOdOxTrP+g@lists.infradead.org
X-Gm-Message-State: AOJu0YxYShgbPVxK6sjJLTAOkanoHdz8ABWeAQ45xh7QeMcZ8UKuRELx
	oXeLUK4DAB+3SBqkk2Iofw/I36yxh1Q38DFB+7NyWQvp1pu+zylAbwTJlVzxZvyW8Yo=
X-Gm-Gg: AY/fxX7+UbL+ZiVsdmvaDZAMWtt6TqAAsFuBu3FCXuUWXWvGq+luLxlWxj35fO0frhB
	NbmqTBQne/Ozuj0Nemj5P6121sPuBwGC19xQzxcz7+ieKQplprIlXnCHc1COrebBkk9hPM9bcKQ
	Tp2YXB1KcWIzmECXi6ZSbZ5IMRJ3zjGzoBi3zavD7jJ9/b4YeU78fwKO6KhAuyu/G+s2x/uo38Z
	GR0zKoZ+Lm/7uhhylHuVUExL6AnZVV6ju9rR6YA88nSgX5Ulf9NbjZVt3Yb3G6DKsmYR1dA0Kig
	RdtrCw+A6fyeLXijU71sTm+tE80xgb78d/PymSGSMktwcW4KLy6JH+jrQ8kZEwALhlc+6afLr2t
	BL+UxiA5bGeYwFU0rx74Kyu004rItNNrY/nDKt91SH7FYZeFIu6hkCXIhWmlZqrU+dPl9hGsm+a
	ypuFtCCnO22zyipWS3JHgu3yLOA+mbSsVVtoFWul86rGhRTSjCD8gpiyQg5mohU1SMjv4pG/xm0
	/Ex19ZlU+7CmWgfrbkXjDg+Y2hT+0hgSTU=
X-Google-Smtp-Source: AGHT+IGPqFKHO54fO/GR6RYjVaM2n4PRACshjmo9Oi88osBBrk9H6SPRXC5Q0NmPtbSj+MniyrTglA==
X-Received: by 2002:a17:907:1b21:b0:b73:6f8c:6127 with SMTP id a640c23a62f3a-b8445031bf9mr384207966b.12.1767815145741;
        Wed, 07 Jan 2026 11:45:45 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a233fb3sm591201066b.12.2026.01.07.11.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 11:45:45 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/2] dt-bindings: nvmem: add STM32 TAMP NVRAM
Date: Wed,  7 Jan 2026 20:45:32 +0100
Message-ID: <20260107194541.1843999-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_114548_462479_87CF3547 
X-CRM114-Status: GOOD (  13.45  )
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

Add devicetree bindings for TAMP backup registers. These 32-bit
registers are retained in all low-power modes and in VBAT mode. As a
result, they can also be used to store sensitive data because their
content is protected by a tamper detection circuit.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../bindings/nvmem/st,stm32-tamp-nvram.yaml   | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
new file mode 100644
index 000000000000..e03469fbe436
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/st,stm32-tamp-nvram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 TAMP's NVRAM
+
+description: |
+  The TAMP peripheral integrates, amongst others, Non Volatile RAM
+  (NVRAM) with 32/128 32-bit backup registers which can be used by
+  software to store information or communicate with a boot loader.
+
+maintainers:
+  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - st,stm32mp15-tamp-nvram
+      - st,stm32mp25-tamp-nvram
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nvram: nvram@46010100 {
+        compatible = "st,stm32mp25-tamp-nvram";
+        reg = <0x46010100 0x200>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            fwu_info: tamp-bkp@c0 {
+                reg = <0xc0 0x4>;
+            };
+
+            boot_mode: tamp-bkp@180 {
+                reg = <0x180 0x4>;
+            };
+        };
+    };
+...
-- 
2.43.0

base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
branch: stm32-tamp-nvram

