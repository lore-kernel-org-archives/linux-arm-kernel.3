Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC7DCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPetjpKaANYcaWLgkrrduiZNuU2Q3v8y55EcDsrfO0c=; b=F4xTZQY331SCH9TSrsHfpvRvLp
	0ooSNXPoFQDfYl7ZnyGE6b8vr918y+WUDTn9VXK9K7E7O1mfTGKMNgf3o8ycmO/uCg4rOLH7kf4XR
	aeK7Efti/n0G4WpO7zKSS+z2tweN/w+2eOYRdU2NgND3s6jFRlRP6Q/YWuI+/tz47KS3pYJac10wy
	Q9xWc1co8j4YG4H3BV7xgERFUu+AokfiBWeojRkqVaLmxhKsq0ZV+T9ZSrUf0H3h/vqhQWySJKURY
	0m/OWS8TYmZ5e8GUP6OWS4st3gYA77aQYs6ND0GOI34Qm73398aPAeWjFtl9w1r7taqrynQ+DBozg
	weM5585g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ctR-0000000G2KF-2Jut;
	Tue, 14 Oct 2025 11:08:37 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ctP-0000000G2JA-2QfA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:08:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-46e4473d7f6so33532405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 04:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760440114; x=1761044914; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TPetjpKaANYcaWLgkrrduiZNuU2Q3v8y55EcDsrfO0c=;
        b=UykUZWDL6mjzD8cnbB8euzf/+DbxevIhzXqDgkv4LAxyKZzv7C6q8Qoh81Lc0tX9Cg
         yrPQAhMJ8Yxjih+ecOQnSItaPI8XG17IUfgAQbS3wL4xcgzYmvKbkwlzVbEF9bfnc5Z1
         S6/gnTMCdFMXt9Y5kczeLA9/ecIu1wlNvs41yWJRVPv5PPGO+TSiRiDUFMZkks3o4x+b
         NTI+sze70mWfWTr9fi+3UxhzquoqyjA5ytuFrKwvCDc9X9Lcq6lC6xV6kLD3loRH34Uu
         FprwP7z76d2uTGkF4p85peKgUE6/TbqWgijzHW//T2GBza1/U4HK4AJSwfHQbsqur7Io
         m2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760440114; x=1761044914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPetjpKaANYcaWLgkrrduiZNuU2Q3v8y55EcDsrfO0c=;
        b=UZg3UkandvRbup193E3GIcP4KIoGRPyLrEw3rub1P8O+UyaKR1L43FqAk86WMrCh1P
         r8bY6MwlcofzN3fVE0dhu7ewMNOD+WYOpZg5hinoSuTD+Wg4bFsXajXj6ez7Bvym5/3p
         cn9y9lbyn3TcfgAiIHSXWdGQmvxNDftPiq2rnIbrAt+zpxYT3eYL9C+NsDvkl2NGq2i9
         yYVAw5Ylw/tcJA9iGaVeO5Fksin77eVKToxXI6L6E8BiFXpwhdx+ODn2kMJX2T48Bg+R
         rYXe8OW/YRWoEgNAbaiMIkGFLGf0wNeA0mfWDY1X0cHjvZURnaxs+Wqh/eoWgVAFdnre
         Womg==
X-Forwarded-Encrypted: i=1; AJvYcCUAf+1Zus4qE//K9MTOv0hhHkwxcoU9m7Qo9xSShi8g1EAQCOAtS5XdoFkzgYGHS4oky6IglZEL9yJd3hqhweWe@lists.infradead.org
X-Gm-Message-State: AOJu0YzneOKkpeKbiAUQH2jNvQ9uqmFAyGsOeHbrBDJlPJMy14r07LVa
	Q0Pm3obX8jckrUKnA4oqxyyd1KrL8zyjkv+s5bEYHzmJcPtmJTgq/5Xk
X-Gm-Gg: ASbGncuoeCdNpoMQv3OtCbX8uP0uRhmEoXZhHFg90jALMg23cuC/JTSSWe20gRbU7JC
	t3cCPzFyDpGduCtz1EEFmrZF4Dk2S0zdGt/Cz5kES0lZDZzFOsjyiVAz0+13cRKYBOO0qAWYWyI
	fSiUSj2UAY1Hce1CtJbjXhMS5asMrbI2Bn7VXc27G5Ga3AKlhqSMJgAFLRfR/KXkyzP2KAUOpld
	NYC7sGXISBAGXUGqFurf1FWlwEHhqD2CUignJfXC5EiC2RPSLHCtvAPWonLhTWnigK6v8F81wpg
	c4ckahUD4sHKvgP+YkM7J9Lv3IfIqqH8a2jhWuXw73X+A6Oyb3aNC+kedP7riqsFsonaNxEERwp
	EIReVFVKyUT3EDHD0BIvFEOFnE9I01ZujCRuq7A4CUo2YygTC769skbeIz9IzbYhp82J1DOTlBV
	DT0NUpwKpXUWAK21fNWdYug+a7WB3qNmRasClCl2E=
X-Google-Smtp-Source: AGHT+IESDQkkKQFxDd3gKEVsTIe3KB0qZiIE+wyBsS0WnJH2Bh8XOS/Fj/147wchmYc+eDbh7IytIw==
X-Received: by 2002:a05:6000:2910:b0:3d1:c2cf:da07 with SMTP id ffacd0b85a97d-42666ac48bamr14569143f8f.4.1760440105681;
        Tue, 14 Oct 2025 04:08:25 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57cc03sm23711273f8f.4.2025.10.14.04.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:08:24 -0700 (PDT)
Date: Tue, 14 Oct 2025 13:08:22 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: IRQ thread timeouts and affinity
Message-ID: <wosxizbb5z3goikqglsdbrgmshith62upwnavnbqeq5dndfau3@bna46rg3w2ak>
References: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
 <86qzvcxi3j.wl-maz@kernel.org>
 <loeliplxuvek4nh4plt4hup3ibqorpiv4eljiiwltgmyqa4nki@xpzymugslcvf>
 <86o6qgxayt.wl-maz@kernel.org>
 <86ms60x7w7.wl-maz@kernel.org>
 <us2hfdn7jpfepdmwk2p62w64p7xagaeoemg3hdt2vm54emtwlv@m6fkuti7hvfa>
 <86bjmeyh5m.wl-maz@kernel.org>
 <graeplkpsgbolpnnq2pndpdb7fymyy7zvm37osbdtre347tns2@mjbgzwterefv>
 <87sefpoj10.wl-maz@kernel.org>
 <6hb5vyl5xxsxfcwk4v3xpq277wusj5jq4tubdpjocpjc5smj3w@wx574kluhedj>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nz4k73ft56a2tnts"
Content-Disposition: inline
In-Reply-To: <6hb5vyl5xxsxfcwk4v3xpq277wusj5jq4tubdpjocpjc5smj3w@wx574kluhedj>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_040835_638274_AA51D0F9 
X-CRM114-Status: GOOD (  32.60  )
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


--nz4k73ft56a2tnts
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: IRQ thread timeouts and affinity
MIME-Version: 1.0

On Tue, Oct 14, 2025 at 12:50:18PM +0200, Thierry Reding wrote:
> On Sat, Oct 11, 2025 at 11:00:11AM +0100, Marc Zyngier wrote:
> > On Fri, 10 Oct 2025 16:03:01 +0100,
> > Thierry Reding <thierry.reding@gmail.com> wrote:
> > >=20
> > > On Fri, Oct 10, 2025 at 03:18:13PM +0100, Marc Zyngier wrote:
> > > >=20
> > > > CPU hotplug is the main area of concern, and I'm pretty sure it bre=
aks
> > > > this distribution mechanism (or the other way around). Another thing
> > > > is that if firmware isn't aware that 1:N interrupts can (or should)
> > > > wake-up a CPU from sleep, bad things will happen. Given that nobody
> > > > uses 1:N, you can bet that any bit of privileged SW (TF-A,
> > > > hypervisors) is likely to be buggy (I've already spotted bugs in KVM
> > > > around this).
> > >=20
> > > Okay, I can find out if CPU hotplug is a common use-case on these
> > > devices, or if we can run some tests with that.
> >=20
> > It's not so much whether CPU hotplug is of any use to your particular
> > box, but whether this has any detrimental impact on *any* machine
> > doing CPU hotplug.
> >=20
> > To be clear, this stuff doesn't go in if something breaks, no matter
> > how small.
>=20
> Of course. I do want to find a way to move forward with this, so I'm
> trying to find ways to check what impact this would have in conjunction
> with CPU hotplug.
>=20
> I've done some minimal testing on a Tegra264 device where we have less
> CPUs. With your patch applied, I see that most interrupts are nicely
> distributed across CPUs. I'm going to use the serial interrupt as an
> example since it reliably triggers when I test on a system. Here's an
> extract after boot:
>=20
> 	# cat /proc/interrupts
> 	           CPU0       CPU1       CPU2       CPU3       CPU4       CPU5  =
     CPU6       CPU7
> 	 25:         42         44         41         29         37         36  =
       39         36    GICv3 547 Level     c4e0000.serial
>=20
> I then took CPU 1 offline:
>=20
> 	# echo 0 > /sys/devices/system/cpu/cpu1/online
>=20
> After that it looks like the GIC automatically reverts to using the
> first CPU, since after a little while:
>=20
> 	# cat /proc/interrupts
> 	           CPU0       CPU2       CPU3       CPU4       CPU5       CPU6  =
     CPU7
> 	 25:        186         66         52         64         58         67  =
       62    GICv3 547 Level     c4e0000.serial
>=20
> The interrupt count for CPUs 2-7 no longer increments after taking CPU 1
> offline. Interestingly, bringing CPU 1 back online doesn't have an
> impact, so it doesn't go back to enabling 1:N mode.

Looks like that is because gic_set_affinity() gets called with the new
CPU mask when the CPU goes offline, but it's *not* called when the CPU
comes back online.

Thierry

--nz4k73ft56a2tnts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjuLyYACgkQ3SOs138+
s6HKKRAAsKq6KQD9SNZ7hoquknxqVobKoCxv4LN0G9P8nD9bTQQvGw/ocGG3Pu4Z
/tHLC34ssVALvO9tOxRi8wsWM6O7wiQhKmFskX4u8MRbXAoHBKOJO2pW69ZwW/5Z
HJEwKhmDymvpH2htv4gvcHdL7iQJfK1hLD2wRnzXllgwnCFA50leSfPCS/jr2LQP
tZJY2An4Dtr/TvT+gSEVxEuHNJRHavLEqGbg4mY0OEsGhkoQ/wDEq3TOCuDV2CFH
DZm2+rk7fGRP59gV3a5xOgCb1MAsfCsraw2mshaeOo4XzrCVByW0G0W9IuYzbfjW
UGJTc5VikmKdvjHvrgQo0RtGLcH7D13+piuwCeTV0zEhjmtI43y4lvXWPVhc0E2v
1VAFoVT/UUop7FKy0CT+UOvhjvIQFehJXfxz99sXrjnV0udGR28rpSYU4289LxGp
xtV5Z8XSeh5qp5Vgj99N3pv4jE/nYpumLEO8BxrNld1gLOeH2l44XztHeHqTsZH5
wKccisf+h2ADiLiTK6EHI1u2exQ1C2Xu8KeKI/xz9UDDyDBPxYxcfGGdm/510qq3
wtoZ4d4BjJ6OXB2G+IC9qVpKpxW587UxYrfKt1/Gjs8BdqU9doN5uSq0JEqu0UMd
Tf0dE61kCSlqDSWLBz4ZVewIafm68sFm7t8pBrzIyViYGJ4VN6A=
=gdpR
-----END PGP SIGNATURE-----

--nz4k73ft56a2tnts--

