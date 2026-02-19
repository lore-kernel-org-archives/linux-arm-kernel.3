Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC75C531E5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 22:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rG7l1d8wcnIU2PDqonrIOzyrgRE6wVd+m8ziks3L0Y=; b=V6HJ6wX8Uw534MixrzYthmftIG
	lZKZpXcHBE1C+DXGcJ1uPQxewQp9jjEx3Te5SoH2ZHVzEM8D8sYfe8TJyNY3Hoi6IJSLA+opEj79p
	8uWs17ciJr59HgTPF7ncbU9NHggIrGLJ04OgLUyMJNs0h0pvBMcGp7bs6SNPpLITlDB2zbdfh0zHE
	8tLRUqyksJIljP5apnfpNOIIlh7Z9Ax59NRKno3jDpv5bX5s90chCNbgNCz8NKv2rhJBOriPYY6sB
	+5zOs21fsl8eVoEDKc2zMCNRYMk/4XF94gXh320Cq/Yo/JmW5Vx3Pts4shzx7Yjr2ZRYAPRhZZuHv
	VUlLXsxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCOQ-0000000C8ka-2aiE;
	Thu, 19 Feb 2026 22:21:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCOJ-0000000C8jg-1Zvc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 22:21:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA5C34487A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 22:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3ACFC2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 22:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771539649;
	bh=7rG7l1d8wcnIU2PDqonrIOzyrgRE6wVd+m8ziks3L0Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p0OytsKo9aM3h0I2mAzXD0d9QBuPUjESQz2hN5IxlVe0oyTYccDGkSw89sv2wisHV
	 LtGXf/QYGh4XSeU8rPaMVFxD30tEN9H0y4JNf5E0PvIZRrT6UaUDXVj1nKKEkjcJXu
	 eoG+W8TE5QTZYptGQGOebU4xNLBAkc3YRvSEM4D+nnyk5RzwO+ehrVkeo57n9OiZhg
	 py+cd87+XtH+nbefwlGzpKL9fu2CcMbfHbzlPRqaRaBjs+4fLC1aimeQ9LpNOxkimh
	 wANgYekA1SvSogHc29vGGf/TYzkBcZ2ePCYTj9sQe0/OHqGjNNXhRHaZBvkhgK57eK
	 qFAln6ISZU1Vw==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-797d857e3f4so14861267b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 14:20:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRMa5CKG7DjEtAUBRfdd1cKCruRvYadX36fDOcmNgC6FlllrmnapcnGwjMOo1j+ke8OjH+crsxzWVSC6FPTEH3@lists.infradead.org
X-Gm-Message-State: AOJu0YzLm4Q2BwC/aUaiGv747oiDlXKMyVz59XddEP3v6EiQUXt/+4c+
	bEP7cnPBNskH3jDsc8I4ZYWzT8ti/wVga7aGkwql3AgORnF+0MHNptQLCJ0FXoCWkAfvV8mSZqj
	XBDQzIGgtWkBqgzNX266Rx+7pJ9BE7ug=
X-Received: by 2002:a05:690c:4913:b0:797:a162:f7d7 with SMTP id
 00721157ae682-797ac668393mr155417627b3.62.1771539648217; Thu, 19 Feb 2026
 14:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20260218083618.67805-1-christophe.roullier@foss.st.com>
 <20260218083618.67805-3-christophe.roullier@foss.st.com> <aZV-b6TdLMdI8dm4@shell.armlinux.org.uk>
 <CAD++jLnF=8MvW4CbXmPZR=w8tAUZiL9M3N73WB++DaYYwhToDQ@mail.gmail.com> <aZdjke4eOwF-wTZO@shell.armlinux.org.uk>
In-Reply-To: <aZdjke4eOwF-wTZO@shell.armlinux.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 23:20:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLmkGtsr9jdzSeyRbHeh_abgz1osn2czEcBOzJ1n1JSh_A@mail.gmail.com>
X-Gm-Features: AaiRm510EWGZUrBhAzIL44W1hn8wAZ_A5KLa10hcXdNoXBhGJk2lSRSIAxMNPUY
Message-ID: <CAD++jLmkGtsr9jdzSeyRbHeh_abgz1osn2czEcBOzJ1n1JSh_A@mail.gmail.com>
Subject: Re: [PATCH 2/3] net: stmmac: restore pinctrl when driver remove.
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_142101_937029_892C71B8 
X-CRM114-Status: GOOD (  25.55  )
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

On Thu, Feb 19, 2026 at 8:25=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Thu, Feb 19, 2026 at 08:11:13PM +0100, Linus Walleij wrote:

> > There is really no other cleanup that can happen: there is no
> > before-default-or-init state we can revert to (that would be the
> > power-on values), so there are just these states in some pointers
> > that could be accessed by e.g. pinctrl_pm_select_sleep_state()
> > that get free:ed up, and muxing and pin config that happened
> > in the pin control hardware just stays around.
>
> What we seem to end up with is that on probe failure, we set the pins
> to init or default state.

Indeed.

> However, on remove, it's up to the driver to
> decide whether to put the pins into sleep state or not.
>
> Shouldn't a driver be consistent, and place the pins into the same
> state in both these scenarios?

I think you're right. Just very few device trees define the "sleep"
state (the infamous "so far so good...") so it has not been adressed.

> Conversely, I'm slightly worried that putting pins into sleep state
> when we're not powering down may be bad if they're allowed to then
> float, which could cause the PHY to interfere on the network.

That's a good point.

It's perfectly legal to define any random state for the driver, such
as "relaxed" or "unused". It had the only downside that the device
driver core will not help out in looking up the state by default.

I'd be happy to take a patch that e.g. looks for an "unused"
state and put the pins into that state if probe fails, or when
remove() is called, so we get something everyone can use for
this.

Yours,
Linus Walleij

