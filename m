Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F3EC531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 06:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzDl4rio1x0zKV1oZWrhXk8ePWLshifrG/jhvgwjQz8=; b=uVy9VBrtSp0GmXEfnUz3HOhn0c
	lQTYjT0Al1LxfXjNu8FKygWHfmLMY46UFLd9dP+8hOzzfCtcbv8Y85E/cFquFLbfb6q6g+SjH8ob/
	8wtPrj0bmjbOyrPrtdz1YUuyixIFWzbmraCSrIReH9/f4C+x+E9XC/TO29LOOXXbZTSrkObI7rAoS
	dhUSvgSWlSqKXt8dCY8GihjVnbsetsvBqHNL2uHV2Qt9+8VBipQ7wd/WsUm7djkh1YZyJDK86beNp
	GkKO1gPLLLTaSdcVloOtwjwC7esyALPnHzKkLey8spGEuS05hApJxIYWS0/ml/kBeOu8qKgo6twlt
	2NyENPdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmbg-0000000DWNi-2Jtg;
	Thu, 23 Jul 2026 06:08:32 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmbZ-0000000DWLl-3Cdr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 06:08:27 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2caed617615so3101805ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 23:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784786905; x=1785391705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzDl4rio1x0zKV1oZWrhXk8ePWLshifrG/jhvgwjQz8=;
        b=olTPlF/kQkLOLtkZ1zJCR1BYgSzXc/ry8xS16EVWONSj4fB6wyety7JRmy+BvAUeNe
         HLsOeKouEENvOweUsOvO4S3k+eR0pPso+SNm1ShBQTMKJwU4OdFcEqAE1ncaAjHKmaKO
         KAGbpvyBjGU+5ad0zFhDwq8zd59F1DG+BwJbnG2k/2ofRUKexS6aLCPZ8dX4vPF9utRW
         7APVI1BRCjeH7gkZTZn73LVsXPNf1/40wm9LITiyJu1zoFuuySECvpvX1ZVdzatyQ6Mq
         k0LOME/6WWTIXJ6lqyWg6TGAmaj/pMndngI0an+St1n842nHlAMeK8xokKZYGy90zKRv
         79kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784786905; x=1785391705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzDl4rio1x0zKV1oZWrhXk8ePWLshifrG/jhvgwjQz8=;
        b=U27/qMrVXjSsZx2rzpqeDQY2X9e7VaEkwWSG49i3jPYogiHiV6v7oBaXSoM6IujP4q
         6AJucTkRvyIA8yQ+uZ3LxBPGZCeZrXlcBolp8/L+xHaqz2Wc5nNZY0RfLe7xMyaEz6PG
         rjy8oCFYcOmaJi5MdnsNmDQJDYBli9twrSelRzwajUbslolLLAb9vlakNtzr2aWJSfe5
         lDmLeAO+Fz74Lzga4asRMCUXa23OQ4RjB6QnMunqsGQ6zletr+ix6tTQIH1tSqLHyQgt
         vQagzRUVg+8XCHDEhD+m/Iwa3dMMPrA9VxTrPsN0D1xs6PL81uhkaOE45OSaY+e0+Axw
         Tulg==
X-Forwarded-Encrypted: i=1; AHgh+RqbkTlSyc+K6uQayDb1yVGcTzIjWJbXUav1HAjGXvDj9tZQKGffB7o+gk7NQeFwyTRPNhvHfogJHZ+r1DOgL7mb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6g/Gb+If7tYIPCeXEuDzMgMooXIUvK/1C9+/ifY7AP8gBSQyY
	j8VjzPehvE1nxLLmdY2lSyUZTASgRj0ORQrAI/Kms1IFKP/jjMZyVvae
X-Gm-Gg: AR+sD10OCuRXMNNXAie6OoMw0aar7QdLk946ty9GABtXb6ETsuUWruCmepe9Wzfwd5t
	c6Eaqin0UYhNNg8DnrvOQSSTQiXQxf/O5pKqLDU6ZMT6ZnY5HklITfTcD3WMFsmkC7esHXNjn8b
	nsxrBfySg7EWQ6/Y9Ct39ne2eIANW4vAxfdkpuqcKtXFtTybejWYDR1l59E1cLN3zBde1fdrj+M
	eCDxIHy4Gv2zICXMzjH18W133Y5MvETcUo6VXN42dVRkOxFBzQMoZyoIN3m98HPY0DRiHuICdwm
	S1iRw8ALu0Pv20quE3y1Z9o7AgXskBXKAw5JhpnlJiDKTL5W3I7L/nvGQAHhPIpp3/fddZ9+Ion
	j86PNHDdvKqczBRQOFg/ECU6Hp8ZcFn4llHfzwZkdOFfX5w/NRhtDUlLWjY9FLdrE5FY5Ylnx8G
	C690g0YrvbIkUKuHo4RW1iaRBwqYg8uWTvSdD5MBaS32LIygh1D/lBsWni+Bj2
X-Received: by 2002:a17:902:f68b:b0:2cf:32bc:971e with SMTP id d9443c01a7336-2cfa6c66618mr20561685ad.29.1784786904767;
        Wed, 22 Jul 2026 23:08:24 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm26071285ad.79.2026.07.22.23.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:08:24 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: watchdog: Add MA35D1 Watchdog binding
Date: Thu, 23 Jul 2026 14:07:52 +0800
Message-Id: <20260723060755.1596858-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723060755.1596858-1-zychennvt@gmail.com>
References: <20260723060755.1596858-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_230825_823253_0006CF26 
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


