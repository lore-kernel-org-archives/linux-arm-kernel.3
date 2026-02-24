Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BF3F4BB93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 22:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNTnQ467Zmpo8d9cBdjqKLwO1L3QP624As7KxkOCpYM=; b=jqwlsa6SuVdViz4hZGkgk7g2n9
	yTjXxWrTY894RRPjuFeBBjkpmld1SjZ9rjQLPFkmuHzp12yxt8ik6VtaYYkJtA4SLcBiED8zOwCWz
	F8tmqvWy1TRVWQBRb8Gby3nnkt59Kmch/iI4i36By5Az4SCpF3do6XeKK9MjS0vaQarlJA22txdWQ
	UPuWrjgJBxw1JZhz2mf6R2Fd77faqJXmfEmw6Ix4BU9e0XsFKD/kyd/G7pELrWqi7jE+kdRATERQs
	4CXPxzXErklAaI+x6FwShh1lyqazwBsdeR4sUgJbjFpyW2XOEAkJM3OpXnxMnERiWeKKEtWWw4SiE
	RmpFDTvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0cn-00000002qUr-2Q5Y;
	Tue, 24 Feb 2026 22:11:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0cm-00000002qUT-23z7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 22:11:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7402460097;
	Tue, 24 Feb 2026 22:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D50C19425;
	Tue, 24 Feb 2026 22:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771971083;
	bh=6ZqYqq4IRN85KW12SiEIDbmT9hRIl6C7svor3k6zd5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxM7NCjhcWEDiqpj9bDwCgF7TJxK+cKbBrZfC9Myv2ik90QROYMa47BYsrUudAtH2
	 hUBKPBdJwYD47iETy9y3oJts3e0+LXquOb4zOT86xxalFU/jxXhJCGoE6sp6mXyAgP
	 5i4v3MqQzN6zOH2BzHOMpjoCcHEwfCRfFya25wgbuulo8P6UJGIuVy6XURO1ur1i7H
	 d2g4HU6isRIIlsNG+MyWxWiTkzqJles1AJp6J79/v+6V9CEnNaSBXJOXaBMMOD/BnU
	 8eX5CBGXFckqZgCAfK9x8KmKvOAD+CepXe3DTMoQ0gJkPHsW4ihoI3bIsV+6x4T1so
	 XHd1D4/RYriPQ==
Date: Tue, 24 Feb 2026 22:11:18 +0000
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: bpf: Fix UBSAN misaligned access in BPF JIT
Message-ID: <aZ4iBlzQ7kyxByg2@willie-the-truck>
References: <20260224092915.1925488-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224092915.1925488-1-tabba@google.com>
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

On Tue, Feb 24, 2026 at 09:29:15AM +0000, Fuad Tabba wrote:
> struct bpf_plt contains a u64 'target' field. The BPF JIT allocator
> was using an alignment of 4 bytes (sizeof(u32)), which could lead
> to the 'target' field being misaligned in the JIT buffer.
> 
> Increase the alignment requirement to 8 bytes (sizeof(u64)) in
> bpf_jit_binary_pack_alloc() to guarantee proper alignment for
> struct bpf_plt.
> 
> Fixes: b2ad54e1533e9 ("bpf, arm64: Implement bpf_arch_text_poke() for arm64")
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/net/bpf_jit_comp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> index 356d33c7a4ae..adf84962d579 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -2119,7 +2119,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>  	extable_offset = round_up(prog_size + PLT_TARGET_SIZE, extable_align);
>  	image_size = extable_offset + extable_size;
>  	ro_header = bpf_jit_binary_pack_alloc(image_size, &ro_image_ptr,
> -					      sizeof(u32), &header, &image_ptr,
> +					      sizeof(u64), &header, &image_ptr,
>  					      jit_fill_hole);

Did you see a functional issue with this or are you just trying to squash
a UBSAN splat? I can't see an issue with the code and it seems a bit
over-the-top to over-align the whole JIT buffer just because of structure
alignment rules that don't really make sense for the actual PLT.

Does marking 'struct bpf_plt' as __packed help?

Will

