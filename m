Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E90CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nR8ql1NsmjflDmysoydKMtxesdaOk4Brg9cfJU0X/AA=; b=cRPp/xqlStdfjQWPNBN0V7A2Bz
	n1DBnlRB4XDQy2S9Bm87ku/wCSll3mycc7YoMe8etFUlY3LjIHIKuwiHbUc0JZ4NUVud1zaebY5mX
	lkI2q45tpc4Uv1sSMFuSsXRvP4POq76XpTc21t6dxyUOp9qJgvxkMpl5TdF5KR3XzMiHTFMApK9H+
	ckqxOX5er2lsta20AlsV850gvj3PvRv7d04WuKgdwkWGKxTEObutzgOdDi6A786o01gbvbdQDOo+H
	ak0lLSM056u7SJzN1AM82jXfOle7j6KMBLpp6zMUSh2UMi9ZlJCxSS1COLFIJG3hij4hKb7ty5yGE
	WTQw6hhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ0Z-00000005IuF-1qEa;
	Mon, 10 Nov 2025 11:24:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ0Y-00000005ItD-3SiE;
	Mon, 10 Nov 2025 11:24:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AB856014D;
	Mon, 10 Nov 2025 11:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DF2C116D0;
	Mon, 10 Nov 2025 11:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762773865;
	bh=RsaOGTix9Ur+eCDtdyFW52wEEbBpedzXfB2AohWy/OQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Torrhd+o19dK8++DuxENcSYZFvhQ52lCnhlUZM07H/XkV5MODzY14KibeWlBQXKTL
	 4EjSms5fYq7BIcbvUdTIrC7lr4/YfJgFabzNQHmQ6wUsNGSPengbQid2Mc/Mjta4a8
	 JwOjhbwXLz6/+ddnP9o2NeJxC88XVeiEBLeEqRHkMZof/iy8XhtD5LHAoanTGuar2B
	 t9p1RLNe3D2C7tOPkuBISJpUidRJ1UR4aHC9GInyeKmSSkdSYkjFyQ0znKHODp3LWw
	 dyvqhnwUIvKTvYEIGSQWmDSUFds2sSa8zgVHTRpCHo3FIYNzQsn0LkQVXDfb7J5clG
	 OFWvSN6FiFaYw==
Date: Mon, 10 Nov 2025 16:54:13 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: FUKAUMI Naoki <naoki@radxa.com>
Cc: Niklas Cassel <cassel@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Anand Moon <linux.amoon@gmail.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Dragan Simic <dsimic@manjaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [RESEND] Re: [PATCH] PCI: dw-rockchip: Skip waiting for link up
Message-ID: <4f4wsgf56eublizg63fz6xmdjixesalb2q3rxetphd55jpqqju@zfyzsxfgiyim>
References: <20250113-rockchip-no-wait-v1-1-25417f37b92f@kernel.org>
 <1E8E4DB773970CB5+5a52c9e1-01b8-4872-99b7-021099f04031@radxa.com>
 <6e87b611-13ea-4d89-8dbf-85510dd86fa6@rock-chips.com>
 <aQ840q5BxNS1eIai@ryzen>
 <aQ9FWEuW47L8YOxC@ryzen>
 <55EB0E5F655F3AFC+136b89fd-98d4-42af-a99d-a0bb05cc93f3@radxa.com>
 <aRCI5kG16_1erMME@ryzen>
 <F8B2B6FA2884D69A+b7da13f2-0ffb-4308-b1ba-0549bc461be8@radxa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F8B2B6FA2884D69A+b7da13f2-0ffb-4308-b1ba-0549bc461be8@radxa.com>
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

On Mon, Nov 10, 2025 at 08:26:56AM +0900, FUKAUMI Naoki wrote:
> (RESEND: fix mani's email address)
> 

Thanks for looping me in! My Linaro email is not functional anymore.

> Hi Niklas,
> 
> On 11/9/25 21:28, Niklas Cassel wrote:
> > On Sun, Nov 09, 2025 at 01:42:23PM +0900, FUKAUMI Naoki wrote:
> > > Hi Niklas,
> > > 
> > > On 11/8/25 22:27, Niklas Cassel wrote:
> > > (snip)> (And btw. please test with the latest 6.18-rc, as, from experience,
> > > the
> > > > ASPM problems in earlier RCs can result in some weird problems that are
> > > > not immediately deduced to be caused by the ASPM enablement.)
> > > 
> > > Here is dmesg from v6.18-rc4:
> > >   https://gist.github.com/RadxaNaoki/40e1d049bff4f1d2d4773a5ba0ed9dff
> > 
> > Same problem as before:
> > [    1.732538] pci_bus 0004:43: busn_res: can not insert [bus 43-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> > [    1.732645] pci_bus 0004:43: busn_res: [bus 43-41] end is updated to 43
> > [    1.732651] pci_bus 0004:43: busn_res: can not insert [bus 43] under [bus 42-41] (conflicts with (null) [bus 42-41])
> > [    1.732661] pci 0004:42:00.0: devices behind bridge are unusable because [bus 43] cannot be assigned for them
> > [    1.732840] pci_bus 0004:44: busn_res: can not insert [bus 44-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> > [    1.732947] pci_bus 0004:44: busn_res: [bus 44-41] end is updated to 44
> > [    1.732952] pci_bus 0004:44: busn_res: can not insert [bus 44] under [bus 42-41] (conflicts with (null) [bus 42-41])
> > [    1.732962] pci 0004:42:02.0: devices behind bridge are unusable because [bus 44] cannot be assigned for them
> > [    1.733134] pci_bus 0004:45: busn_res: can not insert [bus 45-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> > [    1.733246] pci_bus 0004:45: busn_res: [bus 45-41] end is updated to 45
> > [    1.733255] pci_bus 0004:45: busn_res: can not insert [bus 45] under [bus 42-41] (conflicts with (null) [bus 42-41])
> > [    1.733266] pci 0004:42:06.0: devices behind bridge are unusable because [bus 45] cannot be assigned for them
> > [    1.733438] pci_bus 0004:46: busn_res: can not insert [bus 46-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> > [    1.733544] pci_bus 0004:46: busn_res: [bus 46-41] end is updated to 46
> > [    1.733550] pci_bus 0004:46: busn_res: can not insert [bus 46] under [bus 42-41] (conflicts with (null) [bus 42-41])
> > [    1.733560] pci 0004:42:0e.0: devices behind bridge are unusable because [bus 46] cannot be assigned for them
> > [    1.733571] pci_bus 0004:42: busn_res: [bus 42-41] end is updated to 46
> > [    1.733575] pci_bus 0004:42: busn_res: can not insert [bus 42-46] under [bus 41] (conflicts with (null) [bus 41])
> > [    1.733585] pci 0004:41:00.0: devices behind bridge are unusable because [bus 42-46] cannot be assigned for them
> > [    1.733596] pcieport 0004:40:00.0: bridge has subordinate 41 but max busn 46
> > 
> > 
> > Seems like the ASM2806 switch, for some reason, is not ready.
> > 
> > One change that Diederik pointed out is that in the "good" case,
> > the link is always in Gen1 speed.
> > 
> > Perhaps you could build with CONFIG_PCI_QUIRKS=y and try this patch:
> > 
> > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > index 214ed060ca1b..ac134d95a97f 100644
> > --- a/drivers/pci/quirks.c
> > +++ b/drivers/pci/quirks.c
> > @@ -96,6 +96,7 @@ int pcie_failed_link_retrain(struct pci_dev *dev)
> >   {
> >   	static const struct pci_device_id ids[] = {
> >   		{ PCI_VDEVICE(ASMEDIA, 0x2824) }, /* ASMedia ASM2824 */
> > +		{ PCI_VDEVICE(ASMEDIA, 0x2806) }, /* ASMedia ASM2806 */
> >   		{}
> >   	};
> >   	u16 lnksta, lnkctl2;
> 
> It doesn't help with either probing behind the bridge or the link speed.
> 
> > If that does not work, perhaps you could try this patch
> > (assuming that all Rock 5C:s have a ASM2806 on pcie2x1l2):
> 
> ROCK 5C has a PCIe FPC connector and I'm using Dual 2.5G Router HAT.
>  https://radxa.com/products/rock5/5c#techspec
>  https://radxa.com/products/accessories/dual-2-5g-router-hat
> 
> Regarding the link speed, I initially suspected the FPC connector and/or
> cable might be the issue. However, I tried the Dual 2.5G Router HAT with the
> ROCK 5A (which uses a different cable), and I got the same result.
> 
> BTW, the link speed varies between 2Gb/s and 4Gb/s depending on the reboot.
> (with or without quirk)
> 

From the dmesg log, it looks like the issue is most probably due to bus number
assignment for the Root Port. During the initial bus scan, the PCI core will
assign the subordinate bus number (max bus number behind the PCI bridge) of the
PCI bridge based on the available busses scanned behind the bridge. Before the
link up IRQ patch, I guess the PCIe switch connected to the Root Port gets
enumerated during dw_pcie_wait_for_link() itself i.e., before the PCI core
starts the bus scan with a call to pci_host_probe(). So the switch appears when
the PCI core starts scanning the bus and the subordinate bus number gets
assigned correctly as the PCI core could see the available busses behind the
Root Port.

This could be confirmed from the timing of the success log:

[    1.875690] pci 0004:40:00.0: bridge configuration invalid ([bus 01-ff]), reconfiguring
[    1.876543] pci 0004:41:00.0: [1b21:2806] type 01 class 0x060400 PCIe Switch Upstream Port

Time difference is 853ms.

But with the link up IRQ patch, dw_pcie_wait_for_link() is skipped and the
device appears *after* the initial bus scan by the PCI core.

From the failure log:

[    1.392130] pci 0004:40:00.0: PCI bridge to [bus 41]
[    1.392607] pci_bus 0004:40: resource 4 [io  0x0000-0xfffff]
[    1.393103] pci_bus 0004:40: resource 5 [mem 0xf4200000-0xf4ffffff]
[    1.393657] pci_bus 0004:40: resource 6 [mem 0xa00000000-0xa3fffffff]
[    1.412296] pci 0004:41:00.0: [1b21:2806] type 01 class 0x060400 PCIe Switch Upstream Port

Note the timing and also the PCI bridge resource assignment.

So during the initial scan, PCI core doesn't see the switch and since the Root
Port is not hot plug capable (I'm assuming that's the case), the secondary bus
number gets assigned as the subordinate bus number (41). This means, the PCI
core assumes that only one bus will appear behind the Root Port since the Root
Port is not hot plug capable. This will work perfectly fine for PCIe endpoints
connected to the Root Port, since they don't extend the bus. But if you connect
a PCIe switch, then you'll see the issue as the downstream busses starts showing
up and PCI core doesn't extend the subordinate bus number after initial scan
during boot.

This is also confirmed by the below log in failure case:

[    1.478814] pcieport 0004:40:00.0: bridge has subordinate 41 but max busn 46

If you try the below hack, you might get the switch working:

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index c83e75a0ec12..01afb5b23eba 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1701,6 +1701,11 @@ void set_pcie_hotplug_bridge(struct pci_dev *pdev)
 {
        u32 reg32;
 
+       if (pdev->vendor == 0x1d87 && pdev->device == 0x3588) {
+               pdev->is_hotplug_bridge = pdev->is_pciehp = 1;
+               return;
+       }
+
        pcie_capability_read_dword(pdev, PCI_EXP_SLTCAP, &reg32);
        if (reg32 & PCI_EXP_SLTCAP_HPC)
                pdev->is_hotplug_bridge = pdev->is_pciehp = 1;

The above diff just fakes the Root Port as hot plug capable to the PCI core so
that more subordinate bus numbers gets assigned to it in the anticipation of
more busses showing up post scan.

If the above works, then you should make sure that the switch is powered and the
link to be up before the initial bus scan. The proper way to do this would be by
modeling your switch power resources in devicetree and relying on the
CONFIG_PWRCTRL_SLOT driver to power it up and scan the bus. But this driver
needs some extra work to satisfy your needs and I'm going to post a series in
the coming weeks for that.

Until then, I'd suggest to revert the link up IRQ patch as a stop-gap solution.

NOTE: As Niklas rightly pointed out, this issue also affects the Qcom platforms
which follows the same code pattern and also other platforms as well. For Qcom,
we are relying on the upcoming pwrctrl fixes to properly enumerate the PCIe
switches in upstream.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

