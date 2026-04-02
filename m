Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4649D39406
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGicjAqt+pYR5kpOTLsrHtRFExrJLu3z8Y8VhWzp3DE=; b=H9VYRxcNgOjL9mAABlzMd78xu6
	fsWtTruoGDTV/ThNup2L+6iMvKNFIbm0vR91UP4+7aRUEXOt7CQqCCIrVoF8e1olRzuJHaocnGtgI
	+JLkxFAvVU2frxAZLM+HPEuBq93hpcPeyhp1zhVd/Q+BFkAMdHfL3ZF+WmvgW0riQnMShHN8Poi7e
	UVXIeirgy+BY6Fsmzs17crOMkxsgETiOYcKrS05gODJv0ZXZXbmM8x+Pikhttf6p7zFPf8M72VbEk
	yd1FVoGxvzsEyice+gmHMBTIlohSPL+fh6JbFVl6p3aqUqpgZHjyAiCmoBDw2PEbpgtZx5GPGKPEs
	AWNQJkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EfQ-0000000HIQ2-3vAh;
	Thu, 02 Apr 2026 09:48:48 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EfN-0000000HIPd-1eAh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:48:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48704db565eso7005005e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 02:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775123323; x=1775728123; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AGicjAqt+pYR5kpOTLsrHtRFExrJLu3z8Y8VhWzp3DE=;
        b=YidE1E1ayhr0P7jOa3S0CpMwOzE1VDlmH9A0/ytwxMXXml3LUiyno7cdAxdBtAZ7DV
         nkbybWtNpZL66GHH1wFd6j4rRZMtBfdUu/fiLp530XJDAUxy7peGHlo5FizBO34lSpxW
         h5oC4dAflZfkxEtiACUGi9ipw57xpkOy+/kQwCSXyMkTIWOUkfXZdwXvHkOBOeEgm1Hl
         +Lqb5eNQVyGDtYHLi8ex1tngJ7BdfueJW3vNQXDdtakXdMJU2OAcXOgASnBCSKmvzNoc
         X1RFqEEyk2KymCz8qJvhYiopDXGhHStTMvnsdsBrEMAauwSSd3O9oMADlsGfqyQZLkpK
         DSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775123323; x=1775728123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGicjAqt+pYR5kpOTLsrHtRFExrJLu3z8Y8VhWzp3DE=;
        b=i+UpYkXbvHKEwQqHBb+TgsvIL+SChbMriu/q/bMj+6vBN65QTJag8DVPThM8vFmWZv
         IGP27h2d8k+E6yBrVaVCYlZ10DMdwGziGm4u/Jte1k/ngZTlu5G725FmjHTgEI+DLaHH
         iWBJpTl3O/TlfwVbNrtW8FzLWtbVC4/YpyRrGaKPysi+1YFJVP2L49Hwy+sSIBg9+wgp
         5W/c9YwdXjGEFJqR8OrH0E4LGk0jmZbDA4Jfm0BJORL1TBTGPLX0h9Tfexrz0E4KFQ0g
         2fYdpnq5xiyANtibXeT+4KW/bNSBf8ZmRhmQWbP9+DxhanDohSpP7r8W/cJFKPVYnuxz
         8qIA==
X-Forwarded-Encrypted: i=1; AJvYcCXfdZ7etXirPkU36K6/Y7zMu1eIAM+wP4KfR0Vk+RyjnEtzURFd8Y2AlPn5HLZ3v5HphkMAi2QBEB8uhvrrMfJv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1D02APY5zeoHlqHh9uLK6u8sFujKfQ7DE5Mzu3NvqL2sJyQ+2
	VvrHDNLiHAid+FMn0b81q27oyp0DTKdk8mqztb9ttnhiHCxxYVTi2LdC3w17UFTyJGk=
X-Gm-Gg: ATEYQzyD4NXBJ424Nkr0VmAAqCF1dOQ/iEdB+24pZvexT+2NYbP9NhgZvwFO93zP6H3
	a1hHHODk+m+JVFCkS57HEDUjlFqoWTWwqartgqt5yt1QKx2XlRQn3fLhhPU+SgTVbXex1v0sgOY
	b9Hu1XvuxpH/1dqonimUrbvho0W6yR/KvDLm/OGo8h0gskfTHi3++6VEnANXDs13yHJ5hL6M1mV
	fiXD7RaLlCelkHy3MWP38WB3EHAx+zf7ItrgZlP6fwxrLc05yE1C6npb15R63/kLy3hBwLT36IP
	qF84TWJbubyZ545eNB8huTdcUaG51Nqjs3CRJwMa65ir+m0CfS0i5pIoAF8g77i7xEWg/QXPhCZ
	bl/mmt9a3DPwEyfrD1OrKjVKC7ThMyyA3B9OHdXla8yGATx/5xB2sQsz9I/3Y18OkQH15e8TlAj
	DNkDRI68Ez76tIEIkqhTeF3XVRNx8wmMltKTsjo+E=
X-Received: by 2002:a05:600c:638e:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-4888b76980bmr45277335e9.18.1775123323120;
        Thu, 02 Apr 2026 02:48:43 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c77df84sm102305985e9.4.2026.04.02.02.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:48:42 -0700 (PDT)
Message-ID: <28cc665e-ac0c-4efd-89a6-3ac0d9a41752@linaro.org>
Date: Thu, 2 Apr 2026 10:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] perf arm_spe: Turn event name mappings into an array
To: Leo Yan <leo.yan@arm.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org>
 <20260401-james-spe-impdef-decode-v1-2-ad0d372c220c@linaro.org>
 <20260402091300.GF356832@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260402091300.GF356832@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_024845_499127_87FDAA7F 
X-CRM114-Status: GOOD (  22.31  )
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



On 02/04/2026 10:13 am, Leo Yan wrote:
> On Wed, Apr 01, 2026 at 03:25:50PM +0100, James Clark wrote:
>> This is so we can have a single function that prints events and can be
>> used with multiple mappings from different CPUs. Remove any bit that was
>> printed so that later we can print out the remaining unknown impdef
>> bits.
>>
>> No functional changes intended.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 88 +++++++++++-----------
>>   1 file changed, 43 insertions(+), 45 deletions(-)
>>
>> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
>> index 5769ba2f4140..c880b0dec3a1 100644
>> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
>> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
>> @@ -276,6 +276,48 @@ static int arm_spe_pkt_out_string(int *err, char **buf_p, size_t *blen,
>>   	return ret;
>>   }
>>   
>> +struct ev_string {
>> +	u8 event;
>> +	const char *desc;
>> +};
> 
> Maybe we can have more ambition to define a more general structure:
> 
>    struct packet_field_string {
>    	u64 bit_mask;
>    	u64 bit_val;
>    	const char *desc;
>    };
> 
> Thus, this also can be used by other bit fields decoding.  We can do
> this now or if later refactor for other packets.
> 
> Either way is fine for me:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> 

Thanks. I think I'll leave it as it is, there's a risk of making it too 
generic and then it doesn't fit any other use case anyway. We can always 
add it later.

>> +
>> +static const struct ev_string common_ev_strings[] = {
>> +	{ .event = EV_EXCEPTION_GEN, .desc = "EXCEPTION-GEN" },
>> +	{ .event = EV_RETIRED, .desc = "RETIRED" },
>> +	{ .event = EV_L1D_ACCESS, .desc = "L1D-ACCESS" },
>> +	{ .event = EV_L1D_REFILL, .desc = "L1D-REFILL" },
>> +	{ .event = EV_TLB_ACCESS, .desc = "TLB-ACCESS" },
>> +	{ .event = EV_TLB_WALK, .desc = "TLB-REFILL" },
>> +	{ .event = EV_NOT_TAKEN, .desc = "NOT-TAKEN" },
>> +	{ .event = EV_MISPRED, .desc = "MISPRED" },
>> +	{ .event = EV_LLC_ACCESS, .desc = "LLC-ACCESS" },
>> +	{ .event = EV_LLC_MISS, .desc = "LLC-REFILL" },
>> +	{ .event = EV_REMOTE_ACCESS, .desc = "REMOTE-ACCESS" },
>> +	{ .event = EV_ALIGNMENT, .desc = "ALIGNMENT" },
>> +	{ .event = EV_TRANSACTIONAL, .desc = "TXN" },
>> +	{ .event = EV_PARTIAL_PREDICATE, .desc = "SVE-PARTIAL-PRED" },
>> +	{ .event = EV_EMPTY_PREDICATE, .desc = "SVE-EMPTY-PRED" },
>> +	{ .event = EV_L2D_ACCESS, .desc = "L2D-ACCESS" },
>> +	{ .event = EV_L2D_MISS, .desc = "L2D-MISS" },
>> +	{ .event = EV_CACHE_DATA_MODIFIED, .desc = "HITM" },
>> +	{ .event = EV_RECENTLY_FETCHED, .desc = "LFB" },
>> +	{ .event = EV_DATA_SNOOPED, .desc = "SNOOPED" },
>> +	{ .event = EV_STREAMING_SVE_MODE, .desc = "STREAMING-SVE" },
>> +	{ .event = EV_SMCU, .desc = "SMCU" },
>> +	{ .event = 0, .desc = NULL },
>> +};
>> +
>> +static u64 print_event_list(int *err, char **buf, size_t *buf_len,
>> +			    const struct ev_string *ev_strings, u64 payload)
>> +{
>> +	for (const struct ev_string *ev = ev_strings; ev->desc != NULL; ev++) {
>> +		if (payload & BIT(ev->event))
>> +			arm_spe_pkt_out_string(err, buf, buf_len, " %s", ev->desc);
>> +		payload &= ~BIT(ev->event);
>> +	}
>> +	return payload;
>> +}
>> +
>>   static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
>>   				  char *buf, size_t buf_len)
>>   {
>> @@ -283,51 +325,7 @@ static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
>>   	int err = 0;
>>   
>>   	arm_spe_pkt_out_string(&err, &buf, &buf_len, "EV");
>> -
>> -	if (payload & BIT(EV_EXCEPTION_GEN))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " EXCEPTION-GEN");
>> -	if (payload & BIT(EV_RETIRED))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " RETIRED");
>> -	if (payload & BIT(EV_L1D_ACCESS))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " L1D-ACCESS");
>> -	if (payload & BIT(EV_L1D_REFILL))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " L1D-REFILL");
>> -	if (payload & BIT(EV_TLB_ACCESS))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " TLB-ACCESS");
>> -	if (payload & BIT(EV_TLB_WALK))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " TLB-REFILL");
>> -	if (payload & BIT(EV_NOT_TAKEN))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " NOT-TAKEN");
>> -	if (payload & BIT(EV_MISPRED))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " MISPRED");
>> -	if (payload & BIT(EV_LLC_ACCESS))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " LLC-ACCESS");
>> -	if (payload & BIT(EV_LLC_MISS))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " LLC-REFILL");
>> -	if (payload & BIT(EV_REMOTE_ACCESS))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " REMOTE-ACCESS");
>> -	if (payload & BIT(EV_ALIGNMENT))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " ALIGNMENT");
>> -	if (payload & BIT(EV_TRANSACTIONAL))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " TXN");
>> -	if (payload & BIT(EV_PARTIAL_PREDICATE))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SVE-PARTIAL-PRED");
>> -	if (payload & BIT(EV_EMPTY_PREDICATE))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SVE-EMPTY-PRED");
>> -	if (payload & BIT(EV_L2D_ACCESS))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " L2D-ACCESS");
>> -	if (payload & BIT(EV_L2D_MISS))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " L2D-MISS");
>> -	if (payload & BIT(EV_CACHE_DATA_MODIFIED))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " HITM");
>> -	if (payload & BIT(EV_RECENTLY_FETCHED))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " LFB");
>> -	if (payload & BIT(EV_DATA_SNOOPED))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SNOOPED");
>> -	if (payload & BIT(EV_STREAMING_SVE_MODE))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " STREAMING-SVE");
>> -	if (payload & BIT(EV_SMCU))
>> -		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SMCU");
>> +	print_event_list(&err, &buf, &buf_len, common_ev_strings, payload);
>>   
>>   	return err;
>>   }
>>
>> -- 
>> 2.34.1
>>
>>


