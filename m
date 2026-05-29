Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A33CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 09:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vV1zx1+zZXbYX7ohob99roya0Trf7vZYsGCeAF2uekc=; b=teOTMTyvp8gZgtE1fPgv6zPVIG
	R/OrERuRVnosbAhqwCygXPszRsTvz0tCuFyBaCJsI8ZyECEiGawmLa3W/XOciIPyIheoLR62MGu/B
	msYL/yb4hnxd2EUx5HJJDys7r385fUWVwoGJLFD6giiQTvCo6Hx4FbPX7jMH6IiDqd/B4vINH/Men
	3pyF/OkH+oieC/P/gXlURvBis0yXnpUk5JOeKOJlyq7RonTr0WwgYEa/kCDCNqzSy352IKavtGOt+
	c5yfLP8s5UReQLCvYhw86qGAQGL7+mMS0xIAeQPOPQu+69Y3XtvuVl0Dnwht628yEsnA0mcNcTR3M
	p8hRVxyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStjk-000000075FI-4Ark;
	Fri, 29 May 2026 09:42:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStji-000000075Ee-2rnY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 09:42:39 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so58876195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 02:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780047757; x=1780652557; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vV1zx1+zZXbYX7ohob99roya0Trf7vZYsGCeAF2uekc=;
        b=nDWABpICxNRDPUnSEUDMfXBzZNl/vzYm6BV4QGvKjWhJS4sWyjDLk9+FUkI7Xechx/
         BriD6Hcn4ZOFsYObTKA6KLjqyq4cUtDv8F7BSshYWCSFcBRmVSrYmBCb9J8aS3Hed06j
         EQULokY7TJxuC3rPeEjrxuqm/yzN7RgFrIOz6mkVlq5zd/oeQocJ4jme/v0XTEzn6Ah+
         SW4yNpWLWBSZvrX5FkbzV0FTtDW6b1SzlSBNkVUU0/Lkqk2HfxCK8mKhOj5i9DJaE+y5
         UjoBzrwDx5CQC9y9v0TZ+V4y+eNluU9hxmtQtsWljVEVzPMMCtljMyn65v7ys6EX1mPA
         2zUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780047757; x=1780652557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vV1zx1+zZXbYX7ohob99roya0Trf7vZYsGCeAF2uekc=;
        b=cxl+jDIeiI8ANEz/wx4SnQ3kq0NBFF9ntnUfbb6BFAcUx/xxE06664TwR7BUgj1i9e
         /KmS1YVoxoSrSbIFqyl82L5inrcnwPGteodSAa9/5+esP2EZUo4mWV21KUwCbWH2SRH4
         FYs5QFfoiC7MXSQAkHt9B6EEP2w9c14ADNk1Z9lZRXl9yt3gr8goTG5xhUa1aHEI8Nx0
         0zNdUlT1EZWpWRmuTjOrEl1Fm6pdmvwvc3BwKRAJEufWKNGbvgvHlCUuptwpQMlHy5Yi
         K0BYwuZnmtF/PBHoLc9y+Nov/WV7oNlARJh/djhjPRySxil07uDjr2u3qSfo6OdhAT7q
         1N7w==
X-Forwarded-Encrypted: i=1; AFNElJ+8eWLwkobi1pCryWlz82pnFso2t5AIBhFSOao59LP8RbeKzFuGbZt5ZvFd6m7HfyDhHozGPrRzpqUCvKu/oYoL@lists.infradead.org
X-Gm-Message-State: AOJu0YzPl6QzdDagCzaZjBr0pZp+qY+/gWbhmp2a4YPyTepbQ5SUdAKT
	DWpSTQ1FlvGAEmiIXzEj6a2G8fCyfO7gBIIbG6+LR5uUp1oOVWwC4luQC2AxYNjRfMk=
X-Gm-Gg: Acq92OHUTV3kZAUO5rYI0O93aTF1Rb+ubgiL9yOFXVGpglhY3iHX0ejTJrBnaPLPhsi
	EdSDo64G0Z7DJ+082z6ybAz9aDkBzbeRS4qZO50SIOaJlOjD3RfG38LcljlKt2kpcvTYnZcT9CW
	dhjsg0TgAmGY1EtW0RVCPSUeXZZjZujliMzNTzDKOcG0amIeKIjYoIE0WrEn2jDbsK5xO7naPyV
	0h6JuqG/s7MTH88ff4cTJvICAF8/Udqfhgon18AAmkIhj79cF/0e9a8v25C/3IyOlArB6Z1ExA6
	FycJjedXY931HnyrZiyTjx/5swWgjjf2EPFhW+OPacZR61vjRoiVoR/FzxBe491Bsb1zlOuztQl
	qn02FgSPqBIj7QcD5azVJC8+SrWG1lZdFb/KJDM0Zg9q+c4+ymfaXt9AI8kkKLlxDnRGjNkHQyu
	8L0vkeSWFvTDHX4l8vpVTt5ujHgFWST35Y+KEtC9A=
X-Received: by 2002:a05:600c:6008:b0:490:44eb:c1e0 with SMTP id 5b1f17b1804b1-4909c0ac911mr29067875e9.21.1780047756739;
        Fri, 29 May 2026 02:42:36 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909ca72cfbsm33571475e9.8.2026.05.29.02.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:42:35 -0700 (PDT)
Message-ID: <bf58d60f-1483-4832-9424-5e85e0e5f943@linaro.org>
Date: Fri, 29 May 2026 10:42:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf arm-spe: Don't warn about the discard bit if it
 doesn't exist
To: Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>,
 Leo Yan <leo.yan@arm.com>
References: <20260410-james-spe-discard-warning-v1-1-985c02756ee4@linaro.org>
 <20260513102024.GE34802@e132581.arm.com>
 <CAP-5=fUoebOVhWvTbgkyY6erZJjbLRbRVk6oauVKjtHGGgMyaQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fUoebOVhWvTbgkyY6erZJjbLRbRVk6oauVKjtHGGgMyaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_024238_748920_2E47BF2F 
X-CRM114-Status: GOOD (  14.46  )
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



On 13/05/2026 1:55 pm, Ian Rogers wrote:
> On Wed, May 13, 2026 at 3:20 AM Leo Yan <leo.yan@arm.com> wrote:
>>
>> On Fri, Apr 10, 2026 at 12:05:12PM +0100, James Clark wrote:
>>> Opening an SPE event shows a warning that doesn't concern the user:
>>>
>>>    $ perf record -e arm_spe
>>>    Unknown/empty format name: discard
>>>
>>> Perf only wants to know if the discard bit is set for configuring the
>>> event, not in response to anything the user has done. Fix it by adding
>>> another helper that returns if a config bit exists without warning.
>>>
>>> We should probably keep the warning in evsel__get_config_val() to avoid
>>> having every caller having to do it, and most format bits should never
>>> be missing.
>>>
>>> Add a test for the new helper. Rename the parent test function to be
>>> more generic rather than adding a new one as it requires a lot of
>>> boilerplate.
>>>
>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
> 
> Reviewed-by: Ian Rogers <irogers@google.com>
> 
> Thanks,
> Ian

Ping, thanks


