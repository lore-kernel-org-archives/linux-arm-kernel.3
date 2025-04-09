Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB8CC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 07:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VVsMog4U0IW9lON260CtCJfz1KSiJp6b2aGjTZPwQs=; b=aHDqCW+iiEHswVrqXCNJaqXwn2
	hm24IR0LazuqYf2bPnGm2IOi1FKPgvqw9k/fnClDwJEMndULTDMnF22uuYsKFG60LF70rOl1OXPQV
	JwPPFYSPDsbBTzJKfQB+I0tfiVysTSYe6e90yLlW7Wnqm1sw2Y259ATMwiEvKcnyHiFPMmKkWz9cu
	8O3C+wN9kcuIjWy7lpLCX4ZAHx/wQOdWIGkW4rtT0iciNdL+Mg4YigiCxqRTG1FMVR+TwYKuCgWcF
	JhG0h/3yojow8b8N8b8lEFz32vnSVot5gG9IM3b6NvuYVfUXkuk8VWF7M0Fy5PRnNf9sN1Sy+0ODN
	RY7O77Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Q6R-00000006SK0-0syq;
	Wed, 09 Apr 2025 07:44:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Q2u-00000006RvQ-2onN;
	Wed, 09 Apr 2025 07:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AA2761166;
	Wed,  9 Apr 2025 07:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4893C4CEE3;
	Wed,  9 Apr 2025 07:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744184427;
	bh=5A4/mVtb50kDqC+fC4moBuZWkZin2xvhttRQZOHCkWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1WJTwoHZc3qjvmjY79LDqVw8yNPc7fXVIUSnszBy/x4qMn/nUHuqpBM3yPeH/6c9
	 hnEYfp9IjOqRmoM1eNivkI2JXhsZVibeFB4LgGY6tT6aTdhPS8L0O+V0Gmh8PGRVBk
	 cfWBpBRob3BewkrYvHs01eNtHjklIjGNUNHlurb4=
Date: Wed, 9 Apr 2025 09:38:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn,
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu
Subject: Re: [PATCH v5 4/4] rust: Add warn_on macro
Message-ID: <2025040954-prenatal-enamel-373f@gregkh>
References: <20250409065802.136971-1-fujita.tomonori@gmail.com>
 <20250409065802.136971-5-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409065802.136971-5-fujita.tomonori@gmail.com>
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

On Wed, Apr 09, 2025 at 03:58:01PM +0900, FUJITA Tomonori wrote:
> Add warn_on macro, uses the BUG/WARN feature (lib/bug.c) via assembly
> for x86_64/arm64/riscv.
> 
> The current Rust code simply wraps BUG() macro but doesn't provide the
> proper debug information. The BUG/WARN feature can only be used from
> assembly.
> 
> This uses the assembly code exported by the C side via ARCH_WARN_ASM
> macro. To avoid duplicating the assembly code, this approach follows
> the same strategy as the static branch code: it generates the assembly
> code for Rust using the C preprocessor at compile time.
> 
> Similarly, ARCH_WARN_REACHABLE is also used at compile time to
> generate the assembly code; objtool's reachable anotation code. It's
> used for only architectures that use objtool.
> 
> For now, Loongarch and arm32 just use a wrapper for WARN macro.
> 
> UML doesn't use the assembly BUG/WARN feature; just wrapping generic
> BUG/WARN functions implemented in C works.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

I don't object to this change, but I would STRONGLY recommend never
using this in any driver if at all possible.  Only use this if the
system is in such a state that the only way out is to reboot the kernel,
which is what both WARN() and BUG() will do.

Note, any way that a user can trigger either of these code paths will
result in a CVE, so don't do that either.  Almost always just properly
handle the issue and propagate up the error to the caller.

thanks,

gre gk-h

