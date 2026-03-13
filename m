Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D75B106FD66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 02:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHMmieepRvO2atiAhZKhFUtPs6xWXbKu4a1I0DCXNzM=; b=Ib5qY8kCmBvH3fG0YKETCbyUiK
	nZYWLTWPsuFvWXsVgds2BOfTYUeHZqioFXK5AcyQOnUNFGffDRxtBzt3xC7AM6SlMlMuXmdopbxkk
	qPBfT2GeqdKhb4i+Wj6mXpgb5ksLLDYgko+RFSHfubJf9KPmUYg3EwH+Y0zmcOw45L/BFzUiJ+OdI
	OuD+rWIm9pxUTtGZe+i5b9chiRmsyWvQ1SGL3Ys+USluOTgZPDq0eHKju5XCaoul3eSIYWWUvtoGH
	VSuk+/WBmeA2/BvtFMJ6SOjjO8fpUlm7Zfk8pNCFlrbeyD1DjktL7jsouf2iPpkNLlt6VYDhZAKzH
	D4VIqbTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sKK-0000000GFOG-1A3W;
	Fri, 13 Mar 2026 02:32:37 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sKF-0000000GFMN-1qHc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 02:32:34 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fX7mM0GV7zKHLxk
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 10:32:03 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 5337E4056F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 10:32:22 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP4 (Coremail) with SMTP id gCh0CgCngEs0d7NpbWnZAg--.21976S2;
	Fri, 13 Mar 2026 10:32:21 +0800 (CST)
Message-ID: <6538d913-7341-47bb-8717-3ef8685caf5d@huaweicloud.com>
Date: Fri, 13 Mar 2026 10:32:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v9 1/5] bpf: Move constants blinding out of
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
References: <20260312170255.3427799-2-xukuohai@huaweicloud.com>
 <23f4b038b245167ff440b79c0a445fcbc12e0a102884759623dd59b3d64d2ade@mail.kernel.org>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <23f4b038b245167ff440b79c0a445fcbc12e0a102884759623dd59b3d64d2ade@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: gCh0CgCngEs0d7NpbWnZAg--.21976S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFWUKrWDWFWfKw4DtFW3GFg_yoW5AF4rpa
	y0gFWkKF4qqF40qw17ZFWkAFW3tF4kJwnrGr45Wa43JF4jgrn3GF18KrsYvFWYkrykKr1I
	vr4j9r98uw1DJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8
	Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUVZ2-UUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_193231_835152_11B8B631 
X-CRM114-Status: GOOD (  19.21  )
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

On 3/13/2026 1:50 AM, bot+bpf-ci@kernel.org wrote:
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 4fbacd2149cd..3ccefd13121b 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
> 
> [ ... ]
> 
>> @@ -22843,17 +22843,23 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
>>
>>   static int jit_subprogs(struct bpf_verifier_env *env)
>>   {
>> -	struct bpf_prog *prog = env->prog, **func, *tmp;
>> +	struct bpf_prog *orig_prog = env->prog, *prog, **func, *tmp;
>>   	int i, j, subprog_start, subprog_end = 0, len, subprog;
>>   	struct bpf_map *map_ptr;
>>   	struct bpf_insn *insn;
>>   	void *old_bpf_func;
>>   	int err, num_exentries;
>> -	int old_len, subprog_start_adjustment = 0;
>> +	bool blinded = false;
>>
>>   	if (env->subprog_cnt <= 1)
>>   		return 0;
>>
>> +	prog = bpf_jit_blind_constants(env, NULL);
>> +	if (IS_ERR(prog))
>> +		return -ENOMEM;
>> +	if (prog != orig_prog)
>> +		blinded = true;
> 
> When env is non-NULL, bpf_jit_blind_constants() uses
> bpf_patch_insn_data() to insert blinding instructions.
> bpf_patch_insn_data() calls adjust_insn_aux_data(), which expands
> and shifts entries in env->insn_aux_data to match the now-longer
> blinded program.
> 
>> +
>>   	for (i = 0, insn = prog->insnsi; i < prog->len; i++, insn++) {
> 
> [ ... ]
> 
>> @@ -23114,6 +23122,10 @@ static int jit_subprogs(struct bpf_verifier_env *env)
>>   	}
>>   	kfree(func);
>>   out_undo_insn:
>> +	if (blinded) {
>> +		bpf_jit_prog_release_other(orig_prog, prog);
>> +		env->prog = prog = orig_prog;
>> +	}
>>   	/* cleanup main prog to be interpreted */
>>   	prog->jit_requested = 0;
>>   	prog->blinding_requested = 0;
>> +	for (i = 0, insn = prog->insnsi; i < prog->len; i++, insn++) {
>>   		if (!bpf_pseudo_call(insn))
>>   			continue;
>>   		insn->off = 0;
>>   		insn->imm = env->insn_aux_data[i].call_imm;
>>   	}
> 
> After bpf_jit_prog_release_other() reverts to orig_prog, this loop
> iterates using the original program's indices and length. However,
> env->insn_aux_data was expanded and shifted by bpf_patch_insn_data()
> during blinding to match the blinded program's instruction count.
> 
> The call_imm values were saved at blinded indices (earlier in
> jit_subprogs, after the bpf_jit_blind_constants call), so reading
> them back at original indices gets the wrong aux data entries.
> 
> On !CONFIG_BPF_JIT_ALWAYS_ON configs, could this cause incorrect
> imm values to be restored into pseudo_call instructions, breaking
> interpreter fallback?
> 

Right, I overlooked that insn_aux_data is used here. In fact, when
blinded is true, we have rolled back to the clean, original program,
so there is no need to restore call_imm.

> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/23013190773


