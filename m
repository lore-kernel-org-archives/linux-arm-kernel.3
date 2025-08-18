Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C39CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 19:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RP2yA5MEhaqxhoH+gVDmsv00FKB2mOwlfQHcTXbYEOE=; b=E/xPONiABS3taJXRWnXEDo83CU
	58ouszlAmfYWBGqNOt9m0E2QZzbI/s2iR9uzru+d9Aei3sFcmk2/+ecX/2xeC4CjbnSjTFc0r64Fv
	bsXivAFnN3P/oGH88NL4Z8gZwrSIsYDNxXWrATQtg2HHk/2VTVEVHCta23hkMV40po9Fx77Y6BY+5
	FF/E5BJSf/7Aee8Qr0GwZJEwwr1Ojda0ZrpfUpTOxgjy1UQtPlzrdR96PVD+ofJ+hZhQ+nV85WO0D
	wgYS9Tc9H6U8GAbNvDgDc9s98+n+9xu57xieUkj3NC1UOSuKRUYeyz0wxKGB2Miton29U14VbakSB
	2HyeYxeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5NK-00000008UiP-3y98;
	Mon, 18 Aug 2025 19:18:36 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3Vv-000000087GM-0IuC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 17:19:20 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250818171916epoutp04838acbea87cab4645e4eaa33902fae5b~c7BtDz-Vh0905109051epoutp04F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 17:19:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250818171916epoutp04838acbea87cab4645e4eaa33902fae5b~c7BtDz-Vh0905109051epoutp04F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755537556;
	bh=RP2yA5MEhaqxhoH+gVDmsv00FKB2mOwlfQHcTXbYEOE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=TGnmXPWwB5xXV9w1wRLWryg35S4Xw2TeqlANsWJUrT6M/NLqnOEFlb2BCMSPIKQSs
	 gWUHGswOGwzpX81YAyrEcQXOtfd4zr+asG7jDVuIhR2qdajhH2EtW4cW31D5oP0IXt
	 KaKuOYCtEoS1sOhVKN4ihMhNAeiJks79pdclQrrg=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250818171915epcas5p3fda06f50b251c0e3ea18d58c37f0d1af~c7BsVktPW0774307743epcas5p3t;
	Mon, 18 Aug 2025 17:19:15 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c5KFZ6Nmgz3hhT3; Mon, 18 Aug
	2025 17:19:14 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250818093004epcas5p4c46fe2d6fc7c91374cf77db02bf234cb~c0oCDGq7H2540125401epcas5p49;
	Mon, 18 Aug 2025 09:30:04 +0000 (GMT)
Received: from FDSFTE462 (unknown [107.122.81.248]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250818093001epsmtip194aa4c1a2b5b3c72a857795443a3da04~c0n-VJYuJ2375823758epsmtip1C;
	Mon, 18 Aug 2025 09:30:01 +0000 (GMT)
From: "Shradha Todi" <shradha.t@samsung.com>
To: "'Bjorn Helgaas'" <helgaas@kernel.org>
Cc: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<mani@kernel.org>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <arnd@arndb.de>,
	<m.szyprowski@samsung.com>, <jh80.chung@samsung.com>,
	<pankaj.dubey@samsung.com>
In-Reply-To: <20250813230744.GA299971@bhelgaas>
Subject: RE: [PATCH v3 11/12] PCI: exynos: Add support for Tesla FSD SoC
Date: Mon, 18 Aug 2025 15:00:00 +0530
Message-ID: <000d01dc1022$ad8c0740$08a415c0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHOko1UmKBgSR8l8U+0sy0UMlp1MAHKE5YvtHTNStA=
Content-Language: en-in
X-CMS-MailID: 20250818093004epcas5p4c46fe2d6fc7c91374cf77db02bf234cb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250813230750epcas5p2101d8bb07332cde1beabe70ca6227aca
References: <CGME20250813230750epcas5p2101d8bb07332cde1beabe70ca6227aca@epcas5p2.samsung.com>
	<20250813230744.GA299971@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_101919_420884_3501A4C1 
X-CRM114-Status: GOOD (  39.23  )
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

> On Mon, Aug 11, 2025 at 09:16:37PM +0530, Shradha Todi wrote:
> > Add host and endpoint controller driver support for FSD SoC.
> 
> I think this might be easier if you added host mode first, then added
> endpoint mode with a separate patch.
> 

Will do.

> It's kind of unfortunate that the driver uses "ep" everywhere for
> struct exynos_pcie pointers.  It's going to be confusing because "ep"
> is also commonly used for endpoint-related things, e.g., struct
> dw_pcie_ep pointers.  Maybe it's not worth changing; I dunno.
> 

I did try to rename the structure and the pointers 
(https://lore.kernel.org/all/20230214121333.1837-9-shradha.t@samsung.com/)
But the intention was different back then and so the idea was rejected.
I could add a patch to only rename the pointers to something less
confusing like "exy_pci"

> > +static irqreturn_t fsd_pcie_irq_handler(int irq, void *arg)
> > +{
> > +	u32 val;
> > +	struct exynos_pcie *ep = arg;
> > +	struct dw_pcie *pci = &ep->pci;
> > +	struct dw_pcie_rp *pp = &pci->pp;
> > +
> > +	val = readl(ep->elbi_base + FSD_IRQ2_STS);
> > +	if ((val & FSD_IRQ_MSI_ENABLE) == FSD_IRQ_MSI_ENABLE) {
> > +		val &= FSD_IRQ_MSI_ENABLE;
> > +		writel(val, ep->elbi_base + FSD_IRQ2_STS);
> 
> This looks weird because FSD_IRQ_MSI_ENABLE sounds like an *enable*
> bit, but here you're treating it as a *status* bit.
> 
> As far as I can tell, you set FSD_IRQ_MSI_ENABLE once at probe-time in
> fsd_pcie_msi_init(), then you clear it here in an IRQ handler, and it
> will never be set again.  That seems wrong; am I missing something?
> 

Actually the status IRQ and enable IRQ registers are different offsets
but the bit position for MSI remains same in both cases so I just reused
the macro. But I understand that it's confusing so I will add another
macro for FSD_IRQ_MSI_STATUS or just rename the macro to
FSD_IRQ_MSI to re-use.

> > +		dw_handle_msi_irq(pp);
> > +	}
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static void fsd_pcie_msi_init(struct exynos_pcie *ep)
> > +{
> > +	int val;
> > +
> > +	val = readl(ep->elbi_base + FSD_IRQ2_EN);
> > +	val |= FSD_IRQ_MSI_ENABLE;
> > +	writel(val, ep->elbi_base + FSD_IRQ2_EN);
> > +}
> > +
> > +static void __iomem *fsd_atu_setting(struct dw_pcie *pci, void __iomem *base)
> 
> The "setting" name suggests that this merely returns an address
> without side effects, but in fact it actively *sets* the view.
> 
> In this case there's no locking around:
> 
>   addr = fsd_atu_setting(pci, base);
>   dw_pcie_read(addr + reg, size, &val);
> 
> even though concurrent calls would cause issues, but I think that's OK
> because we only get there via the driver, and I assume multiple DBI or
> DBI2 accesses never happen because they're not used in asynchronous
> paths like interrupt handlers.
> 

Yes, there is no concurrent access to this function and hence I have
not added locking mechanism.

> But I think a name that hints at the fact that this does have side
> effects would be helpful as a reminder in the callers that they must
> not be used concurrently.
> 

Sure, I will change the name and also add comment as a reminder.

> > +static const struct pci_epc_features fsd_pcie_epc_features = {
> > +	.linkup_notifier = false,
> > +	.msi_capable = true,
> > +	.msix_capable = false,
> 
> I think we should omit features we do *not* support instead of calling
> them out explicitly, e.g., we don't need .linkup_notifier or
> .msix_capable.
> 
> We've added them in the past, but they're unnecessary and they lead to
> either pervasive changes (adding ".new_feature = false" to all
> existing drivers when adding the feature) or inconsistency (new
> drivers include ".new_feature = false" but existing drivers do not).
> 

Will remove

> > +	if (ep->pdata->soc_variant == FSD) {
> > +		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(36));
> > +		if (ret)
> > +			return ret;
> > +
> > +		ep->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
> > +				"samsung,syscon-pcie");
> > +		if (IS_ERR(ep->sysreg)) {
> > +			dev_err(dev, "sysreg regmap lookup failed.\n");
> > +			return PTR_ERR(ep->sysreg);
> > +		}
> > +
> > +		ret = of_property_read_u32_index(dev->of_node, "samsung,syscon-pcie", 1,
> > +						 &ep->sysreg_offset);
> > +		if (ret) {
> > +			dev_err(dev, "couldn't get the register offset for syscon!\n");
> > +			return ret;
> > +		}
> > +	}
> 
> This is a good example of a complicated set of things where I think
> you should either add a SoC-specific function pointer to do this or
> test a property, e.g., "DMA width", instead of testing for a specific
> SoC.
> 

Got your point and it makes sense. In future, other drivers could also
want to set DMA width, etc. Will make properties to replace soc_variant:
 - DMA_width
 - has_syscon
 - function pointer to assert_core_reset and deassert_core_reset

Any suggestions or is this approach okay?

-Shradha


