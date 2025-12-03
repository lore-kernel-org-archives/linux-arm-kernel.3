Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F4DD12696
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 09:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bm1DdqPiJrlnyLV0zsSg8+TnOYjiHZIND7D76vp+94M=; b=xl49r3Et7YS0cvI53ZvTg371Xv
	SgN4DRslaH5A4CiarTDYUDEiqb9P4usy7+2So6d7wlMt/Nlq5Yq6Sp1uzNA0eh/GLjI2wbhiAloWa
	2QCptHAdHghMhrYwnDUz3+D5L0+hrRFJhA/sfPaY8G5CiBaPlFUbJVbB6oghn2CamLXpQtXEJ0OVu
	Uq71xNrqNVU4dOdmCt2MnJB88TpJAeKkO/A4GCjjDaEzsnNO1jIDfgC2DihuNWAp3As41LTyJ57d+
	XScAQ+3y7zwzNrZyyXa48RVun0fG0z9Z/LJEv85n4IoZ9IEIdqXEjY+dQPBN+wmyBunFDphhPnlzf
	sRNOW+Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjSM-00000006P6f-2qqq;
	Wed, 03 Dec 2025 09:47:30 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjSK-00000006P6K-2map
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 09:47:30 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42e2e3c3a83so1678218f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 01:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764755247; x=1765360047; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bm1DdqPiJrlnyLV0zsSg8+TnOYjiHZIND7D76vp+94M=;
        b=gU/DVzUlS5ivpnqsPhvHygWcq9Bo3Bno+Ma4VlN9Gmf7Hw5naO1Vnmp7UerPQNnaYL
         Pc9eL1ro8JR4TbD5bxQc5Nhyq5LfWGi6NFyPhEcGW0c/kozJDhvQL71eaf/tk9jbixgB
         3LefcEpGQfxmVOE9LW2Z/tQiLVmtreWZ7yDlTDrTU+fBcOA/dHfDSOz00sDVRmtZgiyS
         kBNTL06KOfShsaAcL77Mr8yYYkJDpTrVP+FXmZyaBSAsWdkxcl7AWltMScOzrxAGpGDf
         Uj2ndlG4zFX4E5JtrMvjzuR2cfIPUtqtvJ3HCQwbk/oYtyM5E/cTuE6kAIN1+6BT2Pib
         74GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764755247; x=1765360047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bm1DdqPiJrlnyLV0zsSg8+TnOYjiHZIND7D76vp+94M=;
        b=WyeKFQcJypgTo6w+WYD+4nAYsZgGHR6I7RrgcZXcT/TWMXzgS3+ZAukye+Fq+i3a3+
         KmjoTC2tz+W20X63QMSW6ykuMYl5X8LYOoPCwTwxHfpxMBgGIUVo3qU+ZTQaeSEOSLwR
         R3v2BQMOiFtWLL1+KPbqCDP3X4+wo6YGImyzGmaClmkHYpD/9BDEkv3z2W7J61MY82XA
         2bhliV+sJHwsrSN73XdAAhZx5YNWfyCTN6JAyP1OIwAIjBXrIzCmDDRd4Hydh6uIbaOU
         vnZv3fHWf1UV+GHcaFeLuYrPa7S4X0tu8CAPDxXvOuG/YKSJtT6FrsBUTwIMHOfpi5hn
         Cm+w==
X-Gm-Message-State: AOJu0Yx2yIXAX16/3Pi+QuCmYSUWTHyxO48W9bivPFkrsS6DMva3Yad2
	Ao8QoQN8ceqI1wQi1BFdTZmD2jico5joy581WNyC//IaLTw9EXr0uWa7t7b4cVelXjc=
X-Gm-Gg: ASbGncvNKjCAK1zmAratrbZKO3NYdNmXVgR4QTMo7cw40oYqJcVX6RlsP0B9bGWHUs5
	iuLp88W0RTvztq8FmTDpBDpvZrvH4+WzXwCRTo20je9+9dQKoVaV40T20nNvyY+3XqBR+i6ib4A
	QYVWudnkbF4XavscROJDVVOA4m3OnztiCm2ldHjcRxVPlLWXlXBlkK5GgoxBdoe137/AumSkvNC
	VMdvlKkKhJPHzG9kQKuKt6Zb7zZ+E6BQjY8iKg/DAHVFMygeVgbSwxn1s4HgXquVCF61wShJGf/
	iX2cGsc5SK4lNxSikGPeNPsCIfHVSIYfff9tst+3KvncDOshAevA52MAShTGwjmB6IW5MHUUU0l
	6P8NMDTPBFxhvSKDENGBhUyHDGiwMVU6MqNAGnrcSwKQmomwF2IJ8G+FgC6IxXZ0t4IGOTftXbY
	bIJjqK0vQXXM+RxwD2AanQ3rge8qE=
X-Google-Smtp-Source: AGHT+IGHokwwRMwkFOyEIwQX0M1wcom6I+DlCZbrKL4a2u7FKQZEA11QkaoBCyKwxvl+m15cLdpoGA==
X-Received: by 2002:a05:6000:2dc4:b0:42b:4177:7131 with SMTP id ffacd0b85a97d-42f731bc552mr1398489f8f.44.1764755246537;
        Wed, 03 Dec 2025 01:47:26 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca9aea3sm37587680f8f.35.2025.12.03.01.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 01:47:26 -0800 (PST)
Message-ID: <7473f9ad-18dc-43c2-9754-1dbcf2db8a98@linaro.org>
Date: Wed, 3 Dec 2025 09:47:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf arm_spe: Add CPU variants supporting common data
 source packet
To: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org
References: <20251113-perf_arm_spe_update_midr_list-v2-1-d547768f5520@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251113-perf_arm_spe_update_midr_list-v2-1-d547768f5520@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_014728_757659_CDBFFAEF 
X-CRM114-Status: GOOD (  15.86  )
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



On 13/11/2025 10:57 am, Leo Yan wrote:
> Add the following CPU variants to the list for data source decoding:
> 
>    - Cortex-A715 [1]
>    - Cortex-A78C [2]
>    - Cortex-X1 [3]
>    - Cortex-X4 [4]
>    - Neoverse V3 [5]
> 
> [1] https://developer.arm.com/documentation/101590/0103/Statistical-Profiling-Extension-Support/Statistical-Profiling-Extension-data-source-packet
> [2] https://developer.arm.com/documentation/102226/0002/Debug-descriptions/Statistical-Profiling-Extension/implementation-defined-features-of-SPE
> [3] https://developer.arm.com/documentation/101433/0102/Debug-descriptions/Statistical-Profiling-Extension/implementation-defined-features-of-SPE
> [4] https://developer.arm.com/documentation/102484/0003/Statistical-Profiling-Extension-support/Statistical-Profiling-Extension-data-source-packet
> [5] https://developer.arm.com/documentation/107734/0002/Statistical-Profiling-Extension-support/Statistical-Profiling-Extension-data-source-packet
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
> Changes in v2:
> - Rebased on latest perf-tools-next branch.
> - Link to v1: https://lore.kernel.org/r/20251017-perf_arm_spe_update_midr_list-v1-1-9de407550354@arm.com
> ---
>   tools/perf/util/arm-spe.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 614ce032f87e46d1f3754258f51bb1693ec128b7..f5bcc84eaa271f4dcc70bb585e517657e523de11 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -570,16 +570,21 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
>   }
>   
>   static const struct midr_range common_ds_encoding_cpus[] = {
> +	MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
>   	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
>   	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
>   	MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
> +	MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
> +	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
>   	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1C),
>   	MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),
> +	MIDR_ALL_VERSIONS(MIDR_CORTEX_X4),
>   	MIDR_ALL_VERSIONS(MIDR_CORTEX_X925),
>   	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
>   	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
>   	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
>   	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
> +	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3),
>   	{},
>   };
>   
> 
> ---
> base-commit: da8fcfba0854dbe0b0eca465d35620c9cf4c89c1
> change-id: 20251017-perf_arm_spe_update_midr_list-b654cc2ac0dd
> 
> Best regards,

Reviewed-by: James Clark <james.clark@linaro.org>


