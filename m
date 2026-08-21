Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7B6C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crUoEiSV1ZBJjt5qJhBiQEQ8WinJ/cVHhIbWF6yO3R8=; b=xtF30cI99QEfJxyulMAHQGMmc0
	7Tz8QmjvV812UziWtkBOCGkFKHe5MhoUWjfFMpdKq39OVUtc4w4sijRCSb0TsqsR1x4b6yHBhVhmk
	hraUVB3D4kyxtIm9SGAfUQXDDKDFLgXIgxF4r7ST5kXaQ7UM9vMcLAxrV4eCbMR6HddmzbcecNiVz
	iauXCZhWqmSduLMHOfskVp7l3CaO80yDatbtznpRkUcXf9lIzn7pBW4/UT+VoNaYOcEyu5Fobc+wQ
	L9GYWyPlQNwMwRLSjalfE//i3rQyBp4g2bQsl9d/ZTY7JJH0D+btiD4jwY5ME/RL7+jRMJ+JRB7dw
	jBO1NmWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSZ0-0000000DrbQ-2KSe;
	Fri, 21 Aug 2026 16:57:54 +0000
Received: from mta-65-225.siemens.flowmailer.net ([185.136.65.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSYx-0000000DraZ-0ve5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:57:52 +0000
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026082116574660ab2005bc0002079c
        for <linux-arm-kernel@lists.infradead.org>;
        Fri, 21 Aug 2026 18:57:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=crUoEiSV1ZBJjt5qJhBiQEQ8WinJ/cVHhIbWF6yO3R8=;
 b=Gcsxazk1W6MH62y7d/rg7ck92On/fePvDBdOfy8XjN89pu4iVq1gXMdfAioSsoMHd9fHHZ
 YWLDmhoKf4K1Rn+/SSR+0bwFtT/yw3oDnlcEnmHR7847QPJ8267tAqLSmpvmOmkPubvmWASu
 TcyuidFsB6XfBqfSjDrWYBHfRQ6vmusGp7gg+vHPzhkEw+5i/YLw3Tyc104SKvJByME+22M/
 OcMzuL/3B6uv3dhQuw6Nr3/4hwtGrrqnrElxx4W1dJb17Ks9+4WNScPLaaxf7jP8BYLHwncd
 sUdtx6bL0PXUD8i5DpWapE/Yu4AtDTRyOrig+mM2GWpefP1Rc58DlOxQ==;
Message-ID: <e0c53d4ef0765a37aa922af2e39fc3b128550239.camel@siemens.com>
Subject: Re: [PATCH RFC 0/3] genirq: Allow drivers to respect userspace IRQ
 affinities
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn	
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet	 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni	 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Yury Norov
 <yury.norov@gmail.com>, Rasmus Villemoes	 <linux@rasmusvillemoes.dk>,
 Andrew Morton <akpm@linux-foundation.org>,  Sebastian Andrzej Siewior	
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
 Rostedt	 <rostedt@goodmis.org>, Thomas Gleixner <tglx@kernel.org>, Jan
 Kiszka	 <jan.kiszka@siemens.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Date: Fri, 21 Aug 2026 18:57:45 +0200
In-Reply-To: <babe3284-1813-4190-8478-4777a28af13e@lunn.ch>
References: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
	 <f9daddae-a1c3-4823-a4b0-733775e1ad15@lunn.ch>
	 <babe3284-1813-4190-8478-4777a28af13e@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_095751_412288_74B17255 
X-CRM114-Status: GOOD (  17.70  )
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

On Thu, 2026-08-20 at 02:10 +0200, Andrew Lunn wrote:
> The problem with using stmmac as an example is that it is very old. It
> was added to Linux in 2009. I guess most of the SoCs at that time were
> single or dual core. CPU affinity was not something developers thought
> about for that class of SoC.

Agree, stmmac might not be the best example, but this is the "driver
under test" here and it shows a pattern that is implemented in ~35
network drivers as well.

Users of irq_set_affinity_hint() in 7.2, see [1], but there is lot more
that needs a revisit, like irq_set_affinity_and_hint().

>=20
> Over time the number of cores has gone up and stmmac has got faster
> link speeds. But is the architecture correct? Is the driver following
> best practices?

This are exactly the questions that I would like to discuss. Seems we're
getting closer.

>=20
> I would suggest you look at more modern MAC drivers and see how they
> do CPU affinity, etc. Is there anything which can be learned from them
> and implemented in stmmac?

I'm still not sure if there is "the pattern" how modern drivers (btw:
which drivers do you consider "modern"?) implement that.

What I can tell: Most calls to irq_set_affinity_hint() (and friends) are
a real problem on RT enabled systems as they simply overwrite any
userspace settings.

Florian

[1] https://elixir.bootlin.com/linux/v7.2/A/ident/irq_set_affinity_hint

