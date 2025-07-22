Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7208EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 03:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AnGCMFAqGW9vUukxpA24CKmaL5jyltaCgpg5QidKpQ=; b=viR+ePz4x+VyD0qyfFOvh7UHw2
	b8LmyXlJf6NRDZ4r3odBYWHkxu79fOnJ7JAkAiHUWfBGA/v3w9NaGTt7TsuSiPDM1G89raujsndxk
	I9g84kEO5KOcUUk8DBi7J99wV9RjIlTRjCB0bhVr3zDj7N6HojB/De8pCixifWVW2aUDIWJpyDf4x
	jGRHHM57v/NeoP+cBFBhxAo06Taahzib9X0JDh6CjdgtvOvCDjhDiVWKb6e698SV0HgGdLBACdPJB
	kqopqIfo+2udqkcHtP1KzPiHEpioD1du3w1nvWvr7sp0bQd0kbSIGOmYUWKocux9z5CWoaoz11xQA
	EYDiBAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3yO-00000001CTC-00HW;
	Tue, 22 Jul 2025 03:47:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3vw-00000001CMe-1Mtv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Jul 2025 03:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5AnGCMFAqGW9vUukxpA24CKmaL5jyltaCgpg5QidKpQ=; b=AEFj99KJn5BbzVMKEqy3wD/cU/
	subXRoth3FNqsIsCMhgapGvuHc/Iu5ASI4KaV5B9xWVisUMmEaxrVOtVwqAfB4l0uTZf+e9DRXueL
	gKD2ubu7Pyead37i221AYWFVuGhigVRhhIzBdkPJO7oCMgKtPSKWKrsmAk69LQgiF6GGTcpWLhKBR
	3pIInzl9+eDuTyDicC2JfmvgO9x66dP5mpZ6CRcCJS50h5CZJp0tSpbqsx7w+JvoLAUuaqm1bcV2y
	/npz4vVozHga50QviH98Yw8YkzX9nQJJuL+acy3TPZsX6lU+SSZKVdaYSTOivdn4iAw+frKsPJPOz
	VCOPAmKg==;
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3vr-0000000BBpE-1Ta7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 03:44:50 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4bmNRx4yvTzKHMwL
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 11:44:29 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 64F461A136C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 11:44:28 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP2 (Coremail) with SMTP id Syh0CgB3NbcaCX9oTy09BA--.44017S2;
	Tue, 22 Jul 2025 11:44:28 +0800 (CST)
Message-ID: <74bd0822-c8c1-47cc-b816-78036abff8ee@huaweicloud.com>
Date: Tue, 22 Jul 2025 11:44:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v12 3/3] arm64/cfi,bpf: Support kCFI + BPF on
 arm64
To: Sami Tolvanen <samitolvanen@google.com>, bpf@vger.kernel.org,
 Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxwell Bland <mbland@motorola.com>, Puranjay Mohan <puranjay12@gmail.com>,
 Dao Huang <huangdao1@oppo.com>
References: <20250721202015.3530876-5-samitolvanen@google.com>
 <20250721202015.3530876-8-samitolvanen@google.com>
Content-Language: en-US
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <20250721202015.3530876-8-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: Syh0CgB3NbcaCX9oTy09BA--.44017S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF1rZw1kZFWfGw4rJrW7XFb_yoWruF1fpa
	yDu3WrCr4kXry7GFWUJ3WavF15Kw4kXF1YkryUu34Ykr9F9rykGFn0gr98uFWrCrW09w4r
	Xa4q9rn09a1DA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
	ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1
	7KsUUUUUU==
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_044448_746565_DE739606 
X-CRM114-Status: GOOD (  26.85  )
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

On 7/22/2025 4:20 AM, Sami Tolvanen wrote:
> From: Puranjay Mohan <puranjay12@gmail.com>
> 
> Currently, bpf_dispatcher_*_func() is marked with `__nocfi` therefore
> calling BPF programs from this interface doesn't cause CFI warnings.
> 
> When BPF programs are called directly from C: from BPF helpers or
> struct_ops, CFI warnings are generated.
> 
> Implement proper CFI prologues for the BPF programs and callbacks and
> drop __nocfi for arm64. Fix the trampoline generation code to emit kCFI
> prologue when a struct_ops trampoline is being prepared.
> 
> Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> Co-developed-by: Maxwell Bland <mbland@motorola.com>
> Signed-off-by: Maxwell Bland <mbland@motorola.com>
> Co-developed-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Tested-by: Dao Huang <huangdao1@oppo.com>
> Acked-by: Will Deacon <will@kernel.org>
> ---
>   arch/arm64/include/asm/cfi.h  |  7 +++++++
>   arch/arm64/net/bpf_jit_comp.c | 22 +++++++++++++++++++---
>   2 files changed, 26 insertions(+), 3 deletions(-)
>   create mode 100644 arch/arm64/include/asm/cfi.h
> 
> diff --git a/arch/arm64/include/asm/cfi.h b/arch/arm64/include/asm/cfi.h
> new file mode 100644
> index 000000000000..ab90f0351b7a
> --- /dev/null
> +++ b/arch/arm64/include/asm/cfi.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_ARM64_CFI_H
> +#define _ASM_ARM64_CFI_H
> +
> +#define __bpfcall
> +
> +#endif /* _ASM_ARM64_CFI_H */
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> index 89b1b8c248c6..f4a98c1a1583 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -10,6 +10,7 @@
>   #include <linux/arm-smccc.h>
>   #include <linux/bitfield.h>
>   #include <linux/bpf.h>
> +#include <linux/cfi.h>
>   #include <linux/filter.h>
>   #include <linux/memory.h>
>   #include <linux/printk.h>
> @@ -166,6 +167,12 @@ static inline void emit_bti(u32 insn, struct jit_ctx *ctx)
>   		emit(insn, ctx);
>   }
>   
> +static inline void emit_kcfi(u32 hash, struct jit_ctx *ctx)
> +{
> +	if (IS_ENABLED(CONFIG_CFI_CLANG))
> +		emit(hash, ctx);

I guess this won't work on big-endian cpus, since arm64 instructions
are always stored in little-endian, but data not.

> +}
> +
>   /*
>    * Kernel addresses in the vmalloc space use at most 48 bits, and the
>    * remaining bits are guaranteed to be 0x1. So we can compose the address
> @@ -476,7 +483,6 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
>   	const bool is_main_prog = !bpf_is_subprog(prog);
>   	const u8 fp = bpf2a64[BPF_REG_FP];
>   	const u8 arena_vm_base = bpf2a64[ARENA_VM_START];
> -	const int idx0 = ctx->idx;
>   	int cur_offset;
>   
>   	/*
> @@ -502,6 +508,9 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
>   	 *
>   	 */
>   
> +	emit_kcfi(is_main_prog ? cfi_bpf_hash : cfi_bpf_subprog_hash, ctx);
> +	const int idx0 = ctx->idx;

move the idx0 definition back to its original position to match the
coding style of the rest of the file?

> +
>   	/* bpf function may be invoked by 3 instruction types:
>   	 * 1. bl, attached via freplace to bpf prog via short jump
>   	 * 2. br, attached via freplace to bpf prog via long jump
> @@ -2055,9 +2064,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>   		jit_data->ro_header = ro_header;
>   	}
>   
> -	prog->bpf_func = (void *)ctx.ro_image;
> +	prog->bpf_func = (void *)ctx.ro_image + cfi_get_offset();
>   	prog->jited = 1;
> -	prog->jited_len = prog_size;
> +	prog->jited_len = prog_size - cfi_get_offset();
>   
>   	if (!prog->is_func || extra_pass) {
>   		int i;
> @@ -2426,6 +2435,12 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
>   	/* return address locates above FP */
>   	retaddr_off = stack_size + 8;
>   
> +	if (flags & BPF_TRAMP_F_INDIRECT) {
> +		/*
> +		 * Indirect call for bpf_struct_ops
> +		 */
> +		emit_kcfi(cfi_get_func_hash(func_addr), ctx);
> +	}
>   	/* bpf trampoline may be invoked by 3 instruction types:
>   	 * 1. bl, attached to bpf prog or kernel function via short jump
>   	 * 2. br, attached to bpf prog or kernel function via long jump
> @@ -2942,6 +2957,7 @@ void bpf_jit_free(struct bpf_prog *prog)
>   					   sizeof(jit_data->header->size));
>   			kfree(jit_data);
>   		}
> +		prog->bpf_func -= cfi_get_offset();
>   		hdr = bpf_jit_binary_pack_hdr(prog);
>   		bpf_jit_binary_pack_free(hdr, NULL);
>   		WARN_ON_ONCE(!bpf_prog_kallsyms_verify_off(prog));


