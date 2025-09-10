Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022C2CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPePv0+kozYModSNP0zosg9fXPFHRxr5EBFxvMg5zqc=; b=bzdLqRGFyqK34Y/StrWNAcvdkR
	jpQRFdPRDXFklrW1xFHelaBWq6cDcVxRlfw+zpzZMktZSsU5/flACMhUTLmU1y0PjRWiuJmBToN5O
	4URNqgcxgVURZeHm8Pe2jEmrzHBtod5QrWo8POTEw5eD5qWdsgtirYttQ5d0/fpWqjiPJHiM9D+Nc
	FDHirsoxpWBDMsCAR2enWOVUgDYUotnLPkf2n3deT78HKagg3GqC44ideuZzRneV4sX7zkoMsHZbr
	3VxCmpI7bHHKx2bAprPSbBWiP5Ygbs8y7DTyzgSvLLh/nIW2sQbw4rsKicL4JnekIHz2Ic0ElyPdA
	1Us0RWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNhp-0000000FUtm-2x06;
	Wed, 10 Sep 2025 16:30:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNhn-0000000FUsG-3Ycu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 16:30:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E63716F2;
	Wed, 10 Sep 2025 09:29:50 -0700 (PDT)
Received: from [10.57.5.181] (unknown [10.57.5.181])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 43A673F63F;
	Wed, 10 Sep 2025 09:29:56 -0700 (PDT)
Message-ID: <0c675681-e15f-4b94-b567-6545ac4cfa06@arm.com>
Date: Wed, 10 Sep 2025 17:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] perf/arm-dsu: refactor cpu id retrieval via new
 API of_cpu_phandle_to_id
Content-Language: en-GB
To: Alireza Sanaee <alireza.sanaee@huawei.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: coresight@lists.linaro.org, dianders@chromium.org,
 james.clark@linaro.org, jonathan.cameron@huawei.com, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linuxarm@huawei.com, mark.rutland@arm.com, mike.leach@linaro.org,
 robh@kernel.org, ruanjinjie@huawei.com, saravanak@google.com
References: <20250905161830.37-1-alireza.sanaee@huawei.com>
 <20250905161830.37-7-alireza.sanaee@huawei.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250905161830.37-7-alireza.sanaee@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_092959_934758_E65A65D3 
X-CRM114-Status: GOOD (  15.08  )
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

On 05/09/2025 17:18, Alireza Sanaee wrote:
> Update arm-dsu to use the new API (of_cpu_phandle_to_id).
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>   drivers/perf/arm_dsu_pmu.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/perf/arm_dsu_pmu.c b/drivers/perf/arm_dsu_pmu.c
> index cb4fb59fe04b..8f76bd94349c 100644
> --- a/drivers/perf/arm_dsu_pmu.c
> +++ b/drivers/perf/arm_dsu_pmu.c
> @@ -591,17 +591,12 @@ static struct dsu_pmu *dsu_pmu_alloc(struct platform_device *pdev)
>   static int dsu_pmu_dt_get_cpus(struct device *dev, cpumask_t *mask)
>   {
>   	int i = 0, n, cpu;
> -	struct device_node *cpu_node;
>   
>   	n = of_count_phandle_with_args(dev->of_node, "cpus", NULL);
>   	if (n <= 0)
>   		return -ENODEV;
>   	for (; i < n; i++) {
> -		cpu_node = of_parse_phandle(dev->of_node, "cpus", i);
> -		if (!cpu_node)
> -			break;
> -		cpu = of_cpu_node_to_id(cpu_node);
> -		of_node_put(cpu_node);
> +		cpu = of_cpu_phandle_to_id(dev->of_node, NULL, i);
>   		/*
>   		 * We have to ignore the failures here and continue scanning
>   		 * the list to handle cases where the nr_cpus could be capped

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

