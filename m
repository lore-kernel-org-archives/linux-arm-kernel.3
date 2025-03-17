Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12FAC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 02:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9HWwsiF6Qfx2JC9NgCw84DZrJkJ2a+JjTbjn1TrTJM=; b=QOGuLNpRd5qX6tQr8wOgemzSkj
	fqDX38NqX7Xy/4YMQEEteQ1VqHPAmB/cdEhUJCyGUtH/7YuRLaEgtV1YdToFG5k+B70P6vR5SazJF
	ADjhtBEMGc3G4A/yzLBFyr9q3XbCy3cWaIZ/X7uluD2z66gj58LaJD1JBb4C60XZ8c+kDILSBWxLg
	yL7ISRqgCUgOsYlTcSgh/QyrlMp6nBBrjhTFPf/8sUtaPkZLjMa8ZKvdu5Ta5fmSaaPVqRxrR+Jln
	tTtnJ6jHueUdfg9uiNUYFIkP0UUKEJzsuYCT0dll63RwlEk2XehTRE28dHm2uffY8y13YXAJpNa42
	TnIoJYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu00m-00000000uxI-0FdI;
	Mon, 17 Mar 2025 02:15:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttzz5-00000000uo4-2pci
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 02:13:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1741213D5;
	Sun, 16 Mar 2025 19:13:49 -0700 (PDT)
Received: from [10.162.16.153] (a077893.blr.arm.com [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 191513F673;
	Sun, 16 Mar 2025 19:13:36 -0700 (PDT)
Message-ID: <a636ce0d-a5cf-4718-9d39-1a6e74bdea5f@arm.com>
Date: Mon, 17 Mar 2025 07:43:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] Coresight: Fix a NULL vs IS_ERR() bug in probe
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Jie Gan <quic_jiegan@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <dab039b9-d58a-41be-92f0-ff209cfabfe2@stanley.mountain>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <dab039b9-d58a-41be-92f0-ff209cfabfe2@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_191343_776831_9E90E2C4 
X-CRM114-Status: GOOD (  12.41  )
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



On 3/14/25 16:25, Dan Carpenter wrote:
> The devm_platform_get_and_ioremap_resource() function doesn't
> return NULL, it returns error pointers.  Update the checking to
> match.
> 
> Fixes: f78d206f3d73 ("Coresight: Add Coresight TMC Control Unit driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-ctcu-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index da35d8b4d579..c6bafc96db96 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -204,8 +204,8 @@ static int ctcu_probe(struct platform_device *pdev)
>  	dev->platform_data = pdata;
>  
>  	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> -	if (!base)
> -		return -ENOMEM;
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
>  
>  	drvdata->apb_clk = coresight_get_enable_apb_pclk(dev);
>  	if (IS_ERR(drvdata->apb_clk))

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

