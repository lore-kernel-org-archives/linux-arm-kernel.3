Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0407CC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIOHqP2ZRvjLcVYspsnH+ZoAOue8xmiI6uTXUwuJb8U=; b=DnJwyhodCDYaqyQmtV736FV9w+
	JtWXcpOFV6gXuGmVu7SJpYgK6spOE3Q3sW9Fh6i6XpyggSKRgOiXMHeE0Jcoy/FOoDnXSjjdUva5k
	l47sChMgDSzf7XcREf+YtlCRFjUcb3treOKiUxfvDUXFqri8dIReXNFSB2mVEqU7OCLMW6jQ/Aofg
	PTP06n7urPplYf3uo2mhdbcBFWSyAsVz5/gCPWea23rGACNsFBvKJyi9Lkg9MJvG9xNj+hsgmz8dJ
	aLAIf5updfEiKLPcR3B7NkU+4dtLCr8snK0oZIPbgL20caeoLxEBN8ScR4WKbhMUHVVVr49F+SLDZ
	wt7WwRNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIfD-0000000Dfds-2G3A;
	Thu, 19 Jun 2025 17:02:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSG8F-0000000DGyH-3Sqx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 14:20:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-450cfb79177so4683845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 07:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750342846; x=1750947646; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GIOHqP2ZRvjLcVYspsnH+ZoAOue8xmiI6uTXUwuJb8U=;
        b=TaEpCgJ/QdM7ZDVmbsmMdAixCfkSrlBfR0rD9W40GzbDMVH7gHteupmsniMjkRqKNV
         xsCwq37TEwb9Fy5ux4yezP0M/Iowv46ydwxsk469SP2W6Rx/0ThJJ7J+3HkdOxQ6I/xu
         RBwTfF8hDzvmQswhW0mh2LVMe81NkMKw56Z0qo09KxdzGxVMg3wnuKGBVR13ZJbqC/tj
         WgjpAfvQ6hlhaoke5YHCCVoojpzYuSoP/HnMYIoGAYEMeEUQt0yxL76F+VyhdI90vgBy
         EbUNlcyLyrelD6i7qL/sLc9UhRK0BcUDcIdORFbtC0+rB2GbnlnmFhcv1OczGeinlfJ1
         v78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750342846; x=1750947646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GIOHqP2ZRvjLcVYspsnH+ZoAOue8xmiI6uTXUwuJb8U=;
        b=C/02VR30w88M8mKxQScqsNZ7qlnT9SIkO3wnxzuBIsXsIrk4wOlzs9S0OIk7MB8QBa
         r3GChF1l0n8fMe8r5YIpjhk7O+2sWaTENbUp8EDzWnOIFHB8OksAcYuoe2b+/6j28ENF
         umDOu45kxyPqiEeDkRM363rDf137JImUSXpdSkuE2xFiHWaM8tS6jykRpITBIuQXJiNm
         IHjuc/MHwq/FaOwg9Ce5iBmCrQADK3CdDqr66d07vP/ekS7P+8JF1dxqe5HRsyY3iIac
         +Xx+xLek7zA+D1KdlaDfIatFB2SKvZZtQ00H7olksTZwcTw0DmTzmH5W+j7pU7hJ+xaM
         fgsA==
X-Forwarded-Encrypted: i=1; AJvYcCWfyrZU3xyYaAnvHVVA8g8kAIxS/Z1dnwT8IfgoB2rGW98DOy3DC0zmO9OO3gd5aiPy26hB91+ayT6mqf3i2Txi@lists.infradead.org
X-Gm-Message-State: AOJu0YzPmCIK/0l9oOiGxVolnnkYh/GAV4rZz2m7GMTJtT9QGFK48rFi
	0sk61FW9NhL/jlSqqTYnYssSctkz3OAfpcCgQW8r6mjtQqbvtg6tUe4ou2rcyX0UoiAMRPnSRsq
	xKRQ6
X-Gm-Gg: ASbGncvW16vJN/SfxmpBSKDdZvAhcPDiemQ9UHvc9fOckEva8h9b/ksO3FBb2ofkwOw
	hWkjCkQNv6jS4/ky/05FbCJS8zgQhhHbNvor7vq2vtcaD1QS3QYZf1ecD38ICi8EB6r+3jRyod3
	PbRIqpdeUIT5JVFGqez301cu1p6jK9Cj/kZz06LdDNq0r7LNUZlMbxxxRuSCrwp3vlQsr8j4vJB
	Cj1lfh1KGkDhz5XQXIUR4CIpkb+krt0k7yXFomFKNwi2YhjNVCekgiqOT13KWgzsV64hRDZ/s9s
	uNsGRC3T7s3a7z1K+U3bn9aDNGT6b/D5OWbDQo9j+05XvwKMjSsgN5inOV7yqsNZ1Nw=
X-Google-Smtp-Source: AGHT+IGAv+oF835l8qV/3D6DQ9ObyyYlwvd1+fOMYkZiRNiAkB3TDVZOr2FtaC3pO/7/Ok11YttSBA==
X-Received: by 2002:a05:600c:4f53:b0:453:5d8d:d1b8 with SMTP id 5b1f17b1804b1-4535d8ddc69mr52656125e9.30.1750342846067;
        Thu, 19 Jun 2025 07:20:46 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e99eae2sm30317065e9.31.2025.06.19.07.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 07:20:45 -0700 (PDT)
Message-ID: <6f6bf9c5-375f-404a-8bf6-63b262c72158@linaro.org>
Date: Thu, 19 Jun 2025 15:20:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] perf arm_spe: Decode event types for new features
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
 <20250613-arm_spe_support_hitm_overhead_v1_public-v1-5-6faecf0a8775@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-5-6faecf0a8775@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_072047_870300_42A77E59 
X-CRM114-Status: GOOD (  17.61  )
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
> Decode new event types introduced by FEAT_SPEv1p4, FEAT_SPE_SME and
> FEAT_SPE_SME.
> 
> The printed event names don't strictly follow the naming in the Arm ARM.
> For example, the "Cache data modified" event is shown as "HITM", and the
> "Data snooped" event is printed as "SNOOPED". Shorter names are easier
> to read and review while preserving core meanings.
> 

Reviewed-by: James Clark <james.clark@linaro.org>

> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c | 14 ++++++++++++++
>   tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h |  7 +++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> index 13cadb2f1ceac7a90e359c4d6aa1d5fc5169e142..80561630253dd5c46f7e99b24fc13b99f346459f 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> @@ -314,6 +314,20 @@ static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
>   		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SVE-PARTIAL-PRED");
>   	if (payload & BIT(EV_EMPTY_PREDICATE))
>   		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SVE-EMPTY-PRED");
> +	if (payload & BIT(EV_L2D_ACCESS))
> +		arm_spe_pkt_out_string(&err, &buf, &buf_len, " L2D-ACCESS");
> +	if (payload & BIT(EV_L2D_MISS))
> +		arm_spe_pkt_out_string(&err, &buf, &buf_len, " L2D-MISS");
> +	if (payload & BIT(EV_CACHE_DATA_MODIFIED))
> +		arm_spe_pkt_out_string(&err, &buf, &buf_len, " HITM");
> +	if (payload & BIT(EV_RECENTLY_FETCHED))
> +		arm_spe_pkt_out_string(&err, &buf, &buf_len, " LFB");
> +	if (payload & BIT(EV_DATA_SNOOPED))
> +		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SNOOPED");
> +	if (payload & BIT(EV_STREAMING_SVE_MODE))
> +		arm_spe_pkt_out_string(&err, &buf, &buf_len, " STREAMING-SVE");
> +	if (payload & BIT(EV_SMCU))
> +		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SMCU");
>   
>   	return err;
>   }
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
> index 2cdf9f6da2681244291445d54c5b13fe8a2e9d9a..d00c2481712dcc457eab2f5e9848ffc3150e6236 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
> @@ -108,6 +108,13 @@ enum arm_spe_events {
>   	EV_TRANSACTIONAL	= 16,
>   	EV_PARTIAL_PREDICATE	= 17,
>   	EV_EMPTY_PREDICATE	= 18,
> +	EV_L2D_ACCESS		= 19,
> +	EV_L2D_MISS		= 20,
> +	EV_CACHE_DATA_MODIFIED	= 21,
> +	EV_RECENTLY_FETCHED	= 22,
> +	EV_DATA_SNOOPED		= 23,
> +	EV_STREAMING_SVE_MODE	= 24,
> +	EV_SMCU			= 25,
>   };
>   
>   /* Operation packet header */
> 


