Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568A2CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 15:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrAGQ0P+spATPyTLHwin/FqUm+NIeoscl10IQCl5hLA=; b=SCZOg8YxzzFc29kaAfn9ev1GnA
	mH+DqYwM8REnkjnA2dQGtnKbo5y4LwGHT+vw2ZAi0X/yAPKEzc8sASfQOg+dTGjmHbLYVWkdbUuZX
	xMfR3oMYzvevUYpqiMYPuQEsapN3NKE3T4u+KqUgNHwS5uVgOaFWp8APhmJe/YF5ErwB7OxEOcIWg
	PNU7WSzWY4KKFXkOHd3wvOPphMpC1OMGnk6syaafGUwEU7XLddxuLlhQ7iq49CEhG9M1j0i6tvFBU
	ZVv6K4LPcd+nfS3IYmS5IKCtGWZoMJjA5NJDnP1sn9GKx1XuJhcba1BXdkGIFSz3EIGRipiMKITtb
	mmGtjh+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0c3-00000004BTC-0ZR2;
	Thu, 07 May 2026 15:26:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0bs-00000004BQh-2HOv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 15:26:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB53A4448C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 May 2026 15:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA8BC2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 May 2026 15:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778167554;
	bh=wWbaNgLjvgEK60SoLK00HREVJw2pjszb4CF+qYI0K7w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IiYPc+6mLChtKGBenijU6gMwDozISCBsh5s0UVIU39zm0Ba+5cMfNhtyej2cT3POg
	 8ooc59U+xSIwocabHngDh5KPtmqO78vRzCmxy/h2YsjWFtL/0rBmWevWbRcUsMtE+A
	 rP5EIo5kx3kWPBEis8SbD9jWDTpmkV4Ni4me8YzqYRLDqJE6Nn8ZF/1sl7DWf3+KGn
	 Sna6brPjZFimyNKAHYWhvMq8rpo5jCfK8anLeBC3AZiThqFAhu/wcRuXjhUufDxUTZ
	 4zhI6VvgWLOKHK4JBtHrX2sSY3eRmi2w+/fnhYQKfne/Y1Wl+DLGzr+aH0vJwXIkiW
	 dWDE+K/b0JHlg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67b32c695efso3384623a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 08:25:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9vX+wllpk7bsYstkBMmnUIIu+z/EmZ3m/S7nqZ0pUst/iO4yHi+hXs4rWbVxlXSEdWmGiLmA6f7LEMEkfQvf7i@lists.infradead.org
X-Gm-Message-State: AOJu0YwjFc1YefRs2zjo/d0Y/RVx6gOsQS/kowzt6ly4oXjijSoV2ORy
	i7HwoCd2JDvT6iebqvoPqo7yc7QenrCUjSu3lB7UjDiO3kTIHetm5Fj7+1E1pS6hRALtm+T3Lqi
	sQSYZ6gKCM/sa0Z39cdtRWH4ogbBTkQ==
X-Received: by 2002:a05:6402:5344:20b0:67d:98bd:e44e with SMTP id
 4fb4d7f45d1cf-67e0efb390emr1326327a12.17.1778167552504; Thu, 07 May 2026
 08:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
 <20260504-v7-1-topic-ldb-fixes-v1-2-0125d937ff7f@pengutronix.de>
 <20260505141538.GA2547282-robh@kernel.org> <2bl2mwpk57xgkuye2gydliymjkzikiovnb7ovnb73olwtfkjwn@byn3732grvnh>
 <CAL_JsqLYS1sgU680KNR60+OvtNwEVKWovht7K2APO3sqeJe6Nw@mail.gmail.com> <zbbez4lpme7szgnsd7fqufbuhmvcftw4sqrmwwwzyxu64i2ppb@fh2fgdkc6tat>
In-Reply-To: <zbbez4lpme7szgnsd7fqufbuhmvcftw4sqrmwwwzyxu64i2ppb@fh2fgdkc6tat>
From: Rob Herring <robh@kernel.org>
Date: Thu, 7 May 2026 10:25:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJWyRPh_hmJW8p7+VvtcqpS0a_azjMO-PyQgkqQUfLAGA@mail.gmail.com>
X-Gm-Features: AVHnY4K59HFC-Lj0a6_OWOrJwlVTiPxlkDo7ivtKaVL4QyHlHtRcFSTM5LnBqeE
Message-ID: <CAL_JsqJWyRPh_hmJW8p7+VvtcqpS0a_azjMO-PyQgkqQUfLAGA@mail.gmail.com>
Subject: Re: [PATCH 2/4] Revert "dt-bindings: display: bridge: ldb: Fill in
 reg property"
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, laurentiu.palcu@oss.nxp.com, 
	victor.liu@nxp.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_082556_785910_B29C3CC1 
X-CRM114-Status: GOOD (  39.14  )
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

On Thu, May 7, 2026 at 6:55=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.d=
e> wrote:
>
> On 26-05-06, Rob Herring wrote:
> > On Tue, May 5, 2026 at 10:46=E2=80=AFAM Marco Felsch <m.felsch@pengutro=
nix.de> wrote:
> > >
> > > On 26-05-05, Rob Herring wrote:
> > > > On Mon, May 04, 2026 at 10:21:42PM +0200, Marco Felsch wrote:
> > > > > This reverts commit 16c8d76abe83d75b578d72ee22d25a52c764e14a.
> > > > >
> > > > > Remove the 'reg' and 'reg-names' property from the LDB.
> > > > >
> > > > > The LDB is either part of the IOMUX_GPR (i.MX6SX) or the BLKCTRL
> > > > > (i.MX8MP, i.MX93) register space. Both IOMUX_GPR and BLKCTRL are
> > > > > register ranges with loose register definitions. E.g.
> > > > >
> > > > >   - On the i.MX8MP there is one register which controls the AXI
> > > > >     threshold for two different IPs (BIT(31:16) - IP1, BIT(15:0) =
- IP2).
> > > > >   - On the i.MX6SX IOMUXC_GPR5 controlls: CSI2 mux, WDOG3 setting=
s, PXP
> > > > >     handshake, ...
> > > > >
> > > > > In conclusion: it can't be ensured that one register belongs to o=
ne
> > > > > dedicated IP and the LDB is rather an exception than the rule.
> > > >
> > > > It is fine if there's a child node for LDB if the LDB registers are
> > > > consistent, but the other misc things are represented by the parent
> > > > node. It is certainly not a requirement that either everything be i=
n
> > > > child nodes or nothing be in child nodes.
> > > >
> > > > What I don't see in this series is what problem does this fix? If y=
ou
> > > > are going to break compatibility, then there had better be a good
> > > > reason.
> > >
> > > Hi Rob,
> > >
> > > with the upcoming i.MX9x SoCs the parent syscon (BLKCTRL) controlls
> > > multiple other IPs, e.g. a DPI mux added by commit 3feaa4342637
> > > ("dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema =
and
> > > example").
> > >
> > > During the discussion of the above commit we agreed that the sub-devi=
ces
> > > of the syscon shall not use the reg property due to the fact that one
> > > register serves multiple purposes. In the above case the same registe=
r
> > > controlling the dpi-mux also controlls MIPI-DSI bits. The MIPI-DSI bi=
ts
> > > can be abstracted as drm-bridge as well. Two sub-devs using the same
> > > 'reg' property below the same parent seems odd and I don't know if th=
is
> > > allowed either.
> >
> > It's not generally. There are some exceptions to define things at the
> > bit-offset level rather than byte level.
>
> Thanks for the clarification.
>
> > > Now the LDB is also part of this BLKCTRL syscon device but requires t=
he
> > > reg property. TBH, I don't know why the reg property was added in the
> > > first place, due to the above fact (multiple sub-devs - same register=
).
> >
> > Probably because we asked for it, but we don't always get a complete
> > picture of all the h/w functions (though we ask for that too).
>
> I get your point completely and I don't blame anyone.
>
> > But nowhere have you said the LDB registers are mixed with other
> > functions. If they aren't, then there is absolutely nothing to change
> > in the binding. If they are, then yes, we shouldn't have 'reg'.
>
> No they aren't mixed with other functions (for now).

For now? Is the h/w going to change or is the binding *still* incomplete.

> Can you please
> confirm that mixing 'reg' based sub-device nodes with non 'reg' based
> sub-device nodes  is allowed? E.g. if the below example is allowed?
>
>         system-controller@4ac10000 {
>                 compatible =3D "fsl,imx93-media-blk-ctrl", "syscon";
>                 reg =3D <0x4ac10000 0x10000>;
>                 #address-cells =3D <1>;
>                 #size-cells =3D <1>;
>
>                 ...
>
>                 bridge@5c {
>                         compatible =3D "fsl,imx8mp-ldb";
>                         reg =3D <0x5c 0x4>, <0x128 0x4>;
>                         reg-names =3D "ldb", "lvds";
>
>                         ...
>                 };
>
>                 dpi-bridge {
>                         compatible =3D "nxp,imx93-pdfc";
>
>                         ...

Depends what is in "...". If only a compatible, then no. If there are
actual resources defined, then yes.

>                 };
>         };
>
> Furthermore I thought that for the MMIO bridge@5c device, the 'reg'
> porperty would either require the full register address, e.g. 0x4ac1005c
> or there needs to be a ranges property.

There should be a ranges property no matter what.

Rob

