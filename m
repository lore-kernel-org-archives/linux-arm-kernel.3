Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134B5C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/u5s5OuQhIBUlqrUXPdgVLlkfUa89jzaMlGj4CmrZY=; b=wCIN4nzJl79fRkeNKbz2Wvx7oR
	uOpSGW+N4noMffKT4wwbQCV6NmQCyvd/6u8zxVjzeFmS0lZTdQiF5qQAOtBojgUAKvOUD8Yof6o3l
	mMauE7UnxEC8DmYqLIb+4thdbLIUizIkRpgaishet13Dt1XIqU5ZJS5XUmCibmmG+EA8NWsCUwnsZ
	+pRIgMb9MWa2ZFdO6wh7his2NUQDpeY+3oPZHadXEIaousJILOEPasGriitxKgV/9ujKmo0nYDD/c
	lMyjulDUK15ZmzC83GaFyOt0O5CjxZNoWd3bzD6I4PHuyf9KBqbF7bZw6v8ygDyWfqMWmDf6n0z9H
	rrbimu6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWmU-0000000GwgH-1enb;
	Mon, 24 Aug 2026 15:40:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWmT-0000000Gwff-01vn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:40:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 48B436011F;
	Mon, 24 Aug 2026 15:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45ACC1F00A3A;
	Mon, 24 Aug 2026 15:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787586012;
	bh=O/u5s5OuQhIBUlqrUXPdgVLlkfUa89jzaMlGj4CmrZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nWTQCYa2bxv1ReeIcPunOoESikWYry0jyZxz+angYjGcFMWzvUd9n0JyzdkeMp0mt
	 p/4uzWWa4hbHLWVf7QU8x8j44zji60PoEPyXe3mIuLUXImBaT7tzaWdYepVrIkt3O6
	 6KOhoNEFqXDbuzdppB2c68QQbfEv+67FEKUCBsbPMQ78/fOIgNTIzqIoOD6NrxX95u
	 ZpqtyKs2Z7oJqWDw/ONvTIPdZppe8ykQUX3bJqKki4mprZT1zsjzydamuj/suV4bv9
	 pCuOk/cbUvD7XLuOTV/4kMnp6RYknDi4jLipvLwZC4mbwIBVqjk450Om5ZICPGt+0I
	 9fmZNyv0Z2yTA==
Date: Mon, 24 Aug 2026 16:40:06 +0100
From: Will Deacon <will@kernel.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Bradley Morgan <include@grrlz.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maz@kernel.org, james.morse@arm.com
Subject: Re: [PATCH] arm64: hibernate: pass HVC_SET_VECTORS args to the
 resume hvc
Message-ID: <aoxl1ri43eEAsxlR@willie-the-truck>
References: <20260809213615.11646-1-include@grrlz.net>
 <anr28wUlKjci8JPn@willie-the-truck>
 <463DA5C2-C933-45EC-A200-21AAF6258418@grrlz.net>
 <anszjQ7jBeYDqesp@willie-the-truck>
 <7ca33f92-2ded-4749-ab67-2fb564919b99@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ca33f92-2ded-4749-ab67-2fb564919b99@arm.com>
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

Hi Vladimir,

On Mon, Aug 17, 2026 at 02:06:20PM +0100, Vladimir Murzin wrote:
> On 8/11/26 15:37, Will Deacon wrote:
> > I think I probably need to spend some time understanding how all this is
> > supposed to work. I can't currently tell how we end up with the stub
> > vectors installed to start with nor why we can't do all this from C code.

I finally got back to this...

> Here is my understanding of how things work. Assuming nVHE mode, we
> restore the previously saved image X from the currently running kernel Y.
> I’ll use the suffixes _X and _Y for addresses belonging to the respective
> images.

Nice, thanks for the walkthrough!

> On the resume path, KVM teardown sets VBAR_EL2 to __hyp_stub_vectors_Y.
> 
> swsusp_arch_resume() then temporarily (re)sets VBAR_EL2 to trans_pgd_stub_vectors
> while transitioning to image X:
> 
> |        if (el2_reset_needed())
> |                __hyp_set_vectors(el2_vectors);
> 
> 
> Currently, swsusp_arch_suspend_exit() attempts to restore VBAR_EL2 to
> __hyp_stub_vectors_X:
> 
> 
> |       cbz     x24, 3f         /* Do we need to re-initialise EL2? */
> |       hvc     #0
> 
> where x24 is resume_hdr.__hyp_stub_vectors (in other words snapshot of
> __hyp_stub_vectors from image X)
> 
> However, that request is ignored, so VBAR_EL2 remains pointing to
> trans_pgd_stub_vectors
> 
> We re-enter the kernel X.
> 
> During KVM initialisation, we call __hyp_reset_vectors(). This is
> handled by trans_pgd_stub_vectors, but ignored since HVC_RESET_VECTORS
> is not recognised. We then call __hyp_set_vectors(), which is also
> handled by trans_pgd_stub_vectors, but this time VBAR_EL2 get set to
> __kvm_hyp_init_X.
> 
> From that point on, __kvm_hyp_init_X handles subsequent HVC calls,
> including the later call that redirects VBAR_EL2 to
> __kvm_hyp_host_vector_X during KVM setup.
> 
> The memory containing trans_pgd_stub_vectors is freed later by
> swsusp_free(). That perhaps explains why we do not see any crash.

I was trying to figure out if we end up initialising VBAR_EL2 before we
"return" from swsusp_arch_suspend() and free the reserved pages.
However, it looks like we run _cpu_resume() instead of cpu_resume() so
I still can't tell why this hasn't exploded. AFAICT, the active hyp
vectors will have been freed (and possibly poisoned) long before KVM
initialises.

Speaking off-list to Mark R, he pointed me at some old rework he had for
all of this:

https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/suspend/cleanup

one of the patches there is very similar (identical?) to this one, but
his series gets us to a point where we _do_ resume at cpu_resume() and,
tbh, the whole thing ends up making a lot more sense.

If somebody could dust off that two-year old (!) stack, that would be
great.

Will

