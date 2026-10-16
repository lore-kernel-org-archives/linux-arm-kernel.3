Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A082CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jpDLmMBbHfkeVF10s2tGINPrgBL1dTjWhJOL3aqJTw=; b=YoKiGjuLJ+mdmQcCPEPj/ZUIGW
	rWC5C342alquAkw1tSNgCU4k4UN/YOqfDzrHGQfKpQMMAlxmvuCFj61/0Dqj/Kx0uQ9NUJReQak9c
	7ZUK9PCv/HKnmUq0lCFMtipo4teatTWHjQATpmGbDn8e08AjxO1nSMPmADLErHcDRY1XM0pbaXv5d
	jRzZpc16vHnQ9Z2Nj/RVI1H3OHkRH0ccwNk69YUr241BVWTqpnNGlEi91i0wYueEFCK+aTmCpiQzh
	uxtoflThcvcNVizQ2FQs4YQ4el056p5vh/GtfqmdFJqbxBoGmCyxd9HqBuwZF41QueobP3oomabPH
	/3jkh5bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHi0D-000000032ml-2hTA;
	Fri, 16 Oct 2026 13:29:41 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHi0B-000000032lt-0MpH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:29:40 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-486e70f2457so1262250f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792157377; x=1792762177; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8jpDLmMBbHfkeVF10s2tGINPrgBL1dTjWhJOL3aqJTw=;
        b=Iq84VIOuWPOO6KAAw55sVy4QcyYA6ZJ0SudOb7WbywNIlZoErYNfkVtJspQDuH5cEU
         4pmjn2MrqJL8ctgsevSypR8n5NKe4I7V1KtOIcFfjh+P60SNKkCRSbSGMrFEB8hRtl7d
         67qwjcLxJXYcc5dFe35u4PiEgPPTXnfhKTzpyHUaaV1hlKHv5PGbWelwTiXOLr7NDwO7
         hOwc0rvrsUkV9d/Rn4cROaVmyS8Lz8rHp4veEmmqhONdX7tGjSxoWl1iuz/tl0te1YRf
         dN0U+WtLP+M3gEzyrYkKvAyyiivBpmIo8gAbB58FN12dh9mvTCbcmDcYoqYSlb/ZaIP8
         s5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157377; x=1792762177;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8jpDLmMBbHfkeVF10s2tGINPrgBL1dTjWhJOL3aqJTw=;
        b=v9J+7Fs/xvZKWc9sWK1rVUcVmI8BMYhpcVsKQAaCO8TAxXdwyj3VRRXlNglTxy4t80
         lfDxCIyxEOxQjoDi0YyjTyv62iNrbboSqa5wuMdLMLX9nKOOkZ6EjB8q/CzddVK3eya4
         hg4p+8DdcPAUlcqcPAXPcnULPP7w3yerT+JRImlS0XJCJ/wdSFyM3dBSQbqyZPcbBY/0
         uUy3TOtGN2mhgpy7qgxYVkJNS7BEp3yLbm7m7FQvONuOsTBvQa027jlS7y8tX8LkPmLK
         4ZDKejDM5TbMWW5/vfCgfUuCGQi/JVEjEAgUbRsNytpS9Fep6j8LbPeDIblhcH3NuRS4
         xyLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFErcfsEAcJGLJPsn7vK0piYDiD7Rx6BIIsmXOYPD7h+vl/1Y/8Cro7ZlTjXKIAhrWqCfdP6MApVergOuoFpck@lists.infradead.org
X-Gm-Message-State: AFq9FYI1WyQ8GCtvHOBKYl8LhPjccBXx7MBtICiL2NcWtv9NKMG/RR5n
	9fsDYzpUI0Vl5ocTjNDAm8HBNhcVvGABQfFHsnq4A3X6FEpE3XOhFKyjSsHBmD8rxkU=
X-Gm-Gg: AYBFou2zvIhxjencLILfsQ0HEIcBEjEEAWk270xdGASd5JaT92ux/9uaGjkXKc1odJR
	NuJdFbEqYBu/ua84u4WIkJUyLPyFYNYA93X26Rl2upuYzoJZYFiMP42cSX9O/W17r9wQW2XGdjJ
	pxLf5WsLWSXZlCllEVH6mKXpc7g9OFqk6PN4mpXztv0MxmnlXsIVlGUysNup6liLPZ7VaTvoKPe
	jGD2uqZnQE4t3Kmuyg9YDRfeRbrsSS3Y8RziOvB7eva4ODD7Ee3Gu8j3xBGvhgeBsvDmgQ6sjXb
	+jyzb4e2FYpXmbQkTzK8VPHqEV9HwdtNvxOiadIVGylpfu25P0oApum3UNVhGtLYUn26Su6GeCM
	XzA0tPsBV6REGn7IYSYVJY19iRKCLVogp3oYmeyZcJvpb6753+ZTxs1t7lxdujFIwr1d0S3Ip84
	igVXGUnoae+xYsZkiW3/PWewppHrujOpIxMahVqNxR/hecs1WTEzzeqd1/FFA6kX6BPO2ic7C3W
	QQ=
X-Received: by 2002:a05:6000:26c7:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-48df851f00dmr9820547f8f.24.1792157377206;
        Fri, 16 Oct 2026 06:29:37 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4dddsm5173034f8f.22.2026.10.16.06.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:29:36 -0700 (PDT)
Message-ID: <f1a7dac8-5a01-4fc2-bf81-b7609e332e9d@linaro.org>
Date: Fri, 16 Oct 2026 14:29:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/25] perf/core: Prevent AUX sampling from racing with
 pause/resume
To: Leo Yan <leo.yan@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
 <20260915-arm_cs_support_aux_sample-v1-2-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-2-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_062939_165288_53A8412B 
X-CRM114-Status: GOOD (  27.17  )
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



On 15/09/2026 16:48, Leo Yan wrote:
> AUX snapshot sampling and AUX pause/resume can both run from NMI
> context. Each path currently guards only against its own recursion.
> An NMI can therefore enter one path while the other is changing the
> AUX hardware or buffer state, allowing snapshot_aux() and the PMU
> pause/resume callbacks to overlap.
> 
> Use aux_in_sampling and aux_in_pause_resume as a shared exclusion
> scheme. If sampling nests inside pause/resume, emit the regular sample
> without an AUX payload. If pause/resume nests inside AUX sampling, drop
> the AUX action, matching the existing behavior for recursive
> pause/resume.
> 
> This prevents overlapping PMU operations without waiting in NMI
> context.
> 
> Assisted-by: Codex:gpt-6

Does this need a fixes tag? Seems like using these two things at the 
same time could have gotten you into a state where tracing was enabled 
but aux_paused=1 etc.

> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   kernel/events/core.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 17355e4b8b7c6c106117153c9eb8509e6f9a41e3..a524eb381d4b5731650ec0105d9794b8c89fba4d 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -7990,10 +7990,12 @@ static unsigned long perf_prepare_sample_aux(struct perf_event *event,
>   		goto out;
>   
>   	/*
> -	 * If this is an NMI hit inside sampling code, don't take
> -	 * the sample. See also perf_aux_sample_output().
> +	 * If this is an NMI hit inside AUX sampling or pause/resume, don't
> +	 * include AUX data in the sample. See also perf_aux_sample_output()
> +	 * and perf_event_aux_pause().
>   	 */
> -	if (READ_ONCE(rb->aux_in_sampling)) {
> +	if (READ_ONCE(rb->aux_in_sampling) ||
> +	    READ_ONCE(rb->aux_in_pause_resume)) {

I suppose this means that sampling could be quite unpredictable for 
users if sometimes samples are dropped while pausing is happening. You 
might expect to receive a non empty sample even if its triggered while a 
pause is happening? But preventing concurrent use of the two features 
would be difficult and restrictive.

>   		data->aux_size = 0;
>   	} else {
>   		size = min_t(size_t, size, perf_aux_size(rb));
> @@ -8869,10 +8871,13 @@ static void perf_event_aux_pause(struct perf_event *event, bool pause)
>   
>   	scoped_guard (irqsave) {
>   		/*
> -		 * Guard against self-recursion here. Another event could trip
> -		 * this same from NMI context.
> +		 * Guard against self-recursion and AUX sampling. Another event
> +		 * could trigger either path from NMI context, in which case the
> +		 * AUX action is dropped instead of waiting for the preempted
> +		 * context.
>   		 */
> -		if (READ_ONCE(rb->aux_in_pause_resume))
> +		if (READ_ONCE(rb->aux_in_pause_resume) ||
> +		    READ_ONCE(rb->aux_in_sampling))
>   			break;
>   
>   		WRITE_ONCE(rb->aux_in_pause_resume, 1);
> 


