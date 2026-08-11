Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A48FC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkytS5/JYPqoV21rPgtFYMaLjnmwoh9e0CeURPfB4Go=; b=gMMEU/Vr+/JfPQOMVy0uhXqVCz
	y2i146TOauqOQ+xpbIaPfIJX9w4Qs4y/3Sjv4dQjV9OFUDYPXM4z5QAIfS7+ZkUyRLLGnYRiUqpCK
	l/EfWcj1pkz+Pjso5zkm4j+tDLjh0+Gh7r8RKEI6OvM1niz2ji4ZLPpnvj7gtkDpNGtWhnMTwvuqx
	muzBIGjAG8NfoC9Hlg5Ll8eWUh0SPSflI55eON4h1jUoxDdF1+S21KWYWd8anEidjrIaMiw/UWPY2
	2+q9J7H5GQsTmYNOWEmVg2BgKrjGoMNnWddqQ7nW53Aqr8gIBUxnqIo20syXrGEz9PRWaPXJgIQaY
	LYR3I+HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnO7-0000000ECz6-01Yo;
	Tue, 11 Aug 2026 14:23:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnO5-0000000ECyr-0dFC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 14:23:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 90C5C4068B;
	Tue, 11 Aug 2026 14:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FB21F000E9;
	Tue, 11 Aug 2026 14:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786458208;
	bh=XkytS5/JYPqoV21rPgtFYMaLjnmwoh9e0CeURPfB4Go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nFm9/IDCqUPec8VfrpbgRu58zarRXsb0+5sJImgcqrUerzfFoAiZx+IS1pRf05Bem
	 +7kkMJRctqysJs8RL6nckRWev69/OzetsljjwNZJwZjexo/i2iWq7JWDzup28luEcb
	 /g6+4odPN/46zM7GP/sITu5G7O1qNvMK/MxBiHIlJNcE9SAvYRu64d7TNAlxh0at1Z
	 KZUyoKFp4GpISJ+TXpcgClikZdqD22ofD3h7yamWKXW5dAV4ualHHQoo4VaQMFkStS
	 W3XiBPS5HX/M0Jo2qstJMFk7gTRdh5wfVbs7V8MwblEX3KJzMaKSOCQhcYWBWAVF7E
	 fG5p1gLZQOIag==
Date: Tue, 11 Aug 2026 15:23:21 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	live-patching@vger.kernel.org, Song Liu <song@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang 21+
Message-ID: <answWdRpVQLtIzIj@willie-the-truck>
References: <ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org>
 <anmobvJXiBQqWn6S@willie-the-truck>
 <e5q2mvqtf6iw4lco55uny5ffhppw6vlflxguhc4gg5nm3zdvmo@zs6rw7iov5qc>
 <08d6c5cd-9924-4359-9181-a03718161528@app.fastmail.com>
 <kp4rvh4vxo65gipgqz4i4dnw2ueylmus4yys6xfrbngp5nefzn@4a4ekjlzqlph>
 <CAKwvOdmSVjY0TmOTc6WMmDHcLbn=tOV3R3zH_TO4zXZiYEsaBw@mail.gmail.com>
 <anrvDIWMNGIa4WPK@willie-the-truck>
 <4986ac98-d6da-474a-b218-b6468b68cb9f@app.fastmail.com>
 <16e3ed42-1b1f-4ddc-9d8c-5e12ee7dbe3c@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16e3ed42-1b1f-4ddc-9d8c-5e12ee7dbe3c@app.fastmail.com>
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

On Tue, Aug 11, 2026 at 03:18:17PM +0200, Ard Biesheuvel wrote:
> 
> On Tue, 11 Aug 2026, at 14:02, Ard Biesheuvel wrote:
> > On Tue, 11 Aug 2026, at 11:44, Will Deacon wrote:
> >> On Mon, Aug 10, 2026 at 09:41:35AM -0700, Nick Desaulniers wrote:
> >
> >>> Sure, but let's replace this with a link to a bug report in llvm's
> >>> issue tracker?
> >>
> >> Yes, please! I can apply the patch once we have the bug number.
> >>
> >
> > I can look into that.
> 
> https://github.com/llvm/llvm-project/issues/215547

Thanks, Ard. I've ended up with the patch below.

Will

--->8

Author: Josh Poimboeuf <jpoimboe@kernel.org>
Date:   Tue Aug 11 14:11:44 2026 +0000

    arm64: bti: Disable in-kernel BTI with recent versions of Clang
    
    The following BTI exception was seen when loading a livepatch module:
    
      Internal error: Oops - BTI: 0000000036000001 [#1]  SMP
      pstate: 634004c9 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=jc)
      pc : kill_orphaned_pgrp+0x0/0x150
      lr : do_exit+0x498/0xaf0 [livepatch_combined]
    
    The problem is that the patch module's do_exit() is branching to a
    static function in vmlinux using a module PLT veneer (indirect branch),
    but the target function doesn't have a BTI landing pad.
    
    Clang 21+ omits the landing pad for static functions which can only be
    reached by a direct branch.  That's normally fine for ordinary modules
    which only branch to global exported functions, but Mark Brown points
    out [1] that this isn't guaranteed if the module branches between
    sections. Futhermore, livepatch modules use klp relocations to reference
    arbitrary kernel symbols, so with CONFIG_RANDOMIZE_MODULE_REGION_FULL
    the module is far enough from the kernel that every R_AARCH64_CALL26
    needs a PLT.
    
    Put Clang 21+ in the naughty corner alongside GCC, which suffers from
    the same issue, by disabling CONFIG_ARM64_BTI_KERNEL until we have a
    version of the toolchain with the problem resolved.
    
    Cc: Ard Biesheuvel <ardb@kernel.org>
    Link: https://lore.kernel.org/r/da06bbd3-d04b-4d0f-b331-f5b91bc373a5@sirena.org.uk [1]
    Fixes: fd1e0fd71f65 ("arm64: Implement HAVE_LIVEPATCH")
    Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
    [will: Stitched together commit message, diff and bug number]
    Signed-off-by: Will Deacon <will@kernel.org>

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919..fc57d90d92c1 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2116,6 +2116,8 @@ config ARM64_BTI_KERNEL
        depends on !CC_IS_GCC || GCC_VERSION >= 100100
        # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
        depends on !CC_IS_GCC
+       # https://github.com/llvm/llvm-project/issues/215547
+       depends on !CC_IS_CLANG || CLANG_VERSION < 210000
        depends on (!FUNCTION_GRAPH_TRACER || DYNAMIC_FTRACE_WITH_ARGS)
        help
          Build the kernel with Branch Target Identification annotations


