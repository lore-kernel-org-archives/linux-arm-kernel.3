Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694F9CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+lPp2njFovinfGjUm3ddvYJz5KgaxbO4yZOkzGZLyQ=; b=fUA/XW0ZE/dy93mE3uWI5ypoWA
	eACKoWK8FehQkv4Cd4hlJy5HCbTGPVB1e0mq9GCpPZFVY8KXhKX8XKnyz3GfJZa+mdMXt8xbQCACU
	y/M7Cv61M7vbyiCq+mKg55gjIM6BTmrnlhvgg8ddc9coby99s8goAaWRm5H4BBaNML5BFpJadYML/
	eedr1s1sl/ssIdRv/9a7FeuN+oVY6G+ST3gahUHK/FY7ADcNxCYEam5A0xh35sUEr5Ab7qBzt7tBI
	F2oswcCnvVevOa/yHzqJNuafzu1nZR+K58qCusuyV34XrvgcRPS/1UvB32lffgBWgpKpbOZK2N4OU
	D/H8VVgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0xv-00000007lmh-0NrN;
	Mon, 18 Aug 2025 14:36:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0sI-00000007krn-15ty
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 14:30:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C0571596;
	Mon, 18 Aug 2025 07:30:05 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37D7D3F63F;
	Mon, 18 Aug 2025 07:30:13 -0700 (PDT)
Date: Mon, 18 Aug 2025 15:30:11 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	kernel@oss.qualcomm.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
Message-ID: <20250818143011.GB8071@e132581.arm.com>
References: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
 <20250815-itnoc-v1-3-62c8e4f7ad32@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815-itnoc-v1-3-62c8e4f7ad32@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_073014_346754_71F582BA 
X-CRM114-Status: GOOD (  24.54  )
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

On Fri, Aug 15, 2025 at 06:18:14AM -0700, Yuanfang Zhang wrote:
> This patch adds runtime power management support for platform-based
> CoreSight Interconnect TNOC (ITNOC) devices. It introduces suspend and
> resume callbacks to manage the APB clock (`pclk`) during device runtime
> transitions.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-tnoc.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> index aa6f48d838c00d71eff22c18e34e00b93755fd82..f12a1698824bc678545319a3f482fd27e67a7352 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -270,6 +270,31 @@ static void itnoc_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> +#ifdef CONFIG_PM
> +static int itnoc_runtime_suspend(struct device *dev)
> +{
> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(drvdata->pclk);
> +
> +	return 0;
> +}
> +
> +static int itnoc_runtime_resume(struct device *dev)
> +{
> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(drvdata->pclk);
> +
> +	return ret;

Here can be simplified:

    return clk_prepare_enable(drvdata->pclk);

> +}
> +#endif
> +
> +static const struct dev_pm_ops itnoc_dev_pm_ops = {
> +	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
> +};
> +
>  static const struct of_device_id itnoc_of_match[] = {
>  	{ .compatible = "qcom,coresight-itnoc" },
>  	{}
> @@ -282,6 +307,7 @@ static struct platform_driver itnoc_driver = {
>  	.driver = {
>  		.name = "coresight-itnoc",
>  		.of_match_table = itnoc_of_match,
> +		.pm = &itnoc_dev_pm_ops,
>  	},
>  };
>  
> 
> -- 
> 2.34.1
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

