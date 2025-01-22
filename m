Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFC3C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 10:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpIWGgNd2lENHo+vgBhA/C2LOLlWQiS8zO/AwCsXh4Q=; b=WWp28keg/hV6EINdxvHyViQOdf
	G5njVJ+wXXwsibRKwI+P+lKUqv2v9bUjjh55xUPtD5LlhdPEeREcIVd0qQJB34/iajL9TP57clFwr
	LHatl94303+HDq68GgsDk9viW/rIqzoS0RTJsSBfzC1oUkfQEouJBZy7QlVRXzxsD45sWFjbAlTW0
	LiEJIpmrADly36e7YE4S5OSqAi3k2h64NaRj47VZJ9HLysGFKqhmJmf6lO/nwhDkSqG2EHAdLP0GE
	IuFrJo1KvEZtbBcYgzBrcciflDy4drAVbPtpbs/lIfr1DjEFFzz9d+8DyAWX1BRx2kHmQ7AMmgUn3
	YOXYsbhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXxZ-00000009vwa-25Ac;
	Wed, 22 Jan 2025 10:27:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXv2-00000009vRu-0YT9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 10:25:09 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso46267115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 02:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737541506; x=1738146306; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpIWGgNd2lENHo+vgBhA/C2LOLlWQiS8zO/AwCsXh4Q=;
        b=VDiVRTdSHq4YtQj5JoVfVFnLWgMLR1DiVBfAKhWaqL4V91FdbJZ1GkJZE5wZxhG2Lb
         NL4o8zjcGC1s88s1gdQj4d+WiXxVvsaHyaqaKS2jLkeGOe3w99wQ3fERKHBEHOHlmLG1
         VKqFMjQsVAOdWmwn2tX4AGRsHGCQkXh4zi+0BOLTS/DMF4hHqeOFJWlc9lT1Ad8lfR8f
         t+8P+9FYX2GCg1FzL/P8EUFuzOOUAQr2dTVZ4W5/k/QQLQDOvzpa4gswtQiN7U+WN5EO
         HHbHvRZmbbDQrpcKTzH6odwfQyHhjRqWB4gsa3MzTaChYjEg1pPjjr8GBUWKinlmymPJ
         wQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737541506; x=1738146306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpIWGgNd2lENHo+vgBhA/C2LOLlWQiS8zO/AwCsXh4Q=;
        b=aYyvWXmjMXTI55xO4O8BUW3gtwm/y6qhHNtdPyXvY4SyJlfMJIMKG3teiD0mmbtTRV
         r9Kqh7LZhUFbxkVug/I41EaO+W/FJjkOvEwyYhrL7oFlMNE+47f8N8o9DhBowzrKC8l7
         3Kb0rMRl7irPfIqOyYNht4w5RfQjWmPHlAGfL+3dadyHbfiJ1OtbH2lc6u6oAHDXTieu
         TcoQa3uRJkEWq9W5JYf22JpjD8ocoP2FAlJcO4F6HwIqLUM5sRujOqHbclKyjpnyO0gP
         vm3NK1NcmEHyizKnEUS5qV9rz8WMRU1NJP9fcIS4RhhpFY1HRAMXSSRy5+tMxEhqg9KL
         h48A==
X-Forwarded-Encrypted: i=1; AJvYcCVHC2tGHUoEYbb0MmBlAFYeQwXtO+PcZvDY/V/JHzmZP5r5Q27KWRTVB9YPTjplf6LWVGbOAVXkiNl7AJ7nM+t+@lists.infradead.org
X-Gm-Message-State: AOJu0YyISqst89RZY7Tt6zaCTf3EcR+pHsKnkqZaKXDYaiZT/qYml23c
	iS6s98arktQ1f8cVcHl47bKx6dVb81p6q/88KkK0juCV91Qzd/PARQEQ0DQmQkw=
X-Gm-Gg: ASbGnctN4cFagYmc0YUHVdz2kPrBjwbZcXzKWs0E4tDYJeZIIajUHuOGdR/9FHEAEky
	VVlKxqHpVsl4mlPazlSdP0/NzWSdFqb7vcN7TuXjq3qImtAcnNgpkooaicElizjD+MLcVuru38l
	tugjW4MUnSY44Bn9Zz8fbi+rBHI9BK3CCwzpKmLW4+eU1zsKUDaoQGZ+o3uoi/oO+HhS2rt/yCq
	V5r5IA831D28UjJyWiQ2WwD81/JKUr9nWEftcKyr+GRWRVYQKLDMYmsfVld1EXfAK8=
X-Google-Smtp-Source: AGHT+IHPUrmQOCnYkU3EXFbKGz2qcbqTpnROon80fji2JKFfsS7aPn44TzE2C/9th1P+qRkaWMnSzw==
X-Received: by 2002:a05:600c:34c5:b0:434:b9c6:68f7 with SMTP id 5b1f17b1804b1-438914376bdmr167252605e9.26.1737541506526;
        Wed, 22 Jan 2025 02:25:06 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31d99ffsm18631675e9.29.2025.01.22.02.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:25:06 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Wed, 22 Jan 2025 11:24:32 +0100
Subject: [PATCH 1/5] dt-bindings: mfd: syscon: Add
 ti,j784s4-acspcie-proxy-ctrl to second list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-topic-am62-dt-syscon-v6-13-v1-1-515d56edc35e@baylibre.com>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
In-Reply-To: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025; i=msp@baylibre.com;
 h=from:subject:message-id; bh=NpuDuCt4ALF4oICaFLhz7K3buKHpxyvWMHv4701ZSw0=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNInHM9cli8RF2J29E4eQ0s3p3VR8GXddT+3V5rc/NhWX
 RSdUsbVUcrCIMbBICumyHL3w8J3dXLXF0Sse+QIM4eVCWQIAxenAEyk5xwjw6vMLTNPaskqXkyt
 UPoZ+vW41bPIK3I7xVW7jC411G93MGX4K3bXVLBW0HWD8lpbE8vdN+73bn7cr9PfMnFfxqtmKU5
 VPgA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_022508_173522_26AB99ED 
X-CRM114-Status: GOOD (  10.79  )
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

The compatible string was only added to the select list, but not the
second list of compatibles. This adds it  to the second list as well.

Fixes: 0d078d47cd3e ("dt-bindings: mfd: syscon: Add ti,j784s4-acspcie-proxy-ctrl compatible")
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index b414de4fa779ba3289a5f0d484b3c7d0341395d9..0e68c69e7bc9ef8c2c96f0e7d1b5d88eeab2bfba 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -213,6 +213,7 @@ properties:
           - ti,am625-dss-oldi-io-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
+          - ti,j784s4-acspcie-proxy-ctrl
           - ti,j784s4-pcie-ctrl
           - ti,keystone-pllctrl
       - const: syscon

-- 
2.47.1


