Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAAFCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 13:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZ1++ekTPtzW028TaYNKl4rUChmdflgkEaStZQX+AL4=; b=Ye7cx8YZjmJZCPcOltJENILCx4
	A76UDqTn6a521v8LcNUmpIf0QEROaWqxizPkVosmbHa3U6I2A+TAihE6pOO65BS15LOYM1K9iGHtc
	RE5hgiuQo95y0Toheml3XDGFsVL8LWDO9+0IdImWvk/KK73vaWCPlhPKXCqL1hCjKU78h3iuC2u6J
	xWYrukT233RAOa4K94dp1ENJQ5SXSewCqYU3ynU/FTd5IlWjfiuX9ifPu00KCOySpCeOx5zEiiLi2
	VztTcuKiOpow84MS9uGDZpMcDDN2YsALIzviB96HquSy8VCNrdwZQcRNHW+8tWHHDoeYRo7GX7/ko
	mwrn1LgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7DWW-00000008bNC-1Dqi;
	Fri, 10 Oct 2025 13:51:08 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7DWQ-00000008bMP-1MCe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 13:51:06 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-46e542196c7so17365395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 06:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760104260; x=1760709060; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jZ1++ekTPtzW028TaYNKl4rUChmdflgkEaStZQX+AL4=;
        b=HtylNBz6PBCdENKkQz5BpXDI9utg1SGgAwSq3Qtu28hVkOUGidwCJf9jFfSW0IKqlD
         8WTBOzBycCDGwciQsBqGUqGGaZ0L68UycyQ07ZrjBc0DdRxknqbxjdKA1m33noDFv5Nv
         oexyoKW7lGbtKWcYP2Ysopdc2MBnOxsli0zptLa+UwXqx5CD93FZjcmkE1SPgJczAEhB
         FtscuEIA6MX+82csU2HqRgcL0odub/23zhxNMOtO2B/ornqTdcLyTK6YRJoaJWBXjpR5
         KPgHB7MHNo9BoBoMDqlLfzyBgxjcqV32Woev7ssbYnIel1x4REnt4VdG77YI2x3kY6Iu
         TNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760104260; x=1760709060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZ1++ekTPtzW028TaYNKl4rUChmdflgkEaStZQX+AL4=;
        b=LEBwEqA6syOXDis2VmZSMtBpWrW1jxe0UEdRbaoDJ6Rz1evUnLz81IuKvil4RM/P6Z
         5MA+WbV7XplcrBmjg2C4SjXiGS8/954YzKQlcGn3hHpstx1O5DHGRn2v01YHm6M2j/PZ
         OyeNM4/3gah4BgmWfVGPCgPHvUYmfaGQYLVU4/k4VeVQ8c3AbvTE7iy3/dkxIw0sL2K0
         vP8Tvq2byKyLJlsRxE6V8n5W2Jq7c06+o1v07edV8GgGF+sPKhxKicGRZc5BeobDxKQ7
         jUyZKbgdvMWXUJlIOytvX802djBxX4j38HHD+KmbimLagNS68k/OL5ApYjm3V3ddG75b
         p5/g==
X-Forwarded-Encrypted: i=1; AJvYcCXQfdauyQ8EjsxR4UEUYpxAQiv5LRfcpbU87ghpIGxmda4J712Ce9q39oa8WmmHsOViDf45T/20DvND5tz93ycu@lists.infradead.org
X-Gm-Message-State: AOJu0YwwOhLb9hHZVfOiqM0BH0wXxfCXb0c5c9pDgnO/+lByHyT8qpCa
	Y2K4HOkUykvFV3524qbvCcCfwP9F+4xfe/Xjw5DOt9KTfSd9lVLq1eE4
X-Gm-Gg: ASbGncv7PQr3V9U9QCHpKCl4aPjs2kmUiLHDHZ0OIdg58v1vnhmutxa2KXRhOqgo9iD
	zPfA24iy/jYvCun/IFOyVCY0LHum1rxDrUJbydxamY9qnhmBCB/X7NM2Nmd0hNCEdkw2AP7lXpH
	D6D9N/MLvnNGvqYqaRko6UGDiGq7/Fw5Etz8zRzsSw58y/aCXDz7gQhPIiD+XRZCs0MkGqIElgf
	9UWYkFfGqgiv6lyVdk1/Ytv3BPE5w8lVrG4twxBFvrlLsUR03EgR8QpSP11BJM9LikNpfFJTRgI
	NZRpWdd9aE7VNhSB7D0sNdji5cgfz7bl/MMHjmGzvgINSNqBjUq2qiQlFqWh4228rBfWNUqepd/
	1VevsEPu028X2CzMMArP6pSNJH+RAVIBg7Gpo7l6gQpvp4zZlrCpu/3VBJA6Kx067zgQsyOw/6M
	Skm9CqHlMpDaGT25FQfzVEJcyhveb0e9+3NZy1Wog=
X-Google-Smtp-Source: AGHT+IEshn5BeHxphWH/iqJ/hWVLW9YiJEVo7JGmJqFmzIvH5+RSg739jHkexUzzwZyAmWc+E2cqig==
X-Received: by 2002:a05:600c:83c6:b0:45d:dc10:a5ee with SMTP id 5b1f17b1804b1-46fa9ec7727mr82513905e9.15.1760104260021;
        Fri, 10 Oct 2025 06:51:00 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482ba41sm49385365e9.4.2025.10.10.06.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 06:50:58 -0700 (PDT)
Date: Fri, 10 Oct 2025 15:50:57 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: IRQ thread timeouts and affinity
Message-ID: <us2hfdn7jpfepdmwk2p62w64p7xagaeoemg3hdt2vm54emtwlv@m6fkuti7hvfa>
References: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
 <86qzvcxi3j.wl-maz@kernel.org>
 <loeliplxuvek4nh4plt4hup3ibqorpiv4eljiiwltgmyqa4nki@xpzymugslcvf>
 <86o6qgxayt.wl-maz@kernel.org>
 <86ms60x7w7.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="672rw65c6imvnytk"
Content-Disposition: inline
In-Reply-To: <86ms60x7w7.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_065102_408088_C4D54F39 
X-CRM114-Status: GOOD (  48.07  )
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


--672rw65c6imvnytk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: IRQ thread timeouts and affinity
MIME-Version: 1.0

On Thu, Oct 09, 2025 at 07:11:20PM +0100, Marc Zyngier wrote:
> On Thu, 09 Oct 2025 18:04:58 +0100,
> Marc Zyngier <maz@kernel.org> wrote:
> >=20
> > On Thu, 09 Oct 2025 17:05:15 +0100,
> > Thierry Reding <thierry.reding@gmail.com> wrote:
> > >=20
> > > [1  <text/plain; us-ascii (quoted-printable)>]
> > > On Thu, Oct 09, 2025 at 03:30:56PM +0100, Marc Zyngier wrote:
> > > > Hi Thierry,
> > > >=20
> > > > On Thu, 09 Oct 2025 12:38:55 +0100,
> > > > Thierry Reding <thierry.reding@gmail.com> wrote:
> > > > >=20
> > > > > Which brings me to the actual question: what is the right way to =
solve
> > > > > this? I had, maybe naively, assumed that the default CPU affinity=
, which
> > > > > includes all available CPUs, would be sufficient to have interrup=
ts
> > > > > balanced across all of those CPUs, but that doesn't appear to be =
the
> > > > > case. At least not with the GIC (v3) driver which selects one CPU=
 (CPU 0
> > > > > in this particular case) from the affinity mask to set the "effec=
tive
> > > > > affinity", which then dictates where IRQs are handled and where t=
he
> > > > > corresponding IRQ thread function is run.
> > > >=20
> > > > There's a (GIC-specific) answer to that, and that's the "1 of N"
> > > > distribution model. The problem is that it is a massive headache (it
> > > > completely breaks with per-CPU context).
> > >=20
> > > Heh, that started out as a very promising first paragraph but turned
> > > ugly very quickly... =3D)
> > >=20
> > > > We could try and hack this in somehow, but defining a reasonable API
> > > > is complicated. The set of CPUs receiving 1:N interrupts is a *glob=
al*
> > > > set, which means you cannot have one interrupt targeting CPUs 0-1, =
and
> > > > another targeting CPUs 2-3. You can only have a single set for all =
1:N
> > > > interrupts. How would you define such a set in a platform agnostic
> > > > manner so that a random driver could use this? I definitely don't w=
ant
> > > > to have a GIC-specific API.
> > >=20
> > > I see. I've been thinking that maybe the only way to solve this is us=
ing
> > > some sort of policy. A very simple policy might be: use CPU 0 as the
> > > "default" interrupt (much like it is now) because like you said there
> > > might be assumptions built-in that break when the interrupt is schedu=
led
> > > elsewhere. But then let individual drivers opt into the 1:N set, which
> > > would perhaps span all available CPUs but the first one. From an API =
PoV
> > > this would just be a flag that's passed to request_irq() (or one of i=
ts
> > > derivatives).
> >=20
> > The $10k question is how do you pick the victim CPUs? I can't see how
> > to do it in a reasonable way unless we decide that interrupts that
> > have an affinity matching cpu_possible_mask are 1:N. And then we're
> > left with wondering what to do about CPU hotplug.
>=20
> For fun and giggles, here's the result of a 5 minute hack. It enables
> 1:N distribution on SPIs that have an "all cpus" affinity. It works on
> one machine, doesn't on another -- no idea why yet. YMMV.
>=20
> This is of course conditioned on your favourite HW supporting the 1:N
> feature, and it is likely that things will catch fire quickly. It will
> probably make your overall interrupt latency *worse*, but maybe less
> variable. Let me know.

You might be onto something here. Mind you, I've only done very limited
testing, but the system does boot and the QSPI related timeouts are gone
completely.

Here's some snippets from the boot log that might be interesting:

[    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
[    0.000000] GIC: enabling workaround for GICv3: NVIDIA erratum T241-FABR=
IC-4
[    0.000000] GIC: enabling workaround for GICv3: ARM64 erratum 2941627
[    0.000000] GICv3: 960 SPIs implemented
[    0.000000] GICv3: 320 Extended SPIs implemented
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GICv3: GICv3 features: 16 PPIs, 1:N
[    0.000000] GICv3: CPU0: found redistributor 20000 region 0:0x0000000022=
100000
[...]
[    0.000000] GICv3: using LPI property table @0x0000000101500000
[    0.000000] GICv3: CPU0: using allocated LPI pending table @0x0000000101=
540000
[...]

There's a bunch of ITS info that I dropped, as well as the same
redistributor and LPI property table block for each of the 288 CPUs.

/proc/interrupts is much too big to paste here, but it looks like the
QSPI interrupts now end up evenly distributed across the first 72 CPUs
in this system. Not sure why 72, but possibly because this is a 4 NUMA
node system with 72 CPUs each, so the CPU mask might've been restricted
to just the first node.

On the face of it this looks quite promising. Where do we go from here?
Any areas that we need to test more exhaustively to see if this breaks?

Thierry

--672rw65c6imvnytk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjpDz0ACgkQ3SOs138+
s6FCdg/+LsBNRHyYhyktvtT7AXV0J0dQ7HHiuJ3QqP0h/8/55fq+sj47mXE8oeHe
oa8Or4UHyaXbKs/h+FyXynELeYObTsrXlu6Bt2tmAzxT+DGOJ2uVw6J7fVpKasN0
3QSh9o4eTbt8h/bHd4SwvHF3Hc82VMz9KUJyrImVThTil1NI0FEy2OHHzXhc/3ER
dg5vA+yh6koult84wixmq3C4Fb+3DfgM/zOzB0wTc5Mfe2TwZ48b5++k6Tvj7/hF
1ThnZq8mxZK6s71ZSVerVXCwAfyF6ehg/jaBCX8fvnWzDIcb3uc9fA1+F5rJ3aTv
ltPSdj3DykrMHEr3vLvWnQp2qkp+zh7Fp8rv3tg+PaeuDsrfFbxMfTLtBms39QOn
GBt4I33m7jF3ttit7D8R/oXY1aB/ZWhkigGPvw2MA9hICi16MhUXGV8191e9chtm
pEaSBKmWEK9vTf/Gf6OvhBjhuuILizuDGTpOuidGmk8wKxTmr0WB/xL5idn/NJbl
uzw1oz2iL5koIPgMcVjYv8rxKITW/QZxehQ3rUFaTYyeoUoykECb9rJiAmgDL1vo
4MK3cKMeFZOCgbD4M9kOgZJE1zNRKHKp3G7OTL3NFlgYjZl3wI+Y45+hCWV3v2FJ
Nv99rdvczPzi9SyLdE3sr81gQP0qYyW9c5UofSEdoQO7oFN7Sdw=
=b/dB
-----END PGP SIGNATURE-----

--672rw65c6imvnytk--

