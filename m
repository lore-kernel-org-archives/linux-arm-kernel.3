Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DA3C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Md7OwEIxBb/AOmWc2CKicH7/AjSUhK7eVTt1OZEiqnY=; b=p7pOANxp92hQxdR12529SlGK/y
	H9+JN2FQTkl8CgyFfRYMd8g+JWQNV2y949oSLRrv7WdGeWPKJZxj/NOOxdKL0PnQqL6PRQ35Txvmp
	wdkZ5iSIcUsRxjfnH/Sln5ps/yY9Vaj+ERd0r/57SlkZuCSvTUfZIiFGorafOezHqdPNgAausrJkY
	DzVC/Bopw689UMcNRRBYWFlUYVxLHQtt+kplRVjFknixTgFZ1FUDfD/ASX1AB/6fIDS71YhOPfckz
	uX9aGrfzx9DE/o3bLVjl1j3ADEGi0U+IT4s+/zOprO8b+U+4nIGYIlqrZQNJBdN0HrBH0UtrwV4E8
	qCjvoV5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MsA-00000000OPW-3EBi;
	Fri, 25 Apr 2025 17:29:58 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KZU-0000000HXha-2Kcy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:02:33 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso2429809b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 08:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745593352; x=1746198152; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Md7OwEIxBb/AOmWc2CKicH7/AjSUhK7eVTt1OZEiqnY=;
        b=Gbu1mw4FmNvhibIRbBOEDQcAdaP0JtfH30mM+V2lnS1fH/ut6velaY4TlwG+M13TFL
         YO5XX6qfyib1Teth6SF7pltlLPAFU6T/a39fGjjnGcnaeTMKOQiJr4rVl23W0z8DcZWP
         PKdVOZf0XmwF9AGy2bipOSxUMvSepOFBYdCpOsUTnfIlPxCNPoynkOfkUsKSvyv5pwAk
         N2PjOahvLSJBaWv8O6cR0yeON/ee8qocycNw9+kRgcILTnFPj0snyOWyXLU8gh+DhQqr
         dGOMf3sLhV17IuHhQO9aZ6wtRuAgo8B+UKn14juSI89VHEqOTBJdYbkGlC6cAOYW4hW3
         8fUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745593352; x=1746198152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Md7OwEIxBb/AOmWc2CKicH7/AjSUhK7eVTt1OZEiqnY=;
        b=W4CZvKj0uGnZibNJ5VTYM5HOM8LmThxZt/JygiHXjyBSs4ooE3mt8nrEKhr8iUh+5d
         1jZV5LGDnYGvhe9ZcQmeDiXSSAHWjG77lnEgnkTOdOI+RgT3FEQjB6O3nx6ilX+VxnPg
         yPai0bfJmExyH8cwW1+OHL5Jb3QhxsmlKVq5i3mrq5VOwnSHttci5r8uZFEY9j3XaWKw
         6RdG9SGk5ejQKjPh/3KML0eGrYkd3Ne6spmeut1yoOCpBJcZywo5DYQVIgLS3kDmgo6q
         Dnap586uo2Y/LzuGlbGHxo9O0VLa6w45oLc1HZqyH7owlP3ua/W5TS2HPv7WUuZ/sg9a
         lBuQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3FcqP940euEK8XukNwTubIsoEM3OUYVMehI3Rl0jiQF8Lo9BI1Wjj1HElAKWav8/0hXIfQSJQ6y9fEJsie+fO@lists.infradead.org
X-Gm-Message-State: AOJu0YxvoOKN94ua6yJr56A0/XRnkPpCMfONZSDiuLeBofjjxOyomxyI
	n2kZcfQ0fzb+ILMVMWcoDSSByCl/Fe4So/1PyVN7OgGvqh/AA1os
X-Gm-Gg: ASbGnctN59rXBhdUINxQMkQA9tMuCUFNUBQCm9+J4ooxPH48Dh/DSRaAEOxnLGnsKEa
	XXofjCZKx+qM/GMMxO6F8+9k+vFZbn+5/Xvyhpr4cOyeHbPrVLAChz8VVfArnQEN5DnMNsL2be5
	H5ch3XaeAc9C+GOgHjUrEPTaSWJMsfs32M2VM1/rqO6FlIiRwqJe8c+tvqWQBG4tUCaaGmn8oVD
	jEAGzRNxpS7DglIsJpf/8d37cf4CVFisjh5zuX40Ob13GgPZk7GpIiXgR2m44+U2akqs7ksCNud
	6Vqp5rZmv9V7uWGj8fXpLN3mv+/yfU3UScHTdLrG3JYMpRisLFkM
X-Google-Smtp-Source: AGHT+IGeqmJGp3jUM7OBNFTR4SzWYeDt4a7Rox6kca268T04kWWvcnC42XpCBklitFhGhK2gKp2AOg==
X-Received: by 2002:a05:6a20:1594:b0:1f3:4427:74ae with SMTP id adf61e73a8af0-2045b75d899mr3863539637.25.1745593351666;
        Fri, 25 Apr 2025 08:02:31 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f76f45bcsm2996984a12.13.2025.04.25.08.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:02:31 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 25 Apr 2025 19:02:22 +0400
Subject: [PATCH v5 1/2] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper
 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-apc_paper_binding-v5-1-3aef49e97332@gmail.com>
References: <20250425-apc_paper_binding-v5-0-3aef49e97332@gmail.com>
In-Reply-To: <20250425-apc_paper_binding-v5-0-3aef49e97332@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745593359; l=1490;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=eITcbj1L60r7L2HnV6pDbRtxNcGPDn1rrU3xxeHimUk=;
 b=1I8MCnYO5+9K1wrul6CZEDvk6WpFKf+Jm2p5Tf+u9qQNVpzU/Ft/EfKLhqbPcjGB/43ogYBps
 X4/iVJ8KfmMCuV66U5v9c31Ehldxt+7VRx7UB+N+KBbdkttJghOWvMH
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_080232_594839_41E35E1A 
X-CRM114-Status: GOOD (  10.87  )
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

APC Rock is a development board based on WonderMedia WM8950 SoC
released around 2013. Paper is the same as Rock but lacking a
VGA port and shipped with a recycled cardboard case.

While at that, put myself as the maintainer, given that Tony is
unavailable as of lately.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 Documentation/devicetree/bindings/arm/vt8500.yaml | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/vt8500.yaml b/Documentation/devicetree/bindings/arm/vt8500.yaml
index 5d5ad5a60451f569e6ef30c924a1964d02e1aa82..fa47b8989bbfb3001ae7bf6b6db4ef16132f047a 100644
--- a/Documentation/devicetree/bindings/arm/vt8500.yaml
+++ b/Documentation/devicetree/bindings/arm/vt8500.yaml
@@ -7,14 +7,13 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: VIA/Wondermedia VT8500 Platforms
 
 maintainers:
-  - Tony Prisk <linux@prisktech.co.nz>
-description: test
+  - Alexey Charkov <alchark@gmail.com>
 
 properties:
   $nodename:
     const: '/'
   compatible:
-    items:
+    oneOf:
       - enum:
           - via,vt8500
           - wm,wm8505
@@ -22,4 +21,9 @@ properties:
           - wm,wm8750
           - wm,wm8850
 
+      - description: VIA APC Rock and Paper boards
+        items:
+          - const: via,apc-rock
+          - const: wm,wm8950
+
 additionalProperties: true

-- 
2.49.0


