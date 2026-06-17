Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AFACD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8o6FpowEVikyJSlF+fJiucK7IqeLK1mQod3QozTsco=; b=NkRC2cXiNCjhBBdErKI4zkHQc2
	GlCqEFIAQ5T1qQAoUyHqxDr2zsISa5ADotw65xrNyb7WTlU4y6eh3vNDEkTnovfQos7/qZzjLJjZh
	dd1MLgcRcEUtvu89yCP65fyMlJ/6RJiZZy7N4cz4dHvZacB7nUfJ7uPdm4NYNJ2mStKpeqqxLFZ6L
	OdTTk6DGzsHZhx2Tm6u4PLHj9QZASLHwEcZM/6S+vYp3Xkk6mXLTuM+5CdlX8tw0FOzGXaG+GPs5D
	DPyt+Z43l1M/0CfZbDzG4JoyvtH/nVUVd7oxkO4B8PWuKUKDCCpVf28UrFSnxx/eyFZJ1Z919ezAx
	LUJgtDlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnBT-0000000H1a3-2OHi;
	Wed, 17 Jun 2026 10:07:47 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnBR-0000000H1ZU-2pdr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:07:46 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c03a466c96aso477242066b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781690864; x=1782295664; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L8o6FpowEVikyJSlF+fJiucK7IqeLK1mQod3QozTsco=;
        b=Np8LCah53gEjt+Dpxhqb94JWiykO/CyzvCZ0z1BTODWP8BquwwKhE2BlZwDKA1mJTm
         kGYf4onN9g7nIh27REC11wSA92JDDU0YLWvsIqnKRk+snN86RGSa0neb+ivbDnNtnvSg
         EfVMJFCbkmdPpbW0a+q/wQJUMoI2gDjQdahhtIN3z7J/26TebZmDc4vmHPfMp9c1O/9y
         iaAMqf2nibO+CG+ct5gG78wXleTVcI2pWrx9Hq+4UiQWV9xefGc0zoAAbI6rI0r30Okb
         vtg7KHSJh5YxKpAN0l/w8CIAKcohzxdvWNXQLclOpb1AhXXxA1IY1FJRzQwkwO/Dy+Ez
         h2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690864; x=1782295664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8o6FpowEVikyJSlF+fJiucK7IqeLK1mQod3QozTsco=;
        b=GalZXdMD31z2Yc8oHumBzHptt9eaEQ5HSVxY0FFW/+FDTgONk5IEz7kcoYA/mCtPU/
         65hMkV5wDkRxNDyHa2KOjRuIXrEvUN46u8jSUyFRJAygB3FWJlfjSjEnQ3EveM8fZT4d
         xfqu3n4CY/+qvA/51LP1+FDYXwksK8kg6XQXRKHYoAiIb6beWZ79VwhUhFJnFrRCRH3b
         0hJkcc/8hpttxB45hZcLoKy/mma50pStHj6p3BMqW9cnq67Qrhbb7VsYeO/w4S4dJOGM
         J//fRmPauIkWfGm51g00JCa9o6yEvMYU5oqIZ1OTYx8QJ4f1kvY83mF3vNoCpYLbBlY7
         YCWg==
X-Gm-Message-State: AOJu0YxwqKjJ/duQMatVdEDXVKI3U3N5ZIfG9+4IQg/Lfu4F8ScKA5/T
	UBt0Y1QlyQLssxSt9i4lcjdVNtmGNlEKFgtGF+jKvpjU6A+TE2ULit/z7bc8Ot+RB4g=
X-Gm-Gg: Acq92OF8ODPvUve08wl3q8E4nt2JXmluwW09LzVPDLmi3nhkcgKSblDsM8pJ41zE7Wt
	3CqcaKhj93vDGAq2qVkKpORZ7uYXUbk6QHQtXcjhtlAdXT/RtVT872vHR8xY1WeBlYsxQ9PJqeh
	MRvNTeWriQa5s2aPPzigUonZ32k9BWVmDXafbHSxVwWCTRct1Cn/PRXR7WwXV8pPcyTe5DrHm9S
	NX5cU+jtEom15AmalnOv/wFzZvV4/p7DtbprF0lK6obpzxSj1pkoVKC9IiB44VQil/IfDBLmaJG
	os2tlYY6ouczNDbsQ+lVZVdivomLeaXJNO58gbXcZxO5E22zgoRTC1otx/wPnOz9M49QpQfepPa
	1zp3+BwKAYqvruB/436mgPWE/l97GEXrLZEDKtzqo0AEo6RR8RG1olw4pH/QIhjbZanPRoAIh8Z
	IZeAyErMIz65yjzWSISA==
X-Received: by 2002:a17:906:fe06:b0:c05:21a7:6b0d with SMTP id a640c23a62f3a-c05a859954bmr221241766b.47.1781690863765;
        Wed, 17 Jun 2026 03:07:43 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb51007a9sm758325366b.21.2026.06.17.03.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:07:43 -0700 (PDT)
Message-ID: <1b6fccaa-b15d-4a33-af41-8c445f9c9d21@linaro.org>
Date: Wed, 17 Jun 2026 11:07:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/9] perf cs-etm: Fix thread leaks on trace queue init
 failure
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo
 <acme@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Mike Leach <mike.leach@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Namhyung Kim
 <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>,
 Paschalis Mpeis <paschalis.mpeis@arm.com>, Amir Ayupov <aaupov@fb.com>
References: <20260616-b4-arm_cs_callchain_support_v1-v9-0-f8fad931c413@arm.com>
 <20260616-b4-arm_cs_callchain_support_v1-v9-1-f8fad931c413@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260616-b4-arm_cs_callchain_support_v1-v9-1-f8fad931c413@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_030745_735536_DB7EB4F8 
X-CRM114-Status: GOOD (  15.40  )
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



On 16/06/2026 3:51 pm, Leo Yan wrote:
> cs_etm__init_traceid_queue() allocates the frontend and decode threads,
> if a later allocation fails, the error path does not drop thread
> reference that was already acquired.
> 
> Release both thread pointers with thread__zput() on the error path, so
> does not leak thread references or leave stale pointers behind.
> 
> Fixes: 951ccccdc715 ("perf cs-etm: Only track threads instead of PID and TIDs")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/cs-etm.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 0927b0b9c06b15046afeafe23fe170b8248cfcc6..d484a6155c2c22fa916d0365987302f6bb9978e9 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -627,6 +627,8 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
>   					       queue->tid);
>   	tidq->decode_thread = machine__findnew_thread(&etm->session->machines.host, -1,
>   					       queue->tid);
> +	if (!tidq->frontend_thread || !tidq->decode_thread)
> +		goto out;
>   
>   	tidq->packet = zalloc(sizeof(struct cs_etm_packet));
>   	if (!tidq->packet)
> @@ -661,6 +663,8 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
>   	zfree(&tidq->prev_packet);
>   	zfree(&tidq->packet);
>   out:
> +	thread__zput(tidq->frontend_thread);
> +	thread__zput(tidq->decode_thread);
>   	return rc;
>   }
>   
> 

Reviewed-by: James Clark <james.clark@linaro.org>


