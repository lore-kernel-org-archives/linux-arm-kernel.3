Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3223DD2AB3F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 13:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWmK7YloyVlCj4Foi80Ia9qm3R2ho4wUBh0Xk5h0sdA=; b=sOwmiD+Q+ZmNDIwxRLBOPK7xPZ
	QZFIu8+z6etEu6vrMVUj8RfwsqeZMKEzSY1asXbHfxnG2x5m9QTjt4yPAatYtCiiAUvFMwVgk1LLJ
	I/LVO4rtECQ8/1lwoPAhj5oRfEVNWlITO3tY/4vOId1e1yBGWf/WG57ETuKWfynbjIl7GAdXzvKy9
	pjFhrUs0GHQEnJhWvPQgZkK6IqgQ9RFQcN5fIZD245tvXG2TucOl3sNwQ0Ga8yBhsHs89SCDZ8+hH
	WHdP1c+3dc8qso6M2uXGWJINggKXGB6tGBAyiT3ZqBX164QXMMmp14ePlzz6esQ9j/LANLk0ABSCp
	vO/LI5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mcx-0000000EdO7-3Kum;
	Tue, 29 Oct 2024 13:51:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mGv-0000000EZez-2CjN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 13:28:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1DBB5C5B4F;
	Tue, 29 Oct 2024 13:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DDDC4CECD;
	Tue, 29 Oct 2024 13:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730208512;
	bh=e3K2C4d64w5q8jBy694LKako+mbAAHduLlAX9nGbCBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DZBInWnKyg47BWassEMuKEkFeDKyUsu3KZnmvTDI6PvnDPQ6gfvyWimtguDiDq1Ye
	 IsVnsxYXy+aSlmxnvcWJ9rytD/P8vEva3xJ4lpTrvvZY492pK+CYi9xHUIgwfieKBj
	 UNh2kb1ggtPHvrIhOCTzMKx/lEF3ywoFxfmsZw5C5HJyUyPlbTjQiHET+aonv89AIG
	 xEY9f8JX89gt4XfbMqi/4WcjpYivKD8fWVumQZFnjGtd7rgVMAfuvtLwt9uIp0yaYl
	 Z0LHqsiv1b9/ldDq5wyXGuvQoyciXYp0tXESX+7PIfMxTTVAZcEa0mfXg1djdGaNUe
	 ObI3ftv/wsevA==
Date: Tue, 29 Oct 2024 13:28:27 +0000
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: jonathan.cameron@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, yangyicong@hisilicon.com,
	hejunhao3@huawei.com, linuxarm@huawei.com, wangyushan12@huawei.com,
	prime.zeng@hisilicon.com
Subject: Re: [PATCH v3 2/8] drivers/perf: hisi: Improve the detection of
 associated CPUs
Message-ID: <20241029132826.GB4416@willie-the-truck>
References: <20241026072424.29887-1-yangyicong@huawei.com>
 <20241026072424.29887-3-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026072424.29887-3-yangyicong@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_062833_675511_52E05D7C 
X-CRM114-Status: GOOD (  27.99  )
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

On Sat, Oct 26, 2024 at 03:24:18PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Currently the associated CPUs are detected in the cpuhp online
> callback. If the CPU's sccl_id or the ccl_id matches the PMU's,
> they're associated. There's an exception that some PMUs locate
> on the SICL and will match no CPUs. The events of these PMUs
> can be opened on any online CPUs. To handle this we just check
> whether the PMU's sccl_id is -1, if so we know it locates on
> SICL and make any CPU associated to it.
> 
> This can be tweaked so in this patch just do the below changes:
> - If the PMU doesn't match any CPU then associated it to online CPUs
> - Choose the target CPU according to the NUMA affinity for opening
>   events
> 
> The function is implemented by hisi_pmu_init_associated_cpus() and
> invoked in hisi_pmu_init().
> 
> Also the associated_cpus are maintained with all the online CPUs. This
> is redundant since we'll always schedule the events on the online CPUs.
> Get rid of this and make associated_cpus contain offline CPUs as well.

I don't really understand the rationale for this change. Why is the new
behaviour better than the old one?

> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/perf/hisilicon/hisi_uncore_pmu.c | 56 +++++++++++++++++++-----
>  drivers/perf/hisilicon/hisi_uncore_pmu.h |  5 +++
>  2 files changed, 49 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> index 416f72a813fc..c3549e16e0c3 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> @@ -399,6 +399,27 @@ void hisi_uncore_pmu_disable(struct pmu *pmu)
>  }
>  EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_disable, HISI_PMU);
>  
> +static void hisi_pmu_init_associated_cpus(struct hisi_pmu *hisi_pmu)
> +{
> +	/*
> +	 * If the associated_cpus has already been initialized, for example
> +	 * determined by comparing the sccl_id and ccl_id with the CPU's
> +	 * mpidr_el1, then do nothing here. Otherwise the PMU has no affinity
> +	 * and could be opened on any online CPU.
> +	 */
> +	if (!cpumask_empty(&hisi_pmu->associated_cpus))
> +		return;
> +
> +	cpumask_copy(&hisi_pmu->associated_cpus, cpu_online_mask);

Is it always safe to access 'cpu_online_mask' here?

Will

