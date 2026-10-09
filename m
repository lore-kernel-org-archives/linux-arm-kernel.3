Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CECECA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 14:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J34bsJo8nGDRlMQcuyT+ytZX7Mjn53KWqDlCxkI1Ar0=; b=q+dKL80IWLcu4eaGr5cxtkR4zp
	02eLucf9666krea8qnq23clMI2Gwr+sc6IyeWDclHPO1TuGcs7ip8VI+R8Khvwk/4p3hd/rUEwcdl
	/hcdJoEM/wkOb1ciNVHV2avvFPiFZnmACHqbnTtHQCQb1U9OzaiEl8W4NDYLQPR/i+FeaJun2arpk
	aELLkpdXffuNDHuL8g1s6tvJ5VvlzS2NbfO6UrYB4bkIUWbmxU3UrIm3FwMIcV4VJfk4swRXCTxMk
	wl/hiYf56xkqcvkCfiTuMCV7VwSWXmo96obMBizFS1XmmCXcK3OtIovL5svXH3Q+PIsnFGQIrUFLI
	fhBwXHVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBZR-00000006S16-1Bnr;
	Fri, 09 Oct 2026 14:27:37 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBZO-00000006S0l-0AEy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 14:27:35 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49e73611928so13124405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 07:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791556052; x=1792160852; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J34bsJo8nGDRlMQcuyT+ytZX7Mjn53KWqDlCxkI1Ar0=;
        b=gQ5CNU9VRBzEAIsEeI9vgxkr0auXDPlQXZqLmRYj3zU7Ez+PiqDczlfo/YWghCimXn
         OyIilUBQkxTb0e4XS3cE90COMc1n8hAnrJl8lByY8J3PUBoV0XOLDuk5UxZOUfaEOATH
         NkeeHh0xB/E74nOaprNodCv++Cgc6cIaAUiQWNfGNQWgMosY8TslI+CBngs6eqUEquxj
         NyUB6tkJUFh4OkXjnWY6EmPutEUVT2vH6JtYblUBUHXM0pt4iwEslXdkAsSTJ5tDBwI6
         ZKkek8kOm5W2NG5hwRD13zF/l9Ajl4XOfSSvktTTh+PuRlWanF06r9HY2i4RhOOdFGtM
         KJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556052; x=1792160852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J34bsJo8nGDRlMQcuyT+ytZX7Mjn53KWqDlCxkI1Ar0=;
        b=UBikW1yfk7rpdF2nPpiBZo+uYCQr1qnjogibF0tGDcO9dmy5vJjCE87k8IKSi2dH/R
         BFcivlyiOa6zE3mM2le9DG/G9TnoxzxtDqjTMI6HZaD6UeSLH9Rwp7MFtVeE0BFjNQpt
         AzlbUhZuLGoUXBku9rFqGao54pB7uGYzvk2VCRWZCmpI1DGdpqgTL40RTrlNhJnWFy0D
         +8VBAZSZluZ2uQ960GZEU2Qx++OLKCHYTN5qerkfLlebQ0VUxSfgorCmF/4ZPJDegdkE
         3NMg5TOAqfelmOSV7pBsooqqf4bnqe1a+NatO9rp/qgK7A25rdJXP1Fwg/Rj9PnoL0Wl
         gpKg==
X-Forwarded-Encrypted: i=1; AKwUvBx2hVKQ9Xt3gf08hhQ6E2QuaaOGpdsSbNtsMYnO/uffQPA7gLW4gbRR5ltYcdyOCYH4e08k8lH1ezFZ7myXKsw7@lists.infradead.org
X-Gm-Message-State: AFuF++nz06D5BqIDSpKYX3+UPXfyXnL4BygAAux2uAwiSFEyxaiJ4Xc2
	JOKryBMm/cRa5/6EBTgVX4E8NGnKPmDIjXebk8w+F8OtXrHf+Z3iyR9z4hZPYDYx8mI=
X-Gm-Gg: AYBFou21Y751mui8GtHiUVueDejyLI0ZJSjSEPtrdXSN1x+ri712EC8wueE826QG5df
	Y6NjzXrvS4xPVWnOIfzspkKtaGb5IL9G68qT1gIKWSrJ7SCJCouYE7CRcn5PZ5M5RSBpCOCMdrH
	h3DmTp6DQdzcoqmgc0mtOYRVhuUVTeFjwtwn1ddXdtmF5BedtuMaoNVQu8kWKwMfkMMZtAEnc6h
	1VpjneLf46T8uI+Lyc9pceDSBwle82sZBBEYJGlUXxZNxm/KcPsl+b1wlrDHnD5HORd8orKQiyP
	CNAdRJvRmd0umjEXOnzUtotqIsxPc65VFUGB0vjdFc/nc6jtCa7jEtYSOoO6evvr5cqGctQ7+e6
	VKAUvQtOxjPnuHYCFMkH9fhUKeDkuXdxWHwUk2bZE4HWq6MCxgoVOn1/ZP9oXUzsBUr0g7zEG+d
	14pE5bRaiGFxvJ6ldf4QuUewtx6YKXhMv/aGECsVvGigRSYPFOLih2m270o0DR4y+F4wbslLJ7b
	xzY965d17mYqA==
X-Received: by 2002:a05:600c:a011:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a18e447d8bmr38769485e9.2.1791556051602;
        Fri, 09 Oct 2026 07:27:31 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm102532745e9.8.2026.10.09.07.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 07:27:30 -0700 (PDT)
Message-ID: <77e7e412-9ee9-4a6c-9576-db4f8f673bf2@linaro.org>
Date: Fri, 9 Oct 2026 15:27:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] coresight: tmc-etr: Prevent per-thread events from
 sharing a sink
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
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
X-CRM114-CacheID: sfid-20261009_072734_151972_64B9359D 
X-CRM114-Status: GOOD (  44.45  )
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
> 
> Regard of the inherit/inherit_thread, I always see they are consistent
> within the same session. Should we ignore them?
> 
> Thanks,
> Leo

Yeah I think we can do something like this, but we only need to do it if 
the sink has multiple ETMs reachable, otherwise we don't need to do any 
ownership check at all. And we don't need to check the target either.

Something like this:

   if (sink->has_multiple_etms) {
     if (!coresight_trace_id_is_perf_started(&sink->perf_sink_id_map))
       sink->perf_owner = event->owner;
     if (sink->perf_owner != event->owner)
       goto out;
   }

If there is a 1:1 sink/ETM mapping, then the perf core exclusive PMU 
rules already prevent all bad sharing cases. Then multiple concurrent 
ATTACH_TASK sessions/users are supported:

   perf record -e cs_etm// -- sleep 100 &
   perf record -e cs_etm// -- true

This is allowed by the exclusive PMU rules because the two different 
processes can never be running on one ETM at once, and if there are no 
shared sinks we can allow it too.

If one of the sinks on one of those sessions is shared, then the new 
behavior is that the second session fails to open. (If a system had a 
mix of shared and not shared sinks, I think Perf might handle the 
failures gracefully and continue with a partial set of events/CPUs 
opened, but it warns about this)

We don't need to check hw.target because "perf --per-thread" already 
attaches to all existing threads (which are different), and we don't 
want to report busy in that case. We do need to turn context IDs on for 
per-thread mode though, because shared sinks mean that you might get 
trace from multiple different threads even in per-thread mode. But 
that's fine as long as the owner is the same, same as the existing 
per-CPU mode.




