Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5713AC44521
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcPxSVKmnyDYbDNSJzzUfsfbxgQsODI8nQ8p4qJtspk=; b=FRSEjGQeQh+mjbCuHD+3KMOFaS
	52RFGbs8z8EClZqVAA1njzZMVACwegQTIJYL6/fa5vVL1sW5Alph2gA48IxGSreS4elsk+9W/ccoQ
	2qA3+FAg2ZvvwKy1iMYsalR/bNIlve6f6mwTyZ8Ld9yfIgwfbuwVBwNVp6eMkXppRtQzNn9SBFZ0I
	JfMUYHAK+3Bv9iuEnPvRmonPjhzfRtZleI4a1Dtkg9opnr8AkaucuS98SDiCrvPEEJKelMrbWTtU6
	pXO2vKun4HjeLT2f5C8P7gnn2Zs5Wsh+duxiDNILCLUf+WguoIZE7qx6TvUszcUsCYsBZppiQ9GYI
	KZAo5wFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliOc-0000000658b-3QMJ;
	Mon, 20 Jul 2026 07:26:38 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKc-000000063K1-0JO7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:34 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso9795685a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532149; x=1785136949; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dcPxSVKmnyDYbDNSJzzUfsfbxgQsODI8nQ8p4qJtspk=;
        b=fpGrkmd8RwYWtA/V3DrfUAt6XRF2P7h1CuO/UMSPRCMFXHrWfSvGTb5SAfEDxIYSM2
         nRMAGXVss5lr4n7DkZ52fqBDcjTsBi0cSe+E2ib0L5f7PZ9FEl9s/HQzGyjxFIuctbMx
         nfKAnHulRRFNaIYCViRvZdu8nCA81PWkvR3A5KJghJH67lo6dWYHzXYBuHOoh22riYJ7
         10LQqwYmuQgnU4cIeD3tfNf42ilKh7lhK0XFM5kdh584jFawIES9w8ds1YWlB5g4BmDD
         4qd5FK2Qn4vBb60oHhFjqbqd1gXdb6I4i2TBHOLYPOCcNlBodqauOXUrmtosgUe/HJB3
         xHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532149; x=1785136949;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcPxSVKmnyDYbDNSJzzUfsfbxgQsODI8nQ8p4qJtspk=;
        b=M9+p0IcjoNlIcRMkA5PkJI18fv8GU2x38+prcvOG/G8EW/vCwAg7K2N38bs7Ze50Wq
         vThqW9usZHq0ZZy5+lxowd87jyFmJ79E85Ts6lH+l7B6ClsJaHr0w+uMT7x1Wz3twgvv
         pJiPChn+qRwkdJDhI72SV+OD4fw8x0VonfFGLa2kK4WQBk9KqEFye+y9rb+3sxOkktv5
         oMZwDHKzSmCRTYksCQuXz9vLQ3pEasZYeLhdZLyBKrZJkVcuUF7TP6SkOXCaL8aHYMOo
         HpqDlylgV9GZiQLF0M3faupXOiEipGyQziTtcQLrq6I2cdx09fg7I6TSkpV8tXkL/sf3
         JPBA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3ieBKj55uNdjjjKL4SpiypefsdBgExY3bvnIajKqanvy2J7mXTmPML3gM8kWc4Wm+BErWrLCDwJ1y/HyLBvjK@lists.infradead.org
X-Gm-Message-State: AOJu0YwQqvWMDNjZRtluDKjFPVppSzUQ5UX8xJLaP6b0brkBVBPtmGM+
	QhR2gJMcvFINTulFinpppqzZZpGmOD93gTIAqePOM36mHwYB6qdJm7Bs
X-Gm-Gg: AfdE7cljWBxGv6TiARtuUgh/H6yC7EniZvjb54ZOclmRCA159JSExiAb+gokr1IJtwL
	ekIyg98WsQ7QcWV59HJK5Uvu+cjsBWYvTkQAOHsJbkQr+/4WJ52esuiN3vxsda97gzAXud+R+fN
	RKtD8HFDxzIaOGZMHMml/w24ePtzXTSYtNiVK3EC9/VWoDS57fsoRdxHVq0Bd8w5mZhqdoEq3g7
	UIPTHDH47b32Dt5WVxz8gp+8o8WQwVOE+Amj3nu6dQiWXMQRr2fs6sGtQqAEjR/7MThdx4JaLmp
	UaNCjcXo1UjeVcJvNoINz57UKMJP0o/xGVU+h+QcMGA+d8fEvw5XKhosPFIWJ5mszMufHyAANVZ
	DkpSkG/u8KM9Mrx9xIkgApKPCIppG8S5c50YQtLg1WVkqpR+8Ef5L39kdtFvhlCNF85bjhAGgNu
	coBkBBCcklPJ4GBtjakP6o50va8k17
X-Received: by 2002:a17:90b:574c:b0:387:e0cb:7ee with SMTP id 98e67ed59e1d1-38e4b585dd2mr13626298a91.34.1784532149122;
        Mon, 20 Jul 2026 00:22:29 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:28 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 17/22] RISC-V: perf: Add legacy event encodings via
 sysfs
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
In-Reply-To: <20260701-counter_delegation-v8-17-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-17-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211940.543975.8329989834248386453.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=3146;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=dYF7nkp05JxYIKgQ4jHUTlERnRx5T3N6NMRVo9VDNt4=;
 b=yNzrmMlFIV+5r1fH4TqRRoOIIToHMnHyIVcRLkrmaO7IQjikh+PA4TCmBvZRnz3a2vdy7TVyZ
 PAlFudkjROVCE4aB2ntR0CghpkPkmifUKhLjLdNzlxWYp2bBVNxPaFq
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002230_147580_C246A3BE 
X-CRM114-Status: GOOD (  19.81  )
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

# Add your code comments below. There is no need to trim or delete
# any existing content -- just insert your comments under the relevant
# lines of code. Lines starting with "> " are quoted diff context and
# lines starting with "| " are comments from other reviewers.
# The final email will be reformatted automatically to include only
# the sections that have your comments.
#
> Define sysfs details for the legacy events so that any tool can
> parse these to understand the minimum set of legacy events
> supported by the platform. The sysfs entry will describe both event
> encoding and corresponding counter map so that an perf event can be
> programmed accordingly.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 19d9e4750424..8d56bef95a1b 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -131,7 +131,20 @@ static struct attribute_group riscv_cdeleg_pmu_format_group = {
>  	.attrs = riscv_cdeleg_pmu_formats_attr,
>  };
>  
> +#define RVPMU_EVENT_ATTR_RESOLVE(m) #m
> +#define RVPMU_EVENT_CMASK_ATTR(_name, _var, config, mask) \
> +	PMU_EVENT_ATTR_STRING(_name, rvpmu_event_attr_##_var, \
> +			      "event=" RVPMU_EVENT_ATTR_RESOLVE(config) \
> +			      ",counterid_mask=" RVPMU_EVENT_ATTR_RESOLVE(mask))
> +
> +#define RVPMU_EVENT_ATTR_PTR(name) (&rvpmu_event_attr_##name.attr.attr)
> +
> +static struct attribute_group riscv_cdeleg_pmu_event_group __ro_after_init = {
> +	.name = "events",
> +};
> +
>  static const struct attribute_group *riscv_cdeleg_pmu_attr_groups[] = {
> +	&riscv_cdeleg_pmu_event_group,
>  	&riscv_cdeleg_pmu_format_group,
>  	NULL,
>  };
> @@ -447,11 +460,14 @@ struct riscv_vendor_pmu_events {
>  	const struct riscv_pmu_event *hw_event_map;
>  	const struct riscv_pmu_event (*cache_event_map)[PERF_COUNT_HW_CACHE_OP_MAX]
>  						       [PERF_COUNT_HW_CACHE_RESULT_MAX];
> +	struct attribute **attrs_events;
>  };
>  
> -#define RISCV_VENDOR_PMU_EVENTS(_vendorid, _archid, _implid, _hw_event_map, _cache_event_map) \
> +#define RISCV_VENDOR_PMU_EVENTS(_vendorid, _archid, _implid, _hw_event_map, \
> +				_cache_event_map, _attrs) \
>  	{ .vendorid = _vendorid, .archid = _archid, .implid = _implid, \
> -	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map },
> +	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map, \
> +	  .attrs_events = _attrs },
>  
>  static struct riscv_vendor_pmu_events pmu_vendor_events_table[] = {
>  };
> @@ -473,6 +489,8 @@ static void __init rvpmu_vendor_register_events(void)
>  		    pmu_vendor_events_table[i].archid == arch_id) {
>  			current_pmu_hw_event_map = pmu_vendor_events_table[i].hw_event_map;
>  			current_pmu_cache_event_map = pmu_vendor_events_table[i].cache_event_map;
> +			riscv_cdeleg_pmu_event_group.attrs =
> +							pmu_vendor_events_table[i].attrs_events;
>  			break;
>  		}
>  	}

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


