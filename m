Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6C3CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1P2Rps+nWLL6vuu8v5AZ6QLluRY8gS5KDMDYoN14d3E=; b=VKB18cPWMvs75cmJIuFK6RQlh4
	pjPQ59GHqzmdo6VQYRtrY1lwftN0SvIMribnkJLxs3S/rf5XKCMeTCCkp3LWNj+J60DarfeK2H/ib
	3rHDv2HaggN5uY7gtVjOfeasUONGTMLOE2Mxwa3GNrw85t9zyPv9C0s3PFKrxlRkNUgeMpcce01nQ
	wa9a1xVaFvzkjxlqFSvjqlf60s2I+kw+4PyTZbmbMXYtxM5NHN198kXoyTt1ISUwt37+uEsb5jhEE
	mS/b/9WSmJHD3lDkih9hU3vH3Tpo6IsRsHeOXGYXzjszLNNNSpUcc4pZ7F+mOy9G7sZ0xNR+Y+EW3
	uMbbjSmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMvx-0000000Ah1J-3Xr9;
	Tue, 19 Aug 2025 14:03:30 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKgs-0000000AJbo-3jLA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:39:49 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250819113941epoutp04c3b4979d2e009f67e2f168ad5caef3f7~dKCfjLdzX1529515295epoutp044
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 11:39:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250819113941epoutp04c3b4979d2e009f67e2f168ad5caef3f7~dKCfjLdzX1529515295epoutp044
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755603581;
	bh=1P2Rps+nWLL6vuu8v5AZ6QLluRY8gS5KDMDYoN14d3E=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ZVvYutnRrj1vsaoIzlGc1d/RjPE60V5uAz1QTRDCZxI81j7cue1sfgSA7oaKZO8YW
	 2qVnzb45IaXeEFXrgbk+ARvR9GiIrmLx90CgXtFOidCb4d1xvFEEGV8mqz30CiOzoN
	 ZcxgykS5DuOVlEM5wzk/ytKYpW7LZdaE9Lb5rgp8=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250819113940epcas5p44becd1ec50dff43ea959114a166fe0dd~dKCeeitQH2997129971epcas5p49;
	Tue, 19 Aug 2025 11:39:40 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c5ngH2cfwz3hhT3; Tue, 19 Aug
	2025 11:39:39 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250819113938epcas5p3cac2467171b234b921448bf9b537cce2~dKCdAIEYh2225622256epcas5p3a;
	Tue, 19 Aug 2025 11:39:38 +0000 (GMT)
Received: from FDSFTE462 (unknown [107.122.81.248]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250819113935epsmtip16d1c515c409672f87d62e0dbcafa0d4d~dKCaJwZgR0293302933epsmtip1n;
	Tue, 19 Aug 2025 11:39:35 +0000 (GMT)
From: "Shradha Todi" <shradha.t@samsung.com>
To: "'Bjorn Helgaas'" <helgaas@kernel.org>, "'Krzysztof Kozlowski'"
	<krzysztof.kozlowski@linaro.org>
Cc: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<mani@kernel.org>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <arnd@arndb.de>,
	<m.szyprowski@samsung.com>, <jh80.chung@samsung.com>,
	<pankaj.dubey@samsung.com>
In-Reply-To: <20250818182544.GA534647@bhelgaas>
Subject: RE: [PATCH v3 11/12] PCI: exynos: Add support for Tesla FSD SoC
Date: Tue, 19 Aug 2025 17:09:34 +0530
Message-ID: <00b501dc10fd$f1fecc10$d5fc6430$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFRpmM4OvQHoLmp1/7yOMMM/WjwMQMTDUGCtWYRPHA=
Content-Language: en-in
X-CMS-MailID: 20250819113938epcas5p3cac2467171b234b921448bf9b537cce2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818182551epcas5p33fbe099df79778031b489f0902cceed3
References: <CGME20250818182551epcas5p33fbe099df79778031b489f0902cceed3@epcas5p3.samsung.com>
	<20250818182544.GA534647@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_043947_630127_AC4ADACC 
X-CRM114-Status: GOOD (  31.06  )
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

> > > > +static irqreturn_t fsd_pcie_irq_handler(int irq, void *arg)
> > > > +{
> > > > +	u32 val;
> > > > +	struct exynos_pcie *ep = arg;
> > > > +	struct dw_pcie *pci = &ep->pci;
> > > > +	struct dw_pcie_rp *pp = &pci->pp;
> > > > +
> > > > +	val = readl(ep->elbi_base + FSD_IRQ2_STS);
> > > > +	if ((val & FSD_IRQ_MSI_ENABLE) == FSD_IRQ_MSI_ENABLE) {
> > > > +		val &= FSD_IRQ_MSI_ENABLE;
> > > > +		writel(val, ep->elbi_base + FSD_IRQ2_STS);
> > >
> > > This looks weird because FSD_IRQ_MSI_ENABLE sounds like an *enable*
> > > bit, but here you're treating it as a *status* bit.
> > >
> > > As far as I can tell, you set FSD_IRQ_MSI_ENABLE once at probe-time in
> > > fsd_pcie_msi_init(), then you clear it here in an IRQ handler, and it
> > > will never be set again.  That seems wrong; am I missing something?
> >
> > Actually the status IRQ and enable IRQ registers are different offsets
> > but the bit position for MSI remains same in both cases so I just reused
> > the macro.
> 
> Ah, that's what I missed, thanks!  At probe-time, fsd_pcie_msi_init()
> enables it in FSD_IRQ2_EN.  Here you clear it in FSD_IRQ2_STS.
> 
> > But I understand that it's confusing so I will add another
> > macro for FSD_IRQ_MSI_STATUS or just rename the macro to
> > FSD_IRQ_MSI to re-use.
> 
> Using the same name just because a similar bit happens to be at the
> same position in two different registers is definitely confusing.  I
> think it will be better to have two macros, one for FSD_IRQ2_STS and
> another for FSD_IRQ2_EN, e.g.,
> 
>   #define FSD_IRQ2_STS                         0x008
>   #define   FSD_IRQ2_STS_MSI                   BIT(17)
>   #define FSD_IRQ2_EN                          0x018
>   #define   FSD_IRQ2_EN_MSI                    BIT(17)
> 
> Another question about the test:
> 
>   if ((val & FSD_IRQ_MSI_ENABLE) == FSD_IRQ_MSI_ENABLE) {
> 
> This assumes there are no other bits in FSD_IRQ2_STS that could be
> set.  I would have expected a test like this:
> 
>   if (val & FSD_IRQ_MSI_ENABLE) {
> 

Thanks for pointing this out. FSD_IRQ_MSI_ENABLE is a single-bit, so there
is no functional difference in the two statements. I didn't have a specific
reason for using "== FSD_IRQ_MSI_ENABLE".
But I see that "val & FSD_IRQ_MSI_ENABLE" would have been the more
standard way to write this. I will update this for clarity.

> Is there a reason to restrict it to the case when *only*
> FSD_IRQ_MSI_ENABLE is set?
> 
> Bjorn


