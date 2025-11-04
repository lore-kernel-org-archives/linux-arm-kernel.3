Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E44CCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 16:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sgv44AYg1GcxRuiUgsF791L+moCWZ5//4OYjNP3DEI=; b=PRtX9cqsgaGuUfjwzQJ1bvtO36
	FP2lp/V4oFWIDrGBEKMeVrboS/1ztwuYAD7zViEAtn1PTAuuefTZrOkJhPPFcG3GTuHdxIIp5GCRM
	toZyX6KVoZKIcopHFCSbpqYA2SxDVjPSLIVDdlydkaUiydmZ0V+gcFD/HlX+0QV2vHvNC+3taFSeY
	j0TfceDKaYLYoL1UvzVWhvaXP19dUls4vnSJ3A3Ss1Nl7B8G64aq0eSVS0Fe96mVowWkGYuz/TnZp
	KR9q6AkIMomMPl+3EkaOrTVFF28qbdvdRKhZOXjPQofWql0ydZ40goqK5AkPccR74clXbgn9Q+b7n
	VV1ozH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJi3-0000000CAsT-2LIO;
	Tue, 04 Nov 2025 16:16:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJi1-0000000CArP-0fq8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 16:16:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B4D3447A9;
	Tue,  4 Nov 2025 16:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA38DC116B1;
	Tue,  4 Nov 2025 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762272996;
	bh=EBvCozXC0B7xS4q4wIuy10Yn3kGVo6sqyYCj5vhUAGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lj2eYO6Mtv7X8QLk+/EsC4EsuRFqDvAXLQejVWdxtafr8WSjZVXhWecI5E9kWHCYM
	 C+m/9RgZ4ZIh0a1Cxv59F6YeYQ8VjyPToC64rNT/tZfKAZw8Z573Jav9hEEK5dmFw3
	 eGmW7M4V8oaGxQ/RGRMdQkM0nyxzR7pNkD/g4/NNdA4F+UFdlHl6QqAS3Ai4jp+wtT
	 zPrc7YhyqmVQ9ttdm+bwYcUZvlvDkEqQMuv55GWL6RElmhmjaEjI4AapgAlvF0iNxI
	 POb08jgMRPqfkSi36Bl4ECjOmfaTonzyxnxWgqC444kQPYVuFyVP5v0789++QRtR/F
	 fp8ZEyHLf0vhQ==
Date: Tue, 4 Nov 2025 16:16:29 +0000
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Pierre Gondois <Pierre.Gondois@arm.com>,
	Sami Mujawar <Sami.Mujawar@arm.com>
Subject: Re: [PATCH v4 resend 3/7] arm64/fpsimd: Don't warn when EFI
 execution context is preemptible
Message-ID: <aQom3XPDmPTkq47d@willie-the-truck>
References: <20251015205634.3820870-9-ardb+git@google.com>
 <20251015205634.3820870-12-ardb+git@google.com>
 <aQohO07DpxlriQfJ@willie-the-truck>
 <CAMj1kXHJ8QWLE=awDUpNa0Cf_1YXMQaW-Se1NvvavOocshDkTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHJ8QWLE=awDUpNa0Cf_1YXMQaW-Se1NvvavOocshDkTQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_081637_238257_D0FE891D 
X-CRM114-Status: GOOD (  26.51  )
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

On Tue, Nov 04, 2025 at 05:00:34PM +0100, Ard Biesheuvel wrote:
> On Tue, 4 Nov 2025 at 16:52, Will Deacon <will@kernel.org> wrote:
> >
> > On Wed, Oct 15, 2025 at 10:56:38PM +0200, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Kernel mode FP/SIMD no longer requires preemption to be disabled, so
> > > only warn on uses of FP/SIMD from preemptible context if the fallback
> > > path is taken for cases where kernel mode NEON would not be allowed
> > > otherwise.
> > >
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > ---
> > >  arch/arm64/kernel/fpsimd.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> > > index e3f8f51748bc..3d848c89604e 100644
> > > --- a/arch/arm64/kernel/fpsimd.c
> > > +++ b/arch/arm64/kernel/fpsimd.c
> > > @@ -1934,11 +1934,11 @@ void __efi_fpsimd_begin(void)
> > >       if (!system_supports_fpsimd())
> > >               return;
> > >
> > > -     WARN_ON(preemptible());
> > > -
> > >       if (may_use_simd()) {
> > >               kernel_neon_begin();
> > >       } else {
> > > +             WARN_ON(preemptible());
> > > +
> >
> > Given that may_use_simd() returns false on systems without support for
> > fpsimd, I wonder whether moving this WARN_ON() actually helps with
> > anything.
> 
> This code is only reachable if system_supports_fpsimd() returns true,
> so may_use_simd() will only return false here when running in
> hardirq/NMI context.

Sorry, I missed the check _right at the top of the hunk_!

> 
> > That is, you probably shouldn't be calling __efi_fpsimd_begin()
> > from preemptible code regardless, no?
> >
> 
> Not sure I follow you here: __efi_fpsimd_begin() is generally called
> from preemptible code, and it is the EFI runtime wrappers themselves
> that disable preemption - that is the whole point of this series.

Ignore me. I was reviewing this against the upstream
arch_efi_call_virt_setup/teardown() functions rather than in the context
of the changes made later in this series (specifically patch 5).

Will

