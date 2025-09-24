Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908E5CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 13:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9Vr9KY4xbvuuPlwdSJb5M89fpFiaZAEVobis/+vA7s=; b=nWfIf5vwcZ+pmywNK3tb6ZhnCa
	kUhqAxAeJpgEJ+ioRCpIc1D3nJiRdwQNRvDDxgNdQb21qCqy257dg48ZRoeaotAMIn862MYdBNVK9
	yEBQzJU29haPmHPFVmWuE7ybEghy2CpQKwjePq9b4zBCJ+3IVeivwo7kw4/SmeejCPWfo2OJEF6gk
	HRWBoqlfpK3PIkHv9fhlNZ23F5XPAQ35CVpBbQ69PkMkcEoXPkFcHYpJcv9MqVZk+IbcXelYiNV3I
	KYmCAYQw/nuaGB+N0fgc90rUgJ4wDHUTlTcAEOje/Z0O3HRyaHpYEfW5TRnzA/gPOTCbdDnEuJnUd
	1No8RChw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Pdf-00000000G4w-0tn7;
	Wed, 24 Sep 2025 13:34:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Pdc-00000000G4F-0ith
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 13:34:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D6DF343BB1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 13:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF6CC19421
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 13:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758720867;
	bh=3Z6XTJa/2I09pYSflW4MDbMqly8jjfPgHvxuTYEtOvk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tK4g8xF3KJeMYnB9VZ4gO8VRMtQvT117WCk3DHhVlEegaKquqejM1Ot5xjEhSSEOK
	 43WmDcGlPeFBVd6oCpGsmL+8tu5/12oZs4cT3CBOvCTcpV/9ieFFCe0OnqgT5j3e+E
	 kamp4muCI1+ku/3UZUUk43jADlPfZFB/OGQbWFEL1yIieBn5z+BjOVZvX1yaSW2VRG
	 8hor0XFKZBCNhDYppKwVU3Vmmj4G7OBcqnycvEma7dxeTlVQ9NQ7zdf/KO//cZhphQ
	 zs6/ZVsvHe5w9Ygt933ZX8EDJqUdOzRtNRnuAu0X9OGJH948CqCf7TfTwDLEtb4W2w
	 atUla77I4Zl5A==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso10244073a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 06:34:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1eiHcn751n2/GsZP/5SNd5Hk9QHSzIprabeAPqt1Yn8fL9V0F6FLg+i0BveYK3y+xXTJlztuKieczMzqnXA5l@lists.infradead.org
X-Gm-Message-State: AOJu0YzAsvdR9cxL18hxcQIZ/zJOCyxCtARChyWhoPylBOvFqRHMFEzN
	tbznuRMmU+bwIrKbS+HlWsTOUkB/qpwOqnTBAKWvGayVw0RTEW8+ZcL4bzjBjRno3gBEuXnUyCL
	Kj+m4uvAXxEAl9cwkUKUHR640aDPypA==
X-Google-Smtp-Source: AGHT+IE6gNa61RcE9DKf2iXVRg4jwELeBK0rbWB2RUsPPFiJAgwlJN43oTxNrNqM4YRqC7tDc6X2gwE56i96k2A7jt0=
X-Received: by 2002:a05:6402:a00e:b0:62f:b6bd:eff7 with SMTP id
 4fb4d7f45d1cf-63467813addmr5004269a12.38.1758720866242; Wed, 24 Sep 2025
 06:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250917074812.4042797-1-kevin.tung.openbmc@gmail.com>
 <9bb9929a-8130-48da-983e-2901a7c3da36@lunn.ch> <CABh9gBew1=hbJvg1Mhg5dE7Lr_Z442_kbBX6zTs_6_C2NRyLbw@mail.gmail.com>
 <7e6f568da28d7a63738b6ed22b33db3df4c478c9.camel@codeconstruct.com.au> <CABh9gBcoWbXurPo0f9U9+gz8k6gttUvj=NMMDVfgjo5dgaTLSA@mail.gmail.com>
In-Reply-To: <CABh9gBcoWbXurPo0f9U9+gz8k6gttUvj=NMMDVfgjo5dgaTLSA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 24 Sep 2025 08:34:15 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+zBK1CBJX0XcaqaYeOPUhoRE-nMeYvkTNwQovJ+dakGg@mail.gmail.com>
X-Gm-Features: AS18NWBRbwk465MJYJkBc3f6vXfBHLpagMAmj_NyZMMJpbB87hfWSByQAiUtoWU
Message-ID: <CAL_Jsq+zBK1CBJX0XcaqaYeOPUhoRE-nMeYvkTNwQovJ+dakGg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Andrew Lunn <andrew@lunn.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_063428_258037_66EFDEB5 
X-CRM114-Status: GOOD (  23.92  )
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

On Wed, Sep 24, 2025 at 8:05=E2=80=AFAM Kevin Tung <kevin.tung.openbmc@gmai=
l.com> wrote:
>
> On Mon, Sep 22, 2025 at 10:47=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >
> > On Thu, 2025-09-18 at 10:21 +0800, Kevin Tung wrote:
> > > On Wed, Sep 17, 2025 at 11:12=E2=80=AFPM Andrew Lunn <andrew@lunn.ch>=
 wrote:
> > > >
> > > > On Wed, Sep 17, 2025 at 03:48:08PM +0800, Kevin Tung wrote:
> > > > > Summary:
> > > > > Add device tree for the Meta (Facebook) Yosemite5 compute node,
> > > > > based on the AST2600 BMC.
> > > > >
> > > > > The Yosemite5 platform provides monitoring of voltages, power,
> > > > > temperatures, and other critical parameters across the motherboar=
d,
> > > > > CXL board, E1.S expansion board, and NIC components. The BMC also
> > > > > logs relevant events and performs appropriate system actions in
> > > > > response to abnormal conditions.
> > > > >
> > > > > Kevin Tung (2):
> > > > >   dt-bindings: arm: aspeed: add Meta Yosemite5 board
> > > > >   ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC
> > > >
> > > > The threading between your patches are broken? How did you send the=
m?
> > > > git send-email? b4 send?
> > >
> > > Yes, the threading is broken. I initially used git send-email, but fo=
r
> > > some reason, only the cover letter was sent. I then sent the remainin=
g
> > > dt-bindings and DTS patches separately as a follow-up.
> >
> > I recommend using b4, it helps blunt some of the sharp edges of git-
> > send-email.
> >
> > https://b4.docs.kernel.org/en/latest/
> >
> > Can you please send v2 of the series so that it's properly threaded,
> > after applying tags you've collected for the involved patches, and
> > checking your work with `make CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook=
-
> > yosemite5.dtb`?
> >
> > Andrew
>
> Sure! I have sent v2 of the series using b4, and the patches are now
> properly threaded.
> I also checked the work with `make CHECK_DTBS=3Dy
> aspeed/aspeed-bmc-facebook- yosemite5.dtb`,
> and the warnings that appear are not related to these patches.

Um, they are related because they are warnings for *your* platform.
You don't care that there are warnings for your platform?

Rob

