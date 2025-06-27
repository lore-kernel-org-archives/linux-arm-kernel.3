Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4C6C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 08:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVQ26FYhE65N8xhWnR/yeeetwdVwmUBewq4SGVBPUKU=; b=SF8ZjYJaEopJz9uZy6H/H61WhB
	DLBQIMSMhvHCOeV/v5F+J6eSa0TxgnbnvT2KV+ssgvPwkIV0SnVOSXm3DPhTi+PP21QPmdDNyNqmz
	7jJLo4wf443zRrFqDMsm2XcYOyL/n33F3kXF7Uwhr/MLdmUh/7yF/jNY4MpveTKebFFno1Xwj4AIK
	AN22iuNgX7+PKMp8SZsTUIPtbZO3sZ01NQQi+8x7T7KlvhE6nP3a6ebTu2/nSKZ+IlbaALYM/yW81
	igDnRfKlxZjzDT1HS8g4N5T5G9UVYz7yolcYBdfsB6kOB5Y5ns+hjQRLvPZRr8jPetmNkzLgjpI+k
	LambGxzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV48z-0000000Dv8c-0DYd;
	Fri, 27 Jun 2025 08:09:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV428-0000000DuNI-0KA8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 08:02:06 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a524caf77eso243530f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 01:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751011322; x=1751616122; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVQ26FYhE65N8xhWnR/yeeetwdVwmUBewq4SGVBPUKU=;
        b=TlHmvYt5Qg6u4Be3YDYPdjW1sV3ib6OYLGua/JfKBxvBEQInL19455kxy6HcsPi12v
         cCvqHeJmVFTjENeWYA73h3JGiFHaOgodEHv67j6YUH1fczlz/wAjpBle8DL2ySEEMYUo
         JXh+MZ+H+3Fx+I1NGKkKHRf5kmI8lHmyC1Qxol6r1nZf9RvNyIbIVZgi1OwuyyhMLfbH
         6hJAUSbjIvzEdJRH+nsyVaEa1CaFUd6/n68uYPvnDEhyJS74w/47BM4fJsiwxZL5EJZH
         XjHJ4fviSixytc/8d/FePvLPnAYuXRxNJPxy6ib0cg8HM5LIwMjPBWaWBhKLWrtyufrh
         M2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751011322; x=1751616122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVQ26FYhE65N8xhWnR/yeeetwdVwmUBewq4SGVBPUKU=;
        b=mOZtKuqTxZEntXWL5l+1mwD3Q5ZtJ8SIu01U68vwXFGBu6KSKu51rlekysGbODJVos
         i+tmPKkNtDaGieFTu6GqvAxPqaC7wPBBRfj6J8bRG6ARWMf2293BWX/Odxqtm574Z0Nc
         w38atvkn46UgNB92aHXB+PH/DcM/qDRWATfC/5j/4od134fkRX/50Rqr8YVrjI1bDfnF
         EibKvSfCKui8psNgsfXSQsXkT2H2rvPKESOmggWGVIgRAk4HuWv/TPHkvnAttZhmmgtO
         mHAZwwzm/Q9fl2cC5pXqXCGcwLpyXQp5FA5TplGBKAC8T7yxnrmrZNS9klQytF74S9dH
         R8rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY6it3KZa31CxZicU/MbB9J4twICrQ7Li9QdUreNgBUEoTOLauwvxcmejJsBbDXEfH5r2jRxBaSJ0Re0MZ+RMT@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ5q4gormQJtSQzYDfzPiMaXzrKWkUR9r9D2K6DusElcaiV+08
	X1pChWLreL9PnS58vnFSxYU8cNghKhXhI0m2BUBt3OmKxkzWXRqqGVLHsMTEtES8wM8=
X-Gm-Gg: ASbGncugD6qFNWWtPJ4xMCPTEXKTad27lhS16sc2SAPhuJDNNYRswaM7nxHc0I1Ikup
	cdPZ3sgl3R/NGAnogzy1SGG2Rysv2xKiDnENevgEV69eeV8tulsKRK22egMZ4liA/EmFt8iNzQ9
	axdvmqIrQ+NYlnASfgKvm0dgZEE+bY0nTiJP+jXym48+Ro9UvjyIINF5pjoRR7q8MpHn/DbTDCT
	FyUK3Rufzi0iAiR/dhla5fz0C8cJTJfX/A27HbK933wZe3aehBhwiYdEFCX5W3/y+GNPg6XTfo/
	xpd30PnhihDUTicVq8MZRAnP6RBwQTkilstdBT8PBcjPRMfDLGaT7uyuqYLLCt/Pr5Emcpq0uvq
	dDTBzjNZH7Z0=
X-Google-Smtp-Source: AGHT+IG+OUuFO8zduSqG52Q/uKbJtNoMJ4tCAnBmQyaOHPjqHe1gEHM8je7qA53jNQAj3w0qWDlO6g==
X-Received: by 2002:a05:600c:3b2a:b0:43b:c825:6cde with SMTP id 5b1f17b1804b1-4538ee24a9cmr7911235e9.3.1751011322546;
        Fri, 27 Jun 2025 01:02:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a423abbsm43490295e9.39.2025.06.27.01.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:02:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 27 Jun 2025 10:01:52 +0200
Subject: [PATCH 2/2] dt-bindings: phy: fsl,imx8mq-usb: Drop 'db' suffix
 duplicating dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-dt-bindings-db-v1-2-d5c7072acbee@linaro.org>
References: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
In-Reply-To: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
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
 bh=Os18r53ZbPW4+3PxVUJh52djHd2zkWOgpdekfLd7+7U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoXk/0+ng738Vf2atAtc8/9LZzBj/cRNYfbJxNV
 4fZiTT1cVuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaF5P9AAKCRDBN2bmhouD
 1zPRD/9ec1PBGRt9uSGVge2T/60FqQRPu2KOpknFFJ3Yj2DgYRFSk+cXIn3PZ4WYAVB/TIJslkB
 ZIl8QaXjr0prI1lcoi0bW4gqRy+srh++tfMfquip1o0iXOCp5aogQjaYO6u0UFcq8C3+GharY9I
 bMigbXVaL/jZ4lajDdJdM+y7p+5AcdOT9IvlYrTdKvappu9skwsr3bRnSI+mhOT63xhyIF7DWFW
 zJSWlLnRXfR1N+GLwOxrnjllEQNvCpAsHSSF7941WAxyvIznVNXDTgQ78QVhe26fbd/F1hs1z1Z
 DfpRyzJsH4uEFlNn8L3Y+7AEYG/kF83EVxbdZpqmgPnuMTyE/lulfK0LIRBr3hy35j/MxYpxSQK
 5cvNU8yfNqQRq4fBQJc9HR9Ns8Xyu23bvbjNXaNb0ek6aOykGhZ4Ggi5EzVxNKMicwX/XCmsDDs
 t47EZRIViAWLgpWgxClkV3I+AnGiIQMs59AEAbgFTc7Uj+WGvsYZbeGlbix9YccewK0RopMqYCd
 XmBy5pgRiTfFm1XWRcITflD24deF+yfdUT8arxFklLnGBf33AqrHY8zHb/E5u9Xov3xZTcs/iqJ
 nD5oqiQ3Dif0Jftw7mzCCalnUJJ+lJFXGwmWilNvJYtuB6eDo4xwTFz1Ca92alNdhDTpZIGC7f7
 FaegpyIa3vtZbbg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_010204_124305_39CDF6D7 
X-CRM114-Status: GOOD (  10.09  )
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
2.43.0


