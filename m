Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B412ECE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=X2uXhRU2hKn3/p9QZ3ogMbvyFHC76aDtJXZzTr7pZ5s=; b=l/uNaC3gRSu+eC
	1LgIl/8UDjyDbE73sDsq0VijG1OlwjUUMhIjQia+ZcNraZe+kT/eTZAwfpbx1eXD0uY3XhRxMsdhF
	/v2/AQYTJkTPeisovfo/9nnnKogvIOdP9Wg/F1J8b6xj6nEo9gr8o7HGRHIxIGQ37nskh6V97jQeP
	U6KU5HzesVBtcH2ErgReta7wXTTTzLiurV0cIUN9M/3vX6ptX4yxx9cZ5C7NMcKzDn7YDCnPvUEV/
	aJUm24n0SwKtbgpnynO4iUa21AUghuR28ZsTi2ViJUaoUEijRgMJqbpu8cal8OgkygOVZ0u9ChKYC
	gafhZD8/IW/j4KUoQtow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9vz-0000000H480-35Yn;
	Tue, 18 Nov 2025 00:51:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9vw-0000000H45V-1RQh;
	Tue, 18 Nov 2025 00:51:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDD2A439BA;
	Tue, 18 Nov 2025 00:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F2EC4AF09;
	Tue, 18 Nov 2025 00:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763427059;
	bh=hkavOkX+AJ0Q/nljcqEN9XW/rOLVZVY4+XD1wjrUAHw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SISIeqMGdKRt1D7TYgO/eXm8MsAcG522nQilC9TlS40eSzuNY3D/o7tdfLH6/MCS5
	 VVGtVN0PSaGwixakZ4/33MD6P7kfLlnW1Q820zZVhcZ4gxulaxBsHPxdsRg/PZyQ1T
	 P9v4bTVRmprL4ngKYy2ezYvvs3g3jI5/eLHOrK1uSRUg3MOgxuTpwKMgGagwkY7w6A
	 8oeAoMTAnZOWMheBVX2pyw6c0OfHjbdA4PJlQPejA9c7VegSqnc6biQzefjQdYJFYD
	 pJ+kRJksm1RPhiuDG903U7rDOB0BCcpBKxIjdji6MPBz6gQOzp9doog8N6BbH/CV4i
	 gsUL4OzvwcWEQ==
Date: Mon, 17 Nov 2025 18:50:56 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	"open list:PCIE DRIVER FOR ROCKCHIP" <linux-pci@vger.kernel.org>,
	"open list:PCIE DRIVER FOR ROCKCHIP" <linux-rockchip@lists.infradead.org>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC v1 2/5] PCI: rockchip: Fix Device Control register offset
 for Max payload size
Message-ID: <20251118005056.GA2541796@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117181023.482138-3-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_165100_425051_63B75400 
X-CRM114-Status: GOOD (  20.58  )
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

On Mon, Nov 17, 2025 at 11:40:10PM +0530, Anand Moon wrote:
> As per 17.6.6.1.29 PCI Express Device Capabilities Register
> (PCIE_RC_CONFIG_DC) reside at offset 0xc8 within the Root Complex (RC)
> configuration space, not at the offset of the PCI Express Capability
> List (0xc0). Following changes corrects the register offset to use
> PCIE_RC_CONFIG_DC (0xc8) to configure Max Payload Size.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip-host.c | 4 ++--
>  drivers/pci/controller/pcie-rockchip.h      | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> index f0de5b2590c4..d51780f4a254 100644
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -382,10 +382,10 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
>  		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCAP);
>  	}
>  
> -	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCTL);
> +	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_DC + PCI_EXP_DEVCTL);
>  	status &= ~PCI_EXP_DEVCTL_PAYLOAD;
>  	status |= PCI_EXP_DEVCTL_PAYLOAD_256B;
> -	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCTL);
> +	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DC + PCI_EXP_DEVCTL);
>  
>  	return 0;
>  err_power_off_phy:
> diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
> index 5d8a3ae38599..c0ec6c32ea16 100644
> --- a/drivers/pci/controller/pcie-rockchip.h
> +++ b/drivers/pci/controller/pcie-rockchip.h
> @@ -157,6 +157,7 @@
>  #define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)
>  #define PCIE_RC_CONFIG_RID_CCR		(PCIE_RC_CONFIG_BASE + 0x08)
>  #define PCIE_RC_CONFIG_CR		(PCIE_RC_CONFIG_BASE + 0xc0)
> +#define PCIE_RC_CONFIG_DC		(PCIE_RC_CONFIG_BASE + 0xc8)

Per the RK3399 TRM:

  DEVCAP              0xc4
  DEVCTL and DEVSTA   0xc8
  LNKCAP              0xcc
  LNKCTL and LNKSTA   0xd0
  SLTCAP              0xd4
  SLTCTL and SLTSTA   0xd8

That all makes good sense and matches the relative offsets in the PCIe
Capability.

I have no idea how we got from that to the mind-bendingly obtuse
#defines here:

  PCIE_RC_CONFIG_CR == PCIE_RC_CONFIG_BASE + 0xc0
                    == 0xa00000 + 0xc0
                    == 0xa000c0

  PCIE_RC_CONFIG_DC == PCIE_RC_CONFIG_BASE + 0xc8
                    == 0xa00000 + 0xc8
                    == 0xa000c8

  PCIE_RC_CONFIG_LC == PCIE_RC_CONFIG_BASE + 0xd0
                    == 0xa00000 + 0xd0
                    == 0xa000d0

  PCIE_RC_CONFIG_SR == PCIE_RC_CONFIG_BASE + 0xd4
                    == 0xa00000 + 0xd4
                    == 0xa000d4

And they're used like this:

  PCIE_RC_CONFIG_CR + PCI_EXP_LNKCAP == 0xa000c0 + 0x0c
                                     == 0xa000cc

  PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL == 0xa000c0 + 0x10
                                     == 0xa000d0

  PCIE_RC_CONFIG_DC + PCI_EXP_DEVCTL == 0xa000c8 + 0x08
                                     == 0xa000d0     <-- same as LNKCTL? 

  PCIE_RC_CONFIG_SR + PCI_EXP_DEVCAP == 0xa000d4 + 0x04
                                     == 0xa000d8     <--

  PCIE_RC_CONFIG_LC + PCI_EXP_LNKCTL == 0xa000d0 + 0x10
                                     == 0xa000e0     <-- but LNKCTL was at 0xa000d0 above?

And the mappings don't make any sense to me:

  CR -> LNKCAP & LNKCTL
  DC -> DEVCTL (ok, this one makes a *little* sense)
  SR -> DEVCAP
  LC -> LNKCTL (would make some sense except that we have CR above)

This is all just really hard to read.  It looks like if we defined a
single base address for the PCIe Capability, we shouldn't need all the
_CR, _DC, _LC, _SR, etc #defines.  E.g., we could have

  #define ROCKCHIP_RP_PCIE_CAP ...

  rockchip_pcie_read(rockchip, ROCKCHIP_RP_PCIE_CAP + PCI_EXP_DEVCAP)
  rockchip_pcie_read(rockchip, ROCKCHIP_RP_PCIE_CAP + PCI_EXP_LNKCTL)
  ...

with maybe some minor adjustment for 16-bit registers since Rockchip
only seems to support 32-bit accesses (?)

None of these registers are *Root Complex* registers; they're all part
of a PCIe Capability, which applies to a Root *Port*.

>  #define PCIE_RC_CONFIG_LC		(PCIE_RC_CONFIG_BASE + 0xd0)
>  #define PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2 (PCIE_RC_CONFIG_BASE + 0x90c)
>  #define PCIE_RC_CONFIG_THP_CAP		(PCIE_RC_CONFIG_BASE + 0x274)
> -- 
> 2.50.1
> 

