Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42973CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 14:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLnk4ZbyfQe9FhVo0Iaf0C5FfaSInQx1UG35rxo35j0=; b=omurYuLDlUJN4KOGS3sXFAflzk
	acqAy8UHmQdthzk+PKzXK/EG+UkmVBDYDjOxxnnfrnM3S1+HFBuPMzqaMSJ7FRHoqLrMlKqlExX27
	P6FBsH0PLOFEFfROCPvxCql7n1qHx1zOau/4alq3gfofDZCzIuOHu6jRvl6fswK0Z0M24YACAgRbh
	WVD4VYPC5zICEiBSHjxejxRTithZbixOlQLwUMiHL+Q6bUg/omlwIDYgZUfH/vC5mbWAoaAg3lnmR
	Y/R3glnGoNTHOr00sELOxKt43/Kch+t1I9ZeV83dxf3EPT+piRhtHtJn+nTzCQmMyUU+WK1+4dWPR
	vM/D1T5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxo9H-00000001bFT-0FIC;
	Sun, 14 Sep 2025 14:56:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxo9B-00000001b9i-2Cqw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 14:56:10 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45dcfecdc0fso33861215e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 07:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757861768; x=1758466568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLnk4ZbyfQe9FhVo0Iaf0C5FfaSInQx1UG35rxo35j0=;
        b=Inicd/kh0Ga9I6+/ZxZyOGvltMphGkAShzht3h4LJbs6uK+3m6I20y5vD4ywEB7D2g
         5/z3xpEkQ6DVl5M0VdHazRtVvnt85sZmM/67gRJV9KLxztSMLlz6XtVwbDosaN616i1B
         6KEZgRnmR/DtYn/AtOZDZYuN6ClM9J6RvP/Hsq5aDXjaR9a/Wek7jguCfrWE+x+aXyiQ
         c/c2a1rYsDbsU7t87rbaunbH9pRmaWcxcP2Qf7iM+r+ttpGSuzjFoFoNMkC6pIHM0sGI
         qfOw7IZ2RCWoLiyCpjoj/+96ULe5oQZujd6kOUGN3ZYHCCA06RysvDMbGrvbFz/T9VGv
         6DJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757861768; x=1758466568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLnk4ZbyfQe9FhVo0Iaf0C5FfaSInQx1UG35rxo35j0=;
        b=K5dDxNgYyNcnodHdp0LkKjun3jXX3tFQ8FGNBttVNBTRK7agR3w9AWnDKzZhXTohqn
         083MBjpD7RNDmnjgwFtXxm8F8J/itkXTSpU9DfMlb6jxQ+6kHAu1zEw/HxO5TeOrY9xu
         e1APBZFanox2c0kD1RRb2++PyCxUt3b37JzfXmz1UqxiISM7HUoUe3qhY8u4CVlhOrvO
         /NaNiW4+zAzPy8c7w2SM4eTUiSHkWjbGqyfK3e+YfUeJqKUzgn79eu84Cb3yxMe9rPA1
         wL6iRsgDGZAKtPuM465T5qhUVzTsbc3sNlwnlwdpPsJ3Mq1GFzzZJPAozu6PY4YVzZCK
         EmBw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ508iWyZO+tbhxjaKajyaAdPx2MahkjUNXwqBx3M4gJtXoTlIXCI2+jLNAL660g4cqdvDqta+Y0L+ioLJUtKi@lists.infradead.org
X-Gm-Message-State: AOJu0YxT3U/GDB+fYWaBOpuxi4F7w6DLa4b1AMVACT67UmYSs6M9I2AK
	ztHcqkSNVnlxJLudMZf/m+YIwsrkbqbtWSPdJ647gwDNuh/3XE4YOhN/
X-Gm-Gg: ASbGncuY30Mmc/KeE3v3Q6fkFiV7kr1Kdbl7/bHR0lUTDmc26JDv9k8WycgVFf6xILe
	q2pdPSLCV2/S9mWRI0Y/adXQRKC2nZnnzRn0wduGCLhmQA3bqRjfxPurexOSwvusPkwIM6qoN23
	e6ejswMgaPerYmZZO4VMgGGCPYNcJ7gAEJ2PLbOlgD7M06vQf350rzsEgbDp4wuAXrEgzotrGXv
	mKXOdVSC64CPcNJ+9mizLm0EYumPV5k3a4CXhxTQFKWIF0PfnecduUeSx80HTdBSM1dZoX48T1K
	HuXbLwzoTTOPkAxWHLmBSstPTjUv0Cec50vLba+p3nHZ9XZ3hGZoBebviwZ3WjYesEg2zytXI+p
	xgVMoQqbiE/C0FuMFsxALkBsxu2+V4QiYRO2zv7MqsNShD9HO6yFiqg+L+596JThw+QEl0VHp7s
	PzqtfJEWV/
X-Google-Smtp-Source: AGHT+IGA9P0DPlT3qLVqItOCiBENzd7lo8jFqFbJSSw4qh0mrbF1bC17C9VB8+t7dwhrkHYrwMRVbg==
X-Received: by 2002:a05:600c:1c96:b0:45b:4282:7b60 with SMTP id 5b1f17b1804b1-45f211fb7c4mr77463375e9.34.1757861767382;
        Sun, 14 Sep 2025 07:56:07 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037d62besm136303475e9.21.2025.09.14.07.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 07:56:07 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy: samsung,usb3-drd-phy: add exynos8890 support
Date: Sun, 14 Sep 2025 17:55:54 +0300
Message-ID: <20250914145555.2631595-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914145555.2631595-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914145555.2631595-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_075609_592462_29971FA1 
X-CRM114-Status: UNSURE (   9.79  )
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

The exynos8890 SoC features two dwc3 controllers with one USBDRD and
one USBHOST controller. Document compatible for the USBDRD one.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index e90640320..2b1544baf 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -33,6 +33,7 @@ properties:
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
+      - samsung,exynos8890-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
 
   clocks:
@@ -209,6 +210,30 @@ allOf:
         reg-names:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos8890-usbdrd-phy
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+
+        clock-names:
+          items:
+            - const: phy
+            - const: ref
+            - const: pipe
+
+        reg:
+          maxItems: 1
+
+        reg-names:
+          maxItems: 1
+
   - if:
       properties:
         compatible:
-- 
2.43.0


