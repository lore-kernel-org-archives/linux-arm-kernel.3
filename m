Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2BAEB490D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ase9xp9Kc9/jsnZ174Suydxg92duerBwfwT7Vhmzv8A=; b=BOUfw2yeIHofggHk3W4vJEDnGE
	v6tpS6PIagdHyTRm26ReWt6yvKuYrDYJKpP3M7/R6OfJZDXBOQpMGRM9Yb62t4nj+N3WSlj7D6FW6
	iPpfNHfTKx8XEO0jarnklSyI5iwRqx4QVniL976UXmHJbRGDWRbdHTtA/Eay3TZoD+h3kM/LWsddo
	pJQVXMEkC4vMveRwRzkeix8f/M/npTHNDAx81RZgPxVbEvKm3MwXsFwLcyAWi62Dj4X2kMlzgpNDv
	iMHFJpn0MC/TlvAladz0oUvuflqrHD2GhXQVrgnsNkacPqsS+NGQZRJMZWak4o1GGSFZwZpQVNDIw
	tafCi/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV4O-000000020rA-1es7;
	Thu, 12 Feb 2026 11:41:16 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV4L-000000020q6-1Um0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 11:41:15 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260212114106epoutp042dce7a2cf62f2a6de4071972f2feb5e1~TfPQXVy4I1199511995epoutp04Q
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 11:41:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260212114106epoutp042dce7a2cf62f2a6de4071972f2feb5e1~TfPQXVy4I1199511995epoutp04Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770896466;
	bh=Ase9xp9Kc9/jsnZ174Suydxg92duerBwfwT7Vhmzv8A=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=l7q4JicQDyE41yBQC3b7C9oVa2Wxo6EYNZWYbJG4TlrH0etyhkfUnP/cgjTXZAJB8
	 /DiupSopK4+m1GcHqoxMHKqFdl1ARNd38RcSveESJCPzKUK6zhVpAbFGfkRLSeEIZw
	 HvdnfM14k87zcNSWBe5aW8gE0ArwANn2Pn9XtZzY=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260212114105epcas5p4f65105fa457ae55644df5c7b14c8e102~TfPPMnHZi0123101231epcas5p4V;
	Thu, 12 Feb 2026 11:41:05 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4fBYKD0NHpz2SSKY; Thu, 12 Feb
	2026 11:41:04 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260212114103epcas5p1ec7d13f32afcb566a9e262a4b24a1e3a~TfPN0eJmP1615316153epcas5p17;
	Thu, 12 Feb 2026 11:41:03 +0000 (GMT)
Received: from INBRO007194 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260212114101epsmtip2f00e578354e624558cb0f6d56fe6b874~TfPMBqs5J1841218412epsmtip2W;
	Thu, 12 Feb 2026 11:41:01 +0000 (GMT)
From: <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <15e8aac4-6633-49b0-87fb-4b29f62afb2f@kernel.org>
Subject: RE: [PATCH v2 3/3] arm64: dts: exynos: ExynosAutov920: Enable USB
 nodes
Date: Thu, 12 Feb 2026 17:10:59 +0530
Message-ID: <000101dc9c14$774a0190$65de04b0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEa27yOGkcSyej7W4JCG0x5iKXFKwH8TUbRAqvnhIQBf1ky2gNZK3OcAkJh59y2pFfeMA==
Content-Language: en-us
X-CMS-MailID: 20260212114103epcas5p1ec7d13f32afcb566a9e262a4b24a1e3a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260122125136epcas5p2db0fa3d04671ddc915e60ae8c5bcfb98
References: <20260122130721.205664-1-pritam.sutar@samsung.com>
	<CGME20260122125136epcas5p2db0fa3d04671ddc915e60ae8c5bcfb98@epcas5p2.samsung.com>
	<20260122130721.205664-4-pritam.sutar@samsung.com>
	<6f381f88-3a51-4fc8-844c-41b167b07628@kernel.org>
	<000f01dc8c3e$2b6dcf30$82496d90$@samsung.com>
	<15e8aac4-6633-49b0-87fb-4b29f62afb2f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_034114_309658_E9811C8E 
X-CRM114-Status: GOOD (  27.44  )
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
> Sent: Friday, January 23, 2026 1:36 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com
> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;=
 linux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v2 3/3=5D arm64: dts: exynos: ExynosAutov920: Enabl=
e USB
> nodes
>=20
> On 23/01/2026 08:59, Pritam Manohar Sutar wrote:
> > Hi Krzysztof,
> >
> > Thank you for your feedback.
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: 22 January 2026 07:05 PM
> >> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>;
> robh=40kernel.org;
> >> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com
> >> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.o=
rg;
> >> linux- samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> >> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com;
> >> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> >> Subject: Re: =5BPATCH v2 3/3=5D arm64: dts: exynos: ExynosAutov920:
> >> Enable USB nodes
> >>
> >> On 22/01/2026 14:07, Pritam Manohar Sutar wrote:
> >>> Enable USB PHY and DWC3 USB controllers' nodes.
> >>>
> >>> Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >>> ---
> >>>  .../boot/dts/exynos/exynosautov920-sadk.dts   =7C 21
> >> +++++++++++++++++++
> >>>  1 file changed, 21 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> >>> b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> >>> index f90f7704597c..5896dd69334a 100644
> >>> --- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> >>> +++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> >>> =40=40 -160,15 +160,20 =40=40 &xtcxo =7B
> >>>  &usbdrd31_ssphy =7B
> >>>  	dvdd-supply =3D <&dummy_regulator>;
> >>>  	vdd18-supply =3D <&dummy_regulator>;
> >>> +	status =3D =22okay=22;
> >>
> >> You just added the node in the previous patch, so why it cant be
> >> enavled there?
> >>
> >>>  =7D;
> >>>
> >>>  &usbdrd31_hsphy =7B
> >>>  	dvdd-supply =3D <&dummy_regulator>;
> >>>  	vdd18-supply =3D <&dummy_regulator>;
> >>>  	vdd33-supply =3D <&dummy_regulator>;
> >>> +	status =3D =22okay=22;
> >>>  =7D;
> >>>
> >>>  &usbdrd31_dwc3 =7B
> >>> +	dr_mode =3D =22otg=22;
> >>> +	usb-role-switch;
> >>> +	role-switch-default-mode =3D =22peripheral=22;
> >>
> >> Why did you add incomplete node in previous commit?
> >
> > The commit was added to align with the existing convention of
> > separating node addition and enabling logic in USB configurations.
> > This approach is
>=20
> There was never such convention for Qualcomm or Samsung. Do not make
> up fake conventions.
>=20
> > referenced from commits such as:
>=20
> No, it is not.
>=20
> >
> > https://lore.kernel.org/all/20250710-resends-july-exynos990-dt-v2-5-55
> > 033f73d1b0=40mentallysanemainliners.org/
> > https://lore.kernel.org/all/20240429-usb-dts-gs101-v2-2-7c1797c9db80=40=
l
> > inaro.org/
>=20
> Just look at these commits - they add complete node override to DTS. Not
> half node now and half node later to the DTS file=21
>=20
> >
> > Please let me know if this commit to be merged in previous commit.
>=20
> Just look at the commits there.
>=20

Got it, thank you for the highlighting. Will mention more details in commit
and update single patch to add and enable USB nodes.

> >
>=20
>=20
> Best regards,
> Krzysztof

Thank you,

Regards,
Pritam


