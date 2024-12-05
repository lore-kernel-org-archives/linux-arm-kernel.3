Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13A4E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiY/U6wqtKU6IpvnYGmb6LinIE6E3Eav1zsujKOZRDc=; b=lMv4A9Z9NcmM3AcmmU9fn8sjyi
	tEWuWPfXq9QNI4sLxvXYp/q/cVq1hSMKTnc9LaUCVW+dIdDEHJ5fVStARzoliqIlgIrMN80fC6yI5
	EZafGKZ2/TVJ2WtOJAWDCcYqNWP3wjfkmHaUbq4tdUUdfQ17dvBtO9Grh/qlrx1xkfS+6S8DS/h5B
	wykAPd/2FWSpstRRxEYVDi38wAs9EmvgLfUpNNjIaIv9y+EiqSe4ui3wKtM2UI1Z6VqyqwTCgAun1
	cwLsdHU9xulD/UNfCKFb5d08KL8KiWfu26Uh7s1lSIKAFIBWhNJZbX9JtqFBZdTfS2eXl/DnmQRDv
	OSfm0+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9zY-0000000FiLY-1qDd;
	Thu, 05 Dec 2024 11:25:56 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9tf-0000000Fgbs-3Eh4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:19:52 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aa628d7046eso79959366b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397590; x=1734002390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiY/U6wqtKU6IpvnYGmb6LinIE6E3Eav1zsujKOZRDc=;
        b=pVMCtuNGjEvpb1vnvxkChLo0A+5/TYICwIMy8OBfT0QMQHyuDLUkruSTXvuuGUYUJq
         2fj2a5JT6HCRS2yeFphyfoSogrWz5gBp3sBR9y2ZfSsJvDTECWOPYu7tasBVN6iBmgZY
         SS5Fk0EZZwZWnURunzD1r4w/X6k/Z4LKMXmNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397590; x=1734002390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiY/U6wqtKU6IpvnYGmb6LinIE6E3Eav1zsujKOZRDc=;
        b=xAVCNJjlx7optLzjC4c0PSBxMPiK0yiZhNRnRATJPPtlic5OZjwV9/jfZ+ARNrj61M
         PbHInITGHaaySJL11uskOqhApWpV8CWteGyOxLh/ImYeH28tE3FCZDuVyyYHu/6RSOLh
         hk+9SubhP12RXxBYlRxZCelQ7+pbvd6dTZrrP5lCdV6XZG38ZQFlpXDrRgAcjebKXSGB
         daX+ysaVLJL3wBtJypo47pZp8joHzzz7tUHV8x4jVqkQbhTHCUx/jJMJw88ZRkxu8vZD
         J4vWCslxkZAkorvOBkFpGQv5LS6HgY1GMOXkuiodgnvFWT0EYhzus15jiY8cVI4WiOT2
         OTAw==
X-Forwarded-Encrypted: i=1; AJvYcCUya300a1pEX5BG7oLBhr6Ju6Cl2QGNxc+8posK/gsy/77Z0CJOfIk7v5kn9frgaxMdofiundy8vid2xGIO66xo@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/lKOGtCiL/scpIja47H7cScsuj7E+OASW93Vc8Ra3lyITxhiZ
	zTkInlPvfWuFeA/x1RvjPNObNeZmN8sU4W0AKjB2kB0Tg7P9XsHiUX/n2r5NWJQ=
X-Gm-Gg: ASbGncsvMx5lHrXz4F0hm158H7SoHthXSwW46ytxzvtTyVzYhc9RjzPxFbLdbMLnq+8
	S4KeCe92cnrnjat0uoy9YlZk7o2jF/gCLd1P+62RfwlIbAeKv2R3jK5HlAqhXQavnqTINgLZscb
	SGbMGxQP28OJrs1ADUND395A9fQYOG1sLz5zR1URuDKHhF2o546xVuAvelcZMcMR5slDYMLVdss
	VXOZRVoZjRd8alJ7ahbmGfwo3hIeDEJnYxgCTrszx0S2tFkptVYPwJOXaDdZe0DDu1qDC/wSsO7
	ws93s1aNbJS5zmL0NAk1WysK9nvPs/aP8b3DZAGRVuPfGQ==
X-Google-Smtp-Source: AGHT+IGIry/HdfnXsGul2UAgCCUzoUgqWIlhMfl2Bt3RhnIZpkxjsd0JhMpVzy2Qc3h9grs6M8D/Og==
X-Received: by 2002:a17:906:328d:b0:aa5:46e7:4baa with SMTP id a640c23a62f3a-aa5f7cc1bb2mr781689466b.7.1733397590083;
        Thu, 05 Dec 2024 03:19:50 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:49 -0800 (PST)
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
Subject: [PATCH v5 05/20] dt-bindings: clock: imx8m-anatop: define clocks/clock-names
Date: Thu,  5 Dec 2024 12:17:40 +0100
Message-ID: <20241205111939.1796244-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_031951_806608_91445F1A 
X-CRM114-Status: GOOD (  10.31  )
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

---

(no changes since v4)

Changes in v4:
- New

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


