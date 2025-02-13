Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE147C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 11:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwgkmhLwCdZnQCEgDKGior/XaAE1+cSjZI17Qz6Sy2U=; b=AMTxmp++bvoAB6OdN/l64CyU3S
	B3NK+NungKe5iTTAH2pjicGwAf2jncQ5nmFtl4onR8xgHJdiDw/76uU+WJlULfYeZTskoYimoInWn
	sIWKlUCFtuzplGyx0Ngly+QQH6LNBiA6kciah76iQ2pQPe4uUJeC6g7vlc9Q5m+xLia/uFXtCfyd4
	oaQ8dLvIXr0DXU7/SaIdvUm4RTVcPFvirl9Ifp43B2HaGEWWMsyzJ6REn56rTkYdzBsD6ScyuBTv+
	m1vqxjv/tjdM8hZjW6bwv8yKAUAPMNSFenpcNqtRNU0rN7XDMn0NdLsN+riDeY3G+qCvOg1c4w47t
	N+qLb5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiX8M-0000000AmrT-03jG;
	Thu, 13 Feb 2025 11:11:54 +0000
Received: from mail-vs1-f52.google.com ([209.85.217.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiX6u-0000000AmZu-45XX;
	Thu, 13 Feb 2025 11:10:26 +0000
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4bbd3cff198so453056137.2;
        Thu, 13 Feb 2025 03:10:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739445022; x=1740049822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwgkmhLwCdZnQCEgDKGior/XaAE1+cSjZI17Qz6Sy2U=;
        b=L26rtlACE05BBu0rw6aTfonMzMxBByV8aWbFzWok3UcNMedSdEZY4Yo7asokS9fpzA
         Y2b7UETtw5bHwElvmnXFeozIjZrHegVcBacDpdTELbqR39aQDDUeUphd8MGrt0lwIHMe
         1Ay05bB1Khc1lMnP/Uy/atpJJyTHyceBUASc7pBKOfJZSA98jNPqzsdI7iq7ir0y6maD
         GxAlgD1xUoYOjSdU1gZlljh4mA/w9/HmVGswvrH1cMTE0DdIU4XTQ3iBRUoyOLwFpH6h
         rSBAeO7xzS1jHblErVENP5Osl0p4f7/EimP/7CAeirP+fw7iDnAorOpX+tCwHheik7x4
         nlRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl7FZEwHVYY4P+DOr5jXKwRnARx61MSQZmqy9a6jmhb1LrBWwgXH1V7/BLjRdQAxsKTSNiHKAU13mjHtuBTJA=@lists.infradead.org, AJvYcCXRGpsrvqxnzai71lsC/kf+ROght2vQDQzJtIrWCDjAeoujz+6WLelWkmZ2xpEETM/+2riC0sfxCYrNJe3/4TPd@lists.infradead.org
X-Gm-Message-State: AOJu0YwdBEYVCHFsm2htWr2ORvNuN85oJFBNVDXYRYv8MhHu54JMOig9
	gZnIZEW4QOG4lGq5jrPGIJ1V5IW3+56BII+fAJjcUKr4HMY29icYgfjjxa8dP7M=
X-Gm-Gg: ASbGncs77tDxRutS1W8UC8EF7wxoHkUuC1imbMs0v1MG1zweGb6rwJisufPPBL7Y9ya
	OF8gstJxGZ46+qyTFm6NeRd15Oq9iRlRRsKoLYyF6Kg91jsHcUy/btka1OQXiff74mvjSVOFatz
	MODgxVdk9KtMIUx/e90fP9vudnDFX8AuYxOWlVLU/J5w3Wen7h78EJdWjPPXBrUyVxXOwLCJpYR
	YYwHacOS/0ZtRDNRvyq3tkqCyZfY8CE33toBeOaWhkoX5FTug/IAIy+KUew9enwHkD/ssrNepxs
	KE1ANh6KHZeNbBPXCTVe/umdRgb026YGEz+hhisMsT7+aMlokpZg8A==
X-Google-Smtp-Source: AGHT+IGq19tQkSE6L52yuaJe7n4wQg9b6VpIb79zWz8HB22kmcmJgQQuHnNYhfYDFP1XjuncINI5ug==
X-Received: by 2002:a05:6102:508b:b0:4bb:dfd8:4175 with SMTP id ada2fe7eead31-4bbf21e5e56mr7300428137.19.1739445022429;
        Thu, 13 Feb 2025 03:10:22 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e86bd45csm151271241.24.2025.02.13.03.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 03:10:21 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-866f32750a7so501496241.0;
        Thu, 13 Feb 2025 03:10:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVr2jVxMO6kNPbf6dtxLLWeUhrACsK3SHD+kXZx4gVLpr9yg6auLiHahlkVbL+GoqSGQbhES4B2XEBZ593gB10=@lists.infradead.org, AJvYcCXFa+/2Unk0BEOMgC0sawP3ZvhkUKk5qwF+lR6wN68Zexs2ar7tZitMuYv4Pd7zrgNczvHVR7tKndELanxGBJZ2@lists.infradead.org
X-Received: by 2002:a05:6102:5108:b0:4bb:edc9:f95c with SMTP id
 ada2fe7eead31-4bbf210aa1emr6434080137.15.1739445021452; Thu, 13 Feb 2025
 03:10:21 -0800 (PST)
MIME-Version: 1.0
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com> <Z6zwqbzd5evG0H2z@smile.fi.intel.com>
In-Reply-To: <Z6zwqbzd5evG0H2z@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Feb 2025 12:10:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_iojuf1+K=fWJaC2N9v+DkYEQHNpD8X5=2YG11aoAVA@mail.gmail.com>
X-Gm-Features: AWEUYZlUzirD3ek5L604Zv7gAkhCUNphgI2LIBZrWs7QIl-67Gk7L-7Wf9PzZr4
Message-ID: <CAMuHMdX_iojuf1+K=fWJaC2N9v+DkYEQHNpD8X5=2YG11aoAVA@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, 
	Krzysztof Adamski <krzysztof.adamski@nokia.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Roese <sr@denx.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_031025_011339_FE6A4151 
X-CRM114-Status: GOOD (  33.45  )
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

Hi Andy,

On Wed, 12 Feb 2025 at 20:04, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Feb 12, 2025 at 07:36:46PM +0100, Geert Uytterhoeven wrote:
> > On Wed, 12 Feb 2025 at 17:35, Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > There are already a lot of drivers that have been using
> > > i2c_8bit_addr_from_msg() for 7-bit addresses, now it's time
> > > to have the similar for 10-bit addresses.
>
> ...
>
> > > +static inline u8 i2c_10bit_addr_from_msg(const struct i2c_msg *msg)
> >
> > Having never used 10-bit addressing myself, or even looked into it,
> > it took me a while to understand what this helper really does...
> > So this returns the high byte of the artificial 16-bit address that
> > must be used to address a target that uses 10-bit addressing?
> > Hence I think this should be renamed, to better match its purpose.
>
> Since you are giving a constructive feedback, please, propose the name.

i2c_10bit_addr_hi_from_msg()?

> > > +{
> > > +       /*
> > > +        * 10-bit address
> > > +        *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
> > > +        *   addr_2: addr[7:0]
> >
> > I think the second comment line does not belong here, as this function
> > doesn't care about that part.
>
> I think the comment is okay to stay. It explains the full picture which is
> helpful. It may be extended to say that the function returns only addr_1.

Or it could be moved outside this function, i.e. at the start of the
section listing all 10-bit address helpers?

>
> > > +        */
> > > +       return 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7) | (msg->flags & I2C_M_RD);
> > > +}
> >
> > Probably you also want to add a similar but much simpler helper to
> > return the low byte?
>
> Wouldn't it be too much?

I (my OCD ;-) love symmetry...

i2c_10bit_addr_lo_from_msg()?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

