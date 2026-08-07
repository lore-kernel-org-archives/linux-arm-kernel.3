Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E227C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 09:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7ec1MAaLSrg+5NsLC9YQbEha+OGHi2z9xOVUn2F/yk=; b=bQoyLnl/vpE1IBakvg/LnfP3Qy
	YGKGOeTAZ6ywzd2aNTUw3p9bFrSlkFp9F5QiuZeD+sHeBzS9439RteTP58rXATnR1ijfEyb09LfKp
	2K/sUiQ6sokzXuVJ1dAaTYuCX/AfKxbt7HyDbHGMFDoju2dq0xl9mAFWWNFBetniyODVBLLKb/gvH
	eI9K/P91tZ2U/ZlLj+5ro3bM4pXJoH+3whBYnCgQAGUHrsOHM+APw5fpwK7r7cuYCKf9AuAP2a+ci
	gV7uOkWPy5/MGrR+4IilEGkZnbGf0cG0b1v8MOyl1UnfQO3SyJH3UhUaSP+tlOtv0Teoo3fPGbZOE
	HjJsds8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGkL-00000007VMq-2Jx2;
	Fri, 07 Aug 2026 09:20:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGkJ-00000007VMO-49yM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 09:20:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 50F6140A65;
	Fri,  7 Aug 2026 09:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C201F000E9;
	Fri,  7 Aug 2026 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786094407;
	bh=E7ec1MAaLSrg+5NsLC9YQbEha+OGHi2z9xOVUn2F/yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gTYw9Jw4rKUnWD8c1POQJDK2AIK1dgg8xDhsdQ4rnYjZ0a8y+8TBZ2vc8zxtSGEMs
	 zJQqqsKQ4sOgs73d1uIg3YNt5wXuhH6HsJHY61kNulPYCxZD7LwdO37X99F5ot+CdT
	 jo3esRV0BgDoSrTwdHVyVOPeqDH8K17XzCJVEAdmkzyJ4XkFg1bbG5SNEOtGtvUZyL
	 sM9Q79qFPKy2+4YlR9owU27d3Z43Um5WyxKxEeyFtG26zQrlP867a6A6bdKO+Xae3x
	 XY7rN9QIYQ7ZkoHiiHSu1I6mzl9/sU+9zweiRZxVhIrvZY1mBejBZevZeiInkWV+SH
	 hitxayXYEy/nQ==
Date: Fri, 7 Aug 2026 02:20:05 -0700
From: Peter Chen <peter.chen@kernel.org>
To: phucduc.bui@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sashiko Bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling
 when creating IRQ name
Message-ID: <anWjRa2YlEKT_uJq@hu-petche-lv.qualcomm.com>
References: <20260807065619.30604-1-phucduc.bui@gmail.com>
 <20260807065619.30604-2-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807065619.30604-2-phucduc.bui@gmail.com>
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

On 26-08-07 13:56:19, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> devm_kasprintf() can fail when allocating the wakeup IRQ name. The error
> was logged with dev_err_probe(), but its return value was ignored and
> probe could continue with a successful return value.
> 
> Store the error returned by dev_err_probe() in ret and jump to the error
> path to propagate the failure.
> 
> Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/all/20260806065755.C9F361F000E9@smtp.kernel.org/
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
> 
>  drivers/usb/chipidea/ci_hdrc_imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 7387c9903e80..ec2280ae82dc 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -532,7 +532,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	if (data->wakeup_irq > 0) {
>  		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
>  		if (!irq_name) {
> -			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> +			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
>  			goto err_clk;
>  		}
>  
> -- 
> 2.43.0
> 

-- 

Thanks,
Peter Chen

