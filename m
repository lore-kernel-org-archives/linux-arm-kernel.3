Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622A6CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 18:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9yZQXqBch1JSJzcaQQctkjx9YKy3u8FyEyL/vNPgfc=; b=TmeuzHFEpMbYVKmTdX6S/tN1wD
	zB2i1mYwd/0kiA4Sl86nD3NhZW1rkVGj1n6DU7CJ/kVrkUuIufcQlBF02x5GLrLhWKL88sTbtblKk
	ht+NTs9euaaDChdkTuGYpSrgP1n5pTHJUBgHlEzo7xRw2LLYkcM9ox0bpteXnEfQVxBCLhYmmKvem
	hmrurrD/G3iqf8OLsI02mYXRmSlLcZ+sK5RyIUGA9N72kD2xdWYLAD0BoU98vMRp3oNmOIkVg7p4N
	vZKM7EtBqRDNEEgeyerBlw/+i7hw4EEiD2cVfVq7LEaPqtOk7cxgTTNSwHGXq/LfInmxPhHRlLwQu
	pcT/7iog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJc7j-0000000Aw9Z-24M5;
	Thu, 13 Nov 2025 18:32:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJc7h-0000000Aw8t-1XKv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 18:32:46 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47777000dadso8833065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 10:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763058763; x=1763663563; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v9yZQXqBch1JSJzcaQQctkjx9YKy3u8FyEyL/vNPgfc=;
        b=DgVaS9meF8soCexdGJXeDDuBijzdu/2XRCTDOtY+vMuOO26T5ZcPZ0UHTR2GKz6e/B
         /kO+klzmULKgV58DiC6mmCPpGGfIgUqhO6gHM8iVUDdGE0qav6sd9g0PFrt15if7rPn9
         k3orZrN4BXEbypW4W5zxTfTJfLXh8QWXjcf3A+th8U5MvUUV0A4kevxytFjID/Szw/H6
         V6NskOhkVT7Uu/BRL1+FleCVqhHDsyplptqgmLkp4coiTUo2irebBMKfVrxwjFdKD3s1
         THrlh0nuNg4TIIHzqgEAqkvQFPYERsmfYOnE6f1gUJZ/1wFdpP4KO0P1IPDqFbvitrFR
         +qCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763058763; x=1763663563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9yZQXqBch1JSJzcaQQctkjx9YKy3u8FyEyL/vNPgfc=;
        b=jB18fGsh83Lp9rZ+oeLAF1yJchJUL/cO4dq7EVm8R6MOfu09c5Cfm+XMNwNLJNsswI
         NaGeHyOyOpoIfnKiuogBn5XTBmx3IDrx+/jobMqUbDbCPicYLHr/oxBWaTJsOwehQ0mS
         rLucL+Drv0Db/prj8t9dymG2qClBVPc6xidY5pJ+uQK3SYvdU74eaVLqMRLv+rX7rrcb
         PlsgA4o6MriFFbxTxKIr6bZF/KIu6nCBIFwIB6aC2+lNMwCJuaw26Y3Ty2ek3GteEivA
         d5pz6QNtSEcfg+gDiPhhkr52RCX9TkVQST18eozYX3ZXQlNwULTh2/YNBsLRV6VEZlkk
         2xQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXdIthRrqXChlp5TpuDh7nbVVZxYojhBA0/zAqK4upsTe5mDORq4esmuNO6QpzbLkEBr8wTcWO6mK1/rpySyt/@lists.infradead.org
X-Gm-Message-State: AOJu0YwrTgQzrUbab8Jx0yBwz9m0iqMGRJ+Y2u2DdiwhZcdNB+QiAu5C
	Fw2Q5rDO4GCE4CefFmJNw+971fAmw5xOt40jgiB8CuE7nIq+ib7+Bbzk
X-Gm-Gg: ASbGncv890msZcS7y52a00xeGrPH2REWhbKXTgfktScF40PkQksnCJrtGh5fkRuRxKF
	zkwKB8yW89xrFUVUVjwuemnvr7f6b4RGVOtimt8tIj9YKTs9YcOL9pfOImlRVqwxvt6yQE87fXL
	/Mxc+lSysUrJ8BaZIrgVGTvlmhE+b8+ZscdjZ02uTr6VpexDX0J1XYKFzMtwVHZtWv7YtdUu9/D
	lPPd7pqOooZkuhRS05mXAKtG9ZaycdrrhZc1nh9kVFDttS7bNcAxeJ4bd+l1ZcQisQhDQQnqNX9
	Yv8Xan691Fb4m++9nXZX4yXodUHdsgiNYucWR6y8zEIvkxgUzMMvHF+thny4J11+kwDCN8hcp/+
	SzIubmNdnLe8gx0/0yioUIEH5rNNP8FLTZjJ+Q7DrVmDsmLc3QKTzdABD5/EZo39V2u0K6wHyVI
	nb49I32vK00votJGoFoIOeOZpYKKi7Q2qCXWkl7Vm25iZBIfLw3lotlarxea6Lf5bAtMsTxDnuk
	g==
X-Google-Smtp-Source: AGHT+IEUOfl9Mj/MhDnCs6vXeSUiBJWe5OA5hhf/B85epyvDSKEXz8FsTxq8lGXRcYwvA52KNvjEqA==
X-Received: by 2002:a05:600c:3b12:b0:477:67ca:cdbb with SMTP id 5b1f17b1804b1-4778febd327mr4653575e9.36.1763058762895;
        Thu, 13 Nov 2025 10:32:42 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c88bee1sm63595835e9.11.2025.11.13.10.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 10:32:40 -0800 (PST)
Date: Thu, 13 Nov 2025 19:32:38 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
Message-ID: <2tx3o5es77oa37zqvikcoo6n2ryxvepa54ezsaawcjdbf3g3wp@o2dbcbskjksk>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
 <20251029163336.2785270-2-thierry.reding@gmail.com>
 <CAJZ5v0igMJ12KoYCmrWauvOfdxaNP5-XVKoSxUroaKFN7S-rTQ@mail.gmail.com>
 <3dzha4qyqdrbutxby3n5nkvihnxrhniqr6w726eumhzgln2w5l@fbu72mzmjz4m>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7axrx4sqgqvkj2b7"
Content-Disposition: inline
In-Reply-To: <3dzha4qyqdrbutxby3n5nkvihnxrhniqr6w726eumhzgln2w5l@fbu72mzmjz4m>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_103245_420886_999CB5C8 
X-CRM114-Status: GOOD (  27.65  )
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


--7axrx4sqgqvkj2b7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Wed, Nov 05, 2025 at 05:52:01PM +0100, Thierry Reding wrote:
> On Mon, Nov 03, 2025 at 05:18:08PM +0100, Rafael J. Wysocki wrote:
> > On Wed, Oct 29, 2025 at 5:33=E2=80=AFPM Thierry Reding <thierry.reding@=
gmail.com> wrote:
> > >
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > Several drivers can benefit from registering per-instance data along
> > > with the syscore operations. To achieve this, move the modifiable fie=
lds
> > > out of the syscore_ops structure and into a separate struct syscore t=
hat
> > > can be registered with the framework. Add a void * driver data field =
for
> > > drivers to store contextual data that will be passed to the syscore o=
ps.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> >=20
> > This change is fine with me, so I can apply it unless somebody has any
> > specific heartburn related to it (Greg?), but in case you want to
> > route it differently
> >=20
> > Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
>=20
> I have a few follow-up patches for the Tegra PMC driver that depend on
> this. 6.19 is what I was targetting, so if we could put this into a
> stable branch that'd be the best solution. I can set that up via the
> Tegra tree if you and Greg are okay with it.
>=20
> If that's all too complicated, I can probably wait until the next cycle
> to merge the PMC changes.

I've added this single patch to a branch based off of v6.18-rc1 that I
plan to feed into linux-next so it can get some broader exposure.

I can keep that branch stable so it can go through multiple trees if
needed. If anyone's interested, the branch is here:

	https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git/log/?h=3Df=
or-6.19/syscore

Thierry

--7axrx4sqgqvkj2b7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkWJEYACgkQ3SOs138+
s6GbLQ/+LcY0n50MLCzG6P3cLlbnizYWB4fd77qBH6YbB2iRPf1TPkFtC1s24QiA
KgZqLzCkJ5rw0Xtvmtzci4gr3GeqsMf/4DM0k3X5WdN/DMat0RTe1rhVuxq0MmGV
7kmy+iB9FW6MgVt4kjeYdEL94ohEKXEUKTS6HTGfPFsonbJjnZdIsv4GVThClyxW
Y3vE0mnoAvxjqtVu57jc/Ihryv5Zz6pYiX9AWhT1ryTG7tmgKuFWW0YgqkFy/Y9O
rneSUrPJCeOBzjgL5oY6mPqTCl5f0VdGMb9S18RK+DKXSCLW7b0nGt4CCN7sEuOo
7Dy1UuUjok1XLs8NYPQ7oDD29Q536WmrUmQMjMm0R3HuqmmD+PDO0/I9QA2cuOvw
V1zUm+XqIlAyZs4lZkJXotqlCEBkPNCv0iIqEraETrCS1RYi/k0eqPF3Yu3oQc5p
58cnaEW28DaJ9+Cy7T4NCu7lsDzDyyL+5n4HQyWGaFkVYU+Wkfh0H1ezo8bP9txU
/Yan3s21OGdjzLMcCT0abiDrFOdN9N6HGOI2/UHnz87jxubwy7HjZ52Fkz3iGATD
uz1HyHzrIav2FWTN0PkENUQpiTQIHTs0znDBKPpTvDkeVbTF5nQuP2S0+bUGxvLR
BBevVnm7dT2dD5WqJbGfhem+DFPn66JVA5SFq9+/bvG0KsOpwpA=
=Jfb5
-----END PGP SIGNATURE-----

--7axrx4sqgqvkj2b7--

