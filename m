Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66C0E9A05D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 19:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNCnFknmYjiiUwoazUchdjz3K87AvPcXqCBVto3yPno=; b=IKA3dUMXTU2KZHSbI+BKaK1Qrn
	1paPml4ha8rA4edj1IZoxb/A2W6YfGbN5LJqq2P6EKLKykkfMmMOwG1odCO+mrcOagsYKTBtck7z9
	YotkYytBiTpYg1gZmI8n2QUT1DBFRfQR9z2n7inGM12QgSqsRGgaXgv0ectv8CzNo4xMMoXK7eptk
	CW67p6CBygaMrAz/yvCGXYyoC242AuYRBJrzySMpA6kEjYBkPIRaywxz+w1GxS87mb41yugwJDmO+
	zTj00zOKPDFp9es/HQc6q50/iRuMqS4UAKSbh0hTMe/PnYUc9TCJF0FTjghtOd1yvoIVgeF9jPrHG
	i2XbwG+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9Qu-0000000BotK-3iXY;
	Thu, 19 Feb 2026 19:11:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9Qs-0000000BosZ-3aJu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 19:11:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 331D344518
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 19:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE49C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 19:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771528286;
	bh=Rb0+DBfdVleoRslWweeISPOle2jWWZ3LQCLlNVSSpQ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M2Zh9tp2BvoGWIdJjmFDvecrf8pKPZCqMsw3++rmfdWVCo1tlChq5LvqX3L/ZHsNA
	 VsDjA6pKM7mYUvD7iYnp2GO8Xw9OVG/8mpe0Gv9CuoLD/KypGeUGYA/lb4n10ny1pU
	 CqcSkUNm3JEQD372x4GQi939dFBqs8m4uRRQ5rpRb9nYjb72ofZe+YlT8uvnW0wovM
	 CrVWZWZdNeS62BWkCPSzBE79jqerH3Cyyd1/WiXX5OK27OmjeVYCqCeqY1zl327Btd
	 UljS6NGpyZehGnT8dQAazFNbhZ+0NmrjeNJXMeaFJ6B2Fg1VnlytX6vJblot6s866I
	 z0D5kaYo7/7iA==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79088484065so12106237b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 11:11:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXWINRVyVwDN6UnHe+hg5ZgEklAxEFRqo24MKvn2yZMzhYYZi5ksso2mC56YMiXxF2izrPOetVA2kncZMFeWE6d@lists.infradead.org
X-Gm-Message-State: AOJu0YwMWl4N0+m2KZuFPp5PJ0AXN8sdX1G60LOSxgbZafFViPkiQgmp
	rJu5hfzGe+qS4w9u2IeMSakGiY69otvN/POxvjgVufqVUNfK46gvwYMQ4L3o5EGjl1QRZUjp9v7
	haNXkC6Kj/tZQpjUCjtC7uOYA9lpXObo=
X-Received: by 2002:a05:690c:ed5:b0:797:f635:c896 with SMTP id
 00721157ae682-797f717b02cmr50185397b3.9.1771528285140; Thu, 19 Feb 2026
 11:11:25 -0800 (PST)
MIME-Version: 1.0
References: <20260218083618.67805-1-christophe.roullier@foss.st.com>
 <20260218083618.67805-3-christophe.roullier@foss.st.com> <aZV-b6TdLMdI8dm4@shell.armlinux.org.uk>
In-Reply-To: <aZV-b6TdLMdI8dm4@shell.armlinux.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 20:11:13 +0100
X-Gmail-Original-Message-ID: <CAD++jLnF=8MvW4CbXmPZR=w8tAUZiL9M3N73WB++DaYYwhToDQ@mail.gmail.com>
X-Gm-Features: AaiRm50ZmYrtHjO9YzusnFCmg5M5z6i9LzHE-qxCdbPPiIH94xxykSK7yFLYpYI
Message-ID: <CAD++jLnF=8MvW4CbXmPZR=w8tAUZiL9M3N73WB++DaYYwhToDQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] net: stmmac: restore pinctrl when driver remove.
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_111126_956976_D1BAB8B0 
X-CRM114-Status: GOOD (  23.83  )
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

On Wed, Feb 18, 2026 at 9:55=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Wed, Feb 18, 2026 at 09:36:17AM +0100, Christophe Roullier wrote:
> > when system suspend or unbind, need to set pins
> > to low power state to save IO power consumption.
> >
> > Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 067b17f03cd09..3d4f0e4cb53fb 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -8071,6 +8071,9 @@ void stmmac_dvr_remove(struct device *dev)
> >       mutex_destroy(&priv->lock);
> >       bitmap_free(priv->af_xdp_zc_qps);
> >
> > +     /* Select sleep pin state */
> > +     pinctrl_pm_select_sleep_state(dev);
> > +
>
> I'm not convinced this is correct, there's nothing to match it in the
> probe function, except what the driver model core does. However, the
> driver model core also doesn't clean up the state if probe fails.

I think it looks right, if this state is indeed for the sleep state of the
device pins, and this is what you want to happen at remove().

The non-cleanup of the pin states is a (maybe ugly) feature: there
is an "init" and a "default" state. If the "init" state does not exist the
"default" state is selected in the dd.c call.

These states are just some values in dev->pins, allocated with
devm_kzalloc(), and devm_pinctrl_get() for e.g. dev->pins->p,
so IIUC this will befree:ed on driver detach,
also if the probe() fails, at least that is what the original devres
design document says
Documentation/driver-api/driver-model/devres.rst

There is really no other cleanup that can happen: there is no
before-default-or-init state we can revert to (that would be the
power-on values), so there are just these states in some pointers
that could be accessed by e.g. pinctrl_pm_select_sleep_state()
that get free:ed up, and muxing and pin config that happened
in the pin control hardware just stays around.

Yours,
Linus Walleij

