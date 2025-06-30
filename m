Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CC7C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LR7G+ibD4rgaTIYMC1yKY14KOB6Bt7LBBCN91SJpVU=; b=CCs46veMpQ2gdQCOuwL3uJ0XcX
	PFagDo1esvEko8jJi2ZJpUhvBK0tYw8y6ZbsqnlL0vvAZghsIQEzZWLaS73l+coSFee84CU720TxM
	yG00ZJfevmQTcnvfPTYXzmcVuPk5xuhRJzsvVE6Izwz991019GwnkFJjKZqyRwXwgKvfszdZ5vqxR
	KsSsprbe2yEOrD0mQIDAhuxn8hXI0kPJs43lk5/rS5C17+rjzpveS1IlG+GasfqrMnDJ1PrGsXzRG
	h1VGvDJ/9iDi8/aNvevbJ79qMMKG1t5vViXVA92VZkiuvGRUO2Ah0eyvAggJbCyvSRMs+3HBcnbxj
	dupuhEvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEbP-00000002Nql-1yXR;
	Mon, 30 Jun 2025 13:31:19 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEWY-00000002Msl-379q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 13:26:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso13003655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 06:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751289977; x=1751894777; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1LR7G+ibD4rgaTIYMC1yKY14KOB6Bt7LBBCN91SJpVU=;
        b=Wx64DoEtKT81CgyJO7a1YK3UImHAUK74+ey4fH4Ib4IVzW/RrgdrSw6QIbCvDKS5mM
         0BGpyr1UY8Tu6L8AEcJuGiOaKo8mCvpRHLhUtJ5lNle2z2tIprUYPUUJDN9r3G04OMAn
         itkTdI8CNoctP0n+SVrOb2CXb9RN4QE7wXQ4IOlLOEWrSBXVwaSN7c1oIyvyhI6o/Owe
         HESHTSLKnacGVRpGLsKYK9EcAiovTzQhpXz8xRty5OlpxnWLckjwkOE21SUcedhS+3v1
         bfQsWOd7N9rUk5LjmDq+2bUXU92jpjHfoPO3/4JMuz9nBWnQGJtTzsmnuio1cgD3w7/i
         ewiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751289977; x=1751894777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1LR7G+ibD4rgaTIYMC1yKY14KOB6Bt7LBBCN91SJpVU=;
        b=xBdjig0kmVPB9bwGIquRmfkYluCtnkBlCSzXsSbTDQxqFTupV3hPUIvAn3NWxqM312
         ou48GY/3BxTQo75vod9sBl6csGhYaXIGrbTkkHRzv+2DQfrYUiMBjvLoT7m5yaBIfJsq
         e8OT+GQ5cADEGxLGExoXWXLsYlzSH9CtzS27jLO4LcOhQgKVRnC63vTa5G/+1HM/jiAB
         1L8f+XSYRIrKas8hrfGP6+tGfNzUlqRPGSw39minC/9G5iJln4t+jjyyRMyZg/iWnuIl
         nj4YxYjz6bnBvFDIokXeO44NA6OkQTQzBLShc9KsoefAiBavVPBoQNEMWspQ6ZCFEUjH
         YjzA==
X-Gm-Message-State: AOJu0YyOagDyiGSgyCZjKGMACR0vmh7a1k5YzS4D9n663k1QY/AXJnsX
	SXbZi3U0H0EftZWCjpW96TJjpKj+g5GvsFmLrQanMXBMEktHAqED21uy8BCX3Bh3I/c=
X-Gm-Gg: ASbGncupm0/PhPiANaAQiA8Zh9XMZBqTpqVd1UXu/B/BYS2E3HW8GdlnH0DK4zIaYBY
	8U09GxE9ODsrfcezljA+3Vy1ZLcX/gKixiEE/6qizSTOHWeKi60qRHDxU8/xprLKQnq2MLGYZdZ
	6CjD69h7ZQvOhe1xCq8CTCTqobuBGMxwgTF3u0v1zNL7z50fSZn/c6ipmEQU+cuMfJReXKw2//r
	qYh/6SUr6+VsC99IsvKwZTMbOGuU+AvjlIcGRAU+UnaNxg+YUv+HUxJCP6O2WKFlSc340A3vw0N
	xrZhSaDvcBFzEjy6965zBOzdnU0FMGt+7amV6hUWB4kbngR1wrvkSol4Hh2D7v036vE=
X-Google-Smtp-Source: AGHT+IHXyDPllAQfiCnHOhBWNnf3nw0YYqRMT7LLRAVDyR5oQC0yCAsnt4bSuJQio4g5UH+jS57AqA==
X-Received: by 2002:a05:600c:3ba1:b0:450:d04e:22d6 with SMTP id 5b1f17b1804b1-4538ee565damr129693165e9.7.1751289976911;
        Mon, 30 Jun 2025 06:26:16 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe592sm132598425e9.21.2025.06.30.06.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:26:16 -0700 (PDT)
Message-ID: <5ecf74f6-08a0-474c-b0ff-32075af7ae03@linaro.org>
Date: Mon, 30 Jun 2025 14:26:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] perf: arm_spe: Armv8.8 SPE features
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Marc Zyngier <maz@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com,
 Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_062618_787516_BF15F1EE 
X-CRM114-Status: GOOD (  19.74  )
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



On 05/06/2025 11:48 am, James Clark wrote:
> Support 3 new SPE features: FEAT_SPEv1p4 filters, FEAT_SPE_EFT extended
> filtering, and SPE_FEAT_FDS data source filtering. The features are
> independent can be applied separately:
> 
>    * Prerequisite sysreg changes - patches 1 - 2
>    * FEAT_SPEv1p4 - patch 3
>    * FEAT_SPE_EFT - patch 4
>    * FEAT_SPE_FDS - patches 5 - 8
>    * FEAT_SPE_FDS Perf tool changes - patches 9 - 11
> 
> The first two features will work with old Perfs but a Perf change to
> parse the new config4 is required for the last feature.
> 
> To:
> 
> ---
> Changes in v3:
> - Use PMSIDR_EL1_FDS instead of 1 << PMSIDR_EL1_FDS_SHIFT
> - Add VNCR offsets
> - Link to v2: https://lore.kernel.org/r/20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org
> 
> Changes in v2:
> - Fix detection of FEAT_SPE_FDS in el2_setup.h
> - Pickup Marc Z's sysreg change instead which matches the json
> - Restructure and expand docs changes
> - Link to v1: https://lore.kernel.org/r/20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org
> 
> ---
> James Clark (10):
>        arm64: sysreg: Add new PMSFCR_EL1 fields and PMSDSFR_EL1 register
>        perf: arm_spe: Support FEAT_SPEv1p4 filters
>        perf: arm_spe: Add support for FEAT_SPE_EFT extended filtering
>        arm64/boot: Enable EL2 requirements for SPE_FEAT_FDS
>        KVM: arm64: Add trap configs for PMSDSFR_EL1
>        perf: Add perf_event_attr::config4
>        perf: arm_spe: Add support for filtering on data source
>        tools headers UAPI: Sync linux/perf_event.h with the kernel sources
>        perf tools: Add support for perf_event_attr::config4
>        perf docs: arm-spe: Document new SPE filtering features
> 
>   Documentation/arch/arm64/booting.rst      |  11 ++++
>   arch/arm64/include/asm/el2_setup.h        |  14 +++++
>   arch/arm64/include/asm/sysreg.h           |   7 +++
>   arch/arm64/include/asm/vncr_mapping.h     |   2 +
>   arch/arm64/kvm/emulate-nested.c           |   1 +
>   arch/arm64/kvm/sys_regs.c                 |   1 +
>   arch/arm64/tools/sysreg                   |  13 +++-
>   drivers/perf/arm_spe_pmu.c                | 100 +++++++++++++++++++++++++++++-
>   include/uapi/linux/perf_event.h           |   2 +
>   tools/include/uapi/linux/perf_event.h     |   2 +
>   tools/perf/Documentation/perf-arm-spe.txt |  97 ++++++++++++++++++++++++++---
>   tools/perf/tests/parse-events.c           |  14 ++++-
>   tools/perf/util/parse-events.c            |  11 ++++
>   tools/perf/util/parse-events.h            |   1 +
>   tools/perf/util/parse-events.l            |   1 +
>   tools/perf/util/pmu.c                     |   8 +++
>   tools/perf/util/pmu.h                     |   1 +
>   17 files changed, 273 insertions(+), 13 deletions(-)
> ---
> base-commit: ec7714e4947909190ffb3041a03311a975350fe0
> change-id: 20250312-james-perf-feat_spe_eft-66cdf4d8fe99
> 
> Best regards,

Gentle ping, thanks


