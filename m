Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB951C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 03:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNwi0hswB7nBQJuSOnrDkFTvC7EtUxGnPwE8AGU2RxA=; b=YHebJ6OHS7aqXUw91UQDgsT3dl
	2tUE17sCtrXh/BW7GQCSqt50ZTfedKzvCDFA06AZW69suZxB7gVMdkw6Aft5jBJtzRB7hQPU82nNz
	qdHEXJ/HdoXU57xfo3UH8Hny2mibCU47zZIwViTVm9MoH51c4XL3TkHdyiPGI81pByV6YzO6M7TCG
	jK0ucJIo6q38r6dz5ikvQ+OHkkaPaUcIuNP3D8fzJUhjoebT8JZkwWdZBysXi9d3n9H12Jb8BbgEY
	54xm9ja910Q+xeG9ZCHEp7UD+3On6paZnzfbiI0aShBfXCdI8owSeek8f2ggCya0fiIadJET7Fin8
	LbOPbGWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Or9-0000000DM0I-1onR;
	Fri, 18 Sep 2026 03:01:43 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Or4-0000000DLyh-3N4P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 03:01:39 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccb65437so215584a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 20:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700498; x=1790305298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNwi0hswB7nBQJuSOnrDkFTvC7EtUxGnPwE8AGU2RxA=;
        b=ZSpzDDT191qSDVxnQ8ziFIWtwL+HkuuGyXC/gYTEpqRmgt1tXYiKHiugy91e8BZvXr
         9fG8Ute/s4wvr3kV9Hk3J1bPZtev7C5b+l56COckXW13pBZgo1Q9XNIxDR9GRB2m1/6Z
         mlejwW4Fxy5XM4lYAJMu29gpnDv+E8TW9K69JKP+flHMX0Md2NDtTTyVod+hhH3NNPGv
         a8Fi7uEK5UpPMbTVFTDiUIfg7xvBGV0k3+fcU3k5M0WlSokh2paJw2b2Nk6KJqxxF+0c
         EgM8CsaAm9CwwABy8sVlQ8qqM9j3Rl5LUxwUkWrV96JUauQv9q1MrSlbymzVfBKCXvpI
         ARUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700498; x=1790305298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNwi0hswB7nBQJuSOnrDkFTvC7EtUxGnPwE8AGU2RxA=;
        b=ZsfAF/qWmIS/MRkoqWHUCXap39qTC48wJE/SO/J5qBgn+tZLmJzzh1xHSXd/9SWv8L
         LZmkmB/ot5otC/+/deEWD1GDaVfljQ5WMBGNLIAXkvUWWlUFnSWX7rVnfWTkuYAaCmc6
         yozIE9wtTTbP1a1fhsSdxqEYxYwOHhxHUNoZ3lOOgN0Sh2ZbFwCE9oEEoHLt9ag58eG0
         RmxCrYfUl7JJCV/jc+J9AfesQhzraDnikaKb5I+JAxuHe47mUF7PaZq6XFzZtgFi6JIg
         TXNJGheMqfUD2q03VEXtXAvQNeDSke0PDaZJqES9FYFFm6+jyCwOt/mExpkqDinTTjN1
         W93Q==
X-Forwarded-Encrypted: i=1; AKwUvByFnlHYO9JjUc577c5aKZM4rBAISzaTWxyfDZXyBoTBDOfcqszyMo4w8kw600hpz2SvD3dOdkJRji2U4T2GnnP0@lists.infradead.org
X-Gm-Message-State: AFuF++lfp/s+lrENE4Gm+scV8FwthZ4nURJizs1MiJVx8xY8pE73sPkD
	nB+wX9zx6F71bAe4dHloXB4V+kn3l5Qjh+edD6QMnRAamK/Gu5SlNj5m
X-Gm-Gg: AYBFou1AdZ7qzvZ21VZmLC8YcixBEawzkNo4oYAvJBEG4EKTlJ+sRpZg0uGSXSTiojk
	qNf296MD3S0cwOwUqhkn3jghHVA8olfDag/pMp/0Lk/zqW8LaFomoaEcX14x8Rjk0RbT8TXrqKI
	sCTL9VBEKa83sf4MVWCiU4zM/QStU35XHI5FFMj6fNliC9D0Uj2EcZRRc4cL9GNTjbsscFxHZAb
	ucpb8ql3Sb0/KOSkSIAL+ob0phBBPeupZMBE4LXKGOt9MeTw1J/nvPWPCgRBu3X2AMMGU25HcMx
	oCUuHJjf8Ek1HYR30LyNRZSeWOCpErkYdjzzYtsOTWroIENR0VeXdZIA5Nt0Q5OPFdbhzY05ED3
	HrYx6TwA1+yZEbZ0Qvh3wVItL36qsXdWTVXj4DQSET7OMTzMEGQuHkcCG7Z7ZxRjd7uI6Ft9BgJ
	on2Q2gXqikiYb5zQIzv/WLqp2UGYE+9xdZ0wGMfWWf92Ujk3/w6bUkXu2zoaZR4oWt7wknBRlaI
	cKv2wTX6aiZzBQTFFGjacpvh+2LvJrvv8JsTCrq5CFxauyEBMCqZLq9WeEW3kc=
X-Received: by 2002:a17:90a:38c4:b0:39e:5c75:acbb with SMTP id 98e67ed59e1d1-39e5c75c196mr202652a91.11.1789700497914;
        Thu, 17 Sep 2026 20:01:37 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:37 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/7] dt-bindings: display: verisilicon,dc: add support for nuvoton,ma35d1-dcu
Date: Fri, 18 Sep 2026 11:01:19 +0800
Message-ID: <20260918030125.315978-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030125.315978-1-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_200138_847980_E6F7D330 
X-CRM114-Status: GOOD (  11.57  )
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

Add the Nuvoton MA35D1 DCUltraLite (nuvoton,ma35d1-dcu) to the binding.
The DCUltraLite uses only four clocks (core, axi, ahb, pix0) and one
reset (core), with a single output port.

The MA35D1 clock controller gates the core, AXI and AHB clocks with a
single bit, but each remains a distinct clock line feeding the IP with
its own rate constraints, so all four must still be listed individually
in the devicetree; core, axi and ahb happen to share the same clock
phandle.

Move the clocks/clock-names minItems to 4 and resets/reset-names
minItems to 1 at the top level, since that is the lowest count any
supported variant needs.  Add an allOf/if block that tightens the
constraint back up to the fixed 5-clock/3-reset topology required by
the existing thead,th1520-dc8200 compatible, and another one that caps
the new nuvoton,ma35d1-dcu compatible at the 4-clock/1-reset count it
actually wires up.

Restrict the same nuvoton,ma35d1-dcu if block to a single port@0,
since the DCUltraLite only has one output port.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/display/verisilicon,dc.yaml      | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
index 919a900122012..e1e6a3a953646 100644
--- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - thead,th1520-dc8200
+          - nuvoton,ma35d1-dcu
       - const: verisilicon,dc # DC IPs have discoverable ID/revision registers
 
   reg:
@@ -26,6 +27,7 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 4
     items:
       - description: DC Core clock
       - description: DMA AXI bus clock
@@ -34,6 +36,7 @@ properties:
       - description: Pixel clock of output 1
 
   clock-names:
+    minItems: 4
     items:
       - const: core
       - const: axi
@@ -42,12 +45,14 @@ properties:
       - const: pix1
 
   resets:
+    minItems: 1
     items:
       - description: DC Core reset
       - description: DMA AXI bus reset
       - description: Configuration AHB bus reset
 
   reset-names:
+    minItems: 1
     items:
       - const: core
       - const: axi
@@ -79,6 +84,52 @@ required:
   - reset-names
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: thead,th1520-dc8200
+    then:
+      properties:
+        clocks:
+          minItems: 5
+
+        clock-names:
+          minItems: 5
+
+        resets:
+          minItems: 3
+
+        reset-names:
+          minItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nuvoton,ma35d1-dcu
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+
+        clock-names:
+          maxItems: 4
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          maxItems: 1
+
+        ports:
+          properties:
+            port@1: false
+
+          required:
+            - port@0
+
 additionalProperties: false
 
 examples:
-- 
2.43.0


