Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E86C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 13:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8xJci6BCA/NPXr2bGUVttu27gcVFr7isab2Lo+Nre0=; b=zKtF+xO5UDWK/7
	LrB7NS8klVWYt8cYxUxphpi6PN7LMIb+5Oo6DcD6t0VeLdJILF3zU+1pT8n4Q0jZ3v9sntalFZlH3
	Sr2m1aBbhLA193G6Hy1iG2+uULJR0V+LwcVyCG0bV4KpKEwR4csmZgXQbetcHQN16lqTKRp3easJN
	UrcmcuM9VKZZNPa0f7tNfiBvRk+w8gRk0DlSvPVyWZcv4wvWqLVqOfFyDzHp0N3jPAZhUOrsWcxDh
	W2kxFcJrgQ0IkMFmpDFm2ltHzZnXT0x31blvhOCX8s6/pTxFlZ7g6mruqUNo+qRCdDBX5QcHgMLhl
	Ikb7Hb9zxC5N57D/9xeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYPEj-00000000HAF-2Xlx;
	Sun, 06 Jul 2025 13:16:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYPCM-00000000H2J-3vXy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 13:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF91D45BFE
	for <linux-arm-kernel@lists.infradead.org>; Sun,  6 Jul 2025 13:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95BC7C4CEF5
	for <linux-arm-kernel@lists.infradead.org>; Sun,  6 Jul 2025 13:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751807664;
	bh=u8xJci6BCA/NPXr2bGUVttu27gcVFr7isab2Lo+Nre0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=H74tGhnOnclNfDF4L3HiqPatu/Ckv4SZwOZieRM9X1HBvT72eGWkjGnmDrv7miyw9
	 /md3SO6VV9wp5un7SLJY585Cu/xC634IOPRqKSenlFAWLasra7D84WocasA5yNAdlD
	 truaLbkyAf1bmoInf5c1WugXZSj9/M49L3VtGnO0G/wlS3W6obpgMsPh1oh5ZBHhLa
	 OVciZG90FoRDiu/0VBG5iGHISg1+KxXT01I0j1NFUAoFVv/Y/X1jlDlCm1VwhNH99F
	 l5V7Z5whmNhUv3QtzTCBJdRKtGTxMvkg62s/rmxA1PI1IvYi/g1Oi0d8wu9E/jWLMx
	 5blPMHji5owrA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55628eaec6cso2112784e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 06:14:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9jn5w3GXVR5q2EEb8XbqOO28KWcXaFjlw2IgtbfZdpJujmjIy7X+DSvMetYef5XmOEEjIRqOd+5A7NHZWhErm@lists.infradead.org
X-Gm-Message-State: AOJu0YwB1ZY/rTE8NVpOdetuWoqScUYOcxehom0b9KTjMfoE583u6cZV
	6XfqD49cexAx8FC8NZ+w/uPJN5EqDQWp4/qMea58+4Q8lzTJRttMJj77f0KcFX0YxmRkHum4nsb
	A9YtDSG71Vg9kVDW3gt9rRmN5MiLxq/A=
X-Google-Smtp-Source: AGHT+IEzN50658kYdEZu4z11IX1+qj76bRNUj9L9XsGay2m70Sqt76p+ZP6G4FZVEV9964rwYfujWQD+iVC6l49gAsw=
X-Received: by 2002:a05:6512:4027:b0:553:ceed:c859 with SMTP id
 2adb3069b0e04-557e5537687mr1059540e87.21.1751807662868; Sun, 06 Jul 2025
 06:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250628054438.2864220-1-wens@kernel.org> <20250705083600.2916bf0c@minigeek.lan>
 <CAGb2v64My=A_Jw+CBCsqno3SsSSTtBFKXOrgLv+Nyq_z5oeYBg@mail.gmail.com>
 <e9c5949d-9ac5-4b33-810d-b716ccce5fe9@lunn.ch> <20250706002223.128ff760@minigeek.lan>
In-Reply-To: <20250706002223.128ff760@minigeek.lan>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 6 Jul 2025 21:14:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v64vxtAVi3QK3a=mvDz2u+gKQ6XPMN-JB46eEuwfusMG2w@mail.gmail.com>
X-Gm-Features: Ac12FXwracJUFtxrR-geU8AnCt2mihSX7AlHGCMKyxbdZy4UN94qheE6j6Zh998
Message-ID: <CAGb2v64vxtAVi3QK3a=mvDz2u+gKQ6XPMN-JB46eEuwfusMG2w@mail.gmail.com>
Subject: Re: [PATCH net 0/2] allwinner: a523: Rename emac0 to gmac0
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_061427_934829_C214C537 
X-CRM114-Status: GOOD (  31.10  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Jul 6, 2025 at 7:23=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Sat, 5 Jul 2025 17:53:17 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
>
> Hi Andrew,
>
> > > So it's really whatever Allwinner wants to call it. I would rather ha=
ve
> > > the names follow the datasheet than us making some scheme up.
> >
> > Are the datasheets publicly available?
>
> We collect them in the sunxi wiki (see the links below), but just to
> make sure:
> I am not disputing that GMAC is the name mentioned in the A523 manual,
> and would have probably been the right name to use originally - even
> though it's not very consistent, as the same IP is called EMAC in the
> older SoCs' manuals. I am also not against renaming identifiers or even
> (internal) DT labels. But the problem here is that the renaming affects
> the DT compatible string and the pinctrl function name, both of which
> are used as an interface between the devicetree and its users, which is
> not only the Linux kernel, but also U-Boot and other OSes like the BSDs.

I reiterate my position: they are not stable until they actually hit a
release. This provides some time to fix mistakes before they are set in
stone.

> In this particular case we would probably get away with it, because
> it's indeed very early in the development cycle for this SoC, but for
> instance the "emac0" function name is already used in some U-Boot
> patch series on the list:
> https://lore.kernel.org/linux-sunxi/20250323113544.7933-18-andre.przywara=
@arm.com/
>
> If we REALLY need to rename this, it wouldn't be the end of the world,
> but would create some churn on the U-Boot side.
>
> I just wanted to point out that any changes to the DT bindings have
> some impact to other projects, even if they are proposed as a coherent
> series on the Linux side. Hence my question if this is really necessary.

For the compatible string, I can live with having a comment in the binding
stating the name used in the datasheet for reference.

For the pinctrl stuff, which is the contentious bit here, I thought the
whole idea of the newer pinctrl bindings is that the driver uses
"allwinner,pinmux" instead of "function". I think having both being valid
is confusing, and likely to cause conflicts later on. If we're going to
use the hardware register values in the device tree, I'd really like them
to be the only source of truth. The commit message for the binding also
sort of suggests that "allwinner,pinmux" is the part that matters.


ChenYu

> Cheers,
> Andre
>
> https://linux-sunxi.org/A64#Documentation
> https://linux-sunxi.org/H616#Documentation
> https://linux-sunxi.org/A523#Documentation

