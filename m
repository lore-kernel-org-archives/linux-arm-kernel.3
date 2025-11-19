Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0653CF34D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RAOtWn7ptuSPVcNdXCigpxlXPzR1goQ9GTAMc0V4tvw=; b=OstzbksXVUvp9nCmRTP2sEwEgr
	GAMzUHH2NEOP+5QiQh6JW7NUO1XcIwcxPu2xiTKq+zbaFNA84mEwxd99KpW5KR3ZtQ9zo8HMQ+13B
	CBj2GbtiBAfPtjOAuE+SaqbNftGAesM3B5wXIYTdMpu5V+UudcO4OwEIQ0l+nthzOXy0vFChMxnF3
	4Ctc+GBRDHnO6MqN05ZD094L3h5zBZfeVTJkCTP+CUhxtYjp5dQg6qBNC/GQajZwjy3Psw7W16VzK
	WBlCQwN7ebN6Ma+gIqrlBJoTZq5RsKnLEz5IWqp9tpmJE2aUoogqUHAa8twf98wbR1v80LMzs2mIF
	qBARPTsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkP9-00000003YLe-3t2b;
	Wed, 19 Nov 2025 15:47:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkP7-00000003YKJ-3YZ7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:47:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D376360172;
	Wed, 19 Nov 2025 15:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B901DC4AF4D;
	Wed, 19 Nov 2025 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763567252;
	bh=vicgZe2Av/U4KqK6bau+u9mHI2W4ZvV0ci7Vd1xAaJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/iaFsAPw27Vo7KL+xOhpzChl9HwgPS91l9ZE9SkAkJCY2UaBQjQUzZhvNSIU0aTR
	 mjUaPeN+1DpNB9Eu/vA1eUJYgT/Pfoz+V8332karyPbvh9E4dsexBeWKPFw55pyc5w
	 HOGrzUy9f5ifz0axsOzC6LhDxNWcDYaObz3ObyauHXxPC+VgMvQ70Q1eU9tbDf32hH
	 WGrz9JsHF69HhZs+dekb6hrSb9slrHLfcIHBv4S1HO+h5iw9cAoF4bPD8b5OP2vbtO
	 SRL79BsrKKpcZJXfElkS5n7zaxeL8O3UTaUS7UCPqvj9+IRbu++GiYLfOBTOWVIqKP
	 yj4TrAxEVZH9Q==
Date: Wed, 19 Nov 2025 21:17:18 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] PCI: stm32: Fix LTSSM EP race with start link.
Message-ID: <k72rxq2j5hbpotgmshwau6tvvem3jnldahxxgg54qoxjs7jaxb@bgh4cgs5j25h>
References: <20251118212818.GA2591668@bhelgaas>
 <7053f336-59c9-47cc-ac97-eb2f0916ac4f@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7053f336-59c9-47cc-ac97-eb2f0916ac4f@foss.st.com>
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

On Wed, Nov 19, 2025 at 04:13:47PM +0100, Christian Bruel wrote:
> 
> 
> On 11/18/25 22:28, Bjorn Helgaas wrote:
> > [+cc Lukas in case I got the pciehp part wrong]
> > 
> 
> > 
> > To back up here, I'm trying to understand the race.
> > 
> > IIUC the relevant events are link training and register init.  In the
> > current stm32 EP driver, link training can start when the EP userspace
> > writes to the 'start' configfs file.  And the register init happens
> > when stm32_pcie_ep_perst_irq_thread() calls
> > dw_pcie_ep_init_registers().
> > 
> > So I guess the problem is when the EP userspace enables the LTSSM
> > before the host deasserts PERST#?  And the link train may complete
> > before stm32_pcie_ep_perst_irq_thread() runs?
> 
> The sequence also violated the spec (4.0, Section 6.6.1 "Conventional
> Reset"), because it allowed the endpoint to enter the Detect state before
> PERST# is deasserted
> 
> > 
> > And the fix here is to delay enabling the EP LTSSM until after
> > stm32_pcie_perst_deassert() calls dw_pcie_ep_init_registers()?
> > 
> 
> > 
> > I think we would prefer if the host would enumerate the endpoint
> > whenever the endpoint becomes ready, even if that is after the host's
> > initial enumeration, but I guess that's only possible if the host is
> > notified when the link comes up.
> > 
> > The main mechanism for that is hotplug, i.e., pciehp handles presence
> > detect and link layer state changed events, both of which are managed
> > by the PCIe Slot register set.  Those registers are optional and may
> > not be implemented, e.g., if a Root Port is connected to a
> > system-integrated device.
> > 
> > But if they *are* implemented, I hope that pciehp makes it so no user
> > intervention on the host side is required.
> > 
> 
> 
> I suppose that hotplug cannot be implemented without some kind of presence
> detection signal from the EP (PRSNT#, ...) ? For now we have no
> implementation to support this (from gpio or other).
> 

Most of the non-PC/Server platforms do not have hot pluggable connectors. So the
lack of PRSNT# signal is very common.

> However, using a PC host, I observe that when I resume the host from PCIe
> autosuspend, for example, with 'lspci', PERST# is deasserted, and the stm32
> PCIe EP device is correctly enumerated without a manual rescan. So thanks to
> power management, a device can be enumerated asynchronously but when
> requested, not when ready.
> 

I would assume that any host will deassert PERST# during boot itself, and keep
the LTSSM in Link.Detect. But if the link is not detected, a host *may* assert
PERST#. And during resume, it will try the same sequence and if your device is
connected, it will get enumerated.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

