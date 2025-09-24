Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9BDCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 11:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wryAd6ncuSfZcxzz9rjCldwBQ+sv4oOpRu8xGk5LPEo=; b=T6xQnmhm4zxTk/nX4nSHMXsmy7
	ZamAilgrTn611NxD5glBCct1aklumkbweX1wL1fjkM//GKY4f1GlUahORZUco7wFYxn/Dyj6682Tf
	huAHTXY3l+W1KprHGLbJPfyUaFqekTSMCmkLVvO/UnY5SCQTS3gWJLgzKoSCgjwo0JmwBjRCp4aEQ
	PCQRWA0hZAmCq91dBpdPbCMk5oH4siCWTKmBvB/wtce7BBzpUYSRYE1AkgG7lbJjls1iLmSbKId6s
	52312tJxV5GWe8NGWbnDjOxar9TZ5PKtBEUuUEWd3s5895WyQeDFQJuv6/Ij8H/hUgM4h9NFgcsez
	4JfxZM1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1NZX-0000000GsLn-3me6;
	Wed, 24 Sep 2025 11:22:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1NZW-0000000GsKl-2A57
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 11:22:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7491460007;
	Wed, 24 Sep 2025 11:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CCFC4CEF0;
	Wed, 24 Sep 2025 11:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758712921;
	bh=X7GIGF2FsHIBZtxGFEtJeOu9snmHHyv0w2PWFjS9Qgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s39B4XWh9JRah+ZAUcjPHW2yD9vovdGwxH8YMl7ATmxflxxhVFa3jkS4bi+x2461v
	 DMhKUBVhWjxbkCcSWJoW1FNvG13n+f03NL5y+gZKSkB72Zj0Avh2/MMIvRF1G/f10T
	 LM2rUFsnZDcdbuJcCYqwTIaQCh99pFaxoTbxKtA/9NuMEwLpVRDbO4oUNUbDDeVKG9
	 6brUMHEjRNho9/i8UKZB0pVvwFiJjCFRbUkH6p4ELmpl8F8YATybQZZRmolcRLQi36
	 RlChf13e6Ak06R40yk5iYFulIOX800XdQ2RH7zaPHoHwM3XS69i4dIsctIfAb4WSb4
	 WcIAyA3xxQ7hA==
Date: Wed, 24 Sep 2025 12:19:31 +0100
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: Yushan Wang <wangyushan12@huawei.com>, Jonathan.Cameron@huawei.com,
	yangyicong@hisilicon.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robin.murphy@arm.com, liuyonglong@huawei.com,
	wanghuiqiang@huawei.com, prime.zeng@hisilicon.com,
	hejunhao3@h-partners.com, linuxarm@huawei.com, fanghao11@huawei.com
Subject: Re: [PATCH v3 5/9] drivers/perf: hisi: Extend the field of tt_core
Message-ID: <aNPTwxnlXGbazFLR@willie-the-truck>
References: <20250829101427.2557899-1-wangyushan12@huawei.com>
 <20250829101427.2557899-6-wangyushan12@huawei.com>
 <aNFMUdPJeJo9XU1e@willie-the-truck>
 <3cc3fcdf-436a-9e73-a377-ed896d07a825@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cc3fcdf-436a-9e73-a377-ed896d07a825@huawei.com>
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

On Tue, Sep 23, 2025 at 03:31:15PM +0800, Yicong Yang wrote:
> diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
> index bbd81a43047d..a52d98f1ed34 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
> @@ -57,6 +57,11 @@
>  #define L3C_V2_NR_EVENTS	0xFF
> 
>  HISI_PMU_EVENT_ATTR_EXTRACTOR(ext, config, 17, 16);
> +/*
> + * Remain the config1:0-7 for backward compatibility if some existing users
> + * hardcode the config1:0-7 directly without parsing the sysfs attribute.
> + */
> +HISI_PMU_EVENT_ATTR_EXTRACTOR(tt_core_deprecated, config1, 7, 0);
>  HISI_PMU_EVENT_ATTR_EXTRACTOR(tt_req, config1, 10, 8);
>  HISI_PMU_EVENT_ATTR_EXTRACTOR(datasrc_cfg, config1, 15, 11);
>  HISI_PMU_EVENT_ATTR_EXTRACTOR(datasrc_skt, config1, 16, 16);
> @@ -95,6 +100,21 @@ static bool support_ext(struct hisi_l3c_pmu *pmu)
>  	return l3c_pmu_ext->support_ext;
>  }
> 
> +/*
> + * tt_core was extended to cover all the CPUs sharing the L3 and was moved from
> + * config1:0-7 to config2:0-*. Try it first and fallback to tt_core_deprecated
> + * if user's still using the deprecated one.
> + */
> +static u32 hisi_l3c_pmu_get_tt_core(struct perf_event *event)
> +{
> +	u32 core = hisi_get_tt_core(event);
> +
> +	if (core)
> +		return core;
> +
> +	return hisi_get_tt_core_deprecated(event);
> +}

Perhaps we should be stricter about this and fail validation for events
that specify both a non-zero tt_core and a non-zero tt_core_deprecated?

Will

