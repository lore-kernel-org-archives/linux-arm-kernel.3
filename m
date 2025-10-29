Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A274ECCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=2XX/5rMl5M7waHNttl+P5V8RxDNoEAxbGh8REpvOdK8=; b=wo9jOAI/+vHWRx
	8iyAmmGIN7irCKsxoNyXNzH0x6J6oDnb8AIfyq8FWURogHv+qDTE7u7dOFsQNfOUVWtlXIkQPHCbK
	XBp9vYA8bj6MXfNfbFJed1eCZJzW1zB4UOPjdXr98pbZ38YaJvdtz6cnNb/F9BkbqnLWPjkG+mCqu
	Wh3iD3fedtrHK1v9y+L7u+YsRPZZ2Z1oUzDpxeToeslb5WnUATH5qi9Sdla9m7KRvdNZz+d2sEksT
	kKiaK0iZr45Ehq6URFh61K0DVeQXvX5sh5Iz+sgKyZvUX1ttW4MQSVOYV5ILSLE0gfwd7ALMf2oJC
	eLLShwOzA1SqdTFIDq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAPk-00000002IKE-0ymj;
	Wed, 29 Oct 2025 17:56:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAPi-00000002IJZ-0lQt;
	Wed, 29 Oct 2025 17:56:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 568C561F0D;
	Wed, 29 Oct 2025 17:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA482C4CEF7;
	Wed, 29 Oct 2025 17:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761760609;
	bh=VzK5oAorESm47QWMsddWXTePfWCCmkkIk79NLObV5bc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=WefDjtFQxaqNITeCzyBwduPSq6eq7KGJtsT2AF0tpE+HPH+tjK4IzpZavlRn/5XsQ
	 bAqy+ezFjPZQf9TOZPQl6LXTvXW9IfgUJjbAoy5vs36s3bfKfYzKQg/z1bubPH73jh
	 1ItJud1AeLXZlnq4bcVqu3rpaUAMlJkdHmPuONikaXEvzkph5eumYyBiA1nwLpgQr4
	 QSEpHgWx8G4kOS7ej8Kp+v5EZVkYD3yl7v3+XLUa3lNShkcaOmr1AUVB0MzBpFpGOj
	 pC344FC62eHwyUuXg2zk98jn071eznE2X1eDI8XnNdAIINuY4R7ZrZ6Wl5YCNKdj1p
	 /8lus9PKvBXYA==
Date: Wed, 29 Oct 2025 12:56:47 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] clk: ingenic: tcu: Use contextual data instead of
 global variable
Message-ID: <20251029175647.GA1572736@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029163336.2785270-5-thierry.reding@gmail.com>
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

On Wed, Oct 29, 2025 at 05:33:33PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Pass the driver-specific data via the syscore struct and use it in the
> syscore ops.

Some of these things in drivers/clk/ are also platform_device drivers
(though not this one) and use generic power management, e.g.,

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/qcom/q6sstop-qcs404.c?id=v6.17#n209

I have no idea if that's desirable or practical here, but using the
platform_device model instead of syscore could have advantages in
terms of modeling device dependencies and ordering.

> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - adjust for API changes and update commit message
> 
>  drivers/clk/ingenic/tcu.c | 63 +++++++++++++++++++--------------------
>  1 file changed, 30 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
> index bc6a51da2072..8c6337d8e831 100644
> --- a/drivers/clk/ingenic/tcu.c
> +++ b/drivers/clk/ingenic/tcu.c
> @@ -53,9 +53,9 @@ struct ingenic_tcu {
>  	struct clk *clk;
>  
>  	struct clk_hw_onecell_data *clocks;
> -};
>  
> -static struct ingenic_tcu *ingenic_tcu;
> +	struct syscore syscore;
> +};
>  
>  static inline struct ingenic_tcu_clk *to_tcu_clk(struct clk_hw *hw)
>  {
> @@ -332,6 +332,29 @@ static const struct of_device_id __maybe_unused ingenic_tcu_of_match[] __initcon
>  	{ /* sentinel */ }
>  };
>  
> +static int __maybe_unused tcu_pm_suspend(void *data)
> +{
> +	struct ingenic_tcu *tcu = data;
> +
> +	if (tcu->clk)
> +		clk_disable(tcu->clk);
> +
> +	return 0;
> +}
> +
> +static void __maybe_unused tcu_pm_resume(void *data)
> +{
> +	struct ingenic_tcu *tcu = data;
> +
> +	if (tcu->clk)
> +		clk_enable(tcu->clk);
> +}
> +
> +static const struct syscore_ops tcu_pm_ops __maybe_unused = {
> +	.suspend = tcu_pm_suspend,
> +	.resume = tcu_pm_resume,
> +};
> +
>  static int __init ingenic_tcu_probe(struct device_node *np)
>  {
>  	const struct of_device_id *id = of_match_node(ingenic_tcu_of_match, np);
> @@ -430,7 +453,11 @@ static int __init ingenic_tcu_probe(struct device_node *np)
>  		goto err_unregister_ost_clock;
>  	}
>  
> -	ingenic_tcu = tcu;
> +	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
> +		tcu->syscore.ops = &tcu_pm_ops;
> +		tcu->syscore.data = tcu;
> +		register_syscore(&tcu->syscore);
> +	}
>  
>  	return 0;
>  
> @@ -455,42 +482,12 @@ static int __init ingenic_tcu_probe(struct device_node *np)
>  	return ret;
>  }
>  
> -static int __maybe_unused tcu_pm_suspend(void *data)
> -{
> -	struct ingenic_tcu *tcu = ingenic_tcu;
> -
> -	if (tcu->clk)
> -		clk_disable(tcu->clk);
> -
> -	return 0;
> -}
> -
> -static void __maybe_unused tcu_pm_resume(void *data)
> -{
> -	struct ingenic_tcu *tcu = ingenic_tcu;
> -
> -	if (tcu->clk)
> -		clk_enable(tcu->clk);
> -}
> -
> -static const struct syscore_ops __maybe_unused tcu_pm_ops = {
> -	.suspend = tcu_pm_suspend,
> -	.resume = tcu_pm_resume,
> -};
> -
> -static struct syscore __maybe_unused tcu_pm = {
> -	.ops = &tcu_pm_ops,
> -};
> -
>  static void __init ingenic_tcu_init(struct device_node *np)
>  {
>  	int ret = ingenic_tcu_probe(np);
>  
>  	if (ret)
>  		pr_crit("Failed to initialize TCU clocks: %d\n", ret);
> -
> -	if (IS_ENABLED(CONFIG_PM_SLEEP))
> -		register_syscore(&tcu_pm);
>  }
>  
>  CLK_OF_DECLARE_DRIVER(jz4740_cgu, "ingenic,jz4740-tcu", ingenic_tcu_init);
> -- 
> 2.51.0
> 

