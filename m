Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E682BC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 00:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/dKbBbIAJRxT8vr39V0wwDize8rkJ2vri92QYY0yFU=; b=UyjybkYo/9p25zDRwzdeaZynq3
	81Fn9cv5JJ362/7VH6tJpvMdqzbn9+NBrwd/+Ob0i4OpLFp/eR/2wvrzQGW0WbNT0RlTQvzwRZm3P
	rhcYnBWnl6U9wehjcepBF1NhnZd+9IUacNvgTWgfFR/WOF/ruqoprrPv6t8CNYjWt1txyoAdwmAkK
	cj+DPZ/JQOH5uvHe25TJKhQ/j124z0C5F0wj4Vv7++SaZ3IoMo214m3G29xox+s+iB1fTT3OlBjiJ
	lSNKmpZYajQHtmyPmI4lJCbI3lQwo3pATIGRstOWCyUiG8RsKtEs8Kn+52Y/6kCu6CX74T3UYAl9Q
	xZ+bDCVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL9wa-00000002dfJ-2wPt;
	Sat, 31 May 2025 00:19:24 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL9gs-00000002aLP-3eWR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 00:03:12 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7d09b0a5050so151269985a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 17:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748649789; x=1749254589; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/dKbBbIAJRxT8vr39V0wwDize8rkJ2vri92QYY0yFU=;
        b=NUA77nTJ33bD1GlTv2XYKEj51yRlR5v5jKPkw6q12XVOS5CvbsntOI7TBemAJ2j7hz
         5j/mhuQWE+lvMvVM9bZ34myrmztMfg3hB3NtvnYYaZpb2774iT4zV0EJNwgUMMwVs3LX
         Jy8Q44DHqNaZLtiABQP3eUngoJmFVHaQz1ZcSFwNlYSRcyirOkHfPiqBicjS5qSEdMHo
         drlZQcKcELaa6ZbT01WyvgtrQtc1+MSOwHmE42DL6//AMhLWxV9rldD+if6w6GC77BRL
         U++81/syk/+YJFKKaPYiYvFXGE25V7SXNYhK++K5JJNWluayy3FaHcX/ZoqAiLzDCxdD
         NV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748649789; x=1749254589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/dKbBbIAJRxT8vr39V0wwDize8rkJ2vri92QYY0yFU=;
        b=UjPyVuSe/KEXqjf4+p7F61BblWeuM/hDSpxei7gOsuN3+pZuttGx54W70AUQxw453v
         n5nPKtKHv3psajyZJFXXRnwa49uWIJYiNuMG41JwyyGG77JLAFQ1dqeG8KxL3Qp5m7Oc
         HtBG15DRh+mpiY3kGT8XsfZlDySmKBwOo0OJhbIlMAXk5yQCN+QiG7M1MdERtl0AP9v8
         cf30owwNBlvehqSta89cqybLBjv774rgXJGQV1ICgkTes1ZbFgCxZlGIa+xBiz76MX0J
         7L7bpHz5kg/E4tkCXvhGpvQAYHu44HZ+U5OJS3/pV5C+BckbINn9KFzucqm81mg2LfAW
         k+KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgHfVXuK6hXeUbtBNobezQUdc6VGVLRTISlJ4aCKe4/kz2LRFQtjK8q9/Uc/nhx7n5EIta6BoZ0ZONjD6EPCxh@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/NnAORtSyV1bbaw/Jj0WWYt81XGSSdan7w9euJtSttED7zijs
	t7/zToJb0ayoZP/shkteWlHKde4obGNX6fXqFTsltJZ27+Z+mQaW6Hk9LuoZRNGQe1XIkUH1Lou
	I/5NT0LCJX0xRn/0EYIzcocEvK2I6I40=
X-Gm-Gg: ASbGncvJpB8P2D51UqN1tMSQhTbAIfl11i20LpwC2PDdw6KU8GD+xXla5y1YkMJt9op
	/mWO61wMcPQO5qMWANILXz0xxkYiJUbV92VshGl4MktBEZwjzqPPASSMwFN0IK+Myizuaylxt+H
	MnorG66NZf9zIbuiZYi8b9aVpbA7H5A6s9Iw==
X-Google-Smtp-Source: AGHT+IHYyJlGTtpjLfDS2korruhddZalmtfRzHquW+3WyYzNkhp5Cmo7Al9su+C9WS0W0IHm4jkhbhjqHsgACCoVWZw=
X-Received: by 2002:a05:620a:4508:b0:7ce:f58e:7e9c with SMTP id
 af79cd13be357-7d0eac3dc9bmr54414885a.7.1748649789320; Fri, 30 May 2025
 17:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch> <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch> <CADvTj4posNXP4FCXPqABtP0cMD1dPUH+hXcRQnetZ65ReKjOKQ@mail.gmail.com>
 <e1f4e2b7-edf9-444c-ad72-afae6e271e36@gmail.com>
In-Reply-To: <e1f4e2b7-edf9-444c-ad72-afae6e271e36@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 May 2025 18:02:58 -0600
X-Gm-Features: AX0GCFszR54VKhpbiCp7QT24c4JTQPW5wRggeGSsldqyRuwmihD2lRx7cFJ2K-I
Message-ID: <CADvTj4oSbYLy3-w7m19DP-p0vwaJ8swNhoOFjOQiPFA24JKfMQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Furong Xu <0x1207@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_170310_914877_79E03E2C 
X-CRM114-Status: GOOD (  39.61  )
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

On Fri, May 30, 2025 at 5:56=E2=80=AFPM Florian Fainelli <f.fainelli@gmail.=
com> wrote:
>
> On 5/30/25 16:46, James Hilliard wrote:
> > On Tue, May 27, 2025 at 2:02=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> >>
> >> On Tue, May 27, 2025 at 01:21:21PM -0600, James Hilliard wrote:
> >>> On Tue, May 27, 2025 at 1:14=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> =
wrote:
> >>>>
> >>>> On Tue, May 27, 2025 at 11:55:54AM -0600, James Hilliard wrote:
> >>>>> Some devices like the Allwinner H616 need the ability to select a p=
hy
> >>>>> in cases where multiple PHY's may be present in a device tree due t=
o
> >>>>> needing the ability to support multiple SoC variants with runtime
> >>>>> PHY selection.
> >>>>
> >>>> I'm not convinced about this yet. As far as i see, it is different
> >>>> variants of the H616. They should have different compatibles, since
> >>>> they are not actually compatible, and you should have different DT
> >>>> descriptions. So you don't need runtime PHY selection.
> >>>
> >>> Different compatibles for what specifically? I mean the PHY compatibl=
es
> >>> are just the generic "ethernet-phy-ieee802.3-c22" compatibles.
> >>
> >> You at least have a different MTD devices, exporting different
> >> clocks/PWM/Reset controllers. That should have different compatibles,
> >> since they are not compatible. You then need phandles to these
> >> different clocks/PWM/Reset controllers, and for one of the PHYs you
> >> need a phandle to the I2C bus, so the PHY driver can do the
> >> initialisation. So i think in the end you know what PHY you have on
> >> the board, so there is no need to do runtime detection.
> >
> > Hmm, thinking about this again, maybe it makes sense to just
> > do the runtime detection in the MFD driver entirely, as it turns
> > out the AC300 initialization sequence is largely a subset of the
> > AC200 initialization sequence(AC300 would just not need any
> > i2c part of the initialization sequence). So if we use the same
> > MFD driver which internally does autodetection then we can
> > avoid the need for selecting separate PHY's entirely. This at
> > least is largely how the vendor BSP driver works at the moment.
> >
> > Would this approach make sense?
>
> This has likely been discussed, but cannot you move the guts of patch #2
> into u-boot or the boot loader being used and have it patch the PHY
> Device Tree node's "reg" property accordingly before handing out the DTB
> to the kernel?

No, that's not really the issue, the "reg" property can actually be
the same for both the AC200 and AC300 phy's, both support using
address 0, the AC200 additionally supports address 1. In my example
they are different simply so that they don't conflict in the device tree.

The actual issue is that they have differing initialization sequences and
won't appear in mdio bus scans until after the initialization is complete.

> Another way to address what you want to do is to remove the "reg"
> property from the Ethernet PHY node and just let of_mdiobus_register()
> automatically scan, you have the advantage of having the addresses
> consecutive so this won't dramatically increase the boot time... I do
> that on the boards I suppose that have a removable mezzanine card that
> includes a PHY address whose address is dictated by straps so we don't
> want to guess, we let the kernel auto detect instead.

Yeah, I noticed this, but it doesn't really help since it's not the address
that's incompatible but the reset sequence, I'm having trouble finding
examples for mdio based reset drivers in the kernel however.

