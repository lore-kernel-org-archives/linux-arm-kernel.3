Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6ECBCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqx7setAMOuFaeqAgdUfg2Qky7oz90j/56nEXIsM+OM=; b=rJkXiXByzSAzb9iapm8ArGWtqo
	MgcjUSbQ7uOtaXa8tocLwkpQ4/+ZVqvTw/uksPy3aypc8Mxdb2e3FulMLwYWXUUK/HfvZX5HkrL1P
	T2L5OFFsdOvtGlw40WUJxEnAp6Xh5a22OjRGWHKmudlqrfapa1D2g1CGBChn5srEiaBs/ZHFZ191M
	mQhfBc99+8b69gPkXxe82lPEZEl8DLAb3hKuRh7mzMsPTxFrNM9g7ZZjSZoYsCboSxCdatDLWHMXW
	qHDa6l8RVBKz+rc40YjivtbSurcpazcJn5IWL5kCLO3XRcmjCpgHIo5tawoP1X008mezLs8WdxoVh
	qyO8JaxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVUS-00000005t8Z-2Yym;
	Mon, 10 Nov 2025 17:15:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVUQ-00000005t8E-0NN2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:15:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1783B2B;
	Mon, 10 Nov 2025 09:15:29 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03A023F66E;
	Mon, 10 Nov 2025 09:15:31 -0800 (PST)
Date: Mon, 10 Nov 2025 18:15:34 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Bowen Yu <yubowen8@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, ptsm@linux.microsoft.com,
	linuxarm@huawei.com, jonathan.cameron@huawei.com,
	zhanjie9@hisilicon.com, prime.zeng@hisilicon.com,
	wanghuiqiang@huawei.com, xuwei5@huawei.com, zhenglifeng1@huawei.com,
	zhangpengjie2@huawei.com
Subject: Re: [PATCH 3/3] arm64: topology: Remove redundant housekeeping_cpu()
 checks in arch_freq_get_on_cpu
Message-ID: <aRIdtuWAIen__yZU@arm.com>
References: <20251104075544.3243606-1-yubowen8@huawei.com>
 <20251104075544.3243606-4-yubowen8@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104075544.3243606-4-yubowen8@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_091538_189031_101F69DD 
X-CRM114-Status: GOOD (  17.68  )
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

On Tue, Nov 04, 2025 at 03:55:44PM +0800, Bowen Yu wrote:
> This patch removes redundant !housekeeping_cpu() check since it is
> inherently done when checking jiffies.
> 
> Signed-off-by: Bowen Yu <yubowen8@huawei.com>
> ---
>  arch/arm64/kernel/topology.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index f1370a4a4df9..6981ef3019d3 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -310,20 +310,13 @@ int arch_freq_get_on_cpu(int cpu)
>  		 * (and thus freq scale), if available, for given policy: this boils
>  		 * down to identifying an active cpu within the same freq domain, if any.
>  		 */
> -		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
> -		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
> +		if (time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
>  			struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
>  			int ref_cpu;
>  
>  			if (!policy)
>  				return -EINVAL;
>  
> -			if (!cpumask_intersects(policy->related_cpus,
> -						housekeeping_cpumask(HK_TYPE_TICK))) {
> -				cpufreq_cpu_put(policy);
> -				return -EOPNOTSUPP;
> -			}
Removing this means you will iterate over potentially dynamic-tick CPUs and
running the checks instead of skipping it here (plus other implications).
Is that intentional ?
---
BR
Beata
> -
>  			for_each_cpu_wrap(ref_cpu, policy->cpus, cpu + 1) {
>  				if (ref_cpu == start_cpu) {
>  					/* Prevent verifying same CPU twice */
> -- 
> 2.33.0
> 

