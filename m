Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3918D78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AFVILEGG6inA8zYmU/doFUBGD/IkzUATf3B1mIzQMQ=; b=yv7lhalf+BKEi9XRK/WPpHzl6B
	MzCFrCsjY6ZwRxbDGwQ1dzVEfxPWyp5NV7hPeQsLQIq2VMuC9P6rNo1tvL1HI17M15M8oYuQdO3Yg
	97f4HT2XRXT52EIp8hbHK2XL1g2a3hYV+eH2qYDkxhOUBWx5qUSiEMAynxMtuCc4Bfnx3HPTGPz2o
	zsICJ4fBjVQWaEF7v6TNUOBxT8Cuwg0bGyg6r/hVhDPqBG/nf2Gsmk4UsBTrrG9vbJBIf8NNqdVt6
	hHQuCRm2JlIiNHAghCeEO4gwEZPTmLjMLAkvLY2zlwII4gb3cCTFQF0N2bbOKD7TcSy2j6vt6lvu5
	LqMyaH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7aD-00000006U7f-0mfp;
	Mon, 02 Dec 2024 14:39:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7TN-00000006Rss-03Rj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 14:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7AFVILEGG6inA8zYmU/doFUBGD/IkzUATf3B1mIzQMQ=; b=oCxVBge7PZN75iA/1xWi1IU7XE
	WR17SzWAYD215R1yA6PM+kbkhDS2ageuekt95+QPu/JEjuf42AcbuyTRVBPKN1dSxtPqKQJtl/gp8
	ko0hA1Nk3X/4abncODIXX8al7CMkJm3+zJun32h7jcnSFNviPBQyAPbsrKozp3sq8O3huhfHlt8Y0
	L9DoFNeJo0Ze5/wqv2wPeRKbf7OhMkHGo5UF0wiwao6Vh6O8cr5kPXUM4ujVQTjNqwBYFIVL+0Qaa
	9QjbaR7ZZ7JHAkOHzv6xWImTypD87wrL+yzoQR1h1MhtKzor1hlc4VsGttWYvS+nWj05hEhIn2yPn
	bFg0hXig==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7TJ-00000002BD4-0EXp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:32:23 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385e35912f1so1749434f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1733149937; x=1733754737; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AFVILEGG6inA8zYmU/doFUBGD/IkzUATf3B1mIzQMQ=;
        b=GmmjB95cgoDUQKTodgicv9m6o1Fee5fGGG5+RIjdC2xUY5HiFHzppfFiuSVFE1fsDX
         fLSFHWK+nC/9qDm3d0W5SwzCjrE53/ApYJep5IUMhRvyCnaXya4T/2TcNCccTcLp4lXU
         0VpJn+bQVIDqSxp1K3HpfgytybaTLEcQtlrzii6yEFcQ5FrYCAA+sI/LFO6NTLnQUxLy
         uNO9udUWiE2bZmIVrQ09qMboeSAC9ZTrBXd25S5uv79Vei2t4qz4cWfjrTnjD3YgddB9
         dfg8qzZ93YCPwi02Tq12Bpx0uGHfGebfvcRgHzi0BxlV84cbuz3qet2uK2NUcHU4mr43
         RUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149937; x=1733754737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AFVILEGG6inA8zYmU/doFUBGD/IkzUATf3B1mIzQMQ=;
        b=uAViIPITC/Wod/FkuUJJOhJl7PhfBVZS7fIdhSgfV0ECskZAtuTRBWtVcMN9eJCPPb
         mkZ3+YJrR7DDuhPvwMDqHkbwGAEU7WzzaAJ/z8wvsjQ9fofsQhSzmXcq/PQNxAqee9Uz
         6aPdIeQRGdZrxfPWiUsGkmjfHVzxUfPuiY/gwXx4fKbdyV9sgO2li1/mdRrZv+BbrYPY
         4h7un1fupIYLkbx6dUR9CSF5huFdeLTPelfnvStV+bK5B8ZpUzio/q3awrtXxNTiujDg
         ldns/490vGl47/9hIQoJPwhwFC4bIqROdDqLYCO0Hi0jUpREsH3jnlDot7xlWASxX6rl
         P/sQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8ncx4Z5PnYiusl5v1EuuzCs6S2X1Tj8JtbiqEbkepqrO9W5RMYYUxlObboOxyEY5jciDbaw6WmM1JdtEtLP95@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/j5ZROtni+aDB4sEh/D8AFv92YgPRYBlxKKArm5jyduVJ4gtz
	h7ianKCzwZ7e6qZt00HWfe7+DDP28cqByQiYBIfG8oGNml/m/EOMsGIDyIMZOJ4=
X-Gm-Gg: ASbGncu19twsAuQs6o96cZw3grDpVPLoAuS1blUMB5dfs+Mbz9TzVbC5ZvmzFBr39Oy
	SIzDH2KqBmpAvLv4UqEXA/NsdbOfqsu0zc7tm3ZPosQZfZsWOfbEO/BmPFh9dp+uw3PvlV0g2wN
	HzdOaN3L2IAQLlgNH4uAwc91jJ8rBieOLl29PQlJL4/EJa+an+RvbhoCMRmkc/Kke/TyhYD2nFc
	dCANz9svMGuV0DKkpNExVavWRNkRM3Othzn2Ne8/g==
X-Google-Smtp-Source: AGHT+IEh8wUvPPp6fmiu8qi70G2dLIyR2cy0B8DQH6XpxZjumKSN1WVLLU9bXrhtMfH6hCylA9amQQ==
X-Received: by 2002:a05:6000:4024:b0:385:e4a7:df07 with SMTP id ffacd0b85a97d-385e4a7e08dmr6305010f8f.42.1733149937090;
        Mon, 02 Dec 2024 06:32:17 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434aa74f1e6sm188429555e9.9.2024.12.02.06.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:32:16 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 02 Dec 2024 14:31:55 +0000
Subject: [PATCH 2/7] dtbindings: display: Fix BCM2835 HVS bindings for
 BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dt-bcm2712-fixes-v1-2-fac67cc2f98a@raspberrypi.com>
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_143221_208213_EB9F19B4 
X-CRM114-Status: GOOD (  10.73  )
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

The previous patch adding the compatible string missed out that
the number of interrupts and clocks changed with BCM2712 too.

Update to validate clock and interrupts for the variants.

Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 77 +++++++++++++++++-----
 1 file changed, 61 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index f91c9dce2a44..ab59edbcf32c 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
@@ -19,12 +19,13 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts:
-    maxItems: 1
+  interrupts: true
 
-  clocks:
-    maxItems: 1
-    description: Core Clock
+  interrupt-names: true
+
+  clocks: true
+
+  clock-names: true
 
 required:
   - compatible
@@ -33,17 +34,61 @@ required:
 
 additionalProperties: false
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - brcm,bcm2711-hvs
-          - brcm,bcm2712-hvs
-
-then:
-  required:
-    - clocks
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2711-hvs
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Core Clock
+
+      required:
+        - clocks
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2712-hvs
+
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          items:
+            - const: core
+            - const: disp
+        interrupts:
+          items:
+            - description: Channel 0 End of frame
+            - description: Channel 1 End of frame
+            - description: Channel 2 End of frame
+        interrupt-names:
+          items:
+            - const: ch0-eof
+            - const: ch1-eof
+            - const: ch2-eof
+      required:
+        - clocks
+        - clock-names
+        - interrupt-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2835-hvs
+
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
 
 examples:
   - |

-- 
2.34.1


