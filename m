Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CA5CA5FC3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwx6m2ZQp1le7cNOkqQqNCbD12qIRwdpYKQvV6oZXDs=; b=pLvSbTk7sjDYdXeMW5tfr4cMzQ
	QXtx3kYl5zZBahoLsiAC/g+KHTUMtVPnTwxLHfUqQH76Bqu+w3fEJuBoCcnwD9izB8p/HKKvamWN1
	1UTRjaz/ERMpapzMzmcVj6h2Tqjn4LEzNU+qhayN3IzNLHwQM90ZArA+mHm9NHHHWh3gQ5WKS1CZC
	ts6IAClMEnWmskYBWiDIU7dCBJnxEkmkWVKebUgCnQu4LHOkM0UVNma6Gu+/dn/TS45+0+QF1n6Yi
	QvbE+vhVax13siXvY+ANAqEKUfXhSBxJoegadzj9n5QUfP0mAx8caCRgSUcmr1dfhS5j1qfyDJkY8
	Nuh+O2nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpGX-00000005N89-0LMw;
	Wed, 30 Sep 2026 08:02:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpGV-00000005N7W-0pam
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 08:02:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 509DD6024D;
	Wed, 30 Sep 2026 08:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BE71F000FF;
	Wed, 30 Sep 2026 08:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790755330;
	bh=xwx6m2ZQp1le7cNOkqQqNCbD12qIRwdpYKQvV6oZXDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nC5Bj5aA31/9/ysocwO/rUmDrrKRqi23kp87LQiXzOH0odQmkGCyE/9/QRFHM/K1n
	 KGM1COe7P7iJQ3DgoD5YixNY1MK9eYOedHhA8/Nkop1ayExffo7BVwcjuhXtgedTVm
	 4lIRa1EFEg4VBshglItYIDt6NUDg4BJPS6DdiJuBanNEYw6VxVhZgybXg/yzbKr4D+
	 SlZH17jVuktoua0mlulBOIWWkaBSvD3MZgrdRH90CLTZ8rBFTYqL2kh3tYzO0AJu3n
	 xoDF9yz4bKyk/R18j27r+N0kAP0SgDft/LuG4CuPzxg6ktxte7NHlTRSf9dk/lv4eM
	 pSpxjWXXZYzDA==
Date: Wed, 30 Sep 2026 09:02:04 +0100
From: Will Deacon <will@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: scrub vector and pointer auth state on task death
Message-ID: <arzB_AJIohqhvoiu@willie-the-truck>
References: <20260930063647.1356613-1-brads@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930063647.1356613-1-brads@mainlining.org>
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

On Wed, Sep 30, 2026 at 06:36:47AM +0000, Bradley Morgan wrote:
> When a task dies its SVE, SME and FPSIMD register state, and its
> pointer auth keys, stay in freed slab pages until the allocator hands
> them out again. init_on_free=1 users get this wiped for the whole heap
> but the option is expensive, so it is off in most builds.
> 
> The vector registers are not idle memory: userspace crypto runs
> AES-GCM and Argon2 through SVE, so key material ends up in
> sve_state, sme_state and thread_struct. On task exit and on the
> exec and vector length reallocation paths those buffers are
> dropped with a plain kfree(), and on task death the register file
> copy embedded in thread_struct is not wiped at all. Anything that
> reads the freed slab back (slab bugs, cold boot, a leaked page)
> gets the dead task's keys.
> 
> Scrub it. kfree_sensitive() already exists for this exact job,
> so the freeing sites just switch to it. The register file copy
> and the pointer auth keys embedded in thread_struct cannot go
> through kfree_sensitive(), so arch_release_task_struct() zeroes
> them directly with memzero_explicit().

I don't really find this very compelling, tbh. Presumably this data can
end up all over the place: on the stack, in a vCPU structure, in a GPR
so it really just feels like doing something for the sake of feeling like
we're making the kernel more secure rather than actually adding any
tangible benefits. There are also lots of things you're not covering,
so it's not clear why this is either necessary or sufficient.

What prompted you to do this?

Will

P.S. This ended up in my spam for some reason.

