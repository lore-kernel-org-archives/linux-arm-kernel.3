Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C2F103FFAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 22:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9aosDff01A5vG7FDiqPHENUMGy/wtA//17/ZG5YGhg=; b=34p2O2A6kdRUQAiuUc9H0wNDK+
	Afct6gEYEaIRwWIwQSLcLh6FA3S/dMJNlk6XkG05m/JVr0xDPMh9oQ3uX1TmZapIc9y8y8DMwkeP1
	QFWZkmSMaV5LAvveaLDRjoTsKDI2OuiZyeD+dvr+Gu+QoGF6wPNlaURhuhiESUGy1mz2Fx/XRbN3r
	8xhX2MiaHS+oQUul/8mdmNwMnvsakoYyDrviipc5IlBiYeKXS4EHjqpekmi1HuNnbGQg+jyv2xy+7
	DB9Y7OZGLdepHo8Whh5Q6UJu+xvwLpEwvfunN3ocwEfa3ZU4C+CW94bJTDGyF3L4AUvYZHrIjGGSz
	2ZtFjbbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5tb-00000009CTm-3sma;
	Fri, 27 Feb 2026 22:01:15 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5tY-00000009CTM-0tNN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 22:01:14 +0000
Message-ID: <dc7fb8ff-def1-4d9f-8025-c7da49a1a902@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772229665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O9aosDff01A5vG7FDiqPHENUMGy/wtA//17/ZG5YGhg=;
	b=c+V4B1d0bRhUee5RVhRza7qcTgCdboHyBXwyNo2hkneRIhKF/oaExd6XSOlcCh/r/4HGRk
	84/lOBuFhSyF0rZonV88EFU3Vk7flqEvUj73SR1tvYu1+RA3mYMOBBdMctEAqVTNxGatGm
	CRt1RI+pMj5YUCHFPIeGUpupjsIt0vI=
Date: Fri, 27 Feb 2026 14:00:58 -0800
MIME-Version: 1.0
Subject: Re: [PATCHv6 bpf-next 9/9] bpf,x86: Use single ftrace_ops for direct
 calls
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Steven Rostedt <rostedt@kernel.org>, Florent Revest <revest@google.com>,
 Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Menglong Dong <menglong8.dong@gmail.com>, Song Liu <song@kernel.org>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>
References: <20251230145010.103439-1-jolsa@kernel.org>
 <20251230145010.103439-10-jolsa@kernel.org>
 <1b58ffb2-92ae-433a-ba46-95294d6edea2@linux.dev> <aaIAoBZGkP7RQrvc@krava>
 <aaILlSuEgaYDq41r@krava>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <aaILlSuEgaYDq41r@krava>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_140112_815043_8E6267FA 
X-CRM114-Status: GOOD (  14.76  )
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

On 2/27/26 1:24 PM, Jiri Olsa wrote:
> On Fri, Feb 27, 2026 at 09:37:52PM +0100, Jiri Olsa wrote:
>> [...]
>>
>>>
>>>     With CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS ftrace_replace_code()
>>>     operates on all call sites in the shared ops. Then if a concurrent
>>>     ftrace user (like kprobe) modifies a call site in between
>>>     ftrace_replace_code's verify pass and its patch pass, then ftrace_bug
>>>     fires and sets ftrace_disabled to 1.
>>
>> hum, I'd think that's all under ftrace_lock/direct_mutex,
>> but we might be missing some paths
>>
> 
> could you please try with change below? I can no longer trigger the bug with it

Can confirm that the bug doesn't trigger with this change.
At least by the reproducer test.

Tested-by: Ihor Solodrai <ihor.solodrai@linux.dev>

Thanks!

> 
> thanks,
> jirka
> 
> 
> ---
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 827fb9a0bf0d..e333749a5896 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -6404,7 +6404,9 @@ int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
>  			new_filter_hash = old_filter_hash;
>  		}
>  	} else {
> +		mutex_lock(&ftrace_lock);
>  		err = ftrace_update_ops(ops, new_filter_hash, EMPTY_HASH);
> +		mutex_unlock(&ftrace_lock);
>  		/*
>  		 * new_filter_hash is dup-ed, so we need to release it anyway,
>  		 * old_filter_hash either stays on error or is already released
> @@ -6530,7 +6532,9 @@ int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
>  			ops->func_hash->filter_hash = NULL;
>  		}
>  	} else {
> +		mutex_lock(&ftrace_lock);
>  		err = ftrace_update_ops(ops, new_filter_hash, EMPTY_HASH);
> +		mutex_unlock(&ftrace_lock);
>  		/*
>  		 * new_filter_hash is dup-ed, so we need to release it anyway,
>  		 * old_filter_hash either stays on error or is already released


