Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA9FCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 09:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ax7KqD/uy4eSTXY3C6QoBf9qnVWl+cbh3e+fFi2XyFk=; b=ChEr4A1akJxT5qEkCvsdDtx73e
	h8WYlfOXb9BGWkOVrV0nHL+AqqP4D1DjtZ0TmN3XTKT8nzV0RRtRC1FRcb1vyq0v92EX5Jyii9eRj
	DNWwFv2UUplZ7BpLB1NANKzcrigZaMbIG1W5Y4extvJiJsKtDr/bMjgP4bWpBzgJ7zfubK7d+hTRl
	+gFRn4qv+oCnSdY7pxaIamB9orWK66+SQBvfw9hLxpcJcfT0EAlFtxHk0HzSAE+LhPxdwE2cA46oc
	/P1M5Zosb7VmAhg9NrDQN2vMgDwVgSQXjsISh6uVxdZxDcYru4eKNVFC8cmfMETEjn5j0ZhzwJTeX
	xaXL3KRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFSG-00000007IX1-3hKK;
	Wed, 10 Jun 2026 09:42:36 +0000
Received: from akranes.kaiser.cx ([2a0a:4cc0:1:11ef:4484:ccff:febf:ddfa])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFSE-00000007IWS-3U1s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 09:42:36 +0000
Received: from ipservice-092-209-184-216.092.209.pools.vodafone-ip.de ([92.209.184.216] helo=nb282.user.codasip.com)
	by akranes.kaiser.cx with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <martin@kaiser.cx>)
	id 1wXFS7-00000002FrG-018Q;
	Wed, 10 Jun 2026 11:42:27 +0200
Date: Wed, 10 Jun 2026 11:42:27 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Weigang He <geoffreyhe2@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: imx: avic: fix device_node refcount leaks in
 mxc_init_irq()
Message-ID: <aikxg5xtXWccXPO8@nb282.user.codasip.com>
References: <20260610053115.2263570-1-geoffreyhe2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610053115.2263570-1-geoffreyhe2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_024234_886658_6A953204 
X-CRM114-Status: GOOD (  21.52  )
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

Hi,

Thus wrote Weigang He (geoffreyhe2@gmail.com):

> mxc_init_irq() obtains two device_node references via
> of_find_compatible_node() and never releases either one:

>   - The "fsl,imx25-ccm" node (looked up to map the CCM low-power
>     interrupt mask registers on i.MX25) is stored in np, used by
>     of_iomap(), and then the same np variable is overwritten by the
>     second of_find_compatible_node() call without an of_node_put().
>     On i.MX25 this leaks the node reference on every boot.

>   - The "fsl,avic" node is passed via of_fwnode_handle(np) to
>     irq_domain_create_legacy(), which takes its own reference on the
>     fwnode through fwnode_handle_get(), so the caller's reference is
>     not transferred. np is then leaked at function return.

> Both lookups predate the switch to irq_domain_create_*(); the missing
> puts have been there since the code was introduced.

> Drop each reference once the value derived from it is no longer needed:
> after of_iomap() has mapped the CCM registers, and after
> irq_domain_create_legacy() has taken its own fwnode reference.
> of_node_put() is NULL-safe, so platforms without these nodes are
> unaffected.

> Found by static analysis tool CodeQL.

> Fixes: 544496ab5cbd ("ARM: imx: move irq_domain_add_legacy call into avic driver")
> Fixes: 9b454d16e57d ("ARM: imx: avic: set low-power interrupt mask for imx25")
> Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
> ---
>  arch/arm/mach-imx/avic.c | 2 ++
>  1 file changed, 2 insertions(+)

> diff --git a/arch/arm/mach-imx/avic.c b/arch/arm/mach-imx/avic.c
> index 3067c06b4b8eb..6873a50bbe2c0 100644
> --- a/arch/arm/mach-imx/avic.c
> +++ b/arch/arm/mach-imx/avic.c
> @@ -173,6 +173,7 @@ static void __init mxc_init_irq(void __iomem *irqbase)

>  	np = of_find_compatible_node(NULL, NULL, "fsl,imx25-ccm");
>  	mx25_ccm_base = of_iomap(np, 0);
> +	of_node_put(np);

>  	if (mx25_ccm_base) {
>  		/*
> @@ -203,6 +204,7 @@ static void __init mxc_init_irq(void __iomem *irqbase)
>  	np = of_find_compatible_node(NULL, NULL, "fsl,avic");
>  	domain = irq_domain_create_legacy(of_fwnode_handle(np), AVIC_NUM_IRQS, irq_base, 0,
>  					  &irq_domain_simple_ops, NULL);
> +	of_node_put(np);
>  	WARN_ON(!domain);

>  	for (i = 0; i < AVIC_NUM_IRQS / 32; i++, irq_base += 32)

> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
> -- 
> 2.43.0

Reviewed-by: Martin Kaiser <martin@kaiser.cx>

Thanks,
Martin

