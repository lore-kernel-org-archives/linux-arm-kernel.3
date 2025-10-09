Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485ACCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 09:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9oMA1rnXKTfDC2S12zbkahIjsfKrKZ4pl0JI52MJN0=; b=bn9lsRRENxWarX/in4VSrkCA8h
	08xsUJ5u53atJ30knZ3eQjHLKOoUUmi9FxZ2dfXn1RP4Hww1KQg5p7KC0TYwsZC7cX5Gybl/w4bXH
	PPYl5/xeZB8QobJvewvbria91f3zsSWKwU/GxIzUGBm9YQqoDWGsMEL0ebQnYZHDRHgIyPDtVLfs1
	qBd1lRpOnv1TE/Le7J9DGUZ7ZRyUfpfHnYC1rpnMFx9+V5AtYLhVuI6LpLHzz3/LHoXCxYJBkucOb
	0FSNDN65iNrdF7C4Ni89P0elT50R4p+MlMxe/amRUOeqmIABjJlDD4gg/JmNV490EwYWlDL8y5Mmj
	EEPY9RvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6n0R-00000005fVZ-0tRI;
	Thu, 09 Oct 2025 09:32:15 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6n0O-00000005fTu-0VkX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 09:32:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-46e29d65728so4262285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 02:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760002330; x=1760607130; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h9oMA1rnXKTfDC2S12zbkahIjsfKrKZ4pl0JI52MJN0=;
        b=o/Xg6rklSPGpenuSnldVdPp96m15jqW9afNnkUjN48cG4rLDz7oeej4/larV24ZmNs
         8l1gDwABpcH214qDXGvPyri+WiRrwXV+62ZH3fTbB/vNv52b8MktoZBkMM1jV7ndOcqj
         YIjqfB6DPyCUsMwAwkYfQq+FTwswxdkJlmJZdjJLIvvnWJSCrQYWsUKhPwCGIdKWAxF4
         kSlQO902StZKPaf0h2NAH01ogH6aIrzi3xWi1uK+oqbQ69HVL18cFs/vTY9vgM5pEy/J
         MmYUJivUYpDZUta6MpdlmLyCokb2uBIlEja14WGv2+LLE4B0fYpBaZ69nCkU9pg28HmJ
         rMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002330; x=1760607130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9oMA1rnXKTfDC2S12zbkahIjsfKrKZ4pl0JI52MJN0=;
        b=kuwusqF2PuRzigcLIW9dY1p7FZ80mNJxRIy1/yhvGSNYilCuGOK258aoNWfpG2ht2S
         S27o1zkRiej/Q+WL+wzmmG+zv268G+DrXpmiYKwM319VsCq1FM2QFQAhu9lX/sRUhFMq
         bf3J4irpH62AGfs3m2/hgftiSQ0t30adWFazNKWKOHVx6iPhaZcywH0ex0rg8CAYTb1g
         OYFqsvIXHhWCrnZJrcjDQhDTvYGeuu4hHND5Z58c7WlDOB6Z739bp2BjE/poESp+6z+H
         FJ85/T9cyfQ93n5NM2Gc7rG4zZYAU3tqxkLx5fn9R0h44bksSA/YmuVa/SzJ+8W+ALja
         2wHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhj0GUuC6dW4jLdRioTy5uZyGwrQ8SpQbw+WahjB8MmvdNw4kY5USO5iLFF9TO/ex5htaw0PKxnyiW73A5TiVL@lists.infradead.org
X-Gm-Message-State: AOJu0YxbuEpNokJPEotZTOYD0S2O/oq9sfhBJiqaoGng4/ttzQTg+29S
	2rROuZ8iGP0MeJ46g28adBp6RiCbHTP8yTtJa05CYIUk2aO8VdhTs7XrmLU8LERfnFhTYOaA+M3
	EEVtl
X-Gm-Gg: ASbGncvB1I9xkS2v82TZJkT3JDlgUcBwe0KBUnw8VkRJb/4hZeNqArM08aAbQ+MagNs
	Z38VjyNyudpG5keFwNeupAXXq1qffQXejifxo6XxtdgSEfB5YwwRLhG4qZvZU53+tkJZA0/owC/
	rOCWzJy+dQArNobJsEst7/VouQl8x+yljycljlUCAo7TgxNKcPu8FLVS7MlBQ3nUfeF7EuWTLd3
	GcaYUlvCvt0XNoTP7PsOjQMHoHqfMyVlJyUhonLrtlY4Vr1oYq6WSJ1e4gvO8tqav/b74dUZynU
	1MTgHffX17nx2GKbHS5iCFY58vJwjdt/l2Yly/46xjFCUjQCDmi9ZYFX0Kg50ZNp4c5VZb81R2o
	URfdQgR/Ow6+wAVYhOivGMVO+6yF57fTua1Uaw0BZRsA7CaBxWC3siiEP
X-Google-Smtp-Source: AGHT+IF2MfwiIaJMXBGQCee6jYIqXrnGNnGXs/YJ/n6ic6dRtYBMifYnsS+nB3iwEXofM4VsmbdDjg==
X-Received: by 2002:a05:600c:4e94:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-46fa9aef553mr57229245e9.24.1760002330246;
        Thu, 09 Oct 2025 02:32:10 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab36ed3bsm35204275e9.0.2025.10.09.02.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:32:09 -0700 (PDT)
Message-ID: <94dcea04-c2ab-4fc0-b61c-ac2c1a8d6a8c@linaro.org>
Date: Thu, 9 Oct 2025 10:32:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/25] perf arm_spe: Report MTE allocation tag in record
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
References: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
 <20250929-perf_support_arm_spev1-3-v1-11-1150b3c83857@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250929-perf_support_arm_spev1-3-v1-11-1150b3c83857@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_023212_180480_601F2973 
X-CRM114-Status: GOOD (  16.47  )
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



On 29/09/2025 5:37 pm, Leo Yan wrote:
> Save MTE tag info in memory record.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe-decoder/arm-spe-decoder.c | 2 ++
>   tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 3 ++-
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> index 804dce129121b9d2600be01af7f1f2780a9d0fc9..6696448bdf4f347e2032a1b4da46fcdd4016f9fc 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> @@ -209,6 +209,8 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
>   					decoder->record.op |= ARM_SPE_OP_UNSPEC_REG;
>   				} else if (SPE_OP_PKT_LDST_SUBCLASS_NV_SYSREG(payload)) {
>   					decoder->record.op |= ARM_SPE_OP_NV_SYSREG;
> +				} else if (SPE_OP_PKT_LDST_SUBCLASS_MTE_TAG(payload)) {
> +					decoder->record.op |= ARM_SPE_OP_MTE_TAG;
>   				} else if (SPE_OP_PKT_LDST_SUBCLASS_SVE_SME_REG(payload)) {
>   					decoder->record.op |= ARM_SPE_OP_SVE;
>   				}
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> index 08ef83cb8bf00be75459c78b9ee8a6cbf1971986..9b7b6c42505f43c32a188b6e9769390f057adce8 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> @@ -42,7 +42,8 @@ enum arm_spe_op_type {
>   	ARM_SPE_OP_UNSPEC_REG		= 1 << 9,
>   	ARM_SPE_OP_NV_SYSREG		= 1 << 10,
>   	ARM_SPE_OP_SIMD_FP		= 1 << 11,
> -	ARM_SPE_OP_SVE			= 1 << 12,
> +	ARM_SPE_OP_MTE_TAG		= 1 << 12,
> +	ARM_SPE_OP_SVE			= 1 << 13,

Changing the bit position of ARM_SPE_OP_SVE looks like a mistake. Don't 
we just need to add ARM_SPE_OP_MTE_TAG at bit 13?

>   
>   	/* Assisted information for memory / SIMD */
>   	ARM_SPE_OP_LD			= 1 << 20,
> 


