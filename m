Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711E4EB7ECF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 12:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pSTR/vrjyUmMJUp5gkE5Gj7mN1CZUzkQPnXAuEjKyk=; b=Z0M31LjTCRr4izskphG+Wfn/gK
	s1dmD52rMo0U4rTfeGd42MFbrIHJlqKlJgXnk0mu+OThwvdbDSogDWoBe/36jZFsr5UxnMPXKYo0G
	vXCmIz24v7J2SIt/88V4XybKoz38eXLi4Vfk3+ir9fVSRllfx0a9NTyzd7S8eom0w7RvtVIbMba75
	74NUxs+oZbDOp5i8+zQW5bEvQESmT5xsq4d4jal5XaGAH1+zAdLl1DY61hy2shlkj8YOKBtwwGHNA
	JUAn/t5kQdXJdZy5vsT5tdhh/l1an2aCcqreHhUXVCynENDu01hggjCAMDKl+4oQ4+MG3hYsmTS03
	pgPGiR4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxlcF-0000000HCBu-3wGm;
	Wed, 04 Mar 2026 12:46:15 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxlcC-0000000HCBI-3W7o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 12:46:14 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fQspl5jTWzKHLv1
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 20:45:51 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id B621340576
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 20:45:57 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP1 (Coremail) with SMTP id cCh0CgBXEOaEKahpJ_6cJQ--.63728S2;
	Wed, 04 Mar 2026 20:45:57 +0800 (CST)
Message-ID: <1ea52c33-ae27-45fb-b4ff-0c4637a4312a@huaweicloud.com>
Date: Wed, 4 Mar 2026 20:45:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v5 3/5] bpf: Add helper to detect indirect jump
 targets
Content-Language: en-US
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Xu Kuohai <xukuohai@huaweicloud.com>
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
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <CAADnVQLoWzz8ioVg3MFjn08fBLfNq6HdvqLtqXV0zUb=SR_HGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgBXEOaEKahpJ_6cJQ--.63728S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFW7GF45Kr48Gr48ArW8Zwb_yoW8GFWxpa
	9rX3y5CF47ta1Y9r17WFy0yrWa9F4UJ3ZIkay5WrW8urW2grn5ZF4UKF4vy3s8trWft3Wx
	ur4j9rZ7CFsxCFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_044613_255845_B1A52599 
X-CRM114-Status: GOOD (  11.42  )
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

On 3/4/2026 1:19 AM, Alexei Starovoitov wrote:

[...]

>> -       for (i = 0; i < insn_cnt; i++, insn++) {
>> +       for (i = 0, j = 0; i < insn_cnt; i++, j++, insn++) {
>> +               env->insn_aux_data[subprog_start + j].final_idx = i;
>>                  if (bpf_pseudo_func(insn)) {
>>                          /* ld_imm64 with an address of bpf subprog is not
>>                           * a user controlled constant. Don't randomize it,
>> @@ -1512,6 +1542,8 @@ struct bpf_prog *bpf_jit_blind_constants(struct bpf_verifier_env *env, struct bp
>>                           */
>>                          insn++;
>>                          i++;
>> +                       j++;
>> +                       env->insn_aux_data[subprog_start + j].final_idx = i;
> 
> You're adding final_idx because bpf_jit_blind_constants()
> doesn't call adjust_insn_aux_data() ?
>

Yes, I added final_idx because insn_aux is not updated here.

> imo that's an ugly workaround. Just call adjust_insn_aux_data().
>

If we adjust the env->insn_aux_data here, should we also adjust the global
env->prog->insnsi array? I think env->insn_aux_data should remain consistent
with the global env->prog->insnsi array. Since constant blinding only rewrites
the subprog's private instruction array, updating the env->insn_aux_data
causes a mismatch with the global state.

> And in the future please mention such design decisions in the commit log,
> so that reviewers don't need to reverse engineer your thought process.
>

Sorry for the lack of clarity. I’ll make an effort to clarify things more
clearly in the future.

> pw-bot: cr
> 
> 


