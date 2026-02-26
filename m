Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09A9FD8FD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 16:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joFWr06FeJI623EHr798LyyPcGvBM73LqMWCNipZMCk=; b=A417D2Z2UGbdRaokfep6oCeFUU
	jRU+nPbdNh4D7BGuQGXW1Ob9lvi+HNtuB9coXAOAAmWamQqt3+uy2QS7C2H8TAVZP8MoWPMHwkMXI
	pNxRwoUI9ZUoc6f8oNgyVF+8PUKJOuS0uyOrAyd7YbNPuPYABFwrDvJFprGgqkYWahMXm2l385OyM
	uT1oDKqvfiZ1oqhrAeeNBoUcN7snAnJBY9Eo9c+zPwxuo+Z3DsY7fpF1Isg+JboSleBob4Fo/1R9U
	MTNcHhhPp7w3DxnvxaUc2T/aglHpP1fdHHRB/N6N2JyGj8ao2RnjSK9LB33MNOeqGmyzmBlaD7LvB
	03o3N+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdzq-00000006hcP-0Dhj;
	Thu, 26 Feb 2026 16:13:50 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdzn-00000006hbF-1Ghx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 16:13:48 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a871daa98fso8224345ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 08:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772122426; x=1772727226; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=joFWr06FeJI623EHr798LyyPcGvBM73LqMWCNipZMCk=;
        b=fFewre8Lu3QdvSZMJuTsUlqEs6EPg8m91GCgtBDIMt6HBTZsGlQAg0TB6epEEZLz02
         gt5GsFa8wBdLN5p9dkYxdPeKk7OFho7sODx8HHL8M1+L4+RaQzF8/8swalTSmxFJK6F/
         L1pSCAjR6Aa7kpezjnSy+ATpTkip2sCsENHbItJuvzeIN1uPMX48che05HDgOrsVnTOP
         f7EkxoiS+fQNY4JR7ihJJpSME4XfdwIUZENse+Y92KGTh72fQ8l2JGsAfh0UiZLzB8SK
         JwFg6gdFHau/yQFHxS3/0z0ejATy0PnXCpqxntELq2NfYpGMZFq5mv+OnFaRRt8T1RHT
         a2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772122426; x=1772727226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=joFWr06FeJI623EHr798LyyPcGvBM73LqMWCNipZMCk=;
        b=LZ5/cWv5FI9sWUs1Q+znzXutLZ3rrO8Xa157q6iowkD8VsAVvOnRN0jVdE3DVr1bL/
         o34rEaqdU+DoTCBM9zT7MKtnnsgdVw/vVLfIEj6xeu2i7OZlbts1AQ6j7snADnmF296C
         8PS6x1GMOyzjqalPVlLRl9ZepNiK4yOsie7AWzjk8XHMngX58SzH9jBjaw5vulZ14SO+
         /MGnGGDaGUPf5mkDf/vSwW/UvYh4U5r0OK2e+HCP34WrNHAY5f+P2/6iSvqxXLuvU/OI
         yVZVhFVKmAVNEDIV+PHDfsPqXOBlMqnQ75hZW456Dhlhma83V4qpYGhmpNy4OORpiIGJ
         26yA==
X-Forwarded-Encrypted: i=1; AJvYcCXfLChH0XZX71AjuEUW8KV6qROhcHCm5gcLo6bo//ZqoVKbqPPfQBFFGzSf9zxXHpuVbMPKXU09n+UpRoAg5gUo@lists.infradead.org
X-Gm-Message-State: AOJu0YzQx28r4GGRzsXUwLgmkLKBEWjP8EqUvv50tHFBfRj+f5gFQPU+
	izj7hf0EE6gKLt61IN3L225Y2wjqkF8vi6ykHnOtAmi/x+EgY9oc46+r
X-Gm-Gg: ATEYQzy+Jf0nZ9nBiMEDdN05Uxq4vhMxEl8VFupcfc7Vlq1SnGx07SuffNrWbv4DxGT
	tAMyoNfw7cE4o4A/raLlC7J3GGMOuS4V2W+RXIP/CIuA6JxQ/+zgTi1S8lTyqcN+Alo8dy1nnnL
	tWyAME6qIJPT/Iw2ANTxoFLH0uj8ADyZyLg/r4dzTVjRw0pI3WM+lQXQfVPZlTqFrpJgtbYCfes
	og3w2NzJt6RPCTLA/pc6V9AhEw4Vy+MgT4x0ykRF77Je1U+x4LGYko+7HvCDjCl76JxBRsWgs3V
	FAhEUqUjYxXqpDhe7ML2a5HMZRpyuvyIbEQjs+X6XuUQEJTswHGHBMiqB+bH5yAFBG8k01UUR6M
	eFnBktiRe9WRZGW1eyX4rzF93WrlecDWmvNGFzUUYgmVAUQao81ARwO0dhUisH1ags8EJMvkN0R
	AI2XZDfPYNz1H6o3FE1GOZsTe3ZSKAEktrpXfmD4V4lEaMCQ==
X-Received: by 2002:a17:903:4405:b0:2aa:ecec:a447 with SMTP id d9443c01a7336-2ade9a3705emr42787935ad.36.1772122426447;
        Thu, 26 Feb 2026 08:13:46 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.183.54.8])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2adfb6a0432sm44384595ad.52.2026.02.26.08.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:13:45 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Thu, 26 Feb 2026 16:13:33 +0000
Subject: [PATCH v3 1/5] dt-bindings: arm: microchip,sama7g5-chipid :
 convert to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-arm-microchip-v3-1-0bda15abd922@gmail.com>
References: <20260226-arm-microchip-v3-0-0bda15abd922@gmail.com>
In-Reply-To: <20260226-arm-microchip-v3-0-0bda15abd922@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_081347_371172_CEB0BB46 
X-CRM114-Status: GOOD (  14.34  )
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

Convert Atmel system registers binding to YAML format.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../devicetree/bindings/arm/atmel-sysregs.txt      |  5 ---
 .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41 ++++++++++++++++++++++
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
index 5ce54f9befe6..4ee18112586d 100644
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -1,10 +1,5 @@
 Atmel system registers
 
-Chipid required properties:
-- compatible: Should be "atmel,sama5d2-chipid" or "microchip,sama7g5-chipid"
-			"microchip,sama7d65-chipid"
-- reg : Should contain registers location and length
-
 PIT Timer required properties:
 - compatible: Should be "atmel,at91sam9260-pit"
 - reg: Should contain registers location and length
diff --git a/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml b/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml
new file mode 100644
index 000000000000..4fdb068be929
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/microchip,sama7g5-chipid.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel/Microchip RAMC SDRAM/DDR Controller
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
+
+description:
+  This binding describes the Atmel/Microchip Chip ID register block used
+  for SoC identification and revision information. It requires compatible
+  strings matching specific SoC families and a reg property defining the
+  register address and size.
+
+properties:
+  compatible:
+    enum:
+      - atmel,sama5d2-chipid
+      - microchip,sama7g5-chipid
+      - microchip,sama7d65-chipid
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    chipid@fc069000 {
+        compatible = "atmel,sama5d2-chipid";
+        reg = <0xfc069000 0x8>;
+    };
+...

-- 
2.43.0


