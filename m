Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE86C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 10:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDb3hqU7jJKVLjFq2h/8fMER9K8L+cMIXZuQDwjMPck=; b=hdyyoglOXU7Rvc1+BJ2mlvCaTo
	/K4ozzOWWlPsKvpAh9SP/ocbbwZehibpszsN0XLB/XbyvUWbRAP38bH5dPmqRUyez9xblPaO08HxJ
	7pAqovJE9csB+D8lIsyx6CQr6SL8XWy2Z8dBzRv/lkzWQ8fK2C/x7O1hTCcHDWZCttkoaK4p9sRxp
	klhroU2ePAikjbXkIVVVJFkPx/yjy/nKKZACwx6Nzdu4Z7gooUTAvcAs8BzGhfDejUT3a6Nlfck02
	DTu6xj/F8im8lk+ooZ4+X3IwM4UaiV4WVDMpTj6XQRtwWNZIGMkQ6c0Or0GykrpwMbyX0hXnBIF61
	Gt1epQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm66-00000007hqe-0PQK;
	Wed, 05 Mar 2025 10:35:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplam-00000007bXy-05Ft;
	Wed, 05 Mar 2025 10:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=KDb3hqU7jJKVLjFq2h/8fMER9K8L+cMIXZuQDwjMPck=; b=jbf4IF/mu2OEHCqYK2zejFsPKz
	P/Gg6Q7rRgV2zoxY5UiuSj2dIfVEKhdSP9TphZ/vjT+EPm2XWcYTRCfQZt5bXfpSKza8rwfoeggl/
	yxZVJgnphEDa0vA2BdHNgYSqeXgEnO3syG9euJ9Ag49iBkwEcoddP/eKHiD5z4lwFsGVgCLGzjOQx
	D5j8c3VTEUVBN41X1Oq3pXxErjKNbY3Wl6VfBvLyuleFwg98dEScOQYWJyCf6mLQQIkh+B9ETQQ64
	qOqNIC/uFtJFKdQu2ENIZ+hd4QsekPSdDgwP+tKFCgfQRg2FDXigL+LbHlKnHhWYj872StAGtJ5tE
	fCwB/gwA==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplah-00000005FkC-2YmV;
	Wed, 05 Mar 2025 10:03:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DAF55A4514F;
	Wed,  5 Mar 2025 09:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 464B4C4CEE9;
	Wed,  5 Mar 2025 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741168979;
	bh=PniLbk2hKDobEfmisijscUi423JhyWI4OpVr06F9f6o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Lr2nwsWQjAe4cS/eWfy+cqMUNjkjpefNopzCGVPIP8zvEDjOn+bDMcdpmsnnMj8aK
	 ip9tiLmsyh3rALrLHjkeWL3JIHvuPQqjFe6wNeulWISTclXbCx9T96bCd3gT0CFUsi
	 iBxVdiQG85e4hNRDSVBmgu7CiTpVMTcIokeqMc7s1+hRo+BwciarhB3Eead/IeJM/q
	 m4jss4k4f1k81gEg5rZ/z7Dw9i83GmCwkLl5oE72ntj8R3a8xjYiWAK+LAjV0O1C3J
	 5yKrUouWB94QtHVHORN3AUIJBIL4ZiuP48AJS03WNIU0rYDGO44Ou12gO01HC7EaLh
	 yfL5sZSIwr1Hg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E558C282D9;
	Wed,  5 Mar 2025 10:02:59 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 05 Mar 2025 18:02:56 +0800
Subject: [PATCH v3 1/4] dt-bindings: interrupt-controller: Add support for
 Amlogic A4 and A5 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-irqchip-gpio-a4-a5-v3-1-1eec70352fea@amlogic.com>
References: <20250305-irqchip-gpio-a4-a5-v3-0-1eec70352fea@amlogic.com>
In-Reply-To: <20250305-irqchip-gpio-a4-a5-v3-0-1eec70352fea@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741168977; l=1783;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=OtlX8UcJ+H1FILMyJjS4Bk1MwFvAcPTPGY/5f/EGqhc=;
 b=4wZeRoU6l7Aj8hPhoOsLF5THFXD8UqzSXyDROQXOoEDx/vXtMbkGDyO5kuYWx1z6El7eCqUl9
 3vjbfPxwPt1Bxr853P4Cj7wfw/2NEhT2n7CLT6izVvjs4qUVMVGnvDa
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_100303_799325_006A8089 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Update dt-binding document for GPIO interrupt controller
of Amlogic A4 and A5 SoCs

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../amlogic,meson-gpio-intc.yaml                    | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
index a93744763787..3c5853c71efa 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
@@ -35,6 +35,9 @@ properties:
               - amlogic,meson-sm1-gpio-intc
               - amlogic,meson-a1-gpio-intc
               - amlogic,meson-s4-gpio-intc
+              - amlogic,a4-gpio-intc
+              - amlogic,a4-gpio-ao-intc
+              - amlogic,a5-gpio-intc
               - amlogic,c3-gpio-intc
               - amlogic,t7-gpio-intc
           - const: amlogic,meson-gpio-intc
@@ -49,8 +52,6 @@ properties:
 
   amlogic,channel-interrupts:
     description: Array with the upstream hwirq numbers
-    minItems: 8
-    maxItems: 12
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
 required:
@@ -60,6 +61,22 @@ required:
   - "#interrupt-cells"
   - amlogic,channel-interrupts
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: amlogic,a4-gpio-ao-intc
+then:
+  properties:
+    amlogic,channel-interrupts:
+      minItems: 2
+      maxItems: 12
+else:
+  properties:
+    amlogic,channel-interrupts:
+      minItems: 8
+      maxItems: 12
+
 additionalProperties: false
 
 examples:

-- 
2.37.1



