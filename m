Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34FAD46BF4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 19:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uoce2O4bq+uQodOB69TrcPt+OZtvkCKYOFmKW88WqjE=; b=pWNYniVHpge0P0ZLxEpKJcgxKo
	rGUYoHLnnckKnId/NkNZCprsJeFudCeVOjp0M+egGt2T4YjWSBSt86Jm35ha1ra4+KgWZZOYAs/HR
	7U4j7B4JudDDiVrZvyNAqsXyEhCyrS0f3NI9TeS0+XHymFsOSZvbxaJXZlQxFrtB8eRvJE8q39eTA
	h+sXG4yDphcF1d5YRuManwW4MKWML4Uh/NDfyUvvnbis3wKGV9a/KeMnhu5EixlXI6WVMmdlnzk2f
	TPZYSuz0MRb5v+iSJGUAd4nZA5abTr2eVHLG0pl+ooU6F+li6utLStV0q9a9z3Y/HqKl6pOhP5y6b
	WoHam3+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlAuh-0000000GfN2-1nhV;
	Wed, 28 Jan 2026 19:09:15 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlAud-0000000GfMd-2uVS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 19:09:14 +0000
Message-ID: <7dbcc5d5-476b-46e5-9e4b-b260d24a51a1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769627347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uoce2O4bq+uQodOB69TrcPt+OZtvkCKYOFmKW88WqjE=;
	b=QQfkmD5lsHJq3o87CYC128K2gTqM8Je0n3mmDb7+VkG836yXHnF3KY7huFJiwuXOFZwF6+
	84fkXG22+popIKJZno2KmoEGOUfWcQ8vQiZtngJ54CILBc359vKQ7gzGPFZ8B1BKhImMSl
	PryoO/gGwx1UTolmy4wP1qSn/KnXi4E=
Date: Wed, 28 Jan 2026 11:08:54 -0800
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 1/3] bpf: Add bpf_arch_supports_fsession()
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Chris Mason <clm@meta.com>
Cc: bot+bpf-ci@kernel.org, bpf <bpf@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Xu Kuohai <xukuohai@huaweicloud.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Menglong Dong <menglong8.dong@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 kernel-patches-bot@fb.com, Martin KaFai Lau <martin.lau@kernel.org>
References: <20260128150112.8873-2-leon.hwang@linux.dev>
 <e64c4137e7f262e6fdab272e8ee44c8a129a36eb6d0186914375d6ba20d88474@mail.kernel.org>
 <65231eeb-1f00-4af2-9234-a290ea3f6585@meta.com>
 <a10afa70-29b7-48ab-b241-8b0f602abe2f@linux.dev>
 <CAADnVQJV=e2VgQzkpsUQwexhaVZMs7uXHCe1Fa6VwbVNUMPghA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <CAADnVQJV=e2VgQzkpsUQwexhaVZMs7uXHCe1Fa6VwbVNUMPghA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_110911_884460_C2771414 
X-CRM114-Status: GOOD (  16.97  )
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

On 1/28/26 10:49 AM, Alexei Starovoitov wrote:
> On Wed, Jan 28, 2026 at 9:34 AM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
>>
>> On 1/28/26 7:35 AM, Chris Mason wrote:
>>>
>>>
>>> On 1/28/26 10:26 AM, bot+bpf-ci@kernel.org wrote:
>>>>> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
>>>>> index 5a075e06cf..070ba80e39 100644
>>>>> --- a/arch/x86/net/bpf_jit_comp.c
>>>>> +++ b/arch/x86/net/bpf_jit_comp.c
>>>>> @@ -4112,3 +4112,8 @@ bool bpf_jit_supports_timed_may_goto(void)
>>>>>  {
>>>>>     return true;
>>>>>  }
>>>>> +
>>>>> +bool bpf_jit_supports_fsession(void)
>>>>        ^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>> This is the actual function name in the code.
>>>
>>> Ihor, I think the script parsing review-inline.txt chopped off the
>>> part of the review where AI was complaining about the commit message?
>>
>> This is the email body pre-processing in KPD, yes.
>>
>> At some point we decided to remove the commit message before sending
>> an email, but now that AI reviews the messages too, I think we should
>> just send the generated review-inline.txt as is.
>>
>> Alexei, wdyt?
> 
> I think KPD is only supposed to trim the header until 'diff ..' line.
> In this case there is no 'diff', so I'm not sure why it trimmed so much.

There is. Here is the PR comment with the review:
https://github.com/kernel-patches/bpf/pull/10868#issuecomment-3811930805

KPD trimmed everything before the first "> diff" occurrence, as expected.

I'll try to fix this up in KPD. We should probably search for the first
line starting with "> " (a quote start) to trim the header correctly.

Alternatively, AI can be prompted to avoid generating the header in
review-inline.txt, but that's probably less reliable. And maybe it is
useful for local runs, idk.

> 
> commit sha...
> Author: ...
> 
> are useless in email reply, so we should still trim them.


