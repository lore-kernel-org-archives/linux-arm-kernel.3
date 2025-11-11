Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58380CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 19:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fy9u6CGUKA1B0A0ytc8N5Z1pEjcxdc/kfCrt3vAslWc=; b=1REpZ/wQMVJ56R419jsgWJfxMw
	+NNy+NWtRa+OoGymfanSKehvaPCZl+4Z4mSh0RXm8V0uyGaGQLXH1oPJdnRyj2p2Wy5mXKeERB+GD
	AVTdV0jYsJQR4S9E5OhflsjpD7hj8KBO+Znphui52r/Ax7M8OfTxAV8EKCARXvUoZ6MRA8BySJDrs
	oo2zN2JGC5ST5RqhjkquABvJANweigGdpSTyVzEITuGcQHkMrH1ntv4TAxBO75DpSJSRYNZRVhkl0
	YeNqB4Uvat3ElVdlWfLxJdFT5Yqx+aeN874/IKManHLH80w/HhnJlW5h2iBaVFiqXwKHgeOm3XZYY
	13f2JGUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItb0-00000007eu9-3Umf;
	Tue, 11 Nov 2025 19:00:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItay-00000007erL-0oOQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 19:00:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F990446EE;
	Tue, 11 Nov 2025 18:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A8BC19422;
	Tue, 11 Nov 2025 18:59:55 +0000 (UTC)
Date: Tue, 11 Nov 2025 18:59:53 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Brown <broonie@kernel.org>,
	Pierre Gondois <Pierre.Gondois@arm.com>,
	Sami Mujawar <Sami.Mujawar@arm.com>
Subject: Re: [PATCH v4 resend 0/7] arm64: Make EFI calls preemptible
Message-ID: <aROHqYH_apXByNn0@arm.com>
References: <20251015205634.3820870-9-ardb+git@google.com>
 <aROEXadFWdJoQEzx@arm.com>
 <CAMj1kXGYGSrhUbJ8jboSbch6tp00zfpnGdfJEQcbq=RmLFy5CA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGYGSrhUbJ8jboSbch6tp00zfpnGdfJEQcbq=RmLFy5CA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_110000_246869_26386C30 
X-CRM114-Status: GOOD (  17.11  )
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

On Tue, Nov 11, 2025 at 07:50:49PM +0100, Ard Biesheuvel wrote:
> On Tue, 11 Nov 2025 at 19:45, Catalin Marinas <catalin.marinas@arm.com> wrote:
> >
> > On Wed, Oct 15, 2025 at 10:56:35PM +0200, Ard Biesheuvel wrote:
> > > Ard Biesheuvel (7):
> > >   efi: Add missing static initializer for efi_mm::cpus_allowed_lock
> > >   efi/runtime-wrappers: Keep track of the efi_runtime_lock owner
> > >   arm64/fpsimd: Don't warn when EFI execution context is preemptible
> > >   arm64/fpsimd: Permit kernel mode NEON with IRQs off
> > >   arm64/efi: Drop efi_rt_lock spinlock from EFI arch wrapper
> > >   arm64/efi: Move uaccess en/disable out of efi_set_pgd()
> > >   arm64/efi: Call EFI runtime services without disabling preemption
> >
> > The series looks fine to me:
> >
> > Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> >
> > What do you plan to do with this, merge via the EFI tree? Are there any
> > dependencies?
> 
> As you prefer - I can take it via the EFI tree, or you can take it.
> There are no conflicts with the other kernel mode FP/SIMD related
> changes that we are taking via libcrypto, and there are no other
> dependencies that I am aware of.

OK, I'll queue them via arm64 shortly.

-- 
Catalin

