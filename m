Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7CCEC1EAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSG0aRohbGb0tpwrwMSVLkygfswX+S8xga2s7G+y8zg=; b=n4ciXroyWjOiBKzxdxmLG/2/Mm
	biOUF8ga5HJfJS30Kkfr44bOqsHN2B6VgQWOeyn9J3X2XqX2170c8+9x4tipp2ZOpxZAgF2nn082R
	QvBeqvHdmhcSegEGL+/9OwJvZYJaF2MJsJdGEfDTTbR6lcV5jM+gLXnPnVFCq/DSecO0LiXAb3cg+
	GRvhXP73XrtJ18f+78ifXNwQaK2O3Hlq7FTei7Mq39aLLtm/WV/OTv+AVrlPu/5lwCF88CxDJqx7j
	76YZIdIR0+cEo+7tw9jvhTcqTyBYISWW+atBSy9IlkL9FjH74Ko/n5f8HPEv+lH08qTJG6jN8Cdpy
	m0Vi3EiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnyVV-00000009sjZ-35Sy;
	Thu, 05 Feb 2026 12:30:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnyVS-00000009shu-24km;
	Thu, 05 Feb 2026 12:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770294642;
	bh=uND1ONUGdNhpoclQ5sqn36Q9nqz74LEUWRO+lp7PPWU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O6WJ1OH9sjuOjCUfTuTUHRKgw7hpjfNMDr4o8IJD8FHKeyWqDlRaR/gFdzwws6JOP
	 TbsXvDxkjKTNqQCawECwYmWneKx5qp9WMK5AMwSBSPuQAnHAld6hT2sB7kdKGUBfLl
	 Mmfnn+NFNI7XSr4DzD+kCTeIAPDVLnnzoMsFzlPIH+JG4K4tp0ACpuQ6QHFfVzoUth
	 PofobZYSsBh2iT2tLdjJnYjypp3Ttl6ddtj6jq4IkDG76o9Vd3yyBNREnCtPMvcMak
	 6ZClfSyQbq7rYGVkBoUmwITNo5A05UevRspsaAnca0YSqxUauIkiPhuuSUpxSJ2eBD
	 nV+wtHyPasPLg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7FC0917E0017;
	Thu,  5 Feb 2026 13:30:42 +0100 (CET)
Message-ID: <a880d5d9-348e-4777-ae7f-69bdf7794e58@collabora.com>
Date: Thu, 5 Feb 2026 13:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mediatek: Unprepare SCP clock during system
 suspend
To: Tzung-Bi Shih <tzungbi@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, linux-remoteproc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260204085442.1822123-1-tzungbi@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260204085442.1822123-1-tzungbi@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_043046_717714_FA03D4F7 
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

Il 04/02/26 09:54, Tzung-Bi Shih ha scritto:
> Prior to commit d935187cfb27 ("remoteproc: mediatek: Break lock
> dependency to prepare_lock"), `scp->clk` was prepared and enabled only
> when it needs to communicate with the SCP.  The commit d935187cfb27
> moved the prepare operation to remoteproc's prepare(), keeping the clock
> prepared as long as the SCP is running.
> 
> The power consumption due to the prolonged clock preparation can be
> negligible when the system is running, as SCP is designed to be a very
> power efficient processor.
> 
> However, the clock remains prepared even when the system enters system
> suspend.  This prevents the underlying clock controller (and potentially
> the parent PLLs) from shutting down, which increases power consumption
> and may block the system from entering deep sleep states.
> 
> Add suspend and resume callbacks.  Unprepare the clock in suspend() if
> it was active and re-prepare it in resume() to ensure the clock is
> properly disabled during system suspend, while maintaining the "always
> prepared" semantics while the system is active.
> 
> Fixes: d935187cfb27 ("remoteproc: mediatek: Break lock dependency to prepare_lock")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Would be great if you could mention that in this driver, at the moment of writing,
there is no .attach() callback, hence rproc->state can never be RPROC_ATTACHED (as
in case that would also leave the clock prepared).

In any case, even though I don't exactly *love* how this is actually done, I don't
really have any better option.

But....

> ---
>   drivers/remoteproc/mtk_scp.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 4651311aeb07..6200c687e232 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1592,12 +1592,40 @@ static const struct of_device_id mtk_scp_of_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
>   
> +#ifdef CONFIG_PM_SLEEP

...you don't need this ifdef as when CONFIG_PM_SLEEP is not set the macro
SET_SYSTEM_SLEEP_PM_OPS is stubbed out (check pm.h).

After removing the ifdef, there'll be something to change, specifically:

> +static int scp_suspend(struct device *dev)

static int __maybe_unused scp_suspend(struct device *dev)
{

> +{
> +	struct mtk_scp *scp = dev_get_drvdata(dev);
> +	struct rproc *rproc = scp->rproc;
> +
> +	/* Only unprepare if the SCP is running and holding the clock */
> +	if (rproc->state == RPROC_RUNNING)
> +		clk_unprepare(scp->clk);
> +	return 0;
> +}
> +
> +static int scp_resume(struct device *dev)

static int __maybe_unused scp_resume(struct device *dev)
{

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> +{
> +	struct mtk_scp *scp = dev_get_drvdata(dev);
> +	struct rproc *rproc = scp->rproc;
> +
> +	if (rproc->state == RPROC_RUNNING)
> +		return clk_prepare(scp->clk);
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops scp_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(scp_suspend, scp_resume)
> +};
> +
>   static struct platform_driver mtk_scp_driver = {
>   	.probe = scp_probe,
>   	.remove = scp_remove,
>   	.driver = {
>   		.name = "mtk-scp",
>   		.of_match_table = mtk_scp_of_match,
> +		.pm = &scp_pm_ops,
>   	},
>   };
>   



