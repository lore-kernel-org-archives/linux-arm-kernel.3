Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7B1C98315
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 02:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/q0F1lZ5RHZoCZLcbN3EVm2rK9BZFkj1gWnmhHy4U/k=; b=O7kSi+zmAySpEbT4/iUqgQNQn4
	TzlFXNj+wvoB0f1Vqsq14nZW76Umr4R+rFm3qia+237MEigfxze/Hu52QujyFtSvoLUvBg2feASbh
	qIUMwNlP6qy/ljyS4kfzPcG2REeo7H/4L3lEP7qiOVEqXYAbV8yjlSQcxMH+OOcQTlkL9uKrnLvIp
	W8I/JgAU6DZOmEheQ6aISWtERUM3qo0OR2sfB9jcoaFSo4SkHcvO2vxIGmobI+cxSWE3yzx0rBqzH
	iBHmnRB6mzb3EhqrpqsxOhgsD8m0l6iMuaRwLPOKw3RdJBKhCj8rVFlAW0jdUSqYxYPzgjA5uR7gv
	fmawfRqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhf6v-00000001H6l-47nM;
	Mon, 19 Jan 2026 02:35:21 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhf6r-00000001H6F-28Sp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 02:35:20 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4dvZKs6zHgzYQtvk
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:34:41 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 61E3540591
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:35:03 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP4 (Coremail) with SMTP id gCh0CgDHdfZWmG1pXPRAEQ--.2580S2;
	Mon, 19 Jan 2026 10:35:03 +0800 (CST)
Message-ID: <32bd1c9d-ef1a-4e97-80b5-a069ce28125f@huaweicloud.com>
Date: Mon, 19 Jan 2026 10:35:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 2/4] bpf: Add helper to detect indirect jump
 targets
Content-Language: en-US
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Eduard Zingerman <eddyz87@gmail.com>, bpf <bpf@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Yonghong Song <yonghong.song@linux.dev>,
 Puranjay Mohan <puranjay@kernel.org>,
 Anton Protopopov <a.s.protopopov@gmail.com>
References: <20260114093914.2403982-1-xukuohai@huaweicloud.com>
 <20260114093914.2403982-3-xukuohai@huaweicloud.com>
 <2e5ed01463ae8f79780a42c4e7f93baeafd2565a.camel@gmail.com>
 <21aec5e1-4152-4d51-ad25-91524c544b66@huaweicloud.com>
 <CAADnVQLha64x_LQ1Ph+0dEdP2sNms71k41pwEVMwxrbBG78M5Q@mail.gmail.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <CAADnVQLha64x_LQ1Ph+0dEdP2sNms71k41pwEVMwxrbBG78M5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgDHdfZWmG1pXPRAEQ--.2580S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr4rCF17Zw4xWFyDJrWDArb_yoW5AryrpF
	WrWa4jkF4qvrZ8Kr12gay8Aw4aqF45Wrn8Xrn8J3y7Cr90qrn3KF1Igw409F98Kr1Yyw4I
	qF4j93sxuFyUZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-CacheID: sfid-20260118_183517_919201_0AC293D5 
X-CRM114-Status: GOOD (  24.36  )
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

On 1/19/2026 1:20 AM, Alexei Starovoitov wrote:
> On Wed, Jan 14, 2026 at 11:47 PM Xu Kuohai <xukuohai@huaweicloud.com> wrote:
>>
>> On 1/15/2026 4:46 AM, Eduard Zingerman wrote:
>>> On Wed, 2026-01-14 at 17:39 +0800, Xu Kuohai wrote:
>>>> From: Xu Kuohai <xukuohai@huawei.com>
>>>>
>>>> Introduce helper bpf_insn_is_indirect_target to determine whether a BPF
>>>> instruction is an indirect jump target. This helper will be used by
>>>> follow-up patches to decide where to emit indirect landing pad instructions.
>>>>
>>>> Add a new flag to struct bpf_insn_aux_data to mark instructions that are
>>>> indirect jump targets. The BPF verifier sets this flag, and the helper
>>>> checks it to determine whether an instruction is an indirect jump target.
>>>>
>>>> Since bpf_insn_aux_data is only available before JIT stage, add a new
>>>> field to struct bpf_prog_aux to store a pointer to the bpf_insn_aux_data
>>>> array, making it accessible to the JIT.
>>>>
>>>> For programs with multiple subprogs, each subprog uses its own private
>>>> copy of insn_aux_data, since subprogs may insert additional instructions
>>>> during JIT and need to update the array. For non-subprog, the verifier's
>>>> insn_aux_data array is used directly to avoid unnecessary copying.
>>>>
>>>> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
>>>> ---
>>>
>>> Hm, I've missed the fact insn_aux_data is not currently available to jit.
>>> Is it really necessary to copy this array for each subprogram?
>>> Given that we still want to free insn_aux_data after program load,
>>> I'd expect that it should be possible just to pass a pointer with an
>>> offset pointing to a start of specific subprogram. Wdyt?
>>>
>>
>> I think it requires an additional field in struct bpf_prog to record the length
>> of the global insn_aux_data array. If a subprog inserts new instructions during
>> JIT (e.g., due to constant blinding), all entries in the array, including those
>> of the subsequent subprogs, would need to be adjusted. With per-subprog copying,
>> only the local insn_aux_data needs to be updated, reducing the amount of copying.
>>
>> However, if you prefer a global array, I’m happy to switch to it.
> 
> iirc we struggled with lack of env/insn_aux in JIT earlier.
> 
> func[i]->aux->used_maps = env->used_maps;
> is one such example.
> 
> Let's move bpf_prog_select_runtime() into bpf_check() and
> consistently pass 'env' into bpf_int_jit_compile() while
> env is still valid.
> Close to jit_subprogs().
> Or remove bpf_prog_select_runtime() and make jit_subprogs()
> do the whole thing. tbd.
> 
> This way we can remove used_maps workaround and don't need to do
> this insn_aux copy.
> Errors during JIT can be printed into the verifier log too.
>

Sounds great. Using jit_subprogs for the whole thing seems cleaner. I'll
try this approach first.

> Kumar,
> what do you think about it from modularization pov ?


