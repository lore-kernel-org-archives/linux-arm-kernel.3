Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9105CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 06:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O89IWiz4+jst6WssmkXWLaT7xtJNIW5Q681+XiS4VbI=; b=iaPRvkLj0qxQGpERsJ6nMnmCot
	evxLtTwfQGcnR7LhYDC6hKumsfM8ro0FvceUzhPSKp39KhsTn7js/H2+Ut3Uv3CclQ59BcqgBK9UU
	PA4AhoPOVvj5dO1N6rJB9paeZ/tyQai+ViL7ucFKBdFdjJJyJ0Jy5K+8omShBJCslpjfiHz6d+qhv
	vFciGYTDHRdiPZMnQeLbGEmQicET0CwNJBIZ3DsE8sBQp5zHekvmImDauOCxsmGJ5eKJ7Uuo0pq3i
	cwskdSa4sumooHzWKuUGrZNDbmYsdrdQl+IJSgRykumXZvc+WkXKa6WoHqEmZ42kpfks1iNZMqsK5
	TmRmkvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYOy-00000004Uvn-12Tv;
	Mon, 22 Jun 2026 06:45:00 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYOv-00000004Uus-2Q5f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 06:44:58 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-3078e0dcd67so4510006eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 23:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782110696; x=1782715496; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O89IWiz4+jst6WssmkXWLaT7xtJNIW5Q681+XiS4VbI=;
        b=seHltfuhZDrqV7LCibXzWQxrbf87RR1ro3JqWt4uIiKfC8AUkEB0q3a5vfx7uHHIpr
         +k6nAK5gRIIJd6tyn40oELUEkk6pVTyK7BRZgBePXuUg0uUdJksZQDo35Cl1+moBg6+t
         i+hWELepl0IS8ejn6w/V//kyYeCoN6D8bV4I0G0mneWw/GueA415N2Tb5/52dE36rEed
         Itc1L3gp73WA/6BjxGEyWJvPyPDehYjbTrpLPZDOzPFMIg4JduK9bObQq3U+Rguyu1U7
         mkg0wqGpVwUQw5saxi/K7Mqh6qHSNsk4z4qNVuZYLstwc46QQ2rjjLNu7ySDXmcJOnvw
         LPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110696; x=1782715496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O89IWiz4+jst6WssmkXWLaT7xtJNIW5Q681+XiS4VbI=;
        b=R3uMxJsH1mLmqrlz013Zg2CRrCY7h+DXvCFc3SqAfx3lgluzFAkX+dWnwmt9urQmyK
         fjHMKqYu5AHznnjzH04NOfZ/tdyIMy1O5blhOJPl8ZK9nWTP1Fr1TBIZk8+h3FE9NhEl
         sBkao6s0RykWpsFZT9bu1UWHdoZalyC73R6SvWBOhsxraHPELbAbpON/zFsQwdIf43Qi
         Vi7HklxzmxA7vgkrW/yTVOxYiU7+qIFcWBDk18h7D8EZT7zUvIaKxgw8gwKYIct3c8xI
         feY46CbvhT1hLqMW4IFzAFb3fARY/IZUuzSpVz18ibCjwcVZ0ltiu4Lj0IS8VEX8Ljmj
         RFdg==
X-Forwarded-Encrypted: i=1; AHgh+RqvqBv/B5cZmFG88zG+ijpft2PpovCjeE6PHEpXlCz5qCUeoNkXNKKnzek3fX702J2nczVZgkvqNbqRIK1n25EB@lists.infradead.org
X-Gm-Message-State: AOJu0YzirOwHiVTfUqwARMqXXoOMB3LvnmyHVdSU6SQ2qMo8JcnTMgpr
	GO7SvS6/CZO/4658iBjZt3fwfeMQuonoTDVK43Rfkz9u8PMUSqQjpFWe
X-Gm-Gg: AfdE7cnrJggEismweEmDUv+1qLLr/XpbI8IOX2E6ihvQw3CM5eNgc0jMC3l5SdSeMLy
	kDPyWytgnKRcllZs6EJa1cMM5ZMc/GerXplJxYNcapXmCwULiTuJYh2q01s9/2cONYcw4DPqBMw
	00VwjiiZ6RapfTaVFvcmTLIkRbwyvJbjSxnIlvEHutrkSFqExZo1Bc5Lh3Zz8CPcnPh9HLpkHn7
	hu2SQDUDT5TSW6aZK6GCk+z/fkJRTH8x9jNcRk42e09X2htBAD9gDLL/Rnf81PApueHVEu2dAcM
	tccAu7xaOaEtO3JcNBobCGmRzZWMM6ucBTVLUgI4slepgE3V/76xe01VgA6clqH1WrhjJgLa7Ja
	mfLS37FcOTRc6fMb3tOK7ysYUGLuwQoag7kI5xNnGdMMSZBftaIHBlwHAcuH8wNC9yuLAOmVL7J
	0S
X-Received: by 2002:a05:7300:dc10:b0:304:df8b:71ee with SMTP id 5a478bee46e88-30c06ffd9e8mr7952599eec.7.1782110696380;
        Sun, 21 Jun 2026 23:44:56 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d78esm8370076eec.18.2026.06.21.23.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:44:55 -0700 (PDT)
Date: Sun, 21 Jun 2026 23:44:52 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anup Patel <anup@brainfault.org>,
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ian Rogers <irogers@google.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 17/21] RISC-V: perf: Add Qemu virt machine events
Message-ID: <ajjZ5NljehUXERN1@blinky>
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
 <20260608-counter_delegation-v6-17-285b72ed65a9@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-counter_delegation-v6-17-285b72ed65a9@meta.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_234457_620012_A4F15FD4 
X-CRM114-Status: GOOD (  23.46  )
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

On Mon, Jun 08, 2026 at 11:01:31PM -0700, Atish Patra wrote:
> From: Atish Patra <atishp@rivosinc.com>
> 
> Qemu virt machine supports a very minimal set of legacy perf events.
> Add them to the vendor table so that users can use them when
> counter delegation is enabled.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/vendorid_list.h |  4 ++++
>  drivers/perf/riscv_pmu_sbi.c           | 36 ++++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
> index 7f5030ee1fcf..603aa2b21c0b 100644
> --- a/arch/riscv/include/asm/vendorid_list.h
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -11,4 +11,8 @@
>  #define SIFIVE_VENDOR_ID	0x489
>  #define THEAD_VENDOR_ID		0x5b7
>  
> +#define QEMU_VIRT_VENDOR_ID		0x000
> +#define QEMU_VIRT_IMPL_ID		0x000
> +#define QEMU_VIRT_ARCH_ID		0x000

Palmer proposed a change to this a while ago to set the archid for qemu
as 42 but it looks like it was never merged in qemu, but it was merged
into the riscv spec.

Here is the spec PR: https://github.com/riscv/riscv-isa-manual/pull/1213
Here is the current spec: https://github.com/riscv/riscv-isa-manual/blob/main/marchid.md
Here is the QEMU patch: https://lore.kernel.org/all/20240131182430.20174-1-palmer@rivosinc.com/

Should we follow up with this/maybe this should be accounted for here as
an alternate id?

- Charlie

> +
>  #endif
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 00b84b28117a..74acac54328e 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -26,6 +26,7 @@
>  #include <asm/sbi.h>
>  #include <asm/cpufeature.h>
>  #include <asm/vendor_extensions.h>
> +#include <asm/vendorid_list.h>
>  #include <asm/vendor_extensions/andes.h>
>  #include <asm/hwcap.h>
>  #include <asm/csr_ind.h>
> @@ -453,7 +454,42 @@ struct riscv_vendor_pmu_events {
>  	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map, \
>  	  .attrs_events = _attrs },
>  
> +/* QEMU virt PMU events */
> +static const struct riscv_pmu_event qemu_virt_hw_event_map[PERF_COUNT_HW_MAX] = {
> +	PERF_MAP_ALL_UNSUPPORTED,
> +	[PERF_COUNT_HW_CPU_CYCLES]		= {0x01, 0xFFFFFFF8},
> +	[PERF_COUNT_HW_INSTRUCTIONS]		= {0x02, 0xFFFFFFF8}
> +};
> +
> +static const struct riscv_pmu_event qemu_virt_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
> +						[PERF_COUNT_HW_CACHE_OP_MAX]
> +						[PERF_COUNT_HW_CACHE_RESULT_MAX] = {
> +	PERF_CACHE_MAP_ALL_UNSUPPORTED,
> +	[C(DTLB)][C(OP_READ)][C(RESULT_MISS)]	= {0x10019, 0xFFFFFFF8},
> +	[C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]	= {0x1001B, 0xFFFFFFF8},
> +
> +	[C(ITLB)][C(OP_READ)][C(RESULT_MISS)]	= {0x10021, 0xFFFFFFF8},
> +};
> +
> +RVPMU_EVENT_CMASK_ATTR(cycles, cycles, 0x01, 0xFFFFFFF8);
> +RVPMU_EVENT_CMASK_ATTR(instructions, instructions, 0x02, 0xFFFFFFF8);
> +RVPMU_EVENT_CMASK_ATTR(dTLB-load-misses, dTLB_load_miss, 0x10019, 0xFFFFFFF8);
> +RVPMU_EVENT_CMASK_ATTR(dTLB-store-misses, dTLB_store_miss, 0x1001B, 0xFFFFFFF8);
> +RVPMU_EVENT_CMASK_ATTR(iTLB-load-misses, iTLB_load_miss, 0x10021, 0xFFFFFFF8);
> +
> +static struct attribute *qemu_virt_event_group[] = {
> +	RVPMU_EVENT_ATTR_PTR(cycles),
> +	RVPMU_EVENT_ATTR_PTR(instructions),
> +	RVPMU_EVENT_ATTR_PTR(dTLB_load_miss),
> +	RVPMU_EVENT_ATTR_PTR(dTLB_store_miss),
> +	RVPMU_EVENT_ATTR_PTR(iTLB_load_miss),
> +	NULL,
> +};
> +
>  static struct riscv_vendor_pmu_events pmu_vendor_events_table[] = {
> +	RISCV_VENDOR_PMU_EVENTS(QEMU_VIRT_VENDOR_ID, QEMU_VIRT_ARCH_ID, QEMU_VIRT_IMPL_ID,
> +				qemu_virt_hw_event_map, qemu_virt_cache_event_map,
> +				qemu_virt_event_group)
>  };
>  
>  static const struct riscv_pmu_event *current_pmu_hw_event_map;
> 
> -- 
> 2.53.0-Meta
> 
> 

