Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCB8C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 14:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QR9hH2qCFCqj8AmL9TfSa9UfhVhgFX2hAhjrgRMsWck=; b=Ukl9p5h2Pukddw+z78ZpyStap6
	feNGMgZnYvIwEHwUkvcNan0DmoG3uFqRBEG74JaCoOGLAcVq9rkY8j2vy/W6FVL/jDDRZEeyIPgkV
	5oA6Z0sBlnjxURqNtZ1UCejxrc90lRorSJ1DNFvzYRz9ktOGewkdKpVJeAryKS5RqZ8ncmUdeOD40
	7/ESf05mhQBoqpl2GzWEoGeYvHVvyERppfmRL6hpNH5AaQ5S70EGzzEZx9CUC8eiQQvM0Q8MXlMNU
	XrLWe1D8LpO+bip+mQlAK3MYOnoBnZP/WVfe0zO1itkY4YAjdXDqlxRUkox0Dr9FoCFmfdXTIHkqW
	zwsqTu/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhf3-0000000A19M-0q50;
	Wed, 19 Aug 2026 14:53:01 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhev-0000000A17D-3HFg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 14:52:54 +0000
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 17E9B1400124;
	Wed, 19 Aug 2026 10:52:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 19 Aug 2026 10:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787151173;
	 x=1787237573; bh=QR9hH2qCFCqj8AmL9TfSa9UfhVhgFX2hAhjrgRMsWck=; b=
	A16exu78qsBFxlFrBx+sy4cDIIZAlNSdpNBFjB4oTYD6DtEJlMztplDfHCXKYA4I
	eA0i7DReouXRP+mQNaP6o/uFLCxM4JpVhHdUHaUr3tuXY/cT1hvuXgG9nUWzKo3U
	9WsRddvYLrNQIQC6O+49uurlQKHx5YXb7lOBX9aXoyHQH1dcaPxDd0FNFLGBHLg+
	VQACfPOury8/YSGCywqy+ByJPdxr6hXaCHiJWW5QU5A/Xj8IQJKzycHcpZA2HJZf
	49jCRambZQcaWFuyGC9pmeE92sAysyJRbgPoq1IP3Trt5+9d1E8H/o++Nn8enuZw
	FtkeufY9SUCOSKt5pU/etA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787151173; x=
	1787237573; bh=QR9hH2qCFCqj8AmL9TfSa9UfhVhgFX2hAhjrgRMsWck=; b=P
	YNGuHvi46DPBuJLAtJptkiAxE+cbnI4/aEjB3ZMXJC05z9+nIedduwpWDxG7JdX3
	HElp+PwAatO4eCFe7dLTOWCEi/5FAw0yjO5QI+7fmTQ3yhjE19I9z/pHHER8iwBG
	GX+V8d7RlgX5rfZ/scEsmKRNV+kDLrf3EwCyqOWYk4lgKD4xVN3HZl71OET/7VFI
	5/EvbvggHP96q1aBM4pSLs8iunuXSXaQ5Eq87Sn77TLl4Z817hv6EyS++j83Gh1h
	+AR4B4vANlz96QfaNWvFyYK7ahXgRZOAJS5h5gm92doLWjejVoVYF5q8w96cOwoy
	t8GgjdYDwr5YmQYZHB1XQ==
X-ME-Sender: <xms:RMOFakHuIBD07xW7d-sxRlo7gM7umAPImccibK3GdQMuKGvwTT-J0Q>
    <xme:RMOFanvsNP1LK0L0v-r6hKZ1cKW8gLGwc1t1Xpy15WLUplsjnHT-VAhKNsJ-QJZOQ
    7Xpi3E5UEpV0oWjxZxhVi0j3gn9SGHzAw7CX9uMNwYag4tlInm40sw>
X-ME-Received: <xmr:RMOFakTSKbRfFlwNBVmmJOsWWTIHLLrNXCj0UT_hoGpMbQ4zEa78HHWSvrwl3EeNOXBABHIIW-remFHvnHyE1Oso3UlpD6xvnsEY-w>
X-ME-Proxy-Cause: dmFkZTFxm+5+zXIrX7B4RAkbJJNgS9ypMPi3z8gh3rlPLNt4LxM9cDQcT3/2Bcp5LPXrd2
    bzLP10mTv1erjlWchiwV2T1kZOH7q731/O+CSyOXY9jGJa8fQeY8GfAfIrdbonVv+niAK8
    Ulv4q3lWMzQHlJS2orLhRlyISYSMgJezzLinQQddNx9zca5cCQ4G+rS6i21cd/pzp/wCeh
    Hy41Gj5mYTgnqNUtEpn4VpJRo7M/dbuYpk3oOLnuChKh+xWd0dci8SOZ5j6n8tCbr/1bqn
    BseM5n9b0HhpGfo+RvV8SrST9+9LYZOD09vW7LlZI3nMn8KWINeVhuAhRZwiyo7Xz7Mil9
    gt+Hh4PuoOpoTY6+MZxKOoUS1xc34TE5uVdMGzFGzms11Vy4Buui27GQosVF4AHo5JIpkt
    3PjmtYGDvxMiG4uDlZtg3lraltpfwCgRRG+KYQe4+F64oSw4nVxeNQR+vEqb/zW5OxnWDj
    FHYJb2GL2AKFFBRq7YHaRKpo+wOXNNBKWsJoX+tDlLXnpd1iroqMnBkouXQfi+7JicBFcS
    aRP8Ktinae6pTpthL0VzovwmTIGaPS4tGkxmDFRGlxe75pzVOREKHox1ji0QTRr7/QFEZe
    fI+m5u3uehx57UsyTIJA/Jxn1kosN2yw/ndJfMTgOF3Kixn4E4C2KHTDdIsA
X-ME-Proxy: <xmx:RMOFahPDzjJ1sFZmqkWVOEWOlhRE_23OUbmr28LEWhemSHcM3hSckg>
    <xmx:RMOFai4m-0gCJHD1h12mnHfZAXm5WoiI3A-x9hL3lHFJtIsWIYnbGQ>
    <xmx:RMOFasUITwEAfyBhN0LQKDwtcyBfS9smSDp5aK5nsVA-PgfCf2jL-A>
    <xmx:RMOFahMqB90RMN-0qrEGqxzXyO_aPTPqRd8XI83Zj_687fKMQ9fcHA>
    <xmx:RcOFausmi9MvnaqTneVCarmH5Cne7Iphg3bswIL-8PByXmvt4LEeLd2Y>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Aug 2026 10:52:52 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 19 Aug 2026 16:52:27 +0200
Subject: [PATCH 1/2] dt-bindings: iommu: dart: Support specifying the DMA
 aperture
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-iommu-apple-dart-aperture-v1-1-252703f381aa@jannau.net>
References: <20260819-iommu-apple-dart-aperture-v1-0-252703f381aa@jannau.net>
In-Reply-To: <20260819-iommu-apple-dart-aperture-v1-0-252703f381aa@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2153; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=8Rv9OVc1AW97l/UiCVzPt+gRZOTmtkExTv7zaq6GYSo=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzWw/a6t9ZdXi7k9frkh5U3N+iEta3s77m8YotGcPk34
 whn5cNfOkpZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAEzE8THDX+ni20suWHbWpYe3
 rNy+4dYi92v8QpExG3e4/Pvpfd/+QQkjQ8vLE8szC0v/b27+8sw3jk+oxa+S4aSw1m/ey5FlHj7
 /WAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_075253_889148_83493021 
X-CRM114-Status: GOOD (  13.28  )
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

Apple DARTs are often connected directly to devices that expect only a
portion of their address space to be used for DMA (for example, because
other ranges are mapped directly to something else).

Follow the "#iommu-cells = <4>" example from iommu.txt and allow
specifying the DMA aperture via additional cells. Since DART is used on
64-bit Apple silicon systems use two cells to specify the start and
length of the aperture. A common aperture starts at 0x100_0000_0000
and spans a 36-bit address space.

This corresponds to the vm-base and vm-size properties on the Apple
device tree side of things.

As not all devices require this and to keep compatibility with existing
device trees allow 1 and 5 as values for #iommu-cells.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/iommu/apple,dart.yaml | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/apple,dart.yaml b/Documentation/devicetree/bindings/iommu/apple,dart.yaml
index 47ec7fa52c3a..6efbe732b4ce 100644
--- a/Documentation/devicetree/bindings/iommu/apple,dart.yaml
+++ b/Documentation/devicetree/bindings/iommu/apple,dart.yaml
@@ -44,10 +44,12 @@ properties:
       Optional since not all IOMMUs are attached to a clock gate.
 
   '#iommu-cells':
-    const: 1
+    enum: [ 1, 5 ]
     description:
-      Has to be one. The single cell describes the stream id emitted by
-      a master to the IOMMU.
+      Has to be one or five. The first cell describes the stream id emitted by
+      a master to the IOMMU. The optional second and third cell describe the
+      aperture start of a master's DMA window and fourth and fifth cell describe
+      the size of DMA window.
 
   power-domains:
     maxItems: 1
@@ -66,11 +68,11 @@ examples:
       compatible = "apple,t8103-dart";
       reg = <0x82f80000 0x4000>;
       interrupts = <1 781 4>;
-      #iommu-cells = <1>;
+      #iommu-cells = <5>;
     };
 
     master1 {
-      iommus = <&dart1 0>;
+      iommus = <&dart1 0 0x100 0x0 0x10 0x0>;
     };
 
   - |+

-- 
2.55.0


