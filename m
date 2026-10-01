Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13ECCA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uF5zNxkaQ4jQ0BkeRTJjWKsCM/+7wEmC5bJ3Bsgmzk=; b=VLmY8FNw1YFHeclAApT6RYizYq
	MmwpSS5pbXja+nodOGQGvf/ryF6biMgv2w5JOyH2vHg3S6d71GbzQ6lwu5iuDbaNGgDxGBEcwFh/J
	bXr30ENGn68FxKxgm2/LKNzY07wIW4m+03Z78bf2g7Lp9IRZUqG5Zx9eDzjGJdeP4MP/RSxxy7av4
	vBpNe8GoxlX7/SWHYKUIgBRqQuIwpcxyv1qH5UMjDwqKNIrGXvw8yDaRa1n/Iq9F3NjIPltC5wN2x
	xAT89zELeudbzefAim9HFebx8Z7sMKSc/6aUyT/V1NloDiHn2qHigk+qMdMz0pLPs2CQDVzs1wiYe
	j6Vp2lrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGJu-000000099MW-3ilS;
	Thu, 01 Oct 2026 12:55:30 +0000
Received: from mail-ej2-x0d.google.com ([2a00:1450:4864:34::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGJr-000000099M7-2E25
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:55:28 +0000
Received: by mail-ej2-x0d.google.com with SMTP id a640c23a62f3a-c2e028ed54dso393493766b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790859325; x=1791464125; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uF5zNxkaQ4jQ0BkeRTJjWKsCM/+7wEmC5bJ3Bsgmzk=;
        b=Gmhn4thh35rFTQawRK9N7nw8rgM5hSiIBaRkHZEFY37c+Ugb5yUpsMmQoi0EUuXopP
         heXlTPoDseG1+6uAV+h900HtuqzHtsjWEhH8SunC8VXPJB7pZdQJK0hSPJJZ4hEKEWIS
         lrUaQ1CIrVDXvgr/v8F+Il7GTBCmyAD754YzQh15czjZK3W6H0uutNbY1w3vHxpU0EuF
         NXMJ7cVOznfW3dmIrilQNNzbrVnUiV/UFuzCQFC0WTvTFkRM4zg+HBulKsy0e0O6o7sk
         uEtEXpCWVb8J/pYXbFi9y8uGyW66ct8W/2AevyJMtDCGS0l1yiUhSzRLE18WYQ2Tn0Ut
         CbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859325; x=1791464125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/uF5zNxkaQ4jQ0BkeRTJjWKsCM/+7wEmC5bJ3Bsgmzk=;
        b=rLh5DyxWjZJKloaPvuSO6TmnmH6F/+Kj6OsIfSKrDoRKEQHLIp1ZI0v032kFcfveD+
         nq62ESbjQVxE1NAdBSwBaOWTefn9YvzDTwtLIXI4eXvFEHjkVkG/a3cnIk9mqa0bZUmR
         VN3/ji28vqfkUBcziximsPO1zaVVUZSZbtQRhG9T3Rd9B1ISbbYpzXR6H3TgL25hAGQq
         ys8f4o8V4D6UCW0vlLtDgT1ZyWaLz6gwaj9bsonAIgsR+rYITVLp4SChIeOkqLm+C2pe
         5Ptm0d/t/PWV4TqleGjHvmx03NAq1E7J0bUE3r0qgxbyjwdVWSjeTJMlqGeDf07Xgkaa
         pXfQ==
X-Forwarded-Encrypted: i=1; AKwUvByyn1Zp7UcuiRy7HYeDXAk4IMPer+mhx3yxaKWTEcg+ua7wJnNYS2Ocy4YWhyOSHUxteo34u6KlasgA8FUqyR/9@lists.infradead.org
X-Gm-Message-State: AFuF++kFcu1nnKMGbbBmnuacz/ouNpldUinjXr2mQ0mSwfCqwuQK2Fzz
	4rcQ6FVQObUYNoxL/pd0/hLcDoj3p40/sKQeRGjXanCIrRBgNU0JJmR0TRGl/0j1v8E=
X-Gm-Gg: AYBFou03qXS1W66FDZ0NLr4K+PMzoeGH3TtlvC9vFvhVOL+2fNt3GVP2hAzgcW0bOcY
	nFIfjzbr/aGqq23LD2P2JHA8IdDGOP8jTSTEBCYk8Ywe3l4cEbFcB3TfTgVYpcKqsOqmuT3Yklu
	5Dyi9g8c+KbmGZOahkTGN+A0ca5mqcwJgdQHrwrNCI9pjBqWOP9CnNU1f2EzHAlJwXRPhq9TLm/
	9xg0KQcW/jpCtQR4T2l68/3A/ynhoL1JEytO87qc0Rheu2+bZkyw6mm2ux3rScc1/GoJCyOnwbV
	JO2bie5cPfV281STcO+zFwTDAmFq9DSEm/6OqLQL7DlTP9FClHu5UI1zwlxexifinNRbijIW39R
	/TmeqQ6LXr69Pv9Rzuy7eO0eSfjZA+40z/Xv65P1nVOqDpnJrgpqJd6a+GUE8yTqg14RmvTxSDZ
	BNsE3Fr9WW5ouXkffEPf7xZvfanCW6rFAmSrirr+x0Kd1CVA0aYrI6MOJbuyH+YNsalnFh4N5QU
	fs=
X-Received: by 2002:a17:907:7b82:b0:c29:f5d8:9c7d with SMTP id a640c23a62f3a-c2e23d403f1mr389127766b.44.1790859325594;
        Thu, 01 Oct 2026 05:55:25 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31ce362esm150229566b.30.2026.10.01.05.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:55:25 -0700 (PDT)
Message-ID: <28c735f7-5d1c-4127-b748-99cdb3b48645@linaro.org>
Date: Thu, 1 Oct 2026 13:55:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] perf cs-etm: Synthesize missing HW_ID mappings for
 raw trace
To: Leo Yan <leo.yan@arm.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Suyash Mahar <smahar@meta.com>,
 Amir Ayupov <aaupov@fb.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
 <20260821-james-cs-hw_id-output-failure-v1-3-9d532ddabcc3@linaro.org>
 <20260904172924.GB8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260904172924.GB8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_055527_663663_D5E010A0 
X-CRM114-Status: GOOD (  20.51  )
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



On 04/09/2026 18:29, Leo Yan wrote:
> On Fri, Aug 21, 2026 at 10:50:31AM +0100, James Clark wrote:
> 
> [...]
> 
>> +static int cs_etm__synth_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
>> +{
>> +	struct auxtrace_queues *queues = &etm->queues;
>> +
>> +	for (unsigned int i = 0; i < queues->nr_queues; i++) {
>> +		struct auxtrace_queue *queue = &queues->queue_array[i];
>> +		struct cs_etm_queue *etmq = queue->priv;
>> +		u64 *cpu_data;
>> +		u8 trace_id;
>> +		int ret;
>> +
>> +		if (list_empty(&queue->head) || !etmq || etmq->format != UNFORMATTED)
>> +			continue;
>> +
>> +		if (!intlist__empty(etmq->traceid_list))
>> +			continue;
>> +
>> +		cpu_data = get_cpu_data(etm, queue->cpu);
>> +		if (!cpu_data)
>> +			return -EINVAL;
>> +
>> +		ret = cs_etm__metadata_get_trace_id(&trace_id, cpu_data);
>> +		if (ret)
>> +			return ret;
> 
> Since this is an unformatted queue, can we simply ignore the trace ID?
> Instead of fetching it from the metadata, we could insert 0 to create
> the trace ID list.
> 

It's printed in the raw output though and it's useful for eyeballing 
which CPU any bit of trace ran on because the AUXTRACE header might be 
off the page, and it makes output consistent with ETM:

   . ... CoreSight ETE Trace data: size 0x10000 bytes
         Idx:0; ID:22;   I_ASYNC : Alignment Synchronisation.


I don't think it costs anything or is complex to do this, but if you 
really want to set them all to 0 we could do it.

> This would also align with future refactoring to remove trace ID
> handling for unformatted queues.

At that point if they're all going to be 0 then we can ignore all 
processing of HW_ID events for UNFORMATTED. Instead of saying 
cs_etm__synth_unformatted_trace_ids() is for 'fixing up missing IDs' it 
just creates them outright.


