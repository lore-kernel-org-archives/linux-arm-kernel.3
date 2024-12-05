Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09B4E77171
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 07:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKgkddTbsb36SqzZl1dMALspeUepmvmFxGiaTIa2E3A=; b=ajGigmj99+KrBYi8DuVEaX4YM9
	W7N78houMgtaxGciV5Lh2lXyqpYEUVxv0ngGFlVeyIeV8BC89GjQckTFy1jZpPm3l77xnZEBNqHJF
	B6kYRyvyy5Nm/B/fD+jbhuVKM4VIgdkK9nmwZXEBWjKqtRcITKOsfwtuF+0Crn+747zty0UuQcrmC
	OqzUOQDZS4HI9uAZj8wRkIFhBUQAca1CC4VsIXJ81mgTQRdz9WCA5voi0CKycvZHoop0UNjStLKW9
	8Mqqb9CC1fn1OVXuGXIhFkGSezG850k1g9d3jHLKlJ0t9kFk9b7vhhiq1jqOh7RUaLYajgCbwZ/U1
	TIGReRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Or-0000000F2aP-1rul;
	Thu, 05 Dec 2024 07:35:49 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6MN-0000000F1hn-3UJZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 07:33:18 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa51bf95ce1so107974766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 23:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733383994; x=1733988794; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKgkddTbsb36SqzZl1dMALspeUepmvmFxGiaTIa2E3A=;
        b=ahvq+MMjVnovwwj8JqC3xV1yQHGWqWirUvx48m6rDmjDVW6QvaLNXpoaU2Se75lxDt
         n/3LQV8kD9pLEPetsO1mvurVdJJJRL/r6Smpnta/FUmnHt2qhkRp82IP6ORTxVNeGvls
         rdzBNCCFuyUbodKB8xQnF80XF/7TpALB0rENrJmDCosp3KYHFWZ2VkEe+Dm03z2rDLfz
         cGVVaf+MPmVTdENOqJm6q2bk0D8XYX8fcIJV1Y3a2a2IYac0nxSKlHh6pEVcXudmsCMA
         uFwwJUWl7o2SpogOgnqpevrk98AxN08j76OpausF+SAx4cH7ZwNRkJ6Rk2kCzu7Hf5dg
         zGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733383994; x=1733988794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKgkddTbsb36SqzZl1dMALspeUepmvmFxGiaTIa2E3A=;
        b=wjQkP9Tb0aLx973P/W/5dFy/m2y7v38r1QUjvOPdwudM0jCGgBpDJKxLmDjWI0djvH
         e3bUSRHHfuOrVpXDday7/XA8lfmxyDnO/S6RTLxc3g6nS/mP48Psi/8vXOCMIuWr2YWI
         fo6jT2djmkzolyoRAH32QmweDsFVqj6wIRy2LoExUbSQa5ZApjS9n5IweY/w+TyJTyTa
         FqUhj7tswTCFcj5WvyUct+YhcYWSHAN5SOpdrhMoxIfeSOc/HmFZWMFalJLUdsSG5wYt
         sLYIsRbl3CXoTD0IOUC+corhchVrU8XOpx75pvlfDhgzfGO02/3rl7WSBDMXe14w/xdO
         0suQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6LUJX5JsIfhky9Vm/KkUh7uVyCKqHOtopxdiQHz3ticYxftITphmoIQVqyd7E6leK7/4j9NNZsFb5AXeuVTDO@lists.infradead.org
X-Gm-Message-State: AOJu0YwehmsuseqBWEADFXb+T/3KK9fKJ0sbqK2BE3U6uSvGYXnb4HAM
	+fh4wh4PCkobEsOd1Hh716lwEt6AiEVy2bi1Kqw7SCRd0e6VD0S3HeJftmGgghk=
X-Gm-Gg: ASbGncvLc4x9SnsK3SIVQ4+NvB6a2gFNy4Y2wDhKCNfZW5mFP83y5TkKj/6QaUiSQmJ
	FBRzHfc0XdzphYAXGMsEcRUJjI90m5cJJFkAMAG+N9agz4c2JLxtaQTOfoCIchsDoDWyHreQegl
	oOn4+ZkMFaBjEn+u+8UzDtuC5lgqQJwW/nfsn+R0ME9ZtuKoerDS1M9pqaoin0szjLyGk7rsX2c
	cz3S5Lwpoqk1l2VizYUUKb34VEeIGfXDfdRPO+UayqG8Md2hwHIwLAWsd3JfrprRbMguIhqBmqc
	GOSfSWuepZVesaQc1eru7YURZiEG6AEJ1g==
X-Google-Smtp-Source: AGHT+IGYmzZiBrRm65PFSu05U4htcrBOv9KSue7aaItOd1Hb+mwmtbhHeeF7rqrAtH/3fEru33bthw==
X-Received: by 2002:a17:906:3d22:b0:aa6:1917:42e7 with SMTP id a640c23a62f3a-aa6191743fdmr306308166b.22.1733383994490;
        Wed, 04 Dec 2024 23:33:14 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260888casm53371766b.133.2024.12.04.23.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:33:14 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Dec 2024 07:33:13 +0000
Subject: [PATCH v3 2/8] dt-bindings: phy: samsung,usb3-drd-phy: gs101:
 require Type-C properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-gs101-phy-lanes-orientation-phy-v3-2-32f721bed219@linaro.org>
References: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
In-Reply-To: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_233315_873668_2772265E 
X-CRM114-Status: GOOD (  12.83  )
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

orientation-switch is the standard declaration to inform the Type-C mux
layer that a remote-endpoint is capable of processing orientation
change messages.

The USB PHY on gs101 needs to be configured based on the orientation of
the connector. For that the DTS needs a link between the phy's port and
a TCPCi, and we'll need to inform the phy driver that it should handle
the orientation (register a handler).

Update the schema to enforce that by requiring the orientation-switch
and port properties on gs101 (only). We disallow orientation-switch on
all other supported platforms, since other versions of this phy (or its
system integration) don't currently support or even need it.

Even though this new required gs101 property is an ABI break, the
intention for the driver is to behave as before if it's missing
(meaning for gs101 it will work in SS mode in one orientation only).
Other platforms are not affected.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
* update as per Rob's suggestion (I hope :-)

v2:
* squash original patches #2 and #3
* actually disallow orientation-switch on !gs101 (not just optional) (Conor)
* update commit message to clarify that the intention for the driver is
  to work with old and new DTS (Conor)
* collect tags

foo
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 1f8b35917b11..27295acbba76 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -114,6 +114,8 @@ allOf:
           contains:
             const: google,gs101-usb31drd-phy
     then:
+      $ref: /schemas/usb/usb-switch.yaml#
+
       properties:
         clocks:
           items:
@@ -139,6 +141,8 @@ allOf:
 
       required:
         - reg-names
+        - orientation-switch
+        - port
         - pll-supply
         - dvdd-usb20-supply
         - vddh-usb20-supply
@@ -198,7 +202,7 @@ allOf:
         reg-names:
           maxItems: 1
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.47.0.338.g60cca15819-goog


