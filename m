Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D22CFD356
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 20:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DG8aNFGVcFB4CATalGn7NOhxZ0DeO8/oe9bHCpl8sw=; b=KWxnVoBT6ItuVGvc9Z/CNei/4I
	5NlL+fKakUwgXFyus1UzM774ihqq+sPYnjQ4OoXAe+PSDpmDE243faFgFBhGYklPFIH5L5BZBp9Yd
	A6+x/6ucvsuWKTRj3WAGwBrvdEVKjsLbuwJISyfe1wJeGUENij9rd4NQiSknv9ceVG+MyNmkGT8Qu
	xuVSKsWBXdKV518eseJnJY2Xrf6TclNMOkKNx2pyhLA7hZogcEkZLlFAB8l3/JcKF2mHQWeSZIx6/
	f+ZA4FQ+44woQTD4Zkbvqv4RgSy7zbKZXJmCQWWHIp8myLw9i95zIN+A79rtBC3rp0s01tpnZzuXi
	tRiCei1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNdXV-0000000CJ9j-1h9A;
	Mon, 24 Nov 2025 20:52:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNdXT-0000000CJ9E-1C8n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 20:52:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F18A44325;
	Mon, 24 Nov 2025 20:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E166C16AAE;
	Mon, 24 Nov 2025 20:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764017518;
	bh=V+Uwt+ZdbJkBrqBbLMY3BQCOogr0mkRy+ckU06EArFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L02WjnJWfVbhAXiT/h0NFN+hEBPiubc2NS6O7J/ZHxdyXcS1jbjrfE+8/mkySFlWC
	 +J1GyjhG4rnXHRJxtVcP+E+x5wH1wFw8JjpWj3CSwJnbww2zMaQrJth8PvqiFzyThv
	 mte/qHteRbAC1XoXRdGk8DO/Vbx9zkUXEsOhNnqis4YOMsreRPRDuQLYZNomi0PS2d
	 pvfgsmGDp43gT75M70iuE9R66srWy+7U2YGbiZFaY4pTZGvzflx+q2Tz+aOTxVHKJ3
	 13ZIb762wmHtP/QjIE/AY5p6Bq+j8B4q5pcIstUC6Szso82GawAH0AENekc5Ozk3wP
	 axLDfP4QuBp+A==
Date: Mon, 24 Nov 2025 12:51:58 -0800
From: Kees Cook <kees@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
Message-ID: <202511241250.EB2ADED@keescook>
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com>
 <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
 <aSRtaVjfNc11EtKg@willie-the-truck>
 <B696956E-579E-412E-B774-AAADCFA4B31C@kernel.org>
 <ecc11ec7-ba00-41f1-8a2a-8f3a83c9ffd9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecc11ec7-ba00-41f1-8a2a-8f3a83c9ffd9@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_125159_486320_493DFA9A 
X-CRM114-Status: GOOD (  28.04  )
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

On Mon, Nov 24, 2025 at 05:50:14PM +0000, Ryan Roberts wrote:
> On 24/11/2025 17:11, Kees Cook wrote:
> > 
> > 
> > On November 24, 2025 6:36:25 AM PST, Will Deacon <will@kernel.org> wrote:
> >> On Mon, Nov 17, 2025 at 11:31:22AM +0000, Ryan Roberts wrote:
> >>> On 17/11/2025 11:30, Ryan Roberts wrote:
> >>>> Could this give us a middle ground between strong-crng and
> >>>> weak-timestamp-counter? Perhaps the main issue is that we need to store the
> >>>> secret key for a long period?
> >>>>
> >>>>
> >>>> Anyway, I plan to work up a series with the bugfixes and performance
> >>>> improvements. I'll add the siphash approach as an experimental addition and get
> >>>> some more detailed numbers for all the options. But wanted to raise it all here
> >>>> first to get any early feedback.
> >>
> >> FWIW, I share Mark's concerns about using a counter for this. Given that
> >> the feature currently appears to be both slow _and_ broken I'd vote for
> >> either removing it or switching over to per-thread offsets as a first
> >> step.
> > 
> > That it has potential weaknesses doesn't mean it should be entirely removed.
> > 
> >> We already have a per-task stack canary with
> >> CONFIG_STACKPROTECTOR_PER_TASK so I don't understand the reluctance to
> >> do something similar here.
> > 
> > That's not a reasonable comparison: the stack canary cannot change arbitrarily for a task or it would immediately crash on a function return. :)
> > 
> >> Speeding up the crypto feels like something that could happen separately.
> > 
> > Sure. But let's see what Ryan's patches look like. The suggested changes sound good to me.
> 
> Just to say I haven't forgotten about this; I ended up having to switch to
> something more urgent. Hoping to get back to it later this week. I don't think
> this is an urgent issue, so hopefully folks are ok waiting.
> 
> I propose to post whatever I end up with then we can all disscuss from there.
> But the rough shape so far:
> 
> Fixes:
>  - Remove choose_random_kstack_offset()
>  - arch passes random into add_random_kstack_offset() (fixes migration bypass)
>  - Move add_random_kstack_offset() to el0_svc()/el0_svc_compat() (before
>    enabling interrupts) to fix non-preemption requirement (arm64)

I thought we'd keep choose_random_kstack_offset() and just move
everything into a per-task location? (And for arm64 only)

-- 
Kees Cook

