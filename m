Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FC1D64087
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 07:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cI6o8go+UXL/S5TqQXusywCs+KEzzJC/G+A907W08g=; b=NaiYz4bAYBmj+77nzN2r1cOO+/
	xt9gAU757Mb1f92XQ49Ig2bYFR+9lw4av6kuIILg6ak7Q8cBOuzTRXxoVaIPpbYWEAnihaR+/XF7Z
	U5W2qlDv3CNeBVl7e1TtsxkHh7/ElgL7fhBKplF7XX6Y/8ep+WENxKmNZj7Wz19a+1Kyl6CwlCW4R
	oekQlIxon8P4QM4Dd2XpoPy1z3hMb765+fQioH7B7ERXLokGPjg1HLURJXaETLeGdPkTOmwJROO9U
	dlWn9kiBRGz0xsXoKvO+QK/A54rm7pGKrZ4Raeey2v8mPj3fumzwkiefD7wNuZk8um6ZlDXgNDLOp
	4ZwnETTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmIi-00000006Irx-2NwC;
	Wed, 17 Dec 2025 07:50:24 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmIg-00000006IrK-17Cn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 07:50:23 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-477770019e4so50682935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 23:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765957820; x=1766562620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cI6o8go+UXL/S5TqQXusywCs+KEzzJC/G+A907W08g=;
        b=IJC3E8yw6/lwNqnPWz+Zy+SpZUhgsS3fXo159Bn9QwJMIjHVfkrihK/8KaFx9WXIXS
         1rr8MoowG0KMLzYGgZsGyRVowbYLZY0+ahyZDaX1d5SdKusp83AMklguCc0Gk5vrQ2nd
         eeTkzGMdcL3xYuwHyLfh1GafeayEropHpATcF9U26NYwJeNdt3g6X3gJWTUq3bMlxKjQ
         t4sn0myot+V7k+wTKPAlz8ySRM8XB3XpiW1c2cy+c4fFPE51HUW0v5fAuCEZKxpgcw37
         SJLorMhKjQkuEzLf1RWUa53I+qYjf5Zy/AdVlvcuJptbDNDZ7tHUu+Wf8+uwcw+3olKB
         LUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765957820; x=1766562620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4cI6o8go+UXL/S5TqQXusywCs+KEzzJC/G+A907W08g=;
        b=C6dQYV83yZlnl38KFG77a6NJHfJeKuH8HShjEFok2noG7rt0hvfW2TYnJAEIFctJvY
         Qxit+a4BXFzeYZG9E6JzAaKYC7wINA0cbRfXg2yL0BhO5q0BfgCGCavuUMqIiPb2463I
         PJDeHv03BwWYmrXWNuffnWRGDIrVW5ocf5lo52jrcJerM7XdvY+v8AsyPh7fYmivnfbg
         NU6rlmZq33AwyZEr5fesismq52qoW/jr9gY1MiLP1npc/nLUUoADmmf42/E42ubQObV7
         5jlp2truwZPiB1LTAt1sxE4taDECrinNm6NxSpE+TTfiw68oCMz2ehwAq31RqiFKFaf6
         D9qA==
X-Forwarded-Encrypted: i=1; AJvYcCWEsip/Gsm1xmuvp3ecHb+7DoSxC/A5icOqGYsIb61iER9VlUyb3mJR3BgMU8Bgjx0YMzV4RTFqbiHC8Xohi6wQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzrAcPeru2h0rlK35tUaw4S6UIAlzufVEkoUqJAHo7f4vyBsFNw
	FZJyZwa524MF7M/jWHAX9nz5yYxyotQoyxoiQtke31BbqsV2iI4AoPztxb4G8sbB74xIp9js/Rm
	6qpHgLzT8YQ==
X-Gm-Gg: AY/fxX4nlkMiwwWi4tMkOfO89+CV5MYm/0RP/x4yznz8Svjk/sOXdVGHhdBzcvlNDX0
	ssD4g+xIokNYwSEby7W4Ii/sgvgVmKjfBw5Dt5yrdxSK6MsKazwrHxKThBTzLzSzmxsOXJapWlb
	AeYphkcWQBgeTcQyCohUU+GNv1yne+Aw2wByEA8tiehGh65r9cnaePeV9iE+wjeqGsmayJG4Jxj
	qrDNI2slIRiOY+Z+4IRHq1CjjkYSMRvLazIMfHqPCnGydRW2U64zkh8fmGek07LfMSCkVxup3PW
	018t8gG1GIyoiWhPHmtcHZKdAJHqlm+1DH8LULMgoK421E8qvd9C3kg9aZNxFlqtJWstTXFieEb
	En3/LhL9RqTxNvOohWRintE2u51fgliqfqLFBlQa8uP0ENfV527obKb4fodj98B9CTxOylAo/T9
	p2kEwXmSoFWdfC7QwAJuq+8b0n/Jfs084=
X-Google-Smtp-Source: AGHT+IHUt4H0d4IVMI4vL/GyjK6b+P3BJ1v53Cknxck8AjlUtvfUSe1tsqrmrYziamrC2AoPcIxuOA==
X-Received: by 2002:a05:600c:4595:b0:479:3a87:2092 with SMTP id 5b1f17b1804b1-47a8f9145edmr164663625e9.36.1765957819748;
        Tue, 16 Dec 2025 23:50:19 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:37e6:ed62:3c8b:2621])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1edff5sm26094315e9.14.2025.12.16.23.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 23:50:19 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wbg@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org
Cc: s32@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
Subject: [PATCH v3 2/3] dt-bindings: counter: Add NXP System Timer Module Counter
Date: Wed, 17 Dec 2025 08:49:56 +0100
Message-ID: <20251217075000.2592966-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217075000.2592966-1-daniel.lezcano@linaro.org>
References: <20251217075000.2592966-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_235022_327028_A31BC0ED 
X-CRM114-Status: GOOD (  13.24  )
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
when it is used as a counter and the compatible for the s32g2 variant.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../bindings/counter/nxp,s32g2-stm-cnt.yaml   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/counter/nxp,s32g2-stm-cnt.yaml

diff --git a/Documentation/devicetree/bindings/counter/nxp,s32g2-stm-cnt.yaml b/Documentation/devicetree/bindings/counter/nxp,s32g2-stm-cnt.yaml
new file mode 100644
index 000000000000..4d42996f5ad3
--- /dev/null
+++ b/Documentation/devicetree/bindings/counter/nxp,s32g2-stm-cnt.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/counter/nxp,s32g2-stm-cnt.yaml#
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
+  The counter is driven by the STM module clock divided by an 8-bit prescale
+  value.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,s32g2-stm-cnt
+      - items:
+          - const: nxp,s32g3-stm-cnt
+          - const: nxp,s32g2-stm-cnt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Counter clock
+      - description: Module clock
+      - description: Register clock
+
+  clock-names:
+    items:
+      - const: counter
+      - const: module
+      - const: register
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    timer@4011c000 {
+        compatible = "nxp,s32g2-stm-cnt";
+        reg = <0x4011c000 0x3000>;
+        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+        clock-names = "counter", "module", "register";
+    };
-- 
2.43.0


