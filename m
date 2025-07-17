Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF81C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 13:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ii71JBdT89Skk8uqBw9KL0eKLMJPh/CEFIbkAlKzemw=; b=WFysUVN0KTawnTHnM7Fin9xWgP
	9gftoNriS/bpQfcrVqyYX7uwbD08K3zpKrPzhQM9DPb6cPXe/i+Hcf6V93Yi3oaRRc2rg5MxtUQ3+
	4WZbkaFrMpZdgwPJfP+oA3w5Kobmws6P8gohJSeSTCnk4QLYmyypuAx8M1tauDj7wynuGE36D/g+z
	LLHB48JgVRDUxeWUyvY/U1BBFsjK9IL8MiXtj0Ga46KPDT/qkEmnqMKFkLYjirfeuNJgN/qkqoehO
	s/Ln6IdkL5GyajSZ8qFy/s70g2tKFDmizujL9H4X7BEWHAzXtgPG8FlxYB8Wnb3Fkezh1VWnyzwpP
	ahgRd/zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOsG-0000000AHjm-3vnP;
	Thu, 17 Jul 2025 13:42:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNk6-0000000A7FM-0UwW;
	Thu, 17 Jul 2025 12:29:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85673465F6;
	Thu, 17 Jul 2025 12:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8082C4CEE3;
	Thu, 17 Jul 2025 12:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752755381;
	bh=wuTslYNT33q0ZwkBocmRlf+/H/EC1qjjCuq+1hLV8/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ceJopmgBy57bJV7/pVeyCt/sWnxvpAsEluSAjSqU2w3Jh04BHtaiAKo9lmJ9AvYfZ
	 K5pBwXOHitlun8dR26Zstr1RUWJM84CUNJfJY0BVF+gf0zWoLpnwdZR4sNr81K1YBk
	 VUBJ/VjvFxZgy3wMohvdUgSwrCUch0CBivHiD0o0g95164OK9/znhIREB+z7g1Nqfm
	 VsB2MSBRiMVxTaAYbHVNFLA/s2h37gLvnyn9KZt5WyJYtPI3Y+idAjq2x0myzQGof3
	 7u8IWr9UGLr91Oy0qtj9GnGEqOjcPxca775YWvWve0YENWg7eoUzNJiULTgSMnK/Ev
	 dWpaGUGxT++EQ==
Date: Thu, 17 Jul 2025 17:59:32 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, 
	Hugh Cole-Baker <sigmaris@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 2/3] PCI: rockchip-host: Retry link training on
 failure without PERST#
Message-ID: <djbhz7qfyzrn7mdqmvqhyh6yjsjyigjly7py4f7aj5f4qbabou@67gk3qdnvzws>
References: <cover.1749582046.git.geraldogabriel@gmail.com>
 <b7c09279b4a7dbdba92543db9b9af169776bd90c.1749582046.git.geraldogabriel@gmail.com>
 <zuiq3b2rsixymtjr3xzrb26clikvlja62wgj65umnse4kuk75c@x5qan73ispxe>
 <aFk-MeIWFcBiGBPr@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFk-MeIWFcBiGBPr@geday>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_052942_196634_27726916 
X-CRM114-Status: GOOD (  45.86  )
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

On Mon, Jun 23, 2025 at 08:44:49AM GMT, Geraldo Nascimento wrote:
> On Mon, Jun 23, 2025 at 05:29:46AM -0600, Manivannan Sadhasivam wrote:
> > On Tue, Jun 10, 2025 at 04:05:40PM -0300, Geraldo Nascimento wrote:
> > > After almost 30 days of battling with RK3399 buggy PCIe on my Rock Pi
> > > N10 through trial-and-error debugging, I finally got positive results
> > > with enumeration on the PCI bus for both a Realtek 8111E NIC and a
> > > Samsung PM981a SSD.
> > > 
> > > The NIC was connected to a M.2->PCIe x4 riser card and it would get
> > > stuck on Polling.Compliance, without breaking electrical idle on the
> > > Host RX side. The Samsung PM981a SSD is directly connected to M.2
> > > connector and that SSD is known to be quirky (OEM... no support)
> > > and non-functional on the RK3399 platform.
> > > 
> > > The Samsung SSD was even worse than the NIC - it would get stuck on
> > > Detect.Active like a bricked card, even though it was fully functional
> > > via USB adapter.
> > > 
> > > It seems both devices benefit from retrying Link Training if - big if
> > > here - PERST# is not toggled during retry.
> > > 
> > > For retry to work, flow must be exactly as handled by present patch,
> > > that is, we must cut power, disable the clocks, then re-enable
> > > both clocks and power regulators and go through initialization
> > > without touching PERST#. Then quirky devices are able to sucessfully
> > > enumerate.
> > > 
> > 
> > This sounds weird. PERST# is just an indication to the device that the power and
> > refclk are applied or going to be removed. The devices uses PERST# to prepare
> > for the power removal during assert and start functioning after deassert.
> 
> Hi Mani! Thank you for looking into this.
> 
> Yeah, tell me about it, it is beyond weird. I posted RFC Patch in the
> hopes someone with access to PCIe Analyzer could have deeper look
> at what the heck is going on here - because it does work, but I don't
> claim to understand how.
> 

I was hoping that the Rockchip folks would chime in, but no reply from them so
far.

@Shawn: Could you please shed some light here?

> > 
> > It looks like the PERST# polarity is inverted in your case. Could you please
> > change the 'ep-gpios' polarity to GPIO_ACTIVE_LOW and see if it fixes the issue
> > without this patch?
> > 
> > If that didn't work, could you please drop the 'ep-gpios' property and check?
> 
> Sorry to decline your request, but I assure you I have tried many
> other combinations before reaching present patch, including your
> suggestion. It will do nothing. It won't work, won't make SSD that
> refuse to work with RK3399, working. Note that this isn't specific
> to my board - RK3399 is infamous for being picky about devices.
> 
> > 
> > > No functional change intended for already working devices.
> > > 
> > > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > > ---
> > >  drivers/pci/controller/pcie-rockchip-host.c | 47 ++++++++++++++++++---
> > >  1 file changed, 40 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> > > index 2a1071cd3241..67b3b379d277 100644
> > > --- a/drivers/pci/controller/pcie-rockchip-host.c
> > > +++ b/drivers/pci/controller/pcie-rockchip-host.c
> > > @@ -338,11 +338,14 @@ static int rockchip_pcie_set_vpcie(struct rockchip_pcie *rockchip)
> > >  static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
> > >  {
> > >  	struct device *dev = rockchip->dev;
> > > -	int err, i = MAX_LANE_NUM;
> > > +	int err, i = MAX_LANE_NUM, is_reinit = 0;
> > >  	u32 status;
> > >  
> > > -	gpiod_set_value_cansleep(rockchip->perst_gpio, 0);
> > > +	if (!is_reinit) {
> > > +		gpiod_set_value_cansleep(rockchip->perst_gpio, 0);
> > > +	}
> > >  
> > > +reinit:
> > 
> > So this reinit part only skips the PERST# assert, but calls
> > rockchip_pcie_init_port() which resets the Root Port including PHY. I don't
> > think it is safe to do it if PERST# is wired.
> 
> I don't understand, could you be a bit more verbose on why do you
> think this is dangerous?
> 

When the Root Port and PHY gets reset, there is a good chance that the refclk
would also be cutoff. So if that happens without PERST# assert, then the device
has no chance to clean its state machine. If the device gets its own refclk,
then it is a different story, but we should not make assumptions.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

