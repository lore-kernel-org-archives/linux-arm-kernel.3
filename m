Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62270EFD238
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSA+UtCMxXx/BNfS/+hdbwz6e1Axfm6SSwuPR60K34Y=; b=yPW4zMulVY8Kdc7XFlx9e9Hhx6
	uj/F5fQO5T7CWrYFJwpUd3Uyho3CBmwBcYr8UTvNy0Yszs5RoT5Zt+ErNpr3m8tDbdnSq7wYbrZ0D
	nAvNBLafzwk2XUvA/4fEQLl3WUQC4+0zvL2ielTwa74rJRlRwlpM0imvlYK+QkeX2NEtTqPMFsbXj
	iMQLJFdwbmRSoBMTOpb5SB6PdqEzz+9toH5GKJD1cZljmeV9vIduzzwU0BVEQ+QGUGPUTwcCMQXFv
	cMM24wg7uVFBFhKPXhDlefgDJ6DWAOwPZ6CV3+v6A2M8sC/aQ2SSiC5KD9WdnVVPT9Au+M543+0uX
	tl0/1SdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBU2-00000003ihi-0TGJ;
	Wed, 25 Feb 2026 09:47:06 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBTw-00000003ih6-2H2s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:47:04 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fLV921X2GzYQtt8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 17:46:30 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id B2ED440570
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 17:46:53 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP2 (Coremail) with SMTP id Syh0CgAXfn0MxZ5pptNWIg--.15064S2;
	Wed, 25 Feb 2026 17:46:53 +0800 (CST)
Message-ID: <2d0c6893-d4a5-42bc-a480-55bc669da130@huaweicloud.com>
Date: Wed, 25 Feb 2026 17:46:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: bpf: Fix UBSAN misaligned access in BPF JIT
Content-Language: en-US
To: Fuad Tabba <tabba@google.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Puranjay Mohan <puranjay@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>,
 Jean-Philippe Brucker <jpb@kernel.org>
References: <20260224093128.1926610-1-tabba@google.com>
 <c402e95a-26d3-47eb-8249-52ece97989d3@huaweicloud.com>
 <CA+EHjTyXWqnr4Cu_cZyxDCVNCxto9pJN0WS18S_ri824oQhwug@mail.gmail.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <CA+EHjTyXWqnr4Cu_cZyxDCVNCxto9pJN0WS18S_ri824oQhwug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: Syh0CgAXfn0MxZ5pptNWIg--.15064S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuryrWry5Jw47tr4rAw4ruFg_yoW5Xw47pa
	4kK3ZIkFWqq3yjk3W2qa1rAr4agw4kWr43GrWUK34Fyrn0gr97WFy3K3ya9FZ8Crs8Gw45
	ZFWjg3y7uF18ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-CacheID: sfid-20260225_014700_954166_5563A1BD 
X-CRM114-Status: GOOD (  20.98  )
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

On 2/25/2026 5:08 PM, Fuad Tabba wrote:
> Hi Xu,
> 
> On Wed, 25 Feb 2026 at 01:43, Xu Kuohai <xukuohai@huaweicloud.com> wrote:
>>
>> On 2/24/2026 5:31 PM, Fuad Tabba wrote:
>>> struct bpf_plt contains a u64 'target' field. The BPF JIT allocator
>>> was using an alignment of 4 bytes (sizeof(u32)), which could lead
>>> to the 'target' field being misaligned in the JIT buffer.
>>>
>>> Increase the alignment requirement to 8 bytes (sizeof(u64)) in
>>> bpf_jit_binary_pack_alloc() to guarantee proper alignment for
>>> struct bpf_plt.
>>>
>>> Fixes: b2ad54e1533e9 ("bpf, arm64: Implement bpf_arch_text_poke() for arm64")
>>> Signed-off-by: Fuad Tabba <tabba@google.com>
>>> ---
>>>    arch/arm64/net/bpf_jit_comp.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
>>> index 356d33c7a4ae..adf84962d579 100644
>>> --- a/arch/arm64/net/bpf_jit_comp.c
>>> +++ b/arch/arm64/net/bpf_jit_comp.c
>>> @@ -2119,7 +2119,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>>>        extable_offset = round_up(prog_size + PLT_TARGET_SIZE, extable_align);
>>>        image_size = extable_offset + extable_size;
>>>        ro_header = bpf_jit_binary_pack_alloc(image_size, &ro_image_ptr,
>>> -                                           sizeof(u32), &header, &image_ptr,
>>> +                                           sizeof(u64), &header, &image_ptr,
>>>                                              jit_fill_hole);
>>>        if (!ro_header) {
>>>                prog = orig_prog;
>>
>> Good catch. build_plt pads NOP instructions to ensure a 64-bit relative offset for
>> plt target, but it misses the alignment check for image base itself.
>>
>> Acked-by: Xu Kuohai <xukuohai@huaweicloud.com>
>>
>> nit: Add check for base alignment in build_plt, or a comment to clarify?
> 
> Thanks for the having a look and for the Ack.
> 
> You're right that build_plt() assumes 64-bit alignment when
> calculating the NOP padding. However, Will pointed out, over-aligning
> the entire JIT buffer just to satisfy the C standard is somewhat
> heavy-handed. I didn't actually run into a functional bug. The issue
> is that UBSAN complains because we violate the standard's alignment
> rules.
> I'll dropping the allocator change in favor of marking struct bpf_plt
> as __packed.
>

Interesting, I think the plt target should be 64-bit aligned to ensure
atomic reading on arm64. It can be updated concurrently by WRITE_ONCE
in the bpf_arch_text_poke function while the ldr instruction in the plt is
executed. If it is not aligned correctly, the ldr may read a half-old
half-new value, causing the plt to jump to an invalid destination.

To avoid over-aligning the entire buffer, how about fixing the padding
method in build_plt to just make the plt target aligned correctly?


> Thanks again,
> /fiad


