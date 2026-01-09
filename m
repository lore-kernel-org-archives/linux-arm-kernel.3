Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B677D16818
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTs2o6ZxVKmS1LiLHaJilwb34utcmD87sFHT1QYKNFI=; b=xxw49JvwobqRNAd2qyfcEzCF9s
	ZDxgC/ttssPjSg40M/SyJKYPwXBXePQ4uGl9p72uL+Sl1DOwRmN5euaXCb+uYlceTKTl1gQHWUAIw
	DhMj4+IucfP18cUSxY6Ze0U9gCofIZIsgw+Ak7JmZZIzsAPWlkjU0u5fgBZmwFUkAHrj3ui+Auoet
	mVGZGc+lRo2EOxuDzdMg478edBnc8vaaYDn0i3XGGpO0s78Fb3HEoQbKvwcnmBDj3p5SBe2RUWh3W
	F2Ar6SgrTo6mkrfOTDVZvpsOvCRTjmbnX5lUL/n1WXR4eCgjTn581AUgva/fRwmS/XG9PQzRQe3Du
	JqnC9F8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veArZ-00000002EUv-3DN7;
	Fri, 09 Jan 2026 11:41:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veArW-00000002EUL-3XY8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 11:41:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12CF340A2F;
	Fri,  9 Jan 2026 11:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7AFC4CEF1;
	Fri,  9 Jan 2026 11:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767958861;
	bh=KonUh5c2LUAictyvq92iGeEPaKODJRC7OdgWai1RrDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EFAv21bIyEop17buGlYAqCge9GxpBXdEMIzajkt4XiEJjDtTenFV6+RSCpshRjlPg
	 ylPmmCiXIQn7f8CUL3e7gPz/EQJn7B1P5gO5N1nuWvTfFJU6dveXTlsbQlMrhergBi
	 6D2v/eSHwUisHoNtLo/VZG3H3LvtWU9gK2Rhv8nAHcu+vLltKCkaA4qIXYJQu37tZ7
	 L/zbNoa3qjCMmXZTNFgPnsqwl+y6+eQjxF2K19LWhsYK8ORU5BJiSN6lHV9ehanrRi
	 BdGF9CArHCvPljIQvySCdBVhBrRzsR4S3FE8n6lfOcIGCwzJ5GlL+IcStm3TwEb7oX
	 4ia5ExZqlWrlQ==
Date: Fri, 9 Jan 2026 11:40:56 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Carl Worth <carl@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Taehyun Noh <taehyun@utexas.edu>, andreyknvl@gmail.com,
	pcc@google.com, yeoreum.yun@arm.com
Subject: Re: [PATCH 2/2] arm64: mte: Defer disabling of TCO until
 user_access_begin/end
Message-ID: <aWDpSNFnZC2nj4KS@willie-the-truck>
References: <20251030-mte-tighten-tco-v1-2-88c92e7529d9@os.amperecomputing.com>
 <aV_H9h-nSM1HlWnR@willie-the-truck>
 <aV_7Sm96Zf1Gfg9v@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV_7Sm96Zf1Gfg9v@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_034102_936686_C2336FBE 
X-CRM114-Status: GOOD (  30.90  )
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

On Thu, Jan 08, 2026 at 06:45:30PM +0000, Catalin Marinas wrote:
> On Thu, Jan 08, 2026 at 03:06:30PM +0000, Will Deacon wrote:
> > On Thu, Oct 30, 2025 at 08:49:32PM -0700, Carl Worth wrote:
> > > The PSTATE.TCO (Tag Checking Override) register, when set causes MTE
> > > tag checking to be disabled. The TCO bit is automatically set by the
> > > hardware when an exception is taken.
> > > 
> > > Prior to this commit, mte_disable_tco_entry would clear TCO (enable
> > > tag checking) for either of two cases: 1. When the kernel wants tag
> > > checking (KASAN) or 2. when userspace wants tag checking (via
> > > SCTLR.TCF0).
> > > 
> > > In the case of userspace desired tag checking, (that is, when KASAN is
> > > off), clearing TCO on entry to the kernel has negative performance
> > > implications. This results in excess kernel space tag checking that
> > > has not been requested.
> 
> I would have expected the hardware to avoid any tag checking if
> SCTLR_EL1.TCF is 0. I guess the Arm ARM isn't entirely clear (D10.4.1
> Tag Checked memory accesses), it seems to only mention TCF and TCMA with
> a match-all tag for considering Unchecked accesses.
> 
> > > diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
> > > index 1aa4ecb73429..248741a66c91 100644
> > > --- a/arch/arm64/include/asm/uaccess.h
> > > +++ b/arch/arm64/include/asm/uaccess.h
> > > @@ -417,11 +417,41 @@ static __must_check __always_inline bool user_access_begin(const void __user *pt
> > >  {
> > >  	if (unlikely(!access_ok(ptr,len)))
> > >  		return 0;
> > > +
> > > +	/*
> > > +	 * Enable tag checking for the user access if MTE is enabled
> > > +	 * in the userspace task.
> > > +	 *
> > > +	 * Note: We don't need to do anything if KASAN is enabled,
> > > +	 * since that means the tag checking override (TCO) will
> > > +	 * already be disabled. In turn, the TCF0 bits will control
> > > +	 * whether user-space tag checking happens .
> > > +	 */
> > > +	if (!kasan_hw_tags_enabled() && user_uses_tagcheck())
> > > +		asm volatile(SET_PSTATE_TCO(0));
> > > +
> > >  	uaccess_ttbr0_enable();
> > >  	return 1;
> > >  }
> > 
> > What about all the uaccess routines that don't call user_access_begin? For
> > example, copy_from_user().
> 
> We might as well ignore tag checking for all uaccess for specific
> hardware. It's a relaxation but you get this with futex already and some
> combination of read/write() syscalls with O_DIRECT.

Hmm, you could argue it's an ABI break, no? You can write a userspace
program that will behave differently before and after the change.
Conversely, you could argue that a syscall using uaccess is an
unstable implementation detail of the syscall, but it feels a bit fragile
(for example, signal delivery is always going to use the uaccess routines
to access the signal stack)

Will

