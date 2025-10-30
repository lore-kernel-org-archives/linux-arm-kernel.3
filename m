Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98655CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2h4BnseYLvI915SuwI6txSi2xO1Lp6zcqUfBWQt5q8=; b=NJ/B51A5BWVVS8Zb2snv1FIhWD
	UhXjRd++wFFprGLjvyWavnpd82yiyB09Q6c+5eXeYpclmyN6vYBIgdWCKhSPGlMjxXV6c1rbsKpDW
	5IY/H2NO69sEVzfM6Cxhgd8Kwcun+uMU590ZGNp1wjeUXLtgbhpROb0D2+eWnNhjQiohdzDt7wnvv
	EpG3QO4RAiQTsPz9WwMGYDkj8uWeUDUHm9GioxVWkWUj90+TRmplKxclQ7kyqAIAJvVMwsUX8rZgw
	hB/lp9u7yC8wEiAfwCNxa8u1GeDdGeoRseOsson+w9HOkRjPeAFB642o82T2Vu5tR5gQsnCg/91vP
	Siga97QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERZl-000000046A6-0zTH;
	Thu, 30 Oct 2025 12:16:21 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERZi-0000000469J-2hRv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:16:20 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4298b865f84so476416f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 05:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761826577; x=1762431377; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s2h4BnseYLvI915SuwI6txSi2xO1Lp6zcqUfBWQt5q8=;
        b=SOfL+JGTIkRkH/rpJLaF4dTjmz7h/Vis0wl6dk5TxGBaNundcLYGANJRD3gbZq0BX5
         AXJ2TfX7Sud8jd40SxF2ewQ29ZwlwOFKSrIc2dUTLq60NsgYxw5Nf1Jp3wt8dmuOQcpN
         cK4dLWT5MuIBxw4n1rg0ZtqmhI5Wreezt2qhlLMp7OWL1q+75DwqbhkM9R3Fk4xQ47Kg
         xw8aKYcIf2A6vslyAuI20AGBwa3O0xIsy0xzuEPIdAE2khAAqoR5G+OTO2Gq0xcsKYrq
         6SfYxjM+ayA+GgCkD1I5jHM0M0ZLb7bi+n1I75ViJvCByX1PP7RsiLTeJ3BNX4RySvkp
         YuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761826577; x=1762431377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2h4BnseYLvI915SuwI6txSi2xO1Lp6zcqUfBWQt5q8=;
        b=TTki+SxR0wn08PId6ZC4QN63Diz/wmI3rBQlJDabO1lpoTKHMP3rUysWyxQVQ3mEFl
         OJP/ilvpOcxadLTxhP0nN6raCb2Pkj258qXAW/LDIS0Rua+oCwWV7cCJS7KA2gayQZoe
         Sxnz4TxWTYeP7I1tBrUaQBbczECMsPceXf3JdRZgU3umpD4KIRVj5BI5EtlxkZaoGfuY
         /qXKcxtXIYwTqBr49adcvYVjGJjb97cAh/9RU8poow7sjF956SdS6d97cHlmn0Vw5tnG
         aNgzM5tw5nPj4oG6dLsXFHnWVuc//9EjOfY2zbsUpVF2r9NLpy7L6ar6uDQUlXhPXbaO
         qS9w==
X-Forwarded-Encrypted: i=1; AJvYcCW2dE2VThjD0vq80VFiQNthfa6scanLy25zD7Eh79lOaTo+6Qi9ekBFs8zT+YHrYzL1he8Ri13//1H2ksTod5q/@lists.infradead.org
X-Gm-Message-State: AOJu0YyOSWc3ZJ8XaLbx3Hq4nups47Z8eLlZGEN3lJZclo6TLBX0j+fy
	XAH6MIRWFSvAAYv/jVNIfhEUxNnoxVz2KaYtnsCFZXU8E2D3KicH571P
X-Gm-Gg: ASbGncuMwu+c8jNSa7WUlRL+gR1vCJJEq6OTJB5RKzwf5Hi2ztqhO/hPNye1YB5Uqk8
	S55+0S0wCDfx2vFf0SwxzLL2rZANR5MaTD3bw+gDjDIsDW+Tt+/nRo48oG338YOnO21OWePm+by
	bsVPPJf30mSEy/41PmGvvV/3Y0/b91pGfe+g0Rs8V1wAyrT4hdZiZ2vVgu5DpTAWhWq6wTNMzu3
	u4u1skGGk1Plmb86D9nqNNeJzEUfXfpVeWSaeEeNcytSaMtGjXaTIkOA9LnQCW4isf5vG7lETlg
	40p7fXe2C9Ll0xIa7kM6Q6EAMSZR20qCzq/C2bNM7T1TKbRn4rR394pCbFwdxSHxkfiXuwSoF2f
	ucxG03Z4/VaiBI/02p/cSyQ4SzhSPtrCnGAlR9UX5NjO7xW7VRnRPwt6t3DmKP0gLnUNdh1+I2D
	lJOI3IuUDWBTSZjQ9WXCppwYYOx6wZY8QBuQS44Q+lzPFrU3k7kg5Kc+rwTOZ/ogqbHdTbgRlEK
	7n79GgrVbDU
X-Google-Smtp-Source: AGHT+IFFiHEvNPjKUlWf15eT6QrZW2LM5hHmfdRjCPGtpfvtcJfaix0mKpAwNuPfyTcNYpcwrmxIZg==
X-Received: by 2002:a05:6000:2508:b0:3fb:aca3:d5d9 with SMTP id ffacd0b85a97d-429aef76469mr4752945f8f.1.1761826576503;
        Thu, 30 Oct 2025 05:16:16 -0700 (PDT)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db839sm33617710f8f.34.2025.10.30.05.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:16:14 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:16:12 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] MIPS: PCI: Use contextual data instead of global
 variable
Message-ID: <t3la3jte5tia7rh5ftuv5cchrwdxe4cxa2v3g6lxgoh5u6rmcy@hzw7lbke2vac>
References: <20251029163336.2785270-3-thierry.reding@gmail.com>
 <20251029174654.GA1571737@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="stoiegldli5skly3"
Content-Disposition: inline
In-Reply-To: <20251029174654.GA1571737@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_051618_734627_56D9F780 
X-CRM114-Status: GOOD (  35.95  )
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


--stoiegldli5skly3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/7] MIPS: PCI: Use contextual data instead of global
 variable
MIME-Version: 1.0

On Wed, Oct 29, 2025 at 12:46:54PM -0500, Bjorn Helgaas wrote:
> On Wed, Oct 29, 2025 at 05:33:31PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Pass the driver-specific data via the syscore struct and use it in the
> > syscore ops.
>=20
> Would be nice to include the "instead of global variable" part here so
> the commit log includes the benefit and can stand alone even without
> the subject.

Good point.

> Awesome to get rid of another global variable!  More comments below.

\o/

> > +++ b/arch/mips/pci/pci-alchemy.c
> > @@ -33,6 +33,7 @@
> > =20
> >  struct alchemy_pci_context {
> >  	struct pci_controller alchemy_pci_ctrl; /* leave as first member! */
> > +	struct syscore syscore;
> >  	void __iomem *regs;			/* ctrl base */
> >  	/* tools for wired entry for config space access */
> >  	unsigned long last_elo0;
> > @@ -46,12 +47,6 @@ struct alchemy_pci_context {
> >  	int (*board_pci_idsel)(unsigned int devsel, int assert);
> >  };
> > =20
> > -/* for syscore_ops. There's only one PCI controller on Alchemy chips, =
so this
> > - * should suffice for now.
> > - */
> > -static struct alchemy_pci_context *__alchemy_pci_ctx;
> > -
> > -
> >  /* IO/MEM resources for PCI. Keep the memres in sync with fixup_bigphy=
s_addr
> >   * in arch/mips/alchemy/common/setup.c
> >   */
> > @@ -306,9 +301,7 @@ static int alchemy_pci_def_idsel(unsigned int devse=
l, int assert)
> >  /* save PCI controller register contents. */
> >  static int alchemy_pci_suspend(void *data)
> >  {
> > -	struct alchemy_pci_context *ctx =3D __alchemy_pci_ctx;
> > -	if (!ctx)
> > -		return 0;
> > +	struct alchemy_pci_context *ctx =3D data;
> > =20
> >  	ctx->pm[0]  =3D __raw_readl(ctx->regs + PCI_REG_CMEM);
> >  	ctx->pm[1]  =3D __raw_readl(ctx->regs + PCI_REG_CONFIG) & 0x0009ffff;
> > @@ -328,9 +321,7 @@ static int alchemy_pci_suspend(void *data)
> > =20
> >  static void alchemy_pci_resume(void *data)
> >  {
> > -	struct alchemy_pci_context *ctx =3D __alchemy_pci_ctx;
> > -	if (!ctx)
> > -		return;
> > +	struct alchemy_pci_context *ctx =3D data;
> > =20
> >  	__raw_writel(ctx->pm[0],  ctx->regs + PCI_REG_CMEM);
> >  	__raw_writel(ctx->pm[2],  ctx->regs + PCI_REG_B2BMASK_CCH);
> > @@ -359,10 +350,6 @@ static const struct syscore_ops alchemy_pci_syscor=
e_ops =3D {
> >  	.resume =3D alchemy_pci_resume,
> >  };
> > =20
> > -static struct syscore alchemy_pci_syscore =3D {
> > -	.ops =3D &alchemy_pci_syscore_ops,
> > -};
> > -
> >  static int alchemy_pci_probe(struct platform_device *pdev)
> >  {
> >  	struct alchemy_pci_platdata *pd =3D pdev->dev.platform_data;
> > @@ -480,9 +467,10 @@ static int alchemy_pci_probe(struct platform_devic=
e *pdev)
> >  	__raw_writel(val, ctx->regs + PCI_REG_CONFIG);
> >  	wmb();
> > =20
> > -	__alchemy_pci_ctx =3D ctx;
> >  	platform_set_drvdata(pdev, ctx);
> > -	register_syscore(&alchemy_pci_syscore);
> > +	ctx->syscore.ops =3D &alchemy_pci_syscore_ops;
> > +	ctx->syscore.data =3D ctx;
> > +	register_syscore(&ctx->syscore);
>=20
> As far as I can tell, the only use of syscore in this driver is for
> suspend/resume.
>=20
> This is a regular platform_device driver, so instead of syscore, I
> think it should use generic power management like other PCI host
> controller drivers do, something like this:
>=20
>   static int alchemy_pci_suspend_noirq(struct device *dev)
>   ...
>=20
>   static int alchemy_pci_resume_noirq(struct device *dev)
>   ...
>=20
>   static DEFINE_NOIRQ_DEV_PM_OPS(alchemy_pci_pm_ops,
>                                  alchemy_pci_suspend_noirq,
>                                  alchemy_pci_resume_noirq);
>=20
>   static struct platform_driver alchemy_pcictl_driver =3D {
>           .probe          =3D alchemy_pci_probe,
>           .driver =3D {
>                   .name   =3D "alchemy-pci",
>                   .pm     =3D pm_sleep_ptr(&alchemy_pci_pm_ops),
>           },
>   };
>=20
> Here's a sample in another driver:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/pci/controller/cadence/pci-j721e.c?id=3Dv6.17#n663

I thought so too, but then I looked at the history and saw that it was
initially regular PM ops and then fixed by using syscore in this commit:

    commit 864c6c22e9a5742b0f43c983b6c405d52817bacd
    Author: Manuel Lauss <manuel.lauss@googlemail.com>
    Date:   Wed Nov 16 15:42:28 2011 +0100
   =20
        MIPS: Alchemy: Fix PCI PM
   =20
        Move PCI Controller PM to syscore_ops since the platform_driver PM =
methods
        are called way too late on resume and far too early on suspend (aft=
er and
        before PCI device resume/suspend).
        This also allows to simplify wired entry management a bit.
   =20
        Signed-off-by: Manuel Lauss <manuel.lauss@googlemail.com>
        Cc: linux-mips@linux-mips.org
        Patchwork: https://patchwork.linux-mips.org/patch/3007/
        Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

So unfortunately I don't think it'll work for this driver.

Thierry

--stoiegldli5skly3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkDVwcACgkQ3SOs138+
s6FWDw//asJQ0od9HClRIj0RNLWAbliTk9QI3rUVvZd0krnee9oWFJS6p9gosZi7
Baqb5WJ5xo7atxuHYK6RlAFAina/LUDWNpY9w1up0hM1K/NqVj0D6Ufrx2O4zw2Q
5Ff2rbnpTBndYi8w6kth5MU4p/g3VtsilfSmErNPBQQF2CUQA3qmp3XVvAvbaH8+
aUGS2rLpxX0Q06XGtXMtnvf4LHF4uzbZkX+AC6XqcBFT9BSgSjAKr65vMcYnqRqL
sRxPbqQ9e6iZ2SibX+o61epk7rmO72XUa1v9TpZ24JNuvUIJnLfwm8D96f8NJEzK
EznsDwGuOT/G87UYPvgqTZDbT8hbSvDEjGnlF8a6xtPP14Zm9hlMc0b9ZJ+wgMV4
aMq7WckO8j/yY3NLAIokI/pMm5D11aYCSmk4PS7K4KdubNSeD+18J0QOZ/4cJyIQ
cWI/P6sqD62A0QPMbbbtBa3MP9RbCZ0zhfFwI9dTprNJ7I7bijD/OLo798mkNB2f
71+yECk1VnOKeAj9v80k479HlfUHaGCpRiEzWaKJ3IvLNqgUKH0q8nP8/McNXEKL
8rRCO+5Ona/ND0lf2fue+/QeT44Fi24invQSdsgGdeaxEmcDkW06HSOK3Cp4pZWB
E86uRaPgXuSRgDbxv2MMtv+PNWNWlqYzJ5/Lz0AkTm920p5RAvk=
=Pbyc
-----END PGP SIGNATURE-----

--stoiegldli5skly3--

