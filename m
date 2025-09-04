Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2750CCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 12:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNCOKsku3jGQZIW1rjPQqO4AY7LjBwEb5L1n61T6Nys=; b=DNULxKSDlnESliueXkgt0NXHCP
	LSI0SSYaJzRP57Q3udpi706sGIjFTvo1Z7nCYvln+yoTSdv8ap9ZnKjGzi8jSItwIDna/ILxKszOe
	ePmvIoxCZPZeTZO0+QNcLCtC8FL7lKPbS/XkTiB+n3EXf7OVs2RooAgV7UubPyknfrAdqI4WAYT0N
	CmPxxnPP5GLDs1yNxRpR1QY8fL1B8p7e8agYK0LQYnBHqK7oMx6U9cA6nTvo/siPIM1aZztQvi+0Z
	vzGHTSFM0V3ao0ufw3q7Yi/itjrNYb/oMx4v+ufbJ52OyuYyWQaYfvX+ATxhcxrdhM2y7xUZ3/mD2
	j9bc52gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8np-0000000BSuJ-1jNT;
	Thu, 04 Sep 2025 12:10:57 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6uP-0000000Am19-03JU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 10:09:41 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250904100931epoutp0219f7d42d206845b33388684d803eaf0a~iDIVBC5QF2817628176epoutp02D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Sep 2025 10:09:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250904100931epoutp0219f7d42d206845b33388684d803eaf0a~iDIVBC5QF2817628176epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756980571;
	bh=NNCOKsku3jGQZIW1rjPQqO4AY7LjBwEb5L1n61T6Nys=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=TKdel1x1yl5ccpn7yLkSFUxqKvDArpwhaUI0O5tQwYpnuKS1xqd5QncgYmKJ64WJi
	 fd5+Ug/oGuxgcFxw1Xa6r1Ap3GowITAOZ8gdvfAk7dALvWetvR3lJCzbz3+p0NcMeF
	 Y5STV2TB+FF6iwW+rhXN8bUAx2PZhFv0P4le8NtE=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250904100930epcas5p2c91a6734fdedf9d2765cc8288c91234c~iDIUcNZEF0566805668epcas5p2W;
	Thu,  4 Sep 2025 10:09:30 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cHZvs3Nxbz3hhT3; Thu,  4 Sep
	2025 10:09:29 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250904100928epcas5p3b02d748847905e62c897bc576b7ef948~iDISWDEAh0328503285epcas5p3x;
	Thu,  4 Sep 2025 10:09:28 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250904100926epsmtip1f3e09235bbd83a12c3fd0c487201e546~iDIQuo_AL1187611876epsmtip1M;
	Thu,  4 Sep 2025 10:09:26 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Faraz Ata'" <faraz.ata@samsung.com>, <andi.shyti@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
Cc: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <rosa.pila@samsung.com>,
	<pritam.sutar@samsung.com>, <dev.tailor@samsung.com>
In-Reply-To: <20250904072844.358759-1-faraz.ata@samsung.com>
Subject: RE: [PATCH] dt-bindings: i2c: exynos5: add exynosautov920-hsi2c
 compatible
Date: Thu, 4 Sep 2025 15:39:25 +0530
Message-ID: <435b01dc1d83$ff8bde30$fea39a90$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMyl6jZ32DHOO134xOI05SqoiCOxQG1dU1GscgrbFA=
Content-Language: en-us
X-CMS-MailID: 20250904100928epcas5p3b02d748847905e62c897bc576b7ef948
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1
References: <CGME20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1@epcas5p1.samsung.com>
	<20250904072844.358759-1-faraz.ata@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_030938_494104_900EFD23 
X-CRM114-Status: GOOD (  14.67  )
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

Hi Faraz,

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
This is not complete; any new compatible should be complemented with driver=
 changes
(User of the compatible) followed by dts change.
Always send a complete set, also mentioning how the patch was tested.
Best is to get patches reviewed internally before sending to community.
=20
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



