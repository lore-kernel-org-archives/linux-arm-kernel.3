Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5623C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAUIv3QVPUxeZj+2jjQt2DSdbC2rNzRDTLXd8pgK7IU=; b=rYWyi7DWEgCJ460XKj5IyHZFwe
	Ht/cpVwt2xPTW/oGoLq4B+cgkZtX5XHYYl/DtUUDKwBuJoYwbOSJPLrtfDTi2SGSGzVGmHXTYgAuw
	/I6qdjTgVmR/JuzBLlKcWzz8WDyUizsDc3l/M0eBEvo/GvYoNGQDchROev8eijZrWvqpl5qavbEk/
	a+TObdnRrvZWAwO8YhPNP9beuNSnkbOFPOvU19gKBrBPOWpL+X0EEgOPL5c2zd2VPK4t7aAoIiaOj
	dJoLuPhwF6+QwxqUdt/52W7iyNRNcT9rNkMeIETeubxisHrq2O2n0kNdbo1uWengiFb5zRLJB6e3A
	9B1GaeAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSPB-0000000Dqc4-2ZBp;
	Fri, 21 Aug 2026 16:47:45 +0000
Received: from mta-65-227.siemens.flowmailer.net ([185.136.65.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSP8-0000000DqbL-0gVL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:47:44 +0000
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260821164737602604db9200020717
        for <linux-arm-kernel@lists.infradead.org>;
        Fri, 21 Aug 2026 18:47:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=yAUIv3QVPUxeZj+2jjQt2DSdbC2rNzRDTLXd8pgK7IU=;
 b=TBwnOHPPmjRt/JJJmjAiFj3ThMLkDziWdpLctnwdO+1UQAOFwoxw3/tkqalYvIdHHJQ8AT
 aVz42iTgxiI3vccu4INGZGXK2lFvmYyB0RLzrmaiPlm6h6uHrjBmi6NPuO50z/w4gYMBYa3n
 q4N8k1dHw7zStWfaztBAoDzvbYBLUcSGHDv50xi0rhJrkAadwWhGoX72zFrh8c6U6VKc3kur
 rKCiJupR9LV9FBoqDeJk0+E9s2oHpHNGrRy7uMg+N5VIIo81OrGibQOke/9d3R6X2l0jgnu1
 dszOSZsmJJFhQ3VrrIRrtpcf8/kNstKWOHRbSrwuR0vIAtlc8Vjpp8XQ==;
Message-ID: <f452f083e6597a145ae24f80f1db7f2315bab6c2.camel@siemens.com>
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
Date: Fri, 21 Aug 2026 18:47:36 +0200
In-Reply-To: <f9daddae-a1c3-4823-a4b0-733775e1ad15@lunn.ch>
References: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
	 <f9daddae-a1c3-4823-a4b0-733775e1ad15@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_094742_697961_3B5D8D92 
X-CRM114-Status: GOOD (  18.39  )
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

Hi Andrew,

On Thu, 2026-08-20 at 01:54 +0200, Andrew Lunn wrote:
> > That raises the question why request_irq() is called on "link up" time,
> > while the low level vector allocation takes place during device probing=
.
>=20
> If the interface is admin down, the hardware should not be generating
> any interrupts. So there is no need to request them.
>=20
> > At least that seems to be the common pattern. Can someone tell me why
> > this is done this way? Shouldn't we call request_irq() at the same time=
?
>=20
> If you want to change anything, move the low level vector allocation
> into open(). But you need to be careful of EPROBE_DEFER. If the
> interrupt controller has not loaded yet, i _guess_ the low level
> vector allocation will return EPROBE_DEFER, and the MAC driver will
> try to probe again later. If you get EPROBE_DEFER in open(), there is
> nothing you can do about it.
>=20
> 	Andrew

Moving (=3Ddelaying) the vector allocation into open() would not help
here. The /proc/irq/<n> interface is populated on request_irq(),
normally done inside open() as well. Up to this point userspace is not
able to set any affinities.

This is one of the shortcomings mentioned in the cover letter. Once
/proc/irq/<n> appears, it might already be too late for a proper
affinity setting, the IRQ might have fired already. In addition there is
no notification mechanism that informs userspace about newly requested
IRQs.

It's more of the opposite that might help: Moving request_irq() into the
probe() phase. I'm wondering why the pattern is
    vector alloc =3D> probe()
    request irq =3D> open()

Seems that we would not "waste" too much resources when we move
request_irq() calls into probe() as well. But as always: I might miss
something.

Florian

