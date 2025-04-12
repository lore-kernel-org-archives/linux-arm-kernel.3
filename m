Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15A5C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 20:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46R1bm9dKulR4YsPDWRT51COLzcesWjSu6sXIaCGFGs=; b=bvjUIhi/e4kqZl/FovIrX0LhCp
	9mtiQ1A1TP2tP9/uiM/2LllV+NzbCdFFapox/7eGqirl/L+nE9+e7k/qNlTt5Iiu8+snAQe3XVowB
	SJ6c14e2HdsxbXeBAVniuA7fK9pruCWnKXPjTMILh6/8KVogA/SnmZY/F7qBj2lgID/yjCxKgMy2x
	JEIse10VHDSNo9CRLz4xHa3hcAJBnaJPzq9qWdh6f3JojKxJb9U9yGl/D5aawsJ/LrhVewWHJUM3O
	108Osk45vbaMt8HbPLsUvuURCu1iSjVlhu06xAY3wDh+vLm03sx3WynIIkK9dFzyHKOfnRXbhcVD2
	XafW+52Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hod-0000000GRdy-3Xgz;
	Sat, 12 Apr 2025 20:51:03 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hXV-0000000GQ3E-1Iu9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 20:33:22 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso1647844f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Apr 2025 13:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744490000; x=1745094800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46R1bm9dKulR4YsPDWRT51COLzcesWjSu6sXIaCGFGs=;
        b=Nf+vIzlDJFIKfseiEhNY4nwsLh3jbv2HoRuBs8rzVk/8EPHD592hcAqxwVh4NjAIb8
         ix+LrG12W3muYzv17Rg6qMCsmQ3CCj9TJzXIpLCUu/txawXpR4kb6sMZU6I6GTIANVDH
         vhzo40vIQ+FVZFr/r4Mn11w6rNiGp6buCku200Df8KigOOT8UED5fJlmG2+glNLCAkOd
         gsX3+5gHy+Hs+KNRML/1DggZz8f2aKkz+zczgXo42alkkY0/0TntuO19yqSMuRSXRuc8
         LodG48XzbSSGC0Gm4iocsyGHjXin/efgyqcb8gxLjl5TGG3maB38RPLGAD+c7kUiZRjr
         2Psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744490000; x=1745094800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46R1bm9dKulR4YsPDWRT51COLzcesWjSu6sXIaCGFGs=;
        b=h2c7jCUYeXTveiG4shpINbV8rywPXTTdDIZwMzDDpprCzLyZCerqddyvQ8U5r/Xep7
         R9RC0xCKnvpc7Z6+jdbQq80QnE9aMEwvnxgCQ94D55TwrRS8A8K4NEb699Y2x4Hs7dxs
         +4E7CV5bpTBj6/ZWB8w+jgeVfDLEWwhX2z0N9Rk4F9TJtSExpxdSQUhPOTTVPfSjL0l5
         Bp456pWYOi9cphFFPUDfx6P3+IANXul1Occ+q19TOkojVcMWoVMMC0AOgD3bMBuEwNoA
         J66a5iyDspD6y5TSVBFILcfelzVYaUl+c2mxR2Admzm0LgmpkOBNmX22zz5SAIxn/tKI
         9cdA==
X-Forwarded-Encrypted: i=1; AJvYcCUU+00wpfK58ydMdU5XAUKMTpiIvLXbS4I61qDftkcJ4Mh23OvyIGnfQULWe+xhrsK7onjU7KcZgV7fbtTg4FZD@lists.infradead.org
X-Gm-Message-State: AOJu0YyJpbrMepwpMU43vo/G2abqynm7uimeDgGVgz7voKTRfaqpvKMT
	LkqU/PqCS02ONDYYcFGb/lUqlkoxLGyJxKdEC8/HQbPZagYbEmVV
X-Gm-Gg: ASbGncs7fKZFzNbVvvNDB5cFzpKrQzTUTx1oHPliJ2adUhj+D/Te6a3jPDo3Ad6FM+u
	GFeGa+iAEPnOMBwtx7GOM9Q0uzJvCOp+4L4qH/JuWHP1qIiK04PkxArY7ogZZNAiLAOt0O66ImJ
	jxterN7EGwFOSnnM2oeLCYfaMkzQZBwbmdntkfgVJhcwg0Ar8jtltyt3WJcNNUqDSr1HI0+jDhA
	P2WOfRMkSZ8Yvz9xq5XW/EuazkqWJR2tjHtpdr98KxIG4nuwRWTAVgTJ//ykHAixi21NkjLR6B7
	ow8tWO/+lBJi7L7/xFZEY3OED1eVgbqEyhaHNrUWtV6xEgJBgV4a1rHOLaT0sGTDaA8BMz4u88V
	Xr3OHzbjahCw8wIS3
X-Google-Smtp-Source: AGHT+IF5pUVNX7l4LDbQfqKU0oCSpckbyV59TxP/AwG/AVqqo2BVRvnKLPfh0mBKyn4QvG1zIbkAog==
X-Received: by 2002:a5d:5f52:0:b0:391:2889:4ea4 with SMTP id ffacd0b85a97d-39ea51d33c6mr5540462f8f.9.1744489999701;
        Sat, 12 Apr 2025 13:33:19 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb29sm5941896f8f.76.2025.04.12.13.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:33:19 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: usb: samsung,exynos-dwc3: add exynos2200 compatible
Date: Sat, 12 Apr 2025 23:33:12 +0300
Message-ID: <20250412203313.738429-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412203313.738429-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412203313.738429-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_133321_348451_90D0DF25 
X-CRM114-Status: GOOD (  10.01  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/usb/samsung,exynos-dwc3.yaml          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 256bee2a0..892545b47 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - google,gs101-dwusb3
+          - samsung,exynos2200-dwusb3
           - samsung,exynos5250-dwusb3
           - samsung,exynos5433-dwusb3
           - samsung,exynos7-dwusb3
@@ -79,6 +80,19 @@ allOf:
       required:
         - vdd10-supply
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-dwusb3
+    then:
+      properties:
+        clocks:
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


