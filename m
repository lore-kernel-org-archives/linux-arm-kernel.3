Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B7EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+MVHdy+Bs9IaPCVFSThr9cXyhAAx94aZeBeve4fRLQ=; b=ubu+XE5yc5mYaiMV4DwVvW+aXu
	FtdYp6MfCWnxmAfIv1LAmUv6yiofou8gqzkUME3srQ7fBlocY97PP+SYPFQyWz2ayRFYKUvLnzjkI
	QP/0GrCcW4kmLgTj9AVvJhSfOlYVwkWIUkc9L7WUyqMwn8BFP8A7Q50zWKhxGR5aqM8afKYcoYn8N
	LyI6u0CS3Pzs42xrT2DJWu/CCzxjFhQ6NH1M7mSgItcz/swTdb7ps6u2qK/MRzDkrJLBTN/dLwfXK
	MXG3pRc7weMxHg8uOSXCP3W2NA86Plt5n1geBKRVchWeVDIFkPB0mHVSiB0O2RzH8vo+203NS2uCz
	SdFqVo7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wto2U-0000000EH9r-1hr3;
	Tue, 11 Aug 2026 15:05:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wto2T-0000000EH9F-1unj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:05:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B878B601DE;
	Tue, 11 Aug 2026 15:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865EE1F000E9;
	Tue, 11 Aug 2026 15:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786460712;
	bh=6+MVHdy+Bs9IaPCVFSThr9cXyhAAx94aZeBeve4fRLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aexcBMYPs2NwyRM5PCi5003jGTLA1csL1Q1uf//32B01jqWI2XjoOADHwCdTew3I2
	 7hfTeCexKCndbVmfFD4ToyqmvwtVRwf4y8I4IrmwF7VZrgQMIj5pQfSnHNs09V4Ae/
	 gW9lk72jPddGe7rdp+/CIaETn6i4naAAquANQ/SF4QRZ2sXbDJ7KOv3tdCfQiOQR5K
	 k09f0znq+e0joWJhDwgswx+puw1LJjunV5p7vETDA4Vy9UW1jCcVAiRvrpPPCbZqy/
	 rdsrmUqselEQ/v6pO/S/VEV0kgUyrVhNQz9x57sHtxOJn3fywC+R6fqilB7mFKYPDm
	 HU4h+nF6CcqbQ==
Date: Tue, 11 Aug 2026 08:05:10 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Will Deacon <will@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	live-patching@vger.kernel.org, Song Liu <song@kernel.org>, Miroslav Benes <mbenes@suse.cz>, 
	Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang 21+
Message-ID: <zom5vznqvzwksixpwmkfrbj6wjcyanqebiyanbviwa6ckr5s4z@guvkptdunu24>
References: <anmobvJXiBQqWn6S@willie-the-truck>
 <e5q2mvqtf6iw4lco55uny5ffhppw6vlflxguhc4gg5nm3zdvmo@zs6rw7iov5qc>
 <08d6c5cd-9924-4359-9181-a03718161528@app.fastmail.com>
 <kp4rvh4vxo65gipgqz4i4dnw2ueylmus4yys6xfrbngp5nefzn@4a4ekjlzqlph>
 <CAKwvOdmSVjY0TmOTc6WMmDHcLbn=tOV3R3zH_TO4zXZiYEsaBw@mail.gmail.com>
 <anrvDIWMNGIa4WPK@willie-the-truck>
 <4986ac98-d6da-474a-b218-b6468b68cb9f@app.fastmail.com>
 <16e3ed42-1b1f-4ddc-9d8c-5e12ee7dbe3c@app.fastmail.com>
 <answWdRpVQLtIzIj@willie-the-truck>
 <eb01f226-b067-42dc-be86-328a19a20844@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eb01f226-b067-42dc-be86-328a19a20844@app.fastmail.com>
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

On Tue, Aug 11, 2026 at 04:55:37PM +0200, Ard Biesheuvel wrote:
> 
> On Tue, 11 Aug 2026, at 16:23, Will Deacon wrote:
> 
> > Author: Josh Poimboeuf <jpoimboe@kernel.org>
> > Date:   Tue Aug 11 14:11:44 2026 +0000
> >
> >     arm64: bti: Disable in-kernel BTI with recent versions of Clang
> >    
> >     The following BTI exception was seen when loading a livepatch module:
> >    
> >       Internal error: Oops - BTI: 0000000036000001 [#1]  SMP
> >       pstate: 634004c9 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=jc)
> >       pc : kill_orphaned_pgrp+0x0/0x150
> >       lr : do_exit+0x498/0xaf0 [livepatch_combined]
> >    
> >     The problem is that the patch module's do_exit() is branching to a
> >     static function in vmlinux using a module PLT veneer (indirect branch),
> >     but the target function doesn't have a BTI landing pad.
> >    
> 
> I had missed this bit before, i.e., the fact that the target is a static
> function inside vmlinux.
> 
> The lack of a BTI landing pad suggests that the address of this function
> is never taken either, and so the symbol in question is not exported to
> modules, right?
> 
> Does KLP make any special accommodations to ensure that this is safe? Otherwise,
> BTI is not the only potential issue: the compiler may apply interprocedural
> optimizations, and the function in question may not be AAPCS64 compliant as
> a result.
> 
> It also means treating cross-section jumps as indirect calls in the BTI
> landing pad elision heuristic would not work around the issue here.

Yes, the livepatch module creation process takes interprocedural
optimizations into account.

With kpatch-build and the new in-tree klp-build (x86 only, arm64 coming
soon), it does a binary diff between the old and new kernels, and
extracts the changed functions.  So if the interface between caller and
callee changes, they both get patched.

-- 
Josh

