Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB1FC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/K+neFx7uoZLZLhEPqSvYz4Rq8Bad8pRnsZy2NkitOQ=; b=W0DRwqulI1Y4eeR/bSAD0ofHKe
	1geYqO9qWQJpB6CZorWOpjOGE75rOhnoOTEfL/vzktcPkbJ90LtoHa+1ameW1oHsMVoDno8WhKKxa
	QD2Ir5efzKjilI7r9Gz6Ioqwq8lJZjqDgGxT70kMhN3GMuYHnbzGrF/e6xO1Y/b5vpbuDN1DJaZ0f
	8mgZZG9tJgrl2VUBcqof0kRuwyksjFv50HQFF3UubTcjQOjq9dqE140FGJ/uGn1AhNvMZOrv0Wnou
	RNoAQDW6f8pvflcV4G0qMM2HyNQhb6d53g56SWuN7kjS6NKoLLSHaCtOeqbMXOZ0Drrhz4Glm21mV
	swFzmp6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9BQ-000000026vk-2R9r;
	Wed, 26 Aug 2026 08:40:32 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9BO-000000026v6-2HDV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:40:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-495590dde14so3544475e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 01:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787733628; x=1788338428; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/K+neFx7uoZLZLhEPqSvYz4Rq8Bad8pRnsZy2NkitOQ=;
        b=KDO1k0UJLJLCvJ99QJqFoql/bN+M+lyOXiBPrwlDE0MyeQQXZ3RAL61cQRk2mARlIz
         7EVC7upOAUuwTUvlTWWwASES2JGGuWDf4O8QVI9yfZL1ncjjdeeAU4Gc3f8PIif8uql+
         ryWq53Ti/paHzxaPuZePBjHc13j9mNH342cUHGOu6GaLyG6PBlsBdAW1CUAzfBFbUEej
         4DMGDnGgoMLIocP+RiWF3ONkfovDwl4AV1NBUJsG7wouzP+QIX791OHQcarzJi6nZBEI
         +AewW0F5v8p8Gq04bol2GPGZFz6chGN8J1fxubbGYmmPkHNFjn0mgTBjwuTefZFSfISg
         RLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787733628; x=1788338428;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/K+neFx7uoZLZLhEPqSvYz4Rq8Bad8pRnsZy2NkitOQ=;
        b=AoNruwUENqpAdRDbZihF+XDwCixN+6QPVwipDiYD6QXlPs9vUxMcDwjibcUOpw+juv
         RDq4TrK5oSO8ECrKXyQ9d8Vt1EuiQrjPqYIwLWRKAEl3HWhBdBLRIRc7piugHnZEvsr3
         XpVXv8tOxgnyRhq/tA/8tDjT60tgyrM1tMrWnzk4q1Bw2X2OxAjEqNH3fbANvcUGUWS2
         QjOr9dBVMA2/SLt2O/dIv63fmcyUVBLr7Q7iNRwXzLe6CirkJqGD1ROmiX2K8KD2ZOLJ
         USl33PhtEPD3ooLHz4r9Rqovo9CVy2BZgY3ATzelUZ0vEbjotTIoFlYFjhII1K1+PFhi
         fIBw==
X-Forwarded-Encrypted: i=1; AHgh+RqcOPL68SKj7shrgkEfje6zLjnJhVxha8L3tKXMoatJTi7aMJX3IZWdIJu1ziu0yh/MvjNdabxCKOat56cpvEVv@lists.infradead.org
X-Gm-Message-State: AFuF++lQssI2Bc96/fIpO/zgAK39N+sN5hLCkCQvk1QlsdPdhy/DQbct
	dlmtxyTIi3Lgk5P4E2naPRO69KUPLTKEIc6KNYoFQFtFGaOhQpa2T3m2jL7ykSzLFbY=
X-Gm-Gg: AR+sD11ojpFtvbsK8eFU1kPTnbowvKF3X3T43HP/tz4ROG4FGFsNrrrPa1aP95pNiaX
	acsdl7mIv7gODtFb9M1hHmQu8Xnm58oEdX8jhac+JMZ5ckb/OE9ZjUOTXVg4Tku/j8iaUEjFl3c
	9t1bY8K/9JfgvhJFQ8UYrb8CvB0Z/b+ablNpznpCaVA3XtNfmPolVS9JMVxB5i5FB1G+UUsKZbj
	wNPv2kbZaQpoSch8oAuiAdnVKCNgtFzkOygeEcd38mzt2tselZnrimsJn6hvrxizga9RNUu9idy
	x7L/isOQHpY7Zqu3Jf84mkUMpM2DTMkd8bPEI0E7SKXkBxSOxDMSOvWTZYcahdugzzimCVuUbd0
	gxzmbFaflZLlCd/S5Sn5y0POVFCAfwIBJ4xc5WARmWiXEIEzcjh4FMS0v5UY+MFSkPkgvuL1vJy
	WFyLx6YRkUdPP5XnL6E+sY+85PxC+LrssG+JRSjd6CX9dJyUigTb2JRAa/bgY1ig==
X-Received: by 2002:a05:600c:8518:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-499dc6e998cmr45290165e9.3.1787733627757;
        Wed, 26 Aug 2026 01:40:27 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab574sm2001609f8f.14.2026.08.26.01.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 01:40:27 -0700 (PDT)
Message-ID: <d833aeed-7376-48af-b772-4fe4ac66471d@linaro.org>
Date: Wed, 26 Aug 2026 09:40:26 +0100
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
 <a7e11c2c-fd83-4ea5-8218-29a5af768578@linaro.org>
 <20260825173220.GG8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260825173220.GG8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_014030_638052_D3CD9174 
X-CRM114-Status: GOOD (  44.02  )
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



On 25/08/2026 18:32, Leo Yan wrote:
> On Thu, Aug 20, 2026 at 12:09:25PM +0100, James Clark wrote:
> 
> [...]
> 
>>> I am just wandering if we can improve the sink driver to only allocate
>>> a single bounce buffer that is independent of any threads (and any
>>> associated events).
>>>
>>>                   | T1 |
>>>     CPU0        ------------------------------
>>>                      |   T2      |
>>>     CPU1        ------------------------------
>>>                                  `> T2 stops and can sync trace
>>>                                     from the shared bounce buffer
>>>                                     to AUX_BUF(T2).
>>>
>>>     AUX_BUF(T1) |                            |
>>>     AUX_BUF(T2) |                            |
>>>
>>>     ETR_BUF     | Bounce buf                 |  -> Used by H/W trace
>>>
>>> This might also simplify the CPU-wide case. Each CPU would still have
>>> its own AUX buffer, but the ETR driver would maintain only one bounce
>>> buffer for the shared sink. A reference count could track how many
>>> events are using the sink, with the final event responsible for

What size and mode (CATU, FLAT, etc) would the one bounce buffer be? 
Isn't the problem that a bounce buffer per-session solves that the user 
can pick a different size and mode for each session?

>>
>> Isn't this how it's already working? get_perf_etr_buf_cpu_wide() allocates a
>> single shared buffer with a refcount. I didn't change this, I only changed
>> the rules about what is considered shared or not so that it matches the
>> semantics of the perf events that back the tracing session.
> 
> I think this is slightly different from my point.
> 
> The CPU-wide path already uses a shared buffer with a reference count
> to support multiple events, while the per-thread path does not.
> 
> For the longe term, I would prefer to unify the sink buffer management.
> Ideally, ETR/ETF/ETB should manage the sink buffer in the same way
> regardless of whether the users come from CPU-wide or per-thread modes.
> This would keep perf event semantics out of the low-level sink drivers
> as much as possible. However, this would be a larger change and we could
> defer in the future.
> 

I suppose I'm a bit confused about how it relates to this fix. All the 
buffer management stuff is transparent to the user, it doesn't really 
matter how the driver does it. This fix fixes a bug relating to a user 
visible behavior. If there is a way to simplify the buffer management 
and preserve all of the use cases we can do it, but I don't see why it 
needs to be done now rather than later.

> Now I treat the multiple events in per-thread mode as an implementation
> limitation. For the immediate fix, we just reject this case instead.
> 
>>> We use a central place etm_event_build_path() to record and compare
>>> event's owner and target process, then we don't need to spread the
>>> check into sink drivers. We only care about if owner and target must
>>> be consistent.
> 
> I experimented with moving the check to a common place during buffer
> allocation: https://termbin.com/dib3r
> 
> It needs locking to keep the check in atomicity, but seems doable. We
> don't need to spread event checks across the different sink drivers.
> 

I agree it would be possible to do, my only argument is that it doesn't 
support all the uses cases that we currently support and that are likely 
in use.

>> But we don't know where the target will run when the event is created.
>> That's why the check is delayed until etm_event_start() and the process has
>> been scheduled. Where it runs needs to be taken into account to calculate if
>> this sink can be shared.
> 
> Adding the check in etm_event_start() makes the result depend on task
> scheduling.

I didn't add it, it's already there for owner PID so it already depends 
on scheduling. And not checking target TID leads to a WARN on 
etm_event_start() as well. So nothing is being added, just the existing 
check is being made more restrictive and the WARN is fixed.

> 
> I understand some cases you mentioned may benefit from this, but it also
> makes the behaviour less deterministic. I would prefer to reject
> unsupported cases explicitly when opening the events.
> 

You didn't explain how you would account for taking away users' 
currently working use cases. Two users using taskset to run on two 
different cores does behave deterministically. But you are taking that 
away from them by preventing any event from being opened that _may_ 
share a sink in the future, even if it never does.

Taking away concurrent per-thread sessions seems like a huge 
functionality loss.

We can agree to do it and change that behavior, but that's a completely 
different change than fixing this bug with the existing behavior, and 
I'm not sure what the justification for it would be. "Determinism" seems 
like a weak argument when the fix is to make the driver much less 
flexible and useful.

I don't think we would want that change to be a "fixes:" commit either. 
There is some chance it would have to be rolled back if someone 
complains, and then we'd get the WARN back again.

> Thanks,
> Leo


