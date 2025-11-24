Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15115CFD317
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 10:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bneXz0UXyWELCYVPOmpF4qxJSf87G5fA54r2uU05uns=; b=MZN/Xi2OplyjOOuqkQ6S8yWCxN
	BM736/O0+S2Kjm4Ok9Vf3ftxE8q5eITju99aWiBlaRj1GJBMeZx2r9/ibe5Tg3qaK068SKNfVbouP
	jo6MkErkqiAdzJ3+uAsco1MnMK9gK5AQKDEJy/qOCFjI601grG+MWIjq/OrGv6YJZCwwJE1ZrYeZy
	B7HbAb2dqPJ15LiFnS9orV1ueLKuIjHeYLTLMooXhZ6cnlE04sXJAWvGC8sblNMpk8lwJxpyAVSeu
	FraZVONtMfXXaUtcmBTcdvgYI6P32sI4mj2vuRHnOfCYptYUVgt8M0Oi7oZqQvYAIWC9dMtExxEP/
	O9QH+T2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUGO-0000000BTfZ-0AcZ;
	Mon, 24 Nov 2025 10:57:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUGM-0000000BTeO-3UpU
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 24 Nov 2025 10:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bneXz0UXyWELCYVPOmpF4qxJSf87G5fA54r2uU05uns=; b=HBPKh93ebTMhQ8BPfePYH1jRqz
	udTyRitNDOyJQ3a4+mX4lMBhf+ONM92ihxGS2eXRR8/HlPZ+2Ykm8IfXW5MGLEsCSGpEnc+rAgc8Y
	nFcupdKtFhoHGJOXjGaqqiv7c+JmuCLYS2h9R1JvivXhnXzSAQpDYPYfmLRf7UUYTYXDWdCnPndT9
	20ifYHpJKpmrxJzZxmDJePnCamlgIpWfmbLusbjNC/FWKIBwh+lzosRpXl0FPxeBWfVeNht9Jn8Pr
	EJe0rzTrgNNVCqn72nNPIRxPdc4exe6QUNRXvefbGa+sAOx6AfeK+LxIpMHxnLCdPzy2TfjzQk8fV
	t1JScNeQ==;
Received: from mailout1.samsung.com ([203.254.224.24])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTOh-00000003Sei-1zSA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 10:02:18 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251124105732epoutp01b5275376cfc2578e98e7bafecb517487~67CY1s6b10871908719epoutp01H
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 10:57:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251124105732epoutp01b5275376cfc2578e98e7bafecb517487~67CY1s6b10871908719epoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763981852;
	bh=bneXz0UXyWELCYVPOmpF4qxJSf87G5fA54r2uU05uns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i4/0O5vcNTMaBSqsYkhs2HRfYBXAveaiMXnyPsTmYfVNi4lH62ARESkXdaYjryt9G
	 SB/rWBxSBMdF9jP8MZlwl8Ix1jDZohG6ganxUbKlqQZ497nsB/T+LRBoaDLuexDNGF
	 ZAqnNX01eENr/jSRfJkVftL/RUGl/6Eyqs2UKSsQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251124105732epcas5p31daef2b58d8bd6f9d185eceb98bee055~67CYFE4Hj3134531345epcas5p3p;
	Mon, 24 Nov 2025 10:57:32 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4dFN7v10GHz3hhT3; Mon, 24 Nov
	2025 10:57:31 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251124105730epcas5p470ed41a27f27776b9cd0c2c99a18e4eb~67CWf8AoK0294702947epcas5p4G;
	Mon, 24 Nov 2025 10:57:30 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251124105712epsmtip250e75102a55672c00f589a366fdbdb9d~67CF9ItDi1199111991epsmtip2c;
	Mon, 24 Nov 2025 10:57:12 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	johan@kernel.org, ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 3/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo hsphy
Date: Mon, 24 Nov 2025 16:34:50 +0530
Message-Id: <20251124110453.2887437-4-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251124110453.2887437-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251124105730epcas5p470ed41a27f27776b9cd0c2c99a18e4eb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251124105730epcas5p470ed41a27f27776b9cd0c2c99a18e4eb
References: <20251124110453.2887437-1-pritam.sutar@samsung.com>
	<CGME20251124105730epcas5p470ed41a27f27776b9cd0c2c99a18e4eb@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_100216_782511_11733A9E 
X-CRM114-Status: GOOD (  13.80  )
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

The USBDRD31 5nm controller consists of Synopsys USB2.0 femptophy and
USBSS combophy. Add-on USB20 femptophy is required to support USB20 data
rates along with USBSS phy. Document support for the USB2.0 femptophy
found on combophy of the this SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../devicetree/bindings/phy/samsung,usb3-drd-phy.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 1e9dc21b585a..15e75b0f66f1 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
+      - samsung,exynosautov920-usbdrd-combo-hsphy
       - samsung,exynosautov920-usbdrd-phy
 
   clocks:
@@ -231,6 +232,7 @@ allOf:
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
+              - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
       properties:
@@ -254,6 +256,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
       required:
-- 
2.34.1


