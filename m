Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CC5C5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 14:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfQu1oI+X/Avl4cDAoicLu7vQUMqyVuYyYc7hYijVqA=; b=fT3vb9P5MFxTKiqzsCzyleRLZc
	2Su3z15x6IrxB1AGgbVt7jpPznaki6dAxZjGPS/bBiKzr7I+zhQ1iEOhxdtnOme8ZxTKsq5DW/8ra
	nt0P+13eA6sYxEC3iJDsv5cThFgLi8RsaHs6g807vvEZAaFVKeqjMi9xKd6r1zZNg48uWeyY2I/Zf
	C+WU4PwTlLIZmbxe/jTvtOl0qjTa6MpR83EvYWqCuw1WVnh+5/I3mMlGNUqKc3EidND0PFlXJP+KJ
	UtVa+EuJB7pqB0pqxPxTrd3GXfYw5U13MW3lQxhLLtGooWNvgRkxADPgBcIf3bmeIyEODnSs0oV2a
	TT5zb2zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVjY-0000000GnR6-3hVU;
	Mon, 24 Aug 2026 14:33:08 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVjV-0000000GnQZ-3xUh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 14:33:08 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4998590d392so13043215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787581984; x=1788186784; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfQu1oI+X/Avl4cDAoicLu7vQUMqyVuYyYc7hYijVqA=;
        b=FZz7Hj+ND0fB4ouK30g2/skY9k8Q0iiFn1Mf2E3YpDZgVG+BCohl8xA1QN6nk5iT4g
         6dQTAst4YAjz0XDpBLGPBQYNtT6IzNmyyRLOOPL4Gw/aCDj5tHVAT1g5hYW7dOahbY7u
         9ac27Mdzt+RQ/f6I3VLNIcM30bRBnEwK/Xme2YhE7dSJj1jn1EQL4H2zHyQOFx+AbXqs
         PP53PN+Q23jV0AI3ZotrovaKsLCtY8cAyuZVoz0QnPMHBVud6vSCMi/jyU55eEWB76Pk
         O69DB+jbcxY31AkyoVYniYMKM9TKhLRF+cuoBx9s1m1haZvzCIJUebAGgl8vW49wUtFA
         nHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581984; x=1788186784;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfQu1oI+X/Avl4cDAoicLu7vQUMqyVuYyYc7hYijVqA=;
        b=jv5AXqGSvpbWRRT4XcKEtD+Pk1EgrYbf2YKWSvAULa2H+f2YNabn8Kgy+/Gfdb+RZo
         lx+VIIhpoAoCNmT/sy2TWF9ttDNdt6EoITHDojOfmoXJqpT4MWJI15Jq2+Hvodw5CYV1
         xdB9nt/0D4AB+WEI0QVBsvTtt+hl5yOM6YXYDvWH9hjE7a6n5U2Wb/7vN6BSVf9aipNT
         psm1IOgEdlEdVaMMoWFUOe3+5r7sNyTNJP9xc5TMzVIMSdj93p0Aty7imoh4TmydwZUH
         lgFRhFJg2ZujuDON9kbYpj68WVsLiXGOJ9pixwIzxEasPYZl2iqF9aD3n/CuVvrsXc7M
         D+2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqXglhtHzkhO4UQ8PK34qeoQE1WR9qfZPdY1/XqEV3ZVOD27+sh4BJTm9nMYm9tqA7PYhl4UMA/0GJiWGiU5m9p@lists.infradead.org
X-Gm-Message-State: AFuF++nK3b/F8b+NcJckXwhjbEuhKG0kCKS2FpeJ4dzsFe3lkzCy7D63
	TrEym7qJUkBRSfYPmgdNyPEGQqpBBxzdbS8Hctmy0802AnegYe87PxFKNWUv2Ngudfc=
X-Gm-Gg: AR+sD12eNO0lkMebnjh6IQBuyIbEBQFUgBxVktJSWAiUFTEhKmFXrOR4q4DKamx+CCL
	+ljwPBX531pEhxUg3u58CbQeoToXYt6dMbt23Ii9pKbx6ZCrChtuptPZPtKp9tQLNVj1Vw410Nf
	X/Zc7E65FuJ42NazNaEA3Joae2+RnExUiK1j3Vo2SC93y/Bh6TQnIYr9vZ6urYvQSxvYEDdxkWa
	WylAw2ha0ORac9LIbCMCyhlOh7wT96xXUbKYO/eL6c67iRvRtqw2XbifVrrGMvTGFUGYjTgwuqz
	xybifH54f/kw2+ptsY1P4x99HbRJ7YO4KgCfSA1EmO0fzLIpTcxjsqqYUBh+NpQzESjBREBco2t
	599vGkjwPgVrIVxVspJwMSrFgZaqkNRpgfTk8FMvKeYYYceK8KOccRuemDm+qaQWYJbJKyawHEK
	5q71SeYuFAqfyUdEOq0+XLeNdu52e4Y3rQ7r7uHtzYj3OX3j4BwwUhNQAwyg59qwrtJw==
X-Received: by 2002:a05:600c:1554:b0:496:c06b:9fb4 with SMTP id 5b1f17b1804b1-499b844b578mr320097935e9.14.1787581983590;
        Mon, 24 Aug 2026 07:33:03 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35a1e35sm84180155e9.13.2026.08.24.07.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:33:02 -0700 (PDT)
Message-ID: <f1f4447e-4253-4a9c-b410-fc339b4947cc@linaro.org>
Date: Mon, 24 Aug 2026 15:32:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] perf auxtrace: cs-etm: Capture wrapped snapshots
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org,
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-doc@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-11-00c4fd0701b4@linaro.org>
 <568a14ed-161d-4f67-842a-c671e7f4c409@intel.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <568a14ed-161d-4f67-842a-c671e7f4c409@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_073306_043290_709934ED 
X-CRM114-Status: GOOD (  31.01  )
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



On 24/08/2026 13:21, Adrian Hunter wrote:
> On 21/08/2026 12:49, James Clark wrote:
>> snapshot_has_wrapped() isn't implemented for Coresight, so when a wrap
>> occurs we only save from offset 0 to current head, modulo buffer size,
>> rather than capturing the whole buffer. Coresight drivers currently use
>> a monotonic head pointer even in snapshot mode, which gives a lot more
>> information for taking snapshots than a wrapped pointer. It means we
>> don't need to search for data at the end of the buffer to guess if a
>> wrap has occurred, and we can go back to saving partial buffers after a
>> wrap by checking if the next size to take is less than the buffer
>> size.
>>
>> The drivers will always be able to generate a monotonic head because
>> TRBE has a bytes written counter, so even if we stop generating an AUX
>> record on every overflow, we can check if the counter indicated an
>> overwrite and offset head by a whole buffer size if it wrapped. This
>> forces userspace to read the whole buffer rather than between last and
>> current head. ETR and other sinks use software double buffering, so can
>> continue as they are.
>>
>> Add a much simpler 'monotonic_snapshot_head' path for tracers to use,
>> and use it for Coresight.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   tools/perf/arch/arm/util/cs-etm.c                  |  1 +
>>   .../perf/tests/shell/coresight/raw_dump_stress.sh  |  5 -----
>>   tools/perf/util/auxtrace.c                         | 22 ++++++++++++++++------
>>   tools/perf/util/auxtrace.h                         |  2 ++
>>   4 files changed, 19 insertions(+), 11 deletions(-)
>>
>> diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
>> index d36b7e41399b..dbf76dd3349e 100644
>> --- a/tools/perf/arch/arm/util/cs-etm.c
>> +++ b/tools/perf/arch/arm/util/cs-etm.c
>> @@ -918,6 +918,7 @@ struct auxtrace_record *cs_etm_record_init(int *err)
>>   	ptr->itr.info_fill		= cs_etm_info_fill;
>>   	ptr->itr.snapshot_start		= cs_etm_snapshot_start;
>>   	ptr->itr.snapshot_finish	= cs_etm_snapshot_finish;
>> +	ptr->itr.monotonic_snapshot_head = true;
>>   	ptr->itr.reference		= cs_etm_reference;
>>   	ptr->itr.free			= cs_etm_recording_free;
>>   	ptr->itr.read_finish		= auxtrace_record__read_finish;
>> diff --git a/tools/perf/tests/shell/coresight/raw_dump_stress.sh b/tools/perf/tests/shell/coresight/raw_dump_stress.sh
>> index bea70d825596..c9459ded4cbe 100755
>> --- a/tools/perf/tests/shell/coresight/raw_dump_stress.sh
>> +++ b/tools/perf/tests/shell/coresight/raw_dump_stress.sh
>> @@ -48,11 +48,6 @@ read -r size offset last_idx <<< "$(awk '
>>   # everything was dumped. Allow 48 bytes difference to cover 3 frames: current
>>   # frame length, a partial frame and a final empty one, all of which aren't
>>   # dumped.
>> -#
>> -# TODO: for a single snapshot, offset should always be zero. However, we
>> -# currently output AUX records in snapshot mode when we shouldn't, which
>> -# increments the offset. Allow for that until it's fixed so we can test raw
>> -# dumping.
>>   decode_size=$((1 + last_idx - offset))
>>   if [ "$decode_size" -gt "$((size - 48))" ] && [ "$decode_size" -le "$((size))" ]; then
>>   	echo "PASS: AUXTRACE buffer length matches dumped packet index"
>> diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
>> index 8ca872e6d465..e3c770b46e94 100644
>> --- a/tools/perf/util/auxtrace.c
>> +++ b/tools/perf/util/auxtrace.c
>> @@ -2051,9 +2051,9 @@ static int __auxtrace_mmap__read(struct mmap *map,
>>   				 bool snapshot, size_t snapshot_size)
>>   {
>>   	struct auxtrace_mmap *mm = &map->auxtrace_mmap;
>> -	u64 head, old = mm->prev, offset, ref;
>> +	u64 head, old = mm->prev, offset, ref, size;
>>   	unsigned char *data = mm->base;
>> -	size_t size, head_off, old_off, len1, len2, padding;
>> +	size_t head_off, old_off, len1, len2, padding;
>>   	union perf_event ev;
>>   	void *data1, *data2;
>>   	int kernel_is_64_bit = perf_env__kernel_is_64_bit(env);
>> @@ -2061,10 +2061,20 @@ static int __auxtrace_mmap__read(struct mmap *map,
>>   
>>   	head = auxtrace_mmap__read_head(mm, kernel_is_64_bit);
>>   
>> -	if (snapshot && itr->snapshot_has_wrapped) {
>> -		err = auxtrace_find_snapshot(itr, mm->idx, mm, data, &head, &old);
>> -		if (err)
>> -			return err;
>> +	if (snapshot) {
>> +		if (itr->snapshot_has_wrapped) {
>> +			err = auxtrace_find_snapshot(itr, mm->idx, mm, data, &head, &old);
>> +			if (err)
>> +				return err;
>> +		} else if (itr->monotonic_snapshot_head) {
>> +			size = head - old;
>> +			/* Force a full buffer read if a wrap has occurred */
>> +			if (size > mm->len) {
>> +				pr_debug3("%s: wrap detected, adjusting old from 0x%"PRIx64" to 0x%"PRIx64"\n",
>> +					  __func__, old, head - mm->len);
>> +				old = head - mm->len;
>> +			}
>> +		}
> 
> I feel like this is asking to keep the ->find_snapshot() callback.
> i.e. basically the same thing, but add a helper that BTS and SPE
> can call directly, like auxtrace_record__default_find_snapshot().
> For PT, add/use auxtrace_record__snapshot_fixup() that does the
> common old/head adjustment.
> 
> Then ->monotonic_snapshot_head is not needed.
> 

Hmm yeah I suppose that makes sense. I can give it a go.

>>   	}
>>   
>>   	if (old == head)
>> diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
>> index a9d0c84184c5..971b817d3396 100644
>> --- a/tools/perf/util/auxtrace.h
>> +++ b/tools/perf/util/auxtrace.h
>> @@ -385,6 +385,7 @@ struct auxtrace_mmap_params {
>>    * @evlist: selected events list
>>    * @snapshot_wrapped_len: number of bits in @snapshot_wrapped
>>    * @snapshot_wrapped: bitmap indicating if each aux buffer has wrapped
>> + * @monotonic_snapshot_head: driver doesn't wrap head pointer on overflow
>>    */
>>   struct auxtrace_record {
>>   	int (*recording_options)(struct auxtrace_record *itr,
>> @@ -412,6 +413,7 @@ struct auxtrace_record {
>>   	int snapshot_wrapped_len;
>>   	unsigned long *snapshot_wrapped;
>>   	int snapshot_search_bytes;
>> +	bool monotonic_snapshot_head;
>>   };
>>   
>>   /**
>>
> 


