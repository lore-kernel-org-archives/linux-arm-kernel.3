Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56B7C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 10:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOJRXhgr4IvDYXXr3sLTtCmEn5aq6QJfPwnK5S28w5g=; b=LvBECRmrgYby+qLsyBjWfDQ6cI
	lovhMeoKXC74mxIQSQ3BJecPCKXRvPRdOTheL8Z3SJRvcafQwahpCrLPxfcJrMgNp3q1ETl/iXS/X
	AJh49ksR3CtbcAPcoofkp2pcsOFkHtEoOsa3revsJLocMG14nNXfetrNDOupVdycH38WbTzLXuaMW
	hYVMoRx+1xs9NVDvXPNlFdohAZ+zfqK0ZDwQU6SCtDIcnNmCWm1pAdkN1i1LizjrtUCtFrDJpspAy
	GcAwhcI5ppdLrHXDahcxl8aFEMih25Y1TioM9TyDF2UwUwFtzxlvT2U9/KC5oq+nq400FiRQ8YkYk
	y23JRvHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqri-00000008grd-0Zkl;
	Wed, 19 Mar 2025 10:41:38 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqoA-00000008gWF-0FHH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 10:37:59 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52JAbbc6298165
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Mar 2025 05:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742380657;
	bh=VOJRXhgr4IvDYXXr3sLTtCmEn5aq6QJfPwnK5S28w5g=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=THaB1MxklKFszLt4uo+Kcwpd94AavvnNOGhhcEhJYjf7HeEli37mE7XGxcIM5PddP
	 PhqRLc2PVxBzS/ZtsWybKw5gTZeqC9S9AG3jFOls1SupDnC8/fbBO0qmkOrGa00zwu
	 kGzn+Z1n82sVRFvkRcapG88nFiMezHT3q0am6Mzs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52JAbb5l088419
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Mar 2025 05:37:37 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Mar 2025 05:37:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Mar 2025 05:37:36 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JAbZv4021781;
	Wed, 19 Mar 2025 05:37:36 -0500
Date: Wed, 19 Mar 2025 16:07:35 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <lpieralisi@kernel.org>,
        <kw@linux.com>, <robh@kernel.org>, <bhelgaas@google.com>,
        <vigneshr@ti.com>, <kishon@kernel.org>, <cassel@kernel.org>,
        <wojciech.jasko-EXT@continental-corporation.com>,
        <thomas.richard@bootlin.com>, <bwawrzyn@cisco.com>,
        <linux-pci@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 3/4] PCI: cadence-ep: Introduce cdns_pcie_ep_disable
 helper for cleanup
Message-ID: <20250319103735.a45aa5trofo2c2fc@uda0492258>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <20250307103128.3287497-4-s-vadapalli@ti.com>
 <20250318080304.jsmrxqil6pn74nzh@thinkpad>
 <20250318081239.rvbk3rqud7wcj5pj@uda0492258>
 <20250319103217.aaoxpzk2baqna5vc@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250319103217.aaoxpzk2baqna5vc@thinkpad>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_033758_274646_C6F4A550 
X-CRM114-Status: GOOD (  32.05  )
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

On Wed, Mar 19, 2025 at 04:02:17PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Mar 18, 2025 at 01:42:39PM +0530, Siddharth Vadapalli wrote:
> > On Tue, Mar 18, 2025 at 01:33:04PM +0530, Manivannan Sadhasivam wrote:
> > 
> > Hello Mani,
> > 
> > > On Fri, Mar 07, 2025 at 04:01:27PM +0530, Siddharth Vadapalli wrote:
> > > > Introduce the helper function cdns_pcie_ep_disable() which will undo the
> > > > configuration performed by cdns_pcie_ep_setup(). Also, export it for use
> > > > by the existing callers of cdns_pcie_ep_setup(), thereby allowing them
> > > > to cleanup on their exit path.
> > > > 
> > > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > > ---
> > > >  drivers/pci/controller/cadence/pcie-cadence-ep.c | 10 ++++++++++
> > > >  drivers/pci/controller/cadence/pcie-cadence.h    |  5 +++++
> > > >  2 files changed, 15 insertions(+)
> > > > 
> > > > diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> > > > index eeb2afdd223e..85bec57fa5d9 100644
> > > > --- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
> > > > +++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> > > > @@ -646,6 +646,16 @@ static const struct pci_epc_ops cdns_pcie_epc_ops = {
> > > >  	.get_features	= cdns_pcie_ep_get_features,
> > > >  };
> > > >  
> > > > +void cdns_pcie_ep_disable(struct cdns_pcie_ep *ep)
> > > > +{
> > > > +	struct device *dev = ep->pcie.dev;
> > > > +	struct pci_epc *epc = to_pci_epc(dev);
> > > > +
> > > 
> > > pci_epc_deinit_notify()
> > 
> > I had initially planned to add this, but I noticed that it is not
> > invoked by dw_pcie_ep_deinit() within
> > drivers/pci/controller/dwc/pcie-designware-ep.c
> > Since cdns_pcie_ep_disable() is similar to dw_pcie_ep_deinit(), I
> > decided to drop it. Current callers of pci_epc_deinit_notify() are:
> > drivers/pci/controller/dwc/pcie-qcom-ep.c
> > drivers/pci/controller/dwc/pcie-tegra194.c
> > while there are many more users of dw_pcie_ep_deinit() that don't invoke
> > pci_epc_deinit_notify().
> > 
> > While I don't intend to justify dropping pci_epc_deinit_notify() in the
> > cleanup path, I wanted to check if this should be added to
> > dw_pcie_ep_deinit() as well. Or is it the case that dw_pcie_ep_deinit()
> > is different from cdns_pcie_ep_disable()? Please let me know.
> > 
> 
> Reason why it was not added to dw_pcie_ep_deinit() because, deinit_notify() is
> supposed to be called while performing the resource cleanup with active refclk.
> 
> Some plaforms (Tegra, Qcom) depend on refclk from host. So if deinit_notify() is
> called when there is no refclk, it will crash the endpoint SoC. But since
> cadence endpoint platforms seem to generate their own refclk, you can call
> deinit_notify() during deinit phase.

Thank you for the clarification. I will add pci_epc_deinit_notify() to
cdns_pcie_ep_disable() in the v2 series.

Regards,
Siddharth.

