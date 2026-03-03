Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3204EDA686
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y94JqxBgzgD92hSkgY727rzOxGmI4MJQz+PRihecbas=; b=xeCZ2fvHUrY4SQpeBhn2PpA1eM
	bvMk7a8kt02Ivv3n8WmAsAdkbRbYu4NV5y9wFCt7lKBMo+55WOe7kykdPGwDgXszdoiLw4UC/mCAk
	On+JfziDoM/fyivPlSmbdcBJZ+dCxGsnoQVTl8R8Lg4o0UNxjqpgQCs3IoRowF84NMDpwnpg6nID9
	fI9wtzU/507/whrIMNKU6/tizG/BawFTvkdyI0oNOwRTIuu/YX20fRiMBh3LvyJxisNMr1YIFnM7/
	oG5huOb8sQYle4v04UnTWIP4qZOrOwVnX/AS/g8wbvsIf7Dnt8M6vuSy+bOhos7b4zwZTTPN/x9fW
	3cCNZDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRRe-0000000FOsa-2ZGb;
	Tue, 03 Mar 2026 15:13:58 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRRb-0000000FOq9-1t8V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:13:56 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-436e8758b91so3790926f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 07:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772550833; x=1773155633; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y94JqxBgzgD92hSkgY727rzOxGmI4MJQz+PRihecbas=;
        b=XJkfPOaddZh298FBoPo/SYdAloyks1Kx+8Beze2Ih7JBeKHOBbe45aC9FsHwMGhIGl
         5OKSj/i07i4wNkQc25AklVjs7E1NaapWTHbA7WnhFFCeo5XBOW9seAtY//LBjZGf7ksv
         7DYIlHH9G5BsKYYHq+Lt7vnn9qSs0KKN29PGOde/hH3VmMBV/EcXW/5VQwC5DGIIJrQZ
         pmrCuTGHbvXmzXMOQAH8zZKolwN7raBb9qK0otDEy0M+yqr6LzKVSjiXhti4RtByCyV6
         dRaY7rqjVGw5kb64PtF8vJ7hABMVEFhi+L6qMnUpTNmAO9gPpGwoU16pOWLaU598/C4d
         cBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772550833; x=1773155633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y94JqxBgzgD92hSkgY727rzOxGmI4MJQz+PRihecbas=;
        b=VyTUVmLNuAeCbZG5PD6V1oiwcM5akPhmVL4sW29qJzrM9cZCwXZ2a66nk0mPAtlHYd
         qGfC6GFStpOy9PSZuw/UgtFqSn7h1eXsWqgqqgQ31lbxm/6tSM0xqRF/UmHnjgBHSzgl
         vDIqyOw9m7ljUcJPksyaDb/G5tVjOBTIm+IyUqyoD/UOsVCnlVQ0QQ9A8OX0Ed2BaS8c
         XjlrBIMnpkS7HlztiXlWq/DBTXSKpse0UvGBanWM6to1I2boq/foOg3x6ofNe2zAwkDJ
         Irj0x0oKQP+Iw+IAMf7y2US1wKTDrYwdNIrgiVXpElqwt7Zu/VGkB2+Fd7b3fXVXo77T
         txiw==
X-Forwarded-Encrypted: i=1; AJvYcCVASj8LOC5CCKeQMuN5a3sgy8J4RNIyZAAAjZl/8lxH3ZHst28RxiRE7JLahKV69GaAvYv1AYmC/hWdCtMZsqAA@lists.infradead.org
X-Gm-Message-State: AOJu0YzKY2QHU0gVq0VGEKQ3xCtBKaqI49AGAkMg7FEIr6pMy+F51x++
	gVfOLn5UZfz16iJWwtHgGwBl/hJJUs2TJlmRZPZKcemsoEM9w93faxFUbtl8YcEejQw=
X-Gm-Gg: ATEYQzyjGEf2D10A09aQ+l0Oi7Pvn5GKMK57TO+c6GX1VpXsPowjsuqIx+TW2cugi9x
	aCO5iRh+gxgwdkdz+7mQGlSbjyrgagdByv0iOMWth0meGriHRCpeGfjdmKB5jbxMt9955l3E2CP
	Z9l/VcFWZGXWEevoPgI7MUJjBUHHoiA1Smnuxpq5JOQbIWdEePqdT0km+V28C7vaXImwtTAUH2A
	5m/BmYBWIlzPO27ndDOor7pT5ESdBzYUM/eR/4qsNxTi+gJlW15oBbA6X6Ntil3oiYsz1oGj2Z/
	fuUBeUEPQce8eZ89YzmQ7ta7urF2KjJjagApPf0HH7Nxs7XIg3u5dZYB6AEduxgQwF3vKSItcVK
	hvTSsf52Y8C06pNp9x2+h3Lo6/O5tfidcsFGBxoiJwtw/EuCXIv0m7Qam5fFsdn6pwXNbzuyqX4
	quetXybqLFaAXpL5f1RnRsxUdNNoG0K9g=
X-Received: by 2002:adf:ee4c:0:b0:439:bfaa:ed99 with SMTP id ffacd0b85a97d-439bfaaf0abmr5088126f8f.44.1772550833464;
        Tue, 03 Mar 2026 07:13:53 -0800 (PST)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c1fc577bsm4297212f8f.19.2026.03.03.07.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 07:13:52 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Mar 2026 16:13:00 +0100
Subject: [PATCH 2/6] dt-bindings: remoteproc: k3-r5f: Add
 memory-region-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-topic-am62a-ioddr-dt-v6-19-v1-2-12fe72bb40d2@baylibre.com>
References: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
In-Reply-To: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598; i=msp@baylibre.com;
 h=from:subject:message-id; bh=7poRYmK/5KpoW8OLZDL7FezdSS67YOKkI1mZwzix0Ro=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxlv6ac/3u07l/DfFMVi+86QkvOP+i6+7x0XeeBWoH9t
 ooTfSbVd5SyMIhxMciKKbJ0Joam/ZffeSx50bLNMHNYmUCGMHBxCsBEHJ8w/OHvN4r62LdjRqb0
 ocTt/9dMbYhRkPogG1MYb/T84LuertkM/z01m2Oc84OtLuxRXCK7wO6WTMzZ/21+rnUuxz5+ZTw
 iywgA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_071355_510127_F1F097AC 
X-CRM114-Status: GOOD (  10.44  )
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

Add names to the memory-region-names for easier idenfitication of memory
regions.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index 6aadc61e20f9f4c27f5b9c87ab2025a02776c5de..76ef23afe8c9f7f155dfec7fcabc7c60b8b286c6 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -182,6 +182,25 @@ patternProperties:
           - description: DM RM/PM trace and firmware code/data
         additionalItems: true
 
+      memory-region-names:
+        description: |
+          Optional names for the memory regions specified in the memory-region
+          property.
+        oneOf:
+          - description: Basic configuration with DMA and firmware regions
+            items:
+              - const: dma
+              - const: firmware
+
+          - description: Extended LPM configuration with split memory regions
+            items:
+              - const: dma
+              - const: ipc
+              - const: lpm-stub
+              - const: lpm-metadata
+              - const: lpm-context
+              - const: dm-firmware
+
 # Optional properties:
 # --------------------
 # The following properties are optional properties for each of the R5F cores:

-- 
2.51.0


