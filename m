Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05573FD88FB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 05:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h59uLNd2xV76PXDM3+f5UYNA+XidIXY/4r4ME8WXvsk=; b=xQn4qqjrY58q6avV67v1YrpD6k
	wGV61iSS32Z1k2TpFM7Hu9Z73bzmh+RjExGaZd29X29MD7mQbkW3ejY35K59+6NAJKV8FL6pNBQjI
	6HEyLVhoQWQuTc07bACCx4QAcP2LCQNip8hGVua05BeGTITUft4xcn5ajmlVQR9OwS+haQDTm5eyS
	Qs/u+DClQbtFRwLW81Q3Zfs+1onGrU9vaGqlMs3YOrV7hYUlk9tw8X0qSJuRZ5T5EAiNuSxsGWPUh
	7lagN+a9jpR8ey4rinGlTTOFs2Nx+8MCzgYezh9LCMaVzPzj7FfOwOAQWTBHlVMv9Tbg982yWXzTq
	JfOlPKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0BkK-0000000Akll-2DNy;
	Wed, 11 Mar 2026 05:04:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0BkI-0000000AklK-25Ag;
	Wed, 11 Mar 2026 05:04:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C9E1418C1;
	Wed, 11 Mar 2026 05:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB3FC4CEF7;
	Wed, 11 Mar 2026 05:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773205473;
	bh=fYyP3Zu9FaIM29drE15IUXdeAZe+0BRP7elc4vr6eGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqL4eVSceLQkWZy2agF52UXOujfj7w7KrEuOhM4cOGhKUUw59uYN9x/5NytgiLzOR
	 xyWmn0w8TWKhJQe9w/xoJxPfAi391pPUereu4K3uFM6v04Vy0yAg19kdVdcsk+Uybf
	 M2Rb7gOuGWtqzdzH2HbGgZU1OqH3JIw2AyDnYgJBndJ7Du6iRkyELJwQFdExIOU4Ue
	 Sm1dIkfSaGoEcCsDEFhczs0iyNeXbjA2koRhzqOeqDPtcX7Yl6WJiiPLg+Cqqkp7pf
	 tKgqGLem++ya1KScueLxRfgME5XE5rfWQxjtKpmX42uZbg7S1f/VNDZtR75TxwvL13
	 hssZiohpAg36Q==
Date: Wed, 11 Mar 2026 10:34:17 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Niklas Cassel <cassel@kernel.org>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Lukas Wunner <lukas@wunner.de>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Brian Norris <briannorris@chromium.org>, 
	Wilson Ding <dingwei@marvell.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 2/4] PCI: host-common: Add link down handling for Root
 Ports
Message-ID: <vnsmjvtwaeticdxwz6u43dxnpi6duhc3r5motwnfer4l2bpqcm@noeme6lgq4jf>
References: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
 <20260310-pci-port-reset-v7-2-9dd00ccc25ab@oss.qualcomm.com>
 <2eb738fb-9dfe-1e88-6ea7-afdba9cb3d25@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2eb738fb-9dfe-1e88-6ea7-afdba9cb3d25@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_220434_578819_42853EC4 
X-CRM114-Status: GOOD (  40.08  )
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

On Wed, Mar 11, 2026 at 08:55:01AM +0800, Shawn Lin wrote:
> Hi Mani
> 
> 在 2026/03/10 星期二 22:02, Manivannan Sadhasivam via B4 Relay 写道:
> > From: Manivannan Sadhasivam <mani@kernel.org>
> > 
> > The PCI link, when down, needs to be recovered to bring it back. But on
> > some platforms, that cannot be done in a generic way as link recovery
> > procedure is platform specific. So add a new API
> > pci_host_handle_link_down() that could be called by the host bridge drivers
> > for a specific Root Port when the link goes down.
> > 
> > The API accepts the 'pci_dev' corresponding to the Root Port which observed
> > the link down event. If CONFIG_PCIEAER is enabled, the API calls
> > pcie_do_recovery() function with 'pci_channel_io_frozen' as the state. This
> > will result in the execution of the AER Fatal error handling code. Since
> > the link down recovery is pretty much the same as AER Fatal error handling,
> > pcie_do_recovery() helper is reused here. First, the AER error_detected()
> > callback will be triggered for the bridge and then for the downstream
> > devices. Finally, pci_host_reset_root_port() will be called for the Root
> > Port, which will reset the Root Port using 'reset_root_port' callback to
> > recover the link. Once that's done, resume message will be broadcasted to
> > the bridge and the downstream devices, indicating successful link recovery.
> > 
> > But if CONFIG_PCIEAER is not enabled in the kernel, only
> > pci_host_reset_root_port() API will be called, which will in turn call
> > pci_bus_error_reset() to just reset the Root Port as there is no way we
> > could inform the drivers about link recovery.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > Tested-by: Brian Norris <briannorris@chromium.org>
> > Tested-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > Tested-by: Richard Zhu <hongxing.zhu@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >   drivers/pci/controller/pci-host-common.c | 35 ++++++++++++++++++++++++++++++++
> >   drivers/pci/controller/pci-host-common.h |  1 +
> >   drivers/pci/pci.c                        |  1 +
> >   drivers/pci/pcie/err.c                   |  1 +
> >   4 files changed, 38 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> > index d6258c1cffe5..15ebff8a542a 100644
> > --- a/drivers/pci/controller/pci-host-common.c
> > +++ b/drivers/pci/controller/pci-host-common.c
> > @@ -12,9 +12,11 @@
> >   #include <linux/of.h>
> >   #include <linux/of_address.h>
> >   #include <linux/of_pci.h>
> > +#include <linux/pci.h>
> >   #include <linux/pci-ecam.h>
> >   #include <linux/platform_device.h>
> > +#include "../pci.h"
> >   #include "pci-host-common.h"
> >   static void gen_pci_unmap_cfg(void *ptr)
> > @@ -106,5 +108,38 @@ void pci_host_common_remove(struct platform_device *pdev)
> >   }
> >   EXPORT_SYMBOL_GPL(pci_host_common_remove);
> > +static pci_ers_result_t pci_host_reset_root_port(struct pci_dev *dev)
> > +{
> > +	int ret;
> > +
> > +	pci_lock_rescan_remove();
> > +	ret = pci_bus_error_reset(dev);
> > +	pci_unlock_rescan_remove();
> > +	if (ret) {
> > +		pci_err(dev, "Failed to reset Root Port: %d\n", ret);
> > +		return PCI_ERS_RESULT_DISCONNECT;
> > +	}
> > +
> > +	pci_info(dev, "Root Port has been reset\n");
> > +
> > +	return PCI_ERS_RESULT_RECOVERED;
> > +}
> > +
> > +static void pci_host_recover_root_port(struct pci_dev *port)
> > +{
> > +#if IS_ENABLED(CONFIG_PCIEAER)
> > +	pcie_do_recovery(port, pci_channel_io_frozen, pci_host_reset_root_port);
> > +#else
> > +	pci_host_reset_root_port(port);
> 
> Since pci_host_reset_root_port() returns pci_ers_result_t, shouldn't we
> check the result? If the return value is intentionally ignored here,
> maybe pci_host_reset_root_port actually doesn't need a return value at
> all?
> 

The return value is mostly for pcie_do_recovery() which iterates through the
subordinate devices and calls pci_host_reset_root_port(). It also makes use of
the return value, so we cannot make it void.

The reason why I skipped the return value in pci_host_handle_link_down() is
that, we canot do much in the case of failure other than reporting the failure,
which is already taken care in pci_host_reset_root_port().

> > +#endif
> > +}
> > +
> > +void pci_host_handle_link_down(struct pci_dev *port)
> > +{
> > +	pci_info(port, "Recovering Root Port due to Link Down\n");
> > +	pci_host_recover_root_port(port);
> > +}
> > +EXPORT_SYMBOL_GPL(pci_host_handle_link_down);
> 
> This function shouldn't be called like in interrupt context because of
> the pci_lock_rescan_remove() and pci_bus_error_reset()::pci_slot_mutex,
> but it's not so obvious from the API name. It's prone for host drivers
> to use it like:
> 
> register_LDn_irq -> irq isr -> pci_host_handle_link_down()
> 
> So perhaps add a comment about it would be better.
> 

Yes, I agree. I mentioned in the cover letter that this API should be called
from a threaded IRQ handler, but it should be mentioned in the API description
too. I will add it in next version or ammend it while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

