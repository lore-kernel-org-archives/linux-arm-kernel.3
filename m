Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4F1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qUoihBbWwdb5RpFCwCmGLNkvB2q5zt4WFGb/HiOMDI=; b=HxPcirJFD6tQi9HwY3oeFdRFpz
	j6FDnIL7j6b7YBsPtw/BaRYIsXDY5CtmYSUVwDnElWX7J4t/x6ANSRaVKSKgykRpPHdu/tBSP6gjy
	Clzuu3j40ss9O1lGuw4tkvmkcZGz6n+myKxeBEOQESasHimZ9B8KP3aRYbIcd6o/N69I+PGU7P6L1
	21Xu82D1iYo50y2nmV/d48/1bK0PiLt0wWivEv720m61XkCS/mvl0OukSYs0eR8mSa6rrhAKq+XCP
	G3r2UfjUzKRMhC1qH9xMzzf2JqB3uRcFKSLdDN6bGCX1+ndXWnLf/azpfNcJWxtAZ8SXm2SEDUrz2
	5list9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFmY-0000000FbgR-0hCQ;
	Fri, 10 Jan 2025 14:14:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFhh-0000000Famb-26zH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 14:09:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0000E5C4B07;
	Fri, 10 Jan 2025 14:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57E6C4CED6;
	Fri, 10 Jan 2025 14:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736518176;
	bh=BzqU8k0ICGCf9P2lsYRHW6RrSoUUVhJhmDeNcCF/upo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N6X4Ck3DIAaxq3dwu9LnBtCtQSYh1wtLY1sQXIYSQN56fTof/Xt1fvalaxdOFbTLi
	 Xwv27NKD1oxDtn6rSZxzZSxBEJOyFvIm9GhEQlykxWNvYlbtJ5WAeUuD/p03dP3Yrn
	 jOJehV+J3FPIWMqhSQtixHYW4fv6TN6peeBW7F1guMNAwVwWyK/hg0d/wLIdGsZ3qy
	 H9aSS2gzYJ29a3ssBvXWE/Uyq00zQxi+0Km5opq1OUpxzMim2zzufjoIcHKxC1qBBx
	 E/+7FbVph1WDoZuWuNt19NHrJQfzAfUiGIzKJcn+xuv1gpZ/GqNj1FDCKRxx8aRhBE
	 HcKWtu0yCHMJQ==
Date: Fri, 10 Jan 2025 08:09:34 -0600
From: Rob Herring <robh@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [RFC PATCH 5/6] bus: qcom-sc7180: Attach pm domain to watchdog
 device
Message-ID: <20250110140934.GB2630182-robh@kernel.org>
References: <20250108012846.3275443-1-swboyd@chromium.org>
 <20250108012846.3275443-6-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108012846.3275443-6-swboyd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_060937_618824_80E9D476 
X-CRM114-Status: GOOD (  27.00  )
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

On Tue, Jan 07, 2025 at 05:28:42PM -0800, Stephen Boyd wrote:
> Find the watchdog device described as a child node of the sc7180 SoC
> node and attach a generic pm domain to the device before registering the
> device with the platform bus. The domain simply gets the clk and turns
> it on when the pm domain is powered on and turns it off when the pm
> domain is powered off.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/bus/qcom/qcom-sc7180.c | 122 +++++++++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 
> diff --git a/drivers/bus/qcom/qcom-sc7180.c b/drivers/bus/qcom/qcom-sc7180.c
> index a615cf5a2129..7dfe6b32efef 100644
> --- a/drivers/bus/qcom/qcom-sc7180.c
> +++ b/drivers/bus/qcom/qcom-sc7180.c
> @@ -3,18 +3,140 @@
>   * SoC bus driver for Qualcomm SC7180 SoCs
>   */
>  
> +#include <linux/cleanup.h>
> +#include <linux/clk.h>
>  #include <linux/device.h>
> +#include <linux/dev_printk.h>
>  #include <linux/init.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/pm_domain.h>
> +
> +struct qcom_soc_pm_domain {
> +	struct clk *clk;
> +	struct generic_pm_domain pd;
> +};
> +
> +static struct qcom_soc_pm_domain *
> +gpd_to_qcom_soc_pm_domain(struct generic_pm_domain *gpd)
> +{
> +	return container_of(gpd, struct qcom_soc_pm_domain, pd);
> +}
> +
> +static struct qcom_soc_pm_domain *pd_to_qcom_soc_pm_domain(struct dev_pm_domain *pd)
> +{
> +	struct generic_pm_domain *gpd;
> +
> +	gpd = container_of(pd, struct generic_pm_domain, domain);
> +
> +	return gpd_to_qcom_soc_pm_domain(gpd);
> +}
> +
> +static struct qcom_soc_pm_domain *dev_to_qcom_soc_pm_domain(struct device *dev)
> +{
> +	struct dev_pm_domain *pd;
> +
> +	pd = dev->pm_domain;
> +	if (!pd)
> +		return NULL;
> +
> +	return pd_to_qcom_soc_pm_domain(pd);
> +}
> +
> +static struct platform_device *
> +qcom_soc_alloc_device(struct platform_device *socdev, const char *compatible)
> +{
> +	struct device_node *np __free(device_node);
> +
> +	np = of_get_compatible_child(socdev->dev.of_node, compatible);
> +
> +	return of_platform_device_alloc(np, NULL, &socdev->dev);
> +}
> +
> +static int qcom_soc_domain_activate(struct device *dev)
> +{
> +	struct qcom_soc_pm_domain *soc_domain;
> +
> +	dev_info(dev, "Activating device\n");
> +	soc_domain = dev_to_qcom_soc_pm_domain(dev);
> +
> +	soc_domain->clk = devm_clk_get(dev, NULL);
> +
> +	return PTR_ERR_OR_ZERO(soc_domain->clk);
> +}
> +
> +static int qcom_soc_domain_power_on(struct generic_pm_domain *domain)
> +{
> +	struct qcom_soc_pm_domain *soc_domain;
> +
> +	pr_info("Powering on device\n");
> +	soc_domain = gpd_to_qcom_soc_pm_domain(domain);
> +
> +	return clk_prepare_enable(soc_domain->clk);
> +}
> +
> +static int qcom_soc_domain_power_off(struct generic_pm_domain *domain)
> +{
> +	struct qcom_soc_pm_domain *soc_domain;
> +
> +	pr_info("Powering off device\n");
> +	soc_domain = gpd_to_qcom_soc_pm_domain(domain);
> +
> +	clk_disable_unprepare(soc_domain->clk);

How's this going to scale when there are multiple clocks and it's not 
just turn on/off all the clocks in any order? Or when there's ordering 
requirements between different resources.

I'm pretty sure I've seen attempts to order clock entries in DT based on 
the order they want to enable them.

> +
> +	return 0;
> +}
> +
> +static int qcom_soc_add_clk_domain(struct platform_device *socdev,
> +				   struct platform_device *pdev)
> +{
> +	struct qcom_soc_pm_domain *domain;
> +	struct generic_pm_domain *pd;
> +	int ret;
> +
> +	domain = devm_kzalloc(&socdev->dev, sizeof(*domain), GFP_KERNEL);
> +	if (!domain)
> +		return -ENOMEM;
> +
> +	pd = &domain->pd;
> +	pd->name = "wdog";
> +	ret = pm_genpd_init(pd, NULL, false);
> +	if (ret)
> +		return ret;
> +
> +	/* TODO: Wrap this in a generic_pm_domain function similar to power_on() */
> +	pd->domain.activate = qcom_soc_domain_activate;
> +	pd->power_on = qcom_soc_domain_power_on;
> +	pd->power_off = qcom_soc_domain_power_off;
> +
> +	dev_info(&socdev->dev, "adding pm domain for %s\n", dev_name(&pdev->dev));
> +	dev_pm_domain_set(&pdev->dev, &pd->domain);
> +
> +	return 0;
> +}
>  
>  static int qcom_soc_sc7180_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> +	struct platform_device *sdev;
> +	int ret;
> +
> +	sdev = qcom_soc_alloc_device(pdev, "qcom,apss-wdt-sc7180");

We're going to have to have an explicit call for every child node?

> +	if (!sdev)
> +		return dev_err_probe(dev, -ENODEV, "Failed to alloc sdev\n");
> +
> +	ret = qcom_soc_add_clk_domain(pdev, sdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add clk domain to sdev\n");
> +
> +	ret = of_platform_device_add(sdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add sdev to bus\n");
>  
>  	return of_platform_populate(np, NULL, NULL, dev);
>  }
> -- 
> https://chromeos.dev
> 

