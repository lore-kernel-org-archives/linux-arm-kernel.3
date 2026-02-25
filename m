Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D634F55437
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 01:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZ4XXZL7lT96TmR0ffAevVkG/skpYnSpH0SvrbdV4CY=; b=B37jSnRaTPljts76sMmLucX+sI
	friI9y6z13GRq2923yxSpxEi99ieEShdqBkzTvGPHyU5VR2EZtt4AOzkDxYy4kseb4XmtaBO6p7UO
	sLJDQ6TIv3pYB4dG07E7Q4qjBkrHBuBbhRodUgOTBpqCP5ahc5gYl5DP0EDdqMBoVfVpNuIEdx2zv
	QPLzNLe6ang0Fok3EbVVJLXg3GIadJzhTLhaFPX6ofjPQOPn8vLDueP88AY1B4PBK6wVwXuu615Ae
	MHqHJbmm03sJ+DwMbaGn0TI9NCyGxvFjIYCiVdpDVw3iSytbesEm7Y78dD9mCRu7n2VzGsfRKF5Wc
	vR6p69YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv3w5-000000032zU-2pmp;
	Wed, 25 Feb 2026 01:43:33 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv3w2-000000032yA-2acq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 01:43:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fLHQM0nCHzKHMTN
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:42:19 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 27DAC40577
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:43:14 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP1 (Coremail) with SMTP id cCh0CgB3MOawU55pvV0aIg--.2510S2;
	Wed, 25 Feb 2026 09:43:13 +0800 (CST)
Message-ID: <c402e95a-26d3-47eb-8249-52ece97989d3@huaweicloud.com>
Date: Wed, 25 Feb 2026 09:43:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: bpf: Fix UBSAN misaligned access in BPF JIT
Content-Language: en-US
To: Fuad Tabba <tabba@google.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Puranjay Mohan <puranjay@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>,
 Jean-Philippe Brucker <jpb@kernel.org>
References: <20260224093128.1926610-1-tabba@google.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <20260224093128.1926610-1-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: cCh0CgB3MOawU55pvV0aIg--.2510S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw45Zw45Gw1kJrWrGr48JFb_yoW8Xw1rpa
	yDGwnIyFWqgr4jga18ta1DCrW5ua1vqF43GFyUG3yrtF98Xr97WF15K343uFZxGrZ8Gw4f
	ZFyUKr13u3WkJrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	s2-5UUUUU==
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_174330_960537_FB249274 
X-CRM114-Status: GOOD (  15.40  )
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

On 2/24/2026 5:31 PM, Fuad Tabba wrote:
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
>   arch/arm64/net/bpf_jit_comp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> index 356d33c7a4ae..adf84962d579 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -2119,7 +2119,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>   	extable_offset = round_up(prog_size + PLT_TARGET_SIZE, extable_align);
>   	image_size = extable_offset + extable_size;
>   	ro_header = bpf_jit_binary_pack_alloc(image_size, &ro_image_ptr,
> -					      sizeof(u32), &header, &image_ptr,
> +					      sizeof(u64), &header, &image_ptr,
>   					      jit_fill_hole);
>   	if (!ro_header) {
>   		prog = orig_prog;

Good catch. build_plt pads NOP instructions to ensure a 64-bit relative offset for
plt target, but it misses the alignment check for image base itself.

Acked-by: Xu Kuohai <xukuohai@huaweicloud.com>

nit: Add check for base alignment in build_plt, or a comment to clarify?


