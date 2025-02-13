Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8461C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 16:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgDN29uKkb88V0um0RfTC0vvM9HPPQBtETeV1yITKoQ=; b=n1Ccteit2sWGLGvBH7c+2V6O/t
	rQGU2P9ylPItzn1YgvwhCHfNihj2gOFzxBwxzyFX1UysLtB49c3bZgustZ1d3tKNdLkca9NhtFM7W
	LPZBmDxEOmB77VfI7uo2x4OoHn1PonxQCQJJy1O+IjOgr4L1aDv9rxv9u6Jk/rxnkeJbwqumWMaUU
	DOi1ld8StzWG+9w7FlVK12uSsJDPEh7X9kZ1q9QIe1HYQB6o5htOjBXm/aJMjQZA7pOQ56GEFdrYD
	+EJGeT4hn8BlRu4dcBBh/u0XfxyOdM57yR6NBM9q4PCqHPV3QzasqkaUx1Oa8fdwjLmoQLrCCi1zd
	5wiJcSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibkQ-0000000BgYu-03dJ;
	Thu, 13 Feb 2025 16:07:30 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tibdO-0000000BeqA-1tvb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 16:00:15 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43961c966a8so6297065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 08:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739462410; x=1740067210; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgDN29uKkb88V0um0RfTC0vvM9HPPQBtETeV1yITKoQ=;
        b=byDxwM7ThXeusF7ptZByepyEYuJmFE83E42U/I0SYvy87Yht/6KjixKjy3MVxwZa6q
         lUOR/ucyaTRVpCLVmijuXvcVkB0bvX1jhIuSO/fPybZoCJ9mNQdwuxbt08q4UsEgTmzj
         qG9ekd/ilQaXoqMAqjF3AJv4MwngbjD/IQF8cK+ZMvQZPZ8VoO+95Rj6XWRSQ9diKHQl
         qreIXpZRrsNCcLeuhv52ZUn4m96/yrTwI6g5uzb6IStb0uUwB3rA9TNyGPeZXoGlGjAN
         6JkRGOUj8tK2RIUFcn9tIUttDPKOgnsIf4n3+/AXNzoZQ+Mub6I8pYCrlrl5+Gdw71qp
         nUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739462410; x=1740067210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pgDN29uKkb88V0um0RfTC0vvM9HPPQBtETeV1yITKoQ=;
        b=Flpkn8C3RAksnBFlIJJ4qCmTeSfaRPX+bup3WwyZqXNLFGRF/CXb1jbe5rtPA/MVpK
         bUl3S4MbX2rrfiuP3X3NBbdsqLcnc/PrDssEbIog0MdHumlyyuLrMdVJ/DRzn5NrJ7Mi
         /H25v1DKAYVrWG31KR4r01esgSdTBxLI7WZokN8B7xq8rLMesecYSRilS4nS3sevpq7R
         rhRcN6EHzkyJ0wdhIOUAbBHZnbJpfcvL2lfJ4/s/WKSrQLRgQY6z0mEVLe12JSTvKZ61
         SnJKgd9twthCl4N/3Dw5Z07TaHwVPCtWVAtUuTmjGtI3p4fGfUrQuOE+BK+MCQv5ST27
         b/Xw==
X-Forwarded-Encrypted: i=1; AJvYcCX/GhWnoYVXbb6+2u8obgvqtFXRqQgI4S41pKUH/MApmxa01tvyQrGN8MYW/w627nhLt9CuhMxmfXpt36rV835G@lists.infradead.org
X-Gm-Message-State: AOJu0YzaM7OoQpzzjjW0/VXr8E5kxcmVzltOOKODVg1Fkcvl6KBs1zu+
	kwdbSk1pJUnbusW1sczqLkC19W5ZPYSCqB1vhZij0Xo37aw+cSs15f8wdyan37k=
X-Gm-Gg: ASbGncu/GTsm/+u67UbB1z6mzX+xOgP8Wc5SGO7Rhj+qYNkXt4Gv27Y3A3JuitNKFKm
	Hsvi7P4J08hIl0w9VEQ++9HACOVXSceQdI+gxpl3oiWHS4i2VliiKSKyWY/WRwp751px6UjP3pH
	0JqUuSV89pqiwCqWMm7JsEiU1xXvDgOxMVdjOG9PoKuyUHlFrW+etdDYZg+OTdf5WwaUGYcrNvN
	8oWQUoO5XEqZQiOjDWQNXNYZdIbpfNQEfcC/YOIlfNvm0QYJ/9lnjiD29E8IdRYv/TUPLiLE0dK
	Q4mryqDvyqp4+/hJwKKV3KGziA==
X-Google-Smtp-Source: AGHT+IF/wXtprc1U4VPmJ1pAueprsYzKR20H2MkrRTKmejrcGzsEoDZgejq84H03liicKIeACJ4WAA==
X-Received: by 2002:a05:6000:2ce:b0:38f:287a:43e2 with SMTP id ffacd0b85a97d-38f287a45b1mr2767766f8f.11.1739462408125;
        Thu, 13 Feb 2025 08:00:08 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258dd5acsm2283106f8f.35.2025.02.13.08.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 08:00:07 -0800 (PST)
Message-ID: <a633f52c-81e8-4c0d-aca7-cc18360866eb@linaro.org>
Date: Thu, 13 Feb 2025 16:00:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/7] Coresight: Introduce a new struct coresight_path
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
 <20250207064213.2314482-5-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250207064213.2314482-5-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_080014_500487_0E9499F0 
X-CRM114-Status: GOOD (  19.38  )
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



On 07/02/2025 6:42 am, Jie Gan wrote:
> Add 'struct coresight_path' to store the data that is needed by
> coresight_enable_path/coresight_disable_path. The structure will be
> transmitted to any required devices to enable related funcationalities.
> 
> The trace_id will be allocated after the path is built. Consequently,
> The ETM3x and ETM4x devices will directly read the trace_id from path
> which result in etm_read_alloc_trace_id and etm4_read_alloc_trace_id
> being deleted.
> 
> Co-developed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c  | 106 +++++++++++++-----
>   drivers/hwtracing/coresight/coresight-dummy.c |   5 +-
>   .../hwtracing/coresight/coresight-etm-perf.c  |  30 +++--
>   .../hwtracing/coresight/coresight-etm-perf.h  |   2 +-
>   drivers/hwtracing/coresight/coresight-etm.h   |   1 -
>   .../coresight/coresight-etm3x-core.c          |  54 ++-------
>   .../coresight/coresight-etm4x-core.c          |  54 ++-------
>   drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
>   drivers/hwtracing/coresight/coresight-priv.h  |  12 +-
>   drivers/hwtracing/coresight/coresight-stm.c   |   3 +-
>   drivers/hwtracing/coresight/coresight-sysfs.c |  17 ++-
>   drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
>   include/linux/coresight.h                     |  12 +-
>   13 files changed, 143 insertions(+), 157 deletions(-)
> 
[...]
> @@ -352,7 +352,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   	 * CPUs, we can handle it and fail the session.
>   	 */
>   	for_each_cpu(cpu, mask) {
> -		struct list_head *path;
> +		struct coresight_path *path;
>   		struct coresight_device *csdev;
>   
>   		csdev = per_cpu(csdev_src, cpu);
> @@ -405,15 +405,15 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   			cpumask_clear_cpu(cpu, mask);
>   			continue;
>   		}
> -
>   		/* ensure we can allocate a trace ID for this CPU */
> -		trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
> -		if (!IS_VALID_CS_TRACE_ID(trace_id)) {
> +		trace_id = coresight_path_assign_trace_id(path, CS_MODE_PERF);
> +
> +		/* Can be 0 and valid, ETE doesn't need an ID */
> +		if (trace_id < 0) {

Not sure why I wrote it like this, but I think we should leave it as it 
was with !IS_VALID_CS_TRACE_ID(). Even with ETE it calls the trace ID 
allocator, so nothing has changed here.


