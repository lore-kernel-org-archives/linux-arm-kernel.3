Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F96D49232
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 14:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7sHdy2ADgTZPMkZ6aLR22PcGlzZUf/wOZQV/WRzdYkM=; b=BO4vq0sFKXzocCYJsA+j0JazJ9
	WP3s3ZlhvUo9bIjvfzUi/e2DV0PlLOhWJreMqFUlm3pyxyVEewMDF/xP0W+cOopLfnO4AEn6fER82
	AVuxfg6f7PxloyGaNkW1nnCdW6R8tDcLe+DJuL/4gRxlmbZUBK8bFLlQlirc8wMm9ZAy8FGWI604Q
	/e7ufoU5LgejmXvoe+KfQq6vzlmx/PpyvuG18KEC0RO+fFfwaOu6G+JOU8HYuW7MGA9XDhozlMK8y
	p5RahHIILSjZYudZ2QX5OJomVzgJ7zhVSeyP71ffKLrXJu9gZ47I1ksDWi1mPU9EIFGtDk86HHF7u
	zyT0ljdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU4Tz-00000000dO7-2L7Y;
	Fri, 12 Dec 2025 14:50:59 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU4Tw-00000000dNk-2EbN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 14:50:57 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so2388969a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 06:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765551054; x=1766155854; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7sHdy2ADgTZPMkZ6aLR22PcGlzZUf/wOZQV/WRzdYkM=;
        b=Ts/WXU6UMpZo+F+zlSeKoKOJgYiqBMmti4/v+o1Pr9BJ1lrCEPWqGsqUgIHx7ERcZ3
         Ff47YmWqDLyfK1IyOFwFjlhBLmN/8Pcs+xwWyU5BHBcJm7OoEse1mxr1IUNjZINmRLVl
         EQucI+4FTyy9Bk/sZtvUSgNSDgTUhcf16RP7yvbpIH/EVktQ4uMAZihLQd6vYKJ+K3hP
         +08m1yQelaCrIJZsFpTy5htQMZpLbLGu5xushB16ehqCMwlsZZmtQYBsSiNZ2KauZTYm
         c6AJTjndErGhPpN6OH9wxpzdcNCh2DQ000X0YcQDaEeEIJHSBy/ZoFpwADohi6gz/9M+
         IHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765551054; x=1766155854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sHdy2ADgTZPMkZ6aLR22PcGlzZUf/wOZQV/WRzdYkM=;
        b=DTLzlIIBLiCqZBW9RnPZwBLf6RRFbdL/iz5/5PzWz4uAguQ4BgPNu0cfgW37blh/+R
         jt954Z6OiM0P0duicf5qYLYPhRR8UZbzjt1zJQ2qIycKgTM1Fc4/aqi7FVxugF0QlCL6
         bF4Zs+R+wmURuESmgrhoTjAGODZaFbLzzWCMwUeFzk1Rr15J0wlJnaP4Atf7VKrEGQyl
         W2J64RfxUsp+Vk/i9i5vAr2E+6fawaR5JvhEDALEgCZVyuYlnjqvnTydEnG5lYttazOt
         xT0/rvKrMJis2N/WQQK3ITpJzmXXnZUGMrVZN5xMjo9wzQttSJwo3YOctqOA+sscLpFr
         T/hw==
X-Forwarded-Encrypted: i=1; AJvYcCXCqUgU6ImrCosvQFUbnDqRoCqReBynlPrFIjCXVGaSVhMeTuTHif0TYGi8XHVYblB3WM1l8loQXUUPHlFG42RB@lists.infradead.org
X-Gm-Message-State: AOJu0YxbCidh5/0aUJ04PvePth15zqiJMnCrLhSN6govS8sfhmBTg9r+
	qY2UcQ51Nyez3iDz7QTJ2aCB7IQZOhhaGJdOmgjHyoCMRyim+YvAtPCuK4wEramCtsU=
X-Gm-Gg: AY/fxX7nErCVDocIsoctePWYs9ApkWw2tc967lcRsB0GwC+hzCe0iAzh7qKM+okXzIP
	8q2kI+5qRLDHGa9OGXLIvqGo8O/MyKrJJun2JYQofWv6Jom14COBKKf1La6curKZfuUob1pI8LP
	EDvaEmY8Bz4JJpbrm5DeYu/3MMf4og6EnjAwVCbqrORFbRZAPUYW+HcZnvX8MuIldrj6BIKq+gz
	jxuwzfovBgimZ4w+015SHXUJ3YYVVhqnQ2iiibcB97cDHu+Zq8EinvmVipP7xVoXsCx+gr4wNwm
	IB8Rip+f83PqT+2eVImSiCpIGIuYBItoh4Kj7y5JloEER1WKBd3opFs9BCo9xDU6hoQtIQwsmjl
	MtUPdVxCtRPeKhCrM8/WI55Jc2BjaLVl1ktdZDYj3LXcUDBkyIWhXxyyY45HWifW9lDX3FLOMdr
	mtiRJeLy2DULWYK8iKdzbQ
X-Google-Smtp-Source: AGHT+IHbdskdCmAkYG3vG2sMYEBW2mjhBkod6LOvZhTWtcYM3sRHnERtPgTtm3eIUz9lQUSEGEvdcw==
X-Received: by 2002:a05:6402:35d0:b0:649:8a7f:97f8 with SMTP id 4fb4d7f45d1cf-6499b157415mr1924358a12.9.1765551054515;
        Fri, 12 Dec 2025 06:50:54 -0800 (PST)
Received: from [192.168.0.108] ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64982040fbcsm5499695a12.1.2025.12.12.06.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 06:50:54 -0800 (PST)
Message-ID: <27417fd5-902e-4474-8d60-356a94ac9590@linaro.org>
Date: Fri, 12 Dec 2025 16:50:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/19] coresight: trbe: Refactor AUX flag setting
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>,
 Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-7-7da32b076b28@arm.com>
 <a638f74f-94bc-4052-b8e1-e940aca2d4ce@linaro.org>
 <20251210154308.GZ724103@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251210154308.GZ724103@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_065056_626359_65EAD71C 
X-CRM114-Status: GOOD (  30.01  )
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



On 10/12/2025 17:43, Leo Yan wrote:
> On Tue, Dec 09, 2025 at 01:37:39PM +0000, James Clark wrote:
> 
> [...]
> 
>>> +	if (!is_trbe_running(trbsr))
>>> +		perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
>>> +
>>
>> Do we need the complexity of COLLISION (changed to PARTIAL in a later
>> commit) and TRUNCATED at the same time?
> 
>>  From my understanding, TRUNCATED would be when Perf is too slow and we want
>> to disable the event for it to catch up, and PARTIAL is when there was some
>> buffer error so technically we don't need the event to be disabled, but Perf
>> still needs to be notified if we want to start only resetting the decoder
>> when a flag is set rather than on all aux records?
> 
> The main difference between the TRUNCATED flag and the COLLISION/PARTIAL
> flags is that the TRUNCATED flag implicitly asks the event core layer to
> disable the PMU event.  In contrast, the COLLISION and PARTIAL flags are
> only stored in AUX record and no additional action in the event core
> layer.
> 
> Setting the TRUNCATED flag would be a over-killer if the buffer has
> free space, as it would run the expensive sequence of disabling both ETE
> and TRBE and then requiring userspace to re-enable them.
> 
>> There is no happy path where there is a buffer error, so I'm not sure why we
>> need the complexity of an extra case? There's no harm in disabling the event
>> on a buffer error. Also it's hard to see what the exact scenario for PARTIAL
>> is, because we set truncated anyway for fatal statuses. The comment in the
>> later commit for the PARTIAL change just says "trace was stopped", but not
>> why.
> 
> The trace can be stopped on Fill mode (stop on wrap) or Stop on trigger, so
> it is not (only) about buffer error.  In these cases, even though the trace
> unit is stopped, the buffer may still have space available, tracing can be
> directly re-enabled in interrupt handler, thus the COLLISION/PARTIAL flags
> are better choices.

I suppose this is the bit that I don't understand. If there is space 
left then why is the stop hit at all?

For the other cases, I agree that it's overkill, but my point is that 
doesn't matter because we don't expect it to be hit in normal cases 
anyway. So it's worth the simplification of not doing anything different 
than TRUNCATED.

> 
> Only when the buffer is actually used out (i.e., handle->size == 0), it is
> appropriate to set TRUNCATED flag, since at that point we must wait for
> userspace to read out the data.
> 
> Thanks,
> Leo


