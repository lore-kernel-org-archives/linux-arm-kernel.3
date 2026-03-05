Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4B1EB7ED2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8r5jN4v6lMcK9U5h1NBAmfnlG14mxZIduaXYUOJ9Z84=; b=yMioibcGENx8s9ZO5vcWH9hJ9A
	DJIu5HWigtC6DZOqypM5zbLBD47fGLjr1UX5ZvkZNMQwJbWDE779Znlt+SGMbwoCjsHq3Fu+wKook
	XxZ0LXoOD4j8RUOCwL03l49z/bp8S4SmlZ/feRLxKT0pDQaR2XeGUNIpenLZgYkpoJ6RVEGAAwFgF
	/6KQxdJcAzvuWe9rX3msKeQQhYCaJWKXO4WuChOPc5b/KQOsoGGH+Tz+P3NvjxBfr8j/uWNgzul7v
	SHS0N3ei5cnTWlFLE8Ae4+fnCucTWuTEAW7i8TLcrGz24JtbMhuxEHAvuYmFA9dHdd3QoQv8l5e7R
	x1k/qwbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzgP-00000000s3l-0QHv;
	Thu, 05 Mar 2026 03:47:29 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzgL-00000000s3C-218L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 03:47:27 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fRFpk6QcKzKHMKh
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 11:47:10 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id CA16540575
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 11:47:17 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP3 (Coremail) with SMTP id _Ch0CgDHFRTE_KhpEeyxJQ--.41212S2;
	Thu, 05 Mar 2026 11:47:17 +0800 (CST)
Message-ID: <0f18b3b1-9bd1-4ce8-a7df-c1149cf6e14d@huaweicloud.com>
Date: Thu, 5 Mar 2026 11:47:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v5 3/5] bpf: Add helper to detect indirect jump
 targets
Content-Language: en-US
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Yonghong Song <yonghong.song@linux.dev>, Puranjay Mohan
 <puranjay@kernel.org>, Anton Protopopov <a.s.protopopov@gmail.com>
References: <20260302102726.1126019-1-xukuohai@huaweicloud.com>
 <20260302102726.1126019-4-xukuohai@huaweicloud.com>
 <CAADnVQLoWzz8ioVg3MFjn08fBLfNq6HdvqLtqXV0zUb=SR_HGA@mail.gmail.com>
 <1ea52c33-ae27-45fb-b4ff-0c4637a4312a@huaweicloud.com>
 <CAADnVQ+HvsZ0zr6AGLBhMOVX1uRKwRqV28ywcvpVkrsDTyaXmw@mail.gmail.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <CAADnVQ+HvsZ0zr6AGLBhMOVX1uRKwRqV28ywcvpVkrsDTyaXmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _Ch0CgDHFRTE_KhpEeyxJQ--.41212S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF17Cw45Xry3Kr48CF4kZwb_yoW8CF1rpa
	4DXayUAF4Uta1Yvw12gr40yrWagr47Xwn0ya45WrWUAr9FgFn3JF4UKr4Fkas8trW5AF1I
	qr42vrZxuFy3GFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUF1
	v3UUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_194725_875689_C79F703E 
X-CRM114-Status: GOOD (  13.69  )
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

On 3/4/2026 11:37 PM, Alexei Starovoitov wrote:
> On Wed, Mar 4, 2026 at 4:46 AM Xu Kuohai <xukuohai@huaweicloud.com> wrote:
>>
>> On 3/4/2026 1:19 AM, Alexei Starovoitov wrote:
>>
>> [...]
>>
>>>> -       for (i = 0; i < insn_cnt; i++, insn++) {
>>>> +       for (i = 0, j = 0; i < insn_cnt; i++, j++, insn++) {
>>>> +               env->insn_aux_data[subprog_start + j].final_idx = i;
>>>>                   if (bpf_pseudo_func(insn)) {
>>>>                           /* ld_imm64 with an address of bpf subprog is not
>>>>                            * a user controlled constant. Don't randomize it,
>>>> @@ -1512,6 +1542,8 @@ struct bpf_prog *bpf_jit_blind_constants(struct bpf_verifier_env *env, struct bp
>>>>                            */
>>>>                           insn++;
>>>>                           i++;
>>>> +                       j++;
>>>> +                       env->insn_aux_data[subprog_start + j].final_idx = i;
>>>
>>> You're adding final_idx because bpf_jit_blind_constants()
>>> doesn't call adjust_insn_aux_data() ?
>>>
>>
>> Yes, I added final_idx because insn_aux is not updated here.
>>
>>> imo that's an ugly workaround. Just call adjust_insn_aux_data().
>>>
>>
>> If we adjust the env->insn_aux_data here, should we also adjust the global
>> env->prog->insnsi array? I think env->insn_aux_data should remain consistent
>> with the global env->prog->insnsi array. Since constant blinding only rewrites
>> the subprog's private instruction array, updating the env->insn_aux_data
>> causes a mismatch with the global state.
> 
> yes, and subprog starts, and pokes that bpf_patch_insn_data() do.
> 
> blinding was implemented long before that, so it was never updated.

I see. Since env->prog->insnsi is rewritten by blind_constants now, would it
make sense to move constant blinding to the beginning of jit_subprogs, just
before the global instruction array is split into subprog copies?

This would eliminate the need to invoke constant blinding per subprog from
the arch-specific JIT, simplifying the overall flow.


