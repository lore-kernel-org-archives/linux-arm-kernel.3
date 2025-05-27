Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C93C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 04:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U83q4TToxT2dLPTnjUMvyipfG7vxWpSM/Xy4BogwD50=; b=AiPEdKONUQx2pJXcQvbR0tYwkS
	TCfpkEMhWnR1UYhmgW+uu8JgHnwWqBhbWdyzdT5vYs4yerrZuXWbSKh1t2CryJtwVYRU4tWXt1HZG
	u4JmmRhsMGvjT0tjtFLz+8apos29+8kne3mM4DLSUg66Tdtgk0pBAcwJrcJ1pSJyaTRMEG2aN+/Kr
	y6c/GblvB3iTok2nqVzMGTomy0B0VLvrwGZTq+vF9RonMmSr5xs1CDSV/q3B4O5AqlfdSAw1xD9hH
	J75gbRwDo9lXmjbGI2+Ppr0jWZvBuCyWm/vmz1/gulcIj0Z1d/4FVXDWLLQa0IVkrzSRkvs8NZj3s
	G47DOJLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK8sl-0000000CAvq-08fM;
	Wed, 28 May 2025 04:59:15 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK8mc-0000000CA0b-3s8G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 04:52:56 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250528045252epoutp03865a0b22c7afacb7797ddf72b3187030~Dl8mUZpgr1180411804epoutp03F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 04:52:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250528045252epoutp03865a0b22c7afacb7797ddf72b3187030~Dl8mUZpgr1180411804epoutp03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748407972;
	bh=U83q4TToxT2dLPTnjUMvyipfG7vxWpSM/Xy4BogwD50=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Yona9kOwXnnHmYNWwO7kGy5GnQa2Nb5V7JUJ+mzvkFsuUjjbQK/DfyajYOeKFMZgl
	 X7UuIwrkYQxV9rMcttsWxyJta4GDUhN2nCbc9iOMKaZrShHmSXSOVhCwtsNqkjAPFQ
	 QHsCOv09KwDqIIQ+yJiT2irIPst/0uo4fnFVLfBQ=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250528045251epcas5p37228d43c995988ca4594d59a3364d287~Dl8llKL4N1435114351epcas5p3_;
	Wed, 28 May 2025 04:52:51 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.175]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4b6cZ86rQsz6B9m5; Wed, 28 May
	2025 04:52:48 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250527104402epcas5p25412c8db4f4408c9306253aee970b99d~DXF67b4Ey0603206032epcas5p2H;
	Tue, 27 May 2025 10:44:02 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250527104402epsmtrp2eda0d810ba7f1e069366fbf77cc1cea0~DXF66JL8s3025330253epsmtrp2K;
	Tue, 27 May 2025 10:44:02 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-49-683597722900
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	3F.24.08766.27795386; Tue, 27 May 2025 19:44:02 +0900 (KST)
Received: from FDSFTE462 (unknown [107.122.81.248]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250527104359epsmtip2b424b14cc99129bce93c32001ecb90f8~DXF398JWP3242432424epsmtip2T;
	Tue, 27 May 2025 10:43:58 +0000 (GMT)
From: "Shradha Todi" <shradha.t@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.or>,
	<linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<manivannan.sadhasivam@linaro.org>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <arnd@arndb.de>,
	<m.szyprowski@samsung.com>, <jh80.chung@samsung.com>, "'Pankaj Dubey'"
	<pankaj.dubey@samsung.com>
In-Reply-To: <20250521-cheerful-spiked-mackerel-ef7ade@kuoka>
Subject: RE: [PATCH 04/10] PCI: exynos: Add platform device private data
Date: Tue, 27 May 2025 16:13:58 +0530
Message-ID: <0e2301dbcef4$42969af0$c7c3d0d0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKa2HaEso6x90WQFKmaYw3pYxuT6gIYYP2wAv7F/dIBkV9JfLIyj0bg
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7bCSvG7RdNMMg3U3OC0ezNvGZvF30jF2
	iyVNGRZr9p5jsph/5ByrxY1fbawWK77MZLc42vqf2eLlrHtsFufPb2C3aOj5zWqx6fE1VovL
	u+awWZydd5zNYsKqbywWZ78vYLJo+dPCYrH2yF12i7stnawWi7Z+Ybf4v2cHu8XOOyeYHcQ8
	fv+axOixc9Zddo8Fm0o9Nq3qZPO4c20Pm8eTK9OZPDYvqffo27KK0ePI1+ksHp83yQVwRXHZ
	pKTmZJalFunbJXBlLDmzg7FgkXTFvgPt7A2MW8S6GDk5JARMJD4smMHWxcjFISSwm1Hi3fwe
	VoiEpMTni+uYIGxhiZX/nrNDFD1jlNjfcY8ZJMEmoCPx5MofMFtEQFdi843lYEXMAs9YJPYu
	eMAK0fGGUeL+1vlADgcHp4CtxKbjsiANwgIeEsvmnmMDsVkEVCX6pu1jBLF5BSwlrn76ywJh
	C0qcnPkEzGYW0JbofdjKCGMvW/iaGeI6BYmfT5exQhzhJnFt1R12iBpxiaM/e5gnMArPQjJq
	FpJRs5CMmoWkZQEjyypGydSC4tz03GLDAsO81HK94sTc4tK8dL3k/NxNjOCUoKW5g3H7qg96
	hxiZOBgPMUpwMCuJ8G6bYJIhxJuSWFmVWpQfX1Sak1p8iFGag0VJnFf8RW+KkEB6Yklqdmpq
	QWoRTJaJg1OqgUngVt/d2udmhk2hmRr779hvmKOy/uLlW42+OpMU3vLbJM6+xl47pfOytslx
	843/K7J9L86vj1YXDimsOuX1N96h6ySf10GFBfZWa2vDV8RxLPRZ/ePFIRfJP5/T7VSmvWbV
	/aAfOG/u1IMlF8/X3L8065XHnD1y7sYOaxUKVz9JMd36zIGPYbNeQ6eWWN+08GfPMhc8u3p6
	Wdr8y1Xb9GOYLnJt3MA7oWI+Z7XNzfePCw9eFsswuDg1Xvmwp66NzHvxFNcOC6HwaRzv7G+b
	K8T51touPhzGHXCcW3CJVWnCmn1Gdw3a3xjfLwi23MI4cd6ilPmGR1TC+h8+F49cnnT6WYpT
	yHLe7H+/tsTrcimxFGckGmoxFxUnAgBmLNE7eAMAAA==
X-CMS-MailID: 20250527104402epcas5p25412c8db4f4408c9306253aee970b99d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250518193239epcas5p4cb4112382560f38ad9708e000eb2335f
References: <20250518193152.63476-1-shradha.t@samsung.com>
	<CGME20250518193239epcas5p4cb4112382560f38ad9708e000eb2335f@epcas5p4.samsung.com>
	<20250518193152.63476-5-shradha.t@samsung.com>
	<20250521-cheerful-spiked-mackerel-ef7ade@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_215255_273724_C46651A0 
X-CRM114-Status: GOOD (  18.66  )
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



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 21 May 2025 15:15
> To: Shradha Todi <shradha.t=40samsung.com>
> Cc: linux-pci=40vger.kernel.org; devicetree=40vger.kernel.org; linux-arm-=
kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.or;
> linux-kernel=40vger.kernel.org; linux-phy=40lists.infradead.org; manivann=
an.sadhasivam=40linaro.org; lpieralisi=40kernel.org;
> kw=40linux.com; robh=40kernel.org; bhelgaas=40google.com; jingoohan1=40gm=
ail.com; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> alim.akhtar=40samsung.com; vkoul=40kernel.org; kishon=40kernel.org; arnd=
=40arndb.de; m.szyprowski=40samsung.com;
> jh80.chung=40samsung.com; Pankaj Dubey <pankaj.dubey=40samsung.com>
> Subject: Re: =5BPATCH 04/10=5D PCI: exynos: Add platform device private d=
ata
>=20
> On Mon, May 19, 2025 at 01:01:46AM GMT, Shradha Todi wrote:
> > -static const struct dw_pcie_ops dw_pcie_ops =3D =7B
> > +static const struct dw_pcie_ops exynos_dw_pcie_ops =3D =7B
> >  	.read_dbi =3D exynos_pcie_read_dbi,
> >  	.write_dbi =3D exynos_pcie_write_dbi,
> >  	.link_up =3D exynos_pcie_link_up,
> > =40=40 -279,6 +286,7 =40=40 static int exynos_pcie_probe(struct
> > platform_device *pdev)  =7B
> >  	struct device *dev =3D &pdev->dev;
> >  	struct exynos_pcie *ep;
> > +	const struct samsung_pcie_pdata *pdata;
> >  	struct device_node *np =3D dev->of_node;
> >  	int ret;
> >
> > =40=40 -286,8 +294,11 =40=40 static int exynos_pcie_probe(struct platfo=
rm_device *pdev)
> >  	if (=21ep)
> >  		return -ENOMEM;
> >
> > +	pdata =3D of_device_get_match_data(dev);
> > +
> > +	ep->pdata =3D pdata;
> >  	ep->pci.dev =3D dev;
> > -	ep->pci.ops =3D &dw_pcie_ops;
> > +	ep->pci.ops =3D pdata->dwc_ops;
> >
> >  	ep->phy =3D devm_of_phy_get(dev, np, NULL);
> >  	if (IS_ERR(ep->phy))
> > =40=40 -363,9 +374,9 =40=40 static int exynos_pcie_resume_noirq(struct =
device *dev)
> >  		return ret;
> >
> >  	/* exynos_pcie_host_init controls ep->phy */
> > -	exynos_pcie_host_init(pp);
> > +	ep->pdata->host_ops->init(pp);
> >  	dw_pcie_setup_rc(pp);
> > -	exynos_pcie_start_link(pci);
> > +	ep->pdata->dwc_ops->start_link(pci);
>=20
> One more layer of indirection.
>=20
> Read:
> https://lore.kernel.org/all/CAL_JsqJgaeOcnUzw+rUF2yO4hQYCdZYssjxHzrDvvHGJ=
imrASA=40mail.gmail.com/
>=20

I went through this thread and the solution to avoid redirection seems to b=
e:
1. Make the common parts into a library that each driver can call
2. When there is barely anything in common, make a separate driver

=46rom my understanding of these 2 drivers, there is hardly anything that c=
an go into common library
1. host_init, dbi_read, dbi_write these ops have completely different flow
2. link_up, start_link have similar flow but different register offsets
3. write_dbi2 and stop_link is not implemented for exynos but needed for FS=
D
4. Resources are different - FSD does not have regulator, Exynos5433 does n=
ot have syscon, FSD has msi IRQ vs exynos5433 has legacy
5. Exynos is host only whereas FSD is dual mode controller.

I don=E2=80=99t=20see=20any=20other=20way=20except=20redirection,=20or=20us=
ing=20lots=20of=20if(variant=20=3D=3D=20FSD)=20which=20is=20also=20discoura=
ged.=0D=0A=0D=0AAnd=20about=20making=20it=20a=20different=20driver=20altoge=
ther,=20I'm=20completely=20okay=20to=20do=20so.=20In=20fact=20we=20had=20pr=
eviously=20tried=20to=20post=20it=20as=20a=0D=0Adifferent=20driver=20which=
=20was=20rejected.=0D=0A=0D=0AIf=20you=20still=20feel=20there=20is=20a=20wa=
y=20to=20separate=20out=20the=20common=20parts=20into=20a=20library,=20plea=
se=20guide=20me.=0D=0A=0D=0A>=20Best=20regards,=0D=0A>=20Krzysztof=0D=0A=0D=
=0A=0D=0A

