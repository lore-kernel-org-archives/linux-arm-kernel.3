Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC498CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Is9Os2uASlIKNmi1KYsxRAgrLVybqc2m49x4ZEtQc7w=; b=DaqayivvJptI/K/76d/PSAsjx4
	T4/JXpoGN92u8mZth6hkOjEtastGPtmxEdHu6KHcRAz75xOEEJvmZhOBHMisbii7GaJQX/dXyro4a
	7PNXrrrV8CYSBBRyZiQY9mnYUoBxt2gIhudib+dbReJAWBzMQZFMFJUDl331GszNiA31eSQUVkVpD
	XzDimZrgW0L+GHaAmsUOhjl5roDVGYIitIW4J2aRk2w5hyAxeGeu6iXEkqJxYnVuCpjaDi/OMA7Iu
	PJfRA05skFq+bQ33iOIFyuaeyJHUvpf4rw3imGjnMUTZFevTOAhCKl0hYwo/YN6A9REyzoVq1Winx
	jjd3wdiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyfS-00000007atA-2Bu2;
	Fri, 29 May 2026 14:58:34 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyfP-00000007asA-2SWE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:58:32 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so8478683f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780066709; x=1780671509; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Is9Os2uASlIKNmi1KYsxRAgrLVybqc2m49x4ZEtQc7w=;
        b=HZVBNJx6poiRSjzmNOKqKxus21UzqczB6fYOfTjiGxcK/+yHmqjMH4PyzOylSsEuon
         yeXy9qvZ1NQ9TwEKV9sGGAtTGLe18Z3BymCxaNQkFxhOdR2FL5UQipqgJeBVLs5hVhPX
         XhEWZGzjnybppUb8K2hjOtFqW9201Qpaf8bdIG1umGgSB8Tjp0rkj4b4hmUZOtEYQ8zB
         Z6JDhvnAe2VEnnGa/ggSrhkOPf1G+9yuK13fZZgTRHfjtR8Eqea1+DRfLhnO3a3zCHGX
         SeMl+QKm4NMpUOzTHfOWzif1Qo/N3ebXhSS4zD0UqnKlMHbJNY/oBTLN63KuRUNO5LUr
         qokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066709; x=1780671509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Is9Os2uASlIKNmi1KYsxRAgrLVybqc2m49x4ZEtQc7w=;
        b=riFiUY/UXLwzq4QDCpOA7jC5U6s8JdsovUKG7MXwKx02ZMidyu0l6yDrX/p6KqcXlV
         kAbomJ8nwgbyhdeDgQRLQrGZOzZSBqYYTYqkpjU9xeXS9gJRfoYR8gqOMa+KjuYiJv+n
         PgUxW6tVhUCxbJyMqqmQmoZLmcXdetZ0+fSAiaFrRz/mAtMhgidFUJ9bFKeHi5d9ZjU/
         uoT/76+R/ap/rTYo99jth8u9jQ4eXWRlJVIYP86PKLkyzqquVGzQOAdZcRepTiDR0sBr
         1dFOmpzfKWeweIphCM+A1EsMoSLlgrImMqv2D3BiP14mezEC57vTGzlDDzRg9xm8fP3E
         SJwA==
X-Forwarded-Encrypted: i=1; AFNElJ9Ei5rHkkrCEOdPPSAt/tIAGzLk2DPQGdL8qHmiBYl+LxSdPyiihXLPKeurMwPGrhFClqJnLviUI9DHci8xY8KZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwI+E4QLOqsNFEP09qN5rkCYrSPX7UBd9woAyR3bfh/bJDATJR9
	74ZxDQsA4BXpYOezAri9KsEwN3lRkgPeE67TDAfJbT+b3rEbGPah1Nc0V6Ed0LT9GUI=
X-Gm-Gg: Acq92OGsVy7stJZR9t+yjZxreL3atg7Mr97yyDQ0FES7z2jIkxDUhJHJ2zPycu5+I4c
	TbswgoZzGuZ1dWOF9s0j1JZS1yR9/51SzcIBQI8o6LkahYaOOoKSi+0pagZe0rZNOvevfr/JilX
	4PqRYm6y2QHVxNsTpzIYI2p3t9xjZrH64SzacFZ8igLhwcLkEbSaAzuzqrJ8jl7KjeInAgeUyW+
	qwGp4J9wFU8iRYvyBwxCb32RiAn6Y1ayP5/C2mrPULaH9FpnWzuE7Tt01HD2a3WwI5jsPnMhxxe
	R8P03V1tHBmKOsFWJTDUKZPYPq/eA09zgBDYncqwCe6qk7fMJAJSxpro7QTtYqeVlGmhbUI499f
	IzB7Ovcz8W1WZV4MNk/XNnsXi04mUS1AE9NRWzQzHI6Dd4mH3OhiIwlYlvMloQqrko6caPZLMel
	Y0QyPZG40WIzoTy5md8M7IUt39H7Ar5D3fiLeE380=
X-Received: by 2002:a05:600c:8b10:b0:490:5cb3:e94a with SMTP id 5b1f17b1804b1-490a2900d9dmr387565e9.2.1780066709614;
        Fri, 29 May 2026 07:58:29 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909ca6575csm79932415e9.4.2026.05.29.07.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 07:58:28 -0700 (PDT)
Message-ID: <7dd351bd-2695-4eb1-a875-c859c9711d72@linaro.org>
Date: Fri, 29 May 2026 15:58:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] perf cs-etm: Queue context packets for frontend
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, John Garry
 <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Amir Ayupov <aaupov@meta.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260526-james-cs-context-tracking-fix-v1-0-ebd602e18287@linaro.org>
 <ahmo6AF3oGOvdzT8@x1>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <ahmo6AF3oGOvdzT8@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_075831_650636_30220485 
X-CRM114-Status: GOOD (  17.54  )
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



On 29/05/2026 3:55 pm, Arnaldo Carvalho de Melo wrote:
> On Tue, May 26, 2026 at 12:14:35PM +0100, James Clark wrote:
>> Fix thread tracking when decoding Coresight trace and add a new test for
>> it.
>>
>> Unfortunately the test has to be added as a separate binary like the
>> other existing Coresight workloads which needs a bit of makefile
>> boilerplate. Ideally it would be a builtin Perf test workload, but Perf
>> has a lot of dependencies and generates a lot of trace when starting up
>> which makes tracing tests very slow because all that has to be decoded.
>>
>> Hopefully I can find a generic way to enable Perf events at the
>> beginning of the workload and then I can migrate everything from
>> tools/perf/tests/shell/coresight to Perf test workloads, but that will
>> have to be done as a separate change.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> James, there are some review comments from Sashiko, some looks
> legitimate, wdyt?
> 
> - Arnaldo

Yes, and I'm waiting for Leo to take a look too. There will definitely 
be a v2.

Thanks
James


