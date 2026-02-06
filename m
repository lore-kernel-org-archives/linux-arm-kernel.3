Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2457ECD9BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 03:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLeGguxU5YDL/fDRuu+46YR1QFycm4KwR3pnd1FWMiE=; b=DUjp+B0sBDQVyygXKoBppAMAQ3
	2j/faXCLsLV75DmFrx4UpaeUI4G3/naJxBbM93ADhRQf9Sm8peC2CDmiadx6bi2Le/OZ3X6QTJHpi
	x+JPOhI09sLXY8WIbB+CSC1/OSGooZmJvIqbLYp0tPKDnMlOsr2lOw8ogo33H6wKLyynviWjP84Cw
	yyrt98kmm9BMOFpPnsNOzM7XUmJalWd7xXSfMqOSNVC7MKEIfpEYrg18WQBEcUpHLKAETBPDpNH9J
	VRlSCVZ4WeYNou8oa2s+MLIweALhmbtmmL1iWhW2dsuIhcYEpyiChpVrR/S3fpdeP+mfWsVQ3pkf3
	CDNzoRUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voCht-0000000Aofm-1EOu;
	Fri, 06 Feb 2026 03:40:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voChr-0000000Aofd-2GHZ;
	Fri, 06 Feb 2026 03:40:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A197560010;
	Fri,  6 Feb 2026 03:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17BB9C4CEF7;
	Fri,  6 Feb 2026 03:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770349230;
	bh=FODg6UNvIBu/ZybFA9evOhDRmMXlzJppqNIxz1lUES4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGbDFSHKu32A0MBDQvShwysZrEWY04LY9wi7FxWw1eNXl4fs4yLgZ3folOAtj2qnQ
	 MC/+pMH6f20yRAk2eQ4n5Lv5Ah9x6wEUuDw+vxxTYIvvtUyVXiVCHGzq5W5yY2Btz+
	 +/ZtjL2hE7A/mYfBmM13E22ur+lvAR9pmWQJ7jIm2aRF2IeN4InP8SadGHLI6reRX9
	 u9g/4ht7FSdkMsixdozPU0Nok+0bN64uuZvlIxDdJcw18/+wJOEjWCemyqh22JlfwX
	 0+KTUjHlS1NfWnJ1bK38dd2Z7fvNA0Vf6EbKzaNBywLtR6+gCdV4Cx1SfcbnKcpJOk
	 0ZL5E4OLQUKng==
Date: Fri, 6 Feb 2026 03:40:26 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] remoteproc: mediatek: Unprepare SCP clock during
 system suspend
Message-ID: <aYViqgirwN2Xgp61@google.com>
References: <20260206033034.3031781-1-tzungbi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206033034.3031781-1-tzungbi@kernel.org>
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

On Fri, Feb 06, 2026 at 03:30:33AM +0000, Tzung-Bi Shih wrote:
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
> prepared" semantics while the system is active.  The driver doesn't
> implement .attach() callback, hence it only checks for RPROC_RUNNING.
> 
> Fixes: d935187cfb27 ("remoteproc: mediatek: Break lock dependency to prepare_lock")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---

Pardon me for forgetting to attach changelog before sending the patch.  Here
is the changelog:

v2:
- Add note and code comment for RPROC_ATTACHED.
- Use __maybe_unused instead of '#ifdef CONFIG_PM_SLEEP'.
- Add R-b tag.

v1: https://lore.kernel.org/all/20260204085442.1822123-1-tzungbi@kernel.org

>  drivers/remoteproc/mtk_scp.c | 39 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 4651311aeb07..bb6f6a16d895 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1592,12 +1592,51 @@ static const struct of_device_id mtk_scp_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
>  
> +static int __maybe_unused scp_suspend(struct device *dev)
> +{
> +	struct mtk_scp *scp = dev_get_drvdata(dev);
> +	struct rproc *rproc = scp->rproc;
> +
> +	/*
> +	 * Only unprepare if the SCP is running and holding the clock.
> +	 *
> +	 * Note: `scp_ops` doesn't implement .attach() callback, hence
> +	 * `rproc->state` can never be RPROC_ATTACHED.  Otherwise, it
> +	 * should also be checked here.
> +	 */
> +	if (rproc->state == RPROC_RUNNING)
> +		clk_unprepare(scp->clk);
> +	return 0;
> +}
> +
> +static int __maybe_unused scp_resume(struct device *dev)
> +{
> +	struct mtk_scp *scp = dev_get_drvdata(dev);
> +	struct rproc *rproc = scp->rproc;
> +
> +	/*
> +	 * Only prepare if the SCP was running and holding the clock.
> +	 *
> +	 * Note: `scp_ops` doesn't implement .attach() callback, hence
> +	 * `rproc->state` can never be RPROC_ATTACHED.  Otherwise, it
> +	 * should also be checked here.
> +	 */
> +	if (rproc->state == RPROC_RUNNING)
> +		return clk_prepare(scp->clk);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops scp_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(scp_suspend, scp_resume)
> +};
> +
>  static struct platform_driver mtk_scp_driver = {
>  	.probe = scp_probe,
>  	.remove = scp_remove,
>  	.driver = {
>  		.name = "mtk-scp",
>  		.of_match_table = mtk_scp_of_match,
> +		.pm = &scp_pm_ops,
>  	},
>  };
>  
> -- 
> 2.53.0.rc2.204.g2597b5adb4-goog
> 

