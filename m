Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF70D339A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8sz6wh0OIVIkejtPgz8KKAxbt53GPgPAdNVSqgtC44=; b=SC8Rjq9U6NcPAOCFBn50sliD0q
	vnku2h7CGnX5y18is+uvzVVIFDG0xV05B7m1Fhfo0yJyOFD0T0dtuEFg1Hnb/f6BvBH1qyBw5CE/8
	aFR+kc8vGAvMKxR0nzn7DpcvzALjxDEmAG1f2wIIimrjK8sg7qS1dRjHECbdq6YepMcCAXFCWHmbT
	zAEaBaleri5vVS5fFMyriJWKpYTMMGxIwWxIFGEbbuPsljefcSQUBiMYBd3lita9sTjGoA35S4+62
	4UNOdDFWV7KX6XmWV3ipyBsAZr/en9OGo4bpoJVkTZsgmXKoHRyGqI2p9NS7ePWAHhEq6h4HFZoYu
	b79kenkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TcM-0000000BfGy-1fbs;
	Mon, 28 Oct 2024 17:33:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Tad-0000000Bf0P-48WT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:31:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2A814A42A0E;
	Mon, 28 Oct 2024 17:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B73BC4CEC3;
	Mon, 28 Oct 2024 17:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730136698;
	bh=rfxuY3krSdeJD90i0XiLhAYyM3TlscAhrdX2CtNW5MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pgIYAjasd25IPDv/s+zTfTP1EaLE2Qh/RBgGP3qf6/4CbqnQhf4Qa0XOVqqI3HVoF
	 UcJVGXk/l7Wopyg3wUarOugqabCgF1EtqRVdOSqO1K5HdqhYjDq55U/Z89ptaQGBO6
	 HrYclKKJ47pqSHBqTBU8MlkTuqRtsqLtNFOPwOkjXXt/xAIG20rh1wTu9NKcvh83Qk
	 xGsYdZBBaKvPmt1fbONqNedP43EzsaA4xvdEHk5qzw+f+Gqe3Re5XketKexZpRNBoy
	 rWGmaEWscGfqZUpgVfXMZp6WfsrSaK7mj+xPdIv8j1IV98qOtKaa9ZGtBeq7F5g0cg
	 5eNsJgFXcIwWQ==
Date: Mon, 28 Oct 2024 17:31:34 +0000
From: Will Deacon <will@kernel.org>
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] perf/dwc_pcie: Load DesignWare PCIe PMU driver
 automatically on Ampere SoCs
Message-ID: <20241028173132.GC2871@willie-the-truck>
References: <20241008231824.5102-1-ilkka@os.amperecomputing.com>
 <20241008231824.5102-3-ilkka@os.amperecomputing.com>
 <20241024113201.GA30270@willie-the-truck>
 <617bffb7-9dee-6139-53d5-524ba03197f6@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <617bffb7-9dee-6139-53d5-524ba03197f6@os.amperecomputing.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_103140_106947_BA529F0E 
X-CRM114-Status: GOOD (  24.59  )
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

On Thu, Oct 24, 2024 at 03:19:17PM -0700, Ilkka Koskinen wrote:
> 
> Hi Will,
> 
> On Thu, 24 Oct 2024, Will Deacon wrote:
> > On Tue, Oct 08, 2024 at 11:18:23PM +0000, Ilkka Koskinen wrote:
> > > Load DesignWare PCIe PMU driver automatically if the system has a PCI
> > > bridge by Ampere.
> > > 
> > > Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> > > ---
> > >  drivers/perf/dwc_pcie_pmu.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> > > index 3581d916d851..d752168733cf 100644
> > > --- a/drivers/perf/dwc_pcie_pmu.c
> > > +++ b/drivers/perf/dwc_pcie_pmu.c
> > > @@ -782,6 +782,16 @@ static void __exit dwc_pcie_pmu_exit(void)
> > >  module_init(dwc_pcie_pmu_init);
> > >  module_exit(dwc_pcie_pmu_exit);
> > > 
> > > +static const struct pci_device_id dwc_pcie_pmu_table[] = {
> > > +	{
> > > +		PCI_DEVICE(PCI_VENDOR_ID_AMPERE, PCI_ANY_ID),
> > > +		.class		= PCI_CLASS_BRIDGE_PCI_NORMAL,
> > > +		.class_mask	= ~0,
> > > +	},
> > > +	{ }
> > > +};
> > > +MODULE_DEVICE_TABLE(pci, dwc_pcie_pmu_table);
> > 
> > Hmm, won't this only work if the driver is modular? Should we be calling
> > pci_register_driver() for the builtin case?
> 
> That would be the normal case indeed. However, this driver is quite
> different: dwc_pcie_pmu_init() goes through all the pci devices looking for
> root ports with the pmu capabilities. Moreover, the probe function isn't
> bound to any specific vendor/class/device IDs. This patch simply makes sure
> the driver is loaded and the init function gets called, if the driver was
> built as module and ran on Ampere system.

Ok, but that seems like the wrong approach, no? We end up with a weird
list of vendors who want the thing to probe on their SoCs and, by
omission, everybody not on the list doesn't want that behaviour.

Will

