Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD62EC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 21:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P67qbos3D+tWJec3niEbndAJClHMkcSjY99grIP5ELc=; b=ZE3VZPeilVnVrPlReEfBEmd8aZ
	PWNXpcHyRTvVeWVQ5FARxN0NIEPdX+qd3Wsk7bOlTaqvSmUvkR1EeyGb7H9ameEkB96fJz+ihJgG2
	GjluajZNfbOIhx5f7COxOjMz+XsEV6VuSQy5CMfm31ZynD/ea118MoHuT6ojuj0VV5zGr15Qna5yr
	Kh6WBwKgb2UReX9/ZeEaHq0oNkEWXKhvf+AnpszhZWUw3xa2FwQtlWTronT4n+U80o/4Tg2vqefUI
	8u8CnRow4dQxs0kvR0w/ZwbmaCavVRaWNV+v4jL2FcNUc4P+FTxbur+6GAwFnvWYH8ZeMtNg32f1t
	gFsnn9DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qjr-0000000CCT2-3Kmm;
	Thu, 24 Sep 2026 21:12:19 +0000
Received: from out16-185.antispamcloud.com ([185.201.18.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qjg-0000000CCO7-3X6l;
	Thu, 24 Sep 2026 21:12:10 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx320.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1x9qjM-004qU0-O2; Thu, 24 Sep 2026 23:11:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=P67qbos3D+tWJec3niEbndAJClHMkcSjY99grIP5ELc=; b=pnO28DoNeALoJOZXbM7IG9xVbM
	3SddwvOnvrlSlE44aU7oiJGsGh3Jk77loWHGdWTSjOu+uPxnRtsyldG4BHifG4OLd58edpSzZTVOw
	ogDvPiBfnPFdLX8qLYZej8bwtCpvJFt0MHXBWCUTDbmaK276MOVElhCqt6UrZ5ngxZfej4JbcA3uj
	EFG8q7/qysdfIdBQmFqJHTAIT9JExW4lycZB9wRpvwLidXiKe6kpGyPvxD4MSdVlJk3GdBY5CCN3X
	Hw54x8b1yeCcruxGNlfwUeM8fXWAZtN+Ypp9CsRM6W1+rnp2xAIXue+zkTQ21ghu4oVQCmn2uHxDK
	vbxxMzjg==;
Received: from [188.251.249.2] (port=56840 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <dan@reactivated.net>)
	id 1x9qjI-00000006M7u-48vf;
	Thu, 24 Sep 2026 21:11:45 +0000
From: Daniel Drake <dan@reactivated.net>
Date: Thu, 24 Sep 2026 22:10:52 +0100
Subject: [PATCH v6 2/6] dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-bcm2712-iommu-submit-v6-2-7b3cace86973@reactivated.net>
References: <20260924-bcm2712-iommu-submit-v6-0-7b3cace86973@reactivated.net>
In-Reply-To: <20260924-bcm2712-iommu-submit-v6-0-7b3cace86973@reactivated.net>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Daniel Drake <dan@reactivated.net>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, 
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Originating-IP: 192.250.231.249
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=192.250.231.249@s1041.use1.mysecurecloudhost.com
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: SB/global_tokens (0.00314632716558)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuVPyya3RnUxCOHHuXIvKUUwNMtspsrkpIe9
 bVuGjJCY1Cu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIOOP3U1rTVqDCrjs1n7qVkYGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWCfZW7a9uhvfuE0J/hsBuu+eB7itP8hgjDRserKv4bhb4rodgkl+wsfxZHakHKRaVZWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKefuLbx+lGq0svfyhth
 j0R6Iny++hg9dJLqN5zmWqF/oHgMZXS6X/fIHYslsKU0yPHM4JpSMI47HiFQBsGlm5AyJ9N3+CB9
 4aFbAhtG8w3Ly5ZVKmISsN3IhGLWYd0758WcWZORtrVlxIXk5jhWVNuX2TLvWiqA6BF3jwTykadj
 Eh4GKZ8tHsR5A+L9kzDG/K7jeiyzqcpyb6SLIRHv2KIjmIf7YZpqL+v4bQH3sWKlGBPtnYg5YizU
 E/EMRWxUHUQ0hYI+2t4HN3I9ouCIE9ZpmIIT4UMJhQzp+ktYysEoXYjyOpKyQ+6FJGgfvyfesL1T
 Yi2bf0F0JzgUQ/o6tR7CeAtyzyXh0NL4l5vWK73eqiIKw1M+yw2yzZUSfFbaoySugmxqcr8pFbGy
 g9Z1tlDRifW6JNJBY9PymNpC4Wmh+9PD5zE6IfxMIfQh9R3Td3D6I4o5YsP+Lyz6c5yHWp+l1v7R
 8SyvHcEEE42QqO0qgomZEoLxZHOnsblvnV8eXYCZSCMD9D3oJHukiNphohQtuwCmDexg5czsngAO
 BFsShf+76sU8wGmOnLcaeINlh4Cn9ZhZdiagiCOBKUpU6SDcsn+BJp3CoLutPze6u4tYy64Dp2el
 LsD1cFZ5ljV0yCnPlZYJyqLj9DGvv0JxFidP9ylmMcA5Ut2aTq/fdywqeMzbg4Paoa3pNVQ0zl7t
 /+UiLekARSAxYlF7slSgzk1enTnq+eIBXmCMn/1SNcFIP2MttYo7yCqT8k88gwNJ/ZBdCKDGFJnk
 5eJFcFklVb9231/E3ahF5MMcDI7KdpjQKdEz/+/QkUVhwSqO+QS+xjCZ3JKVmi72ocgY5kMQSjs7
 CnU3Vkswnvz2sY575f5VZdC7A9EkfupFeybqiokSL/UoBa9Z74L1QD5u7fk/CB2ffOy/knOaqu9M
 jU02vQscbAwfX28GBy2wRROaWZyvU3/WDyb1UPpOcShziaQlXemUjvoXt4/HGWyNXB/u9gYnKxY+
 C3NKVBiu9E09fH2QcWWDSTfRyaGsL+KZNwpYGCN6yCqJqJMY7uMzxq3+Ecx6Ww+vAj0HbLbveTIz
 fDDueIdjUxTaa0dmGx2m78JeU6J5dQk8TiQJh7U9utxWE7LPn7sg/7SHllHTMyZl234M8B0+jQL4
 pa+UuQNWiWyd7rUlPAlbDjazCbhs7qBpykynMlI8ehauFjA7dVMOTKcW5c6UnY64mAykh3LBvXwi
 LIjlrjIuKSKddsFYTaIZy4Zvun7pGU7uz9Qh2BYl/pOFic8JjqapLpwrwdUQz9MPWEmV3jR5NeVa
 JQBh0uawl0Cg8hPs+cRD5TJxNzOPadp3mtqXN3cCIyIm263/n4zqghav48Y+3YiJRbPwEKhVXmMF
 SH7pGU7uz9Qh2BYl/pOFic/qXKRF3uOx1VRdI9vLlOBy9jihx+Za/cV70jOJzN2r4A==
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_141209_053136_57F15D9D 
X-CRM114-Status: GOOD (  12.32  )
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

Add bindings for the Broadcom BCM2712 IOMMUs and their shared TLB cache.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Daniel Drake <dan@reactivated.net>
---
 .../bindings/iommu/brcm,bcm2712-iommu.yaml         | 54 ++++++++++++++++++++++
 .../bindings/iommu/brcm,bcm2712-iommuc.yaml        | 40 ++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml
new file mode 100644
index 000000000000..5ca8ce469ec3
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/brcm,bcm2712-iommu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2712 IOMMU
+
+maintainers:
+  - Daniel Drake <dan@reactivated.net>
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+  - Jim Quinlan <james.quinlan@broadcom.com>
+
+description:
+  The BCM2712 SoC features multiple independent IOMMU instances providing
+  address translation for multimedia hardware blocks, such as the VC6 display
+  pipeline, camera receivers, and ISP. Each IOMMU has its own page tables,
+  control registers, and local TLB, and is additionally linked to a centralized
+  L2 TLB (IOMMUC).
+
+properties:
+  compatible:
+    const: brcm,bcm2712-iommu
+
+  reg:
+    maxItems: 1
+
+  '#iommu-cells':
+    const: 0
+
+  brcm,iommu-cache:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the shared IOMMU cache (IOMMUC). Each IOMMU instance caches
+      translated descriptors in this centralized L2 TLB cache block and must
+      trigger cache invalidation commands on it when updating or unmapping page
+      table entries.
+
+required:
+  - compatible
+  - reg
+  - '#iommu-cells'
+  - brcm,iommu-cache
+
+additionalProperties: false
+
+examples:
+  - |
+    iommu@5200 {
+        compatible = "brcm,bcm2712-iommu";
+        reg = <0x5200 0x80>;
+        brcm,iommu-cache = <&iommuc>;
+        #iommu-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.yaml b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.yaml
new file mode 100644
index 000000000000..47c584ad667a
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/brcm,bcm2712-iommuc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2712 Shared IOMMU Cache (IOMMUC)
+
+maintainers:
+  - Daniel Drake <dan@reactivated.net>
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+  - Jim Quinlan <james.quinlan@broadcom.com>
+
+description:
+  The BCM2712 IOMMUC is a centralized Translation Lookaside Buffer (TLB) cache
+  which accelerates address translation across the SoC's IOMMU devices. If an
+  address mapping is not found in the IOMMU's local TLB cache, then this
+  IOMMUC is consulted as a L2 TLB. The SoC includes a single IOMMUC which is
+  shared between all IOMMUs, and it must be explicitly invalidated when
+  modifying or unmapping IOMMU page tables.
+
+properties:
+  compatible:
+    const: brcm,bcm2712-iommuc
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    iommuc@5b00 {
+        compatible = "brcm,bcm2712-iommuc";
+        reg = <0x5b00 0x80>;
+    };

-- 
2.55.0


