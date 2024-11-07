Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF28D4337E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2qf5fuTW+J7sLHQ/IF3awJxfVmMtG7QBPA2BNMZZwU=; b=VWNVtysdozENylANfoctSJNlNE
	gjFAH46bt+PYUIsqrA4hdIIAaHNvMxMxhG/6xjLUpOLebevcckSIbPXzGHaOuqFTwksI3kEWyNswP
	iNQyaRWioOg0X4lJsLugh61Qjchc/Ao99ogIXcl+iZWJcvu6kak98tQ77KcT2trsRV5JvjINCtHCr
	v+2ZAihk0mdSLQuaLq8qVPzhuvWujwc/oYmwDSRyytqOSGgDo8hwymIq7YaM4DziHPyien58N83v1
	g8dkF72l4O44tE0iqeAbl7MsEny++PqeNstvOr6F9nGYqZ0xyaimYjVFG7vREOc9v0D6+koVNAMEr
	9v8911LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95i9-00000007hkr-2JnO;
	Thu, 07 Nov 2024 16:50:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94RT-00000007RkP-1W8O;
	Thu, 07 Nov 2024 15:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D33F6A44507;
	Thu,  7 Nov 2024 15:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6366C4CECC;
	Thu,  7 Nov 2024 15:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730993342;
	bh=i18faHWRnV4eHB93H4auKl9l5lsG8izxHR+bYJX1GZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OiZblABRlEI6/1E/4sy0X6jbZkCmR8JiTxWKaP/AjbE2aje70Q8g0RUDY9tRam6TZ
	 fqK/ngzlOCE9diDF6pl5jOWxuLhJhitbyWuZK0jk2uYYC5O/Z3NFLhB4scWBe5X2rW
	 PFnxFLlkBuK7xgiv7rZsTEvI+2cMQDM/7dUNj+s0a7sUm8OAqoGZE+C6CFnKBZVMAT
	 PR61jHJ5Z6n0f3n9eCjE3W+SZoqWWFaoyeBV44mYj6YR7Q0m8xkKK5LGP6tZkND+4h
	 kk3tBk2vJZdhxM3z7lFLZg1fced1qSjHU9JWp2nVWZCOVo0xh6WruonlmMRx2TiSQt
	 HAzrhq/G7lcyQ==
Date: Thu, 7 Nov 2024 16:28:58 +0100
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
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] PCI: mediatek-gen3: rely on clk_bulk_prepare_enable
 in mtk_pcie_en7581_power_up
Message-ID: <ZyzcuqwjqBEBMx8g@lore-desk>
References: <20241107-pcie-en7581-fixes-v1-2-af0c872323c7@kernel.org>
 <20241107151953.GA1614560@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H/ItTzle+i5kLD9o"
Content-Disposition: inline
In-Reply-To: <20241107151953.GA1614560@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_072903_546912_BBF79C8E 
X-CRM114-Status: GOOD (  18.74  )
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


--H/ItTzle+i5kLD9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Nov 07, 2024 at 02:50:54PM +0100, Lorenzo Bianconi wrote:
> > Squash clk_bulk_prepare and clk_bulk_enable in
> > clk_bulk_prepare_enable in mtk_pcie_en7581_power_up routine
>=20
> Thank you, this is much better.
>=20
> Can you add "()" after function names in subject and commit logs here
> and in other patches?

sure, I will do in v2.

Regards,
Lorenzo

>=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 14 +++-----------
> >  1 file changed, 3 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/=
controller/pcie-mediatek-gen3.c
> > index 0fac0b9fd785e463d26d29d695b923db41eef9cc..8c8c733a145634cdbfefd33=
9f4a692f25a6e24de 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -903,12 +903,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen=
3_pcie *pcie)
> >  	pm_runtime_enable(dev);
> >  	pm_runtime_get_sync(dev);
> > =20
> > -	err =3D clk_bulk_prepare(pcie->num_clks, pcie->clks);
> > -	if (err) {
> > -		dev_err(dev, "failed to prepare clock\n");
> > -		goto err_clk_prepare;
> > -	}
> > -
> >  	val =3D FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
> >  	      FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
> >  	      FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
> > @@ -921,17 +915,15 @@ static int mtk_pcie_en7581_power_up(struct mtk_ge=
n3_pcie *pcie)
> >  	      FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
> >  	writel_relaxed(val, pcie->base + PCIE_PIPE4_PIE8_REG);
> > =20
> > -	err =3D clk_bulk_enable(pcie->num_clks, pcie->clks);
> > +	err =3D clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
> >  	if (err) {
> >  		dev_err(dev, "failed to prepare clock\n");
> > -		goto err_clk_enable;
> > +		goto err_clk_init;
> >  	}
> > =20
> >  	return 0;
> > =20
> > -err_clk_enable:
> > -	clk_bulk_unprepare(pcie->num_clks, pcie->clks);
> > -err_clk_prepare:
> > +err_clk_init:
> >  	pm_runtime_put_sync(dev);
> >  	pm_runtime_disable(dev);
> >  	reset_control_assert(pcie->mac_reset);
> >=20
> > --=20
> > 2.47.0
> >=20

--H/ItTzle+i5kLD9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZyzcugAKCRA6cBh0uS2t
rHNYAP4izFeIALB2fJZjBjL5FEJFYYnPEQAtEvUU1M+XANkcNwD/bj7ZFmIGEzRe
lW3qqkFAghafQ6mO8XHHsNN0u3SqWQA=
=rPvS
-----END PGP SIGNATURE-----

--H/ItTzle+i5kLD9o--

