Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAB2C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUU8zhHO6oGWwG9C0mvXT4R6zlzfuKEc2yTbt3ShlNw=; b=gAmpw26N0xz0DCM5GtvQ6EwNFV
	GQL8yhZ4/3U0Jy2/zSp/2U36+Ms3UFce2QcupQVJcHak+x+PNjjXTXVSgm/kjC6vNkhmJxLP2UEF7
	rUDlfIOn0EAS5IJ45yuUGOjXDYOF5q0dL6vRMaRnZk5PeqngrFLL9/2VEFZZnbTTiRE+ielTB4w/8
	I0pQS8KnDNscJjt6WnvX/+O+gIUaLNsBxs1VY4EMPb+O2o+n1n1QZ++D+9eNZ6jcnfYSkMlJl7M/1
	danivu82qzsCBE20c1Nf+MSM0RrCJNpIgDvN9SvHcR2mvtvVk+c43hhNP/T9eWkSVeTOkPDWnrdV2
	Y7nZaNcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIeo-0000000DeyS-0k2V;
	Thu, 19 Jun 2025 17:02:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFi0-0000000DEB7-2LYZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 13:53:41 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-453608ed113so6716395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 06:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750341219; x=1750946019; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZUU8zhHO6oGWwG9C0mvXT4R6zlzfuKEc2yTbt3ShlNw=;
        b=KKpXScswT7iOaQ+wmkarOLmjTb6NaCNxCjljt7Krbsyujmb/vpeYFogMpgWQvWkzmQ
         g1KwR1CPP9rlNBQ6IItD2uRZO4uCeRzcTVDjoauxn1w7WluPYvDgmOoIKosUPCvSubww
         Q9UafuOWESvv+Lcmya4D359+UxXDvPR15qcah08r7EfmkwhN48fypLD3nnE7v+VWv3G0
         Gh6SkO1Yb5nf6FPPmCmrZuClhxsERELSG6+eQ+XWPDtbkLYTpFgQKqzRWOL7PXSy6TBN
         tXrvRdX8zhuW1JPMDRE3TwRFFZiR/wf73Rv9s+tIvIhTPCTqXx/ql8vRETnUFDDkkCAh
         p4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341219; x=1750946019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUU8zhHO6oGWwG9C0mvXT4R6zlzfuKEc2yTbt3ShlNw=;
        b=v5sdnsSsE4MWTMKgMgCC1dwhXvBozHdw5vh9cPU1kEK4Fh80WTYZUIgslvvwEmzkdD
         gINI5U+ve4ReX7/g/yr1rkIiL0qopHTcuMOUycY1ZyuM+gjghw+av22aOIEn2x8uxP3b
         /8FPWbmACoq5n2oLyk6dh2UUq8jsHXNpTi/HlUuMs1onfUYsvxj2JXciFL2Bn26AXJhe
         uNlxrjuoigr8S7A08VFiTan5w6JaDuJKKotkk+z4Cbx9MKILEIbvLD8O7AchGRD300VA
         ayUWXkumNx8ACgQe51w5awvU7BnKxp+O2f8mqCEHI0N06bYLR19p8e5m/R9gt6DdMFX8
         3aCg==
X-Forwarded-Encrypted: i=1; AJvYcCWxt1R53RRDHAHwEWySABse0aqvp16TPS/HvveI9SvzpT/ed5MKSjqw8CB0L2bFQ4hiW2YvPim9MJZHMim/Zy19@lists.infradead.org
X-Gm-Message-State: AOJu0YzDt6Clx3z8HD8V7iTtN5J1Ho5Ft5SJ8Rg+eeGV005n7vnGZIwQ
	EP7+nkKBlQEMnRlKNg06FNUnr9ppeJb/s2y+aCeSMnDcH/LPMmf2KnjFTdjeFk/r4Mk=
X-Gm-Gg: ASbGncvh7LWAtpbyyjosDdGGujTlUbT1YGVby0LSeHGyvZCcYUtZe+pKBzvFReeztCn
	8VBPHVvEKzKAdR09l4l3ndlw/wNZOXwuLweO6FbEnyhq44vAPknXzob0uOz9eGAKp+vTHTL/0+s
	JrtsIelLbbXYQkJE7jCFYAYM9nMI4bKp0Hk7WViTG/zEvJ2AhNca2m8nH64JzszFCGkARKurrWp
	d/KdpykCdnFiCNqNvbNR5ZbxObpvZD+Lj8ToRYQu1Hd30zHXFGKUdobqTbn8M/Qt0xfkAyTtTxn
	aUMPb5E25DLeKJymYL1qI6KyRA/yqgffSH3on6bJ6202/o6+T7PtzSZo42Dts5r8Ah8=
X-Google-Smtp-Source: AGHT+IFj4dr7v4Qv8yB+4oBl+szjM3NykRFIgMprDf2uBBkMpXfTY0Dvs/jR/zXiKyHXRq0RFbdEsQ==
X-Received: by 2002:a05:600c:8b25:b0:44a:b7a3:b95f with SMTP id 5b1f17b1804b1-4533cac9674mr184653545e9.25.1750341218748;
        Thu, 19 Jun 2025 06:53:38 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08a2bsm19906526f8f.62.2025.06.19.06.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 06:53:38 -0700 (PDT)
Message-ID: <5c88ba9f-2627-486c-84d1-2a721ff9ffcc@linaro.org>
Date: Thu, 19 Jun 2025 14:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] perf arm_spe: Correct setting remote access
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>
References: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-0-6faecf0a8775@arm.com>
 <20250613-arm_spe_support_hitm_overhead_v1_public-v1-3-6faecf0a8775@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-3-6faecf0a8775@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_065340_601784_D7FEECD8 
X-CRM114-Status: GOOD (  17.64  )
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



On 13/06/2025 4:53 pm, Leo Yan wrote:
> Set the mem_remote field for a remote access to appropriately represent
> the event.
> 
> Fixes: a89dbc9b988f ("perf arm-spe: Set sample's data source field")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index d46e0cccac99a36148b4daa37f2bf2342e6b47ef..fdef6f743cf3c76b1dcdd57f5a2c297642fdd21a 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -839,7 +839,7 @@ static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
>   	}
>   
>   	if (record->type & ARM_SPE_REMOTE_ACCESS)
> -		data_src->mem_lvl |= PERF_MEM_LVL_REM_CCE1;
> +		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;

Should this not avoid overwriting mem_remote if it's already set by 
arm_spe__synth_ds()? We do that for mem_lvl above.

We also still set mem_lvl = PERF_MEM_LVL_REM_CCE1 in 
arm_spe__synth_data_source_common(), if it's not right it should 
probably be changed there too.

>   }
>   
>   static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
> 


