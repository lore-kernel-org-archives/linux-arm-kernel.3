Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A3EE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 11:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHJmAXoM/mw0zc7WUW0C0TOM9FpAO9F2F11lm4GuV6w=; b=UZLY52Z6bPkxQ8kj5Hgv4p4jv6
	Lt20Yyn76K58MIPOfi5UJYLujnfMNR+1Icb3B5NHAxw95Ca0Rl4yM6lxsbDy9FmZtHi3QBt3BPQDl
	GmHBYxiYj+Sj0QqvZ+yh0M68JuXMH/PhOJGgQgRsp2fvud1x7990Y5Jz5f7xDB34Xas2CHjiSZrra
	uQE3PsghEj6KBrvZJQ7qwfrptZz8tHEZlvsRHhX3/H9mGKmPUybYJwPO1+vVYglFqRqD24hKd3pdc
	FItLRq0orcP3bseodRCn7hDNG8MgU6vmd5se/d+n933x6f8A4ZIEFnVQqT85IaK6s7QaJRHg9zNc1
	kdJ8I3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJJN-0000000AFKC-3bZ1;
	Thu, 02 Jan 2025 11:24:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJGf-0000000AEnc-00x7;
	Thu, 02 Jan 2025 11:21:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8748C5C5B8B;
	Thu,  2 Jan 2025 11:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D572C4CEDC;
	Thu,  2 Jan 2025 11:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735816891;
	bh=W65URpuT66zpoom/bKkmJ99ASzFyUtgK5KkXVL/Tpws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lyF0xLqAH9UBeqQHJKzMr9dUKJT9Yy+Rfxt9CgZ/VrhfDqUXJuM7O0Eegw6kJi2dQ
	 132j5jGXlln0l+MZMGwwJh6OR1Z462jmAeXhCE3t2VQTJi0ug5ae3fgJ7zgnfx8qem
	 tsQbMnEC+ZaJGbYm8LZcC/pg2Ab7+sWtt9p3XR8D9ZTySwXgPZHdJaivFpFiY9Rdp7
	 pTP8fA8FqBQtbCs7NKlmV/6ZHIZuhXc9HtpoO18bZbPhXKfGySl5OnQaIsz7HOEyUQ
	 WeXwdo0Sg5FV5pp7JOn67Vr5Sh/DpAhNw+pdJsfUz8ZQsCYfrbg6t0b1Af6pMlZ7mb
	 2qIXSImj7uGxA==
Date: Thu, 2 Jan 2025 12:21:28 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 1/6] PCI: mediatek-gen3: Add missing
 reset_control_deassert() for mac_rst in mtk_pcie_en7581_power_up()
Message-ID: <Z3Z2uOCUGX7uAaae@lore-desk>
References: <20241130-pcie-en7581-fixes-v5-1-dbffe41566b3@kernel.org>
 <20241230175754.GA3958277@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KseZ4mXYs1K8AxEo"
Content-Disposition: inline
In-Reply-To: <20241230175754.GA3958277@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_032133_129325_7596A132 
X-CRM114-Status: GOOD (  25.02  )
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


--KseZ4mXYs1K8AxEo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, Nov 30, 2024 at 12:20:10AM +0100, Lorenzo Bianconi wrote:
> > Even if this is not a real issue since Airoha EN7581 SoC does not requi=
re
> > the mac reset line, add missing reset_control_deassert() for mac reset
> > line in mtk_pcie_en7581_power_up() callback.

Hi Bjorn,

since this patch is already in Krzysztof's controller/mediatek branch, do y=
ou
want to repost the full series or just incremental changes?

>=20
> s/mac/MAC/ in English text since "mac" is an acronym, not a real word

ack, I will fix it.

>=20
> This doesn't really say why we need this patch.
>=20
> This adds both assert and deassert, so it doesn't really look like
> adding a *missing* deassert.
>=20
> On EN7581, is mac_reset optional or always absent?

AFAIK mac_reset is never used on EN7581. We added it since we were discussi=
ng in
[0] to move the reset asssert/deassert callbacks in the same routine (in the
original codeabse we have reset_control_assert(pcie->mac_reset) in mtk_pcie=
_setup()
and reset_control_deassert(pcie->mac_reset) in mtk_pcie_power_up()).
I think we can remove mac_reset support at all for EN7581.  What do you pre=
fer?

Regards,
Lorenzo

[0] https://lore.kernel.org/linux-pci/20241106233123.GA1580663@bhelgaas/

>=20
> If mac_reset is always absent for EN7581, why add this patch at all?
> If it's optional, say so.
>=20
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/=
controller/pcie-mediatek-gen3.c
> > index 64ef8ff71b0357b9bf9ad8484095b7aa60c22271..4d1c797a32c236faf79428e=
b8a83708e9c4f21d8 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -942,6 +942,9 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3=
_pcie *pcie)
> >  	 */
> >  	mdelay(PCIE_EN7581_RESET_TIME_MS);
> > =20
> > +	/* MAC power on and enable transaction layer clocks */
> > +	reset_control_deassert(pcie->mac_reset);
> > +
> >  	pm_runtime_enable(dev);
> >  	pm_runtime_get_sync(dev);
> > =20
> > @@ -976,6 +979,7 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3=
_pcie *pcie)
> >  err_clk_prepare:
> >  	pm_runtime_put_sync(dev);
> >  	pm_runtime_disable(dev);
> > +	reset_control_assert(pcie->mac_reset);
> >  	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy=
_resets);
> >  err_phy_deassert:
> >  	phy_power_off(pcie->phy);
> >=20
> > --=20
> > 2.47.0
> >=20

--KseZ4mXYs1K8AxEo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ3Z2uAAKCRA6cBh0uS2t
rNLuAP9aIvgBoSTUsdbM74sz/9xj2EI/jesibuEXgdwRznaErwD+OH6Lbxg9oaqN
0C1Pv2EwtriUpAMpokB0n1IJ9tcZhQw=
=9erM
-----END PGP SIGNATURE-----

--KseZ4mXYs1K8AxEo--

