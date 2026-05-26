Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2E1CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 08:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydnICT1XC8Vp9E9v1sQrxCC0lGHYdxwXITHGPqNpjR0=; b=2b5mp1WNp/w9R0zGfvYI1pY9bQ
	0vDgeNA9a2hQmmwA/4Ymjr55xU5gojyt5BXW78wTb0TzSwRL8HfoCCLmU8iMfvwseGTD75xA6m1Vf
	SlE9l/ePBPuLgczg5FFrkdYj+t9gzOnvO7CE6ohxQAQk1RZEfKTGb4sIAGrHHaEIRBZTifYAmC2g/
	vCkLf+seWgadLAuBp46cCvDnETqC9dHZnMS2U5uPoyDbDH8XGtm/nyiiqeBLqAin8CaGE1mJbRiFX
	J3K5kvChb5nUvMY6sTpCD1iF/Taat1FhsXGcVjUL5Lo8h2ZzrBo2gGCNyQdz1BFuXPPLadwxAgJ4+
	wHUCUJrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnNN-00000001PI5-3Vms;
	Tue, 26 May 2026 08:43:01 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnNL-00000001PHO-2gAw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 08:43:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4905e190c71so21273625e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 01:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779784977; x=1780389777; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ydnICT1XC8Vp9E9v1sQrxCC0lGHYdxwXITHGPqNpjR0=;
        b=S8HO5Z5erLcufsXSy5jLtjJBjQ0cGX4brt0DvpHitpS2d5MJfPb4ZwDhm7tC7XRJS5
         4/JEVM5arJehqNKxydxnh/KyqRBtYrX9ruvEe0Eor9jebl5UdVmPwR4E8vqC5vpI1f4j
         pROy30/FfU9r/Gkv5Gd8N1vT67P6K/TpBteyvmijax47EzWG2DGV4RQf1s3Z8SXiWz95
         5Bc6svaUlbpSeuaia1t2b5r7TuA283MfD9wdZ1clMDJ5rKwquyu7lqHMXN99nqf2nkag
         L7b0ErkwMIapSIctU5v0p4rK4sGyb19Z4sKPv9PGqpZpzjtB9etOSO7nl8QiA+t/BwyJ
         frhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779784977; x=1780389777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydnICT1XC8Vp9E9v1sQrxCC0lGHYdxwXITHGPqNpjR0=;
        b=XW6RY8kdvZgYByjxn3PEyuQpj8TpWwXZCe4UHS/VIxbSC6GJkAtxoABZrodAYkiPMn
         YMHhB3FIOCSek80h3kbcMHvtZCCuWLbNnqgHPpvdJzcFKy7vGkFtxqHA2d2EdD9fSEwx
         V7lkFZa3pNI389F9ifqHaqRh540hk7BBoBnpaOkIbwl5qYJR8qLxhxnIb1jwjdv6qGaE
         Mb6PQ91HCbBCYZc6gZIDT+sztqiOhzme4L2Jo76HC9X6MDwmvrl2EWhTtTV2U/GiwyjC
         PEDzKvg/IXtb0hbavvV4t0XjhM6UbjRpfRt+bZKNurx7dOrHizr5+DDEWs9Yj1SFIEIv
         YFuQ==
X-Forwarded-Encrypted: i=1; AFNElJ98B8Qa/NV2GQqwTHVFWTQ5/oA63NtDdSAW/pAKXHl8RLVRP1nMblPKFekkxHSellnJmFeuEkC+ELm7v+nvy0nJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyFRbpOQrN1/nMVgTIMntxosOn0cD6iZdn6yyeZgdC0C0LW/YBz
	5T4OYoPcPpTzsW6W2N4qstoYzigc13/4Q8tfdiAzwNnD0Hx5VZI/VncnIgqKzQ==
X-Gm-Gg: Acq92OHiysXm6w1ep+mFxwNuN/WoStsSuELydTpwwms1R2fqWnu81sjItjhJ1XBTlxX
	mXrebw6jOw3QpgXZaxZ26C2jnIS2a41ba+bkFp0n+QL0e+Ljl/zhVQ5yGpiiAs45gCpUr2phQ9h
	EfaLYW2PnydAS5qOpcsJCRCipLZQDH2cJKC66idS6dnd0+Uf1EYg/SB8X7KdhzrUd5NdMPK0ltW
	98MqwqvqJWToynHbLgO7ZKxpwTcWEkaP6BW79Og9oZRFFlgk5OSvx3VCzoD25gV8L/dpXd+tqmp
	1jrO5D1QvuNTagIxChDMPKbA4/T2Z10XhiebmE0/f75rIus8St3bLB3EntWgYmPtDtb8eVEROMR
	uXWF0KWG3aqLhbdn8r1aaRB+xDdDXaxXB1FeNKzgCr6PbYyrmG1qFCf+xceUXIredSQYdQE2zOL
	2fEPpvLYjQGLuwnmG7UBojVKLtRykWvpdfhO2a+o/Zl3YALyVmNuXV6roJog/l45WLuUEe+bP04
	U52rQaw5DAkEQ==
X-Received: by 2002:a05:600c:6303:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-490426d7025mr293058365e9.22.1779784976851;
        Tue, 26 May 2026 01:42:56 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm325360665e9.9.2026.05.26.01.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:42:54 -0700 (PDT)
Date: Tue, 26 May 2026 10:42:52 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Kevin Xie <kevin.xie@starfivetech.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>, 
	Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: Re: [PATCH v4 3/4] PCI: tegra: Add Tegra264 support
Message-ID: <ahVbq96MYmhIngcP@orome>
References: <20260402-tegra264-pcie-v4-0-21e2e19987e8@nvidia.com>
 <20260402-tegra264-pcie-v4-3-21e2e19987e8@nvidia.com>
 <iaoee5r5e2w52fap7ex23wdikbuvpjpesinedgjkehsedszhzo@64yoo2avmxle>
 <adTAVYEzfD9FQl8N@orome>
 <ukeelrtmjgxxwlkkzsojygzo6us5ijshis66a4x2a44hg4bw25@hggglahvrajy>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zyj365btmhllqxkn"
Content-Disposition: inline
In-Reply-To: <ukeelrtmjgxxwlkkzsojygzo6us5ijshis66a4x2a44hg4bw25@hggglahvrajy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_014259_715762_4BB4995B 
X-CRM114-Status: GOOD (  51.28  )
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


--zyj365btmhllqxkn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 3/4] PCI: tegra: Add Tegra264 support
MIME-Version: 1.0

On Fri, Apr 10, 2026 at 10:04:20PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Apr 07, 2026 at 11:38:28AM +0200, Thierry Reding wrote:
> > On Thu, Apr 02, 2026 at 11:02:02PM +0530, Manivannan Sadhasivam wrote:
> > > On Thu, Apr 02, 2026 at 04:27:37PM +0200, Thierry Reding wrote:
[...]
> > > > +	depends on ARCH_TEGRA || COMPILE_TEST
> > > > +	depends on PCI_MSI
> > >=20
> > > Why?
> >=20
> > I suppose it's not necessary in the sense of it being a build
> > dependency. At runtime, however, the root complex is not useful if PCI
> > MSI is not enabled. We can drop this dependency and rely on .config to
> > have it enabled as needed.
> >=20
>=20
> Yes. I think the rationale is to depend on the symbols that the driver ne=
eds for
> build dependency.

Done.

[...]
> > > > +						  GPIOD_IN);
> > > > +	if (IS_ERR(pcie->wake_gpio))
> > > > +		return PTR_ERR(pcie->wake_gpio);
> > > > +
> > > > +	if (pcie->wake_gpio) {
> > >=20
> > > Since you are bailing out above, you don't need this check.
> >=20
> > I think we still want to have this check to handle the case of optional
> > wake GPIOs. Not all controllers may have this wired up and
> > devm_gpiod_get_optional() will return NULL (not an ERR_PTR()-encoded
> > error) if the wake-gpios property is missing.
> >=20
>=20
> Ok. In that case you can just bail out:
> 	if (!pcie->wake_gpio)
> 		return 0;

Done.

[...]
> > > > +	bw =3D width * (PCIE_SPEED2MBS_ENC(speed) / BITS_PER_BYTE);
> > > > +	value =3D MBps_to_icc(bw);
> > >=20
> > > So this becomes, 'width * (PCIE_SPEED2MBS_ENC(speed) / 8) * 1000 / 8'=
=2E But don't
> > > you want, 'width * (PCIE_SPEED2MBS_ENC(speed)) * 1000 / 8'?
> >=20
> > This is M*B*ps_to_icc(), not M*b*ps_to_icc(), so we do in fact get the
> > latter. I almost fell for this as well because I got confused by some of
> > these macros being all-caps and other times the case actually mattering.
> >=20
>=20
> Oops, I was misleaded too. But you can simply do:
> 	bw =3D Mbps_to_icc(width * PCIE_SPEED2MBS_ENC(speed));
>=20
> > > > +	err =3D icc_set_bw(pcie->icc_path, bw, bw);
>=20
> And here you were setting the MBps, not Kbps.

Done.

> > > > +	if (err < 0)
> > > > +		dev_err(pcie->dev,
> > > > +			"failed to request bandwidth (%u MBps): %pe\n",
> > > > +			bw, ERR_PTR(err));
> > >=20
> > > So you don't want to error out if this fails?
> >=20
> > No. This is not a fatal error and the system will continue to work,
> > albeit perhaps at suboptimal performance. Given that Ethernet and mass
> > storage are connected to these, a failure to set the bandwidth and
> > erroring out here may leave the system unusable, but continuing on would
> > let the system boot and update firmware, kernel or whatever to recover.
> >=20
> > I'll add a comment explaining this.
> >=20
>=20
> Yeah, that'll help.

Done.

[...]
> > > s/link/controller or endpoint?
> >=20
> > This controls the PERST# signal, so I guess "endpoint" would be more
> > correct.
> >=20
>=20
> Yes!

Done.

[...]
> > > > +	if (!pcie->link_up)
> > > > +		goto free;
> > >=20
> > > goto free_ecam;
> >=20
> > It's not clear to me, but are you suggesting to rename the existing
> > "free" label to "free_ecam"? I can do that.
> >=20
>=20
> Yeah, I was just asking for a rename.

Done.

[...]
> > > > +static int tegra264_pcie_resume_noirq(struct device *dev)
> > > > +{
> > > > +	struct tegra264_pcie *pcie =3D dev_get_drvdata(dev);
> > > > +	int err;
> > > > +
> > > > +	if (pcie->wake_gpio && device_may_wakeup(dev)) {
> > > > +		err =3D disable_irq_wake(pcie->wake_irq);
> > > > +		if (err < 0)
> > > > +			dev_err(dev, "failed to disable wake IRQ: %pe\n",
> > > > +				ERR_PTR(err));
> > > > +	}
> > > > +
> > > > +	if (pcie->link_up =3D=3D false)
> > > > +		return 0;
> > > > +
> > > > +	tegra264_pcie_init(pcie);
> > > > +
> > >=20
> > > Why do you need init() here without deinit() in tegra264_pcie_suspend=
_noirq()?
> >=20
> > That's because when we come out of suspend the link may have gone down
> > again, so we need to take the endpoint out of reset to retrigger the
> > link training. I think we could possibly explicitly clear that PERST_O_N
> > bit in the PERST_CONTROL register in a new tegra264_pcie_deinit() to
> > mirror what tegra264_pcie_init() does, but it's automatically done by
> > firmware anyway, so not needed.
> >=20
>=20
> Hmm, so firmware asserts PERST# at the end of suspend? It is not clear to=
 me why
> it is doing so. But for symmetry I'd like to do it in tegra264_pcie_deini=
t().

Done.

> Also, I'm not certain about the 'pcie->link_up' check here. If it is 'fal=
se',
> then probe() should've failed. So why do you need the check here anyway?
>=20
> Maybe you should get rid of this check and return the link status from
> tegra264_pcie_init() directly?

We specifically don't want to fail the probe for this when the link is
not there because we want to tighly control the power mode when the link
is not up. We also need to keep the link alive for the case where it can
be hotplug capable.

I've added a new tegra264_pcie_deinit() function to clear that PERST_O_N
bit explicitly, but I've kept the link_up flag.

Thanks,
Thierry

--zyj365btmhllqxkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoVXQgACgkQ3SOs138+
s6GQqA/+KSnsckn3+QROPSYwl6WFhBwH/d766AWMTz1MGrQhNGuXXph5WZDZlNHq
qDbOjvCc0NtpXT5MDRWoBJYWiuzqHwgqOrsWprV2Vyb1omZHV8pWgJwDVDFOez0J
FKTX96dA+6vwIyFfUb+7H4Uv2F6yeG11pBHMmZD/EWmXWDGUMp5u9jSCvh1sHenC
c4hLaL4SozZnTnvtZlxTE+hw8OQ48YU912lY3SzAbLKy/f4wtgYJMwFv8rkrT19s
n8tZsOaqjCJaLl4/ugYCSusB29JlMwFdW0tn5pvX3zivBELigovK+3IX6a45TKHE
cPfWT7tk2AxpDyGBpV6U7OCwQKvIcsybni3ezlk6uEThZMbUyyEmA3tQ7lbMj6gA
kr6VLCSiYZmKUIVHtSw3Lj1v3XsuTomcSn4hgsb2sFFQwWiIAO2B+JCbexeY1Ljs
mwaM9we7rAAFXR15OELuuqFxobE/SlcWvLKUI99wfumNaKnQskBtnVYnIIxGmhgj
bPQCesXH3pb08C8XZcFDF/2aqD4myzgldJcz09pu+6y0pqREz91HQ/YsUpRjZgKp
i7OYSOyo8nb2kN9GDrIUWTf7wOXIWppJrAuWqyiwOjnm/dV7L9si4iPbV57Z2its
YS3B1Stbq3LJJABBKpFp04HTbOnxCk2Mg80CNLAnuV/JqdPCfrY=
=WV2r
-----END PGP SIGNATURE-----

--zyj365btmhllqxkn--

