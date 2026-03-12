Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25062FED2D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 06:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5f8lz5fAU2KSI7baSw14/mD4GXpdAG8dN/4wJscx+g4=; b=19VdzLBz3QHEsY
	Jh31KbsspssxY3RAHXHkHKq8fGdPLVjBJgWJPyaTPPgV/xQKWjYSYe/Pe4V8nk/BxbSALdktUO8/A
	R2bRStGha147XR42HfSbOIruDaWxIpC2lOjT5f5U3BBTBdSThF03VR46/1F5+RD0ytmJEFHt0bBss
	byOAqTbFcb4w5SVbZvkMx2p+Fga5XxFcaigjxb8P2kNNe216V9gJt5xHeas2W4vCZ6yZlp3D2kFEB
	t6c/4O+ScSjCq/ufv6jFl6gWnzPtBN5Mntndjgubafa9A9M0cj6uLugU5ehLGTeRlRDHHjfxUIvT2
	xAVw6i3CPXXNb6/EEKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ZXw-0000000DSQR-3LlZ;
	Thu, 12 Mar 2026 06:29:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ZXu-0000000DSPP-1gCW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 06:29:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4DD244107
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 06:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41D7C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 06:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773296960;
	bh=5f8lz5fAU2KSI7baSw14/mD4GXpdAG8dN/4wJscx+g4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=h2bfxSm9wzsf/polDEIYiL5js/Faoto78VnkE14vjPt3yXmGy34sqnvVwcLxs6Dtu
	 vPN9gjsDB4qA/G3xrAsq7bk0Cj33zvZNvMj7s1iFsK7Alc1LH6wk1aPKqMlWNM07lN
	 G+mQ8RUyWauKGwtwHzu9ePPDjX9Fg4m1W99rSq2iYH6QC2o90nP7JccnfoS+SMGNkU
	 eJ8fHfJOCLP4UNg5Me1PV2oy5philQBEi8SNi2DtWS3fdcxTqtLhM7G0ycefupuW2v
	 gzDeDdxxWissPV3Mp9ea2z6jz8BG21QB405o8edtyO/Hi3T/8FjKj58RGV9t+cVeIt
	 3pTWwbq9dJawA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a2a59baa6so5838761fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:29:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJzkAaTx+uXoLHE5ZVaNPgZF1L6iCbQP73MdFEQ4S/K35P0zBdF8PDBQSW/Sz+MANqBSnGnmxKRNmGNQuUqWLJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwMoW2XzavPrYySRMpQ0jq/1XhhX3ovIJ4eRkGlQGbzUI1Im+1H
	USghvDfvwmcQTdbe33Z4699ZQ86YJ0gWxzcq1ywgsTCuKRmqjfUCJsXf83IsfCEK+aA3apJIyYi
	3ETbxZTNjmaX/UBMKpy6HfeH1CMuDgk4=
X-Received: by 2002:a2e:a544:0:b0:389:fc6b:943f with SMTP id
 38308e7fff4ca-38a67de53a5mr18901371fa.11.1773296958936; Wed, 11 Mar 2026
 23:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260302144458.3180702-1-wens@kernel.org> <5f8e32e1-c73c-4a3f-a1ff-21b78f764bfd@lunn.ch>
In-Reply-To: <5f8e32e1-c73c-4a3f-a1ff-21b78f764bfd@lunn.ch>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 12 Mar 2026 14:29:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v66MY02xvA_Mvt=6O001XEgz1AVH6ePorPvNtL0s8=W8rw@mail.gmail.com>
X-Gm-Features: AaiRm50N7EZSmg55aQpjnndqzFiacnsEDhd-Cbp1wYEVjcocF86lRPoMFnxLdVY
Message-ID: <CAGb2v66MY02xvA_Mvt=6O001XEgz1AVH6ePorPvNtL0s8=W8rw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: phy: Handle PHY reset during initial PHY ID read
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_232922_486625_22E6E3EE 
X-CRM114-Status: GOOD (  29.86  )
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

On Thu, Mar 12, 2026 at 3:05=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > This work was the result of Russell mentioning [1] that placing the
> > reset GPIO under the PHY node in the device tree might result in it
> > not working.
> >
> > I also talked about this at Plumbers in Tokyo last year during the
> > Device Tree MC. There a few people mentioned that MDIO reset handling
> > has been a pain point.
>
> It is definitely a pain point. I wish we never added support for
> resets, just left it to the bootloader to get the hardware into a
> usable state before starting linux.
>
> Anyway, i don't really see this being a MDIO/PHY problem. It is a
> generic device driver model problem. We need the core to have generic
> code used for any enumerable bus, PCIe, USB, SDIO, MDIO etc to ensure
> the clocks, resets, regulators, etc are in the correct state that the
> probe can work.

I agree it's not just a MDIO/PHY problem. I am looking into it for all
the common enumerable bus types. Currently SDIO, USB, and PCIe all have
some solution, though the SDIO one is deprecated, and the USB one is
incomplete.

That said, this doesn't fit into the driver model well: to create a struct
device the device needs to be enumerated; to enumerate the device, its
resources need to be provided and enabled, but at this point there's no
device to tie the resources to.

All the existing solutions scan the DT and create extra platform devices
to handle the power sequencing. Some bus specific code is needed for this.
USB is simpler, since once the USB device powers up it will initiate a
handshake with the host. All the other bus types rely on the host controlle=
r
doing a scan to enumerate the devices, so the power sequencing code needs
to be inserted into the bus scanning code. The PCI implementation is
extra complicated: some controllers have dedicated PERST# functions
that are toggled from the controller's registers instead of using
GPIOs for the device reset.

> Once the core has this facility, we can modify MDIO to make use of it,
> if needed.

We already have the power sequencing framework (drivers/power/sequencing).
So instead of the open coded reset GPIO I did in this patch, it would
just be calls to pwrseq_get() and pwrseq_power_on(). I would need to
figure out how to actually work them into the MDIO subsystem, and also
how to model a generic PHY power sequencing provider. But the recent
M.2 slot work [1] provides some good examples.

Does that sound more acceptable?


Thanks
ChenYu

[1] https://lore.kernel.org/all/20260107-pci-m2-v5-0-8173d8a72641@oss.qualc=
omm.com/
[2] https://lore.kernel.org/all/20260112-pci-m2-e-v4-0-eff84d2c6d26@oss.qua=
lcomm.com/

