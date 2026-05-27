Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FD2CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 08:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXP90BLkmwM022fcUvwY7xPlmUwoYsB+/2erQUJ8WqM=; b=vnvuYeSTp8A73Tia52wcoHyKTb
	E9xldZb3r5+5qfEhRbRhq6RuEGSBIrp8BCli9GCDflGtgwvg85C61D0uSmb9U9YKNdRS2Mosu58z2
	2g6nXT21/7sfWK33MLYTiOK9xvPkmrw+y3FYAOT2ZrvM1c7KMTYZgsZsehjyyYj85LOvTaOEXUndD
	jjwly+Lfbok951qwg87DyS5mudH/LZ9PBv4Mv/fZiApZYVrBhhRXYh6cvHFKFdbniIutWp7H+eLBE
	N8ZpjzWOAprJYRC8lE41mrMoiX5eYh/Q7OpmZMNDHfxmxRn4expMbcKh9Rz3K6oxT+PG8gkIcpfYu
	uPOl2LEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9dM-00000003Xqt-090b;
	Wed, 27 May 2026 08:29:00 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9dK-00000003XqX-10QC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 08:28:59 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so8804246f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 01:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779870536; x=1780475336; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RXP90BLkmwM022fcUvwY7xPlmUwoYsB+/2erQUJ8WqM=;
        b=LIgiZgU0XhVZa+uw1DQD0ImQSOMgF/XqGA4Ql7Ceaa9cIBqxxtXis36sltVIx5WE0n
         vmzsSTSlHHq/yNCLyLgf/N/GUC8BEl+egiEUsNqvGV4FTk1dPPYMYewNhIm2yli+llkr
         KKGEdK5t0zJ7t0/n0UMrnp7s6LbyhVK4DCydjH0gCtYL+2UCz4zv4DDayolWj1uQRC6S
         tg3G2WImcTNzk9Jj8GRJxODD8cFRn1Kjp/BUIZvJe39MB8tBjh49ZC9O6VdInJrx6GC5
         gFvSEEUpX2C3mRag1D/+Pau8hsFmEDWDVmPE4UG9ZNr17ENX2reo/HR0chrmyCF75wU7
         eliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779870536; x=1780475336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXP90BLkmwM022fcUvwY7xPlmUwoYsB+/2erQUJ8WqM=;
        b=Ytul3ta1z6s8Hc/EOIQE2VdtK+XnWZePqSCHOtNqMHIMgh5PqciKo468GcJkaPi+0V
         WOOndY0sIH431wVzhIPJrPs1XwlOAFkUyVC//uf+MOFnFrt1b4Wk7PbFRA+p8rsOp7Yd
         IjmtRLVFpLgwbiXllclk99CYQ5F0T1HhMS99J2SCVWsyHv8fDuCMUCgD2zsdvgb2hHKH
         IxrMKHacYe1DIxmBw8fJbeVYTrQQBNsEqMx0PlAyMelNCG1oWQZu4C+XAxEgMYq21IlH
         BD2+KL2we0L2trN5Ks31BO5wf7y6geEWdCftF45La7bWxq7bHsCfucc9MAOGthVB/y/b
         zAHw==
X-Forwarded-Encrypted: i=1; AFNElJ+YRLkqT1srfcUsnzw6GeuvKfZ0jK0e1dbH4Oz/oOysez4pMzvIcxfn2abNwlP5m8KP1Kb9PVyLGwcAsFgPfiF7@lists.infradead.org
X-Gm-Message-State: AOJu0YwbvzVPR/o7ztQw24urEg99Q2vaUEVSYLdS16jf//uxXYDyDucG
	T+wgDcrlYJpxswj6vdejzJx+ZJ5ugkv6rfdoC4fyiwcy0qZaxNdbZ6pr
X-Gm-Gg: Acq92OGjnp95auS7RIM9Yn6lXODlxEk55mNW2PLCp3Vtw5Be4Vs9yp/V6QJ2g4+w/Of
	DEMotKqVdDTA4YSINmKPOWCxE2vbFKh6r2DLlqN1qHctTeKc2sfXnqu58w+DHJAZZFabZNkWAVB
	WBJAEbK7UfcZvZ0J4JFyfK1mGe/WOk7WACoHd3GK46f/tlRes9ASuR66fNiHXB2f6hC3SO1Qmsq
	Bf4JrpO1dVIsvmR7oakmc9u7nU94utvVneGIFcLzHYWv1xh/dLA47ADAYBI+AUP3Mk3wQo3svRR
	NWjD9JBKvnqf4iyReLuZeWFyUx7n6L6B7p8YQJXXSHOqgKInbkL1KkPuLhFwYj9dYkimpm0oCzX
	SCTIDZ8Gv5cHsQRAzzxpcu7gvVSeWa3CWiTVBAWrTP8qCqQM+shGEOigaiE7eEoECSrj068pbcH
	tyo44c+2R2Um4homSmQDX106TrOOCiK074av2ju0AYy4BpOYZ21hSB5VgHYa+dKg5Fma8vIRV4K
	UD4aSpQm24PWw==
X-Received: by 2002:a05:6000:4b07:b0:43c:cf25:f29a with SMTP id ffacd0b85a97d-45eb3689049mr34779824f8f.8.1779870536122;
        Wed, 27 May 2026 01:28:56 -0700 (PDT)
Received: from orome (p200300e41f1bda00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:da00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5c27e7sm4474850f8f.35.2026.05.27.01.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 01:28:54 -0700 (PDT)
Date: Wed, 27 May 2026 10:28:51 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof Wilczy??ski <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Kevin Xie <kevin.xie@starfivetech.com>, 
	Aksh Garg <a-garg7@ti.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v5 2/4] PCI: Use standard wait times for PCIe link
 monitoring
Message-ID: <ahanoZgDwq3v6x8M@orome>
References: <20260526-tegra264-pcie-v5-0-84a813b979d7@nvidia.com>
 <20260526-tegra264-pcie-v5-2-84a813b979d7@nvidia.com>
 <ahV_r6NJWnmJptT2@wunner.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y57fabq4zbjqmwuy"
Content-Disposition: inline
In-Reply-To: <ahV_r6NJWnmJptT2@wunner.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_012858_304458_8F26587A 
X-CRM114-Status: GOOD (  24.62  )
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


--y57fabq4zbjqmwuy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/4] PCI: Use standard wait times for PCIe link
 monitoring
MIME-Version: 1.0

On Tue, May 26, 2026 at 01:10:39PM +0200, Lukas Wunner wrote:
> On Tue, May 26, 2026 at 10:53:11AM +0200, Thierry Reding wrote:
> > Instead of defining the wait values for each driver, use common values
> > defined in the core pci.h header file. Note that most drivers don't use
> > the millisecond waits, but rather usleep_range(), so add these commonly
> > used values to the header so that all drivers can use them.
>=20
> Hm, why not just replace usleep_range() with msleep() and use the existing
> macro instead of defining new ones?

I'm trying to somewhat unify the implementations across drivers without
changing behaviour. I don't have a way of testing any of these drivers,
so keeping the existing implementation and just switching out the symbol
seemed like a good compromise.

> > +++ b/drivers/pci/pci.h
> > @@ -63,6 +63,8 @@ struct pcie_tlp_log;
> >  /* Parameters for the waiting for link up routine */
> >  #define PCIE_LINK_WAIT_MAX_RETRIES	10
> >  #define PCIE_LINK_WAIT_SLEEP_MS		90
> > +#define PCIE_LINK_WAIT_US_MIN		90000
> > +#define PCIE_LINK_WAIT_US_MAX		100000
>=20
> If you absolutely positively want to add a new macro, consider
> 90 * USEC_PER_MSEC instead of 90000.

That seems rather useless to me. We have a _US infix in those symbolic
names, so it's obvious what the unit is, so nobody should be confused as
to the purpose of these. I suppose if you want to make sure it
correlates to the SLEEP_MS variant we could maybe do:

  #define PCIE_LINK_WAIT_US_MIN (PCIE_LINK_WAIT_SLEEP_MS * USEC_PER_MSEC)

Then again, I count 2 drivers (in linux-next) that use the existing
PCIE_LINK_WAIT_SLEEP_MS, one of which multiplies by MILLI to get at the
US version (so it could easily be converted to the US_MIN version). Only
pcie-designware.c uses msleep() with PCIE_LINK_WAIT_SLEEP_MS, so it is
clearly the outlier.

Maybe I should just go all the way and drop the SLEEP_MS symbol and
replace usage by the US versions?

> Moreover, consider using fsleep() instead of adding an additional MAX
> macro.

This would then be changing behaviour again for all the drivers.

Thierry

--y57fabq4zbjqmwuy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoWq0EACgkQ3SOs138+
s6HatRAAg8da90RqnHjyUFhXOqP7Cjo9/fYMdwG9qKAW71wcGfZM2pK1xmC/LV0g
MIyhmSbMyevnALrOnbkobpjgl5QbrSNXE2CqxEKR49UlV0o2lATFB+EJlmtPiSN3
7Q464BWjHaibyl6UU5/FV9VDV0pJK5JQfH/x6I+G27E+XQqzMerQeYuq/Gl3ZLQf
1VZqhztZQ7U/GQBX2g+8FO06udWT0JDk5eNXwrqjg11zIG1C5rXkam1kmgXKYB4w
YDg5TN7DAqnWeSyE0j6DYVXNImRv3X+MvVW5fH09eJ5yE5m8KXdr26kDKTQ+n931
TTuyEB+mDL+FjI8JRMSU7nHPs3T16m4CtADOSx5UItd3EnHi/gIJMkmsbdo7P5yq
LNYGdCameYwMq2r7NO65c9R6H7ARCA81z8frzhj8cT9LyNmwwpLwPnc77oBArl/o
DsdZknA8CG5mHmZOvtcQkTfrdKTJQVolANFj8ARi1pg5p30uGNORSnDrsHSyCygR
8oZSWZr5pKs+aYMYk5c2HgNUQ2IHgEaFkTjdBVpOCTzTXX665DNQH+vANxV91jmx
oM5yyVFbEhPq2SdXpSuXAhDqjqLFWckgdB2NFdQ+A0qvjkUzyHqNsYBirxrtU4Cn
DGjDBzWzYCnn4KcL8eLVcYxybJBsBD+JwfOUv/k3QCFRDwtoqt8=
=BbZl
-----END PGP SIGNATURE-----

--y57fabq4zbjqmwuy--

