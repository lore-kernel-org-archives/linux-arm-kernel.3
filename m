Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89AED4920C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 11:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCCwVJYCrYgB+Uo67ZqaQ7QjK2g+PJW9JRCPC5hAo4Q=; b=C/b3tJn1/e4uA+cI0/13h9jQVQ
	mPR9AZgJuL3Cq4PquwW1z7hQANuSWMULW6m5FgpDsENtg8jnC29g78B5pWvBseu7dS4196zdimohL
	eLHKQvG+uG5+ecMfBFcXCFl1KYFdvYGE0WmD1oJtKrDnpwWu7MV0nzJvR30vUeLILwR59cghZm486
	SvqViLkyJqouYaRflAVfGsrwBp3wp1ZyOgvNEWfwJ4smqBLEFWq1TfDOmRB4KWQj7WtSfoqwJIJMP
	/1j4EEzGVu04PaRggS/mab0ACeO5zNqnG1l7fiAO1x90C7ZGOKJoTfhDdes2oVrmIf/HVY2GWNJM+
	DjTEw0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzX4-00000009BlE-2kkq;
	Mon, 18 Nov 2024 11:03:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzVz-00000009BZg-1R4G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 11:02:05 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tCzVd-00036U-Hw; Mon, 18 Nov 2024 12:01:33 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tCzVb-001Ndl-2z;
	Mon, 18 Nov 2024 12:01:31 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tCzVb-0005lO-2k;
	Mon, 18 Nov 2024 12:01:31 +0100
Message-ID: <1fb3166c1f520a57c19bd3103b4585eee1e57fec.camel@pengutronix.de>
Subject: Re: [PATCH v4 3/6] PCI: mediatek-gen3: Move reset/assert callbacks
 in .power_up()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>,  Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org
Date: Mon, 18 Nov 2024 12:01:31 +0100
In-Reply-To: <ZzsC_hW-w6WSMYSO@lore-desk>
References: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
	 <20241118-pcie-en7581-fixes-v4-3-24bb61703ad7@kernel.org>
	 <2d7e1e5e09babb468199ac44520683fcb87d697c.camel@pengutronix.de>
	 <ZzsC_hW-w6WSMYSO@lore-desk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_030155_371232_B6E1722B 
X-CRM114-Status: GOOD (  25.48  )
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

On Mo, 2024-11-18 at 10:03 +0100, Lorenzo Bianconi wrote:
> On Nov 18, Philipp Zabel wrote:
> > On Mo, 2024-11-18 at 09:04 +0100, Lorenzo Bianconi wrote:
> > > In order to make the code more readable, the reset_control_bulk_asser=
t()
> > > for PHY reset lines is moved to make it pair with
> > > reset_control_bulk_deassert() in mtk_pcie_power_up() and
> > > mtk_pcie_en7581_power_up(). The same change is done for
> > > reset_control_assert() used to assert MAC reset line.
> > >=20
> > > Introduce PCIE_MTK_RESET_TIME_US macro for the time needed to
> > > complete PCIe reset on MediaTek controller.
> > >=20
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > ---
> > >  drivers/pci/controller/pcie-mediatek-gen3.c | 27 +++++++++++++++++++=
--------
> > >  1 file changed, 19 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pc=
i/controller/pcie-mediatek-gen3.c
> > > index 3cfcb45d31508142d28d338ff213f70de9b4e608..2b80edd4462ad4e9f2a5d=
192db7f99307113eb8a 100644
> > > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > @@ -125,6 +125,8 @@
> > > =20
> > >  #define MAX_NUM_PHY_RESETS		3
> > > =20
> > > +#define PCIE_MTK_RESET_TIME_US		10
> > > +
> > >  /* Time in ms needed to complete PCIe reset on EN7581 SoC */
> > >  #define PCIE_EN7581_RESET_TIME_MS	100
> > > =20
> > > @@ -912,6 +914,14 @@ static int mtk_pcie_en7581_power_up(struct mtk_g=
en3_pcie *pcie)
> > >  	int err;
> > >  	u32 val;
> > > =20
> > > +	/*
> > > +	 * The controller may have been left out of reset by the bootloader
> > > +	 * so make sure that we get a clean start by asserting resets here.
> > > +	 */
> > > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> > > +				  pcie->phy_resets);
> > > +	reset_control_assert(pcie->mac_reset);
> > > +
> > >  	/*
> > >  	 * Wait for the time needed to complete the bulk assert in
> > >  	 * mtk_pcie_setup for EN7581 SoC.
> >=20
> > This comment is not correct anymore.
>=20
> I agree naming is hard, but I guess we can assume with 'bulk' we refer to=
 both
> phy and mac reset (similar to what we have in mtk_pcie_power_up()),
> what do you think?

My point is that the referenced (bulk) assert isn't in mtk_pcie_setup()
anymore - it was just moved right above this comment.

I wonder why that delay is required at all, though. Does the reset
controller driver return from reset_control_ops::assert before the
reset line to the PCI controller is asserted?

regards
Philipp

