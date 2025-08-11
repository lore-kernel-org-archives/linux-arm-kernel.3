Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09985C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 14:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y33Pv3KzofFQINb0XIyuYWEMtrAvE50zQkghzUlQZqo=; b=S8nij2nmjKmY/Lgj61i7/UjjOS
	IPo6QNjJ3saUzNHuWUBN2SJxYPyVuHoFEwTKyEVgo/yoKjbzNzlz+u0gcakWrxGLAXIkxZaRNfVXT
	6tyTy/L6PkRofNikWp1ev8PNmThLyHoOwpd5uAjCnXh2a2VZxdcB5rQ0/BFA15UmR81e3dd8CXFxc
	r7wzfrs6kX34c4iuC+9KABIE2AV5ts3iY3oVD34r6v6kzFCZ5edrULFsT80jZzU3vCcQDNuri92x8
	EXhS78z+eDWoVcTpfIeI9D0nP1mgAHCcv3bpZRy5oi3+p3aqwJjkqtGXOm823gKvDg2eJLCfQ7bsg
	hib59jOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTfW-000000083W1-2iL9;
	Mon, 11 Aug 2025 14:38:34 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSyg-00000007thA-0YZE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:54:19 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-af92d6c7d15so66935466b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754920456; x=1755525256; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y33Pv3KzofFQINb0XIyuYWEMtrAvE50zQkghzUlQZqo=;
        b=oCJDwB7GkWhssESaTGyI7TPx0OWlS7TbtQJqCQigAldIhGIIQ6SGNorcAv9TK8k/n+
         PkLdzCsY1ta20WxiJro1ob74OiEug4fHluwi8XMHD7hmCrZCYWZz7oJZD06fZCaaCk74
         1pxeA44qjDShoQb1iMyPzvLtY8m0va+n+M08Ov7pli8Jo7py4hHG1GiUwH8clhdXgRl7
         RAqUW8++MtdZkbgR7edQGuko5Wil46TzV3129pYqPwpCFKJxiAiCDeAJ4boVTXC1SkyS
         aw1k+5MwL4nkZqElRwrXV76GzOfHxVRHSQjrnV4YZQvHqpmySTd+00voWSDRm8fmTAr7
         RLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920456; x=1755525256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y33Pv3KzofFQINb0XIyuYWEMtrAvE50zQkghzUlQZqo=;
        b=he21pN36mqTzUHnTrHVLK1kIyNunnNJ1vK2mmw2jr2pPdO9YWPXm0cSlwbZeYbB3eX
         k3GLkCyXB0YOhaH8wpxrp7R5suPpnNcyIR0uCUAMgpWSP+DG9rjRRFn0fK+8b9EalaZ0
         AczhGZuvSAFrsLt1OVwGR2KenRqxH5eLVxpbP6MiSM4NuJWmENX6qJSjIHLf/lAo6MRM
         WIs6sUee4G8tqAjwftVUWmiuy4xQ2+CeFv+6rn8cGYxeURz/rz0f7e8biWOozXfWlXsC
         5GF4R8QgzPxBrGq9UQfg6RcSaaWo17KuJLOKUG7YRk08uoP1W8FeeVOh7RZMTsRs5i46
         u7vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX9RIrX7nY6VEzyMV5yGBFFJ5RVn7AiBqsWzdLSeiWNmsePTGkSI+BHsuc5xWzP2i8ImMC7sTrncCP9RG0gE1t@lists.infradead.org
X-Gm-Message-State: AOJu0YxH40l1h7v2rOCcpMikP3PytEavu1Y4d4GPHdElovWbCOd0thmQ
	NAM7h1XgiKPVnF3UF94FOU1TQ5pAx4/+C1ZLwJ0/VzJ5uQWx959b2vxA3w5rqj43xEM=
X-Gm-Gg: ASbGnctlPX9ecEoAje+KEDajxGHdrMAdFxuUunxomHQa5aHGp84XaOnmGfiMu6U6zNs
	dk4CXgd5+wcnO3gdCRpWb0fO2FmP886xb8T49Fw05YwhpRqkwnYcxrkKUvoR6tUxHYszCsKgsOs
	JcNbAZHZlzYRg2H2cDjCvqbpdJVPHAJG8V5Acul5SqjNIIUPgNGrdrc3qIi78Elq3l71h+s07bp
	qrO3bqd5kXuR04yNUAbwMZZxpdcTFfUsoISolbzL+kavkq4X4LsgZAjv4Zwz5igptRGnuAaklyF
	Bo5xXzo4M1AEQxhe7OxSS0GCebGl2Esuk/AI4ddRsckxtswAD6KA1D6eljmIf39ww3vnLgBpyks
	c5IOZWbrwqwgtwjx+cmVTl06PKsl1DuIpHsI5IsU=
X-Google-Smtp-Source: AGHT+IH4Qf+ySBLIVJ9RkUzdhUf9nuY3HqBodr3qXxNFSQgHsOTF3ilWLqfyHr1IQq10+Kz8o09S9Q==
X-Received: by 2002:a17:907:3ccb:b0:af9:aaa6:a86c with SMTP id a640c23a62f3a-af9dead3f1fmr358990066b.10.1754920456487;
        Mon, 11 Aug 2025 06:54:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af986a477c4sm1179029866b.56.2025.08.11.06.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:54:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 11 Aug 2025 15:54:04 +0200
Subject: [PATCH RESEND 2/2] dt-bindings: phy: fsl,imx8mq-usb: Drop 'db'
 suffix duplicating dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-dt-bindings-db-v1-2-457301523bb5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=c3RG28Ko/mx6f7xdaUC6cmwJZ34iCoqiGu5BWiOS8Xk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBomfYCAhXzoTChGKL7Xql44UhldrwIyMLU8rSvj
 ClxLJtPxI+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJn2AgAKCRDBN2bmhouD
 1/rGD/95sl+p+L3yZcu4PpLeRAKVr8M0CAYYWYQISgDBn6rgUWKMSxWpjRCK+XTyJTfIVm2M0da
 rshpXmRzJhjNa2N6onDSKhQIhcWQxb8ziD1k7w2CoWg+38e9S8dzL/Dpfb8egWwXGVa/COwBnSo
 g4fNEx+07u433Bn5HQy8MfjFOczQXrOFsuFS8iQ8jXqER9zY9u66tjwNpkKuSandtQNQn9hrb3J
 gc8bWN3fkE5gVxt89ZVe32cD0Jg6cftQCiIG7K4N2zmSpzeiSPWKwo4UOvyqjE7zOFQI54ert7X
 gMFwj2f5Qxv6M5KuecERmUWYaVOFrurwMa3274qrvyahcAGfK+mDU06akPsgfdiE1Vsr5hTIZiQ
 4f+KYICmuJoClFIRJzuorhp24lAjhcEgcEDB9T2e2L2uQzYjTIrPiuMBEWYhPhp43mHSd1KTs9o
 FtpspdYBCN1VfmOyqpzK1nf9Nf6NEhZR5GsJ5AryaPV44iJNm6xIKJd724oyK+P8HL4Ae9n2l3p
 U5VFAsCg3b3+3mp+j9MmDIgyll8GFVqTkCzFndCkdhNQd7AJHdSHsi2uYFatm191/KHTZGuXRsk
 Bfj9yHmaePvlSvESbySzB/IoUn9p5izL5PH3oq7+Ly7Sbba6OFqrsGsuJsgk95oDdjbNnsK20KQ
 09bNiVFG/ckn9GA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065418_178596_AD412B6A 
X-CRM114-Status: GOOD (  10.29  )
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
 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index 22dd91591a09428214afaa4c9c8e37aae9bd8aba..6a47e08e0e97b286538798190225ca2966a7ab34 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
@@ -76,7 +76,6 @@ properties:
     description:
       Adjust TX de-emphasis attenuation in dB at nominal
       3.5dB point as per USB specification
-    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 36
 

-- 
2.48.1


