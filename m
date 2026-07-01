Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AE8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFwcgrMP51FdJfNWjgX6FQceDh7Uf7KWJsHpwmCExdo=; b=C+8/GG0Gfulkz8OPtuRYtQXJii
	AyrPakefzS1NXkTsE5xN9h9ao6xeE8Mi7SkmiNNeyA/cdOe0Q3iKzMdNGooL7r6K/4r0I/EJK+8PM
	pTkfs1kWuGLW5ApVEtax3KxvhwZuMYUBC7rJ10X9QWeZCwCIzibm1KRk4pwbXbX12BVdib8e2xTAs
	Ihovd2+E+gZAwRBKuJhl89Llr59eR8DEn133eGXr/QX7e92RcKWwIjTr9fdaZ7BuBWY7f7TJxIE14
	CZd7la/ibtpeP4aJKjsoHx2WH55vS5VyZXCsEm3f2fsD48U0Sg5jJAu5Eitu/slZogIm7OSLQLiUy
	s1nDKXzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2i4-0000000347Q-2Jha;
	Wed, 01 Jul 2026 21:43:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2i2-0000000347I-1Nro
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:43:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D6286001D;
	Wed,  1 Jul 2026 21:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3321F000E9;
	Wed,  1 Jul 2026 21:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782942185;
	bh=vFwcgrMP51FdJfNWjgX6FQceDh7Uf7KWJsHpwmCExdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XZmWjkPnZK3fkjIVsPg1IyLY5CsScRyUNdbZxQFLSIwscN+BYy+ERMpHK2ogQiuBz
	 JeYxxPyvX+ovMYt6mij4IwrooXgbS3Hg7PYqCaRQVtdb+38SfNOWea/tNy7ipj9zTo
	 de4wi6l5s5PfEFyoadMxTBRhuMOR60ag5jXs0CERFb8vZ5j77huBoi5sqWVSj2PH48
	 UyIgW1Cts26zju64SNMXOLPN1dHnJ+LaZRTnLbREK9htdd5OnaDquZPMILdjsKthZt
	 sXSaiHzHi/naigFUi+gLwh591pzvhUdUS/MwFSulvWA7aOJUWGIbJfoBcwOg/q6xJ5
	 pz7IRow2H3DRQ==
Date: Wed, 1 Jul 2026 22:42:50 +0100
From: Lee Jones <lee@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: stm32-timers: depopulate child devices on populate
 failure
Message-ID: <20260701214250.GD2108533@google.com>
References: <20260615063042.36397-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615063042.36397-1-pengpeng@iscas.ac.cn>
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

On Mon, 15 Jun 2026, Pengpeng Hou wrote:

> stm32_timers_probe() releases the timer DMA resources when
> of_platform_populate() fails, but it does not depopulate any child
> devices that were created before the failure.
> 
> The remove path explicitly depopulates child devices before releasing
> DMA resources to avoid races with children using DMA.  Apply the same
> ordering on the populate failure path.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/mfd/stm32-timers.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/stm32-timers.c b/drivers/mfd/stm32-timers.c
> index b3dbc02aaf79..1f0aecae83a5 100644
> --- a/drivers/mfd/stm32-timers.c
> +++ b/drivers/mfd/stm32-timers.c
> @@ -329,8 +329,10 @@ static int stm32_timers_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, ddata);
>  
>  	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> -	if (ret)
> +	if (ret) {
> +		of_platform_depopulate(&pdev->dev);

It's strange to see an un-winder inside the error handling of its
original call.  We're used to seeing them called only on success during
a subsequent step.

Wouldn't devm_of_platform_populate() be better here instead?

>  		stm32_timers_dma_remove(dev, ddata);
> +	}
>  
>  	return ret;
>  }
> -- 
> 2.50.1 (Apple Git-155)
> 

-- 
Lee Jones

