Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEC3C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WStEEHxM7hIolT44TcmXxeaXFZn2SEfRQGztdT2zzA=; b=dnp+bkhd5tMG/dqrY6u1D849A0
	RHDEKR+nUmNo5aON1zpC9ILcKkQwRy0HOl0O0pI9w+pxu2tU6HJ9oEWf5HhESwUndt38IW9M6/uJw
	ALFPirlHE/ucg9xaA77pLh2ox8Gn1B7tLYyBLT4UuQfyR2p6zWizsPLTEO9u82NMT8SRWxLxtDKxm
	kMttlrJ/Zksvqn6IhOD6hTo2b/38n0rOe7GGdRcBMnCacxdYw6/w5vg1hlGLoF9rO7L8PLuzogMt6
	C1n/iHi7tCajoXKhKn45yW8wctm1UL+yN0CRntJ6b6zTn1bgm1/9+ZkyheKSt+sC+jCacMIkjvVXk
	c+lh5jSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPNd-0000000ALDU-0GO1;
	Thu, 17 Jul 2025 14:14:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOKI-0000000ADMu-29xW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 13:07:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F67B1596;
	Thu, 17 Jul 2025 06:06:56 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB6613F694;
	Thu, 17 Jul 2025 06:07:01 -0700 (PDT)
Date: Thu, 17 Jul 2025 14:06:56 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: =?utf-8?B?5YiY5rW354eVIChIYWl5YW4gTGl1KQ==?= <haiyan.liu@unisoc.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	=?utf-8?B?5Luj5a2Q5Li6IChaaXdlaSBEYWkp?= <Ziwei.Dai@unisoc.com>,
	=?utf-8?B?5ZGo5bmzIChQaW5nIFpob3UvOTAzMik=?= <Ping.Zhou1@unisoc.com>,
	=?utf-8?B?5p2o5Li95aicIChMaW5hIFlhbmcp?= <lina.yang@unisoc.com>,
	=?utf-8?B?546L5Y+MIChTaHVhbmcgV2FuZyk=?= <shuang.wang@unisoc.com>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: Meet compiled kernel binaray abnormal issue while enabling
 generic kasan in kernel 6.12 with some default KBUILD_RUSTFLAGS on
Message-ID: <aHj1cKzCaDDsHLHe@J2N7QTR9R3>
References: <3655537d80024fc8bccb7874dfed4c73@BJMBX01.spreadtrum.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3655537d80024fc8bccb7874dfed4c73@BJMBX01.spreadtrum.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_060706_642961_535E17F5 
X-CRM114-Status: GOOD (  29.39  )
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

On Thu, Jul 17, 2025 at 11:25:00AM +0000, 刘海燕 (Haiyan Liu) wrote:
> > -----邮件原件-----
> > 发件人: Mark Rutland <mark.rutland@arm.com>

> > From a quick scan, I think this might have something to do with UNWIND_PATCH_PAC_INTO_SCS, notes below.
> > 
> > On Mon, Jul 14, 2025 at 03:12:33AM +0000, 刘海燕 (Haiyan Liu) wrote:
> > > I am enabling generic kasan feature in kernel 6.12, and met kernel boot crash.
> > > Unable to handle kernel NULL pointer dereference at virtual address
> > > 0000000000000008 pc : do_basic_setup+0x6c/0xac lr :
> > > do_basic_setup+0x88/0xac sp : ffffffc080087e40

> > Here you evidently have shadow call stack enabled...
> > 
> > > NSX:FFFFFFC0800A8478|D503233F  asan.module_ctor:    paciasp
> > > NSX:FFFFFFC0800A847C|A9BF7BFD                       stp     x29,x30,[sp,#-0x10]!   ; x29,x30,[sp,#-16]!
> > > NSX:FFFFFFC0800A8480|910003FD                       mov     x29,sp
> > > NSX:FFFFFFC0800A8484|B0023420                       adrp    x0,0xFFFFFFC08472D000
> > > NSX:FFFFFFC0800A8488|913E0000                       add     x0,x0,#0xF80     ; x0,x0,#3968
> > > NSX:FFFFFFC0800A848C|52800021                       mov     w1,#0x1          ; w1,#1
> > > NSX:FFFFFFC0800A8490|9422AF35                       bl      0xFFFFFFC080954164   ; __asan_register_globals
> > > NSX:FFFFFFC0800A8494|A8C17BFD                       ldp     x29,x30,[sp],#0x10   ; x29,x30,[sp],#16
> > > NSX:FFFFFFC0800A8498|D50323BF                       autiasp
> > > NSX:FFFFFFC0800A849C|D65F03C0                       ret
> > 
> > ... but here you evidently don't, and have PAC instead.

> > Are these decoded from the static kernel binary, or are these dumps
> > from memory once a kernel has booted (or is in the process of
> > booting)?
> 
>  These are dumped from memory during the kernel booted by trace32.

At which point have you dumped the memory contents? e.g. has the kernel
booted to a prompt before you make the dump, or have you stopped the
kernel early during the boot process?

Are you certain this is dumped *after* scs_patch() has run?

> > > But actually, in two asan.module_ctor functions, there is only autiasp  instruction inserted before return, for validation of return address,
> > while paciasp instruction is missing before.
> > > NSX:FFFFFFC0800A72D8|F800865E  asan.module_ctor:    str     x30,[x18],#0x8   ; x30,[x18],#8
> > > NSX:FFFFFFC0800A72DC|F81F0FFE                       str     x30,[sp,#-0x10]!   ; x30,[sp,#-16]!
> > > NSX:FFFFFFC0800A72E0|B00233C0                       adrp    x0,0xFFFFFFC084720000
> > > NSX:FFFFFFC0800A72E4|91350000                       add     x0,x0,#0xD40     ; x0,x0,#3392
> > > NSX:FFFFFFC0800A72E8|52803D61                       mov     w1,#0x1EB        ; w1,#491
> > > NSX:FFFFFFC0800A72EC|9422B39E                       bl      0xFFFFFFC080954164   ; __asan_register_globals
> > > NSX:FFFFFFC0800A72F0|F84107FE                       ldr     x30,[sp],#0x10   ; x30,[sp],#16
> > > NSX:FFFFFFC0800A72F4|D50323BF                       autiasp
> > > NSX:FFFFFFC0800A72F8|D65F03C0                       ret
> > 
> > Thas has a mixture of SCS and PAC; there's a shadow call stack prologue but a PAC epilogue:
> > 
> >         str     x30, [x18], #8  // SCS
> >         ...
> >         autiasp                 // PAC
> 
> Yes, this is my issue and I wanted to resolve.
> 
> > ... so I'll hazard a guess that these are dumps from memory, 

This was confirmed above...

> > and you have UNWIND_PATCH_PAC_INTO_SCS selected.

... can you please confirm this? i.e. does your config have
CONFIG_UNWIND_PATCH_PAC_INTO_SCS selected?

> > Assuming that is the case, either this dump has been made
> > mid-patching, or the patching has gone wrong somehow and left the
> > prologues/epilogues in an inconsistent state (and the NULL
> > dereference could be a secondary effect of that).
> >
> > Ard, does that sound plausible to you?
> >
> > I can't see why that would depend on KBUILD_RUSTFLAGS, but maybe the DWARF generated by rustc has confused the patching code
> > somehow, or the linker has aggregated that in a suprising way.
> > Mark.
> 
>   Yes, Thank you. What can cause this issue? Can you give some
>   directions so that we can gradually investigate.

Find out specifically where the affected asan.module_ctor functions are
from, i.e. whether they're generated by rustc or the C compiler that
you're using.

Go and read scs_patch(), see what it does, and check the data it
consumes.

See if rustc is generating DWARF as we expect or not.

See if the linker is combining that correctly into the resulting
vmlinux, and that this correctly propagates into the resulting Image.

Mark.

