Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D157C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Zpl7Coq0mwV1bC2qHj28NxA+DIWTFkgsLUPDBp4G5I=; b=tA9Ah/YFYfXSEj1H9KNcRhf29O
	zRMOQATjc/fQaqSYASnFRv4rv+3ffELCnw13odfD2E/PsbPTLiCwwTLJpQDRrit4Q1Dpil8nFwr5g
	beFibkyveM3uXDIgW3V6So5cNl2mTe26jDEfz+GwrnaBcOs3hR5IeW4V+3MhvNBoZhEfNjIe+sfPm
	JgLnCZJORptgSqELaP40K1P0H3Pd0RGv6Cyqw746Y0ej1+EqXJr+oe9grINKc6CtUk23Cu9565qpZ
	r4/SvfxZK73oG7XX7cxSNcJUPHbulc6YeHsUTZ5QHQ+AdEIACRkgbCfIxdYy/qefXgaM8fyCoJsNE
	vvqthrjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjBp-0000000ABVl-3MMm;
	Wed, 19 Aug 2026 16:30:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjBp-0000000ABVX-0dAZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:30:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E289D4091D;
	Wed, 19 Aug 2026 16:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010391F000E9;
	Wed, 19 Aug 2026 16:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787157056;
	bh=+Zpl7Coq0mwV1bC2qHj28NxA+DIWTFkgsLUPDBp4G5I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=FtyWU6vDhIIYOZjLsztwDicHKWUcE+xh/XPd+Qud8/7re/ynxKXq5C9z7M1IRiTZ5
	 zSknJSvz7Im4cworHnWEAjSru9xFhMtLSYFOLU8VNxSNNWS0y9UjpIVI/gUq1MbiTD
	 B4a4Ay3CvLn7Q9RQ4pTSWdDVf0p3hGbUXIi+JcQCgR+0DCBJPFoKLYmH9CWvUr14iv
	 0fLXY3Dgtuy1PXfuXgemItplzPffgplULQfFRlrhP98kh2QJVU6fPsU8iRsbK/L2UE
	 aAtapfaw5O/+Agke2oQjxyJtvAj90mf5LwNi3LQoWZYCBDhi0DarHFK87/dXEXdBu3
	 zSwP8qMsccbvQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Zhipeng.wang_1@oss.nxp.com, Marc Zyngier <maz@kernel.org>, Frank Li
 <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 5/5] irqchip/imx-irqsteer: Allow building as module
In-Reply-To: <20260819090543.585131-6-Zhipeng.wang_1@oss.nxp.com>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-6-Zhipeng.wang_1@oss.nxp.com>
Date: Wed, 19 Aug 2026 18:30:53 +0200
Message-ID: <87qzjujcn6.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, Aug 19 2026 at 18:05, Zhipeng wrote:
> From: Jindong Yue <jindong.yue@nxp.com>
>
> Make the driver buildable as a module by turning the Kconfig symbol into
> a tristate and using module_platform_driver() instead of
> builtin_platform_driver().

That's not what the patch does.

>  	/* steer all IRQs into configured channel */
>  	if (irqsteer_has_chanctrl(data->devtype_data))
>  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> @@ -271,12 +266,21 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, data);
>  
> -	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);

All these prerequisite changes to make it possible want to be in a
separate patch and not cobbled together with the module changes.


