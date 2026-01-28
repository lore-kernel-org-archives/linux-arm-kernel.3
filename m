Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A68D3F082
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 15:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvHp944RWMNX+8EeKBPahp8VEBI2KMU61Tq8S7dUKfk=; b=qfB/PQcDDyEB4tClKLn14GipS7
	6Zts8i5fzQ+LgORrrX8i36AIWM6AtPm2RsdXPLxkFaNWJG9lEPl262AXr0iFRQWkqwEHtTjnKnuZA
	5daAEmKB9SOHYexxYFjdDfJkQL61oDdKj807TBCv0bsFfcOaU/hKs1ADb1hGGnaMsAfuGvcK6thJ6
	hU5gpuJcfn8MA6i2AfMkPZok1m9tQ/bkD8gPABCn99iF5ISo65j0BN6idmZfvrXXubKn3SGIFvnX/
	i8hmndI2kqC/w1XXl/fwdiwlUgYGJi7m1QIsa80HLulPouyxXFbwIxRhSAhF+AMaeAZhG+WZl4RUu
	dqjYsKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7et-0000000GIxq-3Wwt;
	Wed, 28 Jan 2026 15:40:43 +0000
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7eq-0000000GIxL-3op8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 15:40:42 +0000
Message-ID: <4295e99d-8638-4cff-90e2-e1f5c2452b52@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769614838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mvHp944RWMNX+8EeKBPahp8VEBI2KMU61Tq8S7dUKfk=;
	b=cLTbqYFHNWr961NzRQkS2qZQ9ohdj1jjpAhTS7j0cMoFziLInVkfwJmBovx9p2C4bZ9BEV
	pTfwcm6C4EV3mxEhL4WCPuRj3d1pWYxfyIX1cxbTemfS4zqjYbdm0fIWQ+xF7QOZt5+cQd
	FIzrAdNaMqhcx1gt1UZAv2lpc727g08=
Date: Wed, 28 Jan 2026 23:40:26 +0800
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 1/3] bpf: Add bpf_arch_supports_fsession()
To: Chris Mason <clm@meta.com>, bot+bpf-ci@kernel.org, bpf@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org,
 xukuohai@huaweicloud.com, catalin.marinas@arm.com, will@kernel.org,
 shuah@kernel.org, menglong8.dong@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com,
 martin.lau@kernel.org, ihor.solodrai@linux.dev
References: <20260128150112.8873-2-leon.hwang@linux.dev>
 <e64c4137e7f262e6fdab272e8ee44c8a129a36eb6d0186914375d6ba20d88474@mail.kernel.org>
 <65231eeb-1f00-4af2-9234-a290ea3f6585@meta.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <65231eeb-1f00-4af2-9234-a290ea3f6585@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_074041_102911_CD49D5A2 
X-CRM114-Status: GOOD (  15.25  )
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



On 2026/1/28 23:35, Chris Mason wrote:
> 
> 
> On 1/28/26 10:26 AM, bot+bpf-ci@kernel.org wrote:
>>> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
>>> index 5a075e06cf..070ba80e39 100644
>>> --- a/arch/x86/net/bpf_jit_comp.c
>>> +++ b/arch/x86/net/bpf_jit_comp.c
>>> @@ -4112,3 +4112,8 @@ bool bpf_jit_supports_timed_may_goto(void)
>>>  {
>>>  	return true;
>>>  }
>>> +
>>> +bool bpf_jit_supports_fsession(void)
>>        ^^^^^^^^^^^^^^^^^^^^^^^^^^
>> This is the actual function name in the code.
> 
> Ihor, I think the script parsing review-inline.txt chopped off the
> part of the review where AI was complaining about the commit message?
> 
> commit f636685cc0b05bb758bb58729cc65dde79ac7108
> Author: Leon Hwang <leon.hwang@linux.dev>
> 
> bpf: Add bpf_arch_supports_fsession()
> 
> This commit adds architecture-specific gating for fsession programs,
> returning -EOPNOTSUPP when the architecture does not implement fsession
> support, instead of failing at runtime with -EFAULT.
> 
>>     bpf: Add bpf_arch_supports_fsession()
> 
> The commit subject references bpf_arch_supports_fsession(), but the
> actual function implemented is named bpf_jit_supports_fsession().
> 
>>     Introduce bpf_arch_supports_fsession() to explicitly gate fsession usage
>>     based on architecture support.
> 
> Similarly, the commit body describes bpf_arch_supports_fsession(), while
> the code uses bpf_jit_supports_fsession().
> 
> Should the commit message be updated to match the actual function name?
> The function follows the existing bpf_jit_supports_*() naming convention
> used by similar functions in the codebase.
> 

Correct, in commit message, the function should be
bpf_jit_supports_fsession(), too.

Thanks,
Leon



