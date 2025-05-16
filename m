Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1774DC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 08:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRRW8JE+xbSHTpm27mlbstWCdqSF3fKhZAwkdWaRTdk=; b=d67GdbbvJ2BLKzn/kgPjBalwDS
	cf+y/rmGKawUkcSG/69T+iwDYI64CCcpT9hNLUY7pIYCDyE+pym5ZD3uBzQEIDJ0XVWrXv2j5YR9W
	1DSEvZXcoT8JRSHwGQMMPwX5aZXAeSg7LbT1MhHb/OnJnV5IMNUmFI0F3fVHHNSJRVX3BG21XuDhO
	5kzSF6ou1IiAZSOcMjB/MJcDm65RE0PxQ0731Xn7NtptlAZVO+dM+n7xBerzICo8E+TlchMZ61h36
	rI4dvW9PYKw+OxmhVJcv5ELrMRuTTXJJoltOWP8iUNSsFZnY7bhGmMHKFV/a1MrLBwookh0iDphbV
	tFSdAWdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqlm-00000002ufH-320X;
	Fri, 16 May 2025 08:50:18 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqfq-00000002tcW-1yy6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 08:44:12 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250516084407epoutp03e757c9f936336a2e9fdfee27488b3677~-9XE1WhO80340703407epoutp03N
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 08:44:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250516084407epoutp03e757c9f936336a2e9fdfee27488b3677~-9XE1WhO80340703407epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747385047;
	bh=XRRW8JE+xbSHTpm27mlbstWCdqSF3fKhZAwkdWaRTdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gQGNE+2EPvPF+iCMZtVfYMYhRDyKcWRFz982atQJJWV01fw0DK2RN7WT4rfkyzSy/
	 x2uultatOq2uudMidoj8uVzK2TuKGK696RysjmkG7BSG2Sbwt2aD2gJc3iezQkNg1o
	 ZVdjQPKOsiWg9z7dmNnfKwMQlMii/hnwA6aoFONQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250516084406epcas5p22cef9118cb10f452d1682f6b43f2a0df~-9XELQzyP0158101581epcas5p2l;
	Fri, 16 May 2025 08:44:06 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.179]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZzLGX2wzDz2SSKm; Fri, 16 May
	2025 08:44:04 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250516070439epcas5p40c4425b8bf9bdb2719f23a1c830b2abd~-8APBfH-u1963319633epcas5p4K;
	Fri, 16 May 2025 07:04:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250516070439epsmtrp1b78e6d258643dfbf4a7dd8fa5d9cc59f~-8APATblx2478024780epsmtrp1k;
	Fri, 16 May 2025 07:04:39 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-bd-6826e387abe6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A3.66.08766.783E6286; Fri, 16 May 2025 16:04:39 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250516070436epsmtip26ad8a9cc70cfcd548fec0f8af8f930b2~-8AMnymaO0739207392epsmtip2H;
	Fri, 16 May 2025 07:04:36 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com,
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com,
	pritam.sutar@samsung.com, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: usb: samsung,exynos-dwc3: add dt-schema
 ExynosAutov920
Date: Fri, 16 May 2025 12:43:32 +0530
Message-Id: <20250516071333.3223226-2-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516071333.3223226-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42LZdlhJXrf9sVqGwf4OAYsH87axWazZe47J
	4t6OZewW84+cY7W4dmMhu0Xz4vVsFi9n3WOz2Pt6K7vFpsfXWC0u75rDZjHj/D4mi0XLWpkt
	zr/oYrV4dm8Fm8X/PTvYLb78fMBscWT5RyaLVQsOsDsIeWxa1cnmcefaHjaP/XPXsHtsXlLv
	0bdlFaPHlv2fGT0+b5ILYI/isklJzcksSy3St0vgyljUPI+pYBV3xe/bfcwNjFs5uhg5OSQE
	TCRW3DrF0sXIxSEksJtR4tqvFUwQCRmJR9M2skLYwhIr/z1nhyh6yyjxcuk2xi5GDg42AVOJ
	iXsSQOIiAtMYJY407AebxCzwn0ni96czYN3CAtESByd9B7NZBFQlrh3+DWbzCthLnDm4kxli
	g7zE/oNnwWxOAQeJo29es4HYQkA1c3q+MEPUC0qcnPmEBcRmBqpv3jqbeQKjwCwkqVlIUgsY
	mVYxSqYWFOem5xYbFhjmpZbrFSfmFpfmpesl5+duYgRHlpbmDsbtqz7oHWJk4mA8xCjBwawk
	wns9SzlDiDclsbIqtSg/vqg0J7X4EKM0B4uSOK/4i94UIYH0xJLU7NTUgtQimCwTB6dUAxNH
	5u8ufvZS4Qa2fO8t7fGpzm52DjKWKs2y/NN7OXQu1Tx6Zq9i039XKveHn7jotSgGVSkW+w+n
	N7xf1JCmPPvV2umzbgU27712989Tu+B1phpcpxQOsK/aveiS3A/biRluvc22a50/Nuus/3/P
	MVbqVOf9r1N1Yl9sTc16dl1yXxwPv9TBAGenxe8XBx8SF2DR3L0zfk8HlxZ/bQf3VuP7vBnX
	NsXeXNfp2hXpepjZ5COrxeSWe6fjBC81f5F5fO1iVlL2po98kfHLGgMESqfveu/neMo4JaPS
	8dTB8+HveV8x96oYuAebbFI2Wjn9w/e2Uyoc+bHhjIk5QVNXR3zUX+HwKCn+uVp6iOVvJZbi
	jERDLeai4kQA00jIcBsDAAA=
X-CMS-MailID: 20250516070439epcas5p40c4425b8bf9bdb2719f23a1c830b2abd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250516070439epcas5p40c4425b8bf9bdb2719f23a1c830b2abd
References: <20250516071333.3223226-1-pritam.sutar@samsung.com>
	<CGME20250516070439epcas5p40c4425b8bf9bdb2719f23a1c830b2abd@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_014410_821838_224FBC40 
X-CRM114-Status: GOOD (  11.43  )
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

Add a dedicated compatible for USB controller found in this SoC

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../bindings/usb/samsung,exynos-dwc3.yaml        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 892545b477ac..6d39e5066944 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -20,6 +20,7 @@ properties:
           - samsung,exynos7-dwusb3
           - samsung,exynos7870-dwusb3
           - samsung,exynos850-dwusb3
+          - samsung,exynosautov920-dwusb3
       - items:
           - const: samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
@@ -179,6 +180,21 @@ allOf:
       required:
         - vdd10-supply
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-dwusb3
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: ref
+            - const: susp_clk
+
 additionalProperties: false
 
 examples:
-- 
2.34.1


