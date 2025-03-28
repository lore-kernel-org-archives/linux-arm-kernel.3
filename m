Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FC5C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDlZeNaPnXFvOZPkil6XrMTN1ssI/Frn8lmsMRzm7J8=; b=eRDMqNc95Xxwcpl/MSyxsGia1g
	clcN/Lba8ECB3DM7p5s3TJmaMOR1BRVSK13+X56LxK2b1l8yZlFgoSdEg98BUCXEPvcMxt3F6YnzT
	VUNqrgTywlK6uMXrI4fFCk1+e6bpOZNlTN9jbKVsvSxLfJdozOIe5cO6GUvjmVPI7BFzhCYMgEoz8
	/bukMAPUEcT95YRpOO8KSw4Gux7TeZkUbT/OkrTAUqPwhU5zVGC0SFU/Z9vuBMXOLy+b8G2lQNHBZ
	9VqN+mWLZNTHKgtm7QPeQXK2jF7zOBdWib6F1U8e1vMvpRDgnfNUV2AmjQeAAWF6aE7T1YtRgEOtf
	xQqoOU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAu3-0000000DdGC-2oRd;
	Fri, 28 Mar 2025 14:41:47 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9yr-0000000DTCG-3g0k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:42:44 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-391342fc1f6so1824517f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743169360; x=1743774160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDlZeNaPnXFvOZPkil6XrMTN1ssI/Frn8lmsMRzm7J8=;
        b=tg7TJtaB/22+DbhJXdt2FbzO7pnZKck7k6sw14R1DYsxzYAcHdgM3xqATph/u5Y40u
         E7fNXf0sPTGrPFbqnjNya7ouq9sOs8ZvuFD911b2Mhj2WF732ngUvLBUXrqe60OQgf31
         rVAGQUD8gYkPOB5+w2ylbkgXmKO6spQjhvnXOORUBNdg/+RN3z34eBLWCPU7vvOn0J2r
         cB760Rd0wpYP1XjzznagOPvWbI3GMgKr61xWrt/Qe3GDItfh2Zg7B55Em4GxHyTd+dIF
         DbjWpdLNtmFLeV5FJXxg/cIblHYveKCI4eDAtCJruYxoox+m+ulJdC59o372VsmAlUk9
         ziXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169360; x=1743774160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDlZeNaPnXFvOZPkil6XrMTN1ssI/Frn8lmsMRzm7J8=;
        b=UKFT98e6Hm29pPxuOein8p0eIeV2tZLM+EV56+SYm7bHSSVaWbfR+xaU06cBQihUqS
         GaqOmGuZM7T3sUleToo8soVtbKT1OUTiwua/LvbR9tAJuIeQ4ANdLAfRHXRnmgg3d71P
         HGvSttff+ZQkgOkrMbrtz7l0ESAs6jB2Gy1oG22oVMMI1o0tHl6iD3nLRw5TOzV/HgEt
         pPEuRO6eI+KvoAk+wzb1Iu+MUpMYnd0R1SnZMXH2UP/xui+BKxC+ZZ5RssvxtI8aRePo
         KKSIYxGJLaGhc2bsLsa1JKCIZ1PlMk3dKvutsFzPhDQNsMB8rK7CoRxyCie4zMEWh4lR
         Yl2A==
X-Forwarded-Encrypted: i=1; AJvYcCUJSQHJFe1V48WRMxHCHztXZP9Ii+0botm6b2BMpML+ALiSWghtWkUDskW4L75aOikaKjpWsD3wFj9EUFC9NLXd@lists.infradead.org
X-Gm-Message-State: AOJu0YzrS6gXRqxSWFdAzT9MjMyvKYXeLABdheKBFLnNX6kfeyEj0pgz
	53hN9E7wxITYpZcJtzwJMa0Ob6XGLwdxUMpqHj647sYsutGNTHcJvkCt4HpDHVo=
X-Gm-Gg: ASbGncv5H9VmNBOCyBcRVzNFsozwS5u1jAbVIMjwvIC1iMBT7UgREWeczYuBr/BV1I2
	ISP6FhprFl5QW5WvoYdTWKHg2xbKaMYIO/ShVArODqw/aa8BiV0x0rfcqRO0j9aXctWgVg3PJQj
	DMYgWA8lwmqCc0bWwNm/iT9VHa+x0d8PyW/cENVJ4egtVE5cT+NB2zseB05IsiZMmOnI78nCDVG
	cTy0EOjHyzEYycSZ4SLUSbmQdNfdGOkBtoRdOOt3G7j2hjNLoVh6pDVVMNwtzGwN/P2qpOPTvSK
	ody8oUj7Xxfb+Jsce/iQpdxnywg9eQMs5Lem7/HWBuScoOYfAYtJXJ7LUT7MpSAl2ArvlsY=
X-Google-Smtp-Source: AGHT+IFfkVBjPznrQd4PYLz9zI+l9POMSzQ664uGOWa4mIRuS2P4bJKmnzLPS24Z1UOidJRlioYduA==
X-Received: by 2002:a05:6000:40e0:b0:399:7f43:b3a4 with SMTP id ffacd0b85a97d-39ad1748dc1mr6639623f8f.24.1743169359728;
        Fri, 28 Mar 2025 06:42:39 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e097sm2595454f8f.80.2025.03.28.06.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:42:39 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	thomas.fossati@linaro.org,
	Larisa.Grigore@nxp.com,
	ghennadi.procopciuc@nxp.com,
	krzk@kernel.org,
	S32@nxp.com,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
Subject: [PATCH v2 1/2] dt-bindings: timer: Add NXP System Timer Module
Date: Fri, 28 Mar 2025 14:42:05 +0100
Message-ID: <20250328134208.2183653-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328134208.2183653-1-daniel.lezcano@linaro.org>
References: <20250328134208.2183653-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_064241_913532_3F5CB018 
X-CRM114-Status: GOOD (  12.95  )
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

Add the System Timer Module description found on the NXP s32 platform
and the compatible for the s32g2 variant.

Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../bindings/timer/nxp,stm-timer.yaml         | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
new file mode 100644
index 000000000000..a9c0151d62be
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/nxp,stm-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP System Timer Module (STM)
+
+maintainers:
+  - Daniel Lezcano <daniel.lezcano@kernel.org>
+
+description:
+  The System Timer Module supports commonly required system and application
+  software timing functions. STM includes a 32-bit count-up timer and four
+  32-bit compare channels with a separate interrupt source for each channel.
+  The timer is driven by the STM module clock divided by an 8-bit prescale
+  value.
+
+properties:
+  compatible:
+    enum:
+      - nxp,s32g-stm
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    timer@4011c000 {
+        compatible = "nxp,s32g-stm";
+        reg = <0x4011c000 0x3000>;
+        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 0x3b>;
+    };
-- 
2.43.0


