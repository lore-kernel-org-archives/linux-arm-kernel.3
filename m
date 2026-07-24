Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47587C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzDl4rio1x0zKV1oZWrhXk8ePWLshifrG/jhvgwjQz8=; b=x8zTi9e14vmPz7UzLKlwAGNjpx
	QwP1yIDqP+SJ4g8QKQXjNelmyiCPZ5To+vY0WIizA22swTVNJ9u7kX+y4KHRFQqV/iRDmWlI/DT1z
	b4HkWxgHp2EF/ZNaFhv9cvdkvIL9DUKwSFTz0fE+KVbk62ha0BYP2Iayu4kU22nY3UopOa60O9xdw
	NzoWVXo2JavrAwXPWEfiyQkJl7DMGnSVfR+8/tGEB+O9+S+xOCjEkuktuaPmkX+pAiANgxrw23d4M
	NPYZNt7fI11RIf3uGDZ4FsDid6Y2MP/0oIfceRqtD+IrkOW5wOEtLwX9iuirvhlucEdenVYNOzMU0
	6okZ6x2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBzw-0000000FwWT-06CR;
	Fri, 24 Jul 2026 09:15:16 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBzo-0000000FwSV-3cBs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:15:10 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8485b358552so204414b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 02:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784884508; x=1785489308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzDl4rio1x0zKV1oZWrhXk8ePWLshifrG/jhvgwjQz8=;
        b=L6eerFM6uIkE2ApeuOIVGN8XhE/OxwzdtYKTn163tRw0r6BHTq/HgKCnqa8ElqBvuu
         QmnDjHsji/Sh4TIR2xDwWN3W0VtnS84K8AS0CndNZj74psdFbc32EtUBqBoiEW/s+kvg
         Fd+XDEBKpw4D4RpL9ZA06lw5owqaV7RbC9WIxOg/ZKdbcHjYcA53LIACjYa5pvYa2za6
         wptC4Xfka2RLB19gCAwhptIDkg+UgWV7N1ffjy66m/TWba1kT3T4Yp3UOAiLWeYCMzt4
         5pA46NTfg+H9jfA3lFuD6LUvJ3P3mvyvVe2CsBcKQhWO0zyrcQGUbAhq/Ok7jCgntgzr
         WBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784884508; x=1785489308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzDl4rio1x0zKV1oZWrhXk8ePWLshifrG/jhvgwjQz8=;
        b=AJ5obR5fl4GMGfEGRn2sgYFSSHQ3k2DdpLIuRAuwTjy0dketpzcpQjrK6QT+WhlVUc
         5J8cc3EHrBZlzTQDEq1ALY+VCKzm5KVWc4nzgzO0cXS4mAkDSu5hbHK/DXGErN2FnKZV
         RJ0VgCQhDa3327Z2GA9n5ZtFVd3pTTkeybrmK4IkkRTcQdEkIfvoR9J4iPclTAAsf29Y
         /eUwJUSZpwjP8KiKe14NkQvkVwUwibDhsjFazPSaWDDPQ5Gm/zgHHd1pRs1K4iHU2HcM
         uYm6MfGqLDn6njZIhDTWnUhtEx44d+/bWy4gwktqkYNVJNzoqsU/ApcYqtrjKHoAdh6A
         FjtA==
X-Forwarded-Encrypted: i=1; AHgh+RrgkLnOUieulydV61WetdoX4GV189oE3/36PY4LQe/B9046DhuL7NbmgksQOBcBTYGLTQ+LuTXW5uuyVTSNcwiz@lists.infradead.org
X-Gm-Message-State: AOJu0YzkrGDl7axeu3kEQjF7KhXYnWfruMU9QT3vnpFGBNZhLpZhrEQa
	P7+b1WuSnaUEHM8vNZ/YLNYpG/ZBFQGfidWXdR340RbyU93DcZplAtGN
X-Gm-Gg: AR+sD13ekker1HZHXK+s02+a4+cZoXckXUsLMX/kNPHNLPv5E/FqdiVUsU9kkt1pHME
	S771cy6mFIaZTfne+reAfQD9Nh9lnKFvH0i6BKZHV0yDP9Q+dSGgSB8G2Oh2au6Fy3rYirIPVJ6
	odhBlD2U9prX6+qXKJdD40+M20w67/7Q7bpMXkJIDH5lIbdvSVQeXmVepl9yyfhclAlmtBwWE49
	6A7ejDCphZX9eetFeI0DgfJEyGQALXli/GqUYzrAjvwiOaLAKMc27Vi3PIo5wGAiysR495YL4Px
	PtHN5vHDglvKq6Izx2HSIS5qZfKAHBGo+3vMgdjsvA74lNy5nNregvP/g442l5sRuKFvcj5kjgV
	dJej7ZbDJLKHQLYB9lGSG24G/UjuGw+g6abgs0rOP5s40xbM0y4Xo1B062Iq1DMzfyMMC8l6Nty
	TbKdc994btZziZJXD5aa7WGFRQwTwXcgBf9ujPvcgkYzyZOtYLoEXHl6mSopEi
X-Received: by 2002:a05:6a00:1797:b0:847:968c:a0f1 with SMTP id d2e1a72fcca58-84e2c1aa5dfmr7625153b3a.43.1784884507987;
        Fri, 24 Jul 2026 02:15:07 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237c3fsm4410519b3a.9.2026.07.24.02.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:15:07 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: watchdog: Add MA35D1 Watchdog binding
Date: Fri, 24 Jul 2026 17:14:25 +0800
Message-Id: <20260724091427.1689980-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724091427.1689980-1-zychennvt@gmail.com>
References: <20260724091427.1689980-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_021508_917780_8AB486FC 
X-CRM114-Status: GOOD (  13.20  )
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

Add device tree binding documentation for the watchdog timer (WDT)
controller found on Nuvoton MA35D1 SoC.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../bindings/watchdog/nuvoton,ma35d1-wdt.yaml | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml
new file mode 100644
index 000000000000..aced7d77a7d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/nuvoton,ma35d1-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Watchdog Timer
+
+maintainers:
+  - Zi-Yu Chen <zychennvt@gmail.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-wdt
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
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        wdt1: watchdog@40440000 {
+          compatible = "nuvoton,ma35d1-wdt";
+          reg = <0x0 0x40440000 0x0 0x100>;
+          interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+          clocks = <&clk WDT1_GATE>;
+        };
+    };
+...
-- 
2.34.1


