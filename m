Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8187BC71134
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXzBZQldP73BbRZZS65Vo9wcTrZxZnhNR3p8LsxSWO0=; b=BXkEdVjLOyQyZk5VSqufLJ+q8P
	QY2FEoRTXv1ux4AggMD91RdQJZiW95qmX1umzAlox0GL3KyWu7DpT3ijP5/uhCMLvMFySsdFx2x0x
	N6bCcJEV1Fv6mmIDO/VeypuRZqmyX5zpIFQAuoRKYkY6o2SarFlbaFIXxCXAe0qOWf8mXB4C8Zi+6
	uyHqAx/nQWxkCMo9d5bHtMHR3M55cjCjgSZnxLPWfQ+igihmPn3wFCCAKU3aoxX2MO+btV6eRquac
	uGTCX9PdSxcqC+7UHvNgxd14NUQaebrhNEbtqUvEo8C6WlK/Ufo5dstDdSuiJh5lPrbwokbO7ANFQ
	MyM0U3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRWt-0000000B1wG-3qHQ;
	Wed, 11 Jun 2025 19:54:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPN83-0000000ALOj-0alQ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 15:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=xXzBZQldP73BbRZZS65Vo9wcTrZxZnhNR3p8LsxSWO0=; b=WHiK0t7Dls6BthEfnsmQWJCkJ3
	85RNgY4yhueS5yhv3hQewJWshdRdWFuDBcj56ihi67WnP6ZP1rhzoZ6AA173UEICcoXrdW7xSl/LB
	0auHwooVZA+m7BsW90ai8LxGib3LUPc85uVIR/7YW7Suunlt19CdAgEG60nmlJWBy86ccv2vQmvFh
	9LQzRs2hczLvXjnylmlV5BH+aJyiWjtoSbaPkRCnfG8OCdsO0wXBrPwLfZ//voltqI7S3Y5UFr9yF
	CJamHdKyu8yah7Hv3DC4i0nlCdu0PGg84GNwRH7LHu6Q0v7u3W3AKWs49Xj8+pHRa1WR3ORSeB97P
	hL4qKeLA==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPN7y-00000002Q3e-3nv3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 15:12:38 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a54700a46eso442f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 08:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749654749; x=1750259549; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xXzBZQldP73BbRZZS65Vo9wcTrZxZnhNR3p8LsxSWO0=;
        b=k/b6Rc29h0w4/2+oFAP5K1wPzymHSzJERlqTZe1KG7ZfRmx086jw/GsvS+nmg0m9cD
         QdBBeNx84m+1Ql13S3h8UJTFCXP77fG7bGV2sk1yV7pOWSXZpG4aZI8mrMdBg7bfwSRk
         akdYQQIx0fNolq59cGUAKG876a7xE9WyakRjwz6pDRA/pqzHcjZbwhq3qvC7i0BGTwr3
         iZE5rh+5IBNCU+6AApJSQ/TT01FNwu+W1usP7ZB4aHaRKYxq4efGwgkGSEVOekg3xVZQ
         YzYAy7/uQH+U+9XEGQON7E27TGjz7CTtUK8DLYpzQloi3YQikpjbDiwpEMEMiS574B5/
         xxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749654749; x=1750259549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xXzBZQldP73BbRZZS65Vo9wcTrZxZnhNR3p8LsxSWO0=;
        b=k6NuASMK3Qu5QfguO1MFKElhHzmx8UmcuurUCZwmIOtjCEeXDiVPQCqTuTNmr8iSeD
         Ofb4dFSpb+C806p5DdwWgiI8npiMHzLuvd4p3/7wH2Ndv00DOphNek+T6n8Bqxt/6tLn
         AqNsdsOmEEUohRhHeuTfF2ROEVL8eDOA/ziB5EQ0KAZSsUgRsFV10AiEtu7lPCPDixyL
         IWdmxBH6E2ECsRKXqSHIZuUbp6IlxrmRMWZA4XjrJP5zOiO6km/FXAaNKdREJitgFvwT
         96h+jI2Ag6G2gseZgtMaqkhIFsj2dIkQXbGuvxiJPTgf0ajixaOZnxVo9isfxM3Q0MRN
         15pg==
X-Forwarded-Encrypted: i=1; AJvYcCXVNRUFDqoAokQNl20iKAB3eSzLeQSdu+Ts8fs2/gKvemSwKggZHAJ12l0yOAGzkoMi0MMHSxm3iMAmw6XNEyjv@lists.infradead.org
X-Gm-Message-State: AOJu0YxcG7Zto8siHU46nokUy19esd9JFoaRyetRMYEpohZComf+t1/R
	bQHVDKq+NPni2PbuV8GOU2WVDyUcxYBVUnX+PD/JPdZcVt1fd3rXVk4mgJZIY29KTjO1+lPsAEf
	kT/l7
X-Gm-Gg: ASbGncvQJpxyoUqSCbAH7pZGVH3nEOvhchGOSucZlIVpbQn3wS/o/TUKmfbp9mgDtJd
	xEZ8fTKBdVGJ2uCIKRiZbwUkiGHDohfc/g16sZyqpUdRjuLpVUJUtfDxlqRoB6tgDE3ZAQvJAbQ
	8MVH1L21UVcwQPicVnElZLHOgyPOAzwOtRwjnLiyEN2p8wVzd/5PUy2I/7yKb8ZPwkc2tr1SEYF
	mE0ih98761YeIuphIkxrYyjVbHGbgWyvAebMvUI3iIfpGZdGfVAAN+rKk7D0PCb8A7Q6f8MCJmm
	rRM5QUNSdnkQyfHPs7xWaSnQEPvnbfeE+x16BR0WC9izE//tHwt81yeha+kgzXkI+LQ=
X-Google-Smtp-Source: AGHT+IGjRZp6QoSgWwB91XKzm+h5aA4BVHOOkZHH3LrJev657ZvvnKDi3bNUVbObVY3dZRrMSs35iw==
X-Received: by 2002:a05:6000:4305:b0:3a5:1266:3e96 with SMTP id ffacd0b85a97d-3a558695737mr3092005f8f.15.1749654749616;
        Wed, 11 Jun 2025 08:12:29 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324520e7sm15619819f8f.84.2025.06.11.08.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 08:12:29 -0700 (PDT)
Message-ID: <bcf75597-0665-49fe-bd85-7613ff508302@linaro.org>
Date: Wed, 11 Jun 2025 16:12:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf: arm_spe: Relax period restriction
To: Leo Yan <leo.yan@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org
References: <20250528132501.129586-1-leo.yan@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250528132501.129586-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_161235_052086_023688E9 
X-CRM114-Status: GOOD (  21.10  )
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



On 28/05/2025 2:25 pm, Leo Yan wrote:
> The minimum interval specified the PMSIDR_EL1.Interval field is a
> hardware recommendation. However, this value is set by hardware designer
> before the production. It may not accurately reflects actual hardware
> limitations, and tools currently have no way to test shorter periods.
> 
> This change relaxes the limitation by allowing any non-zero periods.
> This gives chance for experimenting smaller periods.
> 
> The downside is that small periods may increase the risk of AUX ring
> buffer overruns. When an overrun occurs, the perf core layer will
> trigger an irq work to disable the event and wake up the tool in user
> space to read the trace data. After the tool finishes reading, it will
> re-enable the AUX event.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
> 
> Changes from v1:
> - Shifted bits with FIELD_PREP().
> - Removed warning log which is not quite useful. (James Clark)
> 
>   drivers/perf/arm_spe_pmu.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index 3efed8839a4e..e40e5daa838d 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -308,12 +308,16 @@ static u64 arm_spe_event_to_pmscr(struct perf_event *event)
>   
>   static void arm_spe_event_sanitise_period(struct perf_event *event)
>   {
> -	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
>   	u64 period = event->hw.sample_period;
>   	u64 max_period = PMSIRR_EL1_INTERVAL_MASK;
>   
> -	if (period < spe_pmu->min_period)
> -		period = spe_pmu->min_period;
> +	/*
> +	 * As per the Arm ARM (DDI 0487 L.a), section D24.7.12 PMSIRR_EL1,
> +	 * Sampling Interval Reload Register, the INTERVAL field (bits [31:8])
> +	 * states: "Software must set this to a nonzero value."
> +	 */
> +	if (period < FIELD_PREP(PMSIRR_EL1_INTERVAL_MASK, 1))
> +		period = FIELD_PREP(PMSIRR_EL1_INTERVAL_MASK, 1);
>   	else if (period > max_period)
>   		period = max_period;
>   	else

Reviewed-by: James Clark <james.clark@linaro.org>


