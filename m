Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06A0C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wR3pD/p6gwd1Q6ULvoVeNrAKXm5ytJKoJTYy49XuHLE=; b=D3pgCXPx71Lg/yamjNaVhnozFA
	wCGiy+L30Dt70HWq/7YE2uxmuGgfpZezytf91iHZsLMos2A92SuOfqetCYTxOZhP2h2BTjduPPHRv
	B9sYLCEVnODfbXmjtHbjRf4sRCzw1aKF5iqKIBkYbMPnb2dqoE7EX8hbGXlq+trB0EFrR4nlcQ23m
	fIus2F71Qb/MPuOIScQcrCG9NqosdozJSBusUd622PBpZFidO41IgDnjMQ90fitJFIkwc44yWGzhF
	3xFVIZe2kxAfvD3glYChb5O4NBPqi6oAaF1C5mOefZ0oP5W0bMJxMpVJuJBZZPlYSZQgWM5TBWaDK
	N38QncRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0eL-0000000BPWD-0SNB;
	Thu, 20 Aug 2026 11:09:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0eH-0000000BPVX-0imE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:09:30 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so24915615e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 04:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787224167; x=1787828967; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wR3pD/p6gwd1Q6ULvoVeNrAKXm5ytJKoJTYy49XuHLE=;
        b=FQ4h/U7SPGoAGuC4kmsj2dMhi1Wv1kAkJysADrgupiE3dLtTsvgGjp3vJ1alfuRuAo
         2nF9hqmcYXkgM23e+mjeRGNoCOkRFSx6N1erwbhA9xnxGKEVSjff71C1NQbrQXUUR7KN
         krD3wJyYtedsG3X4Xn4+lsxz9gOJ9RvaCkjNXMsI5+1lslprbJcKW5EQZ+kRDYCAnfCt
         z7hv9lBc7n9NSsFhxCkR7tx9eHiuq+mC2zeyaSESLRygd6buFSxNfrwyXrvr4drLFdo/
         t1F3K3orN8fUAVqwN/jqv0ZjmhFLoxOlg75tMaqnDU+kuCy3R+bJIWmeQkeh5bmfCKVc
         t/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224167; x=1787828967;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wR3pD/p6gwd1Q6ULvoVeNrAKXm5ytJKoJTYy49XuHLE=;
        b=qhp+s1IOY74JGxszrX+0Guti81cj/eqXydKlqGH/HygS97nYtXo070X+vwA/gpSMXH
         +HLN6UZ4CGwBPwdtvNwcoi4b6gTmOQdc8ANYLJF8C4ZyZ1wZ/vXa3dFzmrLEw5MRAM93
         xNxoxm0zV2THpOHv5URR+aJmWWTiYx5MKD/n0Vw+oP8fzaU/tAl0kNiMYH+WfS4t7W3I
         lq2IPlWunZjaMAN2tbYJ9XNHajD4oTntE9W9wpSMO+aTW6VQjR6PJYtd/bB+Wv5CAxGM
         rs9/4RBmRNkrCPoovYNSTkokR4Hax7DDbkHXhnahiD/cEd1r+hlHv6iZIumDM8d10z9o
         wxXg==
X-Forwarded-Encrypted: i=1; AHgh+Rq18KXfhoN91LA2WcM57L4OZEV24Th4nJGKXyHYq1mkm2peOrUHLKL1wlG5ul024f6j5sR2IODPLPx2c+IGeZnB@lists.infradead.org
X-Gm-Message-State: AOJu0YyoCHHmtKQqKmamGduZ6roM3nSJ2nEDFeM76+Xsc92pqxgo/Brc
	bEDL+QPcMXGZKCYaU697uK/EjfLQfbL0/4a8lNQkpzJrkbCxEmODrZCdBvFhloXngV0=
X-Gm-Gg: AR+sD12yihLJk0G0yZWl5f2nKENJshdwqgkgYZwwbXJDluTwZayT9bXmeja9yhRwU8Z
	ohSKNtTBD6hikAeDjkabq7PhLK/ran/TkEWZUOsSFWAxw/oTRqS3t8xFi23/8E/k/K9lT+LTDZa
	ccu+f+stV8OtZb5IyJeSpLyHkvYeOVPl2py1LfSpc5/R/FLlQ0Jnk1iwX516qKof9z+xR4LeytN
	nOx6XRVPlEdvCNTN1ryuUfMfG8YZTtWizp+zAmMY0SGt++vNvLSx+qyNuYg5GIlNgX1lxF7eOOI
	/VSfgdO5511KOtjo+XoJhexOzY6fWf4juf3xOxrgcVm+8/CeU+IpUfK1IM+PKLF2zrCGvT+SVFG
	VcvmlPaDFmUclLt0SbbaHaCrkSNs2eK785QM6L1DABZmY2i4y5OfoIWgSqzBTHCcJKsjOSiUluu
	RCbLG1yeWhvedrczPXX8ckX0nmBUdbfarWr87WU4ZqvkEZkmD1SqEYnzAcawikWyjwwg==
X-Received: by 2002:a05:600c:a412:b0:499:ae94:be05 with SMTP id 5b1f17b1804b1-499ae94be48mr158371875e9.0.1787224166835;
        Thu, 20 Aug 2026 04:09:26 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd7a9sm174399865e9.2.2026.08.20.04.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 04:09:26 -0700 (PDT)
Message-ID: <a7e11c2c-fd83-4ea5-8218-29a5af768578@linaro.org>
Date: Thu, 20 Aug 2026 12:09:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] coresight: tmc-etr: Prevent per-thread events from
 sharing a sink
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qi Liu
 <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
 <20260728-james-cs-multiple-per-threads-v3-4-6aee7579f1dc@linaro.org>
 <20260813160504.GC8904@e132581.arm.com>
 <dcea48bc-6a64-413b-acf5-9783f979ab6d@linaro.org>
 <20260819084515.GF8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260819084515.GF8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_040929_263993_52B18E22 
X-CRM114-Status: GOOD (  45.17  )
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



On 19/08/2026 09:45, Leo Yan wrote:
> On Fri, Aug 14, 2026 at 10:09:01AM +0100, James Clark wrote:
> 
> [...]
> 
>> There isn't any sharing with "another perf session", unless there is a
>> mistake somewhere? Checking that the owners are equivalent enforces this. Or
>> do you mean another event owned by the same process?
> 
> Now I understand that the problem is constrained to different events
> within the same session.
> 
>> I'm not sure the exact model you had in mind was that still supports this
>> and fixes the bugs?
> 
> Let me try to describe my understanding of the problem.
> 
>    ./perf test -w named_threads 2 1000000 &
>    ./perf record -e cs_etm//u --per-thread --pid $!
> 
> We can simplify the flow as:
> 
>                  | T1 |
>    CPU0        ------------------------------
>                     |   T2      |
>    CPU1        ------------------------------
>                                 `> T2 stops and the driver reports
>                                    the warning when trying to sync
>                                    ETR_BUF(T1), while T2 is associated
>                                    with ETR_BUF(T2).
> 
>    AUX_BUF(T1) |                            |
>    ETR_BUF(T1) | Bounce buf0                |  -> Used by H/W trace
> 
> 
>    AUX_BUF(T2) |                            |
>    ETR_BUF(T2) | Bounce buf1                |  -> Not used by H/W trace
> 
> With `--per-thread --pid $PID`, perf creates separate events for the
> child threads, say T1 and T2. Perf allocates a separate AUX buffer
> for each event, and the ETR driver also allocates a separate bounce
> buffer for each event. However, because there is only one shared ETR
> sink, only one of those bounce buffers can actually be used by the
> hardware at a time.
> 
> If T1 stops while T2 is still running, the ETR remains enabled. Later,
> when T2 stops, the ETR is still using ETR_BUF(T1). This mismatch
> triggers the warning and prevents the data from being copied.
> 
> I am just wandering if we can improve the sink driver to only allocate
> a single bounce buffer that is independent of any threads (and any
> associated events).
> 
>                  | T1 |
>    CPU0        ------------------------------
>                     |   T2      |
>    CPU1        ------------------------------
>                                 `> T2 stops and can sync trace
>                                    from the shared bounce buffer
>                                    to AUX_BUF(T2).
> 
>    AUX_BUF(T1) |                            |
>    AUX_BUF(T2) |                            |
> 
>    ETR_BUF     | Bounce buf                 |  -> Used by H/W trace
> 
> This might also simplify the CPU-wide case. Each CPU would still have
> its own AUX buffer, but the ETR driver would maintain only one bounce
> buffer for the shared sink. A reference count could track how many
> events are using the sink, with the final event responsible for

Isn't this how it's already working? get_perf_etr_buf_cpu_wide() 
allocates a single shared buffer with a refcount. I didn't change this, 
I only changed the rules about what is considered shared or not so that 
it matches the semantics of the perf events that back the tracing session.

> stopping the sink and copying the trace data from bounce buffer to aux
> buffer.
> 
>> The one in this change is pretty complete and only does 4 comparisons,
>> which seems quite simple to me.
> 
> Before going further with the heavily sink buffer refactoring, perhaps
> a more pragmatic solution would be to reject the problematic case for
> now. Can we do something like below?
> 
> +void coresight_trace_id_is_perf_started(struct coresight_trace_id_map *id_map)
> +{
> +	PERF_SESSION(atomic_read(&id_map->perf_cs_etm_session_active));
> +}
> 
> @@ -399,6 +399,15 @@ etm_event_build_path(struct perf_event *event, int cpu,
>   			goto out;
>   	}
>   
> +	if (!coresight_trace_id_is_perf_started(&sink->perf_sink_id_map)) {
> +		sink->perf_owner = event->owner;
> +		sink->perf_target = event->hw.target;
> +	} else {
> +		if (sink->perf_owner != event->owner ||
> +		    sink->perf_target != event->hw.target)
> +			goto out;
> +	}
> +
> 
> We use a central place etm_event_build_path() to record and compare
> event's owner and target process, then we don't need to spread the
> check into sink drivers. We only care about if owner and target must
> be consistent.

But we don't know where the target will run when the event is created. 
That's why the check is delayed until etm_event_start() and the process 
has been scheduled. Where it runs needs to be taken into account to 
calculate if this sink can be shared.

Moving the check to event creation time would cause a regression for two 
users that plan to trace two different threads (or different CPUs where 
the processes are known to never run on a shared sink at the same time). 
With your example the second user is completely prohibited from opening 
per-thread events, but with the existing driver and this change it 
works. I think that's quite a significant change in functionality, 
what's the justification for taking those use cases away from users?

> 
> Regard of the inherit/inherit_thread, I always see they are consistent
> within the same session. Should we ignore them?

Do you mean they are always consistent in Perf? I don't think the driver 
can afford to bend the rules just because Perf promises to never do it. 
It might not always do that, and any tool can do perf_event_open(), not 
just Perf.

It's quite easy to imagine the bug report being: "I opened one event 
with inherit set, and one event without. Why do I get trace from other 
threads in my event without inherit set? I expect to see only trace from 
one process".

> 
> Thanks,
> Leo


