Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9B9F531EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 03:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYL2d0CGzKYbA+ydZnz9FwU6gKd+55O84czAxN9QH2c=; b=yZp0nnLfSlXgXOriCrIYYHOxtV
	D6ED2yhnjtWzceJvXQTgOT1u8V6dbdOQ7hICB1mmP1XJpi17yYj7FMXWjeN/Np3LPvMTmtZ41vZ46
	3ljsQ7W8hQYxWtFHShnd6DkKCGzoeWhIZEZHVtwUjAA2IZAPxZOA4TvSNISKsAG+euLCUbZIH7LSZ
	jAbcsvMPDRedDeMjyTRhciW+uHvgLvotWZWL+WOFS7QWBlJKfNmtFhahm9Hu576oh/TojZ06Y/din
	8lPgbFmZVZ+Ro4bYwpNvRrzXufg9/tFSnjKkP+Cz8BAzmm14gaQJ/W2KyjARecZRKT+uHpvSvsInR
	WTVm7TtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUKD-0000000GdNX-0TUx;
	Tue, 14 Apr 2026 03:20:29 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUK9-0000000GdNC-1Mp6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 03:20:28 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fvqJQ2rp2zYQtg5
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 11:19:34 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 141364056B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 11:20:18 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP3 (Coremail) with SMTP id _Ch0CgA3Mrxwst1pANJVAQ--.64448S2;
	Tue, 14 Apr 2026 11:20:17 +0800 (CST)
Message-ID: <349fd6fd-97c8-4d80-8f2f-af5a9c7d3be9@huaweicloud.com>
Date: Tue, 14 Apr 2026 11:20:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v14 1/5] bpf: Move constants blinding out of
 arch-specific JITs
Content-Language: en-US
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com,
 yonghong.song@linux.dev, puranjay@kernel.org, a.s.protopopov@gmail.com,
 alexis.lothore@bootlin.com, list+bpf@vahedi.org, linux@armlinux.org.uk,
 yangtiezhu@loongson.cn, hengqi.chen@gmail.com,
 johan.almbladh@anyfinetworks.com, paulburton@kernel.org,
 hbathini@linux.ibm.com, chleroy@kernel.org, naveen@kernel.org,
 luke.r.nels@gmail.com, xi.wang@gmail.com, bjorn@kernel.org,
 pulehui@huawei.com, iii@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 davem@davemloft.net, udknight@gmail.com, martin.lau@kernel.org,
 clm@meta.com, ihor.solodrai@linux.dev
References: <7d88904b4028cbe124bbaba5739c525663bedc64.1776062885.git.xukuohai@hotmail.com>
 <fa46a9034904c7622f935d3e3a60264a37afda290705f40c816c9846c9d3f3f8@mail.kernel.org>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <fa46a9034904c7622f935d3e3a60264a37afda290705f40c816c9846c9d3f3f8@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _Ch0CgA3Mrxwst1pANJVAQ--.64448S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZry7Kr45urykXrWUCr4UJwb_yoW5ZrW5pF
	y8tFy7CF4qqFs7tw47XF48W3yYqw4rXFW3CF98Wryxtrn8XrykWr4fKrWa9FW3Ar90yrWF
	vFs0grySka4DuFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_Wrv_ZF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4U
	JwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	EksDUUUUU==
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_202025_749940_BD516768 
X-CRM114-Status: GOOD (  25.73  )
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

On 4/13/2026 9:47 PM, bot+bpf-ci@kernel.org wrote:
>> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
>> index 066b86e7233c..fc9fb3c07866 100644
>> --- a/kernel/bpf/core.c
>> +++ b/kernel/bpf/core.c
> 
> [ ... ]
> 
>>   /**
>>    *	bpf_prog_select_runtime - select exec runtime for BPF program
>>    *	@fp: bpf_prog populated with BPF program
> 
> [ ... ]
> 
>> -	/* eBPF JITs can rewrite the program in case constant
>> -	 * blinding is active. However, in case of error during
>> -	 * blinding, bpf_int_jit_compile() must always return a
>> -	 * valid program, which in this case would simply not
>> -	 * be JITed, but falls back to the interpreter.
>> -	 */
>> +	/* eBPF JITs can rewrite the program in case constant
>> +	 * blinding is active. However, in case of error during
>> +	 * blinding, bpf_int_jit_compile() must always return a
>> +	 * valid program, which in this case would simply not
>> +	 * be JITed, but falls back to the interpreter.
>> +	 */
> 
> This isn't a bug, but this comment still references bpf_int_jit_compile()
> even though the code now calls bpf_prog_jit_compile(). Should this be
> updated to match?
>

This comment is not touched by the patch, it was already there before
the patch, so I'd leave it as is.

>> -		fp = bpf_int_jit_compile(fp);
>> +		fp = bpf_prog_jit_compile(fp);
> 
>> diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
>> index 67c9b28767e1..ec8afd6a9369 100644
>> --- a/kernel/bpf/fixups.c
>> +++ b/kernel/bpf/fixups.c
> 
> [ ... ]
> 
>> +out_jit_err:
>> +	if (blinded) {
>> +		bpf_jit_prog_release_other(orig_prog, prog);
>> +		/* roll back to the clean original prog */
>> +		prog = env->prog = orig_prog;
>> +		goto out_restore;
>> +	} else {
>> +		if (err != -EFAULT) {
>> +			/*
>> +			 * We will fall back to interpreter mode when err is not -EFAULT, before
>> +			 * that, insn->off and insn->imm should be restored to their original
>> +			 * values since they were modified by __jit_subprogs.
>> +			 */
> 
> The comment references __jit_subprogs, but the function is named
> jit_subprogs (no double underscore prefix). Should this be updated?
>

Yes, it should be jit_subprogs.

In addition, sashiko reported an issue that subprog_start of the fake
exit subprog is not restored on the rollback path. It said that
bpf_fixup_call_args() relies on this sentinel to detect the end of the
last subprog. I checked the bpf_fixup_call_args() function and its child
functions, but could not find any usage of the sentinel.

IIUC, the sentinel is only used to compute the length of the last subprog
and is not used after jit_subprogs fails, so not restoring it does not
to be a real issue.

However, leaving the sentinel unrestored seems error-prone, and for code
consistency, I'll restore it in the next version.

>> +			for (i = 0, insn = prog->insnsi; i < prog->len; i++, insn++) {
>> +				if (!bpf_pseudo_call(insn))
>> +					continue;
>> +				insn->off = 0;
>> +				insn->imm = env->insn_aux_data[i].call_imm;
>> +			}
>> +		}
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/24345549165


