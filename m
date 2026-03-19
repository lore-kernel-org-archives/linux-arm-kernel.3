Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB2A1075286
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 09:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZ6bL3r3qm44FVnTpR0DPP21t1REZeZKy0LnlzbnMK4=; b=LFOCUdKy2T9rrTQ1zOKttVH6q7
	6ssURj84uJFDOVTzNoWWTULVU2uH6gOitTFbokzoHf6Im/aNuePyYsJe4dvTs2q3HbBUs+PDi8huI
	l0ITQB2tl1bRUjeDWEKec7L/BE0AdHe8RgtEUdeqyoCWb4BmJtKhmfs8Cagm1rSAarxJAJBP4U774
	W8RXqAH/hhL1jEGNxSAfQPjC2ArISEYipDFdsruXM6cdPXD8J3kkFwPJbgL0Pk7uOGNuNfwArFAkj
	4M62azuoOoyjsHcjb3Rp+AAK8wTxDTOAjoikXZiR9HC6/t6vfmSYl8pJpdu1VOWECNlRlV/KOge5v
	oOr0+Agw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39uo-0000000ALmk-2enW;
	Thu, 19 Mar 2026 09:43:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39ul-0000000ALmK-3WZk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 09:43:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B979A44273
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 09:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AE0C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 09:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773913417;
	bh=bMgGHUQEJT68rcKmPKkkz+YA7h0UjcbeuxER+65CECs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CJpkT6AMgLyEDWog2VuhaeuWut4qbpNvN8wETDsXnnb1T8tX3tRRI5W0KMzj5+V+A
	 NfVS7DTuGsd1bEYQjb/u3/mUuMnGn+Xvf6xdH12GPejjt7ef1SS3IsTShlP3DhJzM3
	 L5Y8uzD98RWY7dMMKwqTKusE2HOKkzroYrjw2Ro5jyjbx14bOYBgE1vMFsXsDZ8WHS
	 dh8yG2jXnVlBWJhEzSkKw2rPB76FZQH4H6+olyhWF3lcbGLi0snE2YeKOyPM6uSUOo
	 kBOe/2LOS+MO6y4F0LokKadUMI1tYNh/Lq3y4CzDQu5EV/BmKxamj22l+U7/gjNwhc
	 xxESAUopnwpsw==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79a3e2e64f4so5767577b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 02:43:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFL4G3S8Il+XcJniReKa69U7XUhWfxzS34uT4zMfk9wCmPvaWYrz5gg5i7aMCWZR+Z4l+laIWpWtfJ4HvYv0+a@lists.infradead.org
X-Gm-Message-State: AOJu0YwqiwmU4i5rhTo12Y8eQQwk7iCSpwTD09WY9xmLxp4exka27Vxh
	+BZ31nViay6piEu328b9SDJDdX09uGzDHhzlSkK3g6xkGGUITFHKG0+r6aTIi7uPzVcDgT823EG
	xSzMfq15o6jjwNdr40F965sIuLmDKmEY=
X-Received: by 2002:a05:690c:5c0f:b0:799:266:83e0 with SMTP id
 00721157ae682-79a71ad3746mr55108737b3.34.1773913416961; Thu, 19 Mar 2026
 02:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com> <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
 <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
 <abStv0IPLfkKMD-W@shell.armlinux.org.uk> <CAD++jL=Av5K7Ag95LYou4TMKGR59TmtiQpxcnpcj+4tZFtzRug@mail.gmail.com>
 <ablS_C8oEQFeSU1Q@shell.armlinux.org.uk>
In-Reply-To: <ablS_C8oEQFeSU1Q@shell.armlinux.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 10:43:25 +0100
X-Gmail-Original-Message-ID: <CAD++jLm5_mfx1572Cg+NPhuLoPu6DKDfOwK5XxRc4R_8M7kbYw@mail.gmail.com>
X-Gm-Features: AaiRm51a7-23Ps_LNUqYLhXePq1YU-pfVicusBYk32Lem3Dq79jrtE3Jr1i48f8
Message-ID: <CAD++jLm5_mfx1572Cg+NPhuLoPu6DKDfOwK5XxRc4R_8M7kbYw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] net: stmmac: fix pinctrl management during suspend/resume
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	antonio.borneo@foss.st.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_024339_917079_C3ED1913 
X-CRM114-Status: GOOD (  29.06  )
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

On Tue, Mar 17, 2026 at 2:11=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Tue, Mar 17, 2026 at 01:13:14AM +0100, Linus Walleij wrote:

> > Aha I understand.
>
> I'm not so sure.

OK let's hash it out.

> I'm trying to get an answer on this, because the original patch
> description here says:
>
> | In the deepest low-power modes, the pinctrl configuration is
> | lost and is never restored if the interface is down.
>
> stmmac uses the "default" pinctrl state at probe time. This commit
> says that is lost over suspend/resume - which to me sounds like
> a pinctrl driver bug, because on resume, the pinctrl driver is not
> ensuring that the pinctrl state is restored to whatever it was when
> the suspend happened (whether the driver explicitly changed it or
> not.)
>
> To put it another way...
>
> On entry to probe for a non-pinctrl driver, if DT describes a default
> pinctrl state, that state will be selected by core code.
>
> On suspend, the driver is free to select another state if it so wishes,
> or do nothing (e.g. it's unaware of pinctrl.)
>
> On resume, the pinctrl layer, what is expected to happen. Surely, it
> is reasonable for a pinctrl unaware driver, or at least a driver which
> has _not_ changed the pinctrl state to expect that the default pinctrl
> state is still in effect when its resume function is called - and if
> that is not the case, then there's a bug here.
>
> Another way to put it...
>
> We shouldn't be expecting device drivers to have to mess with pinctrl
> e.g. switching to a sleep state and then back to a default state just
> to have pinctrl settings restored to a functional state on resume.

OK I see your point, the pinctrl hardware state should not change
behind the back of the driver, and if it does, and that is worked
around by these calls to restore the state using the pinctrl PM
helpers become a messy quirk.

- Selecting those states to reconfigure pins into special modes
  during sleep is OK.

- Selecting those states to restore the hardware state inside the
  pin controller itself is NOT OK.

If this is done for the latter reason, you're right of course, there is
a bug in the pin controller. Certainly it is expected to maintain its
own state over a suspend/resume cycle.

Yours,
Linus Walleij

