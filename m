Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A09C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 01:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1PecfJ/ulEmOVAcJ2BrU2idsARRJ75dqEtuR45WJos=; b=Y4I9LMWtK/uA+VJFiIsXm7zTBl
	JgbMNUCJtgxZWhyhMRxc8/2LlcdQwx1JkoQcK2nj8DMDAx75/Lyu9DeO4mp00QiqMamPMSR3+a07h
	sbpzkEqZWAHeBFC6WDaGPFY7GgSjTQ4leXkgT8e0dIqJQLOrWRo2+vSaxU6/I1LzUsFd01I4LU3Zj
	caUzZdRlMID63jEzPTBxiuXukcUiZOkDH1ktLtxj9eUQ0yj1hxd/wfz8Mj+hNZO3jdF4geSzdER4D
	exeTB7GzknXSKkhItZZpZvPZvYERSdahQIL/F289rQ66+TsXcyQZeoIuqiDhyliFPVQJYFMUH+oVO
	ZvckHLUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti1xl-00000005tGc-0KhS;
	Wed, 12 Feb 2025 01:54:53 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti1pr-00000005ruZ-3xgh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 01:46:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21f5a224544so55625845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 17:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739324803; x=1739929603; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a1PecfJ/ulEmOVAcJ2BrU2idsARRJ75dqEtuR45WJos=;
        b=J7lKHNU58S2H0qtGLxWoQcWnZABwHo9GU3UcfodVNvgxmYa53g2Q9sP4ZNW0baoTwc
         0seIDKZulyMSoZgxlLXNsJb8avVVgbEWATAX0TLhQftc0+muecglcUhP05r2+FUwqFxl
         nC/9QpbkmbQk1+G/1PPcbhh7S+ALKoikPaHkIaqUYShcVd1BdB/Q/drx/dUfUgELhyvu
         RgmFSn5tKjh/F7oltESHpaKfhxHnIz45OScO0AifngzFUZySVQSnhRBVous9+7+XRhyn
         PLHCeCtMbE+lnHZZSFsSOdpFEYsvh6EjXk5cjUXHe8zQPI24yTx2aY3rcsoxye/0xf9C
         /RLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739324803; x=1739929603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a1PecfJ/ulEmOVAcJ2BrU2idsARRJ75dqEtuR45WJos=;
        b=FNGM6Rpr+mOTYWAuWy9D82vp+jp+pXAy88fNpDook+m+fbMj4stRdJuPSqQ32+/279
         YIpuxyrCQXprfUcqIUsSo2mq6D5ZD504qKViQceliRExUv2s3syw/vxFB0KH61KP1zSU
         ETdAVJ4Umw5nq2/p29nai3oD6Qv/HtG77Ou6ujE62iKZVG5mIN2IenVcsMuEIuTNEfHf
         WbD0kExpBukCpsa/w/BGFP7veBSdihg2hhcVJ/+IPssHxNmWTRhUfiSHsKWvNU18lpM9
         Zwzvk+cC8qGRlQnvExlcpt52aHdEJ5eFOFr/GNfK06YFQK8dzNusbZdD3njcN0QSXJCP
         h9TA==
X-Forwarded-Encrypted: i=1; AJvYcCVRmCG4FYpXTX2H9biBq+tZaiNmfRsaA2aGzat0hiUaEzbXiVxdNLf8zBcjm+Mpt+zef2/AVsZ1GYWsPh+MCvyD@lists.infradead.org
X-Gm-Message-State: AOJu0YyYNOZTnpn/kelJvwEC+tSShEz1goj6VoOM9cO2hPY1qZrbZVed
	KsnRcNdR2EbxCAemjXGnlsd6EWwEHXSv5RXCRC5SUTq2udleiW2Y
X-Gm-Gg: ASbGncuxamz22fqi17MIsxigkbuitESyDRfewAY1/GXhQz0a9WoUfOwmphwJisLk+DW
	xI8BAegD8/ub5aKXV362yQJxIf0vPA9QpT4ZKS1DU+WNDNAiBmh7CXxjtXPfuxvfPBZ9mZSKHIk
	ZcqPfZOCiZxEW0miXCJzvsPmQP+kChLhvqjdUiKeLPxC9k/Qhj42NGkUDg5Wlty0P9IuMCIFWqI
	Ddtcba8nyMPdK5fJoAUnxY7IFROlVjq5+Z1us2OT7M1MWvJ+Manh+8eH6u2AqbHgcIl0hrsoWzN
	6tYRHIbRszkjt9VZlW357xoSd3svS/208BxySwGxX6HZ1mdOpeg=
X-Google-Smtp-Source: AGHT+IHynglCW7bmaS/rFXo/7iC4aLmIduuaHZeoNU0TbMyLvmCKS9G7NEptuYzgov+wProVrfEplQ==
X-Received: by 2002:a17:903:234e:b0:216:282d:c69b with SMTP id d9443c01a7336-220bbca3a8dmr19893075ad.50.1739324802807;
        Tue, 11 Feb 2025 17:46:42 -0800 (PST)
Received: from [10.89.236.32] (wf126-032.ust.hk. [175.159.126.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687bde1sm102872645ad.195.2025.02.11.17.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 17:46:42 -0800 (PST)
Message-ID: <23db2d80-cfc4-4c15-a4fe-11e677185344@gmail.com>
Date: Wed, 12 Feb 2025 09:46:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drivers/perf: apple_m1: Support per-implementation
 event tables
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
 <20250212-apple-cpmu-v1-2-f8c7f2ac1743@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250212-apple-cpmu-v1-2-f8c7f2ac1743@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_174643_984097_1AFBA01A 
X-CRM114-Status: GOOD (  14.05  )
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


Nick Chan 於 2025/2/12 凌晨12:07 寫道:
> Use per-implementation event tables to allow supporting implementations
> with a different list of events and event affinities.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  drivers/perf/apple_m1_cpu_pmu.c | 65 +++++++++++++++++++++++++----------------
>  1 file changed, 40 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
> index 06fd317529fcbab0f1485228efe8470be565407c..1bf7ce5c09846c699d66bdfcca129f418a9dad9e 100644
> --- a/drivers/perf/apple_m1_cpu_pmu.c
> +++ b/drivers/perf/apple_m1_cpu_pmu.c
[...]
>  static void m1_pmu_reset(void *info)
> @@ -572,25 +588,16 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
>  	return 0;
>  }
>  
> -static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
> +static int apple_pmu_init_common(struct arm_pmu *cpu_pmu, u32 flags)
>  {
>  	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
>  	cpu_pmu->enable		  = m1_pmu_enable_event;
>  	cpu_pmu->disable	  = m1_pmu_disable_event;
>  	cpu_pmu->read_counter	  = m1_pmu_read_counter;
>  	cpu_pmu->write_counter	  = m1_pmu_write_counter;
> -	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
>  	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
>  	cpu_pmu->start		  = m1_pmu_start;
>  	cpu_pmu->stop		  = m1_pmu_stop;
> -
> -	if (flags & ARMPMU_EVT_47BIT)
> -		cpu_pmu->map_event = m1_pmu_map_event;
> -	else if (flags & ARMPMU_EVT_63BIT)
> -		cpu_pmu->map_event = m2_pmu_map_event;
> -	else
> -		return WARN_ON(-EINVAL);
> -
>  	cpu_pmu->reset		  = m1_pmu_reset;
>  	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;

[...]

The flags parameter is no longer used, so I will send a v2 with the parameter dropped.

Nick Chan


