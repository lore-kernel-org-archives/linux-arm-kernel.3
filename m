Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94573CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 14:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWGYhCQeY167Hr42YHFijyfh5XKD6HMAPsUmURHfd7s=; b=xT1HmC0Iq5UEhxFxb/7rGblQPe
	numD6amofSb5MNBWzOInRLZf+CSo+190StDXbfzOrOlA/w/hCgG4bd1YUHT4HKFBiet9zpgzpDM9u
	n0DUSo8KL8pvTqK+eZoOSnb3HYl0AfBfVoJ6VxLRKJnChxMBoDJL4HSkjH8MfT9FdGv+lZp1jxZBg
	ujnEuqyhAJrIumS/mQOgupz05NYxsRBIpdfxuFcaK3+xnO03LxtRshR1pa0PsSw7bjDsoTy9MEWTb
	5usRMemYtkPPatCkW2boqYLcxCv/mXfVomqRk1W/Ci6yLcs0Q4QGCCyPDy0kxAIm/6qfXEtw+NTTd
	lGficbJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8mi-0000000Gs4E-2I6z;
	Thu, 04 Jun 2026 14:11:00 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8mg-0000000Gs3u-11vK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 14:10:59 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-68cc6c7df99so1058685a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 07:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780582256; x=1781187056; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cWGYhCQeY167Hr42YHFijyfh5XKD6HMAPsUmURHfd7s=;
        b=e7s/xrotuO40VYHAVL22W6Eq88X4HfIpxo+1/CbyuqNu0UuBEWwKDckX7grIwdYtsn
         jc2WDEPkdjY6wDpKzLQWGOHsRpVOte+gEKv9ecg89bwzjiyKJSCk64xCN5vVyv6fS0TH
         UqEEdnAsuYCuzbIL+VR4hmXw7qYi2gZ8bqBWir0gZG6uWdoZf4FR2rPRuJgOdBDyZis0
         8EeZ322PDAPEbTkQLwODVm9f0Gxuev9PZO/JpLCFVAEKq/QdcsTJ1FXu5QhFIkQv7eRJ
         6SaOVZfmPpVwwoJBF/pKXlYXtp4lKMazOE0+xkwOOVmr0ATfU/02f2JA29hxOOq2JJZD
         dQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780582256; x=1781187056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWGYhCQeY167Hr42YHFijyfh5XKD6HMAPsUmURHfd7s=;
        b=jBze94v5G/52IE3OfsWvFUAF7bSwFVFDfqfy0fP/VWQl9+Wrgf8nzmsC0C15fCW6rD
         6AmXe0badYZTCyFZG88r4tUzkVp5I4MYOoghQisZTMhPfC+VdG+UEPJlNXiQyJ5Mwkgo
         VRLDrjZsS/4SGzEp7wIzbpIGJMNXw9WP9XcnDJGKQuxpwiDVyy6UsyF6Am24R8XXT9L2
         VUQPMlba8wEaR0LRXqFTw7/9Y2yWaltm+9asSAQPdiZGBx6Z0mS7yD+bH55zVeoFNjcj
         MVZg6AG9nOaU+usyFsJn8eCM1UoGdE8Ln9BpLm1IZU1hk412MJrFyM16NZXRv5taAAI1
         76Gg==
X-Gm-Message-State: AOJu0YyqAk1/4rueGq8vQjUUGK21Bjo2tYHWPmwi7x5wmq5fBuUZKGJf
	DRGsAdfAV5Tzm3teJSu78BZwGh2RO/d+m/TcxTRbFWg0/j50AGNd0VwzIFBNYzplxNw=
X-Gm-Gg: Acq92OHcoY0oiBI57YvGvmWq57+lOdNFco2qX7CjlZ0lHuqywW1eRmLkCmGJpFiVRP9
	Zyu+nxVB/e5bl9Pmlcd4GVVRtXxHwTAvPkluH7dNsNiCGVJEuJ0McuJ6lY2yM8deHII/HA1kYKO
	JZgp1NcpcezPmCitt7VuezI49Vz9EV437+DaiPZbA4oVoeOlrMn5Mn0vQkxhWYp9EO8uXkRzXZI
	fa/L+eFxBxE9+BzZwmCCjBBLloKjlcfEY4CS2ydxrJj1vCXTCWnEyxVRyKLwwYUbKwvPfyXtt84
	fRtCJFBC0939w4d9xNvMTIzUpNBuPuq3ivZmpsMdNyVIbbfo4dVLt9wxNiW8V+71eLMIOCGBwY1
	+BJgrFjfI3K3w8JnGb1L2pOHHnTMDCiNEICUJC3fRUIjseIv9k3eBTKxq+K0T3Fzqpz35ahDB9d
	7HT65ZMA+NgkxgZqafc1MYJEdXQE1udKJLjVhYZchcDrYPFXkewA==
X-Received: by 2002:a05:6402:27ce:b0:67f:99d8:868 with SMTP id 4fb4d7f45d1cf-68e710eb7bfmr3728458a12.16.1780582256213;
        Thu, 04 Jun 2026 07:10:56 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2c810sm2540577a12.9.2026.06.04.07.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 07:10:54 -0700 (PDT)
Message-ID: <047a6470-9afa-41f7-8942-9d9b6d15eff8@linaro.org>
Date: Thu, 4 Jun 2026 15:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] perf cs-etm: Decode ETE exception packets
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
References: <20260526-b4-arm_cs_callchain_support_v1-v6-0-f9f49f53c9dd@arm.com>
 <20260526-b4-arm_cs_callchain_support_v1-v6-1-f9f49f53c9dd@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260526-b4-arm_cs_callchain_support_v1-v6-1-f9f49f53c9dd@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_071058_307541_EBA60163 
X-CRM114-Status: GOOD (  15.68  )
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



On 26/05/2026 5:59 pm, Leo Yan wrote:
> ETE shares the same packet format as ETMv4, but exception decoding
> handled ETMv4 packets only. As a result, ETE exception packets were
> not classified.
> 
> Recognize the ETE magic for exception number decoding.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/cs-etm.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 6ec48de29441012f3d827d50616349c6c0d1f037..ab79d08f5a6095448470e2c3ec85ff3db2fb5634 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -2138,7 +2138,7 @@ static bool cs_etm__is_syscall(struct cs_etm_queue *etmq,
>   	 * HVC cases; need to check if it's SVC instruction based on
>   	 * packet address.
>   	 */
> -	if (magic == __perf_cs_etmv4_magic) {
> +	if (magic == __perf_cs_etmv4_magic || magic == __perf_cs_ete_magic) {
>   		if (packet->exception_number == CS_ETMV4_EXC_CALL &&
>   		    cs_etm__is_svc_instr(etmq, trace_chan_id, prev_packet,
>   					 prev_packet->end_addr))
> @@ -2161,7 +2161,7 @@ static bool cs_etm__is_async_exception(struct cs_etm_traceid_queue *tidq,
>   		    packet->exception_number == CS_ETMV3_EXC_FIQ)
>   			return true;
>   
> -	if (magic == __perf_cs_etmv4_magic)
> +	if (magic == __perf_cs_etmv4_magic || magic == __perf_cs_ete_magic)
>   		if (packet->exception_number == CS_ETMV4_EXC_RESET ||
>   		    packet->exception_number == CS_ETMV4_EXC_DEBUG_HALT ||
>   		    packet->exception_number == CS_ETMV4_EXC_SYSTEM_ERROR ||
> @@ -2192,7 +2192,7 @@ static bool cs_etm__is_sync_exception(struct cs_etm_queue *etmq,
>   		    packet->exception_number == CS_ETMV3_EXC_GENERIC)
>   			return true;
>   
> -	if (magic == __perf_cs_etmv4_magic) {
> +	if (magic == __perf_cs_etmv4_magic || magic == __perf_cs_ete_magic) {
>   		if (packet->exception_number == CS_ETMV4_EXC_TRAP ||
>   		    packet->exception_number == CS_ETMV4_EXC_ALIGNMENT ||
>   		    packet->exception_number == CS_ETMV4_EXC_INST_FAULT ||
> 

Reviewed-by: James Clark <james.clark@linaro.org>


