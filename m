Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313C9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 14:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1GozZmv2KllVJbD8Fsx904y25bNOuqAn9ZG+CR28Ew=; b=bwn/qPgE95/1906Na0GXcWvmWm
	vqVTOQjLJGn5ylcQQyBDrGFXfVizZog+U3YIszo/H12w4+gMqR/1RnAUOtyF5nhYYEDJXHrfBu2Ha
	AjwPD2jgqkrcoR7vTT/knH2b2fpZ8Y/iV0YPojSTeIyEofyFcKVQJf8NE9fxucmExQlWW/OzVZLJO
	07T+ancGLd0pijlf63o2rp9pb/0J6oQ+vXQG//fWZzEDUzqnfm8AMJnJ5Fz1Nd3bOuElZlTJGcv4+
	cPyv3gX6aXKXSldW5DN2oK0GCmai2UqBzaEdGbRA7yGyxlQocA+7wUw9ungceS5FpQTKvtvWZGXk7
	tkmDckgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJpA-00000002Py0-0bQo;
	Mon, 14 Jul 2025 14:06:32 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJdm-00000002NOu-3Xov
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 13:54:47 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45600581226so22529245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752501285; x=1753106085; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1GozZmv2KllVJbD8Fsx904y25bNOuqAn9ZG+CR28Ew=;
        b=gejFUn8rBT0PQB8Ct9mL4AGup9aZILvioSwq4H4joC0kpW9ZbLupGkH8G0MDvhy9Su
         BkicA+DIwno5h3FPsd1BG43QTJwsQwZA0BQDLfEW/0VsnEKlkDwzj/KQyd/9AKQrinT6
         MefDywFPestn32u/rFkt9yjBVA2TMsKSVMmNx4cLf0yVgTLdxzmAb6FE3Uel+9RGioLw
         DAJllwDvZkAobS0J/XAHRElYUm0kc0gs3g3k9Uaz8Xgsjr0tEu6Pd05ZdJlZyteGPN/j
         TmDpLP9RumFWYQ9NJnEie1gA/ADddhZUCM2LbDmbPCpNgdXEbUy8o3oHMYfcj1kJhWZG
         4Hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752501285; x=1753106085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1GozZmv2KllVJbD8Fsx904y25bNOuqAn9ZG+CR28Ew=;
        b=BvnuFdsDDZwkJUmMFU0OzMJx9yiQxiZhaI1KJ0VHun0FaOufcCZeb3z/S5n+4MuQ1/
         kPb83Vv/37U2T65W5edz0RNmt3zptpG3R7vCcH6Y8j36CjJp/SLMR9mjw8RtD4+HxRzH
         Meod+4qORPbv1LD2EVYd0s97YPxlTDQyCoUV54FXl6z5NJ0KEVt3JmWNet0if32nZCep
         0IsMy9WAHrdWLUadEXjTCHPkX2qPJMrCDCXgT3LcttKydPwmOrQ4HwiOsOOkc3g5utoH
         xPZRH6yK8bIVKGxs9plSo9v9SYmupnPLl1sfD0QSHQ4RCWWZp6VO1wBQ4alyx4mlFR43
         o8sQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7FV/tUKSZ/6JK8ZZuwF+Jb+EewMzRpP1FzKnVYzM7lthIaEOlM4Ps9isiCwUCAEBcj2iWtMMpd1MwQw9cHsAc@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd8wj0z60F4uMKV1gB3k86PSHGUVA9eMtFRsxXTFo3S9CoVtHe
	AYoE2XjH9oZYbeZ/lRgwyLNTx/EZW7jJYI3EsQRzHLLHG05tuixGqsdx
X-Gm-Gg: ASbGncvU+AfNu6mBfVgYUkmCf57Z0apSf7tj5AMfFvWa9W5x2mZ1SC0S2tKNTUjmetL
	vCAxfBYyHlihSrTZlKBAziYYbbe5gdfpmyd/Ffm2u/IXizHNlscUU4uwIxVaCZT1lLd0Y81Fq7J
	0RFWMyMFfBiX3wKbi6UDlSzOH0Dgv17nF6rtFBF3rzjuMNFlUucVE8n48aG8r2NflXB2u6HwltF
	VPxlxPxx2xOCZFPZym0Fda5wdk+CaQNwAvB6lVkjPjvkJM0Rx0Zl3zAVSFcmc83qCaiq5tIBfwF
	j0OrbY4B1APazgvS8g4SLcJS/NZKilQTnkzHjodbiyMntHp+RsSMdhvA4f/jRHCeHYrnhRCRh5Z
	P7k1/LqGpFylYFfcdHU/BPcg=
X-Google-Smtp-Source: AGHT+IEmMJQ9IUdhNJsjC3avx3ABcycM1c378Tv3VK+BRI3i+Yh0RCHDP+vvN/eoeQA1/W5WoDqLKw==
X-Received: by 2002:a05:600c:5253:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-454e337dbbcmr147287115e9.0.1752501285089;
        Mon, 14 Jul 2025 06:54:45 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4561323a488sm51228055e9.1.2025.07.14.06.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:54:44 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 14 Jul 2025 15:49:16 +0200
Subject: [PATCH v2 3/3] dt-bindings: arm: sti: drop B2120 board support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-sti-rework-v2-3-f4274920858b@gmail.com>
References: <20250714-sti-rework-v2-0-f4274920858b@gmail.com>
In-Reply-To: <20250714-sti-rework-v2-0-f4274920858b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=yGLjgfrG7ccJQbLP1bUn+mq45lSVOGYqttRomiLzHu0=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBodQwg5KARvxWXSIY/kUAlwKR257nuONcT6QTUp
 C5bMLobvVeJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaHUMIAAKCRDnIYpo1BLC
 tW24EACasd9KNofpB284fozmyUvUB6lKSFy9eXLzG3zktdFVfbs5l7c84Q7DCsjO7cvFJgT4vRa
 d+JfNJgLwNUODi59Zs8fEdos5RmbZRE97oCD6HwJ5PVUNymCVnDyiiga8KQ9s8nTKnKY5wMch+t
 nzNl+78zaCfUkeqCLct1JdsAAi71deF+SRcsBdmWgTH6rhV2OrLpMCJEtOCEPVlORPexCOOE99N
 b4vG5t05I8KRIbKiN+r27cYmRvNYc5huAxYK8VXi5cmEqJ6yH32CU+BWEBtRwhkcmsU2Sfr3xTs
 8JcIMi7BO09SyFWG4yyIScart0pLwa6lPqhkRc0EgI8JTR1L4sOT3iAixMJmJNT01CMnLjIkc6E
 E6qtworoQY0pVfblCf4KrEukIFukjM8SL1IgGx/0u63j28HVjKbsAdeLAjh3mr7I0NcJVQPwbQj
 eCblYz+FEWDK/nkRKR8G25gJdGIfX0ritMAE06LReWaBzCLhsoRZ+s2Onu6ShYONhmCUx2Fvam5
 2zzvfGePfnQJZEphh+5AeuNFkZ4ITmJivxg795je4BQhrMZioue5kTeXZdKHoxdfY9eg3Ui+eMW
 tdBrkLaE59OlW9ArSpOtbBapXFht+FSd7Lk9SZWSDty3GkWm45+VuzrKO41oR2LFOFqcXFzXzJd
 WP/1m9HhMUr0nWw==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_065446_893198_7A0DDDF2 
X-CRM114-Status: GOOD (  11.04  )
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

B2120 boards are internal boards which never were commercialised.

Remove them from bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

---
Changes in v2:
- Added Krzysztof's acked-by
- Put this patch last to get a bisectable series
---
 Documentation/devicetree/bindings/arm/sti.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/sti.yaml b/Documentation/devicetree/bindings/arm/sti.yaml
index 842def3e3f2bce470763d3665c7603b9058b1e4e..177358895fe1c9f80f8c825142cf015d04286ce8 100644
--- a/Documentation/devicetree/bindings/arm/sti.yaml
+++ b/Documentation/devicetree/bindings/arm/sti.yaml
@@ -14,12 +14,8 @@ properties:
     const: '/'
   compatible:
     oneOf:
-      - items:
-          - const: st,stih407-b2120
-          - const: st,stih407
       - items:
           - enum:
-              - st,stih410-b2120
               - st,stih410-b2260
           - const: st,stih410
       - items:

-- 
2.50.1


