Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0030EFEA82D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 07:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bn43dfMc0Q+XqpAsjfV6oBmed8Id2uRBMi6Vg4iFKlg=; b=YIHBGaBgQDyQ6ER8THtb06wQZi
	59Cqb773B8h3Kxqf1fXCQ2eOT2wn9KGoBXxoLJQrany3IxbG1aY4e0ttZE0+/MZIOtEpPMMzJga1/
	KmhbWHlvXIaMnq/JpK/nP67Hay+tklHgmHbWC2amAbRq5to4nZCDl9E1NAHEEAZHeQDO29A062ks8
	V+kshKcBhVWSoEbG6yppEdF24rCkeU2gVYKs7b1ef8rDatr50DjuaPXAGhNbDtSLdu3VJ5/6vbK5m
	wOi6a4zGKUagh6urVy/K9T29LrkAzNe7/R18aTz6H5HAl/vhg6Qbz+gxo81dL0MnnBOzFOhRA9UXP
	WyPx3RHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ixv-00000002sF5-0SDw;
	Wed, 25 Mar 2026 07:47:47 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ixs-00000002sDQ-31Pd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 07:47:46 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fgf9s5JKvzKHMfv
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 15:46:41 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 1B4CE4056D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 15:47:20 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP2 (Coremail) with SMTP id Syh0CgAXQAUGk8NpDDmXCA--.50986S2;
	Wed, 25 Mar 2026 15:47:19 +0800 (CST)
Message-ID: <5b24cd1d-a8cf-4c9c-a0c8-c79c10ea80e4@huaweicloud.com>
Date: Wed, 25 Mar 2026 15:47:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v10 1/5] bpf: Move constants blinding out of
 arch-specific JITs
Content-Language: en-US
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, yonghong.song@linux.dev,
 puranjay@kernel.org, a.s.protopopov@gmail.com, alexis.lothore@bootlin.com,
 list+bpf@vahedi.org, linux@armlinux.org.uk, yangtiezhu@loongson.cn,
 hengqi.chen@gmail.com, johan.almbladh@anyfinetworks.com,
 paulburton@kernel.org, hbathini@linux.ibm.com, chleroy@kernel.org,
 naveen@kernel.org, luke.r.nels@gmail.com, xi.wang@gmail.com,
 bjorn@kernel.org, pulehui@huawei.com, iii@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, davem@davemloft.net, udknight@gmail.com,
 martin.lau@kernel.org, clm@meta.com, ihor.solodrai@linux.dev
References: <20260324122052.342751-2-xukuohai@huaweicloud.com>
 <edfa617891aa2e2980ecfb8037a7a4ed069e518bbce1777e331c737024feb1da@mail.kernel.org>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <edfa617891aa2e2980ecfb8037a7a4ed069e518bbce1777e331c737024feb1da@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: Syh0CgAXQAUGk8NpDDmXCA--.50986S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr43CFW5uF17Kw4UWF1rZwb_yoW5tr1UpF
	yvqr4YkF4DtF1j9w47JF48CrWYqan8Kw17GFn5GayIyF4jqrykWF4Fgw45ZFyYqryvkw1I
	vr409r9Iga43urJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8
	Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	j6a0PUUUUU=
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_004745_136310_B37FD443 
X-CRM114-Status: GOOD (  22.21  )
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

On 3/24/2026 8:46 PM, bot+bpf-ci@kernel.org wrote:
>> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
>> index 67eb12b637a5..8f52f4b6c3af 100644
>> --- a/kernel/bpf/core.c
>> +++ b/kernel/bpf/core.c
> 
> [ ... ]
> 
>> @@ -1507,13 +1507,16 @@ static void adjust_insn_arrays(struct bpf_prog *prog, u32 off, u32 len)
>>   #endif
>>   }
>>
>> -struct bpf_prog *bpf_jit_blind_constants(struct bpf_prog *prog)
>> +struct bpf_prog *bpf_jit_blind_constants(struct bpf_verifier_env *env, struct bpf_prog *prog)
>>   {
> 
> [ ... ]
> 
>> -		tmp = bpf_patch_insn_single(clone, i, insn_buff, rewritten);
>> -		if (IS_ERR(tmp)) {
>> +		if (env)
>> +			tmp = bpf_patch_insn_data(env, subprog_start + i, insn_buff, rewritten);
>> +		else
>> +			tmp = bpf_patch_insn_single(clone, i, insn_buff, rewritten);
> 
> When env is non-NULL, bpf_patch_insn_data() adjusts env->insn_aux_data
> via adjust_insn_aux_data() and env->subprog_info via
> adjust_subprog_starts(). This shifts subprogram start positions to
> account for the expanded instructions.
>

Right, but only the subsequent subprogs are shifted, the current subprog
is not. Since we are patching the main prog when env is non-NULL, and
subprog_start is always 0 for a main prog, subprog_start is not needed
here and can be removed.

>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index cd008b146ee5..1b2b99f2d859 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
> 

[ ... ]


>>   	}
>>   	bpf_prog_jit_attempt_done(prog);
>>   	return err;
> 
> When blinded is true, the rollback restores env->prog to orig_prog, but
> env->subprog_info still holds the shifted start positions from blinding
> (adjusted by adjust_subprog_starts() in bpf_patch_insn_data()). The
> commit message states "env->insn_aux_data and env->subprog_info are no
> longer used after JIT failure." However, on configurations without
> CONFIG_BPF_JIT_ALWAYS_ON, fixup_call_args() falls through to the
> interpreter fixup loop after jit_subprogs() fails:
> 
> fixup_call_args() {
>      err = jit_subprogs(env);          /* fails, e.g. -ENOTSUPP */
>      ...
>      for (i = 0; i < prog->len; ...) {
>          ...
>          depth = get_callee_stack_depth(env, insn, i);
>      }
> }
> 
> get_callee_stack_depth() computes a target address from orig_prog's
> original instruction offsets and calls find_subprog(env, start). Since
> env->subprog_info start positions were shifted by blinding but the
> instruction addresses are from the unblinded orig_prog, find_subprog()
> fails to find a matching entry and returns -ENOENT, triggering a
> spurious "verifier bug" warning and rejecting the program.
> 
> Could env->subprog_info be restored alongside the prog rollback, or
> could jit_subprogs() return -EFAULT when blinding was active to skip
> the interpreter fallback path?
>

We can save and restore env->subprog_info. Since only the subprog start
values in the subprog_info array are adjusted by the patching function,
I will just back up the original values and restore them on failure,
without duplicating the full subprog_info array.

> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/23488858455


