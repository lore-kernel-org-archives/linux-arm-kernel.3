Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF61C79F8B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JskkGqhdaY1l7i1ogeLg1oSPtvCeMbo2iXSDE4yNEI=; b=3fSuvmvHuyVO2DtmxwK6A8JowR
	mlLPyYM7cAmLTQQ8jzCrbtTzrZcyUBcAGmRWOAT0bauCbJgwiEjxasikMf3E0V++jw8hYiRgm0pb4
	jVGGllIDL1zjXNMgpSO+2FgW0NH40Hb6V6bNdQ+hKARO5J6PA4dgu0830Vq2bFqNLYNjl2OItWg1r
	rw6zdDBnnFE78bbrEmSbNoaMSR3TdtP/rphCFBgd3M/IuZbx1pqnAwgfRdh4YraYigq3IpcC6r5K/
	t714zO5bBeMRG0vCFu5aqmFmtXAG0o4TiLxYefD7t10bXnmXyNgB2qNY6Wh37xj/+7ebbaqn9QNik
	cgZmWbiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNo-00000004Cmq-34aL;
	Sat, 05 Sep 2026 15:32:44 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNi-00000004Chf-30gC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 15:32:41 +0000
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so1398546f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 08:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622357; x=1789227157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4JskkGqhdaY1l7i1ogeLg1oSPtvCeMbo2iXSDE4yNEI=;
        b=XdAAxAOahwVSkBgcqVL2TGFpVN1rtq0KQQT486AtwZn6Kw+ol93ygyONWbWvSp59TN
         a3FeitT2BzVrQovqeLSGaj+sIkXIXYwRUEF4FmuHanAco9S/1Xhtoa9Ipo4CBK/6FBHq
         8lmPHOuNYk1i3hD57FGxB9G2WMGXBtmNZjM6IMrVDucK6LmR4QnPVLT8kTse2qvGHmS3
         NW6B+8X5PiDCJJ3/KIE4fpb7fLrmB9rkNPwPndPOt+ICTtqixXmCLTpFx8JMhNlZqFEb
         jqZbTVFCZJbpCRs3e0A+n/4T3YK9LhnDQr/oicODQTQ5YlfHfXuNt8R65dg+CQ+kbLIA
         TP8A==
X-Forwarded-Encrypted: i=1; AKwUvBzhudvn4kUQy0poBGQMIj/lZIBfuudcQ/DWq37OfwY7vqeLVNUBopw/sDZchI2nZx5XTsYg16aSqaF5rR0W2Qiy@lists.infradead.org
X-Gm-Message-State: AFuF++kYyshDGvg5tck/1NTpaHPI/JYD8FxRGy+U4FO7tSS2W6X8/Ltt
	WrlYsGivxpYAMO+ONmLgVUeXpMVhG8UBSqzD8WXLElzjmQNGqcdojZyf
X-Gm-Gg: AYBFou0RH0i7G35NjH4IICkhucZqmSTFpLl6XwOkmkwtCBmZhuyYSnLD6ZgDR9g9zPn
	iYx6LAYv8WNDzMmoeYzZen+XMvCTedxKIRj4PzgbUZ0rYiabmJBQBs9mHx9wJ0/WrAvkfJVmtKr
	Ir06FEV6nKSHsxkvagyR9eAEj7f69H/Obx4TzW0FSNt17n+jZxkKGPvYYit6IBVwXnULfAo5P/B
	Ag4tq5SI2Zj2EEba3oVJZBUSVFuqeC+wWdlV2O7ziURYMZBMt25+4rHyWPAqWkeTZ3Ytl6eu0Vj
	AuXhLE0JgMmmuAi1X3euGqF9xaW/dYd2UK11KsTNSHMv1amZe4eJhUopoEc7Kjz6Mt+kRo4IoGu
	78GD6qpRl8IgI7Q6DwtdF1sKiQRx14MTsX6JWZE0Ejd51Z4Mn2WZGYVvVI0BKeD8pv+9+z8Zarh
	WtS1KVaBEs6abBlJ8xVF0CSAb7vLmV0FkgIPRYVILxsIDMQWQeif0PuwwpE1CYJGVnbUgCt0JIE
	4BMESlMtwtuEj3O7ywyV48hv6JpIPj8eXBr
X-Received: by 2002:a05:6000:2584:b0:482:b813:8315 with SMTP id ffacd0b85a97d-485872ac3b1mr16135052f8f.21.1788622356748;
        Sat, 05 Sep 2026 08:32:36 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:36 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
Date: Sat,  5 Sep 2026 16:32:31 +0100
Message-ID: <20260905153234.133217-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_083238_766609_5C4FF0DB 
X-CRM114-Status: GOOD (  12.91  )
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

The SD/eMMC controllers of the T7 SoC are physically far from the
NIC_MATRIX bus fabric, so the hardware design inserts a pipeline stage
in the middle of the bus path to help timing closure. This stage is fed
by its own gate clock and, when that clock is disabled, a controller
that starts a DMA transfer can never complete it.

Allow a fourth clock entry, named "pipeline", and require it for the
amlogic,t7-mmc compatible. The other controllers of this family keep
the existing three clocks.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
index 976f36de2091..12342b1d78e5 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
@@ -15,6 +15,23 @@ maintainers:
 
 allOf:
   - $ref: mmc-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-mmc
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
 
 properties:
   compatible:
@@ -38,13 +55,23 @@ properties:
       - description: card detect
 
   clocks:
-    maxItems: 3
+    minItems: 3
+    items:
+      - description: core clock
+      - description: clock input 0 of the internal mux
+      - description: clock input 1 of the internal mux
+      - description:
+          clock of the pipeline stage inserted in the bus path between
+          the controller and the DRAM. Without it, the controller cannot
+          complete DMA transfers.
 
   clock-names:
+    minItems: 3
     items:
       - const: core
       - const: clkin0
       - const: clkin1
+      - const: pipeline
 
   resets:
     maxItems: 1
-- 
2.55.0


