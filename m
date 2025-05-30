Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E1BC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 00:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8r1VhQxE8YGMw2E+RF6ib2Y5lg3+2mjo9SImYhpolU=; b=OyuRA2ElxNztazIhT6gTtYzZ+P
	xF88nFwl5+j/lCh0A5caFJnmm67lWeaL7XJPU0xd78Ao24sUn3R1OCKidEoYUVcqccZmylPqxIDlK
	CjmAe1HDjBIilJF9wYCVsfkgxBjJtICXtRUi7TbKTgkTchyIU1xOSq6E3R8tFB3GCDFb+F4QAMOjJ
	fa0hBQi7eC+OsKSN3DMnBUoCOkLeZhVyQpmfJ7WImuW7OCXOL39L48m+SeRUauss1SLn663Du4CmX
	Y4DVEtahiTN6NgmdOkucwxL7zPY1yK/XZ7v63XBfNFZYdj/ON6E8Rzyrb9JXxLqEE7XRhCB7WX/gG
	EHPMhFew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL9qH-00000002cEm-1luF;
	Sat, 31 May 2025 00:12:53 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL9Qx-00000002Txo-25LF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 23:46:44 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4dfa2aeec86so1088304137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 16:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748648802; x=1749253602; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8r1VhQxE8YGMw2E+RF6ib2Y5lg3+2mjo9SImYhpolU=;
        b=bcmvtjdEX0UDDe9GwVkSRA3kHe4qvtHAVHmjhtJ4DE3avIGzDHWkqXRTV5Osj3mHer
         8KJxIY678V5fesPf6KDUQYCO2QosWaO4YgCbBCyCV3ZT3dllwSm+Z2ILI4iegfF9mzlI
         C6OjMllJ6TiBQxlld6fgFWnYJOqKYXmsgZYwr1Md8I9/GiRd8wFh7lfDE79uYGypcR8p
         MyR6zoHvel4eBKKCSKkq9uko8jZvYKB6kC4klzjiWmtv2N+NgplziIkErU0SZ4J3B7Iy
         KTa87zMHTL+0CeKPJBtjfKiaKm1uCCQQ7tIIWs8+gN3f9UgWnc1D00jk2pPiWRD8zM0K
         AxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748648802; x=1749253602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8r1VhQxE8YGMw2E+RF6ib2Y5lg3+2mjo9SImYhpolU=;
        b=ItUTiIhHKYaxZWJjrLaAymjnXSJzlmdaRLE0zl+bGpH/DRKztcZNUdnVB/6gg2prAy
         pT0iel02dNWUm4+AQOXcZkdocoizoFeT/Au8GpkGkmz47NZbDO2b5AMHZT2BHpXRIiQU
         lT/Ojt+8xaH1Ytl/3FDiYFVkH1+QP51iQkt2lEDUW/zL1zgs469an8HQviSD3o3FYhe4
         WThDbhWP3qAdmdGiE3V2aaAurLW+x+/WgTMkRLuIEfA5NHT90ICyWbxmimnAtf9OCXlq
         LjM92Kgk7WZDLMk6LigWc11wJu9UXNNnNO5+GkrB6dmlxAKV6ZzGhLtN0a1zODkLHE0S
         DDBg==
X-Forwarded-Encrypted: i=1; AJvYcCXzpX5Zl24sFMSYM4XvnSPBo52Al7Vlj/NpIumVYIVfkFjIbeWmqzbdzLzWEiKk2ElgNBMQK5Olzp5xdVESqefc@lists.infradead.org
X-Gm-Message-State: AOJu0YyPyZpFIj14UmHSHKRd25gzqcFvW4/je4cZ8VZ0xrZofdGsq0PJ
	GANKB0mvXRNkwKN3OqvElpmmr+09GvZG4/jGsJxlXknwaTA0AenkrXL5uf0tCAGR6Y6dQFAwRMi
	SGi4iTHfa6nPy+U7QHZI+2L1qoL+fW9ckrqQr
X-Gm-Gg: ASbGncuF+l7zsR6E1jLtVPDxtPJl8Drq/RPoIO4ORiOZO26lHxCn2OqJf1rMaWSns1w
	wCHE9MARKH8dhA5Vzb6JsjVSY6PJLGRVQVe2a3ekohwxPAU6YEYrLZLFjR/kCsq2HfrrlNi4w9Q
	ozMfRarjbVT+JWucDejP6XpM1C56MBX7j4FA==
X-Google-Smtp-Source: AGHT+IGWYRqljBTNqRjcHJ1Qx5MgLEMU3w+EcX3w2i25x1ph1+e4wdYuKsPwq6FXpfXezjeuLLMkh2UEwUEoxLdnS0I=
X-Received: by 2002:a05:6102:41ab:b0:4e6:1a8c:13dd with SMTP id
 ada2fe7eead31-4e701bcd515mr59445137.7.1748648802024; Fri, 30 May 2025
 16:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch> <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
In-Reply-To: <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 May 2025 17:46:30 -0600
X-Gm-Features: AX0GCFsAv-uR3T4qW04ZGESiTbXNp1RMaFKH2XrMAyyDm-M83KQe_2yzaPmKFXE
Message-ID: <CADvTj4posNXP4FCXPqABtP0cMD1dPUH+hXcRQnetZ65ReKjOKQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
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
X-CRM114-CacheID: sfid-20250530_164643_564275_5ABE2C0D 
X-CRM114-Status: GOOD (  26.85  )
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

On Tue, May 27, 2025 at 2:02=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, May 27, 2025 at 01:21:21PM -0600, James Hilliard wrote:
> > On Tue, May 27, 2025 at 1:14=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > On Tue, May 27, 2025 at 11:55:54AM -0600, James Hilliard wrote:
> > > > Some devices like the Allwinner H616 need the ability to select a p=
hy
> > > > in cases where multiple PHY's may be present in a device tree due t=
o
> > > > needing the ability to support multiple SoC variants with runtime
> > > > PHY selection.
> > >
> > > I'm not convinced about this yet. As far as i see, it is different
> > > variants of the H616. They should have different compatibles, since
> > > they are not actually compatible, and you should have different DT
> > > descriptions. So you don't need runtime PHY selection.
> >
> > Different compatibles for what specifically? I mean the PHY compatibles
> > are just the generic "ethernet-phy-ieee802.3-c22" compatibles.
>
> You at least have a different MTD devices, exporting different
> clocks/PWM/Reset controllers. That should have different compatibles,
> since they are not compatible. You then need phandles to these
> different clocks/PWM/Reset controllers, and for one of the PHYs you
> need a phandle to the I2C bus, so the PHY driver can do the
> initialisation. So i think in the end you know what PHY you have on
> the board, so there is no need to do runtime detection.

Hmm, thinking about this again, maybe it makes sense to just
do the runtime detection in the MFD driver entirely, as it turns
out the AC300 initialization sequence is largely a subset of the
AC200 initialization sequence(AC300 would just not need any
i2c part of the initialization sequence). So if we use the same
MFD driver which internally does autodetection then we can
avoid the need for selecting separate PHY's entirely. This at
least is largely how the vendor BSP driver works at the moment.

Would this approach make sense?

> What you might want however is to validate the MTD device compatible
> against the fuse and return -ENODEV if the compatible is wrong for the
> fuse.
>
>         Andrew

