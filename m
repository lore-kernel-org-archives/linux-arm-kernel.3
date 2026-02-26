Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7ECFD8FF9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4rF/X8aea67hZOXMT+UYba+SqW5LVeTU8PgivEoaeo=; b=iIOoOwNU2wyzcrRu85oaj8IUx5
	wiyeIhDXzQr6iQJr0644+xHPHGoE08+6w6kaQH/uM36mWwBr+qK3pZ5iutJCt2oPl6VREf+bhKL93
	HcEWiO461TUxfwUmMkM30ij3nPUXhtzu1zP53Lxys5ZSmymEvuuEsZ/JkC3ydvosvqKH24Q+pcr+N
	a9pZCatuMBlGRrYNAFi+7kJgSPTXDXsEPQ+MNCzK8EBtt7L86pSVR8zpvH7mzOcROu+jFHoKPX5Al
	rO+zNUzdroFkjzXPrgfl19+g3/4hhplPAjjtkcm0Ijuuqer/+S/VNFvBkWBi/ERVmOtgbbiprtVnD
	tMrUsfAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvg6M-00000006xom-2OpK;
	Thu, 26 Feb 2026 18:28:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvg6K-00000006xoN-2LkF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 18:28:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFC8944455;
	Thu, 26 Feb 2026 18:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C55C116C6;
	Thu, 26 Feb 2026 18:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772130519;
	bh=oeZrAgJFMwqGZHSjk5nZ3zbz2F6r/nSnzcy3tZ0eXY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8/1orjP1X94HWjRzto4h4vmRPu2QG8g68OkYZOh24/S+GensgXNzGqQ29TavR1ib
	 9aICWL1knlGq7TcrGD93EPt0C2UHmvYu2/wEmEHh+CUqbKh6pYCzxAX1OZPKBIz/57
	 Q+WW2p+w151zgGRO9zQVB8poh/U4D4TyydM+M9lZ0YTlw8WPxypZlPkLJh1FZC7Ii0
	 m1izZdv36Z4ZK28DAFU/SoRJySegWXfkIllPjpTnuEkvuBfVbpAK0GDRfBqFmjPkdk
	 NjoPr5QZ6xl6x2TdLVE2FPGR9yMZECx5wosnswAtSkx5mxQtcuXYpAW13fVMqope4i
	 1uMzB6mmLBL2Q==
Date: Thu, 26 Feb 2026 18:28:32 +0000
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Jean-Philippe Brucker <jpb@kernel.org>
Subject: Re: [PATCH v3] arm64: bpf: Force 8-byte alignment for JIT buffer to
 prevent atomic tearing
Message-ID: <aaCQ0M9h1QfCPKGb@willie-the-truck>
References: <8b7050b7-f2ad-4237-890c-76fc13dc0189@huaweicloud.com>
 <20260226075525.233321-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226075525.233321-1-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_102840_637329_EDB8E0DE 
X-CRM114-Status: GOOD (  20.45  )
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

On Thu, Feb 26, 2026 at 07:55:25AM +0000, Fuad Tabba wrote:
> struct bpf_plt contains a u64 target field. Currently, the BPF JIT
> allocator requests an alignment of 4 bytes (sizeof(u32)) for the JIT
> buffer.
> 
> Because the base address of the JIT buffer can be 4-byte aligned (e.g.,
> ending in 0x4 or 0xc), the relative padding logic in build_plt() fails
> to ensure that target lands on an 8-byte boundary.
> 
> This leads to two issues:
> 1. UBSAN reports misaligned-access warnings when dereferencing the
>    structure.
> 2. More critically, target is updated concurrently via WRITE_ONCE() in
>    bpf_arch_text_poke() while the JIT'd code executes ldr. On arm64,
>    64-bit loads/stores are only guaranteed to be single-copy atomic if
>    they are 64-bit aligned. A misaligned target risks a torn read,
>    causing the JIT to jump to a corrupted address.
> 
> Fix this by increasing the allocation alignment requirement to 8 bytes
> (sizeof(u64)) in bpf_jit_binary_pack_alloc(). This anchors the base of
> the JIT buffer to an 8-byte boundary, allowing the relative padding math
> in build_plt() to correctly align the target field.
> 
> Fixes: b2ad54e1533e ("bpf, arm64: Implement bpf_arch_text_poke() for arm64")
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
>  	if (!ro_header) {
>  		prog = orig_prog;

Acked-by: Will Deacon <will@kernel.org>

Will

