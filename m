Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9751CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XmagYXZGhiRCZo8nGtg5dtjzropHlOVEQuuywu8QoA=; b=oKo5kx7mgvRM8FPVkFsqzvHvog
	21xZw8e6phi9CNzGuJmxUYiR2U0tdQmG47UXnQc6TIQAYmYij6IdwjV63asVbDWQZ+vgkHztzn6AY
	BUuEnLGX8t8ASOQrBLk2rh91TO6IxNx0+/x3FWG2Ne03ooUq1nh47aCXbU2RLRLkPXo3ktH6zlk6F
	kHwDF2m24wzO+LctH3QmXA2fBtBqB9ukMeMFIwos285ugZPEUPzZuronlf+AFsR7/+tye7s0omXh+
	2qTHOG0Gb8KAgXRphq3pZJjtsR3F/KDFknqkBwAm7P7ux9sHJhC7t+vwZ1txJviqCsE8g97gTmeqH
	MgnPBPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElvT-00000005qXI-0J9C;
	Fri, 31 Oct 2025 10:00:07 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElvQ-00000005qWr-3dfV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:00:06 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-475dd559b0bso26873075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761904803; x=1762509603; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9XmagYXZGhiRCZo8nGtg5dtjzropHlOVEQuuywu8QoA=;
        b=T3W94/7mYRCCHY8w4+CZhd3jRM8ebpOdPDs48lG6UiTf98ElSnlzMaSditM9Jm0uru
         ZfXmdC5NJmpixe3kWqCvAnr3QcElr9BISU7nzxLocfeBAYzsemv+USzEaBcnjSN6Hauf
         kY7I1z24jRTf/vY6eIs6iSdTX5RNnwzI+zhV4Ote/ZgUXotJAHwqKrO1JW6/lc/TaWAd
         XyWt0YZtx0tHCdvmT2IkS01ZSG1RxMqzECHnNiRK9s35iAr0Vx0P4XN4rhSuFXrbHbrQ
         PiSlF1DW/Q2Mep0RSE4+gIW2+mC8MAWeDuuiq7ZeMppBecaAIeW9eyH/Wjdh6si9tBHd
         kE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761904803; x=1762509603;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9XmagYXZGhiRCZo8nGtg5dtjzropHlOVEQuuywu8QoA=;
        b=GPuero31Ms0U15rUBO8eb50Y0ZQGImEsRQ1TpiTw8qiV77FpHZKT9dxxnHFED9YULL
         1o0R6JKjJlxE73Zuj203Av2AjzTAdkM2PrH685HWFa+pWPGouDIDJnkEeVOyLnM6/HZZ
         OBbiCYgSdDacT5rqOTZx5M38k3zhg8HftRW+EWNopTezG4TphTO5QPs2aG8MnhT4Ha13
         OTIcljgoRksDQZlcP7q70P1KjfFFVI8AN7Rc5U4eX3KqxkG1NltOMFL8sIf2DsXe+uMN
         P1XVQRDd2Cs62cSiMD7jUTUm/cQr24eCJuknQcSUVbbdFb9cF/e8qQ9SpxQw+1hrFj7T
         o1CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjtlLRMo6+NZfqzevDPnDx5yQKPjoq1h44gYotlS3s4sTHQy7CmB5SsV63H+OCk0Fgj0n1a05rbUpL/QrzvsZg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9GfAttAvhSWChVhEdl+yQMZ4Pk4ph9zFj3UXU51PewaO+muMw
	q5EfZBAYv7GI/CGIF2kBFJgnz6GP9X+IO7X3VU3jX0mjLz0R/URv4tLXvO5MUwxihYM=
X-Gm-Gg: ASbGncu8ZPVLyQ6SQ1vhi9ZCmvYuVu2ix5E4LwB03Y2x1YhWm0BlsGswY7hDSwIsgv0
	HsdMU6WBShloZCWazDQRwllXzStIdbXOi3Lamrn/fOQ7AMsKc0ksTYmcaKkqY2sjbw3y6khs/Rh
	G3d1KEgYKxuezWE9iBjKGO4bsmWSagEU+v2yvqABylkYXOeWtHr/bgUc1a1iEqmS41pJqtRt2Rj
	Z7WNNN/YLZGFpij1w4hmnBoZLvEyn9SKex6THHU5dQUDtizM1yBwZ/AibADJ4gmEfjohk+ua7gm
	sRrr4B/KSiQLKqY7dqyiLBFc2/scdKStk8wnnceEss7hTTe4688xBW8DVPy3D5SRfKJFm1bsiaY
	vxQdGwRBwZsNvC06n6/EWaA1K9aKgZvUsfGB8iJP33rBl8zVnXHB4uTcpAUBWgZK1G3E9dQwqTt
	JVVlsqmnAuZquNDyMQ
X-Google-Smtp-Source: AGHT+IEv9vBf1gcZcP/1EXFL+TdkTt1q9osVqrYbZXlOtnlKXOqyYbm17I+a0qRcWFjfmA40A3E6SA==
X-Received: by 2002:a05:600c:4e44:b0:45f:2cb5:ecff with SMTP id 5b1f17b1804b1-477308ce7b2mr28429105e9.31.1761904802781;
        Fri, 31 Oct 2025 03:00:02 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47728a979b8sm86399575e9.10.2025.10.31.03.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 03:00:02 -0700 (PDT)
Message-ID: <18df2108-5f09-4806-af0f-3af3fbff3f92@linaro.org>
Date: Fri, 31 Oct 2025 10:00:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: Fix typo error in json file
To: Chu Guangqing <chuguangqing@inspur.com>
References: <20251031031729.2304-1-chuguangqing@inspur.com>
Content-Language: en-US
Cc: john.g.garry@oracle.com, will@kernel.org, mike.leach@linaro.org,
 leo.yan@linux.dev, peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251031031729.2304-1-chuguangqing@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_030004_964618_EEF77C0A 
X-CRM114-Status: GOOD (  12.74  )
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



On 31/10/2025 3:17 am, Chu Guangqing wrote:
> Correct instruction spelling errors.
> 
> Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
> ---
>   tools/perf/pmu-events/arch/arm64/ampere/emag/cache.json | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/ampere/emag/cache.json b/tools/perf/pmu-events/arch/arm64/ampere/emag/cache.json
> index 4cc50b7da526..4001cc5753a7 100644
> --- a/tools/perf/pmu-events/arch/arm64/ampere/emag/cache.json
> +++ b/tools/perf/pmu-events/arch/arm64/ampere/emag/cache.json
> @@ -81,7 +81,7 @@
>           "BriefDescription": "L2D TLB access"
>       },
>       {
> -        "PublicDescription": "Level 2 access to instruciton TLB that caused a page table walk. This event counts on any instruciton access which causes L2I_TLB_REFILL to count",
> +        "PublicDescription": "Level 2 access to instruction TLB that caused a page table walk. This event counts on any instruction access which causes L2I_TLB_REFILL to count",
>           "EventCode": "0x35",
>           "EventName": "L2I_TLB_ACCESS",
>           "BriefDescription": "L2I TLB access"

Reviewed-by: James Clark <james.clark@linaro.org>


