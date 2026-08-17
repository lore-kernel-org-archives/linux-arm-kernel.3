Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5F1C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBMyNpNHwmcAJxxbYNFl5cMlaifHFY+zDcFEk3Lvf7U=; b=Pfu8ws3ycxTcxCTeXi+O9/406B
	vZdMwzXmY8/tbVFuXULe/nAay2LzlJ95IoQqkdLFEPFkBqfnD2W865fo8ibVwtv7umex6hGX0fgs4
	AtMatKvzwPGzWn0Qp7PTMPOY4Kbz7yDKdJgCdrNdUjmNv2QNBJ9rl9cdJz1S5JiR66MJa1B0jb1be
	uC40oiLEnYANLy/zh3H7dO/8LLUZd87lUX3VNrhMIkRbPACI851TzsibwX/Gfcas4tGlUjkLA8grX
	eu1FEVTCGXnORmkCOoEc2jmXAktPbgQV2X4CL31d9gO7KC2QS7ApymhZ/8luWpbRegIBkfYzwUPHt
	l/+rgJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxMN-00000006DfS-0j0H;
	Mon, 17 Aug 2026 13:26:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxMM-00000006DfE-13Ly
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:26:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A85B0600AE;
	Mon, 17 Aug 2026 13:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB0C1F000E9;
	Mon, 17 Aug 2026 13:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786973197;
	bh=fBMyNpNHwmcAJxxbYNFl5cMlaifHFY+zDcFEk3Lvf7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SYMubkHwKG+UZVAKQMcOhpsGVdwtveItAV4u/nlqT/SfguDWICr2wv1tHV0yDWJvg
	 FVv0uhobGOneDZtj5bIfQ6NNkd2s7LRGQMy4eHgcRzRuEcqdq05kmiAvL73Iw7gB9s
	 ZHUfBfh763e+GBH5Z/M/+wziXto0s/kJU7cvBPfNKdCBXyAqJRkSJFd9WepsOiqZ2r
	 nTBVcC9mU4BKEMd5mmzDOZ7G14tAJeLoSPHt64rbTbAjZ6UEHcNNOm9u99Yl7TKbMq
	 2HlPlv7E+PCcodB17XNTqC7D+GIBCLZc1rlz+Grzv9fN/UI4vLEgTGA2ci+2ABHEAS
	 8EQ5QX8ZQoI5Q==
Date: Mon, 17 Aug 2026 15:26:34 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Kevin Xie <kevin.xie@starfivetech.com>, Aksh Garg <a-garg7@ti.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>, 
	Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: Re: [PATCH v10 3/5] PCI: tegra: Add Tegra264 support
Message-ID: <aoML05AL1RD-B5sh@orome>
References: <20260814-tegra264-pcie-v10-0-05d08c592b05@nvidia.com>
 <20260814-tegra264-pcie-v10-3-05d08c592b05@nvidia.com>
 <ajpntb2f62mpevhofuv2mdpgsktzp6gwcvu2euka7qu2n3f7at@fp3q5fowyvgg>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nynx6c75mt7damvo"
Content-Disposition: inline
In-Reply-To: <ajpntb2f62mpevhofuv2mdpgsktzp6gwcvu2euka7qu2n3f7at@fp3q5fowyvgg>
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


--nynx6c75mt7damvo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 3/5] PCI: tegra: Add Tegra264 support
MIME-Version: 1.0

On Sat, Aug 15, 2026 at 08:52:26AM +0200, Manivannan Sadhasivam wrote:
> On Fri, Aug 14, 2026 at 05:38:57PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Add a driver for the PCIe controller found on NVIDIA Tegra264 SoCs. The
> > driver is very small, with its main purpose being to set up the address
> > translation registers and then creating a standard PCI host using ECAM.
> >=20
> > Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> This s-o-b chain is cobbled.
>=20
> 1. If Thierry is the Author, and if Manikanda co-developed the patch, the=
n there
> should be a Co-developed-by tag for Manikanda.
>=20
> 2. If Manikanda is the author of this patch and if Thierry is just sendin=
g it
> along, then the authorship belongs to Manikanda.
>=20
> I've applied this patch based on (1):
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=3Dc=
ontroller/tegra264&id=3Dd56131f7a401841c09b6611402a8d2e795da3a6b
>=20
> If that is not correct, please let me know, I'll ammend it.

That looks fine to me. Yes, I should've added the Co-developed-by tag
=66rom the start.

Thanks!
Thierry

--nynx6c75mt7damvo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqDDAoACgkQ3SOs138+
s6HYNQ/+MRVadAWWZZEyFF3tB78b26u4o5CGugQ9OntgZaF1GiPQJGTDsK9bfaj7
A89d3NQN7jW7yfIp0S2l+3meGtQZ15IlBNpyldEsrrOduvOoNKePIJD8WAjT8nBr
7mJ/MjSmDfsEYrnNzey51AsdtfFtY/I4pYV4Y5F5+/BzOw7FXPUaa3Tp5zyaCpg+
iODaUeUZFCLHHiB36chlJImWteMbX0ZWXCVkyC7IpWhaneTTf7E7fuhSxBwxksXK
m7iz6tGrtWO+3I2B6X3RFIN/hDU9uDoEuE+ioolPTPOTE4wZAfGw+vDbR8TpBp7z
WMPvGUjfZy65Zokyk7QAPkwX5Lx6rs1KwITVK9sRdvNpIK1T6eGvZkY3CQx7Sma+
ji5l+YzHlimaPf4GdbiSsDiTzoi2rRU3bUYs5e0VSjYy3OXjTFbKwEZZTitWFOEJ
j1Xo+cJd/yHKOH7/jajGT1oRVAh/4iopWNnfVs/oOqKlqkRJCsvr+CvXuoKeGzv+
0qSLpLo7GNXZfu1nOQmsO7U7G7g7Op662UBwvSSd4uuVsfZTlzS02Vffcg6Tyy1M
FplFJYeq99XM25g02rpRzg0a/c4HoAVSS73jtYJT5ff4+qSgsTZcsTFRW9k4xe1z
vMhAcDy/avLS/bEv1fU7lwhNQRKhzY81jAFO9WGFoNU137Bxyy0=
=lgnR
-----END PGP SIGNATURE-----

--nynx6c75mt7damvo--

