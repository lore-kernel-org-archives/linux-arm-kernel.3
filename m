Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF890CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 19:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkW88smFjgLCFmSxj1fkAwEP7mKymD54ZrxB+tKL5CI=; b=uaAiq4JEGMqld7b+i7lEjC5dyM
	E2JF3IYc5m2clGwaUZg18GyOL7AHnGyUE8tiLaDcBRZ+bUxfsIsppskA3R4aDk9ceTymD4fUFTray
	89b5Tti39sac/KJcoJ9CgCCP26K/qbLoOOf7MRIL/FjQiaf+IBozPJO/IFGxiSRYW7onLUfEa+gkd
	gYkxaYQCrmvqBGPf2aekM7gFnB14gD3+fV1jTM3TmVFmOV5VH/fuFsZefAXZiy+nXfEbrTrrfpEcg
	ZS0EARFcsKXga5Bn80B6PT9ZDpixZzyRKxVkS1pLZxXdxOu4S3CpD47FlM/gTSxSw6nK9INABuJfu
	SxJoRlXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upu2W-00000005FTL-0smk;
	Sat, 23 Aug 2025 19:36:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uptzs-00000005FGt-0YMQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 19:33:53 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755977630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NkW88smFjgLCFmSxj1fkAwEP7mKymD54ZrxB+tKL5CI=;
	b=S2jjDfDD2mCdJl8gMu89Tghj5bq/r3HbkNCvcOxQGSoCSngTNKIcH0IXAcw3MUqKjQtn+9
	62PlyqGMqnMl2Dd1zoKLgjf7Plim1mHFbbuaQnoEGz56MLkkd2D6dAavRcj8BYga4wqpM8
	6nE0ENxcOfyHgLOqiRSnKVHFeNgRgN7sorLrXXH5tx7eWPX9eRoER13D3zBeYduHv3GHBU
	NwZU/bypmfNP2u+j62NcLAD/aTbFjQmzCzgrITTW7V26VjQoWlPxUye6zNdQk2b0UzoAXk
	rvPyh4RuhHY3H3ss2DVjSKN+1AMDwKC9VRSOAL+B5Ij8+gvAQeKKoSgHDWXsdA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755977630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NkW88smFjgLCFmSxj1fkAwEP7mKymD54ZrxB+tKL5CI=;
	b=uNn8rL8pXfB/NjR1BcJkCOcm/vXyxiqQI4AHb5QqidW7GOpjMYblXxvTLtwiZLnqnYld99
	17o7HrZ0QNJcM4CQ==
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [ISSUE + PATCH] Interrupts were enabled early by spinlock guard
In-Reply-To: <62be0896-6c90-4a27-81cb-7bd897d0e6f2@grenoble.cnrs.fr>
References: <280dd506-e1fc-4d2e-bdc4-98dd9dca6138@grenoble.cnrs.fr>
 <CAMuHMdWJ3im+k9uQgRhUh52Z_tJ+KQjAGY_Y8FjbEu6gB=0UKw@mail.gmail.com>
 <62be0896-6c90-4a27-81cb-7bd897d0e6f2@grenoble.cnrs.fr>
Date: Sat, 23 Aug 2025 21:33:48 +0200
Message-ID: <877byt4yub.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_123352_308608_A5A702AB 
X-CRM114-Status: GOOD (  11.05  )
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

On Thu, Aug 14 2025 at 17:28, Edgar Bonet wrote:
>> I think the conversions in
>> drivers/irqchip/irq-atmel-aic.c:aic_irq_domain_xlate() and
>> drivers/irqchip/irq-loongson-liointc.c:liointc_set_type()
>> are also wrong, and need a similar change.

> The one in irq-atmel-aic.c looks indeed strikingly similar.

Yes. My bad.

I missed the fact, that this can be invoked during early boot when
interrupts are still disabled. After early boot they are always enabled
when xlate() is invoked.

> The one in irq-loongson-liointc.c is slightly different
> though. Instead of:
>
>     irq_gc_lock_irqsave() -> guard(raw_spinlock_irq)
>
> it does:
>
>     irq_gc_lock_irqsave() -> guard(raw_spinlock)
>
> I don't know what the implications are though.

That's in the set_type() callback which is always invoked with the
interrupt decriptor lock held and interrupts disabled, so doing the
'save/restore' dance there is pointless.

Can you send a patch for that atmel-aic thing too please?

Thanks,

        tglx

