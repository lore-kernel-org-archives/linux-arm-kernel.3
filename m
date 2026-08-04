Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6910EC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msMgqHZX3Cpzlz49ZY5uD/h6mDTlWrDvHYB6tj0rLc8=; b=HkjlFejXS0p6maSEyAuizhFtws
	T/RYkuShDbi45k0dGo4raNa9rfoqYEI9F1tB6c2gcfrkND/6ILcvIo/USN+bVnQMOBbDnj3tiQ66k
	KwHicUrzkA5P4ZQuep8KjIiXCzHAHRq4RZTqlJ1OllXd/plLG2y95qCwSJSt2cERpIjUik49LGUDq
	IbmYgGZDOEI8yyPPq4trWJ6UcRWst2eoV7S+2+IAf2NQa5DAPjXAjiiVUdOy06dQZPk6khIV0eWoi
	OuXbhiPVCSqzYU3ULrSl5iW+4UZYg/DrkYxTj3m8se+lvB9tKAMKiTlaUxzPEL9xkQcuhBDXSXm0X
	GIE4cbog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGZ6-000000028uZ-2u4z;
	Tue, 04 Aug 2026 14:56:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGZ5-000000028u2-0Czy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:56:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A6FB60AA1;
	Tue,  4 Aug 2026 14:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6B51F00A3F;
	Tue,  4 Aug 2026 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785855382;
	bh=msMgqHZX3Cpzlz49ZY5uD/h6mDTlWrDvHYB6tj0rLc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GLJCs16bnOBXeMbwwfgHRRXEbz9KGNqyxVQnpsGdSi+XcHFpyStBYsWuwDA5uG75O
	 /Kry99689RRLmSW5ApGSYhvtDde2LJLXba3zZovhd8FqPOVb0yzc2LBXe3BsyIYlQN
	 Kty2G9QoVffdyEPyjZM57t+tifyRtISEnh+l5PBEj9KYhrv53aoQMbFtNZHVNuKfn+
	 44MMMVATrgGzhIkmLasUbYJbz91AXQPKWIFnmoH3sF+CZ+X2yS6u66Jw99ZJWPiKwr
	 OND+j9iMiupn28GTKvWWXKfU6EFbajZHOotqW1c1R/U1WMIgf+iJYBc+KA1Zs9zPdh
	 d+Feyi4kKPGYg==
Date: Tue, 4 Aug 2026 15:56:17 +0100
From: Will Deacon <will@kernel.org>
To: Aman Priyadarshi <amanp@apple.com>
Cc: catalin.marinas@arm.com, Jason@zx2c4.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64: archrandom: avoid trapping ID register read in
 __cpu_has_rng()
Message-ID: <anH9kVWFN_dqA0c1@willie-the-truck>
References: <20260720140615.99343-1-amanp@apple.com>
 <amy0dVzgY-uPTTtU@google.com>
 <97FF53B9-993A-4E73-9C6B-0DA514AD0778@apple.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97FF53B9-993A-4E73-9C6B-0DA514AD0778@apple.com>
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

On Fri, Jul 31, 2026 at 06:26:44PM +0100, Aman Priyadarshi wrote:
> > On 31 Jul 2026, at 15:43, Will Deacon <will@kernel.org> wrote:
> > On Mon, Jul 20, 2026 at 03:06:15PM +0100, Aman Priyadarshi wrote:
> >> diff --git a/arch/arm64/include/asm/archrandom.h b/arch/arm64/include/asm/archrandom.h
> >> index 8babfbe31f95..8067e9a35641 100644
> >> --- a/arch/arm64/include/asm/archrandom.h
> >> +++ b/arch/arm64/include/asm/archrandom.h
> >> @@ -61,8 +61,22 @@ static inline bool __arm64_rndrrs(unsigned long *v)
> >> 
> >> static __always_inline bool __cpu_has_rng(void)
> >> {
> >> - if (unlikely(!system_capabilities_finalized() && !preemptible()))
> >> - return this_cpu_has_cap(ARM64_HAS_RNG);
> >> + if (unlikely(!system_capabilities_finalized() && !preemptible())) {
> >> + /*
> >> + * Until the ARM64_HAS_RNG alternative is patched we can't use
> >> + * the static-branch form, so consult the feature register
> >> + * directly. Don't use this_cpu_has_cap() here: it reads
> >> + * ID_AA64ISAR0_EL1 from hardware on every call, under
> >> + * virtualization each ID register read traps to the hypervisor
> >> + * (HCR_EL2.TID3) -- producing a storm of vmexits during boot.
> >> + * The sanitised value is cached in memory.
> >> + */
> >> + u64 isar0 = read_sanitised_ftr_reg(SYS_ID_AA64ISAR0_EL1);
> >> +
> >> + return cpuid_feature_extract_unsigned_field(isar0,
> >> + ID_AA64ISAR0_EL1_RNDR_SHIFT) >=
> >> + ID_AA64ISAR0_EL1_RNDR_IMP;
> >> + }
> > 
> > You can probably rewrite this a little more cleanly along the lines of
> > the (not even compile-tested) diff below. I was about to do that, but
> > then I got a bit confused by the whole thing. The preemptible() check is
> > presumably not needed if we're accessing the in-memory feature registers
> > rather than the per-CPU id registers, but then how do you handle races
> > with concurrent updates to the "safe value" made by CPUs concurrently
> > coming online?
> 
> I kept preemptible() check for this exact reason: the updates made by CPUs
> concurrently coming online will always take the downgrade path (a secondary
> CPU can clear RNDR, never set it), and therefore by taking the non-preemptible
> branch I can guarantee that the pinned CPU supports the said feature.
> I agree, this assumes that a secondary CPU folds its own ID registers into sys_val
> before it can ever be a randomness consumer, but looking at the code that seems
> the case, please feel free to correct me.
> Besides, in my opinion, it's hard to argue correctness of this code without
> preemptible() check.

My point is that this change introduces a data race on 'reg->sys_val' for
the ID_AA64ISAR0_EL1 entry in the arm64_ftr_regs array.

Will

