Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FA3C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nObl+SYcIa3QW/piwikKudB5bjd1HimTQxS37KWupiE=; b=NI2TPsIE3NZa2l0hElw52RKiEu
	Dl08eBbD/JdJTujlWfmPxeK5dwZwAALcAaDtYnrXIdzWH4sfy7M5+18rPQaac4yrkDQZZWHPd4Baz
	67C+P85wlj0C7ypIX/mnD3MCxl4pgjtsjrMHKyyay0IxWjijE7xQXx7CWgEoAVzZJvklfA9z+cYDJ
	QTBltaABB3XThnCfJ1DB/bms+JKZ4qz5gknHkgJXoEcAGcBlRufcHTHXdk6duKXxKgS1zSOluED3Z
	+OEW/pgaZ5VI6p2cZBGfG32OJ4iXGnDtBbsANmZ5MWXvQw2kk9/+0wx0E+PkAfNw14n8A8+wVN2DL
	3jn8Kd1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKns-0000000BdpG-2BdB;
	Thu, 03 Jul 2025 14:20:44 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJ0u-0000000BK8p-3PA6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 12:26:06 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-60dffae17f3so8261645a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 05:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751545563; x=1752150363; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nObl+SYcIa3QW/piwikKudB5bjd1HimTQxS37KWupiE=;
        b=mJdIv4rlsRBHifq+6Qf0rm/CgbyP4ZL/iFjfwH8IMmxvIY4qdhZPgoCN00P6gsrxIr
         mxvcMNAA6piORPjBMyA0UvXKeot0Umujvk9xh1tvNmpZVcDeknVYosrVBZKDeJehyaIm
         cMqYLYQ/LgWReJyYTELdYGE9wUN3qlqstBlRK15AxAwIAMvPmE9nyevLTB+3awdKooYc
         7IbaHvep5GHsN2HLLmF+7TDlWO2R5Ep4nXAUZ9wmQheutQt7qiCUtzqPqvhkpNtnwwfV
         Mv7arYbTp9go7B7lQ6BHGZcudM1mZ62IfstfLqJZ80pCeQv9IJm5T6ITo4AsIsfmArXn
         NiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751545563; x=1752150363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nObl+SYcIa3QW/piwikKudB5bjd1HimTQxS37KWupiE=;
        b=NNeUdgl2kR5H6SqhLw2jtSdZvXROSFJaivhHqFj5EfTHulaUpvnkBHoI85D7XXkxzp
         7hKHbXP9xbJU/978QfgAz13WMbtPwFFOxbB9Pcx5sHIEXd1nYfXcmpJAtptVB4TURh/7
         vxDEmR/H27ltZFaZA75Xdpey9bXvVb+paQnDkNb18K2syTwa4zJeoIETbN5jtbE2JdhG
         gY8pWCaIH/R8ZjAq7/0jQCaSU6aNdUGQNn/7q8fYgssKGoctxAiJntUaMxA4Vr74+QSN
         i+ScmWjJtFCsPUTeF/23ZlTQ47djCW1erMnVNaxiPdZykWhOZNSGICT3ptnEPs97JidJ
         s8KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbmApwk7wBheqmuPdbgiRizQQZkcMkijdJRifoXqeAVVksNJhtKmHBUNERKSvLquc8hB7d+CeVd4L4p8WkKuOb@lists.infradead.org
X-Gm-Message-State: AOJu0YyiftP2QdWllrzhcv7zbApwa0aAhYdtBPTCtbdUUezi/HKQlnbY
	uhnUX9T+zQIkxy5Pz0pNAx7A8Z+HYs5e2ZOLpgpYe69T4TBNvHtWVjkOEyNfzlZAIEoRxR+4KeY
	sQ5xm8UPIHSHOPaNTndRpl9cymxNPCaIrvIXaG8L4Bw==
X-Gm-Gg: ASbGncssFa8D/QNQv/yE5A1dcjSv6jXdkoca7bjd/e6OtOFFPiOPcgZiSaXFPVhRUUh
	zISSH74tr3twI/IvufcRVol63p6zwJA+UXKuZrMdu3Ktz2MpJUZHJKC7K3Z5cVJMwJLwwYElb1S
	Zvm1GGMxfNMuaWOIoFfrkqhvnQQHry4Eb4R046Zg5Ig67lw0JchjZ5stQ=
X-Google-Smtp-Source: AGHT+IEQsYSlWMf3Q9ENbLYf0hzYQ7kNTdCoTK8bDuxoivKIYAt9JBafQ0ZP5WqZFwf5XmjzV9WjVxRtGoE8EwoykYw=
X-Received: by 2002:a17:906:6dc2:b0:ade:2e4b:50d1 with SMTP id
 a640c23a62f3a-ae3c2bb9a30mr525010866b.29.1751545562485; Thu, 03 Jul 2025
 05:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
 <20250702183856.1727275-2-robert.marko@sartura.hr> <ea353170-6e03-4231-afc2-3dc45253931d@app.fastmail.com>
In-Reply-To: <ea353170-6e03-4231-afc2-3dc45253931d@app.fastmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 3 Jul 2025 14:25:51 +0200
X-Gm-Features: Ac12FXyEmDCCZ2eYF1-BFnQ2rb5Xpv9SlBj8TpVb-TJbG9_3w-Q9dIeIUPPsPkE
Message-ID: <CA+HBbNHxiU5+xVJTyPQFuCJLyEs5_MpybSBEgxi25bzaGfiVHA@mail.gmail.com>
Subject: Re: [PATCH v8 01/10] arm64: Add config for Microchip SoC platforms
To: Arnd Bergmann <arnd@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Daniel Machon <daniel.machon@microchip.com>, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_052604_862985_F8A6866C 
X-CRM114-Status: GOOD (  24.16  )
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

On Wed, Jul 2, 2025 at 9:57=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> On Wed, Jul 2, 2025, at 20:35, Robert Marko wrote:
> > Currently, Microchip SparX-5 SoC is supported and it has its own symbol=
.
> >
> > However, this means that new Microchip platforms that share drivers nee=
d
> > to constantly keep updating depends on various drivers.
> >
> > So, to try and reduce this lets add ARCH_MICROCHIP symbol that drivers
> > could instead depend on.
>
> Thanks for updating the series to my suggestion!
>
> > @@ -174,6 +160,27 @@ config ARCH_MESON
> >         This enables support for the arm64 based Amlogic SoCs
> >         such as the s905, S905X/D, S912, A113X/D or S905X/D2
> >
> > +menuconfig ARCH_MICROCHIP
> > +     bool "Microchip SoC support"
> > +
> > +if ARCH_MICROCHIP
> > +
> > +config ARCH_SPARX5
> > +     bool "Microchip Sparx5 SoC family"
>
> This part is the one bit I'm not sure about: The user-visible
> arm64 CONFIG_ARCH_* symbols are usually a little higher-level,
> so I don't think we want both ARCH_MICROCHIP /and/ ARCH_SPARX5
> here, or more generally speaking any of the nested ARCH_*
> symbols.
>
> This version of your patch is going to be slightly annoying
> to existing sparx5 users because updating an old .config
> breaks when ARCH_MICROCHIP is not enabled.
>
> The two options that I would prefer here are
>
> a) make ARCH_SPARX5 a hidden symbol in order to keep the
>    series bisectable, remove it entirely once all references
>    are moved over to ARCH_MICROCHIP
>
> b) Make ARCH_MICROCHIP a hidden symbol that is selected by
>    ARCH_SPARX5 but keep the menu unchanged.

Hi Arnd,
Ok, I see the issue, and I would prefer to go with option b and do
what I did for
AT91 with the hidden ARCH_MICROCHIP symbol to avoid breaking current config=
s.

>
> Let's see what the sparx5 and at91 maintainers think about
> these options.

Sounds good, let's give them some time before I respin this series.

Regards,
Robert
>
> The other patches all look fine to me.
>
>      Arnd



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

