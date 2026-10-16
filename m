Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88676CCA463
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=; b=I5r/TrAYus16ruJGR2yPigsBpi
	iMk01La82A7N4+PzCRJAoRz7A6P/LbJ65zyAET/fLjI9wfpExNBvQq8Et9DFQXzKmKg/jIriwBdFo
	LjNZ/gmjXjuYMXDoUshNyLdR/cAR/C2Y2hUwGJLah0I6z5mBVKGRCH2LAuEyJbHyudHq9+PKQFk62
	wPUSP8HDfyYerlPKxcrHDYvO0g+Zg+nXp3kMEqgARghf7TGdCMHwbI/m4xqSoNoAOd+lyIlvqksx9
	8k9eQ54UAPhj9M9xvB/ptgLSmj6zB4DTp4DiVw4pltB6lQ0SM4SVdVzol6D6UGfWbmOzskAdEWBXb
	1l4UTnyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWNs-00000001f2J-0EG0;
	Fri, 16 Oct 2026 01:05:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWNn-00000001f0E-3XJq
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 01:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=; b=aT4FR8syKSOd8YLfhc1ofJsLHf
	MRr2wXvTsrqAJDjNqnFG63+PkR0FL9sgrrsW+ShwQfD7hm56XGWRh5NpawPxlEbSXAqUnkwj8ewr3
	lltrkacQDAn4y6NxhQgm4JQLScwgXrspE1yo9ePGxiXzep0ljmy1PJxrZh64VtsKel0P2W0+vOMsf
	rx5XN+Oecv1r037c2NkuGlM5xH96zMAl8BR2URaZScbMTtyFIJWWeoLCX0f52LWwUKN8T4VpjeBHL
	6mZDd4PuXljOTKPEUCi6FQJ/gGnpXZffUDk9i3Yh1OqeJNtSy1Kr4FS+RElTMEWpaCvF/uBR3DdJX
	nb06GDvg==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHWNf-00000000y4f-0To1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 01:05:14 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-89e018e466eso958169b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 18:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792112705; x=1792717505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=bPo2rkWzq5TKQJA4ik+As37fHIsM4v0/MQWg6Wd+zzGytLvzQMwXgaPofwmO/rNxIJ
         yo729EDUXN/M8dVDIYcypfwA4WpyVqiwf8LnSXTMqTR/GBmXOYcqILGV9fTZJdi/NJgT
         i1unFYjJQoRGWXu/T4ba/rFNKz7FqiuEGI1PjzTwhqWj511S2O7yHWiVTXxBt9fKs+aq
         0YJwWnu4Fvslvxhi82Nlou1GRGaCLbkrlAHm6Yzchq4SXuog62DgExprpsMNlY+xLCRB
         OeBpu97va36i4rHKpJK+/nZzfZvmlO+PpM/ohu6crvGu9My5Vs7CkCorApCkwV/imMIZ
         T04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792112705; x=1792717505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=Z2N37RP68SYUx+G1U/i4fIKLBJgU71Ox8F87l7xTrksvW4t3LkZsFUMeQ15YpXbzc2
         aARe4XVtzs5CxXNN1adQo5WsfL1EN13XYVToGQQvyxJia5AGHrK5ttc2Z6Klcm0B0CQB
         Pq/njlm2u+fI7KasH/FnzzhbbpMRIs1yMS18T/YsTFFkQFrFsFWSy+e/EFz1Q++KtXYN
         kCwGsJuhyi6Bvg3gaxCvYLIWEEwLJnDftX2trMcBMCzJjJW7o6TN020OdzeaACPmduj+
         0pKvJWYnD1sD0WqJH9GkeTiI8MG5bT5m0cAco2SxVjsRsQy+sk1/IYOTudjqGZtkyGj3
         uWHA==
X-Forwarded-Encrypted: i=1; AKwUvBz/pLcsUdl7tLvbmOCovXdyyLKrr8kwZLHqLwre1rKAsTt1+vi4bhomRhHOS44l9QHGds0Pz73oJOka58NktW6p@lists.infradead.org
X-Gm-Message-State: AFq9FYJUw1qPApXqPCGJymIulizpNiz1WS+7l0FOi7qtJOugiESjlaW4
	Wboi5LZoviMNYZNFU+WuEu+yRtwuOoksoL4WJxep9o8lVbKulj3D9Vom
X-Gm-Gg: AYBFou0ix2DI7IA+Sm5Q9qn5RoNKRNrhN6iYdL9PGjvolUgERs5o1R1uMO6GSwbA/rS
	Z9nm37tJlVKD6PTILJnI+buW7M4fDSZRotZR4fiKJg4r/eD0X3+tWhZh8zbinPXkPBXUiRsLOX3
	2JX++jvipkJHuZmFZ/2Juhq8Ck7djwhSrKafmUUKgv9Gf1v9tXmRyFbEI5C3hIUxbctKzLAmAmB
	BhPVT3HRfwO0awSEAA4J7190MrU20j+sO3eyGgSi8kv0RDRuv+7+UivrA2aW6DU/SCJPY1KYKir
	7730ZGnz+QQjT4WyPT9r6kCyWl0IE1fSTQr8r6WvzNzpKZnbzlDBUd3cOwCVVRBIdB92uZeEfRv
	a8NYlZpQSK1X8Wuk0teW7yVCE1z0gwE3RloVtnGG9rlFK1Co2wWuAA5kKPYvnNYRP37BlZTII7f
	zfXnPiRxPsRzZkQiWxIT5VAgOND1b8NRTLvP9nFGEebBFEzWuTM10LrVVZRFtgLXgbSpevKug44
	0kFB9sRamJ6g/GB2+TvqPa07jhtz4iCKxH3LWk5fr98X8l+XdqWccyR
X-Received: by 2002:a05:6a00:983:b0:89e:8423:6863 with SMTP id d2e1a72fcca58-89e84236d2emr3324731b3a.37.1792112704665;
        Thu, 15 Oct 2026 18:05:04 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f5735e513sm302821b3a.27.2026.10.15.18.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:05:03 -0700 (PDT)
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
Subject: [PATCH v12 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Fri, 16 Oct 2026 09:04:46 +0800
Message-Id: <20261016010448.324856-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016010448.324856-1-zychennvt@gmail.com>
References: <20261016010448.324856-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_020512_209989_90B44B8B 
X-CRM114-Status: GOOD (  14.53  )
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


