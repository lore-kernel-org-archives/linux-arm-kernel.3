Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDE0C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ksdw7M5oeACHV4O06/7f6T9AIjZYxql+qwEMoPd8Euo=; b=MOSqaSGSnH7lwO
	ikLKc0+vY7IxCc3ccSdXwC9hhfq64810biNVTkrrLvci9who1xCDbpBycf2b1EQX0/FHSxQVHkYiL
	YKOGw77s8x33pPI7O6uQvv/ExZm1lZWlZbHRwp/mEn1KBH4QboMO9BM5AbKIiswiDypDHZ3nGW+zE
	2Es83ZMMzlqSOmhQjWI/dbG7Nmt9PlV3AboZSARxIxLl0P/kntRCeH5FPIoFomUGmfTx05TWAnQ/v
	qj15xeL8EMgihA60YFa3SGY+t58HQJcUZ4HtZu+P3ODRUat0QrKwsvSdMTa4SWO14inH8iK0vFcX6
	cj8X0fQie2HhU58SWnTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHfZ-0000000DOOv-0xW9;
	Wed, 28 May 2025 14:22:13 +0000
Received: from mail-lj1-f169.google.com ([209.85.208.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHVs-0000000DL2l-1QS9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 14:12:13 +0000
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32a64f8480eso9979981fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 07:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748441527; x=1749046327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ksdw7M5oeACHV4O06/7f6T9AIjZYxql+qwEMoPd8Euo=;
        b=saDfYKWVTik0NRg+X8T7curCwwkW8+hOmLJ0uIZiUeaDqMBcWmav75yDuK6R0DomYw
         pgd2shtpTEa+s/IorFR0FWLcMLtoPOrXwfokngVH6RmKTbo4bECTz/e0wOzvTq8Yhcw2
         fisXp7MqdunLI1AiGr419o7dGaLb5W4GChNk3WOUR4tu9pfjAgnpWADXmXUdwN2a8lEP
         NZsbm4W3EczeYm/MbO2w9obGNKenQyrkh04yVGMtjbqTXehXaCZH/9SNZ+dFWJVDjX9+
         y5ewf/8Jdxb6dzoPztL/kM0dQQ0hsI3IFkK0nEplnwQbiVrkPcT+s28WA/r2jZvnceB6
         EYBw==
X-Forwarded-Encrypted: i=1; AJvYcCXPOKhWRX5XWBrS2oB1vEelM5rWZIbngCHYmemcGyWwT8iiJDPKg5Fca7i80XHHnai5M6AugyFXOfDpaX/aS3eb@lists.infradead.org
X-Gm-Message-State: AOJu0Yya80nWuAdV4PjZPzaOMMeO6zg5X1C9+Bmms0gOElT9YhZVTYi0
	CCmiOov6wrX/hvGD3a6cUdW4PPXEBY6ED7TbreUztMS36l3OgMAWf2s7JpvV/NmS
X-Gm-Gg: ASbGnct2rVG4pNCc5Kj+t+PodGS0PLi3+zGfzbQHnL0iYlVfgUjfyR5AvGgOY7aJvUK
	rP2bKFYuRn4jinmXOY6v48uOVdCMbR+Mui0S6MI7rhd2/8vYZ2+OIzDKbTNXxV+uXWKDzp7GBPG
	UJomL99RKHYWTrcxUDRyIzYgfOay6g/U9HH6SzaOonXOblmr1E4cUkmVFfyYeI6drju7NhTkjqN
	DftI5tTjtQ3h4FJlSvUYFlq4+mOboWYPZJHxusP7pm6qx7Xl/+v0Rx/dm5YKT0bRE5YlRglWF3T
	qQUgyfNJHi3/Ob086BtZIrUhvalyLCO8mE1SX6zRstDSsuiPB+MbsAsAoDSps8Klk/+WazDq82h
	eFBOinNXTOOJ2C7yUkkw=
X-Google-Smtp-Source: AGHT+IG6OeEVKLfXTDomXS2gYkAsVABfcP2lvyaVNMn+VJH6NM0A6m3piy/+rnEjjUiKnMBvoR134g==
X-Received: by 2002:a05:651c:b0d:b0:329:136e:300f with SMTP id 38308e7fff4ca-32a737a016emr17070171fa.13.1748441527134;
        Wed, 28 May 2025 07:12:07 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79f88bcdsm2616101fa.112.2025.05.28.07.12.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 07:12:05 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32a61af11ffso11488791fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 07:12:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXImchfjs7A5+WetHf7wfwakZx3L5T8mbda5Pr43fe6akMzW6kvHyvyGOeD9YucZfmtwHLeYKFxbg3qjwKmnLr1@lists.infradead.org
X-Received: by 2002:a05:651c:418e:b0:326:cf84:63c4 with SMTP id
 38308e7fff4ca-32a736a7554mr15406341fa.1.1748441525068; Wed, 28 May 2025
 07:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch> <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch> <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch> <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk> <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch>
In-Reply-To: <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 28 May 2025 22:11:50 +0800
X-Gmail-Original-Message-ID: <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
X-Gm-Features: AX0GCFvkvTc-VRmYOaYU5xGuR2czReptL7cuDFoxwx0sxNWmjpy1lDF4i_MRIR8
Message-ID: <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Andrew Lunn <andrew@lunn.ch>
Cc: James Hilliard <james.hilliard1@gmail.com>, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>, netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Furong Xu <0x1207@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_071212_386177_A727D8F2 
X-CRM114-Status: GOOD (  31.48  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, May 28, 2025 at 9:25=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, May 28, 2025 at 05:57:38AM -0600, James Hilliard wrote:
> > On Wed, May 28, 2025 at 1:53=E2=80=AFAM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Tue, May 27, 2025 at 02:37:03PM -0600, James Hilliard wrote:
> > > > On Tue, May 27, 2025 at 2:30=E2=80=AFPM Andrew Lunn <andrew@lunn.ch=
> wrote:
> > > > >
> > > > > > Sure, that may make sense to do as well, but I still don't see
> > > > > > how that impacts the need to runtime select the PHY which
> > > > > > is configured for the correct MFD.
> > > > >
> > > > > If you know what variant you have, you only include the one PHY y=
ou
> > > > > actually have, and phy-handle points to it, just as normal. No ru=
ntime
> > > > > selection.
> > > >
> > > > Oh, so here's the issue, we have both PHY variants, older hardware
> > > > generally has AC200 PHY's while newer ships AC300 PHY's, but
> > > > when I surveyed our deployed hardware using these boards many
> > > > systems of similar age would randomly mix AC200 and AC300 PHY's.
> > > >
> > > > It appears there was a fairly long transition period where both var=
iants
> > > > were being shipped.
> > >
> > > Given that DT is supposed to describe the hardware that is being run =
on,
> > > it should _describe_ _the_ _hardware_ that the kernel is being run on=
.
> > >
> > > That means not enumerating all possibilities in DT and then having ma=
gic
> > > in the kernel to select the right variant. That means having a correc=
t
> > > description in DT for the kernel to use.
> >
> > The approach I'm using is IMO quite similar to say other hardware
> > variant runtime detection DT features like this:
> > https://github.com/torvalds/linux/commit/157ce8f381efe264933e9366db828d=
845bade3a1
>
> That is for things link a HAT on a RPi. It is something which is easy
> to replace, and is expected to be replaced.

Actually it's for second sourced components that are modules _within_
the device (a tablet or a laptop) that get swapped in at the factory.
Definitely not something easy to replace and not expected to be replaced
by the end user.

The other thing is that there are no distinguishing identifiers for a
device tree match for the swap-in variants at the board / device level.
Though I do have something that does DT fixups in the kernel for IDs
passed over by the firmware. There are other reasons for this arrangement,
one being that the firmware is not easily upgradable.

ChenYu

> You are talking about some form of chiplet like component within the
> SoC package. It is not easy to replace, and not expected to be
> replaced.
>
> Different uses cases altogether.
>
> What i think we will end up with is the base SoC .dtsi file, and two
> additional .dtsi files describing the two PHY variants.
>
>         Andrew
>

