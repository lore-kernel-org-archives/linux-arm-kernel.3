Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DA6C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 11:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTwebVUoQkQpDDdsDBbSlrPKaFDW2GsaHKchVaUCu5k=; b=Y/T4yX/PF8pENcp/VHs+cXIom2
	bYvaG3d+iZj+CBX/NZ6olzfZyDRyI6VMiqes9Nm3Ux5N1Qu4cpaL+vNFTx2kDZooMPdqIZBXDeS0S
	xp8ycQmhcaLzyd/ArFRerAIsxrMakb/fR6GB194cZ63IY5A8oMR1p/try8RrADdQIJdYWsyPcjLqN
	ir39R2bhzd25vde3QqvdaaZAjngrPnwfGII43gZRcLOcwqwTAfBSU5d7dSY1u+zCJ7f4wsIefjHk3
	TsKqgJ+rLo0kKdTucBzAkfIcZnXZayoFedgHretU5E7XeThIGRSISM9O+IVVaQLGD961JDmsfnIMx
	stCJub4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZ0T-00000004r69-0nOV;
	Tue, 01 Jul 2025 11:18:33 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYuO-00000004qJy-0OIv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:12:18 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250701111209epoutp039442e5abfdeae029b1df56fcad1695b8~OHDdT6TaG0922409224epoutp03e
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Jul 2025 11:12:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250701111209epoutp039442e5abfdeae029b1df56fcad1695b8~OHDdT6TaG0922409224epoutp03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751368329;
	bh=YTwebVUoQkQpDDdsDBbSlrPKaFDW2GsaHKchVaUCu5k=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=cFsEWnz4p/bZVuWOkULA+mahIAzoo6OZidUhTNxWRxbJaF+y9gxkIs+loiEtNwldd
	 D5y+6OwXCoyM8FYJ6L+S6fZun41YKIz3yfAQs5hhiYX3YeByRJHm3vA/zzxMZL9SWP
	 C/jE1XS81elzOdp01jtlh8gmZvDfZYVL/ys5RiaU=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250701111208epcas5p34bedc890d762054d069694d0ef399bb6~OHDcwX6uq3053630536epcas5p3U;
	Tue,  1 Jul 2025 11:12:08 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.177]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bWgN53tLPz2SSKX; Tue,  1 Jul
	2025 11:12:05 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250701110607epcas5p34c04a301caaf7d8c504eca2fec7f3139~OG_MoTLhB0394403944epcas5p3U;
	Tue,  1 Jul 2025 11:06:07 +0000 (GMT)
Received: from FDSFTE462 (unknown [107.122.81.248]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250701110604epsmtip1b0a6d2e9ac97f7d6e2273144ea9b44df~OG_J9OoCr1403014030epsmtip1E;
	Tue,  1 Jul 2025 11:06:04 +0000 (GMT)
From: "Shradha Todi" <shradha.t@samsung.com>
To: "'Rob Herring'" <robh@kernel.org>
Cc: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-fsd@tesla.com>, <mani@kernel.org>, <lpieralisi@kernel.org>,
	<kw@linux.com>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <arnd@arndb.de>,
	<m.szyprowski@samsung.com>, <jh80.chung@samsung.com>,
	<pankaj.dubey@samsung.com>
In-Reply-To: <20250627211721.GA153863-robh@kernel.org>
Subject: RE: [PATCH v2 07/10] dt-bindings: phy: Add PHY bindings support for
 FSD SoC
Date: Tue, 1 Jul 2025 16:36:03 +0530
Message-ID: <02af01dbea78$24f01310$6ed03930$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFUClgbainc6hQuKSBO0V8ttZVgkwGg1JXJAfs/ltABn1f9rLUC/odg
Content-Language: en-in
X-CMS-MailID: 20250701110607epcas5p34c04a301caaf7d8c504eca2fec7f3139
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250625165319epcas5p3721c19f6e6b482438c62dd1ef784de03
References: <20250625165229.3458-1-shradha.t@samsung.com>
	<CGME20250625165319epcas5p3721c19f6e6b482438c62dd1ef784de03@epcas5p3.samsung.com>
	<20250625165229.3458-8-shradha.t@samsung.com>
	<20250627211721.GA153863-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_041216_770740_556EB503 
X-CRM114-Status: GOOD (  26.55  )
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
> From: Rob Herring <robh@kernel.org>
> Sent: 28 June 2025 02:47
> To: Shradha Todi <shradha.t@samsung.com>
> Cc: linux-pci@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
linux-
> samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-phy@lists.infradead.org; linux-
> fsd@tesla.com; manivannan.sadhasivam@linaro.org; lpieralisi@kernel.org; kw@linux.com;
> bhelgaas@google.com; jingoohan1@gmail.com; krzk+dt@kernel.org; conor+dt@kernel.org;
> alim.akhtar@samsung.com; vkoul@kernel.org; kishon@kernel.org; arnd@arndb.de;
> m.szyprowski@samsung.com; jh80.chung@samsung.com; pankaj.dubey@samsung.com
> Subject: Re: [PATCH v2 07/10] dt-bindings: phy: Add PHY bindings support for FSD SoC
> 
> On Wed, Jun 25, 2025 at 10:22:26PM +0530, Shradha Todi wrote:
> > Document PHY device tree bindings for Tesla FSD SoCs.
> >
> > Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> > ---
> >  .../bindings/phy/samsung,exynos-pcie-phy.yaml | 25 +++++++++++++++++--
> >  1 file changed, 23 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
> b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
> > index 41df8bb08ff7..4dc20156cdde 100644
> > --- a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
> > @@ -15,10 +15,13 @@ properties:
> >      const: 0
> >
> >    compatible:
> > -    const: samsung,exynos5433-pcie-phy
> > +    enum:
> > +      - samsung,exynos5433-pcie-phy
> > +      - tesla,fsd-pcie-phy
> >
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> >
> >    samsung,pmu-syscon:
> >      $ref: /schemas/types.yaml#/definitions/phandle
> > @@ -30,6 +33,24 @@ properties:
> >      description: phandle for FSYS sysreg interface, used to control
> >                   sysreg registers bits for PCIe PHY
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - tesla,fsd-pcie-phy
> > +    then:
> > +      description:
> > +        The PHY controller nodes are represented in the aliases node
> > +        using the following format 'pciephy{n}'. Depending on whether
> > +        n is 0 or 1, the phy init sequence is chosen.
> 
> What? Don't make up your own aliases.
> 
> If the PHY instances are different, then maybe you need a different
> compatible. If this is just selecting the PHY mode, you can do that in
> PHY cells as the mode depends on the consumer.
> 

FSD PCIe has 2 instances of PHY. Both are the same HW Samsung
PHYs (Therefore share the same register offsets). But the PHY used here
does not support auto adaptation so we need to tune the PHYs
according to the use case (considering channel loss, etc). This is why we
have 2 different SW PHY initialization sequence depending on the instance
number. Do you think having different compatible (something like
tesla,fsd-pcie-phy0 and tesla,fsd-pcie-phy1) and having phy ID as platform data
is okay in this case? I actually took reference from files like:
drivers/usb/phy/phy-am335x-control.c
drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
who use alias to differentiate between register offsets for instances.

> 
> > +      properties:
> > +        reg:
> > +          items:
> > +            - description: PHY
> > +            - description: PCS
> 
> else:
>   properties:
>     reg:
>       maxItems: 1
> 

Will update. Thanks for the review!

> > +
> >  required:
> >    - "#phy-cells"
> >    - compatible
> > --
> > 2.49.0
> >


