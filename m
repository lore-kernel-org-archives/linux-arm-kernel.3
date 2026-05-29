Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B9BCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 21:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ew7EaXDf+CetOXIPNgp4VIOFryqMnNlS6SuVadEO47g=; b=ZjKYclZFoNF8S6DNSaootBT4qT
	9xTYrpXUaVBQOADS1eCnZ8ZcM4OFfTgw4B2jxU1I1QYkieX+HepmPeQwjl9TYD643egR+5OHvg6IJ
	/Jm8DpRbFuVQj1C2Pk+dqRdadaoj+kUoKo3aj2A4g3rV/rv34aWzbb/KXVrYUgECUKjcMRv5N0mMT
	bOdIUBCToqR6/yJYWjE90S6uARrDaLBxVvGBXHlpRVrMphjH9UJG3fGpYSAeK1zsAgcSYBeoZKtUK
	V6fIUnhopA5svLJNUMuRL7JPnSzkosUO33Cc6xfoQTOaJOsYckB/5Nsg5KEWwS4Y/ZSfCpPq55A0u
	bjPJZhEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT4M4-00000008Ees-3FLk;
	Fri, 29 May 2026 21:02:56 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT4M1-00000008EeO-3sXo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 21:02:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 53F3C1A3737;
	Fri, 29 May 2026 21:02:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B980A601FA;
	Fri, 29 May 2026 21:02:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FB5510888054;
	Fri, 29 May 2026 23:02:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780088566; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Ew7EaXDf+CetOXIPNgp4VIOFryqMnNlS6SuVadEO47g=;
	b=M8O8mcXZxK9rJoNSMB5rnm8quxy6IVgY6oZBPO5DnbxV0hnjayRtTcRDfeNFPhDf9ynznQ
	m2Aa9MVU91cS/LDH7Zy9O42I4Bo2ADUwAVnJOEhtsv60qp8eOC94k0/3Ro0mua8TGsKlLt
	PSNS7usl4x5uRbmJhhPRDeaquKz99AnVAzFUnR4TTUCsAqJMsVSgQ++PFGKAl3mmfauhOx
	ZV3T/OhSmwLjLT/CarI+s3G+tncMJR5C2JVipCC9AKL5FFEMBUT2HTXD/n0RHfE/YWe7x9
	jsOEMduGogQX0X4VViTfxpUSY3dbRor+7juh3P6MznSdyTUX2pn8pvJ96HvXPw==
Date: Fri, 29 May 2026 23:02:43 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Brian Masney <bmasney@redhat.com>, Kees Cook <kees@kernel.org>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Thierry Reding <treding@nvidia.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: at91: keep securam node alive while mapping it
Message-ID: <20260529210243877820a5@mail.local>
References: <20260529042051.1626978-1-dbgh9129@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529042051.1626978-1-dbgh9129@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_140254_116629_F4A15DA6 
X-CRM114-Status: GOOD (  16.84  )
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

On 29/05/2026 00:20:51-0400, Yuho Choi wrote:
> pmc_register_ops() gets an owned reference to the
> "atmel,sama5d2-securam" node with of_find_compatible_node().  The
> success path dropped that reference before passing the node to
> of_iomap(), leaving of_iomap() to consume a node pointer after the caller
> had released its reference.
> 
> Move of_node_put() after of_iomap() so the node remains referenced for
> the mapping operation.  The unavailable-node error path already releases
> the reference.
> 
> Fixes: 4d21be864092 ("clk: at91: pmc: execute suspend/resume only for backup mode")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/clk/at91/pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
> index b618a5e00b00..03a6c31d6aa8 100644
> --- a/drivers/clk/at91/pmc.c
> +++ b/drivers/clk/at91/pmc.c
> @@ -180,9 +180,9 @@ static int __init pmc_register_ops(void)
>  		of_node_put(np);
>  		return -ENODEV;
>  	}
> -	of_node_put(np);
>  
>  	at91_pmc_backup_suspend = of_iomap(np, 0);
> +	of_node_put(np);
>  	if (!at91_pmc_backup_suspend) {
>  		pr_warn("%s(): unable to map securam\n", __func__);
>  		return -ENOMEM;
> -- 
> 2.43.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

