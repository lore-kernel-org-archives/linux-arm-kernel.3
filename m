Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD82C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 15:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzTZN1Rgi3KEaXkVhx7sTEQ+GfRghm0dQNuxhM8Lk7o=; b=IsBc7rQKkFE6fCBSbc9h0O5oVF
	QOuarUWZQJPwUEvf2PQfZ2fA/kfK4ftqzDwqoQbTOL3KMRCLIWGEkRtbbuV8NIcMLdGn8NTxhOw1y
	v8b5ssa92CzRSaSKYRGLavMWB7RfKQQv56ykUOYTDkGFc0OpWvytUhAut79vcBzKIAsQZvoQn3upQ
	aVPYraZTG8aqrzQIBjIAwcJZ1bJokc+oLZWhNXZnRLfL6iji/SrMrW2DTn2ZJSgCaSGnntdlaKilP
	mnNCpcJ6HqEGBD3VCOc7dZzoIE/T1UREK4Ma5emViFYHKbvXBl/VSVJ56MYQJm0xhck5VdF5s8KYG
	ogElY2KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLp3-0000000Bolf-1cEd;
	Thu, 03 Jul 2025 15:26:01 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXK3B-0000000BVYb-1SQy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 13:32:30 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so5207292f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 06:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751549548; x=1752154348; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VzTZN1Rgi3KEaXkVhx7sTEQ+GfRghm0dQNuxhM8Lk7o=;
        b=Ct0J8I171Y3i29T+beqwlBn+1esvAzySXA63h9yZtvRLDlu2udYWDT4xvt/3NVInre
         qSMiBuXEQLJx5PTfm/E4HVXjDBpSd0o6w8c36zqIA00lDlTvsWFdjLfm29TR1UOVHWio
         bmGlF9yLZ2YNtQwb0eyoIeqjBnXVVugApA0b//fATqoaKcF8nUBQ8dWqCrmKWEp7FipB
         f4iDNQ1T7N62RavfRWst+u6OyQgEwOQfgbtegjMnttHEm+suSVxWsFf+u4rhmnmdeqkg
         tAPpaSvS9YHJpleEFzXk7Xwo7RVyJ/6GroIEY7a1B1V6kMgZ57TkPRGZOaWm+7ye2Aln
         TXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751549548; x=1752154348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzTZN1Rgi3KEaXkVhx7sTEQ+GfRghm0dQNuxhM8Lk7o=;
        b=EEPNe0TFW6kDfnqVNkkRfAkobQ0HpKRwvmQWMuj40sIi/oPlvrILWoMW4TUMmesaeA
         scoZoMt0cAH2JlLSlCHkWjEEk4cMbU1VpH/HXOz6dgWEB+1Z48rlU6WwfsJpUvSYwSoz
         w0OUvuvbhplPIq7uG4wiAQGNJ1FfqANyBpkI8278ejKbK8QdOSZWD9o44zF8kHqoUNuf
         E2sZUIQEqGplV3DdOECXPH/FxxcQejqrB8nq2SgyzNxn3C3lKadd9yMV2fDlm80bMNhz
         C9BSYUkSkGmrt0nBMRWSL8m4qbDG3I3C3ZPCi+ElhmCvpiNUkmjiVkBz9vFxd6NqdCVG
         XU1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBJw/1Oy/WBxG5R/3bSitrTPQ1ZuvGqkW2bVgCLPmps+0jmj+MC9dOM61zNbKqihYFAgcWuBzY6jrVh/uK2x9b@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+/j0retePdDuIvCxmp6kPwWoZXsSgZ9GUlumrAEmbigj/DrDi
	yxSqZkxTZEgGIHCGY2gPFQfyo696KaELw5DF1SbjY+K19ZDxTnja4/Fs
X-Gm-Gg: ASbGncsfw+QURI6lkxQcYSa+dDklIcO7P1tCVN0enZkWoUV1AeASrRJYloSAHYVORjW
	eTT11qB1G6cY4jZNXLEWCerkAdZuymKwpiNwLE0sSb8RbCy3DzMrOztBhySt9GdM+Dvp/65ulU3
	J2PKss+DXqgNHVeY6jLA5rKcprdL0qkZen9M0Boq9wpEluBb/Ue7sZUooVvI4yoJ8A/rrFVtbVj
	JsKiiazzrwjPdZu1PXtGI2YEwOlG7KkhQGbdXPcYw0p6ef2+dftFkvYSd9cPHytXO25ny3KUcP6
	3F+PsSzi4JYtAyrWr1B0Gawbr6T8z9Hww0z3DSMUdZ4RAaAp8Oa1ZzFO5d3DSy6UV29ywBR7nWp
	5DyuxGJieBlphChMN0SGCfnNlMv7uSJklnpBeBPVp8YTs5SWU
X-Google-Smtp-Source: AGHT+IGWpisDXiFyyqwzWsMXcKSEHmRXU6edUilLRNhMLwl6kmpAmMNt1c/YASvIJDD2NqdC0Xef1A==
X-Received: by 2002:a5d:64e4:0:b0:3a4:efbb:6df3 with SMTP id ffacd0b85a97d-3b32b14582dmr2868264f8f.10.1751549547337;
        Thu, 03 Jul 2025 06:32:27 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a999c8cdsm27218775e9.24.2025.07.03.06.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 06:32:25 -0700 (PDT)
Date: Thu, 3 Jul 2025 15:32:24 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: Forcing devices into idle
Message-ID: <e635l6gfpg7amck2hnu4l47tnc54lr6e26v7y3ohaywil6pjwr@4trxzfdigo62>
References: <rlzpjdsg6cbgxc553j6m25ysb6tyldy4lnxsjjn4hdzv7rszpp@y6rfcrbjfook>
 <fbfc6bf9-d7c6-4df5-85d0-b1d357159d88@suse.com>
 <CAJZ5v0hPh19h9uVRVHSXiLaHxm3PR9A3W5+j=2=-B-YCyBr=uw@mail.gmail.com>
 <hjkm55hus3ctueydf7ebfb25hbdw6w3spdzx7maauzlzmnakas@noqexx2pxxtj>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kl7qpfexrmgtjonf"
Content-Disposition: inline
In-Reply-To: <hjkm55hus3ctueydf7ebfb25hbdw6w3spdzx7maauzlzmnakas@noqexx2pxxtj>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_063229_389614_D8F4B83D 
X-CRM114-Status: GOOD (  37.88  )
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


--kl7qpfexrmgtjonf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Forcing devices into idle
MIME-Version: 1.0

On Thu, Jul 03, 2025 at 02:06:00PM +0200, Thierry Reding wrote:
> On Thu, Jul 03, 2025 at 01:12:15PM +0200, Rafael J. Wysocki wrote:
> > On Thu, Jul 3, 2025 at 12:33=E2=80=AFPM Oliver Neukum <oneukum@suse.com=
> wrote:
> > >
> > > On 03.07.25 12:08, Thierry Reding wrote:
> > >
> > > > Any thoughts on how to solve this? Is the pm_runtime_{put,get}_sync=
()
> > > > method acceptable? If not, are there other alternatives to achieve =
the
> > > > same thing that I'm not aware of? Would it be useful to add a new s=
et of
> > > > APIs to force devices into an idle state (which could be semantical=
ly
> > > > different from runtime suspend)? Or is this all too specific for any
> > > > kind of generic API?
> > >
> > > Basically what you need is what happens when the system prepares to
> > > do a snapshot for S4. However, if you just perform FREEZE and then TH=
AW,
> > > devices will assume that user space has been frozen. You need a way
> > > to substitute for that assumption.
> >=20
> > Well, you just need to freeze user space beforehand.
>=20
> Freezing userspace seems a bit heavy-handed. There's only a very few
> devices that need to be put into reset (such as the GPU), so most of
> userspace should be fine to continue to run. For the GPU the idea is
> to block all incoming requests while the device is forced into idle,
> and then to resume processing these requests after the VPR resize.
>=20
> But maybe freezing userspace isn't the heavy operation that I think it
> is. Ideally we do not want to suspend things for too long to avoid
> stuttering on the userspace side.
>=20
> Also, I think we'd want the freezing to be triggered by the VPR driver
> because userspace ideally doesn't know when the resizing happens. The
> DMA BUF heap API that I'm trying to use is too simple for that, and
> only the VPR driver knows when a resize needs to happen.
>=20
> Is it possible to trigger the freeze from a kernel driver? Or localize
> the freezing of userspace to only the processes that are accessing a
> given device?
>=20
> Other than that, freeze() and thaw() seem like the right callbacks for
> this.

I've prototyped this using the sledgehammer freeze_processes() and
thaw_processes() functions and the entire process seems to be pretty
quick. I can get through most of it in ~30 ms. This is on a mostly
idle test system, so I expect this to go up significantly if there
is a high load.

On the other hand, this will drastically simplify the GPU driver
implementation, because by the time ->freeze() is called, all userspace
will be frozen, so there's no need to do any blocking on the kernel
side.

What I have now is roughly this:

	freeze_processes();

	for each VPR device dev:
		pm_generic_freeze(dev);

	resize_vpr();

	for each VPR device dev:
		pm_generic_thaw(dev);

	thaw_processes()

I still can't shake the feeling that this is sketchy, but it seems to
work. Is there anything blatantly wrong about this?

Thierry

--kl7qpfexrmgtjonf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhmhmUACgkQ3SOs138+
s6F+6g//aRuHpYkzTMvccJ4QyH5yNDpNqRpGvN9HG7a5R6V0sul3YDjRBFiTSJ5U
87wncw9HcxnM/em3AHaqPeoGjLL5R95Sz1owAMh1TPxUHWfVlUfSqB5TCyd7dJ0S
O+F1EIjuVJrOcdd8P9gccBZLzJEkIGCdBe1ZAVWBapuj1wxAQxhPXZme/grtCiet
dzUbcHuZzkxThASpUDs0ftezwiamiW0W3xYKS+PjWC1sstlw7E2EIcsOTYyomLOA
LxcncWBzXYiApIwLuQtEI71We/5bATYbUJHdN1lo0Wc5tGlTFxgnKPRYME2WUit6
l2M6/3TfHPZOD7RxicU8NIeB1kBk5IefqiZ54SzH6BVuRV66gD56UmjxJP66K6vc
3OIgbXNeKwTsbMdd2Ho3fV9qEMfWdswH/YXev+WojMCGJLXQNzo9E6fO2bNH6FWA
5nHvK2/Ms2z6Q06Mbm+VSFnWSpcRf81vyqXFvD3ODX44hemA+tnEVB20T1/gEESe
Y8cuNsa0Jk6agmgQAA6Gpftne8R5gSO/gyQJrTJKBv+oTlR31P439/cd9nTB5pzT
aK0cD+JGCPoZZww4fuYwww5DwSRAq+/viU7Og71OF859E/BwOP6l5G2UDX7Qew9I
6Ekqjd9864mv0m9wIkDkLSM9gEU8E6qKMWQKyMrPzbJIQ1TJCpw=
=tnZJ
-----END PGP SIGNATURE-----

--kl7qpfexrmgtjonf--

