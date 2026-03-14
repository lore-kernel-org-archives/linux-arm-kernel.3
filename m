Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF95107BCF1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 04:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sdKD20xgY6Kb/rlXOFtbEbjbRwTyrzRQeazg3na8kU=; b=4P0K/oqYwpIKiYMuABAWXSjz41
	veOB4s2o/ZucyQGL/UdeSR5aZfnebNnC26jREGn/2t46d99EhrF56MHFkbpU+OmXnKezpKqa4sIKR
	xZyxpuVlO7Od+MgjHRxd8CFkn97Bl7T9swqI/waK5JIwuI+AUib7ZtxHPtL9qAllflGAUsNW51IGn
	k5XO7aaAOY5YRqsh+pnmxo0QCkpz1I9l7C4i3+6cq+n0nUxoEmTKf4z5JhFtv+5AgqhWdhT/ltAfb
	pbBHDK0NvgYQuLykKVkxbA7/RCMZPMWmRdNal2xwDyIBBjuYCKCzYBZeXsVF+2QGk3HI7lPQLewEp
	zCizpOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1GVe-00000001TqJ-3wla;
	Sat, 14 Mar 2026 04:21:55 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1GVb-00000001Tpr-3R1s
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 04:21:54 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fXp7v5qtwzKHML1
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 12:21:15 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id BB7174056E
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 12:21:36 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP4 (Coremail) with SMTP id gCh0CgBXMEtP4rRp_YtdAw--.18235S2;
	Sat, 14 Mar 2026 12:21:36 +0800 (CST)
Message-ID: <09cdafd9-1876-4507-bc49-cfa2e9d049d5@huaweicloud.com>
Date: Sat, 14 Mar 2026 12:21:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v9 1/5] bpf: Move constants blinding out of
 arch-specific JITs
Content-Language: en-US
To: Eduard Zingerman <eddyz87@gmail.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Yonghong Song <yonghong.song@linux.dev>, Puranjay Mohan
 <puranjay@kernel.org>, Anton Protopopov <a.s.protopopov@gmail.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Shahab Vahedi <list+bpf@vahedi.org>, Russell King <linux@armlinux.org.uk>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Hengqi Chen <hengqi.chen@gmail.com>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Paul Burton <paulburton@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Christophe Leroy <chleroy@kernel.org>, Naveen N Rao <naveen@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Pu Lehui <pulehui@huawei.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "David S . Miller" <davem@davemloft.net>, Wang YanQing <udknight@gmail.com>
References: <20260312170255.3427799-1-xukuohai@huaweicloud.com>
 <20260312170255.3427799-2-xukuohai@huaweicloud.com>
 <4e4c3be9bfca85c5343834b5d6b1d6283fd6a1f5.camel@gmail.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <4e4c3be9bfca85c5343834b5d6b1d6283fd6a1f5.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgBXMEtP4rRp_YtdAw--.18235S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1kKFWkXF1fury3Cr4fuFg_yoWrtr15pF
	ykGF4xCrZ8Wa18KF1UX3WrXF4UAr4DWa17KrWjgFWUKF1DZry8XF13K3yUCa9xCrZYvw4r
	ZFZ09ry3C34vqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIF
	4iUUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_212152_232187_12E8B413 
X-CRM114-Status: GOOD (  29.26  )
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

On 3/14/2026 9:29 AM, Eduard Zingerman wrote:
> On Fri, 2026-03-13 at 01:02 +0800, Xu Kuohai wrote:
> 
> [...]
> 
>> diff --git a/arch/arc/net/bpf_jit_core.c b/arch/arc/net/bpf_jit_core.c
>> index 1421eeced0f5..973ceae48675 100644
>> --- a/arch/arc/net/bpf_jit_core.c
>> +++ b/arch/arc/net/bpf_jit_core.c
> 
> [...]
> 
>> @@ -229,12 +211,19 @@ static void jit_ctx_cleanup(struct jit_context *ctx)
>>   		ctx->bpf2insn_valid = false;
>>   
>>   	/* Freeing "bpf_header" is enough. "jit.buf" is a sub-array of it. */
>> -	if (!ctx->success && ctx->bpf_header) {
>> -		bpf_jit_binary_free(ctx->bpf_header);
>> -		ctx->bpf_header = NULL;
>> -		ctx->jit.buf    = NULL;
>> -		ctx->jit.index  = 0;
>> -		ctx->jit.len    = 0;
>> +	if (!ctx->success) {
>> +		if (ctx->bpf_header) {
>> +			bpf_jit_binary_free(ctx->bpf_header);
>> +			ctx->bpf_header = NULL;
>> +			ctx->jit.buf    = NULL;
>> +			ctx->jit.index  = 0;
>> +			ctx->jit.len    = 0;
>> +		}
>> +		if (ctx->is_extra_pass) {
> 
> Nit: The idea is that for !ctx->is_extra_pass
>       ctx->prog->bpf_func != NULL only when ctx->success is true, right?
>       Maybe just drop the condition?
>

No, when bpf_int_jit_compile() is called from bpf_prog_select_runtime(),
prog->bpf_func is set to interpreter function before the call starts. In
this case, prog->bpf_func should not be cleared by bpf_int_jit_compile()
on failure.

prog->bpf_func only needs to be cleared if it was previously set by
bpf_int_jit_compile() itself, which only occurs on the success of a
previous pass.


>> +			ctx->prog->bpf_func = NULL;
>> +			ctx->prog->jited = 0;
>> +			ctx->prog->jited_len = 0;
>> +		}
>>   	}
>>   
>>   	ctx->emit = false;
>> diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
>> index deeb8f292454..e6b1bb2de627 100644
>> --- a/arch/arm/net/bpf_jit_32.c
>> +++ b/arch/arm/net/bpf_jit_32.c
>> @@ -2144,9 +2144,7 @@ bool bpf_jit_needs_zext(void)
>>   
>>   struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>>   {
>> -	struct bpf_prog *tmp, *orig_prog = prog;
>>   	struct bpf_binary_header *header;
>> -	bool tmp_blinded = false;
>>   	struct jit_ctx ctx;
>>   	unsigned int tmp_idx;
>>   	unsigned int image_size;
> 
> The code in arch/arc is modified to do `... ctx->prog->jited = 0; ...`,
> but for arm32 there is no such modification. Why is that so?
>

arm32 JIT does not support bpf2bpf call, there is no extra_pass to check.
This is also the case for mips and x86_32.

> [...]
> 
>> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
>> index adf84962d579..cd5a72fff500 100644
>> --- a/arch/arm64/net/bpf_jit_comp.c
>> +++ b/arch/arm64/net/bpf_jit_comp.c
>> @@ -2009,14 +2009,12 @@ struct arm64_jit_data {
> 
> [...]
> 
>> @@ -2245,13 +2211,15 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>>   		kfree(jit_data);
>>   		prog->aux->jit_data = NULL;
>>   	}
>> -out:
>> -	if (tmp_blinded)
>> -		bpf_jit_prog_release_other(prog, prog == orig_prog ?
>> -					   tmp : orig_prog);
>> +
>>   	return prog;
>>   
>>   out_free_hdr:
>> +	if (extra_pass) {
>> +		prog->bpf_func = NULL;
>> +		prog->jited = 0;
>> +		prog->jited_len = 0;
>> +	}
> 
> Just for my understanding, is the following correct?
> - Previously, a call bpf_jit_blind_constants() always cloned the prog.

Not always, only when blinding is needed. In fact, cloning never occurs
in the extra pass.

> - Jits only set prog->jited to true upon successful compilation.
> - On error exit jits restored the original prog with it's prog->jited == 0.
>
> What happened in case of an extra pass?
> I'd expect that in case of an extra pass prog->jited would be true
> even before program is cloned by blind_constants() (and that's what
> arc code uses to figure out if the current pass is an extra pass).
> If so, old code would preserve prog->jited as true even in case of
> extra pass failure. Is that true or am I confused?
>

True, both prog->jited and prog->bpf_func set by the prveious pass are
not cleared on faliure of the extra pass.

> Just trying to understand why this patch has to deal with the above
> snippet at all. In case it is indeed necessary, it seems the logic
> should be similar for all jits, is there a way to push this snippet to
> some common code? E.g. in verifier.c where the extra pass is initiated.
>

Since the caller of bpf_int_jit_compile() checks prog->jited to dectermine
whether the JIT commpilation was success, I think bpf_int_jit_compile()
must ensure prog->jited is cleard on failure. So the clear logic should
be exeucted within bpf_int_jit_compile() itself.

> [...]


