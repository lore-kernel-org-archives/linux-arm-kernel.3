Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A253C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 19:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eOCz6p5uyWrnGjfkKjBisd5HzVXiT1RDyr/H3ZddfA=; b=Akzj7+UE0Xt7tV9Q1hycV7Njwv
	r2cEapxdAk6tAI3Rd6Q3vMKxc0aa8mkDUTIuIbxpoAivKIhgYU8aT+haCQS8FAXDJkVLVDICtoXae
	Tl3z7kjNGi1GJxrKT37SO8VKBw08x8VyvUN71Qm0gVBUoJ0e8ZGcQj0aIEw+seWtIHBSGIYmRlqK3
	ri2M7qvV2zz+WLogqqWo6o1LpwpjXIfHBKDJQq8UJxy1p3kseeuTVqYC7QeN3EQXn2xui0zPfOivW
	UspQ3XXpirF9Mghk5ceONkZCtWLIQuxcQuESJ/c/V+MLzj8iDLFUnD5z+HNfdz/b7UqHcvW6iQKe9
	EjjwMrDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGmk-0000000Bzc4-0o9W;
	Thu, 06 Mar 2025 19:21:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGl7-0000000BzRv-0I7c;
	Thu, 06 Mar 2025 19:19:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43bbd711eedso8380305e9.3;
        Thu, 06 Mar 2025 11:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741288791; x=1741893591; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/eOCz6p5uyWrnGjfkKjBisd5HzVXiT1RDyr/H3ZddfA=;
        b=NY3kaEHvL4bo4YLCdEUYaAOcvkKxcoQN7Bh/C5pukJjbHke6kWegCcUa0TDKjPhqzC
         obeWI11A0WIYG93FHWVkAvrP/zMbPY7FbPJ/rtDj7A8X4GC09NHV6o76qFvzRjFbxxIl
         vI5wQ/bho/2tOMdLGjiYXoLTlwWrOWj8yl38SwTDYyfhyOMLjiDD0UJN5CFP5SXldpcT
         7nhuTRcWIA9LeWVbETH+82dv+W476iDVEFxXzB4FyZb+VvRp7bFc+QTzaW2oKkoAKtIT
         zMBI3A9WpfygbcM4MNGcMygkL4vmm3X6kRfbFrjXaqZRoIN975TRMQtExHXjzP/UlMcK
         McRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741288791; x=1741893591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eOCz6p5uyWrnGjfkKjBisd5HzVXiT1RDyr/H3ZddfA=;
        b=isV0XHp8Di+dBIzH5FBr8GR10QuGAlYhtToaOuyQYj6ThBvbLLueEYatE4CnItnMT9
         FFiBiB5VUZEAkYpK1PVhyGNzRduzMSQ4g6OMiWJ4pOoWF6zuFwNtHQyBrpqgWMt7MrMB
         bgyGz3HpXdLJ9UWzsQ0FyKi4LVAqhExgFni8Lbslu7E2EPXWDtNdmr3ysNxd4rQBY79s
         C1WdhIK7PEg/7NoQAmdVfc3NTSkD25NKNWiJa955OLMi6eFrz1dRAmGYVT8rCF2f4xKt
         eoz10BnrIJ591ozsnigBjadYlRDfFj16q7xOW/QiDDvx3j//0YRFuwBoPdSU2egpqm35
         Ocyg==
X-Forwarded-Encrypted: i=1; AJvYcCUqLvFrVX4hP1t2v9yYLTVWmmcYohSBOpK9h2FDCwNTpBvKlQwBetnePxChgaY+jxKaquvu8638d4BBfsnawxpH@lists.infradead.org, AJvYcCWJdkqiC+dwkTpH1NKSaqGxqoHhou1ovcEB6KjK6wrlx1D5ju9H8HVT82TP0DynHS49JWTFr0aXu/kvXeE=@lists.infradead.org, AJvYcCXECEHk7ksH0YbSRWHGRFENxzFkLrdiJj0CZE6NGcMA4iIGV38w2IZwoIDasR02O7noFfJcZz1LoS7T8moEQ2irYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBaXJpM31i0s57EUjMsB7QWZgrmLMGO1cVkeC2F7x10AfC3rjU
	iWjIY1dHeDp+oR/VOGt/i3Fd+zKBmEqbEYqSYFN6Aua5zCw8urMQ
X-Gm-Gg: ASbGncuHCJ1PtyHTBjscNwPxToz5zkpGl0m482dVjEWZSVIJ95RpyoDrbSygcSvxroZ
	F7yKftYhqamZj41CRGvGNQndG1Czt43bql5t4P/s3thEMWnFki9HY8WHhXCBSE0thZUi6516RDA
	ByfhLJr3Mo9jrbx1c2VNqhg8fi6U7ZKAVutNz/ugOERA646MPSbjPvbB4Evl/+EvwpdLR9m7Pjg
	NCgHXpWZ3hUNHA+HZNZOAxnnYvI3yqMnaoNbGJ/ddYRKY6oj2B+fFqEtPnJRz8amF1FB+dMLm85
	oTQoKjx5FlyppJaktpbgqO47CofRcr0o3RvCeiUoPmbpvri0ZPK8Y26r0qQb2OpMWbwfRSfFQES
	7I/i2fpxdbsohcch5L0AgNXmu1ZOT0Vo=
X-Google-Smtp-Source: AGHT+IGlEvntMF2i7X6Axx8OQDb9BYfoARMqUag9hgvpN2gkfNJBXg+ADawzvsmbM+xjKyCC9YlPOA==
X-Received: by 2002:a05:600c:8a8:b0:43b:ca39:a9ca with SMTP id 5b1f17b1804b1-43c5a60e07amr7077505e9.16.1741288790433;
        Thu, 06 Mar 2025 11:19:50 -0800 (PST)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8b0461sm30190845e9.4.2025.03.06.11.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 11:19:49 -0800 (PST)
Date: Thu, 6 Mar 2025 20:19:46 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Celeste Liu <uwu@coelacanthus.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Tony Lindgren <tony@atomide.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Stefan Wahren <wahrenst@gmx.net>, Thierry Reding <treding@nvidia.com>, soc@lists.linux.dev
Subject: Re: [PATCH v4 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
Message-ID: <t2dustbykx2qd24wazjeiw5hch5nwr6z2ewmaf4srg6r2grwrf@rdw47chzkef2>
References: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
 <20250115-fix-riscv-rt_group_sched-v4-4-607606fe73a5@coelacanthus.name>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zlzxkvnluqa6wgik"
Content-Disposition: inline
In-Reply-To: <20250115-fix-riscv-rt_group_sched-v4-4-607606fe73a5@coelacanthus.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_111953_116750_5A52637E 
X-CRM114-Status: GOOD (  19.16  )
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


--zlzxkvnluqa6wgik
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
MIME-Version: 1.0

On Wed, Jan 15, 2025 at 04:41:23AM +0800, Celeste Liu wrote:
> Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
> with systemd") said it's because of recommendation from systemd. But
> systemd changed their recommendation later.[1]
>=20
> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarch=
y it
> needs an RT budget assigned, otherwise the processes in it will not be ab=
le to
> get RT at all. The problem with RT group scheduling is that it requires t=
he
> budget assigned but there's no way we could assign a default budget, sinc=
e the
> values to assign are both upper and lower time limits, are absolute, and =
need to
> be sum up to < 1 for each individal cgroup. That means we cannot really c=
ome up
> with values that would work by default in the general case.[2]
>=20
> For cgroup v2, it's almost unusable as well. If it turned on, the cpu con=
troller
> can only be enabled when all RT processes are in the root cgroup. But it =
will
> lose the benefits of cgroup v2 if all RT process were placed in the same =
cgroup.
>=20
> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn=
't
> support it.
>=20
> [1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1be3=
21c31d5299f69f
> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=3D1229700
>=20
> Tested-by: Stefan Wahren <wahrenst@gmx.net>
> Acked-by: Kevin Hilman <khilman@baylibre.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
> ---
>  arch/arm/configs/bcm2835_defconfig   | 1 -
>  arch/arm/configs/omap2plus_defconfig | 1 -
>  arch/arm/configs/tegra_defconfig     | 1 -
>  3 files changed, 3 deletions(-)

Hi Arnd,

is this something that you could pick up? I think so far only the RISC-V
patch was picked up, but nobody seems to feel responsible for the ARM
patch here.

Thierry

--zlzxkvnluqa6wgik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfJ9VIACgkQ3SOs138+
s6EV1hAAmmOA9bt5ezD7ZL1JWnDlfosEhXQikLJbSz+gAvX+YGSrCEY9u9RhonZS
bc+6iwnvUoA0HbqdTecbWzifzHz/JqnPCAdrdoQwSspJ3onSZAnRPj1u8NRDv/gy
54LG7uX7qWZhH9OF/MHqQbjHo01dXl8OmaRrAUgUK3h2AgyzJldR0uOaQ+tQ3F4o
iPzt2JxJUBabJUImAV7wivSnMt3pPaGBS6BN203I26wIeGAY8ZuMKJrnQS/4Mmis
5lxuMl8dTaQaJ+WaJeKwRpZgI22JnMKabnDwaQ6nDuLOMY5/KOeAv2DXGZOZ8qRn
8LDhTlnir1RsuEbgf7b/CYHMNnZA4RSY6puetzCaAQ0WSb1ENMSyGcGM0HzZ49ps
6rrPpo+yWldcHVDQzbiiXIs6pWMeVvmNufpR8D/FweKG0gyqZSiDCZXJdEZjYgbu
gYp+qfQ9LiVjK1t2Z/MY0RkvaZBNhNfK29wX+oT4bPbhkV/Sep7wL1w8VCegqV/g
BzXxAu5HjRDRtfMdOzqBh3EGJfT5hmsJyH5nKD7uT5B7a8gYwUjB0pcX8cOJyCI+
oAd9Y7gS3IUWMLLOk7mFGWiIcPcO9so87NoMSlmNnVc/dZPpojNAvu/kcMgnpLSq
0Ss2JFGPVzSn+zgNVsP3A8TK/8JR41YyK/M+QEH18WZuNXQcH5o=
=P21d
-----END PGP SIGNATURE-----

--zlzxkvnluqa6wgik--

