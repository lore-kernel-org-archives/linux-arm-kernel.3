Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AB7CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 19:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDt0aZagELXwSkTdz82ubamN8Iov86wVWkejVlcjJIo=; b=VGuus3uON0ye+ZAbzu155zcJMl
	qD5NOo7fWCDgNNJaSg7ZoCx1QC+x+88KIyHvGwCdi6pfRmgagPeK8mOfhDV2u0CpAqwyXJcxaMrZJ
	Phn53MB4kxCmlUxx8FEGNwuUC5/D/UuUUWyxGtUA7k6dlyWdwxOqWS+iZzG4lE5ReyF/bcLZE+kD1
	Uis3OWW9BxSU/VGL0YtFV2aybandQFl1VPHsIoMpXNlQmP+Ob3wRG488zJU9detyNJscqxOHjpd9D
	c4gFv8+K7WLehDG7REMLgdSKVj+Oj1y3XwZtxb7sLra3eGqKZr7yYXrSSF8TDRBzflrz8hfuEtNWe
	H5YYRc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKYe-000000011H0-1PWK;
	Thu, 18 Sep 2025 19:44:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKYX-000000011Bb-1Kys
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 19:44:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0910C43BB2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 19:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD443C4CEFA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 19:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758224676;
	bh=xDt0aZagELXwSkTdz82ubamN8Iov86wVWkejVlcjJIo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A5FQPO83h0wKAhG07kgXFOaEJL6tYOKh2fngOkQril0hLbZZmjcXeUljfduKCCRtw
	 iu5a7LRoSizH9mS7jRyB2aoEuKfAW9PjFckimlYt5jtT3qSKl61anUHL26sYTjXFZT
	 iEptKin3FfZqNyqbg5AdBSIfuGaisOmRuyCeWERgZDK8djiEvFIqqhGzx5ZmgnhJg8
	 FxJghXNarV6GlowxrFhVzePBJ0mkLauCqyFcpiK/Xo8mj+CwtboUr8mNg28+yE1Jbc
	 PXocGgLKhGWeV/CYGp1LzcLaOEepB6683LUzRmsxcv/Fn8eX6s+tjsOKcymfBsCtOZ
	 uFD1ZuZ6eY8lA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-62f277546abso2415295a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 12:44:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJ2pLCnECT914Ezm/+gJhlvwwPaBeSwS7Qlss0NMJF1XAKtPUBHpglwFnyfbtd5Y/ABmx+CV9nfx6vmFRdd7+S@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq7o/Kj++OvXDqdSq76c1qWlhfDMFSvU6GeLNll/lvbUGP0+XK
	6uZ9J0RHqyw4Xyi1hsyK8QQeyBpwrAT6UgTJGVuELW8tHO6NifYFnK7vGlRQhfHs/iuO9sH3IpM
	ch9Z5EDzWYWl2yTvvPAJDSbgekTeZ3w==
X-Google-Smtp-Source: AGHT+IGAhcnuc0wpWw/s1p4UA6lxTrINGFr54H6UilY1ZtrPf2GcAEbRMuog4KleHa2rD/k9wiHS+9FlPpcBXhXUlUs=
X-Received: by 2002:a17:906:6a1f:b0:b04:85f2:d26f with SMTP id
 a640c23a62f3a-b24ef6880fdmr46219566b.25.1758224675450; Thu, 18 Sep 2025
 12:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250916091858.257868-1-lpieralisi@kernel.org>
 <20250918135555.GA1540012-robh@kernel.org> <aMwjcIS/rvxkSZdr@lpieralisi>
In-Reply-To: <aMwjcIS/rvxkSZdr@lpieralisi>
From: Rob Herring <robh@kernel.org>
Date: Thu, 18 Sep 2025 14:44:23 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+XKT+HkE0W0BLKbQ76RtgBrKToLAVaWOy80mLkD=x0+A@mail.gmail.com>
X-Gm-Features: AS18NWA_awGPL2y1OiG42_bMmJJc8tA99I270bH2QK0xh_S_5QTtemDGIGlw3EA
Message-ID: <CAL_Jsq+XKT+HkE0W0BLKbQ76RtgBrKToLAVaWOy80mLkD=x0+A@mail.gmail.com>
Subject: Re: [PATCH] of/irq: Add msi-parent check to of_msi_xlate()
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_124437_401208_A988639B 
X-CRM114-Status: GOOD (  25.73  )
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

On Thu, Sep 18, 2025 at 10:21=E2=80=AFAM Lorenzo Pieralisi
<lpieralisi@kernel.org> wrote:
>
> On Thu, Sep 18, 2025 at 08:55:55AM -0500, Rob Herring wrote:
> > On Tue, Sep 16, 2025 at 11:18:58AM +0200, Lorenzo Pieralisi wrote:
> > > In some legacy platforms the MSI controller for a PCI host
> > > bridge is identified by an msi-parent property whose phandle
> > > points at an MSI controller node with no #msi-cells property,
> > > that implicitly means #msi-cells =3D=3D 0.
> > >
> > > For such platforms, mapping a device ID and retrieving the
> > > MSI controller node becomes simply a matter of checking
> > > whether in the device hierarchy there is an msi-parent property
> > > pointing at an MSI controller node with such characteristics.
> > >
> > > Add a helper function to of_msi_xlate() to check the msi-parent
> > > property in addition to msi-map and retrieve the MSI controller
> > > node (with a 1:1 ID deviceID-IN<->deviceID-OUT mapping) to
> > > provide support for deviceID mapping and MSI controller node
> > > retrieval for such platforms.
> >
> > Your line wrapping is a bit short.
> >
> > I had a look at who is parsing "msi-parent" themselves as that's
> > typically a recipe for doing it incorrectly ('interrupt-map' anyone).
> > Can we make iproc_pcie_msi_enable() use this? It's quite ugly reaching
> > into the GICv3 node...
>
> I am not sure I get what you mean here. Possibly iproc_pcie_msi_enable()
> can reuse this patch's code if I extend it and make it a global function,
> yes and somehow use that function to carry out the check for an
> msi-parent property with no #msi-cells property or an #msi-cells =3D=3D 0=
.

I meant using of_msi_xlate() (or even of_msi_get_domain()).

> Don't get what GICv3 node has to do with that though, sorry.

Just trace what the code there does after it gets the MSI parent. I
didn't study it too closely, but why is a iProc PCIe parsing GICv3 MSI
stuff itself? There's either some missing feature in the
irqchip/domain APIs or it's being dumb.

Rob

