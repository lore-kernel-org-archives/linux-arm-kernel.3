Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF63DC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jptqd9npIpSSr58W3BNGKvZuduIe2jf+FutnLFPaJ/Q=; b=FMj4kB9At0eOBD7ugghELydZ4F
	zqnAz6UfKbpwiQ1E7+flagZKY6nswj4Yjj6ge7aYaEApAzAKyL8qE4yJ8vZldckirWdFb9GoLRkow
	/sUQbEmcXowGB8StMAHsOElGzT8GBal0oESBzmK178jrgmmhxe3AlNbU8s012BgNyh4JQNyxmUkdI
	EbnkIH7J+daNzdlq3yK0cqHCvkTGGC3Eu3+9i2JOFYb3REKVkh70YYfEayqR6wu8HSi9yOMQhB6X2
	uK63pQTSSg3LVGjDX3tJNpF6tU1w5+X4MvJhNvBD+hI60KpTSaB4yFbk+iRZ1E4ikvOLErXnQ19hW
	RTwbOGhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk50F-00000001IZm-3MYB;
	Thu, 07 Aug 2025 18:06:11 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk4xg-00000001ILM-3l99
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 18:03:34 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-555024588b1so1468221e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 11:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1754589811; x=1755194611; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jptqd9npIpSSr58W3BNGKvZuduIe2jf+FutnLFPaJ/Q=;
        b=FPhibGdXnEmAlWd/EdGsNOnY13qy8Kk1MHfGlv65xEdB02PKna+M0HAAdGI24gLlts
         yzssWQ6hD6B1aNsXFm1czz9gbO67u0JOjVfdgCl3g0dJF4LiO4U8TrAQkBdlRgAXhkwT
         dImqP0FUA9RhQ+U7jdtV4B5+kYFy435FMkcYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754589811; x=1755194611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jptqd9npIpSSr58W3BNGKvZuduIe2jf+FutnLFPaJ/Q=;
        b=C0fNFr2y2Ynx5wsCVHKDXsZ0jKSDTe61xCfCVy7dR8a6pJWtHnn7pZ5RFVm4ckV9aD
         fXfZ2y3TiEHviqdcIGmej9tBM0DkbklKo2Qs4rKbbO0OVSXCUQWTpgMKg+za7ilwNCo2
         lZlAY3RLVeYVOnhnNEH+ZaYQlp+YLyLIed+UP0og/Rjz/sYFbSqzBt6vg8pJtuk3V4rg
         XIcvh5BhWmGmpnSsbHiWjmSHOM+yNj1GhMIxB80PXocCpYVkx4QzS6QF94kb6lVnFkDF
         u5OdtCUdCeSmYHQ/82/PcmOn9jiAL13idL4oGm7XViRR+EX93BLgSB49sZWU/ATiL9rX
         sq/g==
X-Forwarded-Encrypted: i=1; AJvYcCU55qwPkDOmMvv5PtZKPwHkKj9y0a3ro8nlSTG/VowzFqstNlKMWkolwralzWZd1FnoDuIoX+vT9ueQK00PVVcI@lists.infradead.org
X-Gm-Message-State: AOJu0YxmYVInpkmnigv97WTU55I+spHSiZNcXqL0nmSZevvbp8TRJ10t
	5WY+5CvA4o05wFGwI7LZEF6T3xZ/eMwMNEQUm56EFbqtKcmMnsN8wddKyuxzlhTHZsEc6/JhcF1
	vuVAFk5VUarcfBAr0YyLVo5nItGuFIMem7kYvxkBM
X-Gm-Gg: ASbGncuOaW99NBCUF8VwxeXcQMJ2Ax9Wdrdkcp1XYvRBLUl4gZDAkzPM9LRudw+rUWM
	+fDiOUcY3ebBezQ/rqp7BPOkQoweyhqdxqiM4Ah9471dPtJATIi6CWMKWzYCD0BXaFDodnxEQMA
	ASH3Lfgsv4DmDXV+UQpbeOMeyy0UkUEr7RXV47DPWwLcFsDzot57XUgFToJeCHWKROU3mc6HBZ1
	0ULYwPl
X-Google-Smtp-Source: AGHT+IGxtV1LWhrRdo3JC0zmjO/3qahbZxj88Vi4n0XQrjfEYquPT8WHMQimEMtyURA/sbB2cafcxr/JmX92fyxW0XI=
X-Received: by 2002:a05:6512:689:b0:55b:9647:8e75 with SMTP id
 2adb3069b0e04-55caf57bc22mr2577573e87.15.1754589810606; Thu, 07 Aug 2025
 11:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250613220843.698227-2-james.quinlan@broadcom.com> <20250806191448.GA8432@bhelgaas>
In-Reply-To: <20250806191448.GA8432@bhelgaas>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 7 Aug 2025 14:03:18 -0400
X-Gm-Features: Ac12FXyuvX7HlpoSndQL62wtvS59Rdx6QOQSiDT816IH2WZzhrhSN71QgjKybgk
Message-ID: <CA+-6iNxsnj7-Nsy4Q6wFbiF-a6BwfYeTnCqdg1sAUXPCpyaMzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] PCI: brcmstb: Add a way to indicate if PCIe bridge is active
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com, 
	jim2101024@gmail.com, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006b7a2e063bca4679"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_110333_077731_FAB9FEDF 
X-CRM114-Status: GOOD (  39.36  )
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

--0000000000006b7a2e063bca4679
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 3:14=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Fri, Jun 13, 2025 at 06:08:42PM -0400, Jim Quinlan wrote:
> > In a future commit, a new handler will be introduced that in part does
> > reads and writes to some of the PCIe registers.  When this handler is
> > invoked, it is paramount that it does not do these register accesses wh=
en
> > the PCIe bridge is inactive, as this will cause CPU abort errors.
> >
> > To solve this we keep a spinlock that guards a variable which indicates
> > whether the bridge is on or off.  When the bridge is on, access of the =
PCIe
> > HW registers may proceed.
> >
> > Since there are multiple ways to reset the bridge, we introduce a gener=
al
> > function to obtain the spinlock, call the specific function that is use=
d
> > for the specific SoC, sets the bridge active indicator variable, and
> > releases the spinlock.
> >
> > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > ---
> >  drivers/pci/controller/pcie-brcmstb.c | 40 +++++++++++++++++++++++----
> >  1 file changed, 35 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/contro=
ller/pcie-brcmstb.c
> > index 92887b394eb4..400854c893d8 100644
> > --- a/drivers/pci/controller/pcie-brcmstb.c
> > +++ b/drivers/pci/controller/pcie-brcmstb.c
> > @@ -29,6 +29,7 @@
> >  #include <linux/reset.h>
> >  #include <linux/sizes.h>
> >  #include <linux/slab.h>
> > +#include <linux/spinlock.h>
> >  #include <linux/string.h>
> >  #include <linux/types.h>
> >
> > @@ -254,6 +255,7 @@ struct pcie_cfg_data {
> >       int (*perst_set)(struct brcm_pcie *pcie, u32 val);
> >       int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
> >       int (*post_setup)(struct brcm_pcie *pcie);
> > +     bool has_err_report;
>
> It doesn't look worth it to me to add this.  It only avoids locking in
> a non-performance path.
>
> >  };
> >
> >  struct subdev_regulators {
> > @@ -299,6 +301,8 @@ struct brcm_pcie {
> >       struct subdev_regulators *sr;
> >       bool                    ep_wakeup_capable;
> >       const struct pcie_cfg_data      *cfg;
> > +     bool                    bridge_on;
> > +     spinlock_t              bridge_lock;
> >  };
> >
> >  static inline bool is_bmips(const struct brcm_pcie *pcie)
> > @@ -306,6 +310,24 @@ static inline bool is_bmips(const struct brcm_pcie=
 *pcie)
> >       return pcie->cfg->soc_base =3D=3D BCM7435 || pcie->cfg->soc_base =
=3D=3D BCM7425;
> >  }
> >
> > +static inline int brcm_pcie_bridge_sw_init_set(struct brcm_pcie *pcie,=
 u32 val)
> > +{
> > +     unsigned long flags;
> > +     int ret;
> > +
> > +     if (pcie->cfg->has_err_report)
> > +             spin_lock_irqsave(&pcie->bridge_lock, flags);
> > +
> > +     ret =3D pcie->cfg->bridge_sw_init_set(pcie, val);
> > +     if (ret)
> > +             pcie->bridge_on =3D !val;
>
> AFAICT, .bridge_sw_init_set(1) asserts reset, .bridge_sw_init_set(0)
> deasserts reset, and it returns 0 for success, so I'm confused about
> this.  If either assert or deassert failed (ret !=3D 0), I guess we
> don't know the state of the bridge and can't assume it's active, so I
> would have expected something like:
>
>   ret =3D pcie->cfg->bridge_sw_init_set(pcie, val);
>   if (ret)
>     pcie->bridge_on =3D false;
>   else
>     pcie->bridge_on =3D !val;
Ack

>
> Tangent: the last "return ret" in brcm_pcie_bridge_sw_init_set_generic()
> should be "return 0" and drop the unnecessary initialization of "ret".
Ack
>
> And the code there would be vastly improved by using FIELD_PREP() or
> u32p_replace_bits() and getting rid of the shifting.
Ack

>
> > +     if (pcie->cfg->has_err_report)
> > +             spin_unlock_irqrestore(&pcie->bridge_lock, flags);
> > +
> > +     return ret;
> > +}
> > +
> >  /*
> >   * This is to convert the size of the inbound "BAR" region to the
> >   * non-linear values of PCIE_X_MISC_RC_BAR[123]_CONFIG_LO.SIZE
> > @@ -1078,7 +1100,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie=
)
> >       int memc, ret;
> >
> >       /* Reset the bridge */
> > -     ret =3D pcie->cfg->bridge_sw_init_set(pcie, 1);
> > +     ret =3D brcm_pcie_bridge_sw_init_set(pcie, 1);
> >       if (ret)
> >               return ret;
> >
> > @@ -1094,7 +1116,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie=
)
> >       usleep_range(100, 200);
> >
> >       /* Take the bridge out of reset */
> > -     ret =3D pcie->cfg->bridge_sw_init_set(pcie, 0);
> > +     ret =3D brcm_pcie_bridge_sw_init_set(pcie, 0);
> >       if (ret)
> >               return ret;
> >
> > @@ -1545,7 +1567,7 @@ static int brcm_pcie_turn_off(struct brcm_pcie *p=
cie)
> >
> >       if (!(pcie->cfg->quirks & CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN))
> >               /* Shutdown PCIe bridge */
> > -             ret =3D pcie->cfg->bridge_sw_init_set(pcie, 1);
> > +             ret =3D brcm_pcie_bridge_sw_init_set(pcie, 1);
> >
> >       return ret;
> >  }
> > @@ -1633,7 +1655,9 @@ static int brcm_pcie_resume_noirq(struct device *=
dev)
> >               goto err_reset;
> >
> >       /* Take bridge out of reset so we can access the SERDES reg */
> > -     pcie->cfg->bridge_sw_init_set(pcie, 0);
> > +     ret =3D brcm_pcie_bridge_sw_init_set(pcie, 0);
> > +     if (ret)
> > +             goto err_reset;
> >
> >       /* SERDES_IDDQ =3D 0 */
> >       tmp =3D readl(base + HARD_DEBUG(pcie));
> > @@ -1901,7 +1925,10 @@ static int brcm_pcie_probe(struct platform_devic=
e *pdev)
> >       if (ret)
> >               return dev_err_probe(&pdev->dev, ret, "could not enable c=
lock\n");
> >
> > -     pcie->cfg->bridge_sw_init_set(pcie, 0);
> > +     ret =3D brcm_pcie_bridge_sw_init_set(pcie, 0);
> > +     if (ret)
> > +             return dev_err_probe(&pdev->dev, ret,
> > +                                  "could not un-reset the bridge\n");
>
> "un-reset" doesn't mean anything to me.  Is this the same as "could
> not take the bridge out of reset"?  Or maybe "could not deassert
> bridge reset"?
Ack

Thanks,
Jim Quinlan
Broadcom STB/CM

>
> >       if (pcie->swinit_reset) {
> >               ret =3D reset_control_assert(pcie->swinit_reset);
> > @@ -1976,6 +2003,9 @@ static int brcm_pcie_probe(struct platform_device=
 *pdev)
> >               return ret;
> >       }
> >
> > +     if (pcie->cfg->has_err_report)
> > +             spin_lock_init(&pcie->bridge_lock);
> > +
> >       return 0;
> >
> >  fail:
> > --
> > 2.34.1
> >

--0000000000006b7a2e063bca4679
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
mOAplh6h3nMZUZxBguxG3g2p3iD4EgibUYneEzqOQafIQB/naf2uetKb8y9jKgWJxq2Y4y8Jqg2u
uVIO1AyOJjWwqdgN+QhuIlat+qZd03P48Gim9ZPEMDUCAwEAAaOCAdswggHXMA4GA1UdDwEB/wQE
AwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xvYmFs
c2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEFBQcw
AYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAw
TQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2Jh
bHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDov
L2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwJQYDVR0R
BB4wHIEaamFtZXMucXVpbmxhbkBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYD
VR0jBBgwFoAUljPR5lgXWzR1ioFWZNW+SN6hj88wHQYDVR0OBBYEFGx/E27aeGBP2eJktrILxlhK
z8f6MA0GCSqGSIb3DQEBCwUAA4IBAQBdQQukiELsPfse49X4QNy/UN43dPUw0I1asiQ8wye3nAuD
b3GFmf3SZKlgxBTdWJoaNmmUFW2H3HWOoQBnTeedLtV9M2Tb9vOKMncQD1f9hvWZR6LnZpjBIlKe
+R+v6CLF07qYmBI6olvOY/Rsv9QpW9W8qZYk+2RkWHz/fR5N5YldKlJHP0NDT4Wjc5fEzV+mZC8A
AlT80qiuCVv+IQP08ovEVSLPhUp8i1pwsHT9atbWOfXQjbq1B/ditFIbPzwmwJPuGUc7n7vpmtxB
75sSFMj27j4JXl5W9vORgHR2YzuPBzfzDJU1ul0DIofSWVF6E1dx4tZohRED1Yl/T/ZGMYICYDCC
AlwCAQEwazBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UE
AxMoR2xvYmFsU2lnbiBHQ0MgUjMgUGVyc29uYWxTaWduIDIgQ0EgMjAyMAIMSO43VW7D5NP1X/KD
MA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCB47OOV0a6P5KfBZyQARHO6Hb1Ic1sB
CtXnXRF2W0+h8zAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNTA4
MDcxODAzMzFaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglg
hkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0B
AQEFAASCAQBy0YTB2Gg6ynrSyjUP4abbwTBs+0MzSETb+W8OwlkBgUqRinLtWyGi1GF6B94KjxXj
Ke3v23ttYBeW8zh9fHbFYYYblpdhFBRljfJ6Zc2GI1QaifFDYmXVOtke+aQs56h/rlvG3QbmDQ/v
9F+gkEU8w9rJc5DEQPiaS1mnFCagaJ5OoD1fPQf8h33adJAmzVUsMHX311n5aRWxMFcIn9pi5Nhm
kLc6bJWVKNhXhaLFcGlCL1XM5pvsoOHzfEjSjFa7S5+prmdEDRziMQG/Zl3tRvGS8dof4EQdoSM6
0n1grxmjGOj2+XTaeuia2r7icN8uI5D8pwnIK77RqnUsdyTS
--0000000000006b7a2e063bca4679--

