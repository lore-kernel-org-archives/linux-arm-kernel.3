Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB86CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 08:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BR2gZ2ua1hawq9ETTub8etbCtTRBasyb9bOMsgkE+5E=; b=iXbCsVVV0JvL3YQNmiRxBv0tZK
	Zggv4Wrh4zqGwaql2bCRuAblc5Cncwf/VKoN92F4nMsBTbnMkDqUx7HUEwbLk7GpTosWpLckoVLSz
	r1MpDr9qLsGUY9dooLhacNTbVDx6lNdhes0R1tLREuDSSfOsDECQ093zcBgTL89sDUGbqAl+2046o
	ak5ImEybnw6G3jfjZmmmHnVDUn9SYAlI9Kxb9FmphsvIrDBTp4DlWO6PKD5Yv7eDRFHOprhk4PO40
	zfNiJE5Xg66MJpCfqQPIsK8TpR1Fx345jjUZSSrQ9UabKVu34Euq18IFaVsrdp/VFnjFPYA5wY4DD
	XnWOyCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu59W-0000000AAAl-08Zn;
	Thu, 04 Sep 2025 08:17:06 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4ka-0000000A0CV-1ICR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 07:51:22 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250904075114epoutp04242222393fe811e9b2dd93006d8c284b~iBPmJxSaa0922609226epoutp04x
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Sep 2025 07:51:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250904075114epoutp04242222393fe811e9b2dd93006d8c284b~iBPmJxSaa0922609226epoutp04x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756972274;
	bh=BR2gZ2ua1hawq9ETTub8etbCtTRBasyb9bOMsgkE+5E=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Gkk95YVGgKoh1+rYqdqaEg/PXdvf4qvbychJ0Od0sDf5pmCQyxJPCIe9Bm0iwK2es
	 x/k2atHBSI/kz9oH2OdLuPxvFDZHUJdEVJ3Be8QFSzTWII5RQvBGI59YIx8XO3bFtl
	 SoxvOqW+3GNP7UHyrZg/eGePJjDP8tRzDHu4zEtI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250904075113epcas5p394340cc759dc824bd310f5b5d72f2cdf~iBPliafs32306923069epcas5p3P;
	Thu,  4 Sep 2025 07:51:13 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cHWrJ5Zw5z2SSKh; Thu,  4 Sep
	2025 07:51:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250904075112epcas5p49650dcfae9c59e1241751ea53f73fbcc~iBPj-8a8Q2959129591epcas5p47;
	Thu,  4 Sep 2025 07:51:12 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250904075109epsmtip2fcfead067a25af3c3ad223ce40bbf198~iBPhGx2ni3175031750epsmtip2A;
	Thu,  4 Sep 2025 07:51:08 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<igor.belwon@mentallysanemainliners.org>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250904-interesting-lovely-ringtail-38bbef@kuoka>
Subject: RE: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Thu, 4 Sep 2025 13:21:07 +0530
Message-ID: <000001dc1d70$aebf7d80$0c3e7880$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgGabj6EAmTXuDcB8lF0oLPo6zcQ
Content-Language: en-in
X-CMS-MailID: 20250904075112epcas5p49650dcfae9c59e1241751ea53f73fbcc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e@epcas5p4.samsung.com>
	<20250903073827.3015662-2-pritam.sutar@samsung.com>
	<20250904-interesting-lovely-ringtail-38bbef@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_005121_022697_4EF6A545 
X-CRM114-Status: GOOD (  25.43  )
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

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 04 September 2025 12:18 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; kauschluss=40disr=
oot.org;
> ivo.ivanov.ivanov1=40gmail.com; igor.belwon=40mentallysanemainliners.org;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com; linux-
> phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 HS phy compatible
>=20
> On Wed, Sep 03, 2025 at 01:08:22PM +0530, Pritam Manohar Sutar wrote:
> > Document support for the USB20 phy found on the ExynosAutov920 SoC.
> > The
> > USB20 phy is functionally identical to that on the Exynos850 SoC, so
> > no driver changes are needed to support this phy. However, add a
> > dedicated compatible string for USB20 phy found in this SoC.
> >
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
>=20
> You just dropped all tags without explaining why.

Regretted inconvenience.=20

There were significant changes in supplies' names in driver and schemas=20
(patch-set v8). This led to make changes in patch no 5.  And review for=20
these changes is needed.  Hence, removed RB tag in this patch-set.=20

There was a ask for the same https://lore.kernel.org/linux-phy/000401dc18cd=
=24ec02a1b0=24c407e510=24=40samsung.com/=23:=7E:text=3DLet%20me%20know%2C%2=
0because%20of%20above%20changes%2C%20should%20be%20removing%20your%20%0A%27=
reviewed%2Dby%27%20tag%20from%20patch%201%20and%203.

This had to be captured in changelog along with other details. Will remembe=
r to add details=20
in future, if any tags are removed.=20

However,  do I need to send v9 with the details?=20

>=20
> <form letter>
> This is a friendly reminder during the review process.
>=20
> It looks like you received a tag and forgot to add it.
>=20
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions =
of
> patchset, under or above your Signed-off-by tag, unless patch changed
> significantly (e.g. new properties added to the DT bindings). Tag is =22r=
eceived=22,
> when provided in a message replied to you on the mailing list. Tools like=
 b4 can
> help here. However, there's no need to repost patches *only* to add the t=
ags.
> The upstream maintainer will do that for tags received on the version the=
y apply.
>=20
> Please read:
> https://protect2.fireeye.com/v1/url?k=3D6abe7ac7-0bc392bf-6abff188-
> 74fe485fffb1-49c70cea06738e63&q=3D1&e=3Dfc43c80a-8c7b-41b0-aa24-
> 8cb76d954fe5&u=3Dhttps%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.12-
> rc3%2Fsource%2FDocumentation%2Fprocess%2Fsubmitting-
> patches.rst%23L577
>=20
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
>=20
> Best regards,
> Krzysztof

Thank you.

Regards,
Pritam



