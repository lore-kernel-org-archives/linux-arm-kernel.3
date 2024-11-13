Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEE8D41C1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 09:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEgoAjBfgzailS1tISV2BNkAznvBP4wgjOEuQVpA80w=; b=SDlNafSjobr/MQDDs7m2zIyhuy
	ToHuh5PfHHGSw/rBNoOop3ekICZpZNquVndNG1D1hcIOvigqVYGME1DDdynoGrZ7yq3/HgPUHTbuq
	0RD83CuPaJDh3sF1HmyXjBeN+VieneMZh8J4jD64Ckuk47w8O3rhWpEZsngGzXm9K9jo0IltN0adj
	i9wjDhkS61uX7EOP87SjhY4sXRaOzNjUxE7fi9rW2svGcLYknWa448N1xR/L1jWIvyBUQfBL04c3/
	98AJQjFa0RpbfzakiMxb4ygSeHFZ4E6RDutBhwLPiIb1M+dcyJALUX8lzx2BogQJTYewRL8rHhVuY
	Ekuky4OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9LD-00000006ByB-3J7H;
	Wed, 13 Nov 2024 09:07:11 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB995-000000069vT-3I5F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 08:54:41 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71e4e481692so6513283b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 00:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1731488079; x=1732092879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEgoAjBfgzailS1tISV2BNkAznvBP4wgjOEuQVpA80w=;
        b=CdU6gKK1dReDeR32GzXQTuOTz9ibJXy0pAm6Kq0oanmjAJ0/GTeCWVz5kVCeQDPHrs
         q+qNKjOu03qq+Dmh9XqliDWIO54gGRgui4ZrZQuiBNq3TtEP9ZWy1ua+RrzbKxuGphDi
         QUjZsYq6ldnv64RkhMxg8xqeo5SteOvALRvbUidK/QWq/63Zw+CWt8mdx4fZvcwkDYSj
         Vf8KKPcY0GFS2XH1r9eGE3Ay35kNydp0UW+oxUk+K4NhqMKy17jPjIUEx1PjwDzFPWyu
         gp1fbTaqFww6UZI9ldcVJ/MBmjTtATGh4i2+MsiMxKr46inswgHyda5x7YTtGfrCSf4T
         RrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731488079; x=1732092879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gEgoAjBfgzailS1tISV2BNkAznvBP4wgjOEuQVpA80w=;
        b=lr1e4pcDhKrlof+0glhUmKmkh88UpmEG7X+FUYRPM+ZyMCl1reHuK8Bn7qGEm4dvUX
         /QGlcqFdLjmj4uPPjeR0bAx0CRqcBnsG7o6MH77GRqFGXy4uLMnrJpLhxiaAuLeiyBsZ
         0Osa59B0CCWxtTlTKzs1EdOPsdJzQRNPbXaEXX0ncPf1GBuXyJsCYFEVNrPprzY+SxY0
         txN0XF7mSOPew+H9VbBDlptKGn8QYvfUFa79yQGADwaWP8RQe/BQDBJW1yag9h3bPY59
         nhx+mO8z12JJO3yj+wSSOeSlrNHzlygOVFxAzLF4LzSSy1KrT9YfJNqHr2w+P8hFjkAL
         1XIA==
X-Forwarded-Encrypted: i=1; AJvYcCUHl03bbJYS0SJASNGP/AdaT6MqF3UAF1RKYztK7smzoQ7CG61p87WwFCyB4iTE7ECf2XwRlsJTbSct6ozFN7kg@lists.infradead.org
X-Gm-Message-State: AOJu0YyezEKmW9vv/LjEbcaSJtjFKjxpz8m9R32G9Ik6wWi++X4juFDU
	Y1K1J7LQRbopuV8qnHgsR9JE5cBQalkVcJpz3RFwiSgsfnjr0YmMbTOa4vBl
X-Google-Smtp-Source: AGHT+IFuU4Y92FgMstRU7nXxKESV9IJYwrxKQT0+60u3aaUl5uG63Ptgsvg/YBluwzd5Pns5l3wnfQ==
X-Received: by 2002:a05:6a00:114f:b0:71e:b8:1930 with SMTP id d2e1a72fcca58-72413380e98mr26240502b3a.16.1731488078719;
        Wed, 13 Nov 2024 00:54:38 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:a83:68dd:5f1c:4ed9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7245fe8e286sm317379b3a.16.2024.11.13.00.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:54:38 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: linux-amlogic@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH 5/5] dt-bindings: rtc: hym8563: Remove hym8563 binding
Date: Wed, 13 Nov 2024 17:53:55 +0900
Message-ID: <20241113085355.1972607-6-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241113085355.1972607-1-iwamatsu@nigauri.org>
References: <20241113085355.1972607-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_005439_849959_C3EA227E 
X-CRM114-Status: GOOD (  10.49  )
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

The hym8563 binding has been merged to pcf8563.
Remove hym8563 binding file.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 .../bindings/rtc/haoyu,hym8563.yaml           | 56 -------------------
 1 file changed, 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml

diff --git a/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml b/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
deleted file mode 100644
index 0b9f39ef0edc39..00000000000000
--- a/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
+++ /dev/null
@@ -1,56 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/rtc/haoyu,hym8563.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Haoyu Microelectronics HYM8563 RTC
-
-maintainers:
-  - Alexandre Belloni <alexandre.belloni@bootlin.com>
-
-properties:
-  compatible:
-    const: haoyu,hym8563
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  "#clock-cells":
-    const: 0
-
-  clock-output-names:
-    description: From common clock binding to override the default output clock name.
-    maxItems: 1
-
-  wakeup-source:
-    description: Enables wake up of host system on alarm.
-
-allOf:
-  - $ref: rtc.yaml
-
-unevaluatedProperties: false
-
-required:
-  - compatible
-  - reg
-  - "#clock-cells"
-
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/irq.h>
-
-    i2c {
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        rtc@51 {
-            compatible = "haoyu,hym8563";
-            reg = <0x51>;
-            interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
-            #clock-cells = <0>;
-        };
-    };
-- 
2.45.2


