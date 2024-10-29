Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF777D3A66E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 15:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hnu8v/e4ESPVmYtqBP16EFcx6hEDQoX5gemrthw7OXs=; b=SMHQ14YFOCLFaePhQWKmsb1SN9
	NFwY1zFYwM8bkFvZRxBXglLjwx0W/DyUl6wjnfeSlA3cxJVO3JMrIoopQN/OkaUCGRJi9G388nYRr
	rdCUcdevAkVJEY91hmUuAr/vLgFwqc4Z2Wv6I7vQPLGs0XZfR7IrtKpSXIdIENh9mvDLSKa0iGR0Q
	E1//+6igRxDnoIcV68pGnzC5qzkAbDKCZIQclpRh+wBpf5JVKC2IQpBmDJowaYadSZF5b4ALXLz+3
	18WB0IxD/hsQxLjH3GsC4aYGRo+SSg38FazVvalqoPsTmhG3vxYIZWwSmudj9/RoPwY0qmFq1n8Rw
	RzrD7JYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oZG-0000000F1mt-0rZX;
	Tue, 29 Oct 2024 15:55:38 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oK1-0000000ExJL-0XV5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:39:54 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XdDtR2nVrz6D8YT;
	Tue, 29 Oct 2024 23:38:23 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 078B7140393;
	Tue, 29 Oct 2024 23:39:39 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 29 Oct
 2024 16:39:38 +0100
Date: Tue, 29 Oct 2024 15:39:36 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Will Deacon <will@kernel.org>
CC: Ilkka Koskinen <ilkka@os.amperecomputing.com>, Shuai Xue
	<xueshuai@linux.alibaba.com>, Jing Zhang <renyu.zj@linux.alibaba.com>, "Mark
 Rutland" <mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] perf/dwc_pcie: Load DesignWare PCIe PMU driver
 automatically on Ampere SoCs
Message-ID: <20241029153936.00004d59@Huawei.com>
In-Reply-To: <20241029130014.GC4241@willie-the-truck>
References: <20241008231824.5102-1-ilkka@os.amperecomputing.com>
	<20241008231824.5102-3-ilkka@os.amperecomputing.com>
	<20241024113201.GA30270@willie-the-truck>
	<617bffb7-9dee-6139-53d5-524ba03197f6@os.amperecomputing.com>
	<20241028173132.GC2871@willie-the-truck>
	<722266ba-1572-2c2b-87d6-dc4f8ec9a274@os.amperecomputing.com>
	<20241029130014.GC4241@willie-the-truck>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_083953_462666_95E8412A 
X-CRM114-Status: GOOD (  33.56  )
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

On Tue, 29 Oct 2024 13:00:15 +0000
Will Deacon <will@kernel.org> wrote:

> On Mon, Oct 28, 2024 at 08:27:27PM -0700, Ilkka Koskinen wrote:
> > 
> > On Mon, 28 Oct 2024, Will Deacon wrote:  
> > > On Thu, Oct 24, 2024 at 03:19:17PM -0700, Ilkka Koskinen wrote:  
> > > > 
> > > > Hi Will,
> > > > 
> > > > On Thu, 24 Oct 2024, Will Deacon wrote:  
> > > > > On Tue, Oct 08, 2024 at 11:18:23PM +0000, Ilkka Koskinen wrote:  
> > > > > > Load DesignWare PCIe PMU driver automatically if the system has a PCI
> > > > > > bridge by Ampere.
> > > > > > 
> > > > > > Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> > > > > > ---
> > > > > >  drivers/perf/dwc_pcie_pmu.c | 10 ++++++++++
> > > > > >  1 file changed, 10 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> > > > > > index 3581d916d851..d752168733cf 100644
> > > > > > --- a/drivers/perf/dwc_pcie_pmu.c
> > > > > > +++ b/drivers/perf/dwc_pcie_pmu.c
> > > > > > @@ -782,6 +782,16 @@ static void __exit dwc_pcie_pmu_exit(void)
> > > > > >  module_init(dwc_pcie_pmu_init);
> > > > > >  module_exit(dwc_pcie_pmu_exit);
> > > > > > 
> > > > > > +static const struct pci_device_id dwc_pcie_pmu_table[] = {
> > > > > > +	{
> > > > > > +		PCI_DEVICE(PCI_VENDOR_ID_AMPERE, PCI_ANY_ID),
> > > > > > +		.class		= PCI_CLASS_BRIDGE_PCI_NORMAL,
> > > > > > +		.class_mask	= ~0,
> > > > > > +	},
> > > > > > +	{ }
> > > > > > +};
> > > > > > +MODULE_DEVICE_TABLE(pci, dwc_pcie_pmu_table);  
> > > > > 
> > > > > Hmm, won't this only work if the driver is modular? Should we be calling
> > > > > pci_register_driver() for the builtin case?  
> > > > 
> > > > That would be the normal case indeed. However, this driver is quite
> > > > different: dwc_pcie_pmu_init() goes through all the pci devices looking for
> > > > root ports with the pmu capabilities. Moreover, the probe function isn't
> > > > bound to any specific vendor/class/device IDs. This patch simply makes sure
> > > > the driver is loaded and the init function gets called, if the driver was
> > > > built as module and ran on Ampere system.  
> > > 
> > > Ok, but that seems like the wrong approach, no? We end up with a weird
> > > list of vendors who want the thing to probe on their SoCs and, by
> > > omission, everybody not on the list doesn't want that behaviour.  
> > 
> > Ideally, dwc pmu driver would claim the supported root ports but I think the
> > PCIe driver is doing that. How about if we simply drop the auto loading
> > patch and let users to manually load the driver as they have been doing so
> > far?  

Yup. The PCIe portdrv binds to the port.  Lots of work needed to clean that
up and make it extensible. Maybe we can then kick this PMU driver off from
there once it's done.

Jonathan

> 
> Sure, I'll pick the other two up. Thanks!
> 
> Will
> 


