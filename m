Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCEFC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 00:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q44z5Bd9/8IILONn0/cL0CaXO9i2aVCCm5R3K/3l5Mo=; b=WvNgmlhahPaBIc8eVUUrhDLetS
	Cy8mvtx7MKks9om0HQ8LXwGH3HUzlW6LHaJT/IO13vdUCnOVHD21Irbnu+f4W1WvS9voyUiKssmXi
	Qs2u3OZwbcXB5lhvP5yACaxNsS2Zf1YnYOBB7J9jwNVpRpgbw2reBGyMEVS+P7z7I3xTaJLoFA1Qv
	Q4BgQs3Sl+I6U/Sa5uuDwL5ooldofTRv1zcgJVU2qFZFtHee9WEOJ0qqpf7nHzDFjGpxSSsTDZ/hA
	mUjxZvZAN41LHiqKsSELg709GzNLuiRolRBMK4S9QCr42A0eQ5hZrWclApJKHMZw6q5UnqUGqVHwI
	cfElMGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKRD8-0000000EVJB-3SyP;
	Thu, 29 May 2025 00:33:30 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKRAy-0000000EUtR-1Huf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 00:31:17 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-4e59012c7eeso228862137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 17:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748478675; x=1749083475; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q44z5Bd9/8IILONn0/cL0CaXO9i2aVCCm5R3K/3l5Mo=;
        b=ia0z729goRAHUoIHHzcZw1Ct9Hw0xzIRC4lYfj71BRuijxUVG5uPaeLssQolSp9jGW
         UpxS7FjDXZjuVzTnHHFp24MNdKzaWVC8T9g8cSsRDU7HBiyomUCWhSgJkSyy60pSp4rc
         q73ZYCdhv+rikZH1NOTAHq2hLqbryceZD/GUQ2keMOo+B5d4hZHs18sNm/8EfriBF3a0
         DZL2DJSzyS0yU+0/vvn5g1J/ZkIqYRvX5aD3BmK6qop0iNnVfvXWnwXoDcXeZqpUuq4f
         88UCH0WosjSTF25uuKAnzs0mCJvHqk473PFW5nWdiIAvbiKIbxK+H4V9eiysGUIsG2ln
         8axQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748478675; x=1749083475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q44z5Bd9/8IILONn0/cL0CaXO9i2aVCCm5R3K/3l5Mo=;
        b=L0sssFANq2gfkvLFbLfGljhGH2zJfGLMShIoWzpXBeSPROHs1F2qfT8skp2qN1D/2m
         cDqgQGLzKV6W+ICzR6JTZjyw2tMKYi//couS/vpS0xLsNq2WBDYRkRdLWx5vtL2/tYMs
         A7pKOTyf/3HOH1JP5kZGFwTSiz/Kdhbf0tljRkFutGCcLN50lOg25PbRs7aGQmnuM0BU
         953lNmJfn11FpJMRnc8FCKzvDGqUEa8BjIuhPdU6DXhD/qzhwko55Uuwd+ITZ2/l97//
         JnFnQc8zV16Yg6BOqlVknR0TTnLbqr0ZyE2xt1hMclGG6dfXUQ36ncRC2DirHpKpJ//N
         PvHg==
X-Forwarded-Encrypted: i=1; AJvYcCVUOzFlJyQRqPAtoTojXlkpkX/kX3JLoEj0qc/BcLhxbrrt3FCc7BpDbOX4kCOFgsdsk+gThLMgbR/fpekRACzW@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt5jL0i3qDR9Qmht6HuL3tzAQ18g6cpyaK5+Brd4DyxBJh79gr
	TNNhp7zIGy0hUTCeFCNMidkn3yYo5s6YcpmGK1aObOf5sYCFJ/3oLYBjlnUmp182Aa+oUunEAbE
	h9SqnmpSeKL6X1b3AyEORRciwYTidWzE=
X-Gm-Gg: ASbGncusEmtLTitX13P2d1rhsiuOQ2jYL8OMUBnM3AGiB//OSkkyijXN7ZrxcCUQnDp
	m9f4mFA6anJoi6MX1PnpBst5CeVJaQYStCf/Eg/AXmyaHiRJIznybzNLmonpIMyH51m+HS9i0QY
	+yvmSev+De/QQ4uMhR0/Uf05qGM0ha6becTA==
X-Google-Smtp-Source: AGHT+IFG095fC3FxIkcr8wXE/8rgaYSmXktT8c+7Ug5Ck8RJXbeQXCBHRZraCpMc7Swq4SZENwhJZHvYWPtIc5+DC5Q=
X-Received: by 2002:a05:6102:a51:b0:4db:e01:f2db with SMTP id
 ada2fe7eead31-4e67dd1919bmr264553137.0.1748478674832; Wed, 28 May 2025
 17:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
 <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk> <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
 <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch> <CADvTj4rWvEaFyOm2HdNonASE4y1qoPoNgP_9n_ZbLCqAo1gGYw@mail.gmail.com>
 <1e6e4a44-9d2b-4af4-8635-150ccc410c22@lunn.ch> <CADvTj4r1VvjiK4tj3tiHYVJtLDWtMSJ3GFQgYyteTnLGsQQ2Eg@mail.gmail.com>
 <0bf48878-a3d0-455c-9110-5c67d29073c9@lunn.ch> <CADvTj4qab272xTpZGRoPnCstufK_3e9CY99Og+2mey2co6u5dg@mail.gmail.com>
 <0c7a1602-61d3-4840-83f2-72a74ffd52b8@lunn.ch>
In-Reply-To: <0c7a1602-61d3-4840-83f2-72a74ffd52b8@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 May 2025 18:31:03 -0600
X-Gm-Features: AX0GCFvqUXpScx-Ym-AQvb--BAqo5_tl8KEywhB2ivVxb9ECD-mfCTp-d4WPAIs
Message-ID: <CADvTj4q96aGsPi6wfMaxTnC-52-Svu_K6raj=LWyOJd+DniEUQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, wens@csie.org, netdev@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Furong Xu <0x1207@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_173116_353446_77FD1F81 
X-CRM114-Status: GOOD (  45.47  )
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

On Wed, May 28, 2025 at 5:47=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > Or, as Russell suggested, you give the bootloader both .dtb blobs, an=
d
> > > it can pick the correct one to pass to the kernel. Or the bootloader
> > > can patch the .dtb blob to make it fit the hardware.
> >
> > This is what I'm really trying to avoid since it requires special
> > handling in the bootloader and therefore will result in a lot of broken
> > systems since most people doing ports to H616 based boards will only
> > ever test against one PHY variant.
>
> Which in some ways is good. They will then issue four letter words at
> Allwinner, and go find a better SoC vendor.

No, they won't, because the vendor that actually buys from Allwinner
also uses the BSP and doesn't care as long as the BSP works.

>
> > > > > Do you have examples of boards where the SoC variant changed duri=
ng
> > > > > the boards production life?
> > > >
> > > > Yes, the boards I'm working for example, but this is likely an issu=
e for
> > > > other boards as well(vendor BSP auto detects PHY variants):
> > > > https://www.zeusbtc.com/ASIC-Miner-Repair/Parts-Tools-Details.asp?I=
D=3D1139
> > >
> > > Mainline generally does not care what vendors do, because they often
> > > do horrible things. Which is O.K, it is open source, they can do what
> > > they want in their fork of the kernel.
> >
> > That's not really true IMO, mainline implements all sorts of workaround=
s
> > for various vendor hardware quicks/weirdness.
> >
> > > But for Mainline, we expect a high level of quality, and a uniform wa=
y
> > > of doing things.
> >
> > Sure, and I'm trying to do that here rather than do some super hacky
> > unmaintainable bootloader based device tree selector.
> >
> > > This can also act as push back on SoC vendors, for doing silly things
> > > like changing the PHY within a SoC without changing its name/number.
> >
> > It won't here, because Allwinner doesn't care about non-BSP kernels.
>
> It can be indirect pressure. There are some OEMs which care about
> Mainline. They will do their due diligence, find that user report
> Mainline if flaky on these devices, and go find a different
> vendor.

There are zero OEMs in my industry that provide hardware with
any mainline support at all. The vendors are outright hostile to 3rd
party firmware and put significant effort into preventing 3rd party
firmware. The OEMs will view the lack of mainline support as a bonus
unfortunately as they like everything locked down.

> There will be some OEM which get burnt by this mess, and when
> they come to their second generation device, they will switch vendor
> and tell the old vendor why. It could well be Allwinner can support
> their bottom line without caring about Mainline, so really don't
> care. But Mainline can help point OEMs away from them to those which
> are more Mainline friendly.

The OEMs in my industry will not change due to a lack of mainline
support, they have no interest in mainline support, they only care
that their products work well enough to sell, and since there is
little competition

> We also need to think about this as a two way street. What does this
> SoC bring to Mainline? Why should Mainline care about it?

The H616 is used in a number of development boards(orangepi and
such) and TV boxes, having decent mainline support at least allows
downstream integrators to have a chance at improving the situation
regardless of vendor cooperation, maybe the SoC vendor will
eventually care if people are actually using mainline kernels more.

> It has some
> major design issues, do we want to say that is O.K? Do we want other
> vendors to think we are O.K. with bad designs?

I mean, it's a second source issue for the PHY, less of an outright
design issue and more likely was just some cost optimization.

If we excluded all vendors with bad designs then Linux would have
far less hardware support.

> Worse still, this is
> stmmac, which lots of vendors already abuse in lots of different
> ways. Russell has put in a lot of effort recently to clean up some of
> that abuse, and we are pushing back hard on new abusers.
>
> If you can hide this mess away in the bootloader, it just looks like a
> regular device, we are likely to accept it. If you try to do something
> different to the normal for PHYs, we are very likely to reject it.

I'm confused, the kernel isn't the bootloader so how can it be accepted
by the kernel if the implementation is not in the kernel? Linux supports
plenty of weird hardware so I really don't see why having a quirk for
this specific board is such a problem as long as the quirk doesn't
introduce maintainability issues.

