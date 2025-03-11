Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73182C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 13:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjiGq/k98KOjOiv018k9gMD0SxaYi2QrssUBdSDWcoY=; b=c2P8UFM4yvWg4xFXVW5ubZgJvh
	mzDzgbDYKvPRBD3jNAT+Bn8Ly7ztj2DQgnEsh/VaDCV7fINCKuhkTwVHiDCpyHgWGIW2bIrE4oT7d
	N1yF3l9t1A5xhVROD8PcA4swtCBCgxeFj96eDFwdVyjrTww02JmpGHAoVr4qummag2SEOAnX9oQMT
	eAcjtzXtmZD57Ftf9hwJamaHOcRGEVbNE4k8AznzB1dsYdx+SXdIXov37qZ5bZj5L3O+7ASILiStC
	gF9xl3ZXINp9X0ecdSFA/lOscBTAxuG9B8wmb5C6BmEegDEKP2SmRUnR37BlY8t0E97SBRtrgJ19J
	f/4Mf4hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trzka-00000005rDf-1X3D;
	Tue, 11 Mar 2025 13:34:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trziv-00000005qwL-30vZ;
	Tue, 11 Mar 2025 13:32:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E2251A450BE;
	Tue, 11 Mar 2025 13:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D46C4CEF7;
	Tue, 11 Mar 2025 13:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741699964;
	bh=foFBmGFbc+QCSONoZVpR+givHeN3h/c5aJuICUYGiE0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IjUGOna96P6PIijXA/JopSCd1d/VyKBBN+ce/Ed0nBiLhKysYuXMOO8ntjKoNJFoo
	 KvvRKcBWnITLYLhGRnSUQitn+rIdSSRK2Cpm5n6Mn/118FAtbrimE5jYp/UXlZTfql
	 gprF+LsaUajaD4mfZOL8d+MWXSTnEbYoMmCi0oUOd2lKGUmCmlD38v+i4Wiq5Pmpjr
	 ayzyPa2JHPukyRerL2/P8O+UDUAqMM7QygXATRowtyikvNNz/2O+EBnThkGFsw2KTR
	 mnRaXP7EryYvf+2VABTSHwEZzyziKQIuYIaobgi/ftZzS8lPgE5Ag3aYBUTqbdFhEr
	 HnFlBeThaEv+w==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so8324316a12.3;
        Tue, 11 Mar 2025 06:32:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGgf5BgsyiX8uXzrpfwefat8eteJFwdoHCZSD8mLgjaRS+Yn8CL7XYefhoDaEi46FDA87EDYCfp5+CteUxBtZwJQ==@lists.infradead.org, AJvYcCWN4Dwd+fkkP2CbqM5zoA0Zs5CkSKLoq65T4QpvdFJTkVmR3Pnxo15xCzHoSnGCU44+4jbOjQYZf54k/GMAchWP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8Fdye8aXPl5pd9d/sQdUnygTD3fwdneDbolncnClOMILQUJE3
	NnKR+g7wzm/QpuPajUW28NE62maM3GE6nkeqkT2FqwDRtnjOXy0gaJDfTOe+w7tjsNwogqwz1nJ
	LdPGmY7ut+be4mSEP+oZGjtM63Q==
X-Google-Smtp-Source: AGHT+IEifrCmqJfikkidIDTYr2jS6o8iDBri/VlKwu/FWmzn0+fbwXWdCCMBLNQSNY6IZ7RZHzcbstx5Fj81dc05srU=
X-Received: by 2002:a05:6402:2353:b0:5e5:c5f5:f82 with SMTP id
 4fb4d7f45d1cf-5e5e211e1f1mr21034407a12.0.1741699962525; Tue, 11 Mar 2025
 06:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1738963156.git.andrea.porta@suse.com> <c0acc51a7210fb30cae7b26f4ad1f0449beed95e.1738963156.git.andrea.porta@suse.com>
 <20250310212125.GB2377483@rocinante>
In-Reply-To: <20250310212125.GB2377483@rocinante>
From: Rob Herring <robh@kernel.org>
Date: Tue, 11 Mar 2025 08:32:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKPGOdS_8KDggO5tBHAnC-NTLAC5iS9GANm9BuxBfQUsw@mail.gmail.com>
X-Gm-Features: AQ5f1JpFqtVYiSlkH0QD-dTfJ4bf9VAjFuYNndnQ1jy7PeA-IWSalDclsIDbfBA
Message-ID: <CAL_JsqKPGOdS_8KDggO5tBHAnC-NTLAC5iS9GANm9BuxBfQUsw@mail.gmail.com>
Subject: Re: [PATCH v7 03/11] dt-bindings: pci: Add common schema for devices
 accessible through PCI BARs
To: Krzysztof Wilczynski <kw@linux.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_063245_880815_E16744CB 
X-CRM114-Status: GOOD (  19.76  )
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

On Mon, Mar 10, 2025 at 4:21=E2=80=AFPM Krzysztof Wilczynski <kw@linux.com>=
 wrote:
>
> Hello,
>
> [...]
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d45c88955072..af2e4652bf3b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19752,6 +19752,7 @@ RASPBERRY PI RP1 PCI DRIVER
> >  M:   Andrea della Porta <andrea.porta@suse.com>
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.ya=
ml
> > +F:   Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> >  F:   Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.ya=
ml
> >  F:   include/dt-bindings/clock/rp1.h
> >  F:   include/dt-bindings/misc/rp1.h
>
> I would be happy to pick this via the PCI tree as per the standard
> operating procedure.  However, the MAINTAINERS changes do not exist
> for us yet, and are added in the first patch of the series, which is
> not ideal.
>
> I can add the missing dependency manually, but that would cause issues
> for linux-next tree, which is also not ideal.
>
> I saw some review feedback, as such, when you are going to be sending
> another version, can you make MAINTAINERS changes to be the last patch,
> perhaps.  Basically, something standalone that perhaps whoever will pick
> the misc patch could also pick and apply at the same time.
>
> Alternatively, someone else picking up the PCI dt-bindings would work, to=
o.
>
> Your thoughts?

I guess I missed this in review, but why is a common schema buried in
a device maintainer entry? Also, an entry in MAINTAINERS is redundant
anyway because get_maintainers.pl can fetch maintainers from the
schema file.

Rob

