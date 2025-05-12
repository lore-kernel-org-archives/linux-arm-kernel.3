Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC46C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Bizm6h1CDdffqhCM31Ev0bSZrO0bxrQbCDmltlpuTU=; b=SOzMkOdGxsytr0544/TyCMm0eR
	Zsbngl8bTZjkaIhgJWHfSj/wKyBKE/gPoBfxyhgau3bkqqdfr3j52JP8+rAgpTi82EsZIvuE1DHbG
	dp+LtsKNgF8d/lt+BxQLS2MUfcC4Jzn8YF74uEbtekXhxZxaatnbx3vrjhrtjcP5s/LU8G+QCWU2p
	kc6qVDNBKlDV3FkhmxtfjFAnZNrS0ARVftIw+nBj2XVUJhlQxcgZfIh7bPujYPggGGOaGpvfEtSqk
	gLgHNmfKYuftoB1CkCP4V68oJ8Yszmec9Zu7J4GSHWwrY82htUGSvTndoGpt5OB2eki3H2SHr4Jq3
	bTyLQPaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uES4t-00000009MMu-132t;
	Mon, 12 May 2025 12:16:15 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERus-00000009Krd-1oX2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:05:55 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54e98f73850so4964581e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 05:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747051552; x=1747656352; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Bizm6h1CDdffqhCM31Ev0bSZrO0bxrQbCDmltlpuTU=;
        b=LYpzD1nR4xCPFEsz8q0hFwxJP0zLhfF4oHMcnIi2nwFYk78v0CKbmxwD3VP/HkCh0L
         e6z+jUMNZv1OIdG3h5tno7T6hB5klttE8+jaecMlp2FaFu7KYJP7EbuG5g7qyvjELv1l
         HYwlknyLinxjgxu7XmftGH5wUbN7H/qOVKscStFg1gZj2/Jr2LvdTWfJNu/o5g5ng0J1
         JM+rqhWjXWo2Enql90DCQjd/3rdcMQpOhEgspWCoNb5OHoC+4OmipdTg1n0CGgthwqwO
         KhEQLnU87tykSSSRHK9njEKQeKMthZkgrIQOsA/ejM/+aO1jrGw28+ex40PiMi6RpiKN
         DZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051552; x=1747656352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Bizm6h1CDdffqhCM31Ev0bSZrO0bxrQbCDmltlpuTU=;
        b=EiA14M9fOjvIrkztajsSkN2Y52Pu997bJXyfM08gwjxhy9RKQHySdM6hzbO0x0fGUs
         YdaqF3wcFQutWC41nLZx9OPjsoV2rCSdcXeBdTnH0XBjPspZibsqd4cGLrCev+EvANLb
         mwPJCzfEWp6Kdb45/N7CfqRjbSkD+tEkkIVhi6ww5H9G1ID8Bp6WKPL7c4tSpwG3rXL+
         +PV3cZ6w1QSUGfnJh2WUExCcRi32TbDZVx136/nuPNiF3sI2Y2TTLPRl/TsAJ4WjyaJO
         Lv0qK+5Xuyaj7Ohuc68TKRBb22Hqwy7wS7y32/APltVW/BOHx7d5H6itxgMrpXEs5p3T
         ZTcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD7KaAmRb5TrfEK7QeChagB+nzp5hSEpHetJlfo+immqOJ7QGbCnOEcxSvMGfuxjOjbNo8RmqYMMNPVBkkURe7@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz2XHlcH69iuutAut1PKCcepu4gvFgK9Cy+kNMI2/zP08MJ6cQ
	tmuTt8a69sVa+2YUcfwVYebliO5Z4tQToxurxA2JX9lZtQUK/5iqvmRGEs0T9g0=
X-Gm-Gg: ASbGncu55Nuj9VMVegDYFvhD7baSON3BjqMiq2L4IGRp+ufEIoYagZh/BC0Mn7fSpaG
	vnwfeE3QmidEwR75938pATcYBau7nt6ZV+ibT+4n+3644xO1Z1VfFBQM68e7LNB5pCNAAyLsyJ9
	iPHcCLjnz99eqicPAini+MMJ+1QWqd6KcfRneEG1F18q+AqqbnWgYUIbPWjYmzWkbUMIO53ryPf
	59l1hW0cubSEK2wIhcH+w+xKC/HBkp8ULQjW/K8KxdNXBoheg37ony1tyl4b2mYYF+9WLa6qkrh
	9Fl2oTXGQwXJWFDJK/EXh53HlK0aUgbZuQmb5up4bOpjOBcOdiWGRUJpdsh3DajlgSn8vMOa
X-Google-Smtp-Source: AGHT+IHUoH9YybM7VLnMAo3tNgj/P/n5qW5oBE3DnYE8EyBisEgdXJTrVYzEQwzEU3pLBUrAseEOfw==
X-Received: by 2002:a05:6512:461b:b0:54e:751f:4094 with SMTP id 2adb3069b0e04-54fc67c95cfmr3214756e87.23.1747051552532;
        Mon, 12 May 2025 05:05:52 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf8a3sm1466033e87.189.2025.05.12.05.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 05:05:51 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 12 May 2025 14:05:48 +0200
Subject: [PATCH v3 02/12] dt-bindings: rng: r200: Add interrupt property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-bcmbca-peripherals-arm-v3-2-86f97ab4326f@linaro.org>
References: <20250512-bcmbca-peripherals-arm-v3-0-86f97ab4326f@linaro.org>
In-Reply-To: <20250512-bcmbca-peripherals-arm-v3-0-86f97ab4326f@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Olivia Mackall <olivia@selenic.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_050554_481136_49770274 
X-CRM114-Status: GOOD (  10.65  )
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

This IP block has an interrupt. Add it and add it to the
example as well.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml b/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml
index 827983008ecf707019f45847cd86d5686e3b2469..817cbdaa2b2d75705eda212521186c40a9975ea0 100644
--- a/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml
+++ b/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml
@@ -20,11 +20,17 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+
 additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     rng@18032000 {
         compatible = "brcm,iproc-rng200";
         reg = <0x18032000 0x28>;
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
     };

-- 
2.49.0


