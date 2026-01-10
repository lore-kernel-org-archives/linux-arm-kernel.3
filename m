Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25518D25022
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 20:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAMBTRf7QytTB2jenrGs2RAk4m+Cjs0eBt15JACy/6w=; b=tX3qAr/aF1XDCb+b05FwgJk0Pl
	Ae8/+V1nI15D+MhIgIqtLLahYTVoL4mq26UCLGE0ffwErf6pxpxEzk7Nwc5hJweynycWdOOie2da4
	vmkEYbYuOlAG/9o6hUNqqVR+AqskDf2B7UcBVo08mHLlB+Lre7CO6z98ilwGDD/6ST0hMv091MshZ
	kYbcB9T+X9Xfxmpt63KpJowtODqsmPC3HpuKzncgTEiF2fuEySNu0NtSUOxIlK+JsaaqGlL/8Mm88
	LdVMGj8wofc9r2ta6yfF+gZaxMyykS/40EE4zpwJw9Z/W7DloEPhr6y/g1qcjOmoHfZLVnpyB3sdY
	K46CLBCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vefCe-00000003edX-2OHm;
	Sat, 10 Jan 2026 20:04:52 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vefCb-00000003ebH-1WDj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 20:04:50 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b8707005183so28016466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 12:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768075487; x=1768680287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAMBTRf7QytTB2jenrGs2RAk4m+Cjs0eBt15JACy/6w=;
        b=fV4U2jMFxoWevWoKW6XqicVB1dBi+M6eJcHpisiXpW9jllst8cK1qoEHwLLvrWjhfp
         W8hOB8J1nLHTMlDefq054b0CVUewvVwYyHZRE3hS1xcPlrUU51Hnj6EZDC3jrCmHZUk8
         Z1vYKCM51WTGaSx5wDx554IVgj8y3t7ka/rA5owCxXVrzYxXbaG2UBRcJT+E7Ana9xoR
         Q+F6OFF7lGCxtzsFuEEZLZwdnEHSjB+jBqFx9tAYh9LmrH9ZMFYCGRtKcdxcs8bUYTH9
         QG1gKXKlFtdRWd00ea3Di5qpX9v0HF2rthzb6lcT/f4kzI0tHDOSCPMS8KGbunX8hxkv
         361A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768075487; x=1768680287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cAMBTRf7QytTB2jenrGs2RAk4m+Cjs0eBt15JACy/6w=;
        b=boAoVUtLFIwVG+903eYqGaCTdjjX4Zwq0uN5saBs4hUFb+Wpx9m0E6wipk3a+OSjiP
         jNAW5VsEmEadYzHtRy0tv0EQl7aioE1jfaGWMSulNp4ixbR/WW+8AvDrGz81ouMXHfKD
         XYWdyl2n/5abtkLOf4o5wJ0RjnvZLXl/LYrD+twnguonwJcrElzRsOvP09MmsBI6jUah
         Lq0mP6OAC1QF+Uue2g+Mephc1NiQXdi2rnbn1NU4VNHDOTS8GwcS9dKsF8EC4Kl83NK4
         28uDwH8lS08yCyo3EYaWfs46SsTu6uhYKIOFmyoPkwSDi0U4rOGyM9/o2tUcd0U8d9Ch
         wQPQ==
X-Gm-Message-State: AOJu0YyzEEHHN2E3PaQcS98fsY9bShgkYSAEUr00/QFTvrg32TlrNniu
	49qZn9wXvGuTflHtmp41CQVOboIjsYwh7djyr5k+nCLNAgjYIMWsyKPm
X-Gm-Gg: AY/fxX4iBXRT8lbknfGjYAD67/rpeq83ynybrYi+68oXMoT2sNrJEhf3TI+qSl57bmF
	OZafxqlNtKjamgCW0DpSlZc1ZVyPtx9npHX1eu62LJSVptWtd6eiVHMYvZdixa3OM/diyk2v0ti
	v4IIl445w2OE9zXjSK2zxPrPUMcy6MlUeACeR/6b1MVvip6Vfo3UpmRqadUFHJQwQTQDCZjJqq8
	HhEZFy0UdwPU8DISoXSCZ1wy2LbtvItAI9SV+sGKUqYUtyxGijGFm3l4xuTB5sWYiT2gpaIQ6NU
	tzZqpOJZCvMha7IgnMbH5COwZj/N0D2erOY2QGqlNZBZJKJGdCqwdSfFoFQZTzUyJekv0LyhII8
	I/Ec9rb0XFbjb0FYsd1CQ9LQtpXHD2+PUQunfCYWuoRL6TtV32OoUPVyQtboeKlA/3rW6JgoQDE
	VZUWih6V64S/AuXUGFaGqUlVV538MgPvllZrq70bOC8pzWWb1fTPkcbnPRTMRycVTavSOQGGx+J
	w5+nJMLUg3Ksw3F8tMray0Ntt9Do9PWBhvDyqWI42E=
X-Google-Smtp-Source: AGHT+IH8QgiCvKfoUTFqnQp4Bc8Dq9wI8Gv6dNGoTv+bs2r+emH/fKSyTd0Pag3ERo6pzcyuWxwXRg==
X-Received: by 2002:a17:907:94cd:b0:b84:27bf:c37 with SMTP id a640c23a62f3a-b844535ece1mr1447189266b.40.1768075487049;
        Sat, 10 Jan 2026 12:04:47 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-af95-6f00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:af95:6f00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a56c552sm1483591066b.68.2026.01.10.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 12:04:45 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	adrian.larumbe@collabora.com,
	steven.price@arm.com,
	boris.brezillon@collabora.com,
	robh@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for Amlogic Meson S4
Date: Sat, 10 Jan 2026 21:04:24 +0100
Message-ID: <20260110200426.1461575-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260110200426.1461575-1-martin.blumenstingl@googlemail.com>
References: <20260110200426.1461575-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_120449_424955_2D8B183D 
X-CRM114-Status: GOOD (  10.60  )
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

Add a compatible string for the Mali-G31 GPU in the Amlogic Meson S4
SoC. It has two clock inputs (GPU clock and a bus clock) as well as two
resets (main GPU reset line and a GPU ABP reset line).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/gpu/arm,mali-bifrost.yaml        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index db49b8ff8c74..85fae7753004 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - allwinner,sun50i-h616-mali
               - amlogic,meson-g12a-mali
+              - amlogic,meson-s4-mali
               - mediatek,mt8183-mali
               - mediatek,mt8183b-mali
               - mediatek,mt8186-mali
@@ -143,6 +144,25 @@ allOf:
         power-domain-names: false
       required:
         - resets
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,meson-s4-mali
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
+        power-domain-names: false
+        clocks:
+          minItems: 2
+        clock-names:
+          items:
+            - const: gpu
+            - const: bus
+      required:
+        - resets
+        - clock-names
   - if:
       properties:
         compatible:
-- 
2.52.0


