Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4BEE9B342
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwHTsu5oxU0kIOE7FVyMwEN9QlArCI+ahvaxQqRbZo4=; b=jjieYVtfv+dILtP1+ssEOpGzUY
	KCVETyhkth1KlNRdfKbBCNiBEhQ+T61Zsb93OSgggKeZNo9bBUv3x+3dDvANKPaAm6LKnPwFyoxU+
	ilvQocesfueo9UPz3VXWnaCXiCjEkXV/djs9tORknMrQHAY4F8PU20V87l2YOVp+97wUe8WSvvBam
	XXDl9sfZ35ZdNSyifzfyfl4e6IpUJlFEPHO3PnvKSTOqVsuWruECbkI1bAXcfw9bTd6lJRk28LMXV
	Ikc6/RwFWIRjXadb2fhKCNBNY+ej4kUEEN7yMPlqYz9HFcry3UGmmK+yZDJWv8YXwcWe4UmOQHwiM
	JdECksFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0GZ-0000000CfwV-13Ml;
	Mon, 02 Mar 2026 10:12:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0GV-0000000Cfw8-3zjj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:12:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2615D600AD
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Mar 2026 10:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAD4C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Mar 2026 10:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772446358;
	bh=dmKKCEMChf9iozh5/BFVZZx9ALF9hCLR/Z/vU9qXNm8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lNrmHv2R3N5gLRM45Ge37DwjBvl8fEeCAwiLFtsgFARHWInrtuSzjeI1k8R8bR4se
	 jEQybZnkIfE+ljHL10eZPvLwVpH/pRrgDP54Jrzvjwd8pppqu8KDrhTJKgDphlKV13
	 hThAk/25e3y9U81XEjVO9qMIpIUEs09pg3Zs7zBPNEx7FWyay4Pcgw3akrQBisZzUR
	 ZdnuIpxonzXdr36o2YT7dumrt/DKri0homViNn8ATmhpSkXFn8aVHwi4qmkSk+WMBS
	 icnHnEm33h8Jjf0IrW9JvbiflGZAi3PdCL0+2Zdr429FsXF3ONjciYL7a5fLh7kmvu
	 vkrE1tlBjMPMg==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ad9fabd08so3479801d50.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 02:12:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUN/yRn803ZE+hvstuUUogTzH/+cOLZDuzRjLGh/AxZXGzO9WxkLEPBUxOuuJOVP/1MVXHpB7HIXkUVdOgh/asn@lists.infradead.org
X-Gm-Message-State: AOJu0YwTKZJfUQSu4ZOMqfmtUYRxR0UN7Xi5K0jXxtsLdn9fWHg7wKDI
	MOLf5WfsMFS7fnxEnRbsvtkss2g8sfSWKSFAKJlibNqZ3Fn9GOVz+ukoIcwxQG/oyicCSO9py1p
	f/lnUykK03XO021nOXeHl5gNkKIaS9aw=
X-Received: by 2002:a05:690e:175c:b0:64c:97ad:17dc with SMTP id
 956f58d0204a3-64cc22c28damr6768085d50.66.1772446358117; Mon, 02 Mar 2026
 02:12:38 -0800 (PST)
MIME-Version: 1.0
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
 <20260225-pinctrl-mux-v2-3-1436a25fa454@nxp.com> <CAD++jLkhH566rqkkQfWnOiAokxB8mLXw=eqrVN_pgs+dd8TkxQ@mail.gmail.com>
 <aaG5DpyET-vri-Vj@lizhi-Precision-Tower-5810>
In-Reply-To: <aaG5DpyET-vri-Vj@lizhi-Precision-Tower-5810>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Mar 2026 11:12:27 +0100
X-Gmail-Original-Message-ID: <CAD++jLnVXgvKjF-8QdZONTBX6WK2q=XidZix0LSsyS2Sjq9tBA@mail.gmail.com>
X-Gm-Features: AaiRm53iWIXpU3ZbOeuRosqaBYYTRiks42ceJwmNYd1HTxwTkyNjI2SuJYHEfX4
Message-ID: <CAD++jLnVXgvKjF-8QdZONTBX6WK2q=XidZix0LSsyS2Sjq9tBA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] pinctrl: add optional .release_mux() callback
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Feb 27, 2026 at 4:32=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
> On Fri, Feb 27, 2026 at 10:07:05AM +0100, Linus Walleij wrote:
> > On Thu, Feb 26, 2026 at 12:55=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wr=
ote:
> >
> > > Add an optional .release_mux() callback to the pinmux_ops.
> > >
> > > Some devices require releasing resources that were previously acquire=
d in
> > > .set_mux(). Providing a dedicated .release_mux() callback allows driv=
ers to
> > > properly clean up hardware state or associated resources when a mux
> > > function is no longer active.
> > >
> > > The callback is optional and does not affect existing drivers.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >
> > Can you explain why you need this custom code for this?
> >
> > Nominally pin control defines and puts the hardware into a
> > number of states such as:
> > "default"
> > "idle"
> > "sleep"
> > "init"
> >
> > Usually (at least for silicon) what .release_mux() would to
> > is semantically equivalent to a transition into the "init" or
> > "sleep" state. And if these are not descriptive enough you can
> > even define a "released" state.
> >
> > Is it not possible to reach the set-up of the hardware that you
> > are desiring by just defining such a relaxed state?
>
> I am not familiar with pinctrl code. I just need a place to call a callba=
ck
> which do opposite work at .set_mux() function.
>
> I see pair function pinmux_enable_setting() call .set_mux() and
>  pinmux_disable_setting() just missing do oppsite work of .set_mux();
>
> I may think too simple. I just do insmod/rmmod test. Any suggestion where
> is good place to put it?
>
> Does it call pair pinmux_enable(disable)_setting when switch state?

The pinmux states are more like a state machine, you transition
between different states.

I think in this case you may want your driver or the device driver
core to transition to the "init" state to release the mux, see
my other reply.

Yours,
Linus Walleij

