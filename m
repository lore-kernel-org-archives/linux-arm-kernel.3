Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF9FC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 10:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtY6xQODciaFQXT13QEjMt2xFfxEtt0WYueluTMBhAE=; b=w9dY8Znz+uSbBIb5NpWaa/oQqX
	r0CfREi5h8VczD4QHzHNsYezHn8Lleua9C+I8F7nDHfEn9bhnTYSU0I02jJiLI8JU4Ppkt2QxpUCI
	R+kh7Kj3vddWdEq9UL2BN4gfwCvmRJYHHTmPiXM9VlUhIRfd5cMkNKBxEe03nFik62d28XAmtTjAM
	+AAGakbJo8g3YfirDi+yH4MEoZFPScnNYVaLJN80IIuZeoa+6/AvNCn9u5Ce0gndfDWG1Dng4x65q
	PENBpFpAvhWuqmimFnJ+0FIq8kxDRcLJ+TdlE43W8n923mftokUNe4l3Uen4c9STK2awEwKOstfmi
	VS1yo2Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAcJ-00000002CUz-3S4f;
	Tue, 22 Jul 2025 10:53:03 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAN4-00000002Aod-1Fcj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 10:37:19 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ae3cd8fdd77so1007635266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753180637; x=1753785437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtY6xQODciaFQXT13QEjMt2xFfxEtt0WYueluTMBhAE=;
        b=g5muaiAK/d+C/yBa2Db/Vf6sySmsNZys5+FTN+iHLctV3KSJWk4QrqK6H2VY+lvCQn
         faQ0fbohxPtXOCYCLVSfirUAfEvmj4fzky/mFxeODUofpuN16OJ0gZJ3jH0QIYltTfV4
         lxBvpUMh695fvXQSvIpJcpWfWpfPx26/2rgdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180637; x=1753785437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtY6xQODciaFQXT13QEjMt2xFfxEtt0WYueluTMBhAE=;
        b=FjFGDHtZwlTJRmx98cMT5vNCk+rdrQorgqvCzGdAn4JNxRQbi1yl6tUzkhRv+YJyQV
         H428Urene9eq0OGxfXskjqXEMswrufQEabbOdh8B9RxdxzjFIJtQUcfbMG2wujzMt970
         BqgC5Dnl1NScyQFki3ZglDgt6tO+kWscJ1EmRY95BA5dVZzTrbgql2OjrTwAXo4qKjJb
         CxBokdkBJXWILuZoPU8mBhgsDUzbFdFceltDBfd44uVM/WsXSU0/WZnjRRJU56pqv76c
         Wbw5YVafw7eAAjcUb8pSn/A0qqFRaZAbMNeBeL6PvITQT3bZieJvN3FPMdTEVeY5lLh6
         y/3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWe3OC2eFqtiWL/7hE41dvR/Ies5a8cZzBA7lIzLJArskdC6UDT8FKlcg4seM6W+6iAfepfYYfvn2FWmmhlRnS4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc1y4l01p/2u+15+L6ieAkz5mneMlkKV4SLwa/b2zby8D6REIk
	c1Pzo9NqtMOIXPph2AWJZ/YA4tV83fP/P7lAnAd6JR2TMtTVAkMKz8hT5VlbZTSBsaU=
X-Gm-Gg: ASbGnctjbS1Ik9XsinmoMMXw/is389KfqBkiI+2xCa4PJ1LJDx5dP3O8QSj9ZjppDxH
	PaL6xqPYfmTmvIg0PXjFiT8MpwR8qu0C/L2CjcGGPUiYfCpXIsjZYHjE9gNRtekw3G9dQZp9UXc
	W0RpHJrVKmRjhl7jq2f5oVLd3w1De3lPtAI3cE7P/KvKZBpvKL+9SLU7Y4QqHjtpqP2h3PIprud
	qonVDETHxwwN5ZXGIToZIdJRrmMtptbyICrvIfFN+VfiEojwuxJILc4Ejx1EuYE6VP0srewRHLm
	meGYUCHiWtc4H01ot8A+a83jjJWhFPs564cPszm/ry2vIOO1HXhT04An1uKmtKO4/syniO3fq2W
	kpt7c3QkGFoWknnrHEFqMevgEyp5DtclE6zV55npmdKrgh/A/G9y+uE+cNa0=
X-Google-Smtp-Source: AGHT+IGaHOYHJrE7/OlnHeCdJT7X6M+1OGRNxK7Jx2o38iPchbY1YGECx/VXRXtQUdO2o2c/K0RoAQ==
X-Received: by 2002:a17:906:9fc9:b0:ae3:cd73:e95a with SMTP id a640c23a62f3a-ae9ce0d2aedmr2549138266b.36.1753180636628;
        Tue, 22 Jul 2025 03:37:16 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:2bba:d7b0:8e79:c982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca310e2sm844568766b.79.2025.07.22.03.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 03:37:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add fsl,glitch-threshold
Date: Tue, 22 Jul 2025 12:36:16 +0200
Message-ID: <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_033718_336467_BFC83EB8 
X-CRM114-Status: GOOD (  11.50  )
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

Add support for glitch threshold configuration. A detected signal is valid
only if it lasts longer than the set threshold; otherwise, it is regarded
as a glitch.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
index 678756ad0f92..2fee2940213f 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,23 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  fsl,glitch-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    enum: [ 0, 1, 2, 3 ]
+    description: |
+      Indicates the glitch threshold. The threshold is defined by number
+      of clock cycles. A detect signal is only valid if it is exist longer
+      than threshold; otherwise, it is regarded as a glitch.
+      0: Normal function: 8191 clock cycles
+         Low power mode: 9 clock cycles
+      1: Normal function: 4095 clock cycles
+         Low power mode: 7 clock cycles
+      2: Normal function: 2047 clock cycles
+         Low power mode: 5 clock cycles
+      3: Normal function: 1023 clock cycles
+         Low power mode: 3 clock cycles
+
 required:
   - compatible
   - reg
@@ -94,4 +111,5 @@ examples:
         measure-delay-time = <0xfff>;
         pre-charge-time = <0xffff>;
         touchscreen-average-samples = <32>;
+        fsl,glitch-threshold = <2>;
     };
-- 
2.43.0


