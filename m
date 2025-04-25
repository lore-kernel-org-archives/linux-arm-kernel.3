Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C7FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwF9CflCPdWCYrp7r5q+/Sk502aNvZmEG4uUszEXbak=; b=2eszLszy0apT86R86oqjEF76Fu
	/zzRAfCBcsvM8hTD/1yD4dLa2RVW81HIwX6KGghvxRynn/kjLB2sblz+XbzQ9/JZsTf2RKYbzsACK
	x5jvMiBc3zSv/yfiN2Ifn++eavKDD/0Ge6axYeqR/IHvuvUFDqW+8h7TTgGl7DINk1vI6udWNplED
	KDPhkLiE2+LLdQuNmwQ4w3i2fBCCzZ5sGo9wORDiuVO/jxN5/b5y0eg528j9IyIBDMbLBxSOqbfUK
	IN/+rjZ0t4F1yzjGZcQFUVraRBt7qI7lw+nbN70LiLrUxf+wBrLAH+Y0qXiY9pjbKsWTrNF7cObwD
	MfkVPjaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MfL-00000000Mf3-3o3m;
	Fri, 25 Apr 2025 17:16:43 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LrY-00000000CYu-49jj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 16:25:18 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39c266c1389so1756651f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 09:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745598315; x=1746203115; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GwF9CflCPdWCYrp7r5q+/Sk502aNvZmEG4uUszEXbak=;
        b=YEWX6F6Eay6Z7VOW4oLP9bUbOb5ukRuqatPWi/jTC7ddna/q6jZmgNclHLpk15sU7A
         o7zvlck4NfYyty/sVIwlOX9+J2m78FNA0SAsOmBbFR5RoVFS0bPk/zOYivnvMrTDTlgp
         vKc2wC11Tcw6GhVYvtiHSpq8LeWmHudBnxYu0lTu5eENJV5DklPbqSWzK9j15fEZCqaM
         GaXHA5C0D1CSt8e+9hc1Ssxl1yRQDYAuUc3VJ5ZYE1TUDUiFLpuoUYzohw5lb0oKGh/m
         wQ/N8AuCwePQapB6q4GU+mtKIxSv+8crsCjnnnkjfm3SuEsPZbSO4SrmhXMRxhhPW55J
         lkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745598315; x=1746203115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwF9CflCPdWCYrp7r5q+/Sk502aNvZmEG4uUszEXbak=;
        b=A+cT1aaFh5IurEKoQTGeQARJsekYBlVcAI4itxEbAbJfoAGaNNHyjpDUwH7YO5T6Br
         bJrVGxee9JsJ62VwfTHzX7VFmBv8cy40hG58ZbHLy3Kj1HVyHLJ7IKCJzm4KnvCxNiO1
         6ZhCh0Vf6qut0WiKdlX/egKRTeZIGVgqUuDUEodzzT6ku9tr7HsmbSiRyzaalbHLGH2i
         ULXxfWR8Q0qG53CEL0G+EQca53diLlQnWCxG3B5Zj3s718a2wvc2TP9+R2l+VU9Bz0RD
         WqL7F/phSv2Ds3n5dscKyHJcQRUyOeOP+/BFK7RzVM+EKbOHLOlO1G40f+nv6hpSbZ+7
         H64w==
X-Forwarded-Encrypted: i=1; AJvYcCU6plZIvoIBCbkNnY4FQJBry5+a5EaoUr7wChOSB6T1EyU/bxgM7wCoMqFE/xfyBPaTg+bKw/KhNpvjbflugo44@lists.infradead.org
X-Gm-Message-State: AOJu0YzcC30Am2yq0u6i/VUt4uaVAGOqnaCcZVXqumw9IRAKSgZIieAK
	FGI0xfen0EtjpdyG81NGFHKwef0y0XSZ5Sm1gJ/JPIKv1O88mnmStllr3n9dgB4=
X-Gm-Gg: ASbGnctui8sq1kZBuPiOK0Rq9s+yPV3BtaB/va551fl3mAy1Bp06yGoSXpKcw3OnsYM
	qY5ajztL2ADxE9uRtlSQaYBqZyFInfKZgyDenA9q4YtnUnKl78iw8bGE084E/Mb6RpqzAEyJ1ew
	hHkf91rKBpbN1wygnNXDRWMu2eEiGRmf/eEkNpkGVCAdGk/AIzAmWg459PYuX7bd85IzuAsq+oL
	8IT3naB6xG/0pz5KR1opbOaGNcJiHCxJM/MAN+fxuJgE7V92Z5Tvn1TzmXtfy8VpKLXzcwsP61E
	i+xf0Rem+qy8lan7CYZICRYpMCsKx3ngkuMawc8Foe/MCN1v+8YiOYEg1jw7t4pJ8Pdo4/w4kNL
	ddnV+Nf8=
X-Google-Smtp-Source: AGHT+IH27tlRdQmfaEd0vU0ekKrOUtyYgz0T/lcDZ8jxrvySztmQdJ9j631XFVWx4vKEx6N+HkWnDA==
X-Received: by 2002:a05:6000:22c7:b0:391:304f:34e7 with SMTP id ffacd0b85a97d-3a074f15530mr2464952f8f.44.1745598315279;
        Fri, 25 Apr 2025 09:25:15 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8976sm61263715e9.27.2025.04.25.09.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:25:14 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 25 Apr 2025 17:25:06 +0100
Subject: [PATCH v2 2/5] dt-bindings: soc: samsung: exynos-pmu: gs101: add
 google,pmu-intr-gen phandle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-2-f1530de9da42@linaro.org>
References: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
In-Reply-To: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1391;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=FMJrOlGR8LTHqC1O6Afl8Jai2Dk/T6WHWfMwiUsHQbg=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoC7dl562ZRqMPqicNiLc9QCICsJBZHoRyLw1nT
 HbBSFxv8G2JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaAu3ZQAKCRDO6LjWAjRy
 uhf4D/4lCMQMOrnjqdMlIot/ZGWME40KLkgHPG3cgQ4A5wYavbweCTTNv9mDkLoRbwxQahs8k9g
 maZ80JEv9h/hvZGDpzkkQ7A7Pb+bvB+dccca41fkoDlDLRaoahUpJxGKGwLDK1ICKiR5aoIkHQD
 wMKylpxJ5KamU6Z0OeM6r9rqx6HV05f7OHYt3b2NV1o9C82W5U3lCLM+KBwygbLbnTZLWMpyjza
 3V79gq5IhWbyuWZ8ntuUcxIf3qq5OAWZio5bPU8Cu/x8Nc2imixW7VssoQ9oegD5inVrVegp9RK
 bVMJPKayTSZlXTG2OQrtQY3djKCgygoT9Rf/BdIoqjSbwReVTU55qJNGGU1Lp6S52/epuiQKaPB
 3TUC4HHmsmQJMpG4xHReU5KwLb677dzRyR+0T7rdkptRdfPNIUwes99EDGh9Fi1FRBX024hJfIa
 Ht8nb4vrX0B7PK0fPeClYEi8YiHhBVcJpjxvWXbM3uHLuUaBEKg3iXTL4MGbXxm1Z5WtVhi70Qh
 zt2gXctBwo91CuKdTMCeI9TCKwSbNoOxHaYwzUzsB44XFKUEfC8e3tRIMzRxCa3OOldQta8ZctL
 VPVMW2UZwYaRonoyEJ936Tte2TAmsyLJYjxaPDCTEXC1g5YxDglGLr8/YYPIpvc2BWIw4EswpAa
 YY0LPsWYR0HsMdQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_092517_038086_34616B46 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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
2.49.0.850.g28803427d3-goog


