Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945F8D2AB3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 13:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giiu9SFCSvyfr60JyKIvQEHEGlewrq4d6iIFM2nx8JA=; b=psz1dU6EXe4RIHHCCNmtswR8Ds
	wdZxrAbFoL50QLk3aWI8hUQh10ZcycBLTl/mpTR9PQf8GxVhlfFtApblAN6cYMH5MXWCX8kQ49nAg
	OYUjNDiki1RxQHSf670qwexPk7/w+s0UurNbPcTyTK5aTYGGMcnohfCFrJIi56trQFJLAyk4WXCJs
	D5e8GiGRvait2QZQyP4IgnMTq9rDBUWIqyfFO8qxhiGzzIHwb7Q1iDQkuLEcs9NKlM4c1fdmHk/Dr
	oKjPjCzTIu1BHPNvP/q8cKtpWUuCJpgC7GmVwI1sqtf6Fxd9ZYJGWZo4kjZVIc2NZJNH1O6SuwjJF
	Dn+J+PyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mJr-0000000Ea4w-3uIp;
	Tue, 29 Oct 2024 13:31:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lpc-0000000EUr0-3SVe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 13:00:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 35F865C5D09;
	Tue, 29 Oct 2024 12:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781BBC4CECD;
	Tue, 29 Oct 2024 13:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730206819;
	bh=zLYXpgpMQVfXCNfwLkVW2MPfK+Hfl05kXDqCsCOBpSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=thI+2tDJHryyPY74ABSmzjllb9F6VLelDwhBcGxqZWGzVgbm2Az9z9djtx/2BmtUQ
	 yMc1n+Z3p9wt/c6fzHqpyRboyG0UTZNDqPGHW6bZbkRJAIM27jbGDSrRCLJmuHPmlW
	 Ut5cxWQ5sE6+JIRtJM2Ku40rTyNkqAXW8EtlN/YvomME9+yy/Nro+O9+rhmYTSANbB
	 mgn9QgHaPHlLRGFS7EznP6zDoGQQ7L1erUe3tow1yZoCiOV+/glc4t0471s5NbhAat
	 YeMT8ylr1Mb6u8tDHnsMCPXpTunNzFI9DNqdIpfHirrvtpxdnu7TNz19zdITfhGk9M
	 Qs4kA8ZK7vGrA==
Date: Tue, 29 Oct 2024 13:00:15 +0000
From: Will Deacon <will@kernel.org>
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] perf/dwc_pcie: Load DesignWare PCIe PMU driver
 automatically on Ampere SoCs
Message-ID: <20241029130014.GC4241@willie-the-truck>
References: <20241008231824.5102-1-ilkka@os.amperecomputing.com>
 <20241008231824.5102-3-ilkka@os.amperecomputing.com>
 <20241024113201.GA30270@willie-the-truck>
 <617bffb7-9dee-6139-53d5-524ba03197f6@os.amperecomputing.com>
 <20241028173132.GC2871@willie-the-truck>
 <722266ba-1572-2c2b-87d6-dc4f8ec9a274@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <722266ba-1572-2c2b-87d6-dc4f8ec9a274@os.amperecomputing.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_060021_082150_0B0FCFD2 
X-CRM114-Status: GOOD (  33.39  )
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

On Mon, Oct 28, 2024 at 08:27:27PM -0700, Ilkka Koskinen wrote:
> 
> On Mon, 28 Oct 2024, Will Deacon wrote:
> > On Thu, Oct 24, 2024 at 03:19:17PM -0700, Ilkka Koskinen wrote:
> > > 
> > > Hi Will,
> > > 
> > > On Thu, 24 Oct 2024, Will Deacon wrote:
> > > > On Tue, Oct 08, 2024 at 11:18:23PM +0000, Ilkka Koskinen wrote:
> > > > > Load DesignWare PCIe PMU driver automatically if the system has a PCI
> > > > > bridge by Ampere.
> > > > > 
> > > > > Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> > > > > ---
> > > > >  drivers/perf/dwc_pcie_pmu.c | 10 ++++++++++
> > > > >  1 file changed, 10 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> > > > > index 3581d916d851..d752168733cf 100644
> > > > > --- a/drivers/perf/dwc_pcie_pmu.c
> > > > > +++ b/drivers/perf/dwc_pcie_pmu.c
> > > > > @@ -782,6 +782,16 @@ static void __exit dwc_pcie_pmu_exit(void)
> > > > >  module_init(dwc_pcie_pmu_init);
> > > > >  module_exit(dwc_pcie_pmu_exit);
> > > > > 
> > > > > +static const struct pci_device_id dwc_pcie_pmu_table[] = {
> > > > > +	{
> > > > > +		PCI_DEVICE(PCI_VENDOR_ID_AMPERE, PCI_ANY_ID),
> > > > > +		.class		= PCI_CLASS_BRIDGE_PCI_NORMAL,
> > > > > +		.class_mask	= ~0,
> > > > > +	},
> > > > > +	{ }
> > > > > +};
> > > > > +MODULE_DEVICE_TABLE(pci, dwc_pcie_pmu_table);
> > > > 
> > > > Hmm, won't this only work if the driver is modular? Should we be calling
> > > > pci_register_driver() for the builtin case?
> > > 
> > > That would be the normal case indeed. However, this driver is quite
> > > different: dwc_pcie_pmu_init() goes through all the pci devices looking for
> > > root ports with the pmu capabilities. Moreover, the probe function isn't
> > > bound to any specific vendor/class/device IDs. This patch simply makes sure
> > > the driver is loaded and the init function gets called, if the driver was
> > > built as module and ran on Ampere system.
> > 
> > Ok, but that seems like the wrong approach, no? We end up with a weird
> > list of vendors who want the thing to probe on their SoCs and, by
> > omission, everybody not on the list doesn't want that behaviour.
> 
> Ideally, dwc pmu driver would claim the supported root ports but I think the
> PCIe driver is doing that. How about if we simply drop the auto loading
> patch and let users to manually load the driver as they have been doing so
> far?

Sure, I'll pick the other two up. Thanks!

Will

