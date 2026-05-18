Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799ECCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1X6apLad7YQUqlg/SGPFJHnry4n2DqdfEzdeBwtfXxY=; b=OqIJew3QGwu0Ou
	/9k4hK3CaNbxJmmRzwa28dd0f/+Ye2y3/zhClPL3xj2KDPWYbPdGdN8pjp5ITWmz6DamorsaWk2wh
	jRb+sZPGpbGyl6YfwDIZH2OT7hH+/lFD6qxP3O4VxdmZDUo4iCp8dsZ03i7TKIQog2PDctHVx4FBl
	STKqQFR3Ga8WNc3L7GNqdWeIxPwX8ma9e97OPZf8Sw7FTAAygDl+v7kW27jPiPGBOuBXIO12kAVJs
	fDGJjW9A64G8ARx5ZW/Cj9ySIcBevgHAKkSR8fwcYYl2hxyWt1AALsKRO2pFrEZ7T7v3GpG3qUFvq
	6STpP5SiVQB8BJz5rBFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzFb-0000000G2eD-1vgk;
	Mon, 18 May 2026 14:47:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzFZ-0000000G2dQ-1Nyy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:47:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E610144119
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 14:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B76C2BCFA
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 14:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779115639;
	bh=vPaVPkElRKkI+lmUZzA09/LIbT0xt4R2+ENYZ4lLS5g=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=av5vx73bAiKuCKn/xuWqjVwaT8/gOojrPk8PuHYfDJPmDv2sqzpOCjrqr12AozgTg
	 XrkEMEGmCvvaWmRT829lw+MPzOZ2DuVr4NP7Jwl6sLbn3rlhTFUNQZD4MDs5N+Ucs7
	 h5M0utGAfqMK3Vej3dt7/13cw9omeP3AlJDxCLJJzfvWpya4vCDiFj3VeQWuCYrsCd
	 aD5Po0q3MAmZvQmZwZa7UhgupPx0t65QUeuRzCsFjTx1J3de2mHDYREOm386RkIyuF
	 IoT+XGcN/mSJEvqii7CY0gxUBQMTwdaCvGhIWpB+ytfy+5vt7ZgGflAiye15bz7zW1
	 PeL3nvmxWK2Hw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-392445f11c5so26756311fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:47:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/koy7iCinwADPBhVd6iKwRn1svlF1F9MY8d9uO0/aCcv/nY5kyHatO44+bXzBA8DUOC4nvzUMb7EY+af89BAjX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0nFZHogOCb3LRct/bmC5RQRi2pHrj9YKba/w9bw2Ily+bfYKr
	doyOLJDlGYYKld5IWHRkZ9bfIbtkQzDr/AyncuyZJH0SE8JLfNa6On3wPHcIbZvbGUmVJHTFtw1
	WMllrQ//Zbtx6zq5IGQg9R0VafaCL7UE=
X-Received: by 2002:a05:651c:2215:b0:38e:58c7:cda with SMTP id
 38308e7fff4ca-3956089f9d7mr43916861fa.1.1779115638118; Mon, 18 May 2026
 07:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-4-alexander.sverdlin@gmail.com> <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
 <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com> <256b1cd8-b143-4f71-91cc-8513be04ce4c@arm.com>
In-Reply-To: <256b1cd8-b143-4f71-91cc-8513be04ce4c@arm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 18 May 2026 22:47:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v65jpG-XXNjT46H2KnLoM_SHOatFw82u38ZGEELgXmvDtQ@mail.gmail.com>
X-Gm-Features: AVHnY4JuD0SObsLmoajC3ESMjVn3MS_VFZrbgNyTbswwAAsPI15UX8WD889AEwg
Message-ID: <CAGb2v65jpG-XXNjT46H2KnLoM_SHOatFw82u38ZGEELgXmvDtQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
To: Andre Przywara <andre.przywara@arm.com>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, linux-sunxi@lists.linux.dev, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_074721_416310_7FD6A0EC 
X-CRM114-Status: GOOD (  32.69  )
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

On Mon, May 18, 2026 at 7:16=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi Alexander,
>
> On 5/17/26 22:38, Alexander Sverdlin wrote:
> > Hi Andre,
> >
> > thanks for the quick feedback!
> >
> > On Mon, 2026-05-11 at 13:44 +0200, Andre Przywara wrote:
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> >>> @@ -0,0 +1,162 @@
> >>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >>> +/*
> >>> + * Copyright (c) 2025 Arm Ltd.
> >>
> >> Please put your own copyright here, even if that has been largely copi=
ed
> >> from an existing file.
> >>
> >>> + */
> >>> +
> >>> +/dts-v1/;
> >>> +
> >>> +#include "sun50i-a100.dtsi"
> >>> +#include "sun50i-a100-cpu-opp.dtsi"
> >>> +
> >>> +/{
> >>> +   compatible =3D "baijie,helper-a133-core",
> >>> +                "allwinner,sun50i-a100";
> >>> +
> >>> +   aliases {
> >>> +           serial1 =3D &uart1;       /* BT module */
> >>
> >> Do we really need an alias for the BT UART? And is the BT module
> >> supported already? Then please add a child node to the UART node.
> >
> > That's the only thing I can do currently regarding BT: stabilize the
> > serial enumeration, because UART1 cannot be used for anything else
> > except BT module, because this is soldered inside "core" module.
> > We can avoid different tty enumeration, should the support for
> > BT be implemented in the future...
> >
> >> Isn't the WiFi/BT module on the SoM? Then please mention and enable MM=
C1
> >> here. Provide the child node for the WiFi chip, even if there is no
> >> upstream support in the kernel for it yet.
> >
> > So both the above BT and the WiFi is AW869A/AIC8800 combo chip, which
> > has neither upstream driver, nor [upstream] DT bindings. Even github
> > driver for AIC8800 doesn't seem to use DT, therefore it looks quite
> > pointless to me at this point to specify anything in the DT for the
> > chip which doesn't have the bindings idea even theoretically.
> >
> > Nothing in the current DT shall block any future work on the AW869A
> > support though and the above "aliases" entry shall even guarantee
> > unchanged serial enumeration shall such support arise.
>
> Fair enough for not providing DT nodes for those unsupported chips, but
> why do we need to force enumeration? For the eventual Bluetooth usage,
> the driver will find the respective serial interface by just looking at
> its parent interface. IIUC there is nothing referring to ttyS1
> explicitly. So we wouldn't really need an alias, would we?
> I see that some boards do define an alias, but others with Bluetooth
> don't, which I think is the right thing to do. Which name the kernel
> comes up with for UART1 shouldn't matter in any way.

It does provide a hint for any users enabling more UARTs and adding
aliases for them that they should number them starting from 2? And
just stable numbering overall.


ChenYu

