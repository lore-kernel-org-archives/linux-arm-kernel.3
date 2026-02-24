Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47928F3C986
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99LbRTcDkRWicZEnMyvbA1VmQlow+Wr6MpOuGjNeRiQ=; b=bQJnQPpxtqpnvbOoia+3RIFGf0
	UcXNrCnn3zsdNQH5/N2uIHTPzCj8HmOj2OsCKZW7mjrsnwfvPxFgo0CjuQ3Xo6vEdhotzrFg3Lmd1
	pFbldVr5ZA5Xtab0oKdVI+im07vDXgeDd3UOk1lZRT34sPEuGmmzorb+Xk625zlstjqHyCrJPi+7o
	Y8yJsQKvRZeEl1CVz/4oaeoP0waF95F6PJvt/uhjhG0nHoMTfTIJmOP22IPjM7IxmmRVSdLrPs1gc
	m1G9EIe/nfgKyPvcnsnl7t6JM+tHidloLiG2C/5WD3ypbu4ZLt/lqKQbvfIO5uRES4WssQERGyNth
	srXa33Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutgn-00000002GEy-0WcW;
	Tue, 24 Feb 2026 14:47:05 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutgk-00000002GDy-2lTz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 14:47:03 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-824a9348603so2298213b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 06:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771944422; x=1772549222; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99LbRTcDkRWicZEnMyvbA1VmQlow+Wr6MpOuGjNeRiQ=;
        b=JqRF7F1cG4Zrd/PLDypxYmEs5nj0lx/K1R8FK8TLKQqEq5DbFTer9y67U2gaIgeN3u
         x0xW9RDm4E0P0DmG1l29xktjd29TwL7uswPX2JvKIRyD5kA2X9tJDquHjPNqONf+c4UF
         ZE5aiKJ4rQ/LthFGaimN3X85fmL9/EBG6DYWzW/3RQwd/UuYpEqHP3bfCvfqw8jQWWDL
         9KdPtTki43ruxYzT1xs7plKxPJEUbgM3LqMm3YmuEUdPgnwb1IBYLhMrkl4oQvM5K1Aa
         rfLYSTrzvT0md28TSsIlm1JvkpYm5+CiGoaUF3tvR5OX1qIsOLmFuVo1oSr8zdbNm2wy
         kAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944422; x=1772549222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=99LbRTcDkRWicZEnMyvbA1VmQlow+Wr6MpOuGjNeRiQ=;
        b=qdwfs0pmfi+5v8zOs6sENVVHnW7rA11psgJXTvRa2mMvjLLHisSvQBwoKtio562t43
         eVzKupdVJj84gpx4LfXENpdkuKvU1tCscmUyyGhzngXitEUfC/nGrIPofEfV9cdOVLQe
         AkvznM1Vn2qenfjX/pcw4EtqKruuu2R4PYtMAZXuJoKrBrlafeLkdW3qXvgu8URiKwpv
         4Vu9obZfyRfpzzSdd6OYUuRXuvvCkdgvWk7SeoPztB8IUyxZQYQv37itoppi6FNXHa+H
         cDk7jxL0+cHZBMka3DmUkOT/iSPb7NrkpaQrMmAzmNy/MBizBY6fO13a7OyN4UxneQ2h
         uzkw==
X-Forwarded-Encrypted: i=1; AJvYcCUJrqTBWQlAFY4SY0oaLWeqiFSFCv/5npC692FG1fu2sFfze8kHc+epR2qFkvAXeal5KAuxWNN7fetFnGxEx6xW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9oXWH6OAGOqB4SwixfMhxlopJACkKRJuAEMwS6kPWIQBwmC3a
	I4DevfEUwHr1rTyBm6/ki1v7SW4oHqxDiZvqybGF0GZtWWFB/P9oC9AX
X-Gm-Gg: ATEYQzzFzPsSZixsjlExfzoq/Pvs8F/0/krmY/LlhLq+v+4eO/MRro3FFuEF6OWq+du
	0gWebZVmXHKfWCGlIhz4ifQfpd4ybsIRnfPNhAreMTbpJiH+vmP93ChckTJ1/i7nhzr5jTY54mC
	pnm/dUoCOV55LU0qFyBhuRpaYgoZVR/SCWmLop+/vHtfmrKvnmoSFoO6Hhd2yN6wRPqQ20mdSCO
	U6uBTi0t0SfmL4zvipbyWVHvi6QAmlyMFj78wzwo73eUUitoUw+qv8EqTTq8/kEbP6VyFF0HGvi
	1LzjPP5BMyFCmZptbV7+K8VoyRQ8IcgTWtXfWw+x5S6PzBK7j7F3F1u1WmIUNxMqHoiwo0+wLJr
	7Fd2KMII8TglCJu2FzwQPUMBpXQSkksuDu+xspUfRIEu0OQi46H7mgQ2Tgfjt/9Qu6S4vPn9YLQ
	+xKWwVGATHktBKOs73CMWmC6WVuUjodwhLxyyVv/EYtH2VQcQS
X-Received: by 2002:a05:6a00:ad08:b0:81e:4ec2:daa6 with SMTP id d2e1a72fcca58-826daa23f5fmr8127791b3a.48.1771944421683;
        Tue, 24 Feb 2026 06:47:01 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.168.64.105])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-826dd64367bsm11149895b3a.4.2026.02.24.06.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:47:00 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Tue, 24 Feb 2026 14:46:46 +0000
Subject: [PATCH v2 1/5] dt-bindings: arm: microchip,sama7g5-chipid :
 convert to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-arm-microchip-v2-1-8bedacd2cdcb@gmail.com>
References: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
In-Reply-To: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu@tuxon.dev>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_064702_706307_07871091 
X-CRM114-Status: GOOD (  12.69  )
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
 .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml b/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml
new file mode 100644
index 000000000000..0228a5505259
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
+  - Claudiu Beznea <claudiu@tuxon.dev>
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


