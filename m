Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D478CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 22:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=auzU48UECky/VhRsM1MIzHXMTSQQH38DGJK40Vy8La0=; b=RBkoTZP2EZ20cg
	BAbPEjW8kDxZq85MwuPVmFQeXcqEvZi7is5tJ5RPlHI0MDYV62U7qsEcf9GaO9HYiBE6TFOlnVRLF
	xQtXGQniE1T/Z46VVffna+1ajYZyB3ZBUCEplfaE+w28CFiSJmBh1kxjgZSOC1ri6UscW+DY2EEEV
	iPMwpak3cX0pgP42IW+oehuRQIAOOF0SnFTo2H7QrcL2iHty/3GHg0rjHxg8kW//z+me/DdAdLPxr
	cRfhCSs6xCajOZlhr2uTaFvXa9PWMEkiVPGhP15WM/ADiH0ggyiQRYDsfBg0R+50W7PrdgnxX1aY5
	qOvYet6VqqNlS0xDZnZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYfU-0000000C8sU-1O4t;
	Fri, 22 May 2026 22:48:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYfS-0000000C8sA-3Zdz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 22:48:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id EEE8460200;
	Fri, 22 May 2026 22:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6A79C1F000E9;
	Fri, 22 May 2026 22:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779490113;
	bh=auzU48UECky/VhRsM1MIzHXMTSQQH38DGJK40Vy8La0=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=mFliS7Ix7rqBthGHQaF5M6htxgc+ybi5mKkI/jhjzhUv2DB/LWOcg2o99/pXiq2JP
	 522K3vZgppPOjIvvVDd7X2qj92uktNh04gvil8HJShJhNXcYTTsjX41nHrC3MrsD4N
	 JTbVZNiNPrcpriJPnNj3yAnsWub1NN7yrjo4bdscyuml/hq44OHbEGVgW0mIVZp7+e
	 tGdjWpvbioHmtbi5bRBANmyCwDDKfG5SWtic2myOgYBWY9aFEwwh2eom1ZWNcd2QEp
	 wtlQkO7ok5K8k3vX6Ha/0yookF/2FebClHYQjXvKPXEd7IATRMXQz/upkUL/luodgb
	 oUfjgYeuTLg0Q==
Date: Fri, 22 May 2026 17:48:32 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com,
	bjorn.andersson@oss.qualcomm.com, Frank Li <Frank.Li@nxp.com>,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 4/5] PCI: dwc: Use common D3cold eligibility helper in
 suspend path
Message-ID: <20260522224832.GA120697@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520000153.GA14400@bhelgaas>
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

On Tue, May 19, 2026 at 07:01:53PM -0500, Bjorn Helgaas wrote:
> [+cc Frank, linux-pm]
> 
> On Wed, Apr 29, 2026 at 12:12:26PM +0530, Krishna Chaitanya Chundru wrote:
> > Previously, the driver skipped putting the link into L2/device state in
> > D3cold whenever L1 ASPM was enabled, since some devices (e.g. NVMe) expect
> > low resume latency and may not tolerate deeper power states.
> 
> I think "some devices expect low resume latency and may not tolerate
> deeper power states" conveys the wrong message.  It's not that NVMe
> has a mysterious acceptable resume latency number that we have to meet
> or that NVMe has some inherent aversion to D3cold or L1SS or whatever
> "deeper power states" refers to.
> 
> It could be that ASPM L1 was configured incorrectly (e.g., an L1->L0
> transition didn't happen within the advertised exit latency, leading
> to some device access failure) or a device lost internal context when
> the driver didn't expect it (e.g., the Qcom problem where L1SS exit
> takes too long and results in a link-down and device reset [1]).
> 
> It sounds to me like the ASPM L1 check was a way to avoid problems
> like that, but I don't think we ever really had a root cause.

Possible updated commit log text:

  Previously, the driver skipped putting the link into L2 and device
  state in D3cold when L1 ASPM was enabled since some devices (e.g.
  NVMe) failed to resume correctly if they were suspended with L1
  enabled. The root cause of the failure is unknown.

> [1] https://lore.kernel.org/linux-pci/20260519-l1ss-fix-v2-0-b2c3a4bdeb15@oss.qualcomm.com/
> 
> > However, such devices typically remain in D0 and are already covered
> > by the new helper's requirement that all endpoints be in D3hot
> > before the devices under host bridge may enter D3cold.

It makes me nervous when we assume "typical" things, but I don't have
any ideas about wording this.

This is all merged and in pci/next, so we can leave it as-is or amend
the commit log if anybody has better ideas.

> If we put the host bridge in D3cold, I assume the hierarchy below is
> either put in D3cold as well, or at least every device in the
> hierarchy will be reset as a consequence of the Root Port link going
> down.
> 
> If the driver doesn't manage the device power state itself, I assume
> we have the freedom to put the hierarchy in D3cold or reset it.
> 
> Do we have the same freedom if the driver *does* manage the power
> state itself?  What if the driver put the device in D3hot, expecting
> it to *stay* in D3hot?
> 
> I think pci_host_common_d3cold_possible() will see the device in D3hot
> and decide that D3cold is possible.
> 
> (I'm looking at https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/power/pci.rst?id=v7.0#n746)
> 
> > So, replace the local L1/L1SS-based check in dw_pcie_suspend_noirq() with
> > the shared pci_host_common_d3cold_possible() helper to decide whether the
> > devices under host bridge can safely transition to D3cold.
> > 
> > In addition, propagate PME-from-D3cold capability information from the
> > helper and record it in skip_pwrctrl_off. Some devices (e.g. M.2 cards
> > without auxiliary power) may lose PME detection when main power is
> > removed, even if they advertise PME-from-D3cold support. This allows
> > controller power-off to be skipped when required to preserve wakeup
> > functionality.
> > 
> > Update the suspended flag in dw_pcie_resume_noirq() only after the PCIe
> > link resumes successfully, to avoid marking the controller active when
> > link resume fails.
> > 
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware-host.c | 15 +++++++--------
> >  drivers/pci/controller/dwc/pcie-designware.h      |  1 +
> >  2 files changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > index c9517a348836..9e409a1909e6 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > @@ -16,9 +16,11 @@
> >  #include <linux/msi.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_pci.h>
> > +#include <linux/pci.h>
> >  #include <linux/pci_regs.h>
> >  #include <linux/platform_device.h>
> >  
> > +#include "../pci-host-common.h"
> >  #include "../../pci.h"
> >  #include "pcie-designware.h"
> >  
> > @@ -1218,18 +1220,14 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
> >  
> >  int dw_pcie_suspend_noirq(struct dw_pcie *pci)
> >  {
> > -	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> > +	bool pme_capable = false;
> >  	int ret = 0;
> >  	u32 val;
> >  
> >  	if (!dw_pcie_link_up(pci))
> >  		goto stop_link;
> >  
> > -	/*
> > -	 * If L1SS is supported, then do not put the link into L2 as some
> > -	 * devices such as NVMe expect low resume latency.
> > -	 */
> > -	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
> > +	if (!pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable))
> >  		return 0;
> >  
> >  	if (pci->pp.ops->pme_turn_off) {
> > @@ -1273,6 +1271,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
> >  	udelay(1);
> >  
> >  stop_link:
> > +	pci->pp.skip_pwrctrl_off = pme_capable;
> >  	dw_pcie_stop_link(pci);
> >  	if (pci->pp.ops->deinit)
> >  		pci->pp.ops->deinit(&pci->pp);
> > @@ -1290,8 +1289,6 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
> >  	if (!pci->suspended)
> >  		return 0;
> >  
> > -	pci->suspended = false;
> > -
> >  	if (pci->pp.ops->init) {
> >  		ret = pci->pp.ops->init(&pci->pp);
> >  		if (ret) {
> > @@ -1313,6 +1310,8 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
> >  	if (pci->pp.ops->post_init)
> >  		pci->pp.ops->post_init(&pci->pp);
> >  
> > +	pci->suspended = false;
> > +
> >  	return 0;
> >  
> >  err_stop_link:
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > index 3e69ef60165b..e759c5c7257e 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > @@ -450,6 +450,7 @@ struct dw_pcie_rp {
> >  	bool			ecam_enabled;
> >  	bool			native_ecam;
> >  	bool                    skip_l23_ready;
> > +	bool			skip_pwrctrl_off;
> >  };
> >  
> >  struct dw_pcie_ep_ops {
> > 
> > -- 
> > 2.34.1
> > 

