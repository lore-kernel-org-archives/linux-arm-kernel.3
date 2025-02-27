Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C85C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 08:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mL+ScEVoosTCLqReMvWvb0hKdFm7SzXMaD7EnmZ5gQU=; b=iqk5CJ9CcQKQAOQPmSQQsSePQM
	BijKeMBoA2H/AWA7HpDSQ/I3HWeKncU0TjZXvswOauIffg6f6FkDA78oQXP2Wp6dLUpb9RRhX2fit
	6MKGUQho0ptzztSF7eZl9jwmGxLfUTXl7wKGiksvXLzNiMk4eWSmtzQO4k3QFQl0Xth6n3FeSF7g8
	dzpBgHY129w5nmYNh16ajEOHGTHhQ4uUoqpzA3IBzLOLYgDxVqrREn15LtNdejh1bC1gV7vqWVU09
	Sv/STCzSRfltg1mLYRwrhhnAis1jPIM+7Ruivc/C+yKra8kQQGr56Lh3/31v466Fyg2geGouqilNB
	mLoSrxvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZHL-00000006hPX-0A2w;
	Thu, 27 Feb 2025 08:29:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZFn-00000006hAe-1Y3L;
	Thu, 27 Feb 2025 08:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8E285C0767;
	Thu, 27 Feb 2025 08:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7C8C4CEDD;
	Thu, 27 Feb 2025 08:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740644902;
	bh=mL+ScEVoosTCLqReMvWvb0hKdFm7SzXMaD7EnmZ5gQU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UkCcNxAHNlb8KdOpVGBTAsjYUG5oG1EXqGPyEiclsxzBC4p+LOLBcG4nlsZ/bWo+k
	 W+AZVnrXuaRNp4mDR5r14XtUQsblr0rPT8GQGXSvmHHye9M6QtKrggxgtlCWPBRshH
	 VXHHQftNfX5UHocw4EVWQUQmUDQz4GzjrsIKq68nK/GgPYUU36Ou13zR4DA+XXyBwE
	 VnpTHUvNXXG1VQHUqqmr5E8R4xbVpPoN8BgaUYrbR3al/9qF/BSs/eqYzBZCgu+gBm
	 aUlhq9JEmKjqnqTOuaNi+lue7T7tGaier67NxH/nVOHEYQbBo2Sn4rUSxSu7KWkMMY
	 sFWAD4mVSBNWA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <linux-kernel@vger.kernel.org>,  <rust-for-linux@vger.kernel.org>,
  <x86@kernel.org>,  <linux-riscv@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <loongarch@lists.linux.dev>,
  <tglx@linutronix.de>,  <mingo@redhat.com>,  <bp@alien8.de>,
  <dave.hansen@linux.intel.com>,  <peterz@infradead.org>,  <hpa@zytor.com>,
  <paul.walmsley@sifive.com>,  <palmer@dabbelt.com>,
  <aou@eecs.berkeley.edu>,  <catalin.marinas@arm.com>,  <will@kernel.org>,
  <chenhuacai@kernel.org>,  <kernel@xen0n.name>,
  <tangyouling@loongson.cn>,  <hejinyang@loongson.cn>,
  <yangtiezhu@loongson.cn>,  <ojeda@kernel.org>,  <alex.gaynor@gmail.com>,
  <boqun.feng@gmail.com>,  <gary@garyguo.net>,  <bjorn3_gh@protonmail.com>,
  <benno.lossin@proton.me>,  <aliceryhl@google.com>,  <tmgross@umich.edu>
Subject: Re: [PATCH v3 0/5] rust: Add bug/warn abstractions
In-Reply-To: <20250227.155417.1610168537890385926.fujita.tomonori@gmail.com>
	(FUJITA Tomonori's message of "Thu, 27 Feb 2025 15:54:17 +0900")
References: <yy_ESUuchCjlaGIJHzCPAcP_d9ucSD0CGXaoZNNkY7BmN5Ch1J8avsA9QpKO5LkTjlGpu99jl8NrFl5NFSQXuw==@protonmail.internalid>
	<20250213135759.190006-1-fujita.tomonori@gmail.com>
	<8734g0v6ke.fsf@kernel.org>
	<aPT3Afc47I_dmAxy1DPVKUobcIJLV0rRUOXJX-ab6IFWqflSxdlOVQdJT0rxYQHjDBeWHDFjWsdXfiCOZ5hPWg==@protonmail.internalid>
	<20250227.155417.1610168537890385926.fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 27 Feb 2025 09:28:11 +0100
Message-ID: <87frjzu6zo.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_002823_482423_4712672F 
X-CRM114-Status: GOOD (  12.90  )
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

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> On Wed, 26 Feb 2025 20:39:45 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> How does this series compare/overlap with [1] ?
>>
>> [1] https://lore.kernel.org/all/20241126-pr_once_macros-v4-0-410b8ca9643=
e@tuta.io/
>
> No overlap. Each solves a different problem. Both are necessary.
>
> This patchset enables Rust code to call C's BUG/WARN properly.
>
> Currently, Rust's BUG() is a simple wrapper for C's BUG()
> (rust/helpers/bug.c). I added BUG() to rnull's init() and got the
> following:
>
> # insmod /root/rnull_mod.ko
> rnull_mod: Rust null_blk loaded
> ------------[ cut here ]------------
> kernel BUG at rust/helpers/bug.c:7!
> Oops: invalid opcode: 0000 [#1] SMP
> CPU: 0 UID: 0 PID: 31 Comm: insmod Not tainted 6.14.0-rc1+ #103
> RIP: 0010:rust_helper_BUG+0x8/0x10
> (snip)
>
> This is NOT debug information that we expect. The problem is that
> BUG/WARN feature (lib/bug.c) can only be used from assembly.
>
> This patchset includes only warn() but with bug() implementation on
> top of this patchset, I got:
>
> # insmod /root/rnull_mod.ko
> rnull_mod: Rust null_blk loaded
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 31 at /home/fujita/git/linux-rust/drivers/block/rnul=
l.rs:46 _RNvXCsafUg3oOYix8_5rnullNtB2_13NullBlkModu]
> Modules linked in: rnull_mod(+)
> CPU: 0 UID: 0 PID: 31 Comm: insmod Not tainted 6.14.0-rc1+ #104
> RIP: 0010:_RNvXCsafUg3oOYix8_5rnullNtB2_13NullBlkModuleNtCsaYBeKL739Xz_6k=
ernel13InPlaceModule4init+0x71/0x4f0 [rnull_mod]
>
>
> The [1] patchset adds an abstraciton for include/linux/once_lite.h,
> 'call a function once' feature, with pr_*_once() implementation.
>
> pr_*_once() just calls printk() once. Unlike BUG/WARN, no debug
> information (call place, registers, stack trace, etc).
>
>
> The only connection between two patchset is that WARN_ONCE() can be
> built on top of both like the C side.

Awesome, thanks for explaining =F0=9F=91=8D


Best regards,
Andreas Hindborg



