Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0696CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEv96mAiPQXcl62IaJ8y1AeLrRIcw4KQYmrAeodFZwk=; b=0qj8SCooz+NUxj7ixhnCgiPwlH
	lZwC4pmy9zBOUhvwQsDPnA1YJU4Ega+v1T7RmJW4rSK5xvce/GKJLKC3oemUWu/7h94LyQ99oLDNj
	WbhcRVXMbWZNmotQayyCNmhngYaQhWTP8qjjtrfwSXK+Xz0StcdUfdWJjKIwEviHLNw0In6Kz8Dy6
	lPTl9yEnSSJfAT64eSDXpXhBsFaW+jCaN470EmyWReRaRz0/RHdm1DlwQRrHdqGr2zv5Pm3qqXxno
	N8Ty648RQwOg/w9QCH/CAqoovKItplKk/o48Mets/sPj2c0aiqgpGTwyIhfP7b8HpPzYOinE2Vd60
	GKagCAng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiG8-000000034UP-05ut;
	Fri, 16 Oct 2026 13:46:08 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiG5-000000034U0-0Kz9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:46:06 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1465840f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792158363; x=1792763163; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fEv96mAiPQXcl62IaJ8y1AeLrRIcw4KQYmrAeodFZwk=;
        b=qS8LEgjcs/x/YQUj5gDN9q5qSMDGlW7IcVbOyueWcrEmb1GYkgoTtHv5YyJNhEBL36
         ojTe3p76fUUVXMk3nWgPQvHbMy7MiGafccHFgXoiqQs2rpHfa7bPzi0niZyVhq9qGlAe
         J9PCdeaH5ht9+sMwoR/TUpMu/f5oC0VoGWtnQL5EaD0Y+l0mfoc5llxUQY+lVBJwFvMy
         kq1b/wRC3mtJSmF3S3u1TdM9dixKRa5KYRUTnmdPPXG/E/cqPnPQ3TshdEiKpKhk5bv8
         bBsGIeVN6kqjiVA5JInoocQ2/xrQbi6rwsbL/kkcECa8dOSb/+ZkWcTlK8c51CSDZUBe
         +iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158363; x=1792763163;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fEv96mAiPQXcl62IaJ8y1AeLrRIcw4KQYmrAeodFZwk=;
        b=KOdSrsloi2vyL27iXcsawSAX3KvkZwWYTko6HqO1xS2JAVr/TuzL2MIFh6Xu6CAaiL
         1Tllv7b/7IsM7cORyuA/CL5mXezZzezPz4aCndRlW/FceHImU2bcmOCOC0DzCQfk1Dj3
         f9SJlLFcGPu80R8Xg+tOwHR0MqIHfMhJQR1/oF2I1j+r9JbG3/OMpn88b7jd+AWkop4a
         hK6+VfZ63JQkT5aPPYv/FWb+9VnEKPLMW2mJqBLVTzXi3SYYfJZvEJiXW8DF8haojlr1
         /4KoDYaEfl8z2YTv+pmM64AU6IQkC4NhdCsuOUITIw4KqgCxS1CzBarP5dozEHdizjXD
         Wn/A==
X-Forwarded-Encrypted: i=1; AKwUvByTnaEGQy6q4szL5OMm2lLqHT1MtjU4PRFNJuRdmIRL4lPxfbbPUfcTTb0ZTKbtx/fZWCl6oU3iFl1lqyKRmxuU@lists.infradead.org
X-Gm-Message-State: AFq9FYKLdUHZv1TMS/wMkc5pppeL/e0vA6UrIiNW8yeyaYtOvc6TWEBp
	hyx4AbD4upELeD8LkeiJxHj6vcCvvW3Kkuj+tQUmeHmidJi5VdlQcgvwNKW30+113e8=
X-Gm-Gg: AYBFou0tqsv+AJ4SDuV/C4chkbqHiV9Bj6LkhFWlqNa9RfeRCkTAtKa36cYZDf1hCnB
	Mk23YXhkyGbphxCCcjwIsB5wGelCKlSlCnAxLxJVtRctz7S8rj4IdOz3uTAsasJaA3rdbp1cHtu
	f4UADF+Ucw9b453nWIfhzT4VOL8tsWoXcDrBJCXHHy9iFHHtgWRBMwVGjsHfrFZ13jflGcl5O5s
	ZJG4hKgIaCMiJEcbqayEaBIq8aTqCWDLo/nNPaYElq/2y74RnJ3zedyRX/n1qGdCI5lNcKQFTlQ
	+mrmNy1UOwj3K4L1pLb3BoL4VLjST72ypLGkGzpDIfSbJM69U5qjOW/iYZkpqVksYGohi75ZFa7
	v20P31PFTMqrK3aZ5oQ3Skr2/XF3Zo7zdOBYMfkzW/Z2xjY1vbiULFHn7g+pKRraEagNyQLUoBL
	i8Zf8jJ2Ew2LO+iPEUMKuXxSezfpFoNq9PE2vLKZ7V9Shze0wblOKRMbKrC+CESMwvWGpO5IGZ9
	s8GETXF1gkMgg==
X-Received: by 2002:a05:6000:4b14:b0:48d:eb6b:9d0f with SMTP id ffacd0b85a97d-48deb6b9db7mr17860299f8f.11.1792158362872;
        Fri, 16 Oct 2026 06:46:02 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd47104csm5885319f8f.8.2026.10.16.06.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:46:02 -0700 (PDT)
Message-ID: <b851c070-19d2-42b8-b19d-be4b02ad9715@linaro.org>
Date: Fri, 16 Oct 2026 14:46:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/25] coresight: perf: End AUX output when an event is
 throttled
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
 <20260915-arm_cs_support_aux_sample-v1-4-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-4-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_064605_161271_174B9918 
X-CRM114-Status: GOOD (  28.24  )
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
> Since commit 9734e25fbf5a ("perf: Fix the throttle logic for a
> group"), the perf core stops every event in a throttled group by calling
> the PMU stop callback with flags set to zero:
> 
>    perf_event_throttle()
>      `> event->pmu->stop(event, 0)
> 
> The ETM perf stop callback only ends the AUX output handle when
> PERF_EF_UPDATE was set. For throttling with mode is zero, it skips to
> end the AUX handle. When the event is later unthrottled and ETM tracing
> is started again, perf_aux_output_begin() sees the perf handle is nest
> enabled and triggers a warning:
> 
>    [  181.161897] ------------[ cut here ]------------
>    [  181.161906] WARNING: kernel/events/ring_buffer.c:415 at perf_aux_output_begin+0x1dc/0x1f0, CPU#0:2
>    [  181.234120] arm-scmi arm-scmi.1.auto: timed out in resp(caller: do_xfer+0x1a0/0x558)
>    [  181.234223] cpufreq: __target_index: Failed to change cpu frequency: -110
>    [  181.286675] Modules linked in: panfrost tda9950 hdlcd tda998x drm_shmem_helper drm_client_lib cect
>    [  181.314139] CPU: 0 UID: 0 PID: 352 Comm: perf Not tainted 7.1.0-rc1-00058-gdca922e019dd-dirty #11
>    [  181.323915] Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development Platform, B5
>    [  181.334732] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>    [  181.341721] pc : perf_aux_output_begin+0x1dc/0x1f0
>    [  181.346547] lr : perf_aux_output_begin+0x9c/0x1f0
>    [  181.351280] sp : ffff800080003be0
>    [  181.354606] x29: ffff800080003be0 x28: ffff0008023fc000 x27: ffff4b45d287f000
>    [  181.361789] x26: ffff0009764787a8 x25: 0000000000000000 x24: ffff00080dc99710
>    [  181.368970] x23: ffffb4c334553000 x22: 0000000000000001 x21: ffff00080dc99710
>    [  181.376151] x20: ffff0009764787a8 x19: ffff000801cc6000 x18: 00000000ffffffff
>    [  181.383332] x17: 0000000000000000 x16: ffffb4c3a118c998 x15: 0000000000000000
>    [  181.390512] x14: 00003d0900000000 x13: 00000001ffff006e x12: 696765625f747570
>    [  181.397692] x11: ffffb4c3a52758d8 x10: 0000000000000108 x9 : ffffb4c3a117f620
>    [  181.404873] x8 : ffff800080003a58 x7 : ffff000808de4000 x6 : 00000000000fffff
>    [  181.412053] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
>    [  181.419232] x2 : 0000000000000007 x1 : 0000000000000000 x0 : 0000000000000007
>    [  181.426411] Call trace:
>    [  181.428868]  perf_aux_output_begin+0x1dc/0x1f0 (P)
>    [  181.433692]  etm_event_start+0xdc/0x290 [coresight]
>    [  181.438665]  perf_event_unthrottle+0x70/0xa8
>    [  181.442964]  perf_event_unthrottle_group+0x40/0x170
>    [  181.447871]  perf_adjust_freq_unthr_events+0x178/0x1a8
>    [  181.453038]  perf_adjust_freq_unthr_context+0x74/0xf8
>    [  181.458120]  perf_event_task_tick+0xa8/0x290
>    [  181.462418]  sched_tick+0x144/0x2c8
>    [  181.465937]  update_process_times+0xc0/0x198
> 
> Reproduce this with the command:
> 
>    perf record -a -e cs_etm/aux-action=start-paused/k \
> 	-e cycles/aux-action=pause,period=3000/ \
> 	-e cycles/aux-action=resume,period=1500/ -- sleep 10
> 
> An update of the sink buffer is unnecessary when PERF_EF_UPDATE is not
> set, but the AUX output operation must still be terminated. End it with
> a size of zero so that a later restart can acquire a new handle.
> 
> Fixes: 9734e25fbf5a ("perf: Fix the throttle logic for a group")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 09b21a711a8764ea429d712890265c84648e889e..a45f69f39f175f3044322b25fe5413fb97154496 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -748,13 +748,16 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	 * handle due to lack of buffer space), we don't
>   	 * have to do anything here.
>   	 */
> -	if (handle->event && (mode & PERF_EF_UPDATE)) {
> +	if (!handle->event)
> +		goto out;
> +
> +	if (mode & PERF_EF_UPDATE) {
>   		if (WARN_ON_ONCE(handle->event != event))
> -			return;
> +			goto out;
>   
>   		/* update trace information */
>   		if (!sink_ops(sink)->update_buffer)
> -			return;
> +			goto out;
>   
>   		size = sink_ops(sink)->update_buffer(sink, handle,
>   					      event_data->snk_config);
> @@ -773,8 +776,11 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   			perf_aux_output_end(handle, size);
>   		else
>   			WARN_ON(size);
> +	} else {
> +		perf_aux_output_end(handle, 0);
>   	}
>   
> +out:
>   	/* Disabling the path make its elements available to other sessions */
>   	coresight_disable_path(path);
>   }
> 

Reviewed-by: James Clark <james.clark@linaro.org>


