Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEDBC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 05:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hz1HFML4XK8tE1xQaBIm71xwTifq2WWbFnq2f3NNQ0E=; b=zSFzxOtjG65y0WXraVu2P5L6FF
	/nuYsgl39c9fHxQDZl1jHNyKsW+0A6ou9Zw/oBEVGlS/nxBZh//KQrtrk1OBpJSN4T8XhVIkANmnh
	gYDZlNPv0sKlPG9RfgWlCKIYxDdNY2sPcc97EH3QUMonHe6YOXDcKSufNqlno3rwvG5LR2RNc+3Fu
	zCB6tYZygKZJDBIxaN/0wrq81Vf9UZ0Tmju09i3n1+koyI/lkYDWI9ohdMCcKj2MHd/zAiIDciXsk
	VU2Pyt/qoIdU1IlOj2F3L6/YkbJH4dcd19t+RzAsJYNEVak5v/u/T/nk3uz9/GWqntKxHkCY7+Js3
	pN8jFSdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK8uq-0000000CB8b-2rOw;
	Wed, 28 May 2025 05:01:24 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK8mw-0000000CA5d-2Ygr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 04:53:16 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250528045308epoutp0450c8e18af03e0ad22d4f00ea1ad0f94e~Dl81LUa_S2370423704epoutp04T
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 04:53:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250528045308epoutp0450c8e18af03e0ad22d4f00ea1ad0f94e~Dl81LUa_S2370423704epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748407988;
	bh=hz1HFML4XK8tE1xQaBIm71xwTifq2WWbFnq2f3NNQ0E=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=bL2V57wzOaOrxx/gyWgzW2shDUf6RxqJlGB61pJjo+GUnG6mmBkLneThSuMYo8flY
	 apExJvKmRvnwM4dVlC+SmicyHhIbvQbU/mWeaFSoC//xm6xbYaDTFSi3vqGN84P3oT
	 E8EIaepC/kqDInCWYbbInKaet/wNFFcap7x5zs8E=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250528045307epcas5p1113e1487d13fa5416235b207a856d08e~Dl80pu5tZ2422124221epcas5p1G;
	Wed, 28 May 2025 04:53:07 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.178]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4b6cZV1601z6B9mG; Wed, 28 May
	2025 04:53:06 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250527104410epcas5p1d22eefe556eb86feb2992bb1adfadd45~DXGCbhsaC0535405354epcas5p1Y;
	Tue, 27 May 2025 10:44:10 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250527104410epsmtrp25ea45d14158feda1545913d9812e61d4~DXGCZh-mN3025330253epsmtrp25;
	Tue, 27 May 2025 10:44:10 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-7c-6835977af2eb
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	46.34.08766.A7795386; Tue, 27 May 2025 19:44:10 +0900 (KST)
Received: from FDSFTE462 (unknown [107.122.81.248]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250527104407epsmtip1d156293db8b97e6644aa25fca2b95139~DXF-jWkYy0369003690epsmtip1J;
	Tue, 27 May 2025 10:44:07 +0000 (GMT)
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
In-Reply-To: <20250521-nostalgic-fox-of-valor-f6d725@kuoka>
Subject: RE: [PATCH 05/10] PCI: exynos: Add structure to hold resource
 operations
Date: Tue, 27 May 2025 16:14:06 +0530
Message-ID: <0e2401dbcef4$476ba2a0$d642e7e0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKa2HaEso6x90WQFKmaYw3pYxuT6gIERDRHAaZvXO0CKPaYJLI5OpqA
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTcRjG/e+cnZ0NRqdp+S9La1CkNVMw+FdiRphHDCmjoL7Uaic32nRt
	XlKKRpmxMfNopLjURkmXkZrTdOUsmLOL1UIULUzRmuuGUHlJTVttK/Lbw/v+nud9PrwkJnqH
	LycVmdmMJlOqFBMCvKVDHC4pqNgkjym5swgN17QQaL7sMQ/VnpWjO+0uDrrqdHHR69kiLro1
	UclDnee9GPpkGiLQq1d3eUhn/MlF1vd9XNTzoIpAL2ueEIi1TOHo5Q8zBxXOFeKozjnIQ4OF
	ei66dm+Ch7x2Gw/df/sUS1xK/5wtA/R90yCPNltzaKtFT9Bv++wE7e6t4NBNtWfoi80WQDsn
	K3B63Bq+W3BQEC9jlIpcRrMx4bBA/qWexdR64cl613dCB2YEBkCSkIqDXdUqAxCQIqoNwGtj
	LmAA/D/zZXC8u54T0MHw9q8PvADkAZAtv477FgS1Abp75zCfDqEksOn1TT+EUR4ctpuHuQHH
	5z+xHgPho/jUVuitG/C7g6k90DM/7D+HU2tghc7kZ4TUZjjpPQcCejF8VunGfVUxKhoWNfrH
	GBUBW8eqsEC7VXBm9AbXh4RQO2F/018kFHbOGDEWBJsWBJn+B5kWBJkWOMwAt4BljFqrylBp
	Y9WxmUxetFaq0uZkZkQfzVJZgf8NoiJtoNXyNdoBOCRwAEhi4hBhCxsnFwll0vwCRpN1SJOj
	ZLQOEEbi4lBh6MdimYjKkGYzxxlGzWj+bTkkf7mOg+vHWOQW7Sgt3q8IqykvfXOiq02c4Ox5
	l9jYXG8/shkk73Kue2TQHAGR3lykBka2eevAXNlQx+2wUxJbuVr1Irnh6IrubxE65VRlGz9+
	pWLLkynb5enTTUPZdduUEodNHR95RhhecsyRNJt2ZYmyNaZw9fqOpUnjtxzefaHT+4LS082y
	2Bi7xJX/vms+9UCRPeVSylhn/+gJmTQhw/N1fV512reJVSVyo5Plp3eimUpd8d7nQdZw5+qS
	ngK9UVNbWq3wNA9wklIv/5IJNlQl5jc2jAS9MLfvAi2n1ua6R5WfWrOmH0awqXn8549Stv/g
	r93rejNywQGT09dMinGtXBobhWm00t/1KgkCdQMAAA==
X-CMS-MailID: 20250527104410epcas5p1d22eefe556eb86feb2992bb1adfadd45
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250518193244epcas5p3cacfbdc3b0e5c32f7a4dd97062a931a4
References: <20250518193152.63476-1-shradha.t@samsung.com>
	<CGME20250518193244epcas5p3cacfbdc3b0e5c32f7a4dd97062a931a4@epcas5p3.samsung.com>
	<20250518193152.63476-6-shradha.t@samsung.com>
	<20250521-nostalgic-fox-of-valor-f6d725@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_215314_956227_B773C6E8 
X-CRM114-Status: GOOD (  18.69  )
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
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 21 May 2025 15:13
> To: Shradha Todi <shradha.t@samsung.com>
> Cc: linux-pci@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.or;
> linux-kernel@vger.kernel.org; linux-phy@lists.infradead.org; manivannan.sadhasivam@linaro.org; lpieralisi@kernel.org;
> kw@linux.com; robh@kernel.org; bhelgaas@google.com; jingoohan1@gmail.com; krzk+dt@kernel.org; conor+dt@kernel.org;
> alim.akhtar@samsung.com; vkoul@kernel.org; kishon@kernel.org; arnd@arndb.de; m.szyprowski@samsung.com;
> jh80.chung@samsung.com; Pankaj Dubey <pankaj.dubey@samsung.com>
> Subject: Re: [PATCH 05/10] PCI: exynos: Add structure to hold resource operations
> 
> On Mon, May 19, 2025 at 01:01:47AM GMT, Shradha Todi wrote:
> > +struct samsung_res_ops {
> > +	int (*init_regulator)(struct exynos_pcie *ep);
> > +	irqreturn_t (*pcie_irq_handler)(int irq, void *arg);
> >  };
> >
> >  static void exynos_pcie_writel(void __iomem *base, u32 val, u32 reg)
> > @@ -74,6 +81,36 @@ static u32 exynos_pcie_readl(void __iomem *base, u32 reg)
> >  	return readl(base + reg);
> >  }
> >
> > +static int samsung_regulator_enable(struct exynos_pcie *ep) {
> > +	struct device *dev = ep->pci.dev;
> > +	int ret;
> > +
> > +	if (ep->supplies_cnt == 0)
> > +		return 0;
> > +
> > +	ret = devm_regulator_bulk_get(dev, ep->supplies_cnt, ep->supplies);
> 
> No. Getting resources on every enable is making this much less readable.
> 
> NAK
> 

Will make sure that we get the resources only once during probe.

> Best regards,
> Krzysztof



