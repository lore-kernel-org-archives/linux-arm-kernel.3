Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6714BCEE35D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 21:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=EqP0Sl6EchVqUraDL9/grQ2IdrVxst4yXQIcFDeceL0=; b=wb0KToOh7e8Ylc
	bpDN9XzFRoyq+lgc7sGlQ2dZC5n0AgzVkHHDY1PPj5O3eptbUPhD7BYRpdSJCW5fhLONtNCvVl7j1
	q3cYdMqyCoJjuUnXfd/ZV3xzZAkOg9RBmzGM50X4m2KlZRwuP6PQOLhTfTE/kl3PyjtwMK6vajLwv
	kL+8xHYk1TZCtqr/XxK2MsWwFRJL/tY6o0V+joXOenRlSciEqKvEz/KFbvqxVFvJ4QxGyY5fbfKLn
	zK1qPVq45mpV/7mD5pB9jk0Z63HwX1v6bX0JjtWsluPuAcfyL7vvNVVMyy9s1bjwE5qrbkyRc93zX
	UWu8tkRpUmlmTVt3afzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTFR-000000017gS-3ttD;
	Tue, 18 Nov 2025 21:28:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTFO-000000017g4-1MJL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 21:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6383040063;
	Tue, 18 Nov 2025 21:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC496C2BC87;
	Tue, 18 Nov 2025 21:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763501301;
	bh=5UEjQXutcY6Htzw86LPN2V7rK8JUwjxX9GTjRfAUJEo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=LDoL0hF8/R17Jb4R4jcR6u6TQFpXCLUtFi+O3i3fssyxyrpALBouquyDvObHRZv3a
	 qDUx5P+X/bg2F5wTT9n6nZ/ZLUrTYhm7EKaUw1WNzJDjIn36viKneXIaeOC+qpNuWc
	 aaz5XkN8nVWfIjpdWPd5Z3KY9tQyx85+YqgFXWhfY2VXigZBp5HeiTJgg6fSlz3alg
	 /DW/8fJInl1jZNTKl1qll/BTss7TmGeRwO0ilxAc7aie/Ask9Y37rfqGdKV5V0WOx+
	 8zQTAY0AVauOIagUcHY30maVJ4hH+z7ZE0niuQbn/vqwErnE8kunm5d+ErIPZd14AH
	 K/LEhMbIKf1mA==
Date: Tue, 18 Nov 2025 15:28:18 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] PCI: stm32: Fix LTSSM EP race with start link.
Message-ID: <20251118212818.GA2591668@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67dbd8f6-2efe-4a73-a611-9081f364d2d4@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_132823_045655_366FC832 
X-CRM114-Status: GOOD (  53.75  )
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

[+cc Lukas in case I got the pciehp part wrong]

On Tue, Nov 18, 2025 at 07:34:01PM +0100, Christian Bruel wrote:
> On 11/17/25 21:00, Bjorn Helgaas wrote:
> > On Mon, Nov 17, 2025 at 01:04:47PM +0100, Christian Bruel wrote:
> > > On 11/14/25 19:59, Bjorn Helgaas wrote:
> > > > On Fri, Nov 14, 2025 at 08:45:52AM +0100, Christian Bruel wrote:
> > > > > If the host has deasserted PERST# and started link training
> > > > > before the link is started on EP side, enabling LTSSM before
> > > > > the endpoint registers are initialized in the perst_irq
> > > > > handler results in probing incorrect values.
> > > > > 
> > > > > Thus, wait for the PERST# level-triggered interrupt to start
> > > > > link training at the end of initialization and cleanup the
> > > > > stm32_pcie_[start stop]_link functions.

To back up here, I'm trying to understand the race.

IIUC the relevant events are link training and register init.  In the
current stm32 EP driver, link training can start when the EP userspace
writes to the 'start' configfs file.  And the register init happens
when stm32_pcie_ep_perst_irq_thread() calls
dw_pcie_ep_init_registers().

So I guess the problem is when the EP userspace enables the LTSSM
before the host deasserts PERST#?  And the link train may complete
before stm32_pcie_ep_perst_irq_thread() runs?

And the fix here is to delay enabling the EP LTSSM until after
stm32_pcie_perst_deassert() calls dw_pcie_ep_init_registers()?

> > > > I've seen this kind of thing in other drivers, and I wondered
> > > > whether it was safe because the host asserts and deasserts
> > > > PERST# asynchronously, independent of anything the endpoint is
> > > > doing.
> > > > 
> > > > I assume it's possible that the host deasserts PERST# before
> > > > this driver has the stm32_pcie_ep_perst_irq_thread() thread
> > > > set up.  If that happens and the driver doesn't see the PERST#
> > > > interrupt, does everything still work correctly?
> > > 
> > > yes it does. the PERST# interrupt is level-triggered and, if
> > > already de-asserted, fires only when enabled (it is NOAUTOEN)
> > > with start_link.
> > > 
> > > At that point, the host can enumerate by performing a manual
> > > rescan or rebind the PCIe driver, restarting the entire probe
> > > sequence.
> > > 
> > > Tested the pcie_epf_test driver with various power-up sequences:
> > > full power-up the host or device first, and stop or standby PM
> > > suspend/resume.
> > 
> > Help me think through this.  I guess the interesting case is when
> > the host boots first and enumerates devices before the stm32
> > endpoint is ready, right?
> > 
> > I suppose the endpoint LTSSM is initially disabled, so the link is
> > down, and the host enumeration didn't find anything?
> 
> yes. When the device is not started (start_link)
> dw_pcie_wait_for_link() fails and pci_host_probe() only register the
> root port:
> 
>         /*
>          * Note: Skip the link up delay only when a Link Up IRQ is present.
>          * If there is no Link Up IRQ, we should not bypass the delay
>          * because that would require users to manually rescan for devices.
>          */
>         if (!pp->use_linkup_irq)
>                 /* Ignore errors, the link may come up later */
>                 dw_pcie_wait_for_link(pci);
> 
>        ret = pci_host_probe(bridge);
> 
> > Where does the link come up?  I see the pci_epc_start_store() that
> > eventually leads to stm32_pcie_start_link(), which enables perst_irq.
> 
> The link appears when explicitly requested by writing '1' into the bound
> endpoint device driver sysfs 'start' once the device is configured.
> 
> see https://www.kernel.org/doc/html/latest/PCI/endpoint/pci-test-howto.html
> 
> But how pci_epc_start_store() is iterated from the configfs_write_iter()
> mechanism is beyond my knowledge...

OK.  I just wanted to learn whether this was all automatic or required
user intervention.

IIUC it's never completely automatic because even if the endpoint
boots first, the endpoint LTSSM isn't enabled and the link won't train
until userspace on the endpoint writes '1' into the 'start' configfs
file.

> > Since you requested perst_irq with IRQF_TRIGGER_HIGH, and PERST#
> > is deasserted, does that trigger stm32_pcie_ep_perst_irq_thread()
> > and call stm32_pcie_perst_deassert() to enable the LTSSM?
> 
> perst_gpio is active low. So requesting the perst_irq with
> IRQF_TRIGGER_HIGH triggers when deasserted.
> 
> This part is quite confusing (for me) because gpiod_get_value()
> correctly returns 0 when the gpio is de-asserted, when the irq API
> does not know about active low so we must use TRIGGER_HIGH
> 
> > When the link comes up, if the Downstream Port supports hotplug
> > and pciehp is enabled, it might notice the link-up event and treat
> > this as a hot-add?
> 
> yes, I just tried with a host pc with hot-plug enabled. lspci found
> the stm32 EP, as you anticipated
> 
> > Otherwise the user would have to manually rescan to notice the
> > endpoint?
> 
> indeed, this is how I proceed when the host does not support
> hot-plug,

I think we would prefer if the host would enumerate the endpoint
whenever the endpoint becomes ready, even if that is after the host's
initial enumeration, but I guess that's only possible if the host is
notified when the link comes up.

The main mechanism for that is hotplug, i.e., pciehp handles presence
detect and link layer state changed events, both of which are managed
by the PCIe Slot register set.  Those registers are optional and may
not be implemented, e.g., if a Root Port is connected to a
system-integrated device.

But if they *are* implemented, I hope that pciehp makes it so no user
intervention on the host side is required.

> > > > > Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> > > > > ---
> > > > >    drivers/pci/controller/dwc/pcie-stm32-ep.c | 38 ++++++------------------------
> > > > >    1 file changed, 7 insertions(+), 31 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > > > > index 3400c7cd2d88a279c49ef36a99fc7537c381c384..d0654bb43759bb8d0f0d7badbf7bdae839241fcf 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > > > > @@ -37,36 +37,9 @@ static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
> > > > >    		dw_pcie_ep_reset_bar(pci, bar);
> > > > >    }
> > > > > -static int stm32_pcie_enable_link(struct dw_pcie *pci)
> > > > > -{
> > > > > -	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> > > > > -
> > > > > -	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> > > > > -			   STM32MP25_PCIECR_LTSSM_EN,
> > > > > -			   STM32MP25_PCIECR_LTSSM_EN);
> > > > > -
> > > > > -	return dw_pcie_wait_for_link(pci);
> > > > > -}
> > > > > -
> > > > > -static void stm32_pcie_disable_link(struct dw_pcie *pci)
> > > > > -{
> > > > > -	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> > > > > -
> > > > > -	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR, STM32MP25_PCIECR_LTSSM_EN, 0);
> > > > > -}
> > > > > -
> > > > >    static int stm32_pcie_start_link(struct dw_pcie *pci)
> > > > >    {
> > > > >    	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> > > > > -	int ret;
> > > > > -
> > > > > -	dev_dbg(pci->dev, "Enable link\n");
> > > > > -
> > > > > -	ret = stm32_pcie_enable_link(pci);
> > > > > -	if (ret) {
> > > > > -		dev_err(pci->dev, "PCIe cannot establish link: %d\n", ret);
> > > > > -		return ret;
> > > > > -	}
> > > > >    	enable_irq(stm32_pcie->perst_irq);
> > > > > @@ -77,11 +50,7 @@ static void stm32_pcie_stop_link(struct dw_pcie *pci)
> > > > >    {
> > > > >    	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> > > > > -	dev_dbg(pci->dev, "Disable link\n");
> > > > > -
> > > > >    	disable_irq(stm32_pcie->perst_irq);
> > > > > -
> > > > > -	stm32_pcie_disable_link(pci);
> > > > >    }
> > > > >    static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > > > @@ -152,6 +121,8 @@ static void stm32_pcie_perst_assert(struct dw_pcie *pci)
> > > > >    	dev_dbg(dev, "PERST asserted by host\n");
> > > > > +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR, STM32MP25_PCIECR_LTSSM_EN, 0);
> > > > > +
> > > > >    	pci_epc_deinit_notify(ep->epc);
> > > > >    	stm32_pcie_disable_resources(stm32_pcie);
> > > > > @@ -192,6 +163,11 @@ static void stm32_pcie_perst_deassert(struct dw_pcie *pci)
> > > > >    	pci_epc_init_notify(ep->epc);
> > > > > +	/* Enable link training */
> > > > > +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> > > > > +			   STM32MP25_PCIECR_LTSSM_EN,
> > > > > +			   STM32MP25_PCIECR_LTSSM_EN);
> > > > > +
> > > > >    	return;
> > > > >    err_disable_resources:
> > > > > 
> > > > > ---
> > > > > base-commit: 31115ecec74fe5c679a149d7037009f26b3aa8a9
> > > > > change-id: 20251113-perst_ep-0b57b9679cf9
> > > > > 
> > > > > Best regards,
> > > > > -- 
> > > > > Christian Bruel <christian.bruel@foss.st.com>
> > > > > 
> > > 
> 

