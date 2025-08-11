Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFEEC87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 14:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqhbJGyWXO0pDEnjUQmQZz1y0G16+abJkAfpIFUeykg=; b=GxPOtNB4mxoO78sgDvksXOKlal
	Ww1eulMRUs9w51GI1hEOeghuZPVegUJYQvgWj0dNqbCPZZhYCj65yNOV23wnHVTHRIFXVwSotxNK/
	WgZtOKzJQKUr1fsZGvpAxcwJsZ3LRd2u7wAC7aOAJz4SiG9L3G/lG7+m2GcYnYYGyQf+rXBUIF4d8
	9G5hCglP4RsUGmVF4jKIH1dwMDadjbhNdYyl0R59w94919hETa7n8Z1Jg/kM+4DZj5LSuK9GG1gXb
	1BppaJWPaC7Ax6ukPddCnRCvr+uDRhjRsoS28Rreq+2UWxcyXq6AzjvX8+wkFFWuJs1abqgU5KEk9
	p4UGjuzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTaM-000000082V9-1GYT;
	Mon, 11 Aug 2025 14:33:14 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSye-00000007tfF-1Jtf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:54:17 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-af946c07c84so60671366b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754920455; x=1755525255; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqhbJGyWXO0pDEnjUQmQZz1y0G16+abJkAfpIFUeykg=;
        b=WcqQvML4uL6x4O/bEowrVR/ejvLasCy3XahmIhtrD9NZGQSGaxY/CT2JhmBwZnkcZP
         jzImGaCUh4NuDhOb0JiUe6TkYs0MvhU119gXGcMaAtddsw+QIHD8X/jwwFp/ZKH6aaBK
         q5ZTSxTlfdQGVAxf8lNpH3P0K36S3qc9C5n0ihwBm2Ub669b+haefdP8K991NeRr9Qmh
         n6gh/a/hJb3QXirJkN4k4oGeAs/efxpPuNuMIYqLB04o4ObH1WIjFZe4u/4EONOzrd9Q
         gyZ4gvYPBCamy7FGrCDIY71bqvg/c10a3cIxApmVezKp5rEROPbIWTniB9+yORFOsMxI
         awWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920455; x=1755525255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oqhbJGyWXO0pDEnjUQmQZz1y0G16+abJkAfpIFUeykg=;
        b=M5BLX1zaQ2Xtl61OP/NagKoyc5sHbYfPntbb+PVR1W86av7ThPIda3Y83EEzE1yyg2
         W/OZjS1c1COBYPy7Y2thx/pIo0VqKHUENZXmWMs/dO4V+oxni9Y8roEvVpyrobtgpCLT
         qgmnlCDtEYMkTnq8fDctCDT7lDyftCs1b0Dj1PDCgRsDrfOKOZECYraWSdSmRRaf4/48
         apytS9A/aylsU2zkjgVmrjtBxAfVNdvjOwujdesB9DeMpwHPVErKznqk1D8/ZhjUmsd9
         TdjTzqqIKtkz1DOoB05l+HXwMK9DDAmuniWcKixWQUhUCUxB/sc6EvLjPDwtorlOHah3
         x1Pw==
X-Forwarded-Encrypted: i=1; AJvYcCU9uAbnZca37sPpY56pFRolsOBGwnZXmMXc3Hnd+MqIhTJfYB60jXSYqMEV7DlT/1hwW1h1jDKl5SBz3gOfCr7O@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs5xX0Lxew6+6+6sBdAg1ZTXHIeY/WG0aUx16eCi1y3yMlJ3oD
	u50SBSVdaKir3PatzfTntYc04uZdPfPNOWyuLHpeELbc16UFSiQBMQzsZN+OqFYwHDc=
X-Gm-Gg: ASbGncu80BndLQXtZk4BJh96XP54sDBwdgYQX1EDbNmPDIGKCM2Z5I4rYRYdIuDNaIa
	36wpwg6mN2ppteTpHw4LOIzEZYQpNlFRSSkp930HCZslu+zcGAjbM4ZECK08tLZ4aE40OwJWkrC
	pv0EZFhAdfwL2yoJoAKPnhQurMprV20W5lYFuUkL4hB2mA9mwR8ssjIYqu8HOUeJqfcT2LxFsM3
	6Vd/rNu6fmKvyv3JvBYvdaTIkeLm9cugCabwNrpKkKZCHBQH8rdt+DEApibDXsL8WeYSxnH9j+3
	RAxM9MczeocaVC4wAZOpmVn58Ikq7mF4rSMWidSdkjE2CbYI34a/XsE/4GLxinluCX7j6y5JNYs
	kmPRgDj8ecPTAKuxtl51cau248VK+q1cexSlGYD0=
X-Google-Smtp-Source: AGHT+IE/1LgQrqO5eCCRUgilyifCk6jF84Qp9fDrZOql9XlTeOhTTbm9h/YyeGwJTKKvwOp71PXCZA==
X-Received: by 2002:a17:907:2d93:b0:ad8:a2b3:66fb with SMTP id a640c23a62f3a-af9deaaef27mr385687866b.3.1754920454644;
        Mon, 11 Aug 2025 06:54:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af986a477c4sm1179029866b.56.2025.08.11.06.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:54:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 11 Aug 2025 15:54:03 +0200
Subject: [PATCH RESEND 1/2] dt-bindings: leds: issi,is31fl319x: Drop 'db'
 suffix duplicating dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-dt-bindings-db-v1-1-457301523bb5@linaro.org>
References: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
In-Reply-To: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TwhL9kHuNMw1ekpCMBDV2BMjjP7HjIb5JBPWSmFWyGU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBomfYBFR4XrobLEhq7B1bbNoPCguuPOvtUYVs7T
 QoK2ACsJb2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJn2AQAKCRDBN2bmhouD
 1wX9D/0fgTSAEgjcithvcnihEli0+dhJu1IjNs8D4hs34omPoQQtm7fLqC0xRc+ZgX+vvRs/uD2
 WJrb3kblxWU4xiiT2m000ekQdnlQJaQdGA7JPSgu1YHHgsZdPxdPCzmKkJnxWRBqmcpbAybQ5Yy
 aBb+UA7EY96reCOw9mokeqAoqnZ2UldILGg9i7xKZsJLQbKGeofk6QjjMnA1H/o5IKGB5xBG2X+
 g5TmwluhQkVyB3TSat40bnb5Xx97fS1rLdBvp1o895jugOym4riUHY1DdvdxmqbvimR8uLxq6B5
 pdpTg1Qys0jqZAewiH/s/zRgAARR7toakmq2G0iwAmekvGXDKwpcDQdpnKH8azu0whlaUXlL2Dt
 b8PKF3JNOH8d1FteVKbm2Lb0ODRIPukQlCgDCpJ36p5G5qLjsqKAuEFUVlUYo8u+MVwdsYSPtu+
 P+whAhlYtCLDufA9vaHELAT5beRGjxzHJzxGv5kIDu7kXC/gK8kzjkN8GCFzRdAh3zrGqFldfAf
 vauniUM6e8Ta4Kd9uO//LDT+PZ6m4psOUj6cgsQUekspxFkVGOpYhfSExqaC3LrPWJgclAsVIMI
 FwPf7TcgRnrUAZVrOwLY14f5bD/yb01z9NYzpvW9iorDod4J2OjqkHSpwJPkzp1ILLvEX/V1530
 QU/fB9vh8kGxMXw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065416_377592_D2E9C921 
X-CRM114-Status: GOOD (  10.39  )
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

A common property unit suffix '-db' was added to dtschema, thus
in-kernel bindings should not reference the type.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

RFC because this depends on dtschema changes and should be accepted
after new dtschema is released with this merged:
https://github.com/devicetree-org/dt-schema/pull/166
---
 Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
index 3c0431c51159e549920b17cf2ddfd1b85ecde810..906735acfbaf94fa08244f771139df207dd6e4da 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
@@ -42,7 +42,6 @@ properties:
     description: GPIO attached to the SDB pin.
 
   audio-gain-db:
-    $ref: /schemas/types.yaml#/definitions/uint32
     default: 0
     description: Audio gain selection for external analog modulation input.
     enum: [0, 3, 6, 9, 12, 15, 18, 21]

-- 
2.48.1


