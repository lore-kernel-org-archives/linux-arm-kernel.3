Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0470BC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 12:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPOc1krqbrMo4NAQ2zRjkO6jdWzRpPpaMokHxmTWog8=; b=Y8s4eE8Xa7mDIFQMu7vXrHcNAW
	4QqmVg6Z5jMM0stkshHPiCdYgQUcn9Wckm+rzvMJzN+V4KUyZCwtcb5ufQEt9vN4EfYmvUSGoB+Hm
	8QVTgk7bbKI5CagYYUCxBIwDNUW8auH5coH0QMA6ed0uR5KAseh7PotiFYT78qkQgrDZOaVBBKqTB
	y0bduGtdf/Nhd4mcGeeZfCLvTqSGwnRGW5UgGbVg4ofhmun0e8PYUvW/zczVC/dUHFGM/F+RIHH6d
	4+a28fzaa26Q+5TJMYqfk0i7cvRXzO3serIz6KzpWX7ntN3OuDR+cauP+GgkifGoR8L3gVXYCBMaT
	gnpiQtog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHQi-00000000464-0iK8;
	Sat, 15 Feb 2025 12:37:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHNr-000000003lI-3g0A
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 12:35:00 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43948021a45so30329915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 04:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739622898; x=1740227698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPOc1krqbrMo4NAQ2zRjkO6jdWzRpPpaMokHxmTWog8=;
        b=ZO/cUmCG67C/WQVTHTEm09b836YhbhfJZY/kYOuKgAxyv1FpoAxOCoITDUfX7HEXnd
         feAH9hPuzWeEoFT8rbQKMa1wvN0NzYiNKyXbp6Dxe8U32myAa9CkD3XO0HgfitVeZB8m
         vv1znsEin6vrp2OqB4TW30vesRAGCOt7WB9+5E7Wiq4UMDymCqGd2dtcBrnd26jA37r1
         duFLRC3ST92SYSNEnxmFPqohLwj0xqKKBYm/Wd1XNQipmUrkdckU3MNjGqAcjEQZYtst
         vrIBNJ2KUdzSwtVciuETBJ7A49LiyiYtk5tvQ+pxwmLJkDoq1NqXa0oGfvBGVNjZlrA8
         ABHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739622898; x=1740227698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPOc1krqbrMo4NAQ2zRjkO6jdWzRpPpaMokHxmTWog8=;
        b=CIj3tRKS/kR9C3Ap1H1ec/fqPwRUCgxvxGbhBaMXrG1v8js7Ya6i0aPEP4kSVC8+Gw
         Ye+jXn09B1E02B65rYRtEJhE7+dXQRF7oaGDTcfQxdhzT2mIvMw0lI1tzmYx24eBdRTA
         7rlPMPfwZMxmGAgSWkdJiaGVahyhvUDDpJAWR05yQV6cEG0FQY1AuXcMhtIjvXCkQJt5
         tOSzDXWUP80A3lnnYxk/YOhytmPfcscwig1APHn+0O5D5lJTXea6J6HbLy88piSLxTKZ
         7yNG/bn+FV8JfnKG7sP27uv25jEs2LHy5zJFSeKRIdDB90VZT8uvK2cFYlbencqB7s5n
         zgNg==
X-Forwarded-Encrypted: i=1; AJvYcCVoDG6MBqC0TQ/yQaTUyxhp0DaK+NTqNvqMEYjNRVgaeE7AqPeLL7xy22SD0rsERIKteldkBZEcXakj+cozKxZt@lists.infradead.org
X-Gm-Message-State: AOJu0YyqdtjRGXD9q7LvFNqPqwKlCgYFtUrNeQccSXRXGOPTJR2Q/2y6
	a13qu2cLukwNnlCNj8l5AzsCUbimlXwyCEE5Vbh4c92TNluU4LIrAhCv3Q==
X-Gm-Gg: ASbGncsxI2VDpME8T8lvDUaCAilc8cE4Y6D4gnyFsAuKs2Ma+zMNel6tMe3oU+OpHHw
	kZd4so532B9ibHEDBDWkAkwErUCehwi8FmEmuBsBekyaY2QgUqsHe/3P805JN9/e2NkiK7RD1Gx
	AHQvlekak3Vv4Eau5KHfAMqNRK24zl4SKwgIPc6z0iyTRyx96ugIR0Dwl1zZcRRFPUKj7mwn8Cy
	q8aLi9jempGRuK5KpviCqnp3CvOetyQmiE5a1IPvdLoW6f1Gnaz4Edbemm9kAESeo5YLT6kTOvy
	aBEUHIlpVv/MrTVVRO+/a/gW/Y1WNp8PyRN2v2BLgQqusyzLNrzN7HzrL4RVFohQC18=
X-Google-Smtp-Source: AGHT+IEhPLK+WsPaa9GLkvxj6OwZ2XOSLjFNoGpwy2XICfLLz9TO+N4X1s+PXqKzJ8UTBok1AIkixw==
X-Received: by 2002:a05:600c:5102:b0:438:c18c:5ad8 with SMTP id 5b1f17b1804b1-4396e73950dmr40069915e9.31.1739622898147;
        Sat, 15 Feb 2025 04:34:58 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439615e543asm70846685e9.0.2025.02.15.04.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 04:34:57 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: usb: samsung,exynos-dwc3: add exynos2200 compatible
Date: Sat, 15 Feb 2025 14:34:52 +0200
Message-ID: <20250215123453.163434-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215123453.163434-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215123453.163434-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_043459_911862_3A81F0DA 
X-CRM114-Status: GOOD (  10.14  )
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

The Exynos2200 SoC has a DWC3 compatible USB controller and can reuse
the existing Exynos glue. Update the dt schema to include the
samsung,exynos2200-dwusb3 compatible for it.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/usb/samsung,exynos-dwc3.yaml         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 2b3430ceb..beea8e78f 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - google,gs101-dwusb3
+      - samsung,exynos2200-dwusb3
       - samsung,exynos5250-dwusb3
       - samsung,exynos5433-dwusb3
       - samsung,exynos7-dwusb3
@@ -73,6 +74,20 @@ allOf:
             - const: link_aclk
             - const: link_pclk
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-dwusb3
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 1
+        clock-names:
+          items:
+            - const: link_aclk
+
   - if:
       properties:
         compatible:
-- 
2.43.0


