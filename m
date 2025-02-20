Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6B1C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 02:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xvp9vC0eMH1pKGCb8lxYuIWBY9DYcdV7nU72B3skZ6Y=; b=zhJ9xXKgu/KIVf2y8pJ+OKKciF
	9D85KReDeQDuBVXTzHF+50WiS4Y7kYPFyLG2IoW7yvjl44FGQegZ3yFRBhDf36On4yrGIANPiKoqf
	hstSfr0BYBfmdcHCxZhPjQI8PT6USuK1RymucZaU+zzwSrhCpvZLGR8dZ4gftnbTNaDSO6zF5e53Z
	1RCemSN+WPwmmngw6gtF6GPsPHdnlYhLQxU9Li2TNEj4Xr4DSnMya5k/aUNw7fsUFVR9rhDYT9C+1
	3WsjVxxNrXsuwF07bcBsRtVPfWTW4Z48YXHoZiqIJ6/dQ+MwBEbvZZjj2nEny4lPKbZXpvwF4OAo9
	x1HV7hwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkwcx-0000000GOzw-2Y3R;
	Thu, 20 Feb 2025 02:49:27 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkwbS-0000000GOfh-0QGu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 02:47:55 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-6efe4324f96so3812207b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 18:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1740019673; x=1740624473; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xvp9vC0eMH1pKGCb8lxYuIWBY9DYcdV7nU72B3skZ6Y=;
        b=BlsKkkkDIqagyScfiZJkr/7xuZp5Ty+vRBnuV4fv7eU1foPKz1sKrXCODkbbeV1c5p
         aoUyRu3bAb0zac2F8FgZXkNAqKWXynIH6lHJSHqChPxk2VosRZ02wIV/0tGPVbFh34MB
         kfkJSBXppVNPyWh8scws9QXr+tfTHi3xV53z9klTZLq4TsTBF+QH2c5UcNSxMLq1PY3I
         T1BEts+N7YAomM+JgkbzpItx8z73XYqVgT+XzvNKSq91CaP+zktvDMrMwMXgfHwzlk0T
         xRMI6q9wTtxBNQZMifyYbFz3mmx26OftjqiwwxtpfesLxxFfIAjTIu0p2YjlrmkqqDs6
         5BgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740019673; x=1740624473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xvp9vC0eMH1pKGCb8lxYuIWBY9DYcdV7nU72B3skZ6Y=;
        b=uCe5X2QctSTTZfPoyuKH5w+N4aZwg4QV/kZoIL/C+Ae2P8ikU1VxtlbjwaTNxxkeyq
         +gLNUJstyhsIciyMxU/sFWyDaNWq33cDLusOghhJhkURz53A4FWLs/1G59MEZ+kN7aXz
         ctxUWCG2nzVbHG+BlEFRD9n3jS+lSqa6xj7DbsNScP4PNPQ0WbL/yQkp4I5eunwMYFRV
         StW4gEJ1P2QRtkRiuVmp2MVqC1Xxfm3+AyjVoS6JkMesmZyZhS2iYKYI4yCoYYlHTHeG
         GDeIgmCD+WJqbNgavieSAUiXKkXlyqx68uV/Q0yFBGUAXXB3KQukZlIdEZV2bVO5oeOF
         ip8A==
X-Forwarded-Encrypted: i=1; AJvYcCXRjOCqIzF+SlnlAzrcH/QWaJZBnHgHIIXRHrgXNdNhjc0nYq1i/gk0dZhXSLmWT0DYBiv3lvL9v046gcYRuHis@lists.infradead.org
X-Gm-Message-State: AOJu0YxYKByx52ucOqMJ4x0SSeYjk4kw5oGztnspxnbvFG+Ny6YKtw0V
	R2yJqnqKBe51DwHpPX+AtRhL1IcjS0djH7Do+KSV6sqdYpEU/xCO0wqm4KnWxZsFP+RRehhFw2f
	mO/hcNkZAd1gQ8EyGaGCa5cZj8jYJ8rMhjc7OlQ==
X-Gm-Gg: ASbGncsPc/BeY6m9j4EIJOpyUghsL/3MBkLe7HxORLs3QhIWHJCmmxWhg+HBKTKfx6h
	Q0bHoC9E1Zvv3xMw5cwwAX3hzhjAImfDnK4iq6IVZMw18DjVeuHaydCaCC0d97RjOYy2O1WqQ1P
	s=
X-Google-Smtp-Source: AGHT+IHpbcrdwizdZDEB2LKzf3t7N+L1gh7l/lSw8IgK31mOcpbcfuefgyvG7Eg9yB90MSd4D8fYOSrYNFEZa4g738Y=
X-Received: by 2002:a05:690c:64c8:b0:6f7:ac3f:d589 with SMTP id
 00721157ae682-6fbbb7eafa8mr5012217b3.36.1740019672877; Wed, 19 Feb 2025
 18:47:52 -0800 (PST)
MIME-Version: 1.0
References: <20250217055843.19799-1-nick.hu@sifive.com> <889918c4-51ae-4216-9374-510e4cbdc3f1@intel.com>
In-Reply-To: <889918c4-51ae-4216-9374-510e4cbdc3f1@intel.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 20 Feb 2025 10:47:40 +0800
X-Gm-Features: AWEUYZmjzhqzQbHmf9_A5Yil9YBABlCV2QtiQWGg09MoFGZlPCm-Nzx5MY3mUGU
Message-ID: <CAKddAkBZWZqY+-TERah+Q+WUfkqzcpFMA=ySSuTxxBjfP7tKZg@mail.gmail.com>
Subject: Re: [PATCH] net: axienet: Set mac_managed_pm
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Michal Simek <michal.simek@amd.com>, 
	Russell King <linux@armlinux.org.uk>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Praneeth Bajjuri <praneeth@ti.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_184754_155645_C13B87EA 
X-CRM114-Status: GOOD (  20.06  )
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

Hi Jacob

On Thu, Feb 20, 2025 at 7:29=E2=80=AFAM Jacob Keller <jacob.e.keller@intel.=
com> wrote:
>
>
>
> On 2/16/2025 9:58 PM, Nick Hu wrote:
> Nit: subject should include the "net" prefix since this is clearly a bug
> fix.
>
I've added the 'net' prefix to the subject 'net: axienet: Set
mac_managed_pm'. Is there something I'm missing?

> > The external PHY will undergo a soft reset twice during the resume proc=
ess
> > when it wake up from suspend. The first reset occurs when the axienet
> > driver calls phylink_of_phy_connect(), and the second occurs when
> > mdio_bus_phy_resume() invokes phy_init_hw(). The second soft reset of t=
he
> > external PHY does not reinitialize the internal PHY, which causes issue=
s
> > with the internal PHY, resulting in the PHY link being down. To prevent
> > this, setting the mac_managed_pm flag skips the mdio_bus_phy_resume()
> > function.
> >
> > Fixes: a129b41fe0a8 ("Revert "net: phy: dp83867: perform soft reset and=
 retain established link"")
> > Signed-off-by: Nick Hu <nick.hu@sifive.com>
> > ---
>
> Otherwise, the fix seems correct to me.
>
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
>
> >  drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/driver=
s/net/ethernet/xilinx/xilinx_axienet_main.c
> > index 2ffaad0b0477..2deeb982bf6b 100644
> > --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > @@ -3078,6 +3078,7 @@ static int axienet_probe(struct platform_device *=
pdev)
> >
> >       lp->phylink_config.dev =3D &ndev->dev;
> >       lp->phylink_config.type =3D PHYLINK_NETDEV;
> > +     lp->phylink_config.mac_managed_pm =3D true;
> >       lp->phylink_config.mac_capabilities =3D MAC_SYM_PAUSE | MAC_ASYM_=
PAUSE |
> >               MAC_10FD | MAC_100FD | MAC_1000FD;
> >
>

Regards,
Nick

