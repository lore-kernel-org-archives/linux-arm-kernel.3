Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413B7C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzQVXz3Vu5cQYnBTWDcGHmTfA/LK3pSTe6SHrggSaWw=; b=gLNJ+bB3pSOGStd/h882/060wL
	5W4VpuWJ9LhIuDvx8MmthCQM5v1U9r/JiiauIW3AG/lQMuYBbOHWyqcmmk7NIXG/qP3KoR913wYvw
	9p7ATHy9dk1ldAE1j9WS9cBcwkoF7V9ofUGQyAjfZ1sfmyq8kAc7sIoHOZ3iC6IwOvX4d4rRyAaac
	vQrcZbcr+3RTM9x50XgIh72bClNIG4+d+pmoDkIBtcZWIaX66hdPo8Q+QyJQjw4304x08u3V8vzbB
	Ee2Xxi7qHsnNCjW/J+y1ml4UWH228l1x2BuZQG3VIVrZtfasQ/5tvmuh2X53D82dPmYtIOD8cS34r
	IfaJUOag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBNi-00000009ePf-0jFX;
	Tue, 21 Jul 2026 14:23:38 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBNf-00000009eOv-0slK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 14:23:36 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-698bf053053so13246552a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784643813; x=1785248613; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzQVXz3Vu5cQYnBTWDcGHmTfA/LK3pSTe6SHrggSaWw=;
        b=ogLSMMKtA04gYHoyqbKzsPnBk2FB53jgsjKMeWl1+DwDjZe2lVnlvYpl1scNE8+Kkp
         96PtEU3z5y8WUFX9XcWNZOK9rho4cYbgqJxsAAp9ItWQQA5FPZbmglbavHjOo7apKONH
         ds6b4L5pPHNO2ACnOlk70Vq41bh8/rXuPOIv2Mpr9TyoGP0Mc4ffuOuPOudbrAYKsPvd
         rDO8L1gtjEKZAPKpV25h1clmiX6MkXqUlmHaNGsaw7pwS48TGLgGy1Dtn3WxolyBDMjw
         aGygl6673bnUHhrLS2zysOI7wDH1XM4A19oj9nFUU4QUVMoRzB+J6Ck4YYWQeyCULR4x
         IDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784643813; x=1785248613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzQVXz3Vu5cQYnBTWDcGHmTfA/LK3pSTe6SHrggSaWw=;
        b=Lblxz/LfSgv2T0aT+35sRNztuJcrzZytb+I6nHLk2qTOdNO1ESVGu4oT9lzhLl0vLz
         hs+j+2Ukm5In8uSrN5dAiQAJpE3PsLcCm9Ew1p+Z3KIkjWO0K7MORbWpq5hLkEtktnk7
         DWbn0V5VaAdj9vksixd8pN5Uw9MeoRsO3AsADudI5omA4c17u3a7Pem+VROgAGViNyba
         eFSUeeSWhtC3PdDMVgFuZpNNJ1q8vsPVvQkwbz6SVd+37jAgkaQOBbmHVqNv+vH6wAob
         aQ8VYa5ynA3GMldhMhWSKEZW6KyNC8SmO2UeRI12meyqmgRQtwp66v8Uor0cyj9nF5VS
         onjA==
X-Forwarded-Encrypted: i=1; AHgh+RoPnRX3K49bWKN6VKBy/kK5ujMlSHhWyK96oGCCjoKEFiEwqBW0koSkXmV/fXwKTxT/TSc3MQJWOj7Wfq5+ckFP@lists.infradead.org
X-Gm-Message-State: AOJu0YxsOoxJTDr9Mj+mpnFenx2gPZxOHodPO8kiTX5IrFr/QUcgQL7w
	ACru3j+3GDGaYmdF4c5QOREEE/np8OrR7LtY/fCWRfKy76JpzE01Yahdky6O9Bajk74=
X-Gm-Gg: AR+sD12Mrrv6O7QNjpTDFXO1RV0V284NXmuoeEpVp/0WfkWzputyaAUbK2pZBIaEYu8
	jshrJBLHCpF4Q1SZ6wxCSISg0JgWgQIAyZDIl2WvBbtJw8sBMaMVDZzZeKGQFORCdvNPmQrzyd4
	2NNcyoMKoD44pN4EIwjFkhCHFb69rtSErxmRvUOxdpYwXneNrHMFNBgJI2LmudfNjMspmg9Je+7
	Qe1ysCZHhFM0wPaFSKCgbkB+0wBeUi1rKi/fy7iTeWF2NvKJGvhD6VllQkgOJN3K7AdtxvevzTl
	Sz5CbsrRsHHDK+WjyLQkjTMLRVHB4Xsl9cFPfIzpatHbVkAkDUjw4fDlQclHf3+hqe8JXqpHvRl
	EjrQwSHGnmM97sXckCQyIsVq2rg/++yA0XPnrGuSPN6w1dfJsTAAGVZIQSL5hugeNgFkLXYfgGg
	zW7d0MjwxkMJeT3h9Rfw==
X-Received: by 2002:a05:6402:44da:b0:69a:af38:2fc0 with SMTP id 4fb4d7f45d1cf-69e652ddde8mr5595284a12.20.1784643813011;
        Tue, 21 Jul 2026 07:23:33 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e700055a8sm5846338a12.28.2026.07.21.07.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:23:32 -0700 (PDT)
Message-ID: <b12b6ece-16d3-483b-a1bf-30d41c6a252f@linaro.org>
Date: Tue, 21 Jul 2026 15:23:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf cs-etm: Avoid truncating AUX buffer sizes to int
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, Suyash Mahar <smahar@meta.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20260720-perf_cs_etm_fix_big_size-v1-1-97ded24636b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260720-perf_cs_etm_fix_big_size-v1-1-97ded24636b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_072335_290666_7B15AEF2 
X-CRM114-Status: GOOD (  26.28  )
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



On 20/07/2026 11:01 am, Leo Yan wrote:
> cs_etm__get_trace() returns an int, but it used to return etmq->buf_len
> on success. That value comes from auxtrace_buffer::size, which is a
> size_t. For a large AUX trace block, returning the byte count through an
> int can overflow and make a valid buffer look like a negative error.
> 
> The callers do not need the actual byte count from cs_etm__get_trace().
> The buffer length is already stored in the etmq->buf_len. The callers
> only need to distinguish three states:
> 
>    < 0: error
>    = 0: no more AUX buffers
>    > 0: data is available
> 
> Make cs_etm__get_trace() return 0 for all non-error cases and use
> etmq->buf_len to indicate whether a new buffer was found. Then make
> cs_etm__get_data_block() return 1 whenever data is available, instead of
> returning the buffer length.
> 
> Also refactor cs_etm__get_data_block() to make its return value
> semantics clearer.
> 
> Reported-by: Suyash Mahar <smahar@meta.com>
> Fixes: 8224531cf5a1 ("perf cs-etm: Modularize auxtrace_buffer fetch function")
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   tools/perf/util/cs-etm.c | 46 ++++++++++++++++++++++++++--------------------
>   1 file changed, 26 insertions(+), 20 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 95e3ec1171acc8442d8539a72a26a1a5a53a2f37..114b3cd2da495e54e78df8fbd707898312f95079 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -1467,8 +1467,7 @@ cs_etm__get_trace(struct cs_etm_queue *etmq)
>   	etmq->buf_used = 0;
>   	etmq->buf_len = aux_buffer->size;
>   	etmq->buf = aux_buffer->data;
> -
> -	return etmq->buf_len;
> +	return 0;
>   }
>   
>   /*
> @@ -2151,26 +2150,33 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
>   {
>   	int ret;
>   
> -	if (!etmq->buf_len) {
> -		ret = cs_etm__get_trace(etmq);
> -		if (ret <= 0)
> -			return ret;
> -		/*
> -		 * We cannot assume consecutive blocks in the data file
> -		 * are contiguous, reset the decoder to force re-sync.
> -		 */
> -		ret = cs_etm_decoder__reset(etmq->decoder);
> -		if (ret)
> -			return ret;
> +	/* The current block is not finished */
> +	if (etmq->buf_len)
> +		return 1;
>   
> -		/*
> -		 * Since the decoder is reset, this causes a global trace
> -		 * discontinuity. Flush all thread stacks.
> -		 */
> -		cs_etm__flush_all_stack(etmq);
> -	}
> +	ret = cs_etm__get_trace(etmq);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* No more buffer to read */
> +	if (!etmq->buf_len)
> +		return 0;
> +
> +	/*
> +	 * We cannot assume consecutive blocks in the data file
> +	 * are contiguous, reset the decoder to force re-sync.
> +	 */
> +	ret = cs_etm_decoder__reset(etmq->decoder);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Since the decoder is reset, this causes a global trace
> +	 * discontinuity. Flush all thread stacks.
> +	 */
> +	cs_etm__flush_all_stack(etmq);
>   
> -	return etmq->buf_len;
> +	return 1;
>   }
>   
>   static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
> 
> ---
> base-commit: e01c7bd5b1eece254bcbf282db066b12c4815d21
> change-id: 20260720-perf_cs_etm_fix_big_size-ec5608f767df
> 
> Best regards,


