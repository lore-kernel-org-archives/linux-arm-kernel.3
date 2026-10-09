Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99777CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 09:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgzMN7GSKW7bwxrlr1yTEXEUokyD0aM/o483mXV6npk=; b=qB5cWlm246O27b9PORwhkg1+iu
	eJGQ3rKmz4AVPSLYp9sTp+UNiGlHzKWUvf9XBZVXUtXO8cMvTsZdwJI1q5SEWnerSt7xcR/eghh2C
	9XloajdpySo1K1T51rw2NmXBP3NGLcWefIOdSWUPUthjaZ6iJ6bFqXNLzzI/u+cv8pfvj255e8mAe
	wZX6g/S1Lk/4FQTzr0YrXlpZVWwUEJAxOyCln+oAZY8ilRcSlUt5SpfZGjGgXVNEd8YyDwty38/N2
	NrXmRBiEc7BsPfGOmjps78CPF+Clh4IDZt6MpwS9UobRPAQ5/NrKTyQTpmylCLw0f7YLG+gXizUq6
	8+3DCAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6rW-00000005uV9-1Bsz;
	Fri, 09 Oct 2026 09:25:58 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6rS-00000005uUm-0MEg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 09:25:56 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso3637003f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 02:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791537952; x=1792142752; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgzMN7GSKW7bwxrlr1yTEXEUokyD0aM/o483mXV6npk=;
        b=bO/ENQLDNXWT4PG8YnKQTbCgTVxi2FcZ3TM3Iclj2yD/yjffMIkoVDxMTpqcy+C5SM
         POV2rd3yy3rU+AUEwJKtNlFrqcRTM9hD6ziDLcbDfch9iGKIWqVOPy7Bxf+XQ6h7nvwj
         4QPYfzqZhXNOhvb5Yw2U580Ij0y3BNFJVkzUAqrSqkzUKFD0GcZZsLIZ4zSpapERp8rz
         EWUhTNPCACnLfCZDxZhsuGqnvV9ezWYgF9+znEk4FBUSsXiBoFsMvNXK9YRnT5zd6IPp
         uyv32DoPYLu6DAuNxAclePWBoLSBB1IXs4Uu/KMNquDf43bOxLwe+PXyCuakHIXb2FFJ
         9pQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791537952; x=1792142752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgzMN7GSKW7bwxrlr1yTEXEUokyD0aM/o483mXV6npk=;
        b=2lqSRx47eRC3IrKjHlhYOm2NPW6Q7zK0uY7Nm+hazJSCqSFv8iZAJGBAtHIJW/gUSr
         wuzdeehww1xFkVlDcP1WW/yVYc+ib8Cmo6CsyC1Dl2wngweA42+yV9yiKqreJryk3kWV
         sigV2l6EHPCqisWWzOFmdmVvuz2Er+z6ubbc5Gr7hnpKXvKchAtgkaE2EEWBTowxlGug
         TKLU1R+YHAtvnSmfwDlUXobZ+yNR4DVrBzmWk9zksnpnB0Xi6onz6Hfc8E1P3zLLRGdc
         2KxPGJ2CKU3EfD22w9t406cMAM9o7EkpUU73LkAeePVaisKsB+C1bQzYm+a8fupY8H4v
         6buA==
X-Forwarded-Encrypted: i=1; AKwUvBx/4i1mNiMD9lmAr0OgZhbKDlwcYupD2QPsOXsxVQCz+hgflKv2PBtWMY3ROJ/LvAm/kcvqvN9vQc0JvtUrvjvD@lists.infradead.org
X-Gm-Message-State: AFq9FYLPjUwPVoK7D8XQwW5RYEImhfe9wDB94gI8/Dc7UJjCT1WXg8XG
	Xr6mPlKA5SkT1N0nFuIv1ZfOurcQKLX7zXEftiNIAmBgaAQz0aG+1JcEj1jt2mhVZXM=
X-Gm-Gg: AYBFou22OEI4ILcbahpLT83YlgiupDnzijBFJAL/MamdRx6Y8Z5ZwPovJlKvtxkWtfN
	CCRQL7znGqhB6WkRKtSKd0u6g+FNZEkt6CdQgBDijl+wA2oEnHXKOmss+GasQOqYBrynrCKCCHm
	A/llbPDwRUp0WdfUkDp7jsnkyJnYV/CVnn2RYud3qiZfYAvgAOdw9IhZK4sZuFWqnqi4thLlpzb
	YmB/L24+QsJEfUujymMDtiY2tZ3t1JWtq9K12crpLaUYLIFxuscGzaevGq8081HKoWlp09D4o6q
	1emkxC08ljqe2TGple5FpuGGlsnPdYvb4Z3VO/wok3a/KgJGk8MZV4tnhR7IP9vkqtSkuI/DCnT
	XBAPI1I74AFd5BTSy7xy1MCOXVIhkERgE42KBVk5ckmJ+ogsWesQqpEBHIUURGjg97DmdG5SgHz
	zm/JOcYrKnqbP9wWSUHP3/wbl/GU1TGH3QkpBuyw9k78gfMuwm9vlSXPsE/Fq3hGzWkyGioLOGX
	RBZBmEoPbCG2w==
X-Received: by 2002:a05:6000:2301:b0:488:8ab9:f74c with SMTP id ffacd0b85a97d-48dba77cd61mr2451398f8f.3.1791537952139;
        Fri, 09 Oct 2026 02:25:52 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9462ebcsm3297499f8f.8.2026.10.09.02.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 02:25:51 -0700 (PDT)
Message-ID: <f66a803f-6355-45df-83d0-bb6d29afb4c5@linaro.org>
Date: Fri, 9 Oct 2026 10:25:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] perf cs-etm: Queue partial AUX records
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org,
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-doc@vger.kernel.org
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-9-00c4fd0701b4@linaro.org>
 <20260827170936.GO8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260827170936.GO8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_022554_177181_D06D3255 
X-CRM114-Status: GOOD (  13.06  )
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



On 27/08/2026 18:09, Leo Yan wrote:
> On Fri, Aug 21, 2026 at 10:49:07AM +0100, James Clark wrote:
>> In snapshot mode AUX records may straddle the boundary of multiple trace
>> buffers. Currently we only queue AUX records whose range is contained
>> wholly within a single buffer.
>>
>> Fix it by queuing any partial AUX range that overlaps any buffer.
> 
> This issue has already existed before this series, so need a fix tag?
> 

I saw it as more of an improvement than a fix. I was hesitant to put fix 
tags on everything because there can be so many different interactions 
between the changes.

Maybe we can leave the fix tags for the actual blockers and asserts etc?

>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> Otherwise:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>


