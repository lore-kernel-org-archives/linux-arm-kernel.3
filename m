Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F275FFCC9B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 05:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzPG0muUeZMpM/UGOtQ86N6wcj0w9si+KiCg9p3u16Q=; b=NxxQAbU8ivEFOSgPE/74sqWsql
	aH2lZ01jJ1ftCiw01qx8LZARkmWqOIh2BPQmZkM1uX1UFTcgwwtKcPCfXtJpQe528GumA4UHYlYIo
	9va3ZAUJDDLvANp7xogvnfOLDleZaqAn3/2hEapDe+OMaXvl30hCThg3dPePpjjckwRMXJo5gvAZH
	sfKDMFokVgS+Uzy4XQk2FNv8mDx3Mx1FgAeHP0W80dMmnucCevJaotdOs6Q5qaQJUW3v2NXio5yjJ
	v34E1oi9yF/WHTrNYSCzNcbeJekvM0aXANgZ6VK+ZZKHQLUoUSQZfX0H8UlD8d0/ENNgPXKd7yJGY
	b0YUj+pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0C4M-0000000Am6V-3bG9;
	Wed, 11 Mar 2026 05:25:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0C4K-0000000Am5g-2tRI;
	Wed, 11 Mar 2026 05:25:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB3EB40E0B;
	Wed, 11 Mar 2026 05:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A392C4CEF7;
	Wed, 11 Mar 2026 05:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773206715;
	bh=Lz9CL6rzdbiGSs2MlZc2h5jp54acjzYn9zhxUZhjCSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EdjU4UpZvCZbIz4IVjbWg8bEigB3Il9TDaxRPMNRYXAG6xI2m5oVM27GWJq9zR/hH
	 8Ty+XAHDBc4IUpQM8TdwFjmSF4DaxoA0q72QiB0raWNfuMJ4QZoYnb1hcXum40d/Sz
	 0czfouRTFALAxFnaQi0PvKTVzE2B1cAP/3MX5rWbrFPZZZ9rPBzE+9Hirvq5N2ItzK
	 UTE/x50P9uX3bI8lKJEFcYCb4wRUjI3INck/AuD0xtc05ojvJAqYALfkhZDrk+q0xK
	 fJH78WljXcK36ZUbkStnvdCkZOBhl9NtbnuzcSAWrIB8kJvVdk3UTbP58N16nx/tdr
	 mhCw5KctX23kw==
Date: Wed, 11 Mar 2026 10:54:59 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Hans Zhang <18255117159@163.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Grimmauld <grimmauld@grimmauld.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
Message-ID: <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
References: <20260226101032.1042-1-linux.amoon@gmail.com>
 <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com>
 <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_222516_770480_370CB67A 
X-CRM114-Status: GOOD (  34.36  )
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

On Tue, Mar 10, 2026 at 09:03:32PM +0000, Robin Murphy wrote:
> [ +driver-core maintainers - async probe question below ]
> 
> On 2026-03-10 3:30 pm, Manivannan Sadhasivam wrote:
> > Hi Robin,
> > 
> > On Tue, Mar 10, 2026 at 01:41:56PM +0000, Robin Murphy wrote:
> > > Hi Mani,
> > > 
> > > On 2026-03-04 6:48 am, Manivannan Sadhasivam wrote:
> > > > 
> > > > On Thu, 26 Feb 2026 15:40:23 +0530, Anand Moon wrote:
> > > > > Rockchip DWC PCIe driver currently performs synchronous link training for
> > > > > combo PHYs (PCIe 3.0/2.0 and SATA 3.0) during boot. This process waits for
> > > > > the link to be fully established, adding several milliseconds to the boot
> > > > > sequence. To optimize boot time, this change enables asynchronous probing,
> > > > > allowing link establishment to proceed in the background while the kernel
> > > > > continues probing other devices.
> > > > > 
> > > > > [...]
> > > > 
> > > > Applied, thanks!
> > > > 
> > > > [1/1] PCI: dw-rockchip: Enable async probe by default
> > > >         commit: ec392abc95932838bf7e3d659d358f4df9ff5a0a
> > > 
> > > This appears to have the side-effect that calling pci_host_probe() from
> > > async context can effectively force async probe for the endpoint drivers
> > > as well, but some drivers are not OK with that, as our CI has just
> > > flagged up.
> > > 
> > 
> > Thanks for reporting!
> > 
> > > (And as for that particular warning, ISTR last time I looked into it
> > > another context, the opinion of the MDIO/phy maintainers seemed to be
> > > "don't force async probe".)
> > > 
> > 
> > This was discussed during v2 [1] and concluded that the async probe benefits
> > outweigh the unharmful splat from phylib. I also agree with the above conclusion
> > that this splat should not prevent us from enabling async probe for PCI
> > controller drivers. It can easily save a few 100ms during boot.
> 
> The problem is not an "unharmful splat" from one driver on one board -
> that's *a* symptom, and the fact that it happens to be a relatively benign
> one does not dismiss the problem that forcing async probe upon drivers that
> are not designed to support async probe cannot in general be assumed to be
> safe, so is not OK. It's one thing if a user brings it upon themselves by
> explicitly using the "driver_async_probe=" option, but it's very different
> if some other driver starts doing it for them.
> 

I have a contrary view here. If just a single driver or lib doesn't handle async
probe, it cannot just force other drivers to not take the advantage of async
probe. As I said above, enabling async probe easily saves a few hunderd ms or
even more if there are more than one Root Port or Root Complex in an SoC.

Moreover, there are multiple ways this splat could be triggered as reported in:
https://lore.kernel.org/netdev/7103704.9J7NaK4W3v@fedora.fritz.box

> Looking closer, it seems like the fundamental issue might be when we've got
> this far (simplified for clarity):
> 
> - async_run_entry_fn
>   - rockchip_pcie_probe
>     - pci_host_probe
>      - pci_bus_add_device
>        - device_initial_probe
>          - __device_attach_driver
> 
> wherein we then reach the "if (data->check_async && async_allowed !=
> data->want_async)" condition, at which point check_async is true (from
> device_initial_probe()), while async_allowed and want_async are *both*
> false, but that leads us to actually go ahead and call driver_probe_device()
> for the child device despite being in async context. That doesn't seem right
> to me - I'm guessing it maybe wasn't anticipated to have bus drivers calling
> device_initial_probe() from within async in the first place?
> 

But isn't the underlying issue is with phylib calling request_module() while the
driver core performs async probing?

> It may not strictly be the fault of this patch - clearly 91703041697c ("PCI:
> Allow built-in drivers to use async initial probing") is implicated in this
> too - but the fact is that it *has* exposed a bug that needs fixing one way
> or another, it can't just be left hanging and impacting end users.
> 

I strongly agree with you here that the underlying issue should be fixed. But
the real impact to end users is not this splat, but not having the boot time
optimization that this patch brings in. As an end user, one would want their
systems to boot quickly and they wouldn't bother much about a harmless warning
splat appearing in the dmesg log.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

