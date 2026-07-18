Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52E9C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 14:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dn4+/xgeieh1LHD6He5u6OXfezns/RApi+yaHTB7VZY=; b=2cI9rQxzLmfanXs7RfhZsY00Zy
	VmqJLegSFA4wyPLsuj3980fxGqf1OLkx4JEFoZ6K/xniNrkiUc9KbsKLbPTE01lKVpdy6AHOTtnzO
	oY70JkW7sLtjd3fDlOapgVmVDEswiOJdt7OrMtOmO7ndYcvDK1BWlN9Lqy/QehRwy4T8KKL6FdwOc
	uf4DWukw9R72goVBBIM9zxpD5ia1+hOujxs89qhH1rDr7tlm6uhK45hoNWs7Vc8RZVQmYjLS8geEl
	uEHaNPqux5F6+O0GvgdhSlP9CKUWPjjGc9OzIf+oh7OAeXttPqlr9URDRmTGKLBOfx147Mvlg2Fw5
	eIoQOAmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl5iv-000000049Dz-3R30;
	Sat, 18 Jul 2026 14:09:01 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl5is-000000049DY-2jWJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 14:09:00 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso4779251f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 07:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784383736; x=1784988536; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dn4+/xgeieh1LHD6He5u6OXfezns/RApi+yaHTB7VZY=;
        b=bQ1a8VCZOOZ4PWcF6Gqbx/vNC4GR0brRXlscVQPYZcPfkQ+7DEnjbVwUGb1qTm5tsg
         9VFBQBt7jUXtMCffyqDReo4x145s/+506CRmdTrj1GO2JKA5q0eV5/PWFh24KW/CIyZd
         IOAaVkij8LSxMi0EWYGPYM6Q5jzokHzdY3j6rnqUKRinKg1bFVVNlOd3ZnI2+guypppv
         j/LrCC7SYXuJtPjFYuaVm9MdGf/InQYkR1M3lbg3ZMU9ZagzkFQJDNCowF1wYEGZzhRh
         oez4OV/K0sWdKikwUTLIAigSWWC8RQ7IInw3XuowUr4uIlseugyVD9P7caVMDoZ+RnEo
         ll3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784383736; x=1784988536;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dn4+/xgeieh1LHD6He5u6OXfezns/RApi+yaHTB7VZY=;
        b=FDqflu0lKHmh0jjLldnZGgTFWVuqWKgx+92nvE1cGmw/RqCcnEhBm8pdPSoMalHJNB
         zHXOpDkXtQzRDM+qkTf9A483HeKyvs4NU3ttU1YJoCyEMMeEA3uZtNd/8usIksNaf4Bg
         AV4/2xnSdFpKdrlj+DSBHsNwdzxcg8MNoOu/rFka/N4+Wb4/h6Qy42DyuN4Perkg7rHs
         DMXhSH1CuH3s86iTgDg52KHVAhjCFOtnSy0CJmDMYv0qCruJe5lMSM5xo4s14ZkPW11t
         7SNjMfsk+h77PtotA9j+KDyNT8NeMfN7qgAXJ+0z9CEpZTkpFOeQ+kEoyqOaSEiiYFgM
         psLg==
X-Forwarded-Encrypted: i=1; AHgh+RrmIc07EArBEoVm+z4bZa9gVmCEsz2HZW/fHg2PUhG+qmGbFOC2d18i871lkkqKHPyb18ssiScSeX0lNaG5X9LO@lists.infradead.org
X-Gm-Message-State: AOJu0YxbKKAGGDssZUq/avoZozklFa5imuPFRD8/x5OcpA54zaRuvmXK
	s1pHMwF2tWEXrsVCMf0VnQ9EQBMENmM1aqbnwULmkLVgPkJOQM3vJ4E7E9nRZNhBSbc=
X-Gm-Gg: AfdE7ck/wn01zXrsp5YA3kc1g0W/XOiDNVsrmEiId9j0I17+zqaExYQ/vdF4PmvBzNT
	4OppYFyYT887Lli2RIaKmFzEKmE+/JZ462L7iiIK8+cwDQJ/jy0eOWxtU+zWp6FqLomDIcbPR29
	eaxnw+3BWOA04r5rpZNQGaDoovBr2kDhUH3ekxvz0hPSheN3vb0u/UmJCFLCoIMLIn0ueuke5NB
	OJp4U4qV+QzHQNN9EpX0uGNrm9PFyMbUq++JzHSYBHxxq7RjGzqAzSqc6R+hcmDFhQAMAKTiRc3
	6zXtchtsngGLzZGWArzM+5C6zWS9o1nfjc/eAO99Ircss7o3tbBV8XEsKD5p0c3V6Yyn/chM2R7
	cMUGAyjuQazkmK4X00UUNL4Wr3LtCJpqp3Oh6gKCwEcksvhIf2U5xR7qcSrMaofDz1B+dtrzylN
	A+XVghIXg=
X-Received: by 2002:a5d:59c4:0:b0:479:37e8:44e7 with SMTP id ffacd0b85a97d-47f62330be5mr9388858f8f.40.1784383736446;
        Sat, 18 Jul 2026 07:08:56 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63e49ce4sm13571967f8f.8.2026.07.18.07.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 07:08:55 -0700 (PDT)
Date: Sat, 18 Jul 2026 16:08:54 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Marcel Holtmann <marcel@holtmann.org>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Use named initializers for
 pci_device_id array
Message-ID: <aluGI7g2BbOsrjoM@monoceros>
References: <20260504160940.2168650-2-u.kleine-koenig@baylibre.com>
 <aimXkX4FC4JVxt6q@monoceros>
 <CABBYNZKuOdtxa8ksEZM1FyjYJCQ22H6NzaX31t6LcZuvn0LMNg@mail.gmail.com>
 <ainSCcYroJUIAuwr@monoceros>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bwnxy7zgptzm7mmy"
Content-Disposition: inline
In-Reply-To: <ainSCcYroJUIAuwr@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_070858_719572_8ACA573B 
X-CRM114-Status: GOOD (  29.00  )
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


--bwnxy7zgptzm7mmy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Use named initializers for
 pci_device_id array
MIME-Version: 1.0

On Wed, Jun 10, 2026 at 11:08:49PM +0200, Uwe Kleine-K=C3=B6nig (The Capabl=
e Hub) wrote:
> Hello,
>=20
> On Wed, Jun 10, 2026 at 01:13:44PM -0400, Luiz Augusto von Dentz wrote:
> > On Wed, Jun 10, 2026 at 12:59=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Cap=
able Hub)
> > <u.kleine-koenig@baylibre.com> wrote:
> > >
> > > On Mon, May 04, 2026 at 06:09:40PM +0200, Uwe Kleine-K=C3=B6nig (The =
Capable Hub) wrote:
> > > > Initializing a struct using list initializers is hard to read, comp=
ared
> > > > to that using named initializers is more ideomatic. Convert the mac=
ro
> > > > used to assign values in the driver's pci_device_id array according=
ly.
> > > >
> > > > This change doesn't introduce any changes to the compiled array on =
an
> > > > x86 and an arm64 build.
> > > >
> > > > Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-ko=
enig@baylibre.com>
> > > > ---
> > > > Hello,
> > > >
> > > > this is a preparing change for making struct pci_device_id::driver_=
data an
> > > > anonymous union (similar to
> > > > https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@ba=
ylibre.com/).
> > > > This requires named initializers for .driver_data. But even without=
 that
> > > > this is a nice cleanup making the macro better readable.
> > > >
> > > > Gcc is happy with simplifying the assignment further using
> > > > PCI_VDEVICE(BROADCOM, BCM ## id ## _DEVICE_ID), but this is a bit f=
ishy
> > > > because PCI_VDEVICE also assigns .class and .class_mask (using list
> > > > initializers), so I didn't convert that.
> > >
> > > In the meantime I learned that doing that would break W=3D1 builds, s=
o it
> > > was a good choice to not go that path.
> > >
> > > > Once all pci_device_id use
> > > > named initializers, the two zeros can be dropped from PCI_VDEVICE a=
nd
> > > > this entry simplified accordingly.
> > >
> > > Is this patch still on someone's radar? Ideally for application in ti=
me
> > > for 7.2-rc1?
> >=20
> > It is no longer in patchwork so if you really want to get in please res=
end.
>=20
> Instead I unarchived the patch, so it appears in the patch list again. I
> hope this is easier for everyone (it is for me).

That didn't help, it is archived again. So I'll resend, but I still
wonder about the processes involved. Is there a bogous automation that
archives patches after a while? Or is someone archiving patches by hand
that look old? Both make patchwork as tracker somewhat useless ...

Best regards
Uwe

--bwnxy7zgptzm7mmy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpbiPIACgkQj4D7WH0S
/k4c1wf+KcoE7dFmw403md8qqMbo0WQC/qoBEezSjlMwYrzakuDItdFVFoNFBiCw
3EObuzygqxIZE1BYccJoTvjRtkU/V4QVAYqS5pildQ4p7Vt09YDxPiUFxQO3Od6o
PyEDcKR7ILURIN4O6peARALntWYwQ4Nzk2NYS03yGSxfNXKc4LIIG6fgrVdcgw+n
HeSwcSRmqXFa16BTplVQTAMtsHC4TUC+HieWosDtJeg03LURbBNLamGWO33DrLBs
qbaU3zNaHSZvoxXUgEI0W2f2U2J0Gn4RhjRAtB1lOfO1Do1QWz/UWUYjgiiwA0xk
JK0AS0bg5Wz9FlvUWkIcrWyp2kTPKA==
=sRN4
-----END PGP SIGNATURE-----

--bwnxy7zgptzm7mmy--

