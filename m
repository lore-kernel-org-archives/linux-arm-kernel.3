Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8693BCCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSec+D9Gcxlfy6q4kTQg7A+nAzcOiDEiKgFT1VAeycs=; b=LsqBeYf7G4mvvAdFCP50X7p/2J
	217wuemdMlYYGXaQOPcHpuUEm9NGnssz3S55XdkEIC2QFAz3Jmn04AVDACL6T7eS3eJgVthqA7q/J
	u/8j8EpleNef1p5FrsBouizPmg1ELVgS3Jqa6of2h3mBaq6IIsQQZm9CqO1ytmpS0UV6661PSGxvu
	bpWU+bJ6rHMPMN1BUdQhMmD+dxSwwH5j6nBk+hlhniA/PqvDs3Kaz4dYMTAl49irqJduXSMl79H3s
	6V3HXTLMdZpqd22/tkJBREJwhzw3SVKAvQFAL6LOUo3kO86gC4uUyJeQHzXRq2zCHLIgE4f0jshTj
	o8xlMOcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjvl-0000000732K-1Y5M;
	Mon, 19 Oct 2026 09:45:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjvd-000000072vq-1kgz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 09:45:17 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so13156135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 02:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792403112; x=1793007912; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oSec+D9Gcxlfy6q4kTQg7A+nAzcOiDEiKgFT1VAeycs=;
        b=cczIRk2f9YIsNZyCxA3j977IuQAORn3E1EfbdSh1+fBZF6ZdfhVKeeR5FOtfWHViKk
         EOXvMEfNDQca9n7sr0hj7C4Dcj+j3K057WG2HtuTeyhddrs+zYbbZA3Wp4oxCBUFDs4f
         qeoI/qKH+YIj0TrC6LaI/jwTnul+c8AEk1pkwmk5NAlkqNRPVFXGeHbRsHXzu/dzLpdq
         twdhI9CgBTdol+kzzCQdnNdgouBDqkCyQKvM0DAB5V40L6DgabWvEyvM4Ux1Kz1WmPu4
         QGsU0PFmK0LdkhC/xdZKOBeXR0LXbh3ugAT6NjiE5wFyEV+eTEgpfSUTakOyY3AVlX9W
         PDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403112; x=1793007912;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSec+D9Gcxlfy6q4kTQg7A+nAzcOiDEiKgFT1VAeycs=;
        b=CM8iOjDMzaDu2NPX2+zVBz0RMGvDEzVboCkavMiRLTNeGsD+aBqKE0GPC0G9qjjQX7
         E9VA6Umbpojd4VYkQCDCjR6htUuv++y1s/ZLggTTNICBHr4DZ08FRn/0mI18bpu/SCe0
         3gvOHYhfOuZdRRCYbB039K6l2RwLvnsMfhIvapd8w3KO4azSm+Q32JDyg5nGPJvCv0vq
         A8ipHnqCoMaZ2nBKH/Ew8TjoanSDKiFJHcUb7Ik8XkMGfvU4r0AzMbxAu2xkT8IrU1lH
         0vNf4N2JzZ5jQQohMJv/rP4uFhPlhA9fWrehxs2ndF++gratLSpCIWtDwwFJtWu2EQaX
         Czcg==
X-Forwarded-Encrypted: i=1; AKwUvByFL/pgP4YO30WmtCsQFCqFYW4b9Ids0ZP6WPXaJTYW+4n7xC9jJEyDnm0FUjoOyOhZlHsmf/6tPSKF2G/PPyDp@lists.infradead.org
X-Gm-Message-State: AFq9FYJGp9l63dNsgS9yqLXHV4VMW/7TBCmk5gzP/uDw1Z9yQSU3KSkx
	d7T9klZErGlvC0OxB6JSZr2EUglDhMTcUN5AOQpkSqjmXWz8ycx2XqEs+XALjxbLiGA=
X-Gm-Gg: AYBFou1g4L390A9HkFhWYjbAv1lZZJWTkcPdehlj64ax5h/nBV1j4gr670Lom1V9iFg
	l7YttCmgdLtiassxPsJy7UzjWhyVuLrqbb2xgDAkAQM3USMjmyS5RCGoCCgPKNrgCec55b8o2qs
	22WLznSelTKYAfSjCdfy0MwLC9re/1w6uCp1v2AHPJo/ajczoih/uzZIzDLzBTIBqtgc7AWf/TO
	vwwC0GS36xWO/ONReK0GfC9dkvpgQYjn7B2yDD2KHfAJnMlYCUJLzNh7u3PCVRWC9mchFCt0LXv
	4WzprkhofhytLfD1tK6xu1uZPp2kmLwuemzvBWlt1mqQ/bRpxpYaWv00Cls4ovxPx140ugsGodt
	TXToaeAxDJ+Ab+2b6Xq9DqYA335u50wnO1JvdSntsPS8xrpQ+OJ8Awvu6Fyqwyfw9vRDYsbq3Wj
	YWEWQlRJ6HzMkFcdLiknIiY+E85038zZkvEm0hQlGBvkeejPSTvrb9RqMM//lgwa/AOwos+tDxZ
	vE=
X-Received: by 2002:a05:600c:1395:b0:4a1:c6fe:5c0e with SMTP id 5b1f17b1804b1-4a1d76148e6mr149657955e9.33.1792403111528;
        Mon, 19 Oct 2026 02:45:11 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd91c55bsm311684915e9.0.2026.10.19.02.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:45:11 -0700 (PDT)
Message-ID: <3d4a1883-3600-4e83-96ca-ccaec398fe91@linaro.org>
Date: Mon, 19 Oct 2026 10:45:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/25] coresight: trbe: Pad snapshot buffers
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
 <20260915-arm_cs_support_aux_sample-v1-10-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-10-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_024513_591647_A5DB19F5 
X-CRM114-Status: GOOD (  26.47  )
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
> Snapshot buffers use the head as the write pointer without checking its
> alignment or the space remaining before the limit. After a stop or a
> move to another CPU, the head can be misaligned for the current TRBE.
> It can also leave too little space for the Fill mode out-of-range
> workaround.
> 
> Pad the head to the current CPU's alignment. If the remaining buffer
> cannot hold the minimum trace region, pad to the end of buffer. Update
> the head for setting next write pointer.
> 
> Fixes: 3fbf7f011f24 ("coresight: sink: Add TRBE driver")
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 36 ++++++++++++++++++----------
>   1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index c7cbca45f2debd4047b93283ea9fe5dd9e1f2ebf..a31f2ebc327cd681344a62de28c0b3840505a9cb 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -374,18 +374,6 @@ static void trbe_pad_buf(struct perf_output_handle *handle, int len)
>   		perf_aux_output_skip(handle, len);
>   }
>   
> -static unsigned long trbe_snapshot_offset(struct perf_output_handle *handle)
> -{
> -	struct trbe_buf *buf = etm_perf_sink_config(handle);
> -
> -	/*
> -	 * The ETE trace has alignment synchronization packets allowing
> -	 * the decoder to reset in case of an overflow or corruption.
> -	 * So we can use the entire buffer for the snapshot mode.
> -	 */
> -	return buf->nr_pages * PAGE_SIZE;
> -}
> -
>   static u64 trbe_min_trace_buf_size(struct perf_output_handle *handle)
>   {
>   	u64 size = TRBE_TRACE_MIN_BUF_SIZE;
> @@ -405,6 +393,30 @@ static u64 trbe_min_trace_buf_size(struct perf_output_handle *handle)
>   	return size;
>   }
>   
> +static unsigned long trbe_snapshot_offset(struct perf_output_handle *handle)
> +{
> +	struct trbe_buf *buf = etm_perf_sink_config(handle);
> +	struct trbe_cpudata *cpudata = buf->cpudata;
> +	u64 buf_size = (u64)buf->nr_pages << PAGE_SHIFT;
> +	u64 head = PERF_IDX2OFF(handle->head, buf);
> +	u64 next = round_up(head, cpudata->trbe_align);
> +
> +	/*
> +	 * A task event may migrate to a CPU with a different alignment or
> +	 * errata. Make sure it has enough space, pad up to the alignment
> +	 * required by the current TRBE.
> +	 */
> +	if (buf_size - next < trbe_min_trace_buf_size(handle))
> +		next = buf_size;
> +
> +	if (next != head) {
> +		__trbe_pad_buf(buf, head, next - head);
> +		handle->head += next - head;
> +	}
> +
> +	return buf_size;
> +}
> +
>   /*
>    * TRBE Limit Calculation
>    *
> 

Wouldn't it make sense to have compute_trbe_buffer_limit() do the 
padding now that it happens for both normal and snapshot mode?

Either way:

Reviewed-by: James Clark <james.clark@linaro.org>


