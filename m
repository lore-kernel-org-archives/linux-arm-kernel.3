Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E125BC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 09:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pg7DvMb2fYV//fTe62LkGLuRK+/Lp0wcIpkZuHVszkY=; b=Pcu5QzX9ORc17FZdAWXM2DXCLV
	SjlO2a2WJbfk+Dc6w5c7YEcwheu67tqhpOOxpmOYnCYBhzBBPlXmiRV+/vNYKcEVyXY6aOzc8FXhQ
	mhiPVhhWVKWkaqHGh5+66tAHULszA9HY4D/AwbZx+ugn9oDtzk0I2l+IRMAee5JOj3pp9ZRmDeY1K
	Ejy8A6U8Cx46gZVcYALVfm58bKX2wO57jMQ8YbZ7nsTMBW0aDzOiLrg8PE7AokIzOlmpFyGA9EPuv
	nPr6nsmKns2X7wZ8fAHS3B0qlkbmVybFtlzfAQgle68DaQECvg1UrZmytHZ9eBzVtWSkLnBGH+md6
	L4LFqDXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGgP-00000007Uw1-3UrK;
	Fri, 07 Aug 2026 09:16:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGgO-00000007Uvm-3K28
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 09:16:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 760DA40931;
	Fri,  7 Aug 2026 09:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB321F000E9;
	Fri,  7 Aug 2026 09:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786094163;
	bh=Pg7DvMb2fYV//fTe62LkGLuRK+/Lp0wcIpkZuHVszkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gM5wq9yWQnAPYYXGTkmekit2Yfec+NkF8DmQj6QFqzcblr37D3WrOCL3ei5NX6wfn
	 /rW7Fby2QyJyna0LBd4cS+oANqbA4UcnfXGFfDiKStL3D3A20ZFpzUCE/SDk5VtK0c
	 IQn17ohFJiURPhGGd9uzfsjrejL8lYQH4VZFY8KGE4h+MoumPUa07CPASIG87MPKSb
	 lIiCbyhPzTtNKHbPOstoUanJyJY+GYlNKSdU4w+4fpvPbKkfYkyGqQxPVVmkgIzI9i
	 aM1Dn4pJ8vkpzCIs1nPNn4BWulN2lcD4eZTfk+NpTYVMM+Q7IaYveK8UZbNx5UZIiu
	 gJYLFNiR3Mq2g==
Date: Fri, 7 Aug 2026 02:16:01 -0700
From: Peter Chen <peter.chen@kernel.org>
To: phucduc.bui@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors from
 optional IRQ lookup
Message-ID: <anWiUSPx8t-23mJx@hu-petche-lv.qualcomm.com>
References: <20260807065619.30604-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807065619.30604-1-phucduc.bui@gmail.com>
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

On 26-08-07 13:56:18, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
> probe without the IRQ.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
> 
> Link v1:
> https://lore.kernel.org/all/20260806065254.28204-1-phucduc.bui@gmail.com/
> Changes in v2:
>  - Update the commit message and error handling.
>  - Propagate all errors from platform_get_irq_optional() except -ENXIO,
>    instead of only handling -EPROBE_DEFER.
> 
>  drivers/usb/chipidea/ci_hdrc_imx.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 56d2ba824a0b..7387c9903e80 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -525,6 +525,10 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  		data->supports_runtime_pm = true;
>  
>  	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
> +	if (data->wakeup_irq < 0 && data->wakeup_irq != -ENXIO) {
> +		ret = data->wakeup_irq;
> +		goto err_clk;
> +	}
>  	if (data->wakeup_irq > 0) {
>  		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
>  		if (!irq_name) {
> -- 
> 2.43.0
> 

-- 

Thanks,
Peter Chen

