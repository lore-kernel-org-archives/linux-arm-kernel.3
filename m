Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDD6D1D486
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 18:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1UWnSbTUl62/iDIA/jlXzMYLsyXw6kUCDTsac5N2aY=; b=TYM7An4If82n5M6EMQbMarkYpN
	H5M4SNyZb5FxDGmgCXEari2ETw2uukGVQWyxzNNUysPfbUiuUSnVOJR0gAmfUbwtpnBCVyM9PlXxR
	ndSbkWs+dvSyUTOkDwmLeuvuYX9M/seYZwckpAkmYJV2eSWIWyjWJwuMzSoRGOq3OaCU3ch8w4JRe
	ameKZFU/hDMp8LR85tXoUBUHk1iAzURpXhBTEMy6Co1lUPQgEhPjC6WwQ9LwNZpTU/9dQaIvgqZ2n
	6OEHHkrpxmSJTiOOdqpOlwlhhw09AGE96eSEAgGVwrgiZVyFJTC6tf/tfkAYbFBGCsn4oD1Mgrs9e
	KC6pThVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdv11-00000000ew6-1NyB;
	Thu, 08 Jan 2026 18:45:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdv0x-00000000eug-0oS5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 18:45:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 844F3497;
	Thu,  8 Jan 2026 10:45:31 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C96F3F5A1;
	Thu,  8 Jan 2026 10:45:34 -0800 (PST)
Date: Thu, 8 Jan 2026 18:45:30 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Carl Worth <carl@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Taehyun Noh <taehyun@utexas.edu>, andreyknvl@gmail.com,
	pcc@google.com, yeoreum.yun@arm.com
Subject: Re: [PATCH 2/2] arm64: mte: Defer disabling of TCO until
 user_access_begin/end
Message-ID: <aV_7Sm96Zf1Gfg9v@arm.com>
References: <20251030-mte-tighten-tco-v1-2-88c92e7529d9@os.amperecomputing.com>
 <aV_H9h-nSM1HlWnR@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV_H9h-nSM1HlWnR@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_104543_352868_3A0AFF4D 
X-CRM114-Status: GOOD (  29.17  )
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

On Thu, Jan 08, 2026 at 03:06:30PM +0000, Will Deacon wrote:
> On Thu, Oct 30, 2025 at 08:49:32PM -0700, Carl Worth wrote:
> > The PSTATE.TCO (Tag Checking Override) register, when set causes MTE
> > tag checking to be disabled. The TCO bit is automatically set by the
> > hardware when an exception is taken.
> > 
> > Prior to this commit, mte_disable_tco_entry would clear TCO (enable
> > tag checking) for either of two cases: 1. When the kernel wants tag
> > checking (KASAN) or 2. when userspace wants tag checking (via
> > SCTLR.TCF0).
> > 
> > In the case of userspace desired tag checking, (that is, when KASAN is
> > off), clearing TCO on entry to the kernel has negative performance
> > implications. This results in excess kernel space tag checking that
> > has not been requested.

I would have expected the hardware to avoid any tag checking if
SCTLR_EL1.TCF is 0. I guess the Arm ARM isn't entirely clear (D10.4.1
Tag Checked memory accesses), it seems to only mention TCF and TCMA with
a match-all tag for considering Unchecked accesses.

> > diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
> > index 1aa4ecb73429..248741a66c91 100644
> > --- a/arch/arm64/include/asm/uaccess.h
> > +++ b/arch/arm64/include/asm/uaccess.h
> > @@ -417,11 +417,41 @@ static __must_check __always_inline bool user_access_begin(const void __user *pt
> >  {
> >  	if (unlikely(!access_ok(ptr,len)))
> >  		return 0;
> > +
> > +	/*
> > +	 * Enable tag checking for the user access if MTE is enabled
> > +	 * in the userspace task.
> > +	 *
> > +	 * Note: We don't need to do anything if KASAN is enabled,
> > +	 * since that means the tag checking override (TCO) will
> > +	 * already be disabled. In turn, the TCF0 bits will control
> > +	 * whether user-space tag checking happens .
> > +	 */
> > +	if (!kasan_hw_tags_enabled() && user_uses_tagcheck())
> > +		asm volatile(SET_PSTATE_TCO(0));
> > +
> >  	uaccess_ttbr0_enable();
> >  	return 1;
> >  }
> 
> What about all the uaccess routines that don't call user_access_begin? For
> example, copy_from_user().

We might as well ignore tag checking for all uaccess for specific
hardware. It's a relaxation but you get this with futex already and some
combination of read/write() syscalls with O_DIRECT.


Reading the Arm ARM section again, I wonder whether always setting TCMA1
does the trick for the Ampere hardware. With KASAN disabled in the
kernel, all addresses will star with 0xff... so behave as match-all. We
do this with KASAN_HW_TAGS enabled but it won't have any effect with
kasan disabled.

Carl, could you please try the patch below?

----------------8<----------------------------------------
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 01e868116448..8b1f0de00fd3 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -48,14 +48,14 @@
 #define TCR_KASAN_SW_FLAGS 0
 #endif
 
-#ifdef CONFIG_KASAN_HW_TAGS
-#define TCR_MTE_FLAGS TCR_EL1_TCMA1 | TCR_EL1_TBI1 | TCR_EL1_TBID1
-#elif defined(CONFIG_ARM64_MTE)
+#ifdef CONFIG_ARM64_MTE
 /*
  * The mte_zero_clear_page_tags() implementation uses DC GZVA, which relies on
- * TBI being enabled at EL1.
+ * TBI being enabled at EL1. TCMA1 is needed to treat accesses with the
+ * match-all tag (0xF) as Tag Unchecked, irrespective of the SCTLR_EL1.TCF
+ * setting.
  */
-#define TCR_MTE_FLAGS TCR_EL1_TBI1 | TCR_EL1_TBID1
+#define TCR_MTE_FLAGS TCR_EL1_TCMA1 | TCR_EL1_TBI1 | TCR_EL1_TBID1
 #else
 #define TCR_MTE_FLAGS 0
 #endif

