Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3BBC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 11:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Nli5jAMu0NC9zLKjZfj4lZI1r3k1lL6PZil61CiwoQ=; b=wemL51GcTfir+TcUggkX8LP0Ee
	dExV6H5niR4zesWJAdDO78GczumzYp+nzxVEHjcUQDDHAomC86uoWDkOmV9EdtltorxwnUYRyTcfV
	kpmE/rTQ0FelaTTS9CBfqYA0J+dEfZqQDdGOwWC88XSrcqA9YHFH+a6u/bIb09u47FPYukRLCgj5A
	QIkRNtt7qTRtCwv6IXgXBUNBBtyp8RfX9Ma7H1WVoPbtbrfJsJ1qhKqdzYaDqqnSy1dPgrSyub94w
	HKQxaUwXe2Ua2Bb9R7cjEzFixWpQS1DXNTYm8byxTp5mAvxfTbzJfP+gNImCwTTDu3/Q9VrjN5Ib5
	Y0D7B+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZSt-00000004ufI-3k7u;
	Tue, 01 Jul 2025 11:47:55 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZLf-00000004t7l-3r2Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:40:29 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250701114024epoutp046742514fb9f642f6a76ec7228da47e49~OHcIRAVZA0989609896epoutp04v
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Jul 2025 11:40:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250701114024epoutp046742514fb9f642f6a76ec7228da47e49~OHcIRAVZA0989609896epoutp04v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751370024;
	bh=2Nli5jAMu0NC9zLKjZfj4lZI1r3k1lL6PZil61CiwoQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=KY7JO1IsHlfA9MJX/INx8OUB847GygezOpPrB/oKVBqWR2MCcGbK12Jt072bSnoBJ
	 zI0/WThqCBwwTO3oKM9pVqvvpST/SigLVMAIRRB0OV3jRQh9C0Kiti219ZeHzcOB/N
	 89AT5YOTsEUDcOR3qPlJQMDXwMWgDHnNnCFAxM9Y=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250701114023epcas5p33dd4f6f24af1c80abcf7c49a1993ea12~OHcHvVz-72271022710epcas5p3o;
	Tue,  1 Jul 2025 11:40:23 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.180]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bWh0j3BTSz6B9m7; Tue,  1 Jul
	2025 11:40:21 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250701113336epcas5p1cfa1a369fad337b9a2211c7588cd7561~OHWMK6rHg2219722197epcas5p1d;
	Tue,  1 Jul 2025 11:33:36 +0000 (GMT)
Received: from FDSFTE462 (unknown [107.122.81.248]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250701113333epsmtip106136eafe25d00b19c1917b7fa970e20~OHWJXty0k3251632516epsmtip1u;
	Tue,  1 Jul 2025 11:33:33 +0000 (GMT)
From: "Shradha Todi" <shradha.t@samsung.com>
To: "'Bjorn Helgaas'" <helgaas@kernel.org>
Cc: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-fsd@tesla.com>, <mani@kernel.org>, <lpieralisi@kernel.org>,
	<kw@linux.com>, <robh@kernel.org>, <bhelgaas@google.com>,
	<jingoohan1@gmail.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>, <vkoul@kernel.org>, <kishon@kernel.org>,
	<arnd@arndb.de>, <m.szyprowski@samsung.com>, <jh80.chung@samsung.com>,
	<pankaj.dubey@samsung.com>
In-Reply-To: <20250627162943.GA1672296@bhelgaas>
Subject: RE: [PATCH v2 06/10] dt-bindings: PCI: Add bindings support for
 Tesla FSD SoC
Date: Tue, 1 Jul 2025 17:03:31 +0530
Message-ID: <02b201dbea7b$fbaf5390$f30dfab0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLemVNzYEMOy/tIwP8yQfjCLghe+gHQOY9Ysgk/TyA=
Content-Language: en-in
X-CMS-MailID: 20250701113336epcas5p1cfa1a369fad337b9a2211c7588cd7561
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250627162949epcas5p1fc5eebd0036116ce2913cdcbabdab1fd
References: <CGME20250627162949epcas5p1fc5eebd0036116ce2913cdcbabdab1fd@epcas5p1.samsung.com>
	<20250627162943.GA1672296@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044028_274645_E6784E10 
X-CRM114-Status: GOOD (  23.06  )
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
> From: Bjorn Helgaas <helgaas@kernel.org>
> Sent: 27 June 2025 22:00
> To: Shradha Todi <shradha.t@samsung.com>
> Cc: linux-pci@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
linux-
> samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-phy@lists.infradead.org; linux-
> fsd@tesla.com; manivannan.sadhasivam@linaro.org; lpieralisi@kernel.org; kw@linux.com;
> robh@kernel.org; bhelgaas@google.com; jingoohan1@gmail.com; krzk+dt@kernel.org;
> conor+dt@kernel.org; alim.akhtar@samsung.com; vkoul@kernel.org; kishon@kernel.org;
> arnd@arndb.de; m.szyprowski@samsung.com; jh80.chung@samsung.com; pankaj.dubey@samsung.com
> Subject: Re: [PATCH v2 06/10] dt-bindings: PCI: Add bindings support for Tesla FSD SoC
> 
> On Wed, Jun 25, 2025 at 10:22:25PM +0530, Shradha Todi wrote:
> > Document the PCIe controller device tree bindings for Tesla FSD
> > SoC for both RC and EP.
> 
> > +++ b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
> 
> > -  clocks:
> > -    items:
> > -      - description: PCIe bridge clock
> > -      - description: PCIe bus clock
> 
> > -  vdd10-supply:
> > -    description:
> > -      Phandle to a regulator that provides 1.0V power to the PCIe block.
> > -
> > -  vdd18-supply:
> > -    description:
> > -      Phandle to a regulator that provides 1.8V power to the PCIe block.
> 
> > +            - description: pcie bridge clock
> > +            - description: pcie bus clock
> 
> Gratuitous "PCIe" capitalization changes here and in supplies below.
> This is just plain English text so we can use English conventions.
> 
> > +        vdd10-supply:
> > +          description:
> > +            phandle to a regulator that provides 1.0v power to the pcie block.
> > +
> > +        vdd18-supply:
> > +          description:
> > +            phandle to a regulator that provides 1.8v power to the pcie block.
> 
> I *would* be OK if you dropped the periods at the end of these, which
> would make them match the other descriptions in this binding.
> 
> > +++ b/Documentation/devicetree/bindings/pci/tesla,fsd-pcie-ep.yaml
> 
> I'm not sure about the "tesla,fsd-pcie-ep.yaml" filename.  I see that
> it currently only describes a tesla endpoint, but it seems like maybe
> this should be parallel to the "samsung,exynos-pcie.yaml" host
> controller binding.
> 
> Bjorn

Actually there is no support for Exynos5433 in EP mode. Initially I named
the binding file "samsung,exynos-pcie-ep.yaml" to make it parallel to the host
controller bindings. But I received a comment that file names should match
the compatible strings which makes sense so I changed it to this.



