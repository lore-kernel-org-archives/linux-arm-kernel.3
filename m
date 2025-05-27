Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21130C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 13:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4y7bidN3sY7C1TzkQB9POBSD8OdiC+zh7EJPdE+sOkA=; b=NO8hBZFl654Op7Kxwm8Dcjo67v
	792DhsHLyBf5eYf/O+ZEDWZSm8z1K3XGundWv55X/P+HHxbQRTWNdfK2tt2plofbvC8NFHiG4hWoc
	5dFVMnCezL9JSNMAHbPhOC5owEibjSeLI4L7IeypoTJ7hVWHv+T0XsAG2d8KQSjtMheTamyn5j5MQ
	+Qp0qOqUAn0Hy6LzKojiph9rBP1RQk9uW0cNNfClvceumkptNBNK7SXIlUS61wV1xI+3NPZWqebXk
	RdhjbhjR0gxaQhmexwG+5IE2qRhWb9XgzGB1fXo0ixFMnW5poupiSYCPT25lzFR6DdZ1HhHfDMaL1
	e91yFaQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJuGT-0000000AoJ4-2z2w;
	Tue, 27 May 2025 13:22:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJu1A-0000000Am1C-3OeC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 13:06:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81FDA14BF;
	Tue, 27 May 2025 06:06:39 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AD593F673;
	Tue, 27 May 2025 06:06:54 -0700 (PDT)
Date: Tue, 27 May 2025 14:06:50 +0100
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf: arm_spe: Relax period restriction
Message-ID: <20250527130650.GH2566836@e132581.arm.com>
References: <20250527121827.3919495-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527121827.3919495-1-leo.yan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_060656_925053_24422337 
X-CRM114-Status: GOOD (  13.72  )
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

Hi all,

On Tue, May 27, 2025 at 01:18:27PM +0100, Leo Yan wrote:

[...]

> @@ -309,15 +309,22 @@ static u64 arm_spe_event_to_pmscr(struct perf_event *event)
>  static void arm_spe_event_sanitise_period(struct perf_event *event)
>  {
>  	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
> +	struct device *dev = &spe_pmu->pdev->dev;
>  	u64 period = event->hw.sample_period;
>  	u64 max_period = PMSIRR_EL1_INTERVAL_MASK;
>  
> -	if (period < spe_pmu->min_period)
> -		period = spe_pmu->min_period;
> -	else if (period > max_period)
> +	if (period < spe_pmu->min_period) {
> +		/* Period must set to a non-zero value */
> +		if (!period)
> +			period = 1;

I read the document again and found the interval granluarity is 256
(8-bit).  So the change above is incorrect.

I will send a new patch.  Sorry for inconvenience.

Thanks,
Leo

> +
> +		dev_warn_ratelimited(dev, "Period %llu < %u (recommended minimum interval).\n",
> +				     period, spe_pmu->min_period);
> +	} else if (period > max_period) {
>  		period = max_period;
> -	else
> +	} else {
>  		period &= max_period;
> +	}
>  
>  	event->hw.sample_period = period;
>  }
> -- 
> 2.34.1
> 

