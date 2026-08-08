Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84029C5AD44
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 21:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfgpSe5xinaL9ifATlL93o/2t8Nm4a+z+ScqI0DWC/w=; b=Nr20MIvn+ywi8zO+9x/Bs9jJTa
	NXU9c5ZhFNH4oVxUQFkujXvDBDExw6az4V4m8rD3XL1rjeMAb4DCWKrWNO8AxpndVg00P6ZJT6BTB
	kQeazuLDZafuB/cLwzuOOi3nqxR2Ex96yMULXDGL82+joSf7ZMKELwApIPP/Wjfze4NoJpgqjY9bF
	FLr37NDEo1rl3qUvuyY855Bd/B7hO7flGo6LzKbd0C3G4xa1sn3L50W9pE80/KRy/OKFlWr0jD96S
	8WhasefNGO7X/3Rthe7v9vYqfYmT804lltUl9yOzUXL+NSgpsACO4RnaqjM/1cd0Ok+rNBssu3CE2
	yrbp9P/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsp51-00000009koG-44Rl;
	Sat, 08 Aug 2026 21:59:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsp50-00000009ko8-2ZYB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 21:59:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B6FCD40395;
	Sat,  8 Aug 2026 21:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13B11F000E9;
	Sat,  8 Aug 2026 21:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786226384;
	bh=kfgpSe5xinaL9ifATlL93o/2t8Nm4a+z+ScqI0DWC/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UWV56ivwCqk4ftHy4r6UIgshsW0TohA3CSZacQEFDg8LLwHbtX08Ey9g0bh4EGCHT
	 d3fER0gKson63vkEYWLKK4mwfBoM1CoASF7UZu9vlh0kOub9ViIdZT3UvfVdQbiQwz
	 kXonsZKcpBu+3qGwN6GrKi0wxCatUY3CqWwQpsl1G4g7yvrTC5HOZWuPyRKl4j+Uj/
	 b0BEB1GHXcmZZ4jk3k7NH0WsU8/cXQEUxU2+b3QTO5o8YtdimEhjA0zNEyESBbyOt3
	 q/cHmltOOQAg7eA8UqgekF84i1/k7kJpCBUR4gxCg0EGqYHQfB0Nd3jrC75YwhsDiQ
	 7qthu1qs6dSAg==
Date: Sat, 8 Aug 2026 14:59:42 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Song Liu <song@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v3 14/21] objtool: Prevent kCFI hashes from being decoded
 as instructions
Message-ID: <s275kky5bqb5w5agrseielj66zvm53hr3yv7n33tenz4swnvpb@c63r6czxpeil>
References: <cover.1778642120.git.jpoimboe@kernel.org>
 <b1d50c9fc9e6b9bca43833cc4ccbd88a31fed84b.1778642120.git.jpoimboe@kernel.org>
 <akQNqlfFC0T5pcMa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <akQNqlfFC0T5pcMa@redhat.com>
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

On Tue, Jun 30, 2026 at 02:40:42PM -0400, Joe Lawrence wrote:
> The root cause is that create_fake_symbols() skips the entire special
> section if any symbol exists at offset 0.  But Clang places a .Ltmp*
> label at the start of .kcfi_traps, so no per-entry fake symbols are
> created and clone_special_sections() extracts nothing.
> 
>   static int create_fake_symbols(struct elf *elf)
>   {
>   ...
>   	/*
>   	 * 2) Make symbols for sh_entsize, and simple arrays of pointers:
>   	 */
>   entsize:
>   	for_each_sec(elf, sec) {
>   		unsigned int entry_size;
>   		unsigned long offset;
> 
>   		if (!is_special_section(sec) || find_symbol_by_offset(sec, 0))
>   			continue;
> 
>   $ llvm-readelf --wide --symbols klp-tmp/3-checksum-patched/vmlinux.o | \
>           awk '$7 == 74993'
>    93266: 0000000000000000     0 NOTYPE  LOCAL  DEFAULT   74993 .Ltmp78
>    93544: 0000000000000000     0 SECTION LOCAL  DEFAULT   74993 .kcfi_traps
> 
> 
> Possible fix: ignore .L* assembler-local labels at section offset 0
> using the existing is_local_label() helper.
> 
> -->8-- -->8-- -->8-- -->8-- -->8-- -->8-- -->8-- -->8-- -->8-- -->8--
> 
> diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
> index b9624bd9439b..4ba400926647 100644
> --- a/tools/objtool/klp-diff.c
> +++ b/tools/objtool/klp-diff.c
> @@ -1860,8 +1860,17 @@ static int create_fake_symbols(struct elf *elf)
>  	for_each_sec(elf, sec) {
>  		unsigned int entry_size;
>  		unsigned long offset;
> +		struct symbol *sym_at_0;
> 
> -		if (!is_special_section(sec) || find_symbol_by_offset(sec, 0))
> +		if (!is_special_section(sec))
> +			continue;
> +
> +		/*
> +		 * Clang may place assembler-local .L* labels at offset 0;
> +		 * they must not prevent per-entry fake symbol creation.
> +		 */
> +		sym_at_0 = find_symbol_by_offset(sec, 0);
> +		if (sym_at_0 && !is_local_label(sym_at_0))
>  			continue;

Thanks, I'll fix this with my other series of fixes in the next version.

find_symbol_by_offset() might not work because there can be multiple
symbols at offset 0.  Instead we can just traverse the symbols in the
section, looking for sym->fake.

-- 
Josh

