Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E3DD6EBEE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 08:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeED+wrJM5lj1ej/ygLCajwOh+yVxntCXNjbUrDu5EQ=; b=qb63I91f0XTsIwtisOFcuH6bgi
	CJS5XesP+Dr7/7bEaZs/k5iUiHB8+2lcflXNoO+FHhbQ2O9OYB3wKauy2gt8sZPT9nnm0EbG3Vnuh
	hTWXcUxAYRF7bVWv+9M5iE+7QHDbWoLCpmJfRaB0wR+jtxBQ1bJM7yNpsPzD82mKtSMQq8RA8eI7s
	HQumV+f7rP2ViUFocXNqyP9taLm/fTv+TinvtTMFEu1stp2hYMBJfrsg/jtqdRtWFrB52yN8mfocv
	3qKMMz8FNJKZx4tNr8CruSRZiM4S8BAY0BltpB39UN60pb06iH1H7aD53NA6/YXETulTLj9eVh0OX
	qtscE/sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwcy-0000000HDs4-3Tft;
	Fri, 29 Nov 2024 08:45:28 +0000
Received: from mail-vs1-f53.google.com ([209.85.217.53])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwbz-0000000HDhQ-495w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 08:44:29 +0000
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4addd900de1so469044137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 00:44:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732869865; x=1733474665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeED+wrJM5lj1ej/ygLCajwOh+yVxntCXNjbUrDu5EQ=;
        b=ZdPiMkqO8/Czqb0XpZUDC+V1z54rhfe2LFwSBxcmpwOQpRH9xUQbwwMvAceG/kAWyU
         quwCkOlTdDmcAqudl2eP/xnmKxaZ9GjvgKLQKVFrT7BDGxaq5Mentt/MEQMmAf10X1/9
         sNBX0lpQA7fGjImekjUYAWdGz0kRHz3wHMXPzucRnW0AIUftBlAMrQMErOlYZ5sKEZ2B
         1xW2IBC/Q9IqLmEBJZuBl4TxWV3i/fS2Ux2PI9qRJIXZOsKqZUWzxUW0dGz4Lo68+zao
         RvxMK9CQykIMyJY2pbddNIxlh8y2KKAoeX4kh3Ic+4HnDF9RI2WbpCo58efW9ULvLN7P
         IRvA==
X-Forwarded-Encrypted: i=1; AJvYcCWMANpWtbh9BuDA+6siq4dmEoaXrk3Sk2f/JkrMKw4U5Sk5yJT0YZGSoN5MG6Z5j+jzh8vVXl2AQRNgUzn1R4+y@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3NcdA5djWph06IJwiuquq2Lij0nwYXheZD5YT4B28NtjP9H/5
	HkEWI17wqzlOaogLWFcX61/tiWLJcTuYYxNmsHM4C4XQpcNq1lJDGB5FUbiKreA=
X-Gm-Gg: ASbGncu8lvEAYh4ZwPnhnC1i1OnKm6+J/0EpPmkQOY7AJSAzjsdgrx+NC3OnZanUDo+
	b8qJQcEWBsgxys61hUDTJe3Rqp28BmRFE8sR670GaZu0A4iGHXzB3YdSRSfMk5JdVz89x4MLNiw
	2wrAZa3M3DOOodqDutsbdEL0btHqg7FMer6ej7dKxSEF0f2yQozYkEMEfxuz+3BdL94yEm6tbkA
	ougaqe4XNbIIKrGIShJ/ZpMQgoqMysxLycQjkyvnbE//QTDTaf8EV3fhT0eqAjzO+QgqtbBwZ1c
	I2mfkQZhbR52
X-Google-Smtp-Source: AGHT+IE4T6yc6fSGzXj/QKImyvYT4fSeBcRUuEIU5jQaZ9ILMiuq0VYZtjVi9MQIWawPT0wCrtt9Pw==
X-Received: by 2002:a05:6102:c0a:b0:4a9:15c:edf with SMTP id ada2fe7eead31-4af449bd73emr11109713137.25.1732869865295;
        Fri, 29 Nov 2024 00:44:25 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b82b2fbbbsm617960241.19.2024.11.29.00.44.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 00:44:23 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-856e7566b2cso389045241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 00:44:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjZ1ifxkb8QEee0EwWzcMITOV6EZK450jp1Xq+SnNsnp6JhmbMppukCnwFaCEI2E8+Gza+q98ASvD+Ob9YXERA@lists.infradead.org
X-Received: by 2002:a05:6102:508a:b0:4af:594e:ebdc with SMTP id
 ada2fe7eead31-4af594ef13amr6615796137.5.1732869863438; Fri, 29 Nov 2024
 00:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20241010063611.788527-1-herve.codina@bootlin.com>
 <20241010063611.788527-2-herve.codina@bootlin.com> <dywwnh7ns47ffndsttstpcsw44avxjvzcddmceha7xavqjdi77@cqdgmpdtywol>
 <20241129091013.029fced3@bootlin.com> <1a895f7c-bbfc-483d-b36b-921788b07b36@app.fastmail.com>
In-Reply-To: <1a895f7c-bbfc-483d-b36b-921788b07b36@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Nov 2024 09:44:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWXgXiHNUhrXB9jT4opnOQYUxtW=Vh0yBQT0jJS49+zsw@mail.gmail.com>
Message-ID: <CAMuHMdWXgXiHNUhrXB9jT4opnOQYUxtW=Vh0yBQT0jJS49+zsw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241129_004428_300757_D2C3C0C1 
X-CRM114-Status: GOOD (  27.25  )
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

On Fri, Nov 29, 2024 at 9:25=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Fri, Nov 29, 2024, at 09:10, Herve Codina wrote:
> > On Thu, 28 Nov 2024 20:42:53 +0100
> > Michal Kubecek <mkubecek@suse.cz> wrote:
> >> > --- a/drivers/misc/Kconfig
> >> > +++ b/drivers/misc/Kconfig
> >> > @@ -610,6 +610,30 @@ config MARVELL_CN10K_DPI
> >> >      To compile this driver as a module, choose M here: the module
> >> >      will be called mrvl_cn10k_dpi.
> >> >
> >> > +config MCHP_LAN966X_PCI
> >> > +  tristate "Microchip LAN966x PCIe Support"
> >> > +  depends on PCI
> >> > +  select OF
> >> > +  select OF_OVERLAY
> >>
> >> Are these "select" statements what we want? When configuring current
> >> mainline snapshot, I accidentally enabled this driver and ended up
> >> flooded with an enormous amount of new config options, most of which
> >> didn't make much sense on x86_64. It took quite long to investigate wh=
y.
> >>
> >> Couldn't we rather use
> >>
> >>      depends on PCI && OF && OF_OVERLAY
> >>
> >> like other drivers?
>
> Agreed.
>
> I would write in two lines as
>
>         depends on PCI
>         depends on OF_OVERLAY
>
> since OF_OVERLAY already depends on OF, that can be left out.
> The effect is the same as your variant though.

What about

    depends on OF
    select OF_OVERLAY

as "OF" is a clear bus dependency, due to the driver providing an OF
child bus (cfr. I2C or SPI bus controller drivers depending on I2C or
SPI), and OF_OVERLAY is an optional software mechanism?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

