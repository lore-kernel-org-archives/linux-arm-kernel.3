Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B84106ACD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 18:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+HkoqHNIcmwOZo+SK51MwxHYbRzqLjxvTjLro1qNdYQ=; b=eSitKj6WDXGoWJqsrqhxOo0beN
	cv9YhGcn5LNg390H9xWaguquE7wPdMunGZ5O9fvili34RAr3qXjyAe4m4VAc9qdesXxIs1nfGxFnm
	wYf18GfvIQa37wnyB+03AZN+kz2msZXDRvcLMWnHilgmBUQuKoaPvqwoeqnkJ2YPDBVgKv7y2jes5
	nZ5ro7yaQX1bpKuYQ5gTPKuocvl26AZZReOuitWwj2UOhV9pb5tuBvf85hmoVKfYBIPT1s4SnZ7xa
	MBuO1NzlnZHGoeGgOu/wKioYSgQwcYYKC6ZNwbS+n9gos+tn+JcCpH4Zr7OreaOL+LINaPZ7kjV+1
	AITCT4Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0l0m-0000000EvVj-1CsL;
	Thu, 12 Mar 2026 18:43:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0l0j-0000000EvTw-0O7H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 18:43:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CHA049509773
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 18:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+HkoqHNIcmwOZo+SK51MwxHYbRzqLjxvTjL
	ro1qNdYQ=; b=TAoECN8Aye7D4KBxiEOgktoqObJEg+36z5lQrQ/gtV/sVgoId21
	jXrRr5QbkEfwmcSPSrUeFPNEM6Uz6QAY8ISrrGuwDCGpvGZVrf9abwUV1KmWivc5
	AafdBTW6n2Tckf+oisYh4IQI7MPQmF1dGCWvchVFhQq1C0LO0GThZVkUb6R5zaEP
	yR2dMOC+G4fxbSZZJtiDFXQySjCiEZBHzUDIr69ImBeLSip+btXj++jybIOErTN9
	bDtHpYOgWaigHQ4MYDAexhx8FxqrKBgp3CdCtCaX+mKqUyzBJf6Pul5WnC7jdNMF
	oY4+l9BeLQJfVXvZ2IS6U4AxXsnSzW233XA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w1wh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 18:43:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7fec8d44so860327085a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 11:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773341031; x=1773945831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+HkoqHNIcmwOZo+SK51MwxHYbRzqLjxvTjLro1qNdYQ=;
        b=XoqqZVwF/2I6IdWvnDY4X/GVNELhctQviQV4vNZUhozl0FYh4qAKjHYEdltAUK1Ee0
         /WrShbwkD7HK8Rzkq20WcVd9+w7zhNrK2tbV6D+9Hse64IfxSiO59xNHMJazYpJx5Nzv
         Fa+x2TzPgSbWOZoTzwjfisJUDJduy3lcrm4R0HdybNkTaRIZOzVF0vLiSoWXx+68ABCU
         OyF3bB7ccAjBCq/w3HwBeQU7NXlmx+H1pAlLeqUtk+p4u/46Hhv4krWyrxCO3bNMGGWp
         52oJvVdrpj9gybVTR1PL+zEw1IO7vUKE7/09TPcGKrM+6lsvCVZ+jKkGdAr8GbjfY2FZ
         U17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773341031; x=1773945831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HkoqHNIcmwOZo+SK51MwxHYbRzqLjxvTjLro1qNdYQ=;
        b=g6LRyi3rsyZzSUib+GUxdA9HVYD4rP5RoqyrjtjDOUFQivkZZoZwdTojRK0QEwdj5o
         0ZbgoWkypGvNLjcBqEGLdiyLx5paLwzYY4nnJgFg5zo8fNqX56VleY3tbTdQdyLm13rT
         rfUY70pcOqgsTOc5kOMJdGKGBvutVNlv3bKiyvXEtJ2GRWi/vt8xgU+dkIQYC8rD16Sq
         3/sybuo7De0OhZYNFH3DYs2Hl3nayoM0QRT+I9Nj7AhawAkGwHFi+dMO2/QU7me14G7C
         +NQS/OeHyBn925ptT1VFo3/1xdxw7LVAf8okEEIB8AyQvGd9mZxyqBLCxIlcpEQf3sR3
         G0FA==
X-Forwarded-Encrypted: i=1; AJvYcCUske5d2zeotu0VSD/7mfRZRthwjU5d7c0Lc/99LtENg/NToKJhhEw4oR6jaFjLfExmgQwiuu7oPmSvlUtZ3H5N@lists.infradead.org
X-Gm-Message-State: AOJu0YzkfjzPSuSVVzX/SaaN/6ysM43h9KAOTV3TEEdcOfJVWDOzE/0J
	lnJWxDLhnkCGOmzWXUrRGraoUTp8LsOYYF4e4MU3l1t0iw/bdKnvJ9Fid/MYpruPs4yO+zAf1mu
	DMkuBMNqBEHDoZbVh/cO4pzMDGAEsu9prMHvT2EDnCEZd8jOY54+CVwTjCpU6hMqfe4RFpb1p3H
	GLDA==
X-Gm-Gg: ATEYQzzwb2fGfWfpuhqTdWEoj8xO2zHc9jVlV7L+yXGPjbXa56dTz/cDgnFylTicWqI
	I0T0mDGQAb88XBMvmBbgy214ZMX8dh7S2ybn8oyC6C/VFgsTLAwaIKAoOeu2Z/lObxuBz3HhXU2
	ZLW4VpI+hNbm4wFp3dSZOEb0FenZw/VnTUL95+pIsCV+JVpRuO3o/m1J1Qiovzy982n5+bsP+Ms
	zPydeWiadlqDLJq2PjHcMLcqfMXvB7+PakqiK6rTybTCl2lKLlXpPrJ9n/NGXS8VKg35XeSExhu
	cHGXgcyp6OJAV8HU4fBX01PkWnxStnTFbsOrfpDuFkoNKRcWKVZq+wxGauR3+mRQ9nT+CEb1uhE
	UCwHbDs/iVZRktpeD56j3b5KSwy0PmEVz+Nqy
X-Received: by 2002:a05:620a:1a0d:b0:8ca:41af:32cb with SMTP id af79cd13be357-8cdb5bb05f4mr106415085a.77.1773341031455;
        Thu, 12 Mar 2026 11:43:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0d:b0:8ca:41af:32cb with SMTP id af79cd13be357-8cdb5bb05f4mr106412285a.77.1773341031010;
        Thu, 12 Mar 2026 11:43:51 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bbb2sm10005040f8f.22.2026.03.12.11.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 11:43:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sherry Sun <sherry.sun@nxp.com>
Subject: [PATCH v2 1/2] dt-bindings: PCI: fsl,imx6q-pcie: Explicitly deprecate reset-gpio
Date: Thu, 12 Mar 2026 19:43:45 +0100
Message-ID: <20260312184344.42337-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2298; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=0tXOIBZpahIMNyxmlfBim1P4ONHHre0IuoNhHAjYNZ8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpswlg93p8yhDunYSI8srtbq0lw5h4i/81CjyGK
 tJwNqZb776JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMJYAAKCRDBN2bmhouD
 1zKMD/0VbfX3p0sY7DPP9esiQ8ycSbh3PmD7F2UrbBSAiO0cHHO2LUKqcW6AMzVHx9p99uwQuaU
 ciaFreVVcuJbzwv9r6iJHIpI+IxMTC1C2DITt4tpLG9sFpyQmaFPGp7/l80/dUh0y1ZjTAn3ncL
 B+Iv9G6SMS1oBTcZdW2o9Nmn6aUDoSes84V6e1TERKgNY4L7wV/jfO4l5D3KJNaB7f0qEzQ3ukY
 u3iDqDzYEO2lgIO4PXY2tL5XFceLBFjiTClAbYkP49jeZccSinEgMPtaepHHalTrPRYjNfoQBFY
 Ut2/00fpWMV0Bu6IFOeKNkHbDknlzUFlyrQC0A0xNNHRFlD2z5e8v9RQQGwIcO0ttdL+UlRW4yZ
 STfuSi6mx/niBtDvS1g6v9otU36Z/qcB0sa0RoTvWU7VDsbzZVg3nTL4Qx3kmxBNMbS9JaOMe07
 1BbfxkKpqOlx/HiXM+0+4yZE5MzM9Q6WVPu9W01FKWI8qam8EXNYkw++HUURNSR5OpETp7rR9Of
 1OKo55KWHPpHtDBghA0+tmrkFavuNa1NxHMAR7f8dowIZcszilojKc9aGX0ERxwNEE1NocvNWg5
 A9/OB1TeWSrrQRQ4MuUzKMUwc762SE62NrxLCUkOPrzBrkyRfuZmXTlXkW2SbGy+Oe8fPq4AIRF i8K1ni69MwGq1tg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oOXYo56rfXmkU60mTKyEDwFFK2rWZtyU
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b30968 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=VNn6zrWwxK5-OcnvxvAA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1MSBTYWx0ZWRfX4SIL3Z9hFQdf
 dTgtvaRU9sLYUTrPtu9VFof5ttRVOKaF+O+Oo7hQxSnnSP4qGP0KvDUr6hOlMhXb4E7eIUDA0vD
 Htevg+mlK/Zq9fg3q6xDmvDvqfh6omDQew10uw8QuVPkPob0vcHe2D7LE2pLnlZTVS2VbMzfdOF
 chUPWw7ti/12yLM7rCdA5QRcwFLQYDetvQfwqu9g49I4THzbJY47BqwGyU4PRxMNVnpMr9s3mtY
 HXP6GjtKijF/FkdxmbaT4Bgzt7ePRGwzxn/6I49a4FRzFpEnVszeqv5MX+4//yBx3aomyF0uXyg
 RhUZGlVuO4UIvS1QYK97dttmrSfai6TIlblOfbg5V0iGZiEUU67QRc3I6mI9dAZfMmFYIbRdlNY
 O9cH8wFztkfWCM5vaK0yVLT5LFfTREIo7Z0q/xxZfK/BGQYajigb4cwJRQN+8/A1AT2D2+XVyjF
 18leu7bI2185XK72VNQ==
X-Proofpoint-ORIG-GUID: oOXYo56rfXmkU60mTKyEDwFFK2rWZtyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_114353_252769_FBCBDFA7 
X-CRM114-Status: GOOD (  15.14  )
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

The binding references snps,dw-pcie-common.yaml which already deprecates
"reset-gpio", however mentioning this property here lacks this mark thus
code is confusing and suggests property is not deprecated.

OTOH, the property cannot be removed from this schema, because it is an
ABI implemented by Linux kernel in gpiolib-of.c in backwards-compatible
map between compatibles, "reset-gpio" and "reset-gpio-active-high"
properties.

This creates code and binding which is not obvious to follow, so rewrite
it and be more explicit about:
1. Deprecation of "reset-gpio",
2. Relation that "reset-gpio-active-high" is used only for that property
   and not proper "reset-gpios".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Cc: Sherry Sun <sherry.sun@nxp.com>

Changes in v2:
1. Rewrite the commit completely after Sherry Sun comments - keep the
   property, but add "not" clause to forbid usavge of
   "reset-gpio-active-high" and "reset-gpios".
2. Because of above not adding Richard's ack.

v1:
https://lore.kernel.org/r/20260311154955.145120-3-krzysztof.kozlowski@oss.qualcomm.com
---
 Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
index 12a01f7a5744..12cd1b9f78d0 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
@@ -62,6 +62,9 @@ properties:
     description: Should specify the GPIO for controlling the PCI bus device
       reset signal. It's not polarity aware and defaults to active-low reset
       sequence (L=reset state, H=operation state) (optional required).
+      Deprecated, use reset-gpios which respects the polarity expressed in
+      phandle argument.
+    deprecated: true
 
   reset-gpio-active-high:
     description: If present then the reset sequence using the GPIO
@@ -224,6 +227,11 @@ allOf:
             - const: ref
             - const: extref  # Optional
 
+  - not:
+      required:
+        - reset-gpios
+        - reset-gpio-active-high
+
 unevaluatedProperties: false
 
 examples:
-- 
2.51.0


