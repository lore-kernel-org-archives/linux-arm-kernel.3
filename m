Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83914F5A8CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 23:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8R1cxPctftOG89u1iC1smvABtKfPmxn/YCB26kmM4dc=; b=TzDLMy3w3+4Ij/uDLEzerP3W3i
	UyX+irqsa0SubGoeLlj3zEXd5H+HDXcRwxd4MlyG7ZtUCCXGakONdnfU8MauK5+9ynDFsW9lN7tuU
	bfpHvCcr1zVUMWFA3Srm6cJYWu6u/KMr7QCOuhXVGwyWgErbLjwpatlWrDdcJRsg0V3Edg/ZrFXB0
	Th4f+aa48d6pLsEEkI+YLHOQCQOl/vaGjGmvWsG4bQ/blsbBup9DE4spqxxpFuGiGr1kUQfS8/pWk
	MqIyh3z/wXtMWFfQb3qWk4T+kC5wKFsF6b8r71OlDnXrol1Zm8MhGtCYp0TiFWPY7hvC3MJRSUphh
	lluPCCKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEyOm-00000007qLA-0RBB;
	Mon, 20 Apr 2026 23:51:28 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEyOj-00000007qJx-0zFi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 23:51:26 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso1406717a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 16:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776729084; x=1777333884; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8R1cxPctftOG89u1iC1smvABtKfPmxn/YCB26kmM4dc=;
        b=aMaQSWfVxqwgKko2RwbZWSO2OBiiwcSuhjeagnOZQDtyj4FoxfD6Vzuh2IyfV+HaEA
         BpYX7OOc1w+8P5LuYvk/Z5LqQyx0yd9Owi9H+TxMH1BLZ+qnFWk3hFLog1Xl/RwX/x+W
         ZMdUxMmDLPfMLHaXmmqJHKfCTFsE0fscCmeqLjo7UEY+Old6Vqxw9kAl5n//+5USvuLo
         xbno3+Bq9j1g/o7zwhk/DksL1XKH1dVl55d9WB4rOR/z54opN3AkJwiMFeg7VsN+exRH
         dAlvoAVBy7pm12g+EvRMB/PDh6dsmJH5I1nCzMaUJM/hN1DBlYwogafC9JH9m0PxCauI
         8v9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776729084; x=1777333884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8R1cxPctftOG89u1iC1smvABtKfPmxn/YCB26kmM4dc=;
        b=ioHp/84+g3t63LlJ2gw65pd+9/OEg9cf6pVyz4kO3WRJQEPCliN6YyMO4g5pGe9aMh
         BPMaoPSaX7aFceVk6SZqJ5so/bBk9wArArIbB3P5pMIxpbkq5mzub8MkOT24/jkLLBgv
         4uWAqtzz4wksYnn2p/yV4ahfjxUf1EiVzUSW5jhH/fuv/jhLj76KRG4l6096WtIoMpn8
         s6MiKm9Ta2fg4qN2MtQDew2vdL77iwiVyppInoCKdTA9T2N9TrPe0TjQTBAtNgQb8D9G
         jH5/smxNiUnBIzx4mRNurvia7mFCv+z13ZRe5YLB9WvG1o9pbqg8aXfm3+aiJSQpR6BD
         3AEg==
X-Forwarded-Encrypted: i=1; AFNElJ8f8E/aH/zo/wO8cixpoQhx0OPCwLrmwLXPpYeCPvEd1YR5I07koZJS36wviswY5b9ugQeo+rL1SmEj5+Q5GRsk@lists.infradead.org
X-Gm-Message-State: AOJu0YzFwl+6RToDEMXURzuKgwbOrCGS8bQ5Y8Fz8aecxUnvLqI6/VDX
	aCIlHOgEw2A3+WIFYcoFgNo9aUMy2tE2lpy6AoZkQjByFOvoJNSoQkg/1u2u7YCK7qF1Nd7NfBX
	N2YKh/Kg2MA==
X-Gm-Gg: AeBDies0E2ZJCdSMG6wu9FPxIhsmHcC9eKr6pFnh3caeNzN5qANefFRNFEdr4F0J/hX
	pAhedBQ+W3O9M3YTRCo7Ks4mu8nGMGkGzauEe0eIJ25vrR/Ud1NhKRTxFZM1blr+dm0/wVPKjDn
	DtizWsLUvjY4O5osUv2pEuuptd+32ZpzQfME9fGmTyLOm25Nx69qPyaFNsoMddE3IdlFmo/UzOK
	P/X5Shs8WRV5O0TGYkfQ0Ke0LZU/l1JkuC9o7jh070Y45vfCRJwsJ29O8iOZEusH87OIYSM8IpT
	0sSxznP/9oE8xVPUacACgKjDNSeX5dRaoNCrP3Pq+gtARo+vNVpV3UccB4DdFqp8JKIiv8j5yj8
	PeC4h2oCJIPrgT2JALWLhtnn5kcIlXrGFDklCETj7AYgCWsVOqkhs4Oo+ZDjUU1pPV6mYgbfGmn
	VzXVTDNH3eX6gxTQGYZ1d1E3PQCP5hBA==
X-Received: by 2002:a05:6a20:728c:b0:39b:8b8b:39ce with SMTP id adf61e73a8af0-3a08d8a8993mr17248087637.28.1776729084324;
        Mon, 20 Apr 2026 16:51:24 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79770512afsm8971320a12.31.2026.04.20.16.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:51:23 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Mon, 20 Apr 2026 16:51:17 -0700
Subject: [PATCH v3 1/3] dt-bindings: power: Add power-domains-child-ids
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-topic-lpm-pmdomain-child-ids-v3-1-c2c40bef238c@baylibre.com>
References: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
In-Reply-To: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2786; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=Q7DrslDoEzNPakyLJFXorxvjgyPUA3DGKqDVH51Yzcc=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBp5rv6y5BVxIx65aoeOBX8R0eL+DjLn/kqdKdjG
 dQAzKibPciJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaea7+gAKCRBZNxia0/vG
 ZbjvEACLFm8MlgnDXUwIXc34z4MIVMeC4pRZKS5y5cxAvaZdis5Gxu5fOKT/+s17jCAWuK0q+fJ
 DbjLai39AfHqDfnLFpEDUQHABLV2HYUD6OlbhD2R4Rw++dgo3muH4Uh9fwQQhi91qGsqqKBTn8R
 pl5axwFaYkNQ/XefNvVGYI6JAY3m6BActyrFbjh9VzVVJEUlw4ghAte13QAoN7uLTfjDY+tAob+
 cgaWr46DmW2xvpGTHgg5jpLSoyBVlsi0JlWTmf4KJ0yIn+AVW5ba91z4b+R3Ig2SZv4uBRo0v/G
 KQHjmx12T+bN4wXKuCkgEpcx6I0vISxobB31N0GaSd2a5NwktJeS/WPrSLRBEUR0IWoF1dqJPCp
 KToR7eKTzaCvxRL0iNKEeIHx3IlBIGphI8U+2TeqYd4/zrQuHnX7u98R2llldy6lLaKBc0PR8Jv
 7fIMns0u0h3P0XAtvWygGW6/RqqIXTjbqUWXHPtOIdQxWACYpd2zB92iH5UmZ+3Hfu5Lblvfaue
 Z7211y5p/CKrXtFR3F7FU4bChCS0HHuDXWxfQc1X+3gsMJsEz7XpBWxSAhV6ROnNEnBdxYmKdIU
 m5+6L4n9dW507Co3jALSjmPbc/ZSck+znnQTEsmLplf0gX4qpKc5RSyfZqujiPT8vxlToYH/4Vh
 rDwvioXHnY+8WMQ==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_165125_283096_61A8A594 
X-CRM114-Status: GOOD (  15.17  )
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

Add binding documentation for the new power-domains-child-ids property,
which works in conjunction with the existing power-domains property to
establish parent-child relationships between a multi-domain power domain
provider and external parent domains.

Each element in the uint32 array identifies the child domain
ID (index) within the provider that should be made a child domain of
the corresponding phandle entry in power-domains. The two arrays must
have the same number of elements.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 Documentation/devicetree/bindings/power/power-domain.yaml | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
index b1147dbf2e73..163b0af158fd 100644
--- a/Documentation/devicetree/bindings/power/power-domain.yaml
+++ b/Documentation/devicetree/bindings/power/power-domain.yaml
@@ -68,6 +68,21 @@ properties:
       by the given provider should be subdomains of the domain specified
       by this binding.
 
+  power-domains-child-ids:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      An array of child domain IDs that correspond to the power-domains
+      property. This property is only applicable to power domain providers
+      with "#power-domain-cells" > 0 (i.e., providers that supply multiple
+      power domains). It specifies which of the provider's child domains
+      should be associated with each parent domain listed in the power-domains
+      property. The number of elements in this array must match the number of
+      phandles in the power-domains property. Each element specifies the child
+      domain ID (index) that should be made a child domain of the corresponding
+      parent domain. This enables hierarchical power domain structures where
+      different child domains from the same provider can have different
+      parent domains.
+
 required:
   - "#power-domain-cells"
 
@@ -133,3 +148,22 @@ examples:
             min-residency-us = <7000>;
         };
     };
+
+  - |
+    // Example: SCMI domain 15 -> MAIN_PD, SCMI domain 19 -> WKUP_PD
+    MAIN_PD: power-controller-main {
+        compatible = "foo,power-controller";
+        #power-domain-cells = <0>;
+    };
+
+    WKUP_PD: power-controller-wkup {
+        compatible = "foo,power-controller";
+        #power-domain-cells = <0>;
+    };
+
+    scmi_pds: power-controller-scmi {
+        compatible = "foo,power-controller";
+        #power-domain-cells = <1>;
+        power-domains = <&MAIN_PD>, <&WKUP_PD>;
+        power-domains-child-ids = <15>, <19>;
+    };

-- 
2.51.0


