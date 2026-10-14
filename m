Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713A7CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 12:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lc8uuepmMNDKw7VHsYlBRGQ/X8aBjhev1Xn7fOB1gXg=; b=GR9ssyV6Dlks2jQG5ptEOpCwkb
	SU92FWF/UmBMkC+ZTsKz/HJJGthtrn8xEhQo6+IwwvbhzPDHaJWrY99ycajUbfuA8Y3bvWdocjVns
	oTpX++EHPA7Fug76IbId5TamKfvjIsJz8sEDRwRBzLr1DRiAT+OiA2z8S/QZMOlnVu8bVBkhY0WJj
	CtFZ3ScxVhCFF8wZLfWOfMd0PYswQG3IPPwS9gWj9MDKzKCzGiGuK2S19JqrfCIso35wk99o0NPlM
	qFk9Hjyb++wb0zsw2khHUfb/4Vr8/5wzq4XxMR/1WCLHZ5kxF/cjZx10zHPAhnaCm+aeFA6xQOtNt
	rtnEBOFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyLM-0000000FTlF-1FXq;
	Wed, 14 Oct 2026 12:44:28 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyLJ-0000000FTkA-2rAG;
	Wed, 14 Oct 2026 12:44:27 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 20E9C1A006F;
	Wed, 14 Oct 2026 14:44:23 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 084D91A0071;
	Wed, 14 Oct 2026 14:44:23 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 2D59A2035A;
	Wed, 14 Oct 2026 14:44:22 +0200 (CEST)
Date: Wed, 14 Oct 2026 14:44:22 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ionut Vicovan <ionut.vicovan@nxp.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH RFC v3 04/12] net: pcs: add NXP SerDes XPCS shared core
Message-ID: <as95JpawMfSSk+Pa@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com>
 <20260919-s32g_serdes-v3-4-9d68868c1e89@oss.nxp.com>
 <6aabb56e-406f-4d13-9fd8-54822202039f@bootlin.com>
 <assmUIvWMuZsp8OO@lsv051416.swis.nl-cdc01.nxp.com>
 <CALj3r0gQkUARS1e+2CGB3JsrGJ2XrzuoChfz0cWYRpK4kq1Uxg@mail.gmail.com>
 <as5EioEfZqMZhyJg@lsv051416.swis.nl-cdc01.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as5EioEfZqMZhyJg@lsv051416.swis.nl-cdc01.nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_054426_001079_E6D6DDE3 
X-CRM114-Status: GOOD (  50.00  )
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

On Tue, Oct 13, 2026 at 04:47:38PM +0200, Jan Petrous wrote:
> On Tue, Oct 13, 2026 at 03:47:58AM +0800, Coia Prant wrote:
> > Hi Jan,
> > 
> > Thanks for the pointers. A few thoughts.
> > 
> > > Yes. The S32G accessor is the same DW indirect scheme pcs-xpcs-plat
> > > implements (page into the viewport at 0xff, then the low address byte
> > > at a 4-byte stride), so there is no reason for S32G to carry its own
> > > copy of the XPCS code. The next version drops the shared core, exposes
> > > each XPCS instance as a mii_bus from the SerDes PHY driver and creates
> > > the PCS with xpcs_create_pcs_mdiodev(), much like the RK3568 glue.
> > > Details in my reply to Andrew.
> > >
> > > The part that does not fit pcs-xpcs-plat as-is is ownership, not
> > > access: the XPCS windows sit inside the SerDes subsystem register
> > > space, and their bring-up is ordered against the PCIe lane and the
> > > other XPCS instance, so the bus is registered by the SerDes PHY driver
> > > rather than by a standalone snps,dw-xpcs device. The accessor itself
> > > is a few lines; if Alex's pcs-xpcs-regmap is merged first I will use
> > > it rather than open-code another bus.
> > 
> > On the transport split: I think the cleanest path is to split the MMIO
> > accessor out into its own module, say pcs-xpcs-mmio, exporting the
> > read/write helpers. Then pcs-xpcs-plat can call into those exported
> 
> Fine with me. The S32G accessor is a few lines, so I will move it onto
> pcs-xpcs-regmap if that lands first, or onto a shared mmio helper if
> you post one. Until then it stays open-coded in the glue.
> 
> > symbols instead of open-coding the page/stride scheme, and S32G can do
> > the same for its indirect window. That way nobody carries a private
> > copy of the accessor. If that turns out to be too invasive for plat,
> > keeping a separate pcs-xpcs-plat copy is workable too, but I'd rather
> > avoid it.
> > 
> > If Alex's pcs-xpcs-regmap lands first, that's the natural place for
> > the S32G accessor; pcs-xpcs-mmio would only be needed if the regmap
> > approach doesn't fit.
> > 
> > > S32G needs the same kind of thing: skip the generic soft reset, and no
> > > EEE registers. I will start with the existing PMA-ID mechanism, since
> > > that is what TXGBE and FBNIC use today, and switch to a callback if one
> > > is agreed in the Rockchip thread. I'll Cc you on those patches.
> > 
> > On the shared-core duplication: rather than copying the whole XPCS
> > core, I'd look at how the existing users express their quirks.
> > 
> > Wangxun has a genuinely different PMA ID, so it can branch on the
> > ID before the reset path and keep the generic core untouched.
> > 
> > The older NXP devices do the opposite: they fake the PCS ID at the MDIO
> > layer so the core sees a magic value it then interprets. That leaves
> > the magic in the core and a fake ID in the glue, and it doesn't scale
> > to a third user.
> > 
> > For S32G, I'd prefer one of these two approaches:
> > 
> > - A flag in struct dw_xpcs, e.g. DW_XPCS_NO_RESET, that the glue sets
> >   and the core checks before the soft reset and EEE paths. Works when
> >   the quirk applies to a whole instance regardless of the PMA ID.
> > - A platform callback, e.g. plat->pma_config(), where the glue can
> >   return early to skip the parts it doesn't need. More flexible, but
> >   also more surface area; I'd only go there if flags aren't enough.
> > 
> > Either is better than another fake ID, because the quirk stays visible
> > at the point where it matters instead of being hidden behind a made-up
> > value in the transport layer.
> > 
> 
> Agreed on the principle. The problem is that pcs_pre_config and the
> PMA hook are reached only through the ID-keyed compat table, and S32G
> needs a pma_config (link timer, lane on MPLLA). Without a platform
> callback the ID is the only way in.
> 
> What I have for v4 is an ID-keyed entry with the two quirks as
> explicit flags in struct dw_xpcs_desc (no soft reset, no EEE), so at
> least the table says what the entry does.
> 

A follow-up with measurements, since "the glue needs to skip the soft
reset" deserved more than my word. I ran the v4 pcs-xpcs patches on an
S32G399A-RDB3 with both quirks removed, so the S32G entry went through
the generic xpcs_pre_config() soft reset and the generic EEE path.

Soft reset: it is a hardware requirement, not a preference. The SGMII
soft reset writes BMCR_RESET in MMD 31. On the in-band lane the bit
never self-clears, xpcs_poll_reset() times out after 600 ms, and from
then on every register of that XPCS reads 0x8000, BMSR and
VR_MII_DIG_STS included. The block is stuck in reset until the next
SerDes bring-up.
On the other two lanes the reset bit did clear, but the receive path
was dead afterwards: links reported up, TX counted, zero RX frames,
no ARP across either lane. Restoring only the no-soft-reset flag
brought back the reference numbers (2.35/2.32 Gbit/s at 2.5G, 941/942
at 1G, 0 failures in 36 speed changes, 10/10 down/up on each lane).
The reason is the shared combo PHY: the XPCS reset that works is
VR_MII_DIG_CTRL1.VR_RST inside the vendor sequence, with the power-good
wait and the RX reset around it, and that sequence is ordered against
the PCIe lane and the other XPCS instance, so the SerDes driver has to
own it.

EEE: VR_MII_EEE_MCTRL0/1 read as zero and ignore writes, so the generic
xpcs_config_eee() does no damage on S32G. I still want the no-EEE flag:
the registers are not implemented, and a driver should not read and
write registers it knows are not there, nor let phylink believe the PCS
configured EEE when it did not. The flag is a statement of fact about
the integration, not a workaround.

The AN-complete gate in xpcs_get_state_c37_sgmii() also ran ungated in
that test and the stale-speed race stayed fixed, so I can post it as
generic behaviour rather than behind a flag if nobody objects. It has
only been tested on S32G, though.

That leaves S32G needing three things from pcs-xpcs for 1G: skipping
the soft reset, no EEE register access, and a .pma_config for the PMA.
(2.5G will later need the PMA hook on every pcs_config, because the
lane moves between MPLLA and MPLLB with the line rate. That is why a
PMA entry point stays necessary whatever happens to the quirks.)

On the ID: I would rather not add another synthetic PCS ID either. The
Nord RFC picked the same 0x30, which makes your collision point for me.
What the core already has is the dw_xpcs_info platform data that
pcs-xpcs-plat passes for the PMA generations it cannot read from
hardware. S32G could do the same: leave the PCS ID native, it reads the
real 0x7996ced0, and declare an S32G PMA token in dw_xpcs_info, with
xpcs_identify() matching the desc on the PMA token as well. No faked
register read, and the token names what actually differs on S32G, the
PMA integration. The core change is a .pma field in struct dw_xpcs_desc
and about ten lines. If you prefer glue-set flags, the no-soft-reset and
no-EEE parts fit them directly; the .pma_config still needs the entry.

Tell me which of the two you would rather review and I will shape next
series (most likely not v4 as I have it tested and ready for send
already) accordingly.

BR.
/Jan

