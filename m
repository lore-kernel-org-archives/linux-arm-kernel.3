Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE751FD8FC3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbyRS2OprBLXmu9ZROhNbQV7yptB8B7WNK7cYLjfz08=; b=adUvuZVgxHTTdCANI2GsgXDQ+C
	t62gf3jkv73PdGK5snDirCtt9gyhvJiMZZdaw1/04if6lBdPG0rdoLxTTr9fdRgnfbwhwWWeoeTt4
	Lo1JjCwBLr3L5pBWljez9kDMG5i6X2PYMtaSf9k2ixenFzC1O7dDR/wDIFfyU6y1aHxcT7FcKBzfx
	IPQXdbl9LgkN+NLKUCapMVQ6nichZnwNeMM/DM7fsLRavvINeGWPBOJ48aHvxdDuaxggO7ESSG9hF
	o6/ZSvtrSVKSLuWn89ZV+Xe/n1+M+5jV2yEAr0Acm5rB6dSuraqYCoE9YRLtO2RFV0HpVsB3wJ78Z
	inKWlcXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdaC-00000006Y5z-2Tq5;
	Thu, 26 Feb 2026 15:47:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvda9-00000006Y47-1LtW
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 15:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jbyRS2OprBLXmu9ZROhNbQV7yptB8B7WNK7cYLjfz08=; b=mmdivSJCqYVKkdTvy3jy/IDsZ2
	ESc24RnVYD/8BqaaPJ93HiV6y4w9Gu/84s5NF66ysiBySPFXLUtcVMt6maTPypTFJfdMMgsEVa3va
	F/B65oxeW3QcPCXtUw8SKf5UqyTGrBFdo6/y1NPM+zfMnGvfgpwyYS2cn4mYDZYhVS/Thfwu1BII3
	9HUZ0IanT6JHXtEFgbcJPQI2b6OPIWNHXhAvi7/PtcPck5OerZUVaOVySuanvmFenIT3mHfPZGvkf
	5SRntWeZvppMWOzi5iWfyVyp/Qx7M+BlFKmt1b3/vCmJplT+4a5GEaWFM2++uUud38WBW+WTcLTBP
	EzE6ctEw==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvda6-0000000BMy1-2Yio
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:47:16 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-483770e0b25so9571335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120833; x=1772725633; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbyRS2OprBLXmu9ZROhNbQV7yptB8B7WNK7cYLjfz08=;
        b=FDe1F2zMKlA9REBX6h91jlBC0LGZfayZXwbX/97WyzscQGZdSsgIa0dwgPjoUVca3/
         DReoHhY6Mkxmj4m1Sc+x9/3utEC3W7iZeTeoDHYh/ZijTTxWHbyxn3SsxtvDww3vEw4g
         k2raSADZO/Xea6Xw9JdmGzSTArYqy3UbfxNLq6QWZ0qAPvlr0WD+acRQQSEDHvh/WSkD
         aPweGSZBLQ/cPGWEYU0Y9aVcr2nuXl4NULDzYVo4KvH7XqDuI/HXqALK/LAAr1mYHb8T
         fnfnOpyW4vI/n8FT/YPSsNuG52VWMZatgSvlLWQuWPewSnSV7xXiJHWXW7SoijaY03RM
         hDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120833; x=1772725633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jbyRS2OprBLXmu9ZROhNbQV7yptB8B7WNK7cYLjfz08=;
        b=IjwaukTaNdVbGbyZpiVcon0kwzSZR5yeU6wNQMYHl2sI4HNJUPia0iTfa/rU5XD/az
         YfNdTWF2XjU3IcuozJeeYDMfFQZ/Id9ZYkAo97plxUqaNl9Rq3VQWcsaqxsdkMEjQ/XJ
         A4RHB+i/MX7oTIAcx/ca1+SDTJPq56mGRzoXRfgppYvxtbKipLWBgJBEDNreNVjrlA+a
         72nyVqR77+fFRPoeO8TFoZdBqRR75SK7Yhbr1mCQN4grOkj31ez0g27W0KP/VJSsuLEW
         c6A+NmFi+NdOi9WyUuTHIJRFZ59gyDorCb0dl7LVHPTmJNj86ohEii2sahXntK1sCmm3
         ERmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7hkvSYTN3uXUQR2v6R+VcKn6r71Dws8mJrDj3sm2mY4osmPu6oWO67gZjqSmQi5m8AvYXudK8D7UqaCwr3q2R@lists.infradead.org
X-Gm-Message-State: AOJu0YwLZIsDEGVUOEIh1JECW9G5aT2Ieh58nk7HMB7TKC/yVDxYPMZW
	8fVk6hWnNuDiEL2X+e4TA9xxADnYgj0Xkxd4tDx7633g9urNdDBV2QunsTZ9Mg92LDw=
X-Gm-Gg: ATEYQzxRmzpg9q13PyErirktDFX7ObIFL8hbMISg7HE6u5nv+Fo75l9uSNttRyyx/mq
	cZIj+zzSOsUxqocXjZBc3ZtfmnbmRaQp1gNpZ/R6hFBTj26ISMPshaH81IhRT8Jw270++DBnUvb
	FyhRezIKXyONPSHAZTa19csyWBeVGCEvcnzlcIV2BnWGeboTJKKbkBEJKjPp/c9OfN0EN4ugVEd
	A+ZvpjXLzxKuXduEJ0mbIbX5a0dIfJT/Op1thxQ93CzQcj4Ktw29SFwZhzMIVvqNWyXoBjxE7wx
	5ChoYkslrmlcSRj1btMtzuWYbBaoaLB/5q3bMoL/0OllqaHHlR6B1WW+zO8P8HJuslul6gxymHY
	XC/NgMVovwFP4wxdQnKkqX7YDB7YcH5lMGvMVmFJdwkTfIiO6rWsT0jTNUnf3w8pISoSHoN3cpW
	DEyLzyAF7GrlYPI9apx/od4sk8bSM15h/8HuELPQ12pHLUuRiNitiqeqKfwXIQ4dliTAEuzAVu1
	QEMb2qd/CRqrb8=
X-Received: by 2002:a05:600c:c166:b0:47a:935f:618e with SMTP id 5b1f17b1804b1-483a960a0e8mr372926465e9.15.1772120832942;
        Thu, 26 Feb 2026 07:47:12 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:12 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Feb 2026 15:47:09 +0000
Subject: [PATCH RFC 3/8] dt-bindings: soc: samsung: exynos-pmu: add
 samsung,pmu-intr-gen phandle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-exynos850-cpuhotplug-v1-3-71d7c4063382@linaro.org>
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_154714_724771_F94A3B11 
X-CRM114-Status: UNSURE (   8.92  )
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

Some Exynos-based SoCs, for instance Exynos850, require access
to the pmu interrupt generation register region which is exposed
as a syscon. Update the exynos-pmu bindings documentation to
reflect this.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 76ce7e98c10f..92acdfd5d44e 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -110,6 +110,11 @@ properties:
     description:
       Node for reboot method
 
+  samsung,pmu-intr-gen-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to PMU interrupt generation interface.
+
   google,pmu-intr-gen-syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -189,6 +194,19 @@ allOf:
       properties:
         google,pmu-intr-gen-syscon: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos850-pmu
+    then:
+      required:
+        - samsung,pmu-intr-gen-syscon
+    else:
+      properties:
+        samsung,pmu-intr-gen-syscon: false
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>

-- 
2.51.0


