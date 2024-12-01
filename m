Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0536D4977B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 17:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ta60IQaIhWAnkSstQ5gFLSU/BoHgdvU4T6DFjF2nino=; b=WIxmGh7VY4gippAOS8uVx/+46D
	Bm/CGfB8sevqLqrpZ1xb0ZzbtdlIzg745+Bu6j3bJHAq5uBCgSRQ9RoHnqfehWPD1iC3Tmu8NyL8F
	ycvLpuTWn+SxFmGMrbIQWwBt414DXq1zTJY09dcp229WJDdefPWY6/QCjoGSgRUKoUk1wzJqGJqwT
	10PmHYSDzinV+DPZ32T5Ix36tyvMH3MJVdacHxpyB/lprAmqpyHSUGBWvz2tZMbKCF6c42uk4C8bZ
	7kbbxc5g/h/Y3k+C6gWRl7sH9DVJ3DDbDidd/oqfQk0PkQyjmD2yfUoby77BzgkXW4RDhburCGA/I
	Aykg3t1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo6K-000000049Y8-3pIQ;
	Sun, 01 Dec 2024 17:51:20 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo2W-000000048Rc-1ZMh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 17:47:25 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso464527866b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 09:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075242; x=1733680042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ta60IQaIhWAnkSstQ5gFLSU/BoHgdvU4T6DFjF2nino=;
        b=nt7St4vgQEt75jgJviwlL+9Crejr1z5N3GaXJkhibpH71m/AkFiO1j89I9fEpss5/j
         qC/fpXOAXQW6MjaLDXVd6u5V1FZkfnK/m8RAsR8R7I0j3NMlivVZ+rPXskYsF/8r3oUb
         qdruYqRW7RTRg+C0jhUnkpiiUmMRlOMcZQrCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075242; x=1733680042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ta60IQaIhWAnkSstQ5gFLSU/BoHgdvU4T6DFjF2nino=;
        b=fZnZ1liQIvkUf0OnvmEnFyeYr4JdbSzWsq2xxXQWMwC+GWxfroF4W1891AvyrEQKcS
         AMEg10dnZfuUBT6/xj34Rjuil/7kzokImIgVbFSCMkWUvrRPCn1VhZKuTYXuzXJyChV2
         Y7mlHeed8vVsZd9AJYcj7j0MolTEcegB3iJ9IGlZUf80UIVAd3VHk5e+Oy2ZePEEY0pM
         kXSF10QLVROFvlqzgVTQpgmWTk7H/xtqRezKcMqF5HCrO7OVu/oZPqxiqO9WB5w7z6mG
         O15JEgmJVhytnzOYwJwbYurKk6QNLDumXmA6CNovXvh9kRaTzxR9ABJhl464cP9M2dqv
         HNwA==
X-Forwarded-Encrypted: i=1; AJvYcCUt7EADOP1f8xyAR1/qvhLK6uYiKJzYklpF0S/iiY8+/jTCIFtMY0Qbcvb51eQVkSulXpTi8HNDzK3xdMdUecpJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzYDnyXJX/fJSdMfPfp0zqwF12bzk6NrYbuHTrWE7DogexsYV/y
	CpyhXwqL0R5CeeicKdiggwUrjocrKBErHJFT1sCIzCLhyoRrq3qowi+QZ1+39+0=
X-Gm-Gg: ASbGncsZTrT2vo2kq8MvZTOOCkKWOC9CwtgDhJ3mEuktk3aSKQuTlgDbizt301/egAR
	UoHTaC5QoV1SwcujCge5NKdiGvMmxl0sBM1x01UZ17zF0X9T3JyW9KOgWX8Yieo3X0hLkY2aYyH
	uvQABrty1slWEPSHyb3WtvUF0bMAKp6rJ5yiy7T0d4auuR/wJDXG64HXVmSAOBMgxmWXlBl21gD
	XZTq8M5tAT7U25r+nGnO7x3XMHdi3lzuPepG/J3o6trN9CY/MtBV/yFzDqctgxRtL6wTkr0LJsb
	UtR4+A69UKzCpFASFw52fm/Wu381100FR+OzRohYr/YwJOIxTmZmPDZEMj3O99bfUPdRcL1+n/D
	UKkyUjA7z36fvBqPF
X-Google-Smtp-Source: AGHT+IFgxSmMaUuIfgqqx9wN9WkSl2CULWn6wLzUNHeYGK/zmvXMdPbcdrCJqoIfMbNoh6JOnFaSiw==
X-Received: by 2002:a17:906:3153:b0:aa5:43ee:2ff6 with SMTP id a640c23a62f3a-aa580ee8d40mr1783857066b.1.1733075242627;
        Sun, 01 Dec 2024 09:47:22 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:22 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 03/18] dt-bindings: clock: imx8m-anatop: define clocks/clock-names
Date: Sun,  1 Dec 2024 18:46:03 +0100
Message-ID: <20241201174639.742000-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_094724_415077_644A0A74 
X-CRM114-Status: GOOD (  10.39  )
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

Define clocks and clock-names properties of the anatop device node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 - Added in v4

---

(no changes since v1)

 .../bindings/clock/fsl,imx8m-anatop.yaml      | 53 ++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
index bbd22e95b319..f439b0a94ce2 100644
--- a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
+++ b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
@@ -30,22 +30,73 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    minItems: 2
+    maxItems: 3
+
   '#clock-cells':
     const: 1
 
 required:
   - compatible
   - reg
+  - clocks
+  - clock-names
   - '#clock-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8mq-anatop
+    then:
+      properties:
+        clocks:
+          items:
+            - description: 32k osc
+            - description: 25m osc
+            - description: 27m osc
+        clock-names:
+          items:
+            - const: ckil
+            - const: osc_25m
+            - const: osc_27m
+    else:
+      properties:
+        clocks:
+          items:
+            - description: 32k osc
+            - description: 24m osc
+
+        clock-names:
+          items:
+            - const: osc_32k
+            - const: osc_24m
+
 additionalProperties: false
 
 examples:
   - |
-    anatop: clock-controller@30360000 {
+    clock-controller@30360000 {
         compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
         reg = <0x30360000 0x10000>;
         #clock-cells = <1>;
+        clocks = <&osc_32k>, <&osc_24m>;
+        clock-names = "osc_32k", "osc_24m";
+    };
+
+  - |
+    clock-controller@30360000 {
+        compatible = "fsl,imx8mq-anatop";
+        reg = <0x30360000 0x10000>;
+        #clock-cells = <1>;
+        clocks = <&ckil>, <&osc_25m>, <&osc_27m>;
+        clock-names = "ckil", "osc_25m", "osc_27m";
     };
 
 ...
-- 
2.43.0


