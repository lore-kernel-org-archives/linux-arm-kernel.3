Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18783C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 06:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgrG7OeGQj76YEPIalvtDdq3ojvcIbL+3UwDpcCGYaQ=; b=As42HMwwX4CQE1oDzveDplgvI5
	XD8grC3je40kb5SdY/8f6scuuKxnSNo7JqwWHf1Uz9/vYI3K5YBUanoinZFcfYGMJJnBSY6bUVE/2
	4SzNkUgjyLa3d7jIt+n5yd4TWTjSIIwpcGQlGRAUjrWF0JL7H2XzF4AHeMfYfMbqC2CZzH6VwUBsz
	tE6cAf2ukxAX4c8pjc1vvUU7+AinV/jxlQTTkqXplQ0dq8X+a7c1hG76slT3jHCOJfa2gb48Hnncw
	x+M1260fKE0FhEFOOEbN5dEgjnVY908f4nl7nNXzc30qBrIDwK7pB6Z8sBmBsQBDLYRAWR3AhSdHF
	8hcxqpbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eQh-00000008ZMj-2CEI;
	Tue, 29 Apr 2025 06:26:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eJm-00000008XPS-2xMM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 06:19:50 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so46850285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 23:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745907584; x=1746512384; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YgrG7OeGQj76YEPIalvtDdq3ojvcIbL+3UwDpcCGYaQ=;
        b=jwiLg2R6j3LxckdGt9ZRMpIbC2zBvBpl90/12WUPuboEDFXqMMgTnt9QMD3Oz4ZD0i
         g7bmoaoscztikNO1857CCI1suEVjOllzDEQ04/i4Nt8u/zgH+dNcObn/eLrnl2F4iW7L
         n1FiuUUEt9mEDxLaBV940njVLA6jh6UI1uLEQWYXJO9qJTDOdk2VEL5moH8pS1Thmu6+
         G89E7aqerzQKkT8GurfSbkrDGHR0Iyxry96jJoVU1Mqmbo+vUVmXjImDAyiuAPhTjcM3
         ZrlbYPc89nyWrRpgvNNhAdYWwSkiOr+3qdznNikt0IyBywzStKq78tM5G+jOPDtZnYkT
         xhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745907584; x=1746512384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgrG7OeGQj76YEPIalvtDdq3ojvcIbL+3UwDpcCGYaQ=;
        b=j0qu1GU30itW0h35W/xQfw4rPbkvEjQE9Rcf5/xk7IpBPSk4wmawfdwbzzzko74j9+
         W9lszAQUdLzlrt1d8llcKG+Mbeqy4R6NXoYgj7HQD+P0WV0YAAwEyR5lT8KVbnflWI4c
         ngsbKmJJrf9E7YMsxj3cCPvc/fgOXvnkoimyIQagBdEnBp98/OFNAmANhMVnehTGIA4Q
         +qG41KpXdk2R7ADlbKmfCvvqCVQaX46waQSxQr2e6wpR7TUgCGT5mtjs0t1VnhI/Sfg7
         4OboOlz3k3dLO+3azi3oI6KaVXmi2uiHwlDAFcM1fMbGWqO6erIqI/kpyUbgLp8caedF
         uI1g==
X-Forwarded-Encrypted: i=1; AJvYcCXOHXLFKmtcsOH4J8ARi/LlgXqWAx5d3tARqlR/zCpjMbWVGbsTz1WMLbhBo1Dgq0M6Ly94EmZ0oLlsv1K2OcRZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzrKiF59y/xQW6q8tzSQoqpV1mx+qippGje8vTde00w0DhmEjC+
	g+uldiXWcr9SnEGHTSQudKlH6RqyDtG5SJOkCGqlfo3v6u9MNdRikC3T6sZRzSA=
X-Gm-Gg: ASbGncvow++MmRUa4RIIwRx7e2h3fYjIHccOAlJ9TP0AdZEfYOJ3hjqF2rsdaTYiL0j
	5rkEIcNLj71L8qwqh6OZjXpZIqU6bwSOR55rdQt4qidU5Rc6JEz5r4G+oH4tOtr+Am+vf494Iw0
	lzYUFJNP7vIFxf3pWKZ5rMWT4e6XtlShIU6VLpRkFeokaUvHOguIius/tV6aJZw60z6WHn0Pd6a
	N1q6sPjdWhJjVrwkrMgAyG7L4aT9NyQh3PTeapchYhnI5FcWrahm4iJrGMaOdtpzp9by2ixFl94
	+dCUsCD9hctnBdZD62gJclwlRLJVGvONdBfNSHpYhjhWaZuRp1TZx99eDgxdyy6zsRYeOeVTR25
	Cg+cX3w==
X-Google-Smtp-Source: AGHT+IGHSL7ckT6XlTUI2xoHREOmOeno84QNXGxfUIyn44nQrEmqF08HXr04DbsCv07w1TWSDtclsQ==
X-Received: by 2002:a5d:4571:0:b0:39f:d13:32a with SMTP id ffacd0b85a97d-3a08a537866mr1031592f8f.29.1745907584641;
        Mon, 28 Apr 2025 23:19:44 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4e50sm13302616f8f.30.2025.04.28.23.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:19:44 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Apr 2025 07:19:38 +0100
Subject: [PATCH v3 2/5] dt-bindings: soc: samsung: exynos-pmu: gs101: add
 google,pmu-intr-gen phandle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-2-1bcc44fb1d55@linaro.org>
References: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
In-Reply-To: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1391;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=1p3Ed1Wp3JQMkXl6MiiaCvCqz+Q90OFJQfLZvBqYLnA=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoEG97nzjm8S2bPdEwuiDbGAt9JuPUE3hHH4CEN
 d5l0FTLThqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBBvewAKCRDO6LjWAjRy
 um9aD/wOuYuYHXnqEPhVHxNZhVZWFZxJHmZAUbkLkvSr3c88SFKnbaZnosW02hkS+GbPrh/QiQu
 MQQe+87iPfi0pZqPZcfs0QSf0P6/4+3ojcT65lIj+QOvCu+uFbA10RPMhC6CkEpO+Q6PgFcVoNE
 /VbB3sQ7RtdxGmY6CljAOZUhqls4daN0yy78gZ/tqPvOZQIwwAfm7U7AvAEMUR4XbSMqMUr2lfE
 3au1OSNRRXwIgUDp3yyScZgrx0pTSBeSoKD+r5SJGW+KdbpNXs14V5v6qGg/V7iDVGC7LHOH+By
 IMwZ05H4B+TM9iK6nBNybIDqzWnbwPs+/V59MwZJp8y60beVh+U9NKXOooW8vPUafX1LElU/FcA
 5raSyGg/tvuqBpsFIEM0NcVYp7g4LtBW5yWowJ0Ut3qZwhuPKalvZgc8vHVwIfpAfVVU7QgU3rU
 7seE8aRb7AkLTBDn/5X1hnWNgRsKfKO6kKmPLhIoQfSGBklLsXPaavjmrxww0Ov3EicnHb7D7Pq
 lNr3sUJQljtQl848LzuDsbtgbtiK6q13+DB9/z2cyazIsdCalOG1GDzQnxEZExE4TdZxaAQPUaY
 Ri+PONPrIfpJW6hzSaAdJrcpoqWyL8pOdmx5zE5P3KGG/BvKMPjgjX6zVvj0GXdkaKiR4IswZjN
 nDgLJRNINGZjpHA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_231946_756819_2F08FB9A 
X-CRM114-Status: GOOD (  10.02  )
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

gs101 requires access to the pmu interrupt generation register region
which is exposed as a syscon. Update the exynos-pmu bindings documentation
to reflect this.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 204da6fe458d2d4bfeee1471ebc5c38247477ae2..3109df43d5028c61cbcaa597e7bd8cb530eafb37 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -129,6 +129,11 @@ properties:
     description:
       Node for reboot method
 
+  google,pmu-intr-gen-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to PMU interrupt generation interface.
+
 required:
   - compatible
   - reg
@@ -189,6 +194,16 @@ allOf:
       properties:
         dp-phy: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-pmu
+    then:
+      required:
+        - google,pmu-intr-gen-syscon
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>

-- 
2.49.0.901.g37484f566f-goog


