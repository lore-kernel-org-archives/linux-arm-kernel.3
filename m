Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24AFD19502
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 18:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vicu6lpUE90FAgN2xtfuOumDUR1Qg4VnW5GWRXk4y9o=; b=bTWmGtpDkbzypgEafIM3FNV7yY
	v4d15vWjOwhL1Meu04tRiO1km6A8YMVrr5lLXqW8kG59ymiAlliz9apBptZEur7E/KVHVPo3++TeI
	PEsBc2IAShHvfr+m/hAD0jRLQ6SI64dOm8AgV8tvsxNYPrudYBKrjzNW+9dp93aH9BQlMfKh3hgLE
	KoxExI4f5wpCAY477EbXUD9wHXjxkDDAvbCZfv3WveuIWdRYQY7AEhoPdkLOPVVg27fiyjXhzGyFD
	wf5VihovrqleL3w8qFg//HNq+ydRgWYAdQBl0gs9n8HvcgckI3DO6aynzGk4XuGL0fmPHQwZU1bbE
	MIouhCVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkR3s-0000000D2G4-25lk;
	Mon, 26 Jan 2026 18:11:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkR3n-0000000D2Fi-2Q4T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 18:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vicu6lpUE90FAgN2xtfuOumDUR1Qg4VnW5GWRXk4y9o=; b=NrPEk1J1La77hJglDtJdiD8za9
	IGx3mDMOahM9R9I2Epz3BcUKZV0mEwhrhJowvHeWenHhHLJRQmcsbU5jlB66JkVEvQS2Co5khEXlF
	asdrMDH6hVzJxOHU2z65VzC4+izMIh1i573mzJbt9dxmqTpS+HtuGU2tgNpoX+XId54JueRF3XNIF
	LpV/dq8Ej88/zNas8S35JPhVSeA8skdIZWOdx3nPPsnkHPXiP97M1UY8xNnAHJVZi6ipsJJ1MHpZF
	PAlyizJyryjDuVP54qj98ob9nRsfq+XB3t4GOkzjGe85CZRYRnTbfos0P7CnvrtLmXfVuSo8b1zma
	Zh7SYR1Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36042)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vkR3c-000000005Co-0yVO;
	Mon, 26 Jan 2026 18:11:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vkR3X-00000000595-3RUR;
	Mon, 26 Jan 2026 18:11:19 +0000
Date: Mon, 26 Jan 2026 18:11:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH net-next] net: stmmac: Preserve bootloader MAC
 address across unconditional reset
Message-ID: <aXeuR_YLoAFYEAVi@shell.armlinux.org.uk>
References: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_101135_622295_215A6B9B 
X-CRM114-Status: GOOD (  26.00  )
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

On Mon, Jan 26, 2026 at 05:25:03PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Commit 90f522a20e3d1 ("NET: dwmac: Make dwmac reset unconditional")
> asserts a reset in probe when a reset controller is present. This reset
> clears the MAC address registers, so a valid address programmed by the
> bootloader gets lost and the driver falls back to a random address.
> 
> Read the MAC address from the hardware registers before resetting the
> hardware. Keep the existing address selection logic when no valid
> address is found, and program the selected address back into the MAC
> after probe so it remains consistent in hardware.
> 
> Export stmmac_bus_clks_config() so the early read path can enable the
> bus clocks before accessing the MAC registers.

I don't think this is a good idea. stmmac_bus_clks_config() is specific
to using platform devices, but the core stmmac driver also supports
PCI that doesn't use stmmac_bus_clks_config().

stmmac_bus_clks_config() handles:

 - plat_dat->stmmac_clk
 - plat_dat->pclk
 - any clock handled by the plat_dat->clks_config() method

For platform devices, stmmac_probe_config_dt() gets these two clocks
from DT, and prepares and enables them both. So, by the time the
probe function is called, these clocks are already running.

For those handled by the platform glue, the glues that populate
this function:

eic7700: eic7700_clks_config() - this is called from the init/exit
handlers. Will be invoked to enable the clocks by stmmac_dvr_probe().

imx: imx_dwmac_clks_config() - called by imx_dwmac_probe() to enable
clocks prior to stmmac_dvr_probe() being invoked.

mediaktek: mediatek_dwmac_clks_config() - called by
mediatek_dwmac_probe() to enable clocks prior to stmmac_dvr_probe()
being invoked.

qcom-ethqos: ethqos_clks_config() - called by qcom_ethqos_probe() to
enable clocks prior to stmmac_dvr_probe() being invoked.

So, I can confidently say that all clocks should be running by the
time __stmmac_dvr_probe() is called, and thus there should be no
requirement to call stmmac_bus_clks_config() in this code.


The next problem: you place this code to read registers from stmmac
before:

	ret = reset_control_deassert(priv->plat->stmmac_ahb_rst);

Sadly, the binding documentation is too vague to pin down what this
is, as dwmac can have AHB master (which generates bus cycles for
accessing memory) and AHB slave (which would be the target for
register accesses) interfaces.

The problem here is that if some platform glue has wired this reset
such that it resets the AHB slave side, that will prevent register
access, and thus your attempt to read the MAC across all devices
will fail.


The next question that comes up is that we have a perfectly good way
that's been around for years to pass a MAC address from the boot
loader into the kernel for any network interface. I notice that it
isn't mentioned in the DT bindings, presumably to prevent people
from adding it to their in-kernel DT files.

	mac-address =
	local-mac-address =

The old documentation in ethernet.txt was:

- mac-address: array of 6 bytes, specifies the MAC address that was last used by
  the boot program; should be used in cases where the MAC address assigned to
  the device by the boot program is different from the "local-mac-address"
  property;
- local-mac-address: array of 6 bytes, specifies the MAC address that was
  assigned to the network device;

Given that these are interfaces between the boot loader and the kernel,
they can't be deprecated, as platforms will rely upon these properties
to pass the MAC address from the boot loader to the kernel. For example
on one of my systems:

$ vdir /sys/class/net/eth0/of_node/
total 0
-r--r--r-- 1 root root  4 Jan 26 18:08 gop-port-id
-r--r--r-- 1 root root 50 Jan 26 18:08 interrupt-names
-r--r--r-- 1 root root 80 Jan 26 18:08 interrupts
-r--r--r-- 1 root root  6 Jan 26 18:08 local-mac-address
-r--r--r-- 1 root root 14 Jan 26 18:08 name
-r--r--r-- 1 root root  4 Jan 26 18:08 phy
-r--r--r-- 1 root root 10 Jan 26 18:08 phy-mode
-r--r--r-- 1 root root  8 Jan 26 18:08 phys
-r--r--r-- 1 root root  4 Jan 26 18:08 port-id
-r--r--r-- 1 root root  4 Jan 26 18:08 reg
-r--r--r-- 1 root root  5 Jan 26 18:08 status

where "local-mac-address" states the MAC address to be used for eth0,
as specified by the boot loader.

I don't think stmmac needs this extra complication provided platforms
make use of mechanisms that already exist... and I feel it's time to
start saying no to platform specific quirks that can be handled by
those mechanisms.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

