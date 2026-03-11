Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAD9FD88D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 00:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRPHMWr3RYeq2LdlKWsQydyKI1DDcq+bxSSt+FcIkkg=; b=LQK7h5RuvI1kBv5uxg4ckC4XRc
	WPM1P7Rqo8SCUvoUTMRSJ3amge1s0NPmewZjc4P75JqsSulVNrUFX72pOvqnQ+Q661qUruk2groz7
	KSrjdTT2pEsBd0+IvQBcdQVuBLoRORBEWfhZ+MyYDnSG+vNUGK9yyT4Q9VxqXNxKnLZ+7JWdcV460
	ZShf3LEvoJMT2ymKMUsIpXE0BhGrq2hLn+ZYO+HRpDaSq3Yk3yvdNuV0PETvgWVddKajtz7ab4T8b
	Y2n+G3ik2yNQ+ORtpgIqc8wp3puSO7/BW/xZxdvz5JoK1ezVDtPEqyBgCE/Y72p7bwvQl6YWpIkmR
	M3fw5l3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07In-0000000AQJn-1f2l;
	Wed, 11 Mar 2026 00:19:53 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07Ik-0000000AQIl-0cM3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 00:19:51 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-359fea895b5so276813a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 17:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773188389; x=1773793189; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRPHMWr3RYeq2LdlKWsQydyKI1DDcq+bxSSt+FcIkkg=;
        b=tqW1rROIMzJ61/9YlO0DVUmqX3SCf6dxGDRo9Y/we0J+R4jJy6KM4g758BFaFJIUlp
         RlD4dXt+0QqewKZqfx9XdYfon2zhYd8zyWDqlioptfByfXXs1yK4JqBw0+R87y4aoKVN
         DpHAKmYYthxxfvYc16slKFYNR71wo4H8JOisNZESgeAiqHigohopLpn8D4Arzwwnt7AU
         pK6uEe+5h5z4NVmRZkHaZk8DH14c4a984X6StbPsolsY/mW5sDX8XpRwYPO3UfLY9UCE
         lSgggZ9fxm4QgbRfpXSDkewCs7bQmDYuG9HDbUBGx7sUz1c5Zf5tU6C7OVXM5/nXsFVf
         lCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188389; x=1773793189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wRPHMWr3RYeq2LdlKWsQydyKI1DDcq+bxSSt+FcIkkg=;
        b=hlw0r+38J3Y5xiMiKDz2Exq/8SLMFIllhRUKg+dq80uwaGBkwHX/vt7//FvUFDWRYG
         uBXhLKO+7UXNA2Uc7o4zqHJlwUTOVKA9VJQiBcCC5EiiRDwaJOXGGwev7YZHYNZouAzM
         0ss5ERYsSvFzBYUhHG/4wTxZmEWIk4G2UHXyP0cBc3lDa0gOVahF4BXbIhfses2rpog2
         d+pPjPAYxEWO7l8sL0WxEGOYMOuFU2v2fGO4w+b972awF+LTskKyY3UdnmScAovebgY7
         ktGAYHXfWk9wp3K/ReExsjk184Mxcq49oMOlJ5J4+TeyDPb4xNIeYnR0HEp6nb0s3+rY
         9rUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj1D4r3r+WaD6YvHhCxDqh2Y1zt4wHwzo20ySjdPyIZRDsBHXL9kFOyTzm6clbcddll+y8+ddqsX/Wh8Ufjw7W@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjt8EkqK0bzbIeLi3TZPulqqKMP/goWwC8ZMIU2S+tfcee3qjd
	UkJt55L70cemnGfZBoEYAZzZIyhaalbuBlVDjQjCWTKTPNEi4MW7YhH/2msqgoSSHsxw4eDmLXZ
	BzXTd7kY=
X-Gm-Gg: ATEYQzzZOf7RsFG39LGzn75kKxViMGaRH6jhVfiwB2QhEPVQuEF7eGjflHV+ixt62Zu
	GBSsG+vqTmF6BfRajf6ucJniSVX/s/Y01EIDWW4N9/lm4z3mKAGADN+B/Am/g54PMg/QSca1MfW
	Kbnt26tcPDxKMLGi7/8MaiYeKDR80bA7KIq+pU2h8+VtFtZLOCa0OR2ojyGBH92+0keva9ccOqy
	qz0TIxOAOj/q6L/qvpjpuGWrIJlxOBRw30ftiEfwopY52B6Dm2WLa0L1rpIp73jHt50XfEpzIXw
	CBerIh+Ja2xhCsZ7jRRfLPRcR1mJxahvswzGyEzdyVCPsQv+uXPGLOQO4tg6YJgSvvMhuz4RhWH
	EQjqP3H06a1YgMcSl80u/eyqEuwJkVhRygLMNFpxGg1fcQlJ4WZ1epXFxuh4BsTlFLHL6A1nPaQ
	qrGF4EC6EIPw1iiPXY6lgV
X-Received: by 2002:a17:90a:ec85:b0:359:f8c3:dada with SMTP id 98e67ed59e1d1-35a012cabc9mr688568a91.13.1773188388912;
        Tue, 10 Mar 2026 17:19:48 -0700 (PDT)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a01b174ebsm174134a91.1.2026.03.10.17.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 17:19:48 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Tue, 10 Mar 2026 17:19:23 -0700
Subject: [PATCH 1/3] dt-bindings: power: Add power-domains-child-ids
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-topic-lpm-pmdomain-child-ids-v1-1-5361687a18ff@baylibre.com>
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
In-Reply-To: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev-53144
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=W4xSkkVIycg+yElDAfB07bsC758UPlh9LzCrHeiEG6A=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBpsLUi4DwekAQDifoz6ARcFx1D9uf8ysPKH/4U6
 vky1ASsKDaJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCabC1IgAKCRBZNxia0/vG
 ZYGFEACckVcCs/uQxZ/ASYWG2Okj24RX8PZGa/Q2bO9XBt+1kSdS0YnC1imfvCon3WKPZ+5/lX8
 K/h0jB3AX23jBP0sbB9ihDlFHl8NSt79A4R/Fj+RHLkHwqr6I3wJCBApPbhRbm51OWvPVocCUk7
 BdUpZaFVX/YZ2mlmedt6g1t6uOA9GRgwMbn9vSXYCjrEa7fdf+/eojIBzgJGYstukKyehLvPvUR
 t1ULjrmjCBPrVdZqEb9NyKnX7vMjRqyZZ3qEJt/JqxrMHH89v49u9MVH1WoRvU7Yl2lrzpnAHhQ
 wwfvo1Avopvsy4jgjxfCUEEuo+SAwauxQ0PCM/TWNKZ7/xBYcoKgA25cy76nWua/oHzbpoBHJpV
 zbj6gF0AstTdZNcdiNXkLtZtHIJjBf9hA5Oz7C/9qpec+1lobL0fQLzrWfUYBFkqPXzdHLkpXBb
 xn4SyFKvv76YymCTBlQgHN+9+aa6SJs6XM37pa7Cl60LcddnLIyp57NwJlP3d78zjGDfYfTLSyF
 3zxi0VrF4XO58kCZG6D+GxBSNfpeZPP8OLlugM2ftq1gzpDx3tSjHHcCUqpFSc8/IOsbVKACQgY
 /g7/SLGeKw1gZYKaSU4ZWi1Rxnn2ya8xY1KO5ioZ79wlrkBRuE7hx3GJ6w4HdXaG/4EakIz4O1S
 Em9fX2MDKctxdag==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_171950_197540_23592EF0 
X-CRM114-Status: GOOD (  15.20  )
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
 Documentation/devicetree/bindings/power/power-domain.yaml | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
index b1147dbf2e73..a3d2af124d37 100644
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
 
@@ -133,3 +148,23 @@ examples:
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
+    scmi_pds: protocol@11 {
+        compatible = "foo,power-controller";
+        reg = <0x11>;
+        #power-domain-cells = <1>;
+        power-domains = <&MAIN_PD>, <&WKUP_PD>;
+        power-domains-child-ids = <15>, <19>;
+    };

-- 
2.51.0


