Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB47D6EBF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 10:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppQhOfB0GTFohm0DRY2oBb++m5qCmhOXx8Ed8pgjkgA=; b=GfEhJMvfbBKgGREeJrLmF453R+
	srUe0IRtP6APRAz2X6SiHYIdx60pqcTBent+yk3mumHLucQSN4T9+SCIhSSTEgjKwjQ/fAB4OvZyR
	hZfZLzGMISzMf4FCSC3KtYpjUUV1LZhKv3AOjGkRzGTbtGJgIcBqCcbS0TiNt+/LklYXF894cP390
	A2WjVzmtNGkiKt8TLsUiEypsqick5+xwP79CNd0jjONRMyYd7/b5WEbpj/3eBaACcdyOLUl2/Y5W0
	Tc4voirB7eTi91ruEj6N4PzNm3VA6Z5t1i5eghXouudlQEDfYIyF7lFatNT5tz9pX2FeuVgtjQJwZ
	if3XByPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGyH6-0000000HQyr-3h6L;
	Fri, 29 Nov 2024 10:31:00 +0000
Received: from mail-vs1-f53.google.com ([209.85.217.53])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGyG8-0000000HQnC-0qqO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 10:30:01 +0000
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4aefdbf8134so458048137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 02:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732876197; x=1733480997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppQhOfB0GTFohm0DRY2oBb++m5qCmhOXx8Ed8pgjkgA=;
        b=ViTKYaYTqwCUkEb2G1l6sR5cZp1+F2uTWUmp5quEgcvinRg8rcEEukYhVE3px5HcaA
         l7xpN+76vGJNNtZfGCHV3uusX15jtu9tckhcjVH4oTdWxCu1/VFnFyYLh56jQhYiP426
         QCAS+kx3Lv6bjXpHqC/dZ8/oOg0UnBN78gVdQWvxhDy00Cfh7fEdAxEax8kY11XvLS2b
         hOBP19YlcAD1AWofaSQmMhe1mpkwTthlPXmcdcOWnQ6XXtrWyZMl8BbYQOVo4C8/3CpY
         W63FsjbMb+focVAgMNV1/6lO+pLwX4QAWvf4m8qjzOAdwDVRVfpIPcLSV8JfSFJTq5ei
         3VOg==
X-Forwarded-Encrypted: i=1; AJvYcCU4N0hg2RYLFMMn7ejcn9LVUgPM4DaCybaFFERtadZBkkVffUBsbQEn1srPeNNLHpE9m6DnDuf1irjew5J8DUNb@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlt6hNEQCzaZuAztepf/iL23iH7kbuu/7U01Yr1xkKBcAVBKqB
	d39WKyBkf3fQC39KdQmXrRgWs9XgzHEmzwcJK3N7LAUa7g8ggzUMZK9kqfUw94k=
X-Gm-Gg: ASbGncshY3f7ecXerNlrkKNWv+xvjgk0bsvtbgnuXAg0LL1xLspteJyQjsxmg4BZOz3
	2n2QC1rdIPwVQl9plAYMlYPP/GbF+4M6UhDvlq2P/YS+FhfYs2aAnPDegmddW+VtxIcMyaDOKoP
	jm44R4r+U3IyLcg4uK4OotSxz4CgzTFeIgHZ2m17hY27+koj+sCv6/Mu3Q1iNJfzU9mM2T34KSJ
	V8OnSwGpTP9LUCjhlbbYOw/JfOH0LciLYPtjys8pcR9uAeB263pKcW7+GitZ7VzYWpwdVZ45DcJ
	0vbJrFZ30KVK
X-Google-Smtp-Source: AGHT+IFNnHVINMFD1PpxYcP+H/cjr9h2QPm/vy6B7lsCEuGO9SrLJuYEA87k40/QirNRuqKP0sPkyg==
X-Received: by 2002:a05:6102:954:b0:4af:3fc1:e02 with SMTP id ada2fe7eead31-4af449ded3emr13182966137.27.1732876197123;
        Fri, 29 Nov 2024 02:29:57 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b82d84d20sm716779241.36.2024.11.29.02.29.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 02:29:56 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4addd900de1so499288137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 02:29:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+nsP2qSdte+bERhWG4oidtDVxn6Y2CgFRQUNc/T9LRYVidAwn2BOPFYgPCaaEzurkNAE0NPNr3IgdGlJEWGRi@lists.infradead.org
X-Received: by 2002:a05:6102:f07:b0:4a3:a014:38aa with SMTP id
 ada2fe7eead31-4af448a91b7mr13985272137.11.1732876195687; Fri, 29 Nov 2024
 02:29:55 -0800 (PST)
MIME-Version: 1.0
References: <20241010063611.788527-1-herve.codina@bootlin.com>
 <20241010063611.788527-2-herve.codina@bootlin.com> <dywwnh7ns47ffndsttstpcsw44avxjvzcddmceha7xavqjdi77@cqdgmpdtywol>
 <20241129091013.029fced3@bootlin.com> <1a895f7c-bbfc-483d-b36b-921788b07b36@app.fastmail.com>
 <CAMuHMdWXgXiHNUhrXB9jT4opnOQYUxtW=Vh0yBQT0jJS49+zsw@mail.gmail.com> <93ad42dc-eac6-4914-a425-6dbcd5dccf44@app.fastmail.com>
In-Reply-To: <93ad42dc-eac6-4914-a425-6dbcd5dccf44@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Nov 2024 11:29:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWgqEZtd82hSp0iYahtTcTnORFytTm11EiZOjLf8V9tQw@mail.gmail.com>
Message-ID: <CAMuHMdWgqEZtd82hSp0iYahtTcTnORFytTm11EiZOjLf8V9tQw@mail.gmail.com>
Subject: Re: [PATCH v9 1/6] misc: Add support for LAN966x PCI device
To: Arnd Bergmann <arnd@arndb.de>
Cc: Herve Codina <herve.codina@bootlin.com>, Michal Kubecek <mkubecek@suse.cz>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Simon Horman <horms@kernel.org>, Lee Jones <lee@kernel.org>, 
	"derek.kiernan@amd.com" <derek.kiernan@amd.com>, "dragan.cvetic@amd.com" <dragan.cvetic@amd.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Lars Povlsen <lars.povlsen@microchip.com>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, Andrew Lunn <andrew@lunn.ch>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Netdev <netdev@vger.kernel.org>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_023000_239846_21E35C4F 
X-CRM114-Status: GOOD (  32.06  )
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

Hi Arnd,

On Fri, Nov 29, 2024 at 10:23=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Fri, Nov 29, 2024, at 09:44, Geert Uytterhoeven wrote:
> > On Fri, Nov 29, 2024 at 9:25=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> w=
rote:
> >> On Fri, Nov 29, 2024, at 09:10, Herve Codina wrote:
> >> I would write in two lines as
> >>
> >>         depends on PCI
> >>         depends on OF_OVERLAY
> >>
> >> since OF_OVERLAY already depends on OF, that can be left out.
> >> The effect is the same as your variant though.
> >
> > What about
> >
> >     depends on OF
> >     select OF_OVERLAY
> >
> > as "OF" is a clear bus dependency, due to the driver providing an OF
> > child bus (cfr. I2C or SPI bus controller drivers depending on I2C or
> > SPI), and OF_OVERLAY is an optional software mechanism?
>
> OF_OVERLAY is currently a user visible option, so I think it's
> intended to be used with 'depends on'. The only other callers
> of this interface are the kunit test modules that just leave
> out the overlay code if that is disabled.

Indeed, there are no real upstream users of OF_OVERLAY left.
Until commit 1760eb547276299a ("drm: rcar-du: Drop leftovers
dependencies from Kconfig"), the rcar-lvds driver selected OF_OVERLAY
to be able to fix up old DTBs.

> If we decide to treat OF_OVERLAY as a library instead, it should
> probably become a silent Kconfig option that gets selected by
> all its users including the unit tests, and then we can remove
> the #ifdef checks there.

Yep.

> Since OF_OVERLAY pulls in OF_DYNAMIC, I would still prefer that
> to be a user choice. Silently enabling OF_OVERLAY definitely has
> a risk of introducing regressions since it changes some of the
> interesting code paths in the core, in particular it enables
> reference counting in of_node_get(), which many drivers get wrong.

Distro kernels will have to enable this anyway, if they want to
support LAN966x...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

