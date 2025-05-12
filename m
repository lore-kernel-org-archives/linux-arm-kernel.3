Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E39C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 23:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSu69Pr4HjX8HDspEYl2pdfijF2goO2kW9FG1X+WHeI=; b=ZuxYIEOswLmYUyjQrgrhRWuYc1
	uyFaEVrPFPQ7oMKONLw+geHquMaW+279hkoudJeX63KCgc4dzwYfVITOiwevucfdiwta8dngKfp+W
	+P21XoeQ/IRG/SlLU0//NhGEQg1nkpbr3mk5kWYtzDd89OixQTm8LDU6+mbAMg2iiwi6Ql2s0RNyg
	ka2obdKnwk7sZdOpDmLwBdlbt6hIzmbr0ZXu62vd+yoLiK1nlBY2Pc3uF4D6yCuxSJUi9UBbGiorz
	coZRojK0XQVSTbi9fpisgsSZw6GZ2+Vh7bBK5gZN2ugW5DaW8PPRh7GhPTx55nMY02zcbetugFGpk
	Xe8uPAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEcHx-0000000Au5O-2EuH;
	Mon, 12 May 2025 23:10:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEcFR-0000000Atse-0xrg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 23:07:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A7EA2629D8;
	Mon, 12 May 2025 23:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AFBC4CEE7;
	Mon, 12 May 2025 23:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1747091268;
	bh=mLVqZ/5YEgc5I+OtAVcP0zFUZRpKAoMmvvxTlxPz18o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HVRgBjCN+owyIIX2LdiVtsMZPE1XhoigL58bK7gd1UHu7lMiaauZLLfW+YQ+eDnuK
	 lvATaRFwnzkmyYAZt+vyyhalou05HdebpZU6NA6ri6BJoeoMTM1BkbFGwXyR5nAP/h
	 /dL6EEyUqBdHdZzAII1hM4ypAOaJi5pMiNfVGxzw=
Date: Mon, 12 May 2025 16:07:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <dianders@chromium.org>,
 <sumit.garg@linaro.org>, <kernelfans@gmail.com>,
 <lecopzer.chen@mediatek.com>, <tglx@linutronix.de>, <song@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>,
 <zhanjie9@hisilicon.com>, <prime.zeng@hisilicon.com>,
 <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: Re: [PATCH v2 1/2] watchdog/perf: Provide function for adjusting
 the event period
Message-Id: <20250512160747.7c70fac79f4ecd929bf6b255@linux-foundation.org>
In-Reply-To: <20250512130919.23915-2-yangyicong@huawei.com>
References: <20250512130919.23915-1-yangyicong@huawei.com>
	<20250512130919.23915-2-yangyicong@huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 12 May 2025 21:09:18 +0800 Yicong Yang <yangyicong@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Architecture's using perf events for hard lockup detection needs to
> convert the watchdog_thresh to the event's period, some architecture
> for example arm64 perform this conversion using the CPU's maximum
> frequency which will be acquired by cpufreq. However by the time
> the lockup detector's initialized the cpufreq driver may not be
> initialized, thus launch a watchdog with inaccurate period. Provide
> a function hardlockup_detector_perf_adjust_period() to allowing
> adjust the event period. Then architecture can update with more
> accurate period if cpufreq is initialized.
> 
> ...
>  
> +/**
> + * hardlockup_detector_perf_adjust_period - Adjust the event period due
> + *                                          to cpu frequency change
> + * @cpu: The CPU whose event period will be adjusted
> + * @period: The target period to be set
> + */
> +void hardlockup_detector_perf_adjust_period(int cpu, u64 period)
> +{
> +	struct perf_event *event = per_cpu(watchdog_ev, cpu);
> +
> +	if (!(watchdog_enabled & WATCHDOG_HARDLOCKUP_ENABLED))
> +		return;

Is this the right thing to do?  Would it be better to proceed with the
alteration of the period so that the state is correct if
WATCHDOG_HARDLOCKUP_ENABLED is later enabled?  (If that's possible).


> +	if (!event)
> +		return;
> +
> +	if (event->attr.sample_period == period)
> +		return;
> +
> +	if (perf_event_period(event, period))
> +		pr_err("failed to change period to %llu\n", period);
> +}
> +
>  /**
>   * hardlockup_detector_perf_stop - Globally stop watchdog events
>   *
> -- 
> 2.24.0

