Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D242C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLTXQ+jfU88JSGv7Lh/A+xkjnHoYFHk+Tdqt/10T0QY=; b=UfZFC+GQdjlX+Y5yKaalcNml6n
	1QtKAiT0ypZ6w28XkTlWzU2YVPjg05tAJ8wK9Xlnv1fESYRnulz7HlOY01M6RE4cJcFCVNlJLCHcU
	wDAiWD3yA5e8BrwV9PHUH4V7xinS4Nof+hl/3y9efG0CO0eDdHwoZqxk7UkJ1kpF0mwqJhH9jTlcB
	dg5q1ybBlGZSN+bSK+HGCvSpxTPMwMx6GBYa5bVx/ZzJiX2RQFkZXKT0x2bHufLfGzt7+ae4DebRM
	f66hmiNNCCMYzai03ZkNjw0qFuEX+J6NtcUy2bN8GnmR6bDoGfRRyFkxzV4Z04TKRyLhusIML+yiy
	U6btupTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvdt-0000000EGx8-2Fmk;
	Wed, 15 Jul 2026 09:11:01 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvdr-0000000EGwX-1XF4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:11:00 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so3604292e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 02:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784106658; x=1784711458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLTXQ+jfU88JSGv7Lh/A+xkjnHoYFHk+Tdqt/10T0QY=;
        b=AGzbl5Bj73z6JnVONMEkNf1e4bkOMR+9tlGri+v9UfMZDPqJYh/wMZkwhMofmskMnr
         YU1ptxBezAbqesuNO0jGuyvtppzBJWWNMfF5aOdv1K7CLgC0e0o8kRFoScA7d2x+S3z1
         zW4RDQ5AqHZwWQHwXWYBW8eIGl66pArTLVnjderXEXEJ3GGDhBAlnudTqcIfAfOXwMEZ
         voOHpqgJcyRxpDjie+rzw97zBuPQewhA1A+mW0MOv91GCDJ4gR++k3KDT1NxkJqOTxeW
         CqeHaRPSUL0mURYtfZcSSsAbO1hx/EXULxXzDWFWjKGdNY/Olf5hfnu9IHCMtMIfTGMg
         O0cg==
X-Forwarded-Encrypted: i=1; AHgh+RryWBUcCO5UMpI5nTeIi0kx2Hd3vE8j23Q2q1FIMir/cVcjQR87pIgL46X76s/ZaB6S8urVpvT59EPD0KmHZPWg@lists.infradead.org
X-Gm-Message-State: AOJu0YxTgoS08bDM4S1byTvqbYT22RdZowr6JLW1kCEHjYXG3dyLD/zx
	8iHvmVagSAwo0g+HejnXQAIKWuf6ZiZJhN61KTHo399awgIbuySJqFQdc1awr4UNfhY=
X-Gm-Gg: AfdE7ck/FQstqYRfE04QpsK4D5KFhCFECIPXbh0HcMOIYww2L5LLA13E5QFMM8B38Aw
	aWw6GKtytvikcf70IcLmjbOc9rTcnulxNAc/D32X9/cC3MH771+orr4Gm7D1H4KJ214pj9b1I37
	NzUwutk8Vm4ar87EyUrupeZCCjcZ2oZ3/n8jJ8En21XdHyUSg0qEYIh5gbjDnsWbZHuxnM+gTHA
	PwmJTI5hqG5uNYWJo+yFNuf0IyLcPOmsYW4C1UXBgiuDB+jGCOuBNQ4Hj2y8x+zl+LxfryL955m
	rWsQTIopy57lCh5LevhwaT2H2P0OOgVALMyGG0DspFm19CLY7QpD4nArWz7PWNH/pj+v17HevIh
	W5o7l4HNd9hUaynDXpnrAwASrYcCUb19NxFpL8XeWtrkc/rsi/YtN3K8qf3DbCzMtn/RC2oNGe6
	ATEUrcfqLHEBPRZRmLPEPw6jLRYcu2H1upyg9DUJeAAKhCzuTL44FQqw==
X-Received: by 2002:a05:6122:e18c:b0:5bd:b27c:bace with SMTP id 71dfb90a1353d-5c1252fb83dmr1256193e0c.14.1784106658065;
        Wed, 15 Jul 2026 02:10:58 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf8bc8e082sm10062272e0c.1.2026.07.15.02.10.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:10:58 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bfa6766cf6so3442041e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 02:10:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrf3Dvf88A30AUAdckkt+k5g24vLf55dJbXHgGgguUnugPXy8edMTa3lY8M2Drm3GSOAiBxFF7cIhFxnSxsKFaS@lists.infradead.org
X-Received: by 2002:a05:6102:4425:b0:738:2a8c:736b with SMTP id
 ada2fe7eead31-7459a045858mr1258510137.20.1784106657725; Wed, 15 Jul 2026
 02:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <23f979b0903ca11513ac339ab8b6dd40435603c5.1783505142.git.geert+renesas@glider.be>
 <CAPx+jO-=LF9CvYDrC3O_GBtfHU6GYvq524OLmTG8R1-u27oyKw@mail.gmail.com>
In-Reply-To: <CAPx+jO-=LF9CvYDrC3O_GBtfHU6GYvq524OLmTG8R1-u27oyKw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 11:10:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUAwxs50S7hwWRsSmtRagD7Gu4rodGund4k3r1x1+A5ug@mail.gmail.com>
X-Gm-Features: AUfX_myLu6xhapX4cEw1JPlcU_GnqjYP1lw1RxK8SjV_xKv0JfjeAPhzRG7BCHM
Message-ID: <CAMuHMdUAwxs50S7hwWRsSmtRagD7Gu4rodGund4k3r1x1+A5ug@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_021059_520869_CDF790A7 
X-CRM114-Status: GOOD (  36.44  )
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

Hi Ulf,

On Tue, 14 Jul 2026 at 14:04, Ulf Hansson <ulf.hansson@oss.qualcomm.com> wr=
ote:
> On Wed, Jul 8, 2026 at 12:15=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> >
> > Add a minimal Module Controller driver for the R-Car X5H (R8A78000) SoC=
.
> > For now this just supports the always-on power domains, and dummy clock=
s
> > and resets for the serial console (which is enabled by the boot loader)=
.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- /dev/null
> > +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c

> > +static struct generic_pm_domain *r8a78000_genpd_xlate(
> > +                       const struct of_phandle_args *spec, void *data)
> > +{
> > +       struct r8a78000_mdlc_priv *priv =3D container_of(data,
> > +                                       struct r8a78000_mdlc_priv, genp=
d_data);
> > +       struct device *dev =3D priv->dev;
> > +       u32 id;
> > +
> > +       if (spec->args_count !=3D 2)
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       id =3D spec->args[0];
> > +
> > +       if (id >=3D R8A78000_MDLC_PD_AON) {
> > +               dev_dbg(dev,
> > +                       "Mapping HW power domain 0x%x to always-on doma=
in\n",
> > +                       id);
> > +               return r8a78000_genpd_always_on;
>
> This looks odd, but perhaps it's just a temporary mapping that you
> intend to change later, no?

The hardware has multiple always-on domains, but on the software side,
using only one is sufficient.  When needed, it can be changed later.
Other domains will be added later, in the else branch.

> > +       }
> > +
> > +       dev_err(dev, "Unknown power domain 0x%x\n", id);
> > +       return ERR_PTR(-ENOENT);
> > +}

> > +static int r8a78000_genpd_always_on_singleton(struct device *dev)
> > +{
> > +       struct generic_pm_domain *genpd;
> > +       int ret;
> > +
> > +       guard(mutex)(&r8a78000_mdlc_lock);
> > +
> > +       if (r8a78000_genpd_always_on)
> > +               return 0;
> > +
>
> I guess the mutex is used to protect the global
> r8a78000_genpd_always_on, but it looks like that isn't really needed
> based upon how things are being called during the probe.

Why would it not be needed? There are multiple instances of the MDLC
device, but only one instance of the always-on domain.

> > +       genpd =3D kzalloc_obj(*genpd);
> > +       if (!genpd)
> > +               return -ENOMEM;
> > +
> > +       genpd->name =3D "always-on";
> > +       genpd->attach_dev =3D r8a78000_mdlc_attach_dev;
> > +
> > +       ret =3D pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
> > +       if (ret) {
> > +               kfree(genpd);
> > +               return dev_err_probe(dev, ret,
> > +                                    "Failed to create always-on domain=
\n");
> > +       }
> > +
> > +       r8a78000_genpd_always_on =3D genpd;
> > +       return 0;
> > +}
> > +
> > +static int r8a78000_mdlc_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev =3D &pdev->dev;
> > +       struct device_node *np =3D dev->of_node;
> > +       struct r8a78000_mdlc_priv *priv;
> > +       const struct mdlc_info *info;
> > +       struct resource *res;
> > +       int ret;
> > +
> > +       ret =3D r8a78000_genpd_always_on_singleton(dev);
> > +       if (ret)
> > +               return ret;
> > +
> > +       info =3D of_device_get_match_data(dev);
> > +       if (!info)
> > +               return -ENODEV;
> > +
> > +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> > +       priv->dev =3D dev;
> > +       priv->np =3D np;
> > +
> > +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       if (!res)
> > +               return -ENODEV;
> > +
> > +       for (; info->base; info++) {
> > +               if (info->base =3D=3D res->start)
> > +                       break;
> > +       }
> > +
> > +       if (!info->base) {
> > +               dev_dbg(dev, "Unsupported MDLC instance 0x%pa\n", &res-=
>start);
> > +               return -ENODEV;
> > +       }
> > +
> > +       priv->mod_map =3D info->mod_map;
> > +
> > +       scoped_guard(mutex, &r8a78000_mdlc_lock) {
> > +               hlist_add_head(&priv->link, &r8a78000_mdlc_list);
> > +       }
> > +
> > +       ret =3D devm_add_action_or_reset(dev, r8a78000_mdlc_unlink, pri=
v);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "failed to add action\n"=
);
> > +
> > +       /* Note that no actual domains are registered, just need transl=
ation */
> > +       priv->genpd_data.xlate =3D r8a78000_genpd_xlate;
> > +       ret =3D of_genpd_add_provider_onecell(np, &priv->genpd_data);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret,
> > +                                    "Failed to register genpd provider=
\n");
> > +
> > +       ret =3D devm_add_action_or_reset(dev, r8a78000_genpd_del_provid=
er, np);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret,
> > +                                    "failed to add unregister action\n=
");
> > +
> > +       priv->rcdev.ops =3D &r8a78000_mdlc_reset_ops;
> > +       priv->rcdev.of_node =3D np;
> > +       priv->rcdev.of_reset_n_cells =3D 1;
> > +       priv->rcdev.of_xlate =3D r8a78000_mdlc_reset_xlate;
> > +
> > +       ret =3D devm_reset_controller_register(dev, &priv->rcdev);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret,
> > +                                    "Failed to register reset controll=
er\n");
> > +
>
> In some of the error paths above it looks like we end up leaking the
> data allocated for r8a78000_genpd_always_on. Perhaps clean up that
> somewhere here.

That is intentional: the always-on domain is shared by all MDLC
instances.  If one MDLC fails to probe, the MDLC instances that did
succeed still need the always-on domain.

>
> > +       return 0;
> > +}
>
> [...]
>
> In regards to the merge strategy, I intend to pick patch 2 (shared via
> the immutable dt branch) and $subject patch. Please let me know if
> there are any issues with that.

That is fine, thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

