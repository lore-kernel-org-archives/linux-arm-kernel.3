Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83159CEFCE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SqUiju7JTdymTLUcCbYNFwbrvaMPwFX7LS7wmO+6Ho=; b=zDUvRsQSW5iRWvnIi/l0gAZoOX
	KdGRrje0lrLHbhszah+7Ld77ajLMzvZvUIgndRb727omFeQ8zHIx/1W5UXMLtalUblnRKnM8pokuI
	lyLb1lEplWOKbGr+qUJf4+jw2vK+kwtkck6P63RQzP2tvjvCTigKHfiRnlBi9eaw7yTQ3Fy1k1YQt
	OREWKvbIBVJNGnaGfZfGLLxhaCeOHyyjtFMDATZjMo/4+ZApgFx3DPlURONMRy3amDXISr+RhlORW
	5nYGi8AVmriZ+UK0iBJ4Yy1eg/VNZLVB9HGn0e4gCKXbfmdPmyEQE4gJeRLVAyOoZFFO+vHN8xS6e
	tw0PpL/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB9e-0000000Dd5X-1x5I;
	Tue, 06 Jan 2026 17:47:38 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB9Z-0000000Dd4q-3AQa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:47:37 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260106174724epoutp04dc729619237b23e6e787fdb4d141ed51~INXhRUXPO2911829118epoutp04Z
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Jan 2026 17:47:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260106174724epoutp04dc729619237b23e6e787fdb4d141ed51~INXhRUXPO2911829118epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767721644;
	bh=1SqUiju7JTdymTLUcCbYNFwbrvaMPwFX7LS7wmO+6Ho=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=G7UGRfUHUAvO1gj600K007nX0IGVnyUCf2F1+N0FSyR+z1uUF7D7h5IBC3riAqaED
	 5qgMuTLhEqoCC3teLE8wXagNlsi+sUTApLKdBegHkSbx8HLkV4H+uePf/B/hnFmQlQ
	 eOCK8nfLQ9rkPiM22dWHuPmWRmvRZMXrXKTN1vYg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260106174723epcas5p1165352a485d67b66d18fffe3500895f1~INXgVPH7i2622426224epcas5p1M;
	Tue,  6 Jan 2026 17:47:23 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dlzBy42Kzz6B9m4; Tue,  6 Jan
	2026 17:47:22 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260106174722epcas5p16f744ceb5059e7695cca08317f6e8c62~INXe6Llxa2622426224epcas5p1L;
	Tue,  6 Jan 2026 17:47:22 +0000 (GMT)
Received: from INBRO000519 (unknown [107.122.1.150]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260106174719epsmtip2257206d5a8046c710d6d9f8795ccb86d~INXcqoSLM1550115501epsmtip2C;
	Tue,  6 Jan 2026 17:47:18 +0000 (GMT)
From: "Faraz Ata" <faraz.ata@samsung.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>
Cc: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <rosa.pila@samsung.com>,
	<pritam.sutar@samsung.com>, <dev.tailor@samsung.com>
In-Reply-To: <20250904072844.358759-1-faraz.ata@samsung.com>
Subject: RE: [PATCH] dt-bindings: i2c: exynos5: add exynosautov920-hsi2c
 compatible
Date: Tue, 6 Jan 2026 23:17:04 +0530
Message-ID: <00c001dc7f34$828b0c90$87a125b0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMyl6jZ32DHOO134xOI05SqoiCOxQG1dU1GsosmcDA=
Content-Language: en-us
X-CMS-MailID: 20260106174722epcas5p16f744ceb5059e7695cca08317f6e8c62
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1
References: <CGME20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1@epcas5p1.samsung.com>
	<20250904072844.358759-1-faraz.ata@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_094735_240593_6B7D9AB7 
X-CRM114-Status: GOOD (  15.48  )
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

HI Andi/Rob

I want to follow up on the below dt-binding patch submitted.
Please let me know if the patch is under review or anything else needs to b=
e done.

Reference  - https://lore.kernel.org/all/83338b57-2e8e-4b77-9e93-fadfb0f6a5=
fc=40kernel.org/

> -----Original Message-----
> From: Faraz Ata <faraz.ata=40samsung.com>
> Sent: Thursday, September 4, 2025 12:59 PM
> To: andi.shyti=40kernel.org; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; alim.akhtar=40samsung.com
> Cc: linux-i2c=40vger.kernel.org; devicetree=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; rosa.pila=40samsung.com;
> pritam.sutar=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com
> Subject: =5BPATCH=5D dt-bindings: i2c: exynos5: add exynosautov920-hsi2c
> compatible
>=20
> Add =22samsung,exynosautov920-hsi2c=22 dedicated compatible for HSI2C fou=
nd
> in ExynosAutov920 SoC.
>=20
> Signed-off-by: Faraz Ata <faraz.ata=40samsung.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml =7C 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> index 7ae8c7b1d006..207b95e392e5 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> =40=40 -38,6 +38,7 =40=40 properties:
>                - google,gs101-hsi2c
>                - samsung,exynos2200-hsi2c
>                - samsung,exynos850-hsi2c
> +              - samsung,exynosautov920-hsi2c
>            - const: samsung,exynosautov9-hsi2c
>        - const: samsung,exynos5-hsi2c    =23 Exynos5250 and Exynos5420
>          deprecated: true
> --
> 2.34.1



