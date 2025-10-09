Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD941CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 16:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=re2LVHmQYfMPpDvoOEi22gcukJgsAd89KFwqYXVYUWo=; b=nUo4OHIhydvtuZy7CFzWs60ZhZ
	dBe/ftI4E3x99xoHbJNTP/EYWBODUeBlhV8FNXQqQGWGok57akIXqNvaAHKsPygixYnt18SJub3mD
	HTwRP+kpzCPDZBqMGZbAoEFJ2pbmzPngUAbmf1akSzFmR4HEGdM7TQ1SaDs7qwAMg4UKOj9wCYUwU
	hiUcNdIU8//B0fVha9Jk5cJzG07CCGU1ZiR68FdsrObWkIga9kL09KNS6J6R/7ie3luqVyqPV+WtQ
	U5zzALrB8WnapUhLlTDiKklpYbyBiT/oTghvMIZJ4lf+9jom4wcKjrhkqRUufYGRf0itPPDxFCRhN
	ZLQfvBYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t8w-00000006dyI-3FrL;
	Thu, 09 Oct 2025 16:05:26 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t8u-00000006dxm-3GO6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 16:05:25 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-421b93ee372so637183f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 09:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760025923; x=1760630723; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=re2LVHmQYfMPpDvoOEi22gcukJgsAd89KFwqYXVYUWo=;
        b=LiXaQmZd+2oA821h6w5Pdds4D/WIBFx6MmOPepAM8ioErMgDD3rHC0cYA7LyEC3xju
         3Mzid20Fv6OB8u2zmSunSxdLQsKtyD5yja8O2/ttDi1rLidLBDyCWQUSLJtpYYNn1OUo
         xnGnXR7Lr6MPf7iytw5CTUVLWHWCNt5ZM5+f2y+7RwsssYRtdJqw3J1qn7aHNmBT6Qpl
         TfW5WIXfqb+TRwc04UkXG20vEQnte4ZkdeAlvdHItbjGLBBTTHKk2UnH8aCfVJSfaWdm
         qYip6Bd8zQWxXKxBof0YQQGrkQdgpsWzqexrltKSvQNmQZkFd1Dug3J0gQbfRUZozWbK
         kw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760025923; x=1760630723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=re2LVHmQYfMPpDvoOEi22gcukJgsAd89KFwqYXVYUWo=;
        b=wkmQ8b9jfneD40i1i9ZEXvYKAKtdJJ4NxsywYcDGrEsmVKCd35Jko+PblNW1hIfoja
         jd+hcvjnYiWHc7ypUj4zGMBOeTCy+1eKaqeSdOOeCkr1T+E03Pazvyuv5wRyf5XENpzX
         PAYsya6zPvy+qUX6yaI+xoT8q9VZg4XtNL9bVX0OktptDvdMmgox6xRH0FWpdWPktg7f
         yIwDR/2w8HQPV0+DeqAKgKirTiO407P2mYU1Whihsis4Nn+1QDm+voIVPZMTY5i0t7z+
         rWoZOtGc+fCXsZYsmmeigfcSvLYMbHXw6P3wGBkBQ6nsdQEXcjEAVKHPAt/N+WwoQpma
         6hqw==
X-Forwarded-Encrypted: i=1; AJvYcCUqiU1TZgTgMLOB1bKDONbfGQZCHDR2dUTuU6kNUHu5XQ55C9XFIlaJqkcVzLuueheUL0jvFryHt9SjLJEAuK0p@lists.infradead.org
X-Gm-Message-State: AOJu0YyWbqXSgZia1ban7EnjZmFPHwzaXEcVOPsd+8hTJtQfaTXVNYQN
	4XBCQ3E2ZAn3iRE/ZVpsO62rQNFwCVpJs4eysIys1TYqzksyzf1sDD+fuUhkuQ==
X-Gm-Gg: ASbGnctxmc+CFLGwVtSYvZENgLj43rH44YR+R+mZC8FHHxuaK2pJSn9q9xnu74RAp8o
	oxBFzYzrRYOnnFUzRi868DIiH3Ub1RBnMXY1oJAoY2AYnLF7RhHkrQyJbm6fKXUAX+1QU5jyZtP
	KffB4Dvhfh1ha4CUsWX3Jre5yLizPdjxbFzkhO7WAEyqlTyR6ZDjveSHkhfeimwZwlhftLZavr2
	R3kg/L9GB/pxmiRPmCFWJS3gz3spMYhf/UcPqmRymQtXAxtU9y+3FHvqyThWZmPKn8QTn5EJkgT
	3miLGZpbJlen1WVsEFz5CcNoQ1iNGrtlU3fx7JGp0TyX95gcGxZFPot9bwPpmhqlxa2mGFuypsI
	fpya39eEfdHod1qNL/tBWQqVf00/EegmR89e6BGsikSoIX0dGe6fkwNN/U+g/wvpbkpHHtnYL9J
	Iyq3dc0L940PFNrUt0wd80hO+ZWrj0wlzb7w==
X-Google-Smtp-Source: AGHT+IFOzFZCAz1bvnO194N0WES7OEH7GfUA/BRjdohTZijoPsQbpfZni9sA7IHmHQ3LMF15FxD4jA==
X-Received: by 2002:a5d:5d03:0:b0:3d1:6d7a:ab24 with SMTP id ffacd0b85a97d-42667177c28mr5473434f8f.17.1760025922451;
        Thu, 09 Oct 2025 09:05:22 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426cd99fd4esm30074f8f.42.2025.10.09.09.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:05:17 -0700 (PDT)
Date: Thu, 9 Oct 2025 18:05:15 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: IRQ thread timeouts and affinity
Message-ID: <loeliplxuvek4nh4plt4hup3ibqorpiv4eljiiwltgmyqa4nki@xpzymugslcvf>
References: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
 <86qzvcxi3j.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ytjgx34t7yap2p7t"
Content-Disposition: inline
In-Reply-To: <86qzvcxi3j.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_090524_844123_5327E1DD 
X-CRM114-Status: GOOD (  44.47  )
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


--ytjgx34t7yap2p7t
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: IRQ thread timeouts and affinity
MIME-Version: 1.0

On Thu, Oct 09, 2025 at 03:30:56PM +0100, Marc Zyngier wrote:
> Hi Thierry,
>=20
> On Thu, 09 Oct 2025 12:38:55 +0100,
> Thierry Reding <thierry.reding@gmail.com> wrote:
> >=20
> > Which brings me to the actual question: what is the right way to solve
> > this? I had, maybe naively, assumed that the default CPU affinity, which
> > includes all available CPUs, would be sufficient to have interrupts
> > balanced across all of those CPUs, but that doesn't appear to be the
> > case. At least not with the GIC (v3) driver which selects one CPU (CPU 0
> > in this particular case) from the affinity mask to set the "effective
> > affinity", which then dictates where IRQs are handled and where the
> > corresponding IRQ thread function is run.
>=20
> There's a (GIC-specific) answer to that, and that's the "1 of N"
> distribution model. The problem is that it is a massive headache (it
> completely breaks with per-CPU context).

Heh, that started out as a very promising first paragraph but turned
ugly very quickly... =3D)

> We could try and hack this in somehow, but defining a reasonable API
> is complicated. The set of CPUs receiving 1:N interrupts is a *global*
> set, which means you cannot have one interrupt targeting CPUs 0-1, and
> another targeting CPUs 2-3. You can only have a single set for all 1:N
> interrupts. How would you define such a set in a platform agnostic
> manner so that a random driver could use this? I definitely don't want
> to have a GIC-specific API.

I see. I've been thinking that maybe the only way to solve this is using
some sort of policy. A very simple policy might be: use CPU 0 as the
"default" interrupt (much like it is now) because like you said there
might be assumptions built-in that break when the interrupt is scheduled
elsewhere. But then let individual drivers opt into the 1:N set, which
would perhaps span all available CPUs but the first one. From an API PoV
this would just be a flag that's passed to request_irq() (or one of its
derivatives).

> Overall, there is quite a lot of work to be done in this space: the
> machine I'm typing this from doesn't have affinity control *at
> all*. Any interrupt can target any CPU,

Well, that actually sounds pretty nice for the use-case that we have...

>                                         and if Linux doesn't expect
> that, tough.

=2E.. but yeah, it may also break things.

>               Don't even think of managed interrupts on that sort of
> systems...

I've seen some of the hardware drivers on the Grace devices distribute
interrupts across multiple CPUs, but they do so via managed interrupts
and multiple queues. I was trying to think if maybe that could be used
for cases like QSPI as well. It's similar to just using a fixed CPU
affinity, so it's hardly a great solution. I also didn't see anything
outside of network and PCI use this (there's one exception in SATA),
so I don't know if it's something that just isn't a good idea outside
of multi-queue devices or if simply nobody has considered it.

irqbalance sounds like it would work to avoid the worst, and it has
built-in support to exclude certain CPUs from the balancing set. At the
same time this seems like something that the kernel would be much better
equipped to handle than a userspace daemon. Has anyone ever attempted to
create an irqbalance but within the kernel?

I should probably go look at how this works on x86 or PowerPC systems. I
keep thinking that this cannot be a new problem, so other solutions must
already exist.

Thierry

--ytjgx34t7yap2p7t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjn3TcACgkQ3SOs138+
s6G8yRAAv041zNcMgGZ0avjjb7ZaT6br0d8spAZRKqEUblfT6ypcmLRDIdQikbIJ
7l+LrNKGk0onNtvCoGVuMqdc5HWEpYc+ur4eu2DGX6qFcrTckGZYDNJRwgmSc8LU
mx2xRjZL9+8p1p/ZJ5ZtCjS0o2A6SkxHPCGZmU586GHNvdOyzi5mj8W2mL5520c9
W/GiZkPYJmNJOz7XxxdfENmx9UDbsBlw98mEWa/4WX2vNpqwjjx6DvjqEZbLd4L0
SuN/+ptQJ6rdGEosaWnurFUoEuAJP6kwQFeYrs6eEEoG4SAheVMCoBsXtU2S0aME
ZzRLjDOdlgjlJBcBzeEMCN5KE4u13rni8DmDfp+mvwlb7GOxaVDkMKUXty10Z1bm
Suu9F8w0dkyMdIVHPbxYDYV5UGCLRB23fTVgeJ8XnAEgBviinkoiZiBkpAZ/mivm
985PDzT8AB2RLsVdb9E2k6pwlD1ShsCunyssQHDj3QqfhKv16QLLyEFq5agJ8mJ0
Au6aDjn4d2NYERVvUI3RoCeogRvfk8vVdiymMxoV+jdwxvUYzoHCmAcNHlCyzoFe
jYeCeYyEIEAYKMg4zSofqW2+EqYvMmQ98PK0Vt5Mh0yhsFw+yoL7dwWJbfFQgvBa
DWj6h+sChHu5/hq/rwXkBS8xiacKru+DMcjCRwz0k2iMPkAaVM0=
=N60K
-----END PGP SIGNATURE-----

--ytjgx34t7yap2p7t--

