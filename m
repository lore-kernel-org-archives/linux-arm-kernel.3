Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCABD11718
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 07:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lD2L8zW/eC/d4RFsXB5i3DHI7hNbaSPWdmW63PMbZn8=; b=AE1Kx8MlFTFoCi9lBco5pOHf2m
	lptoOS9hLjSKfTAgtgKA0eMGWfiEr701wXmlVQeHdXod5J3xgupFT6M9ma/N6RKG+o0rBbEc4RNVI
	rBAakDLMY1RS/7h59YfZ1CYjIKMmmSsN/MYHzrHw0D3FP2x5s6hCfoaKfTSwPjn0a0rxKHT2xvC7I
	MJwlblhJUnKeUu5VAIzvJ1XnAZ5NsEVvCoFxeGT0kucmZXAwT+vJj+xWkGhIzMWxdo2CsQuA83s1N
	ru45n08IRBNhx0FKuBJbtrkNWFkzDHXe49NI7/4QzRiw8sUyuMv6GCgVeylwZZT5WzngH2WhGkCQY
	3kC1P4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4F8B-00000002rhV-0piA;
	Fri, 25 Oct 2024 07:53:11 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4F6W-00000002rLW-0Zve
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 07:51:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4XZZhx47Bfz4f3m6f
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 15:50:57 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id DE62C1A0568
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 15:51:15 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP4 (Coremail) with SMTP id gCh0CgB398PyTRtnzlhEFA--.3489S2;
	Fri, 25 Oct 2024 15:51:15 +0800 (CST)
Message-ID: <32bf0704-d178-4728-8b70-5f6603723250@huaweicloud.com>
Date: Fri, 25 Oct 2024 15:51:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf] bpf, arm64: Fix stack frame construction for
 struct_ops trampoline
Content-Language: en-US
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Puranjay Mohan <puranjay12@gmail.com>, bpf <bpf@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Puranjay Mohan <puranjay@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20241019092709.128359-1-xukuohai@huaweicloud.com>
 <CAADnVQLOY-eHby6CMNXr3FvwPm85W-tWDxiWnRaR_U_=71ADuA@mail.gmail.com>
 <CANk7y0jiuiHSMTEZ_JCb4QpEPzhkK4ikicDGFa1F30DinZta8A@mail.gmail.com>
 <7226e7b8-ed73-4adb-9016-30031f1121ca@huaweicloud.com>
 <47082e78-e234-4487-95f2-0066e19f21dd@huaweicloud.com>
 <CAADnVQKcwTstR5y3e1wNj-Agq7DuPNYOdQWkf33cLOBYiYGiug@mail.gmail.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <CAADnVQKcwTstR5y3e1wNj-Agq7DuPNYOdQWkf33cLOBYiYGiug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgB398PyTRtnzlhEFA--.3489S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr1xKF4kXF15Ar43KrW7Arb_yoWrGw1kpr
	yrXFWYkr4jvryqkw1qgr15ZFySyr4DX345WrZ8tw4fC3Z0qr1fJr17ta13urn3Gr1vkr12
	qr4DtFZrJF4DAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUylb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUF1v3UUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_005128_517542_DE64225D 
X-CRM114-Status: GOOD (  18.85  )
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

On 10/25/2024 12:24 AM, Alexei Starovoitov wrote:
> On Thu, Oct 24, 2024 at 6:48 AM Xu Kuohai <xukuohai@huaweicloud.com> wrote:
>>
>> On 10/23/2024 11:16 AM, Xu Kuohai wrote:
>>> On 10/23/2024 7:37 AM, Puranjay Mohan wrote:
>>>> On Wed, Oct 23, 2024 at 12:50 AM Alexei Starovoitov
>>>> <alexei.starovoitov@gmail.com> wrote:
>>>>>
>>>>> On Sat, Oct 19, 2024 at 2:15 AM Xu Kuohai <xukuohai@huaweicloud.com> wrote:
>>>>>>
>>>>>> From: Xu Kuohai <xukuohai@huawei.com>
>>>>>>
>>>>>> The callsite layout for arm64 fentry is:
>>>>>>
>>>>>> mov x9, lr
>>>>>> nop
>>>>>>
>>>>>> When a bpf prog is attached, the nop instruction is patched to a call
>>>>>> to bpf trampoline:
>>>>>>
>>>>>> mov x9, lr
>>>>>> bl <bpf trampoline>
>>>>>>
>>>>>> This passes two return addresses to bpf trampoline: the return address
>>>>>> for the traced function/prog, stored in x9, and the return address for
>>>>>> the bpf trampoline, stored in lr. To ensure stacktrace works properly,
>>>>>> the bpf trampoline constructs two fake function stack frames using x9
>>>>>> and lr.
>>>>>>
>>>>>> However, struct_ops progs are used as function callbacks and are invoked
>>>>>> directly, without x9 being set as the fentry callsite does. Therefore,
>>>>>> only one stack frame should be constructed using lr for struct_ops.
>>>>>
>>>>> Are you saying that currently stack unwinder on arm64 is
>>>>> completely broken for struct_ops progs ?
>>>>> or it shows an extra frame that doesn't have to be shown ?
>>>>>
>>>>> If former then it's certainly a bpf tree material.
>>>>> If latter then bpf-next will do.
>>>>> Pls clarify.
>>>>
>>>> It is not completely broken, only an extra garbage frame is shown
>>>> between the caller of the trampoline and its caller.
>>>>
>>>
>>> Yep, exactly. Here is a perf script sample, where tcp_ack+0x404
>>> is the garbage frame.
>>>
>>> ffffffc0801a04b4 bpf_prog_50992e55a0f655a9_bpf_cubic_cong_avoid+0x98 (bpf_prog_50992e55a0f655a9_bpf_cubic_cong_avoid)
>>> ffffffc0801a228c [unknown] ([kernel.kallsyms]) // bpf trampoline
>>> ffffffd08d362590 tcp_ack+0x798 ([kernel.kallsyms]) // caller for bpf trampoline
>>> ffffffd08d3621fc tcp_ack+0x404 ([kernel.kallsyms]) // garbage frame
>>> ffffffd08d36452c tcp_rcv_established+0x4ac ([kernel.kallsyms])
>>> ffffffd08d375c58 tcp_v4_do_rcv+0x1f0 ([kernel.kallsyms])
>>> ffffffd08d378630 tcp_v4_rcv+0xeb8 ([kernel.kallsyms])
>>> ...
>>>
>>> And this sample also shows that there is no symbol for the
>>> struct_ops bpf trampoline. Maybe we should add symbol for it?
>>>
>>
>> Emm, stack unwinder on x86 is completely broken for struct_ops
>> progs.
>>
>> It's because the following function returns 0 for a struct_ops
>> bpf trampoline address as there is no corresponding kernel symbol,
>> which causes the address not to be recognized as kerneltext. As
>> a result, the winder stops on ip == 0.
>>
>> unsigned long unwind_get_return_address(struct unwind_state *state)
>> {
>>           if (unwind_done(state))
>>                   return 0;
>>
>>           return __kernel_text_address(state->ip) ? state->ip : 0;
>> }
>>
>> Here is an example of broken stack trace from perf sampling, where
>> only one stack frame is captured:
>>
>> ffffffffc000cfb4 bpf_prog_e60d93d3ec88d5ef_bpf_cubic_cong_avoid+0x78 (bpf_prog_e60d93d3ec88d5ef_bpf_cubic_cong_avoid)
>> (no more frames)
> 
> you mean arch_stack_walk() won't see anything after ip=0,
> but dump_stack() will still print the rest with "?" (as unreliable).
>

Yes, dump_stack() does not stop on !__kernel_text_address

> That's bad indeed.
> 
>> To fix it, I think kernel symbol should be added for struct_ops
>> trampoline.
> 
> Makes sense. Pls send a patch.
> 
> 
> As far as this patch please add an earlier example of double tcp_ack trace
> to commit log and resubmit targeting bpf-next.
>

Sure


