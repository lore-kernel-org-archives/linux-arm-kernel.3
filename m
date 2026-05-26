Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8845FCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 09:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnG9nY6P1Yh9vQhr0dwhBTn5IOyza6Sao0bVURL65+0=; b=bMCNwDr8WCmgbLCzVcdUkhA1e7
	2TyFpqj7a1ImCtGb4mw0dairNI5Y0JxuGuYWz7k9RHZ6YKr3PG8pl+UvOK5VK1c1QwCMqSNKniBV6
	fGZjoI95LfsMDtNohAIoaLcBSwR/LE4W3E7n9fmFmtoA4bvR3I4knjJynVEsqaCZTNM6q5yDsgC6t
	jUYeBdUFUCKwrHWt+W2blGhGvUITbaTpHrAhEvcR70xd0p2nKCGSegc03xNQLd1psl2ehYtBBBA+/
	4ofT/6/e63OtfKEumSBsFbHVF0YH3OX5s9KrARDLbbP/cFkkH/zzIQO4VbnG6HWHj6YRJA38dn0jq
	PLs+E0Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnlW-00000001Ss5-08ZF;
	Tue, 26 May 2026 09:07:58 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnlS-00000001SqN-3Trr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 09:07:56 +0000
Date: Tue, 26 May 2026 11:07:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779786463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SnG9nY6P1Yh9vQhr0dwhBTn5IOyza6Sao0bVURL65+0=;
	b=d7GcO/Dmcz+576lhHN37w5VUXKPBU2A7QH8LEUj+15/ls81EcMx+intCC4nmrIbPOYys//
	rWk5kQ9+MBUqKLQ6wzo7Zf5LRugt9CYWOaPDRMEOuRB/+eqBPMLuWzGiiBT+7uHymsXPup
	tXRNf9/UR7YRcVCNP5rmV1G/4qGVZFo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rob Herring (Arm)" <robh@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] soc: imx8m: Fix match data lookup for soc device
Message-ID: <ahViAThsYgcmaxuB@bombadil>
References: <20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_020755_112877_69DFE0F5 
X-CRM114-Status: GOOD (  20.27  )
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

On Mon, Apr 27, 2026 at 09:01:48AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX8M soc device is registered via platform_device_register_simple(),
> so it is not associated with a Device Tree node and the imx8m_soc_driver
> has no of_match_table.
> 
> As a result, device_get_match_data() always returns NULL when probing
> the soc device.
> 
> Retrieve the match data directly from the machine compatible using
> of_machine_get_match_data(imx8_soc_match), which provides the correct SoC
> data.
> 
> Fixes: 2524b293a59e5 ("soc: imx8m: don't access of_root directly")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Thanks for that fix!

Tested-by: Richard Leitner <richard.leitner@linux.dev> # i.MX8MP

regards;rl

> ---
>  drivers/soc/imx/soc-imx8m.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
> index 77763a107edbd11302017e3f61ecb4369fda1ab0..fc080e56f50d423b88a673181a6bc986eb4c1691 100644
> --- a/drivers/soc/imx/soc-imx8m.c
> +++ b/drivers/soc/imx/soc-imx8m.c
> @@ -247,7 +247,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	data = device_get_match_data(dev);
> +	data = of_machine_get_match_data(imx8_soc_match);
>  	if (data) {
>  		soc_dev_attr->soc_id = data->name;
>  		ret = imx8m_soc_prepare(pdev, data->ocotp_compatible);
> 
> ---
> base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
> change-id: 20260424-soc-imx8m-fix-90d7ce2397f5
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
> 

