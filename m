Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47FAC982C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WecrocRMKZU/iNM4UOnRLQSWj3zv3D/TPEXXPniLmn8=; b=2S+aDGV1kDmj7NnSBi7sSWZYZI
	sFr7jl0fEf2Yw7rCEQQDDMl8+6uC7WVhxmni1zvXbEmWXmlPRyxkrfp9vW70AKwA9QtHH1hmD6ygy
	bBQxndX6/85PJ8M0raPL6PGu+4lLSYlgiNendeB9GnsRLuXKXTmt46hqdvL5v/2yJYpp3WmfsbCF2
	C4j2+A4mz6SAqBsqfRBS+yjjYVr0BGJXThdDtNGA6AW4XEqElpkiAhqZbWKF7ThgstlpjWfDdZjz9
	BXy1EPcZm7yIhZxExbAMgR7YxG3RlAp71j0Sd6Qrfq5+CXxfgyUmyO0s8gnOmR3/K7PRd1ftE0CfP
	oiIcdJmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqSQ-0000000Eol7-3RZg;
	Fri, 16 Jan 2026 20:30:10 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqSO-0000000Eokd-272c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:30:09 +0000
Date: Fri, 16 Jan 2026 21:30:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768595404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WecrocRMKZU/iNM4UOnRLQSWj3zv3D/TPEXXPniLmn8=;
	b=lNB4oS6L/T2CJs+x4Ue/QNzT2Im4c+SSYJ2l+IqAVGrg80PZ7qzZbGSBrs9X8hLyq5xj+6
	yBUBK7oJYhkZPerxNaQdhfwkWn3O9pzafpV03w7QUvZrUt9MUMyV/lsZ2HwLNtaxY4/uNW
	C7vPHJ4bMsNKYxt9Ax0sc6/HeKcrDKfb9ZZByZ3H40gNsbNr8yNH7E4GqnWjdaQXSMwfKD
	UOI8yIprFCNnS9mzukOhVJs/ccTK6K6idWlockkHpwurtihcvWcdZwRovXnRa5IMjzSIJY
	26WoMK6GUvruDcn2HCGSL59U00vegz8EnpsRfJXWGvYV4vDsebbm3EKP9V9MMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768595404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WecrocRMKZU/iNM4UOnRLQSWj3zv3D/TPEXXPniLmn8=;
	b=ZAJ/26hUWZYJCgXrahM+b5b5tJPh4hmp+MPndaGil0ynh7KDmT0wDBoUQVRohVpEgokmbM
	WtSNY2361Mo4+HBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Yadi.hu" <yadi.hu@windriver.com>, Bryan Brattlof <bb@ti.com>
Subject: Re: [PATCH v4 1/2] ARM: mm: fault: Enable interrupts before invoking
 __do_user_fault()
Message-ID: <20260116203002.ocPCBG8L@linutronix.de>
References: <20260116170041.1059997-1-bigeasy@linutronix.de>
 <20260116170041.1059997-2-bigeasy@linutronix.de>
 <aWp2fKGfIQKJ8wze@shell.armlinux.org.uk>
 <20260116181201.v-z31XJY@linutronix.de>
 <aWqZDwxUtaE1yP28@shell.armlinux.org.uk>
 <aWqal9WQkYMkSzJl@shell.armlinux.org.uk>
 <aWqbB68tx8pdkN2q@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aWqbB68tx8pdkN2q@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_123008_685283_AB4BF7D3 
X-CRM114-Status: GOOD (  24.34  )
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

On 2026-01-16 20:09:43 [+0000], Russell King (Oracle) wrote:
> > Oh, and, as I've said on netdev recently, I have lots of patches. I
> > don't have time to push all patches all the time. Those that I think
> > are the highest priority get the attention - so if something goes
> > quiet, the patches don't get progressed (because something else has
> > taken over.)
> > 
> > I haven't published these yet to my external git tree because they're
> > currently on top of my raw private "development" branch containing...
> > 
> > $ git lg origin..rmk | wc -l
> > 473
> > 
> > many of those behind those I mentioned above. At some point I need to
> > move them to their own separate branch, or to the "misc" branch after
> > sending them to the mailing list... but the latter means spending time
> > writing a covering message summarising the changes, and the key thing
> > is "time".
> > 
> > I've wasted almost all of today running a bisect for a stmmac issue that
> > takes out my _entire_ network at home. It's wasted because what I
> > thought was a good commit turns out, on re-testing, to have been bad,
> > and right now I have no idea what a good commit is, and whether that
> > even exists before the platform support was merged.
> 
> Sorry for a third reply... yesterday I started at about 10am, finished
> at 2am last night chasing a different stmmac regression.
> 
> Yea, if there was more time, then I could push all the patches I have,
> but I don't, and the above patches were generated back when we were
> discussing the issue last time.

No worries. Is your tree rmk tree public so I could pull those and test?
Do you want me to review any of those?

Sebastian

