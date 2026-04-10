Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6910EF45A0F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 23:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8R1cxPctftOG89u1iC1smvABtKfPmxn/YCB26kmM4dc=; b=asPdllv/HWRbFxCOwSxMhupYet
	6rnlqQToibHppGVBdimt96c8cUKuVTpefGZpqdv+8TGMWZeH/ZqROFFE/i0uL7PgFUqA52NwBFzMB
	aO1dL3875OkI14wtcg0K9Ud/aLEJVce+umScxY7XYMvC7sitVFzaXaUFzu2SK6feA8e2loQS/xLie
	z/zHBtNOy26Q4AEK4RJS/KIUOiX5nadrjreBEnD6HWnzp93u7Y6E2/sr92sXR3PX45nNMITE/JxOr
	PhdfjAFFJa0C9d5KG6IyVCoQAiES28WGCD1jDSD4oFVFFV0RggnBq8Xyn7j9BynfbAMHM3NLnYzYs
	uYV9uT3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBLWy-0000000CwBR-0XXK;
	Fri, 10 Apr 2026 23:44:56 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBLWv-0000000Cw9t-0gZP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 23:44:54 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-82f0884bcfaso1193810b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 16:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775864692; x=1776469492; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8R1cxPctftOG89u1iC1smvABtKfPmxn/YCB26kmM4dc=;
        b=H/pOnc/cKZV8I4p6X54hv8CZeEcTdN3+oi5ylYf3vc9qMBk+/n74qFXJ8ewiOsfnxM
         QpI43VZp2mpS3dJmKT0HjBBFbvtYUjthPLy0FRfqnm1faTJw3Iev1DbKXu2HxxBqs6ln
         va3J+KvKoOo7mt2nY3JVtYleVgGL5lUfTddGM57Ol1Y9vtYxf7cFl50S5fGgg5K+8q/2
         UU5k+GjxPSETXTs7NbMVhABDPYcSRGhjEHFRBGLibRoISZTBKJLoOKYmEut4SAuBH3Cb
         QoIQUPVkMN7rMI5zbf7m8eyL7mZ/cMhsvYEawEzXbKWioP21ZvHP0NDsFPq7CF3OgWqn
         es5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775864692; x=1776469492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8R1cxPctftOG89u1iC1smvABtKfPmxn/YCB26kmM4dc=;
        b=XFi0RgLF+3EfHQXrvqYy9r2S+76bNwJ84Oexi4m133tvwc3SQaQnGPzoZiDdkn0/Ru
         JES/Ls4GZFh35mgYzSxEa2bhJRUGJnKDWCWANTdPl8qU4HdI/N9IvjMHZwJfQeWqOzjz
         ownS9Or9RreyxFKBFYY+bEi049zu8Quwix6X/wVLC+OJ3sbQHFVYwWoB4DnCK16wjjIx
         ZHfl60/+K45rl7FbVpma3BjSJkeOPJv5SZDsO4HPMYMi31gV1DXAldYFpEGxJHr6x8Mr
         bLZKsD3xBdP8D6BO0nKZchQMZ2m9vRMQw08jFEpfX0Zj7rMG+LZmuwqC4nS9H4aly0Fq
         pw4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSWW0BkSE1uuXspdFe7HJDEqb2KIXJAdrDUNGoi2PCuvWgw/O81e9n89h53CLZvp7wS4zo8507S7m5+TOPkgwT@lists.infradead.org
X-Gm-Message-State: AOJu0YxSueitCGBhKFPa+kBVqcEbUHtePJYOO5jk7Rm7R3ox7wO72S5r
	xcr8tcbCwRanRK3HO0ZQXUDF44AnBzlrs01sQjaU0XTtXZ98LWJcR6tnXih+KoHE7aQ=
X-Gm-Gg: AeBDies5bBOHFiFgTrh67Agane7hTKmYoY69QTFxG09NpCs7zThPzjrVemOFuNE39A7
	0ItvbdEjzdKCxH6rMeZX6KiOyoCmC+kYagCb7eArfMPMTNLN0qb5MUJaEdkH1COHt0L82BCUb9N
	ZcTsFz8Co/t9LGgpSbUclkUy+qBYZIorkFN6OGoMWB5SJVxV7Vx49FFD+65woS8q7XKCyLEuC1M
	1mE0OwekM61lPt6ivHI9Cor7XxpqMGZUL+5mmWgWv/NZNXAXnOmSevWh3aPlWwPCNCnRZ5k/twZ
	iwG5N7XiVBglrzltCqqOQgMr8uGX094UhHfhUfe1gDB2hS37/BiY1WzwmZb76WJ3S+XZl4MmsH5
	CU6ONlP6+0a5CetYFgEDXrQZ+hfBRmA9B8OC3ihOPc+Xd6CC3E0LArtmpLbXr9rKS25u6OhxESa
	0nSuZoPwlS+TVK4rOR2as=
X-Received: by 2002:a05:6a00:ab87:b0:82c:d861:3caf with SMTP id d2e1a72fcca58-82f0c330a64mr5568325b3a.36.1775864692381;
        Fri, 10 Apr 2026 16:44:52 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4df7f5sm5463230b3a.43.2026.04.10.16.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 16:44:51 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Fri, 10 Apr 2026 16:44:36 -0700
Subject: [PATCH v2 1/3] dt-bindings: power: Add power-domains-child-ids
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-topic-lpm-pmdomain-child-ids-v2-1-83396e4b5f8b@baylibre.com>
References: <20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com>
In-Reply-To: <20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2786; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=Q7DrslDoEzNPakyLJFXorxvjgyPUA3DGKqDVH51Yzcc=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBp2YtyOdtjOuG32HA1t4vZodKj+AtEzJXdLxdNK
 SBaLyQt9hWJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCadmLcgAKCRBZNxia0/vG
 ZVcMD/9z8v/EsqqHjDNjy14vtJNbHcyIHfgkcmj1hhwzj3D70G/XIhtqV07i5/gQ3fi3xIBTY3E
 ntok5PuQhWiF5bk7yByI///EuLdnvu8CQA/OUQd5Tv4PgvFs/4pA7N8O51dzMpcmwGUGt0ypEsa
 a09pNZud2wFIMRxcn5hsEWfd6bM7lkbrXlSKtM8ITugv+rlyHK5SjNpTbq1jiMPFMtKPHVM/J+/
 YLDhxDToUY/yaVUPyhGRSIPRLhoFdL9MILQ4epNlNf1dBsi6HZ3vi7mFfR3a2HM0CyUdFgf1+O+
 D5VEJGwJJuRgBDzq4B/5wDdiVcAS24uCR7q+z5SFhw3X11l4mK4lT3T6v15o6BvHBchxqCLXzmf
 peaV81WmrdSNnKRcpBySD97Nx3ciwLFN+o3bClhYFr0+LbtPHDF9diKwHxDLjgifWR4newliHnI
 tkJz1Cy6AeUUDV9tFWYOFVXADN2fPx3zg7lo0119TJJlbRH1xP9YwdEuSfuAsYeJrXWHtPXsvHm
 rO6AAdGOrE6qU4/vbZNpxhZs7cLy9mz3ytBzhIN9pO3VqP1LuPoHRYIRVhDRY7YdhialFyXLb/b
 YzIQNiLC8lAw0DjQ9sFz0b0Z5t2rUrMtqH4f9D4H+00CA0zuOwehTwi1uhoMuh/S00iifjD5c0o
 ao9SZfFhrVfcLOw==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_164453_209953_9D0EB04C 
X-CRM114-Status: GOOD (  15.25  )
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


