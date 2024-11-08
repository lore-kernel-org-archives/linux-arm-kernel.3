Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7A2D6406B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 17:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYZrDcE7I1HFzbqCHDXhx+d8qBGIhXOz/Pay6a/54ts=; b=mhpGgHOOkieGPDWtqrwihuV0kA
	6eLGZ2IvnLIdY11wCLnqbUVL44djt2r67KK5R+Z3t0FVGzBhQoGa0ELBgYlGYKwgjXGWWrL/cKrzv
	f/t98PmW3PZA/O6Sk8jG/tQSepNDJ7FYTJOs50RVkI6laWHmeemfrCU5w9PI/z5KbbthYKb8RbFxq
	FzzmRgsDeXtO2dDRTG9zKAsU/hIbr1CnlcfLKOXMBwhAFQ4eMAqDgBRuXDohVVQg8DF9xCfCVrT6K
	DHq447JrnfVSnF6jMwSiiUzmze5n9W1tY/tDaUXwgoj0r+DlST1GHGFkTJOx8wDQ2OB+vwaH1+SDX
	oL3IPLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Skd-0000000BNyt-0ZyA;
	Fri, 08 Nov 2024 17:26:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SiB-0000000BNUz-18yQ;
	Fri, 08 Nov 2024 17:23:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E50695C5B33;
	Fri,  8 Nov 2024 17:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54ABC4CECD;
	Fri,  8 Nov 2024 17:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731086634;
	bh=6zKQlRn0Es/TKeDFmAQ35oAz8kwkdvS9qyL+rTAPFhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QBD6MBtKY3GZVRw49enM8QsMZfEiWtuHqSv4AceulD2+HrEJLAnsaI9WMrCl3EB3V
	 6CR+wE51/iuWuBHlFdhnnyOZDRdI4zbh/CW7FNXbAA50ThB+C/CYb2Oaq3VlnawrTK
	 xmrSF2ubuhPAGd7Ks6FgMe2cwTE4r+DJu3FKwrPR8k/oNqfIFUnqMCz+z8k1T1cXzn
	 /IdBdqr6c4JFV+dsm9YywGm64fpJJmb5po6XeRBwYZeRoQhadf9bDuxoEdQm5Bc6CY
	 lXSLehNuVh5RhS/9E136m6EZZJxzMBBlDL2azR48I/LCxgc7OTY2+TZXsQCy+WkvGZ
	 GAiFiZ88dKNSQ==
Date: Fri, 8 Nov 2024 18:23:50 +0100
From: "lorenzo@kernel.org" <lorenzo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 3/3] PCI: mediatek-gen3: Move reset/assert callbacks in
 .power_up()
Message-ID: <Zy5JJuAsxPqEos4I@lore-desk>
References: <Zy5EjY_oQaRbb5MY@lore-desk>
 <20241108171710.GA1667022@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mpRtWSJTYmJLObDx"
Content-Disposition: inline
In-Reply-To: <20241108171710.GA1667022@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_092355_428351_2424A8DB 
X-CRM114-Status: GOOD (  27.33  )
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


--mpRtWSJTYmJLObDx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 08, Bjorn Helgaas wrote:
> On Fri, Nov 08, 2024 at 06:04:13PM +0100, lorenzo@kernel.org wrote:
> > > On Fri, Nov 08, 2024 at 09:39:41AM +0100, lorenzo@kernel.org wrote:
> > > > > On Thu, 2024-11-07 at 17:08 +0100, Lorenzo Bianconi wrote:
> > > > > > > On Thu, Nov 07, 2024 at 02:50:55PM +0100, Lorenzo Bianconi wr=
ote:
> > > > > > > > In order to make the code more readable, move phy and mac
> > > > > > > > reset lines assert/de-assert configuration in .power_up
> > > > > > > > callback (mtk_pcie_en7581_power_up/mtk_pcie_power_up).
> > >=20
> > > > > > > > +	/*
> > > > > > > > +	 * The controller may have been left out of reset by the
> > > > > > > > bootloader
> > > > > > > > +	 * so make sure that we get a clean start by asserting re=
sets
> > > > > > > > here.
> > > > > > > > +	 */
> > > > > > > > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_reset=
s,
> > > > > > > > +				  pcie->phy_resets);
> > > > > > > > +	reset_control_assert(pcie->mac_reset);
> > > > > > > > +	usleep_range(10, 20);
> > > > > > >=20
> > > > > > > Unrelated to this patch, but since you're moving it, do you
> > > > > > > know what this delay is for?  Can we add a #define and a spec
> > > > > > > citation for it?
> > > > > >=20
> > > > > > I am not sure about it, this was already there.  @Jianjun Wang:
> > > > > > any input on it?
> > > > >=20
> > > > > This delay is used to ensure the reset is effective. A delay of
> > > > > 10us should be sufficient in this scenario.
> > > >=20
> > > > ack, so we can introduce a marco like:
> > > >=20
> > > > #define PCIE_RESET_TIME_US	10
> > > > ...
> > > >=20
> > > > usleep_range(PCIE_RESET_TIME_US, 2 * PCIE_RESET_TIME_US);
> > >=20
> > > Unless this corresponds to a value specified by the PCIe base spec
> > > or CEM spec, this macro should be internal to
> > > pcie-mediatek-gen3.c.
> >=20
> > My plan is to add it in pcie-mediatek-gen3.c. Do you think
> > PCIE_RESET_TIME_US is too generic?
>=20
> It's generic, but so are most of the other #defines in
> pcie-mediatek-gen3.c, so I'd follow suit.
>=20
> Connect it to language in the MediaTek spec if possible, i.e., if the
> spec names this parameter, try to use the same name.

unfortunately I do not have any mediatek spec documentation available.

@Jianjun Wang: is PCIE_RESET_TIME_US fine for you or according to the avail=
able
documentation?

Regards,
Lorenzo

--mpRtWSJTYmJLObDx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZy5JJgAKCRA6cBh0uS2t
rJXaAQC/Sv0ltwvrKgZw6OyUcbyAk4/sBfF7IaiTfIisVDVn7gD8DwX7b6kQV/DZ
fdWM8kWpF/9QWlKmCpHxYbkyemdxqw4=
=M7P9
-----END PGP SIGNATURE-----

--mpRtWSJTYmJLObDx--

