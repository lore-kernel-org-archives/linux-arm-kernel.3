Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79A1D3F080
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 15:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAfyuSmJvy6LoTEpelkijHpOKcauN9cVZzfPkWSeICU=; b=jbsqBj7H4nPHZKaD2b5aZUALcU
	2863SlR2sSDxJbCGZyn/oH7xRfN1L3/ddnCzRDBsqaoJOtXNcxzsz14b6jX35cvgsXYUfkId45f52
	to90lUOktYcj/fgNX8PMmsCC2tFd+9XAp2kzQglkGmHkUi8GoZE4TwkRxAqXWzknS+q1AvUoeW69K
	Nnf52nTGOjDyjPJ135H3ut3hffvfQxEKPs8a2/h0mU0CQpKpbtmxtw84rXE1eUBFG61ao4lO5+Prv
	gSSYSXy1Wi1SoPDnBIb4cWlNnR89tP62QVLbo3u4BjnE5ukeOZ2sKCQ+eJbm+rkmzoIW2ebn2gLIf
	pj157jWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7Xb-0000000GIDq-1jJO;
	Wed, 28 Jan 2026 15:33:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7XZ-0000000GIDj-15gU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 Jan 2026 15:33:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eAfyuSmJvy6LoTEpelkijHpOKcauN9cVZzfPkWSeICU=; b=pxgBDbzJKmFErZgreKduzzAKAs
	tDzAe5Th0jLrjI7t0dr72JNhIQLh+aJQcwroAC1cWmaZVzqlgl2DwEl8z0GSRF9WlYxIZEdM0Oat9
	GFkMk9LQwT8b/XFF1zC7NR72KrPnVoE4S0YHEDyEs5wlUD39PHfdXTkbqgweh3zrEUI/SMrv+BIy8
	ALaE7GQE5/EMMOAztcLuE7GVcUmVw9t4kxQt6UFy7h8luuOrFYT757dRE8L2tkj1lnJ0kAulW1/6y
	6iEo7WKa7BDbeBUoZMTSuHijOYaaRKXd8HY3FB4OjXaYX2WooPhkqQMZ8KPFAAL99adUFaVtUdSOD
	y1pZmawA==;
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7XV-00000008qZM-1gNY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 15:33:07 +0000
Message-ID: <9cde3e15-4929-41df-8eef-f9dc282eed67@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769614374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eAfyuSmJvy6LoTEpelkijHpOKcauN9cVZzfPkWSeICU=;
	b=lAeWBsWmMgOXU3WMkRpsMa3INwJNg+gm1iAV8lFR8rXozqYar/Tcw765EM5maSAxweyWxr
	pWkGCfrniasDCzWMTRJ3TtFTEsNQXfZEbb2CpmmnT/8FUEppcA7VxZBWeDP9Fo4NRYWK0R
	V2wo5D+VdGz1KivMG8zoQVRgxcTnCaQ=
Date: Wed, 28 Jan 2026 23:32:37 +0800
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 1/3] bpf: Add bpf_arch_supports_fsession()
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org,
 xukuohai@huaweicloud.com, catalin.marinas@arm.com, will@kernel.org,
 shuah@kernel.org, menglong8.dong@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com,
 martin.lau@kernel.org, clm@meta.com, ihor.solodrai@linux.dev
References: <20260128150112.8873-2-leon.hwang@linux.dev>
 <e64c4137e7f262e6fdab272e8ee44c8a129a36eb6d0186914375d6ba20d88474@mail.kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <e64c4137e7f262e6fdab272e8ee44c8a129a36eb6d0186914375d6ba20d88474@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_153305_595112_37638292 
X-CRM114-Status: GOOD (  11.11  )
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



On 2026/1/28 23:26, bot+bpf-ci@kernel.org wrote:
>> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
>> index 5a075e06cf..070ba80e39 100644
>> --- a/arch/x86/net/bpf_jit_comp.c
>> +++ b/arch/x86/net/bpf_jit_comp.c
>> @@ -4112,3 +4112,8 @@ bool bpf_jit_supports_timed_may_goto(void)
>>  {
>>  	return true;
>>  }
>> +
>> +bool bpf_jit_supports_fsession(void)
>        ^^^^^^^^^^^^^^^^^^^^^^^^^^
> This is the actual function name in the code.
> 

There is no issue here.

bpf_jit_supports_fsession() follows the same pattern as other
bpf_jit_supports_*() helpers: it is declared in filter.h, provided as a
__weak default implementation in core.c, and overridden by individual
JIT backends as needed.

Thanks,
Leon


>> +{
>> +	return true;
>> +}
> 
> [ ... ]
> 
>> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
>> index e0b8a8a5aa..3b1eb632bf 100644
>> --- a/kernel/bpf/core.c
>> +++ b/kernel/bpf/core.c
>> @@ -3142,6 +3142,11 @@ bool __weak bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
>>  	return false;
>>  }
>> +
>> +bool __weak bpf_jit_supports_fsession(void)
>> +{
>> +	return false;
>> +}
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/21443677441
> 
> AI-authorship-score: low
> AI-authorship-explanation: The naming inconsistency between commit message and code suggests a human renaming the function during development without updating the commit message, not AI-generated content.
> issues-found: 1
> issue-severity-score: low
> issue-severity-explanation: Documentation-only issue - commit message function name does not match actual code, which may confuse future code archaeology but has no runtime impact.


