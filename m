Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEBBC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 11:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpgQCAYNbZP9siX4KCxyHdbb59bodNXUCqeNa5ZOnPA=; b=Oq7JXIBAd5bW1A4f1wb664Bcpm
	M4/j8bAw5xTNvziXDYH4h3jKHNzqhJGZHC0ha1G2O+onFbstPuCBYKgA9QA7RQviqNoss3GrfGrK0
	YK3+cmjsPWIwMzzEGMU9ma8LyyOy/HmC5L2ZI4fkqFIOnSf0UO/Gfqh1C+sDXu7fHRPm9XYoYf90x
	suHunqoSdFJnRMID2GgHytCWsJVmZYfEBzlnE6/0r4Yx1d5FpfezVOhM7tUiXYdY6Mk/9jfzBPU5z
	bQ7DWc7j9rrCceGDDirlzLfvoZH+IvNNzOWDlyb6CrUZH3xFESHXnvglWBOU6nmzJeKUgSQumcm6y
	BK6Gu7sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25KJ-0000000HAWe-3v6C;
	Thu, 03 Sep 2026 11:09:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25KJ-0000000HAWW-0sjf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 11:09:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE595434EE;
	Thu,  3 Sep 2026 11:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47351F000E9;
	Thu,  3 Sep 2026 11:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788433790;
	bh=RpgQCAYNbZP9siX4KCxyHdbb59bodNXUCqeNa5ZOnPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PfCn7SWVbDoO2Dv0Gy6DRlybrdxi4rjdOMO6LbPlP8yCsqdhTpyTjKtDeQ8uVwzB/
	 B61P4kHgi5AeKxHJcQ43nUKArsWVPJsPsgZU7Vg7EsP/quPfxJd5SF4fbekmiVi3OG
	 U3PbWyZdqa13tJXhZUMCnl1XweYOZUmgWrBsFDAicfuNGrkvwNfQ6yezqrEYZZxp/7
	 DF2O/VK1J8/QQWU2WEr7iGImUDMAcz2poGHiIN3BG/V2mHZs4kIRpUdmdC0Dks9iXe
	 Zpt2PPONDX0uj6WV+ge53QpqWnfYsPvP6HpvpnIfWEEKN5FTTmSdxLP9A2KLd75dZj
	 Rq0V3VP+p9PFw==
Date: Thu, 3 Sep 2026 13:09:46 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jiangshan Yi <yijiangshan@kylinos.cn>
Cc: maz@kernel.org, tglx@kernel.org, radu@rendec.net,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	13667453960@163.com
Subject: Re: [PATCH v2] irqchip/gic-v5: Install root IRQ handler last in
 gicv5_init_common()
Message-ID: <aplVev7iGTgUglQS@red-moon>
References: <20260903104014.587068-1-yijiangshan@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903104014.587068-1-yijiangshan@kylinos.cn>
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

On Thu, Sep 03, 2026 at 06:40:14PM +0800, Jiangshan Yi wrote:
> set_handle_irq() cannot be undone: once a handler is installed, any
> further call returns -EBUSY, so the set_handle_irq(NULL) in the error
> path has never worked.  Drop it, and install the root handler only
> after gicv5_irs_enable() has succeeded.

Thank you.

Yes, that's what I should have done instead of trying to undo a fatal error.

> set_handle_irq() only fails if another root handler is already
> installed, which cannot happen on a GICv5 system.  Should it ever

Nit: define "cannot happen". It should not happen.

> fail, the system is unusable: panic instead of unwinding.

Yes that's what needs to be done instead of trying to fix things up that are
clearly fatal.

Apologies for this churn.

> Link: https://lore.kernel.org/r/87fqzrmywu.wl-maz@kernel.org
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
> ---
>  drivers/irqchip/irq-gic-v5.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> index ac2d423b1723..c365f8150300 100644
> --- a/drivers/irqchip/irq-gic-v5.c
> +++ b/drivers/irqchip/irq-gic-v5.c
> @@ -1166,21 +1166,18 @@ static int __init gicv5_init_common(struct fwnode_handle *parent_domain)
>  	if (ret)
>  		goto out_int;
>  
> -	ret = set_handle_irq(gicv5_handle_irq);
> +	ret = gicv5_irs_enable();
>  	if (ret)
>  		goto out_int;
>  
> -	ret = gicv5_irs_enable();
> -	if (ret)
> -		goto out_handle;
> +	if (set_handle_irq(gicv5_handle_irq))
> +		panic("GICv5: unable to install root IRQ handler\n");
>  
>  	gicv5_smp_init();
>  
>  	gicv5_irs_its_probe();
>  	return 0;
>  
> -out_handle:
> -	set_handle_irq(NULL);
>  out_int:
>  	gicv5_cpu_disable_interrupts();
>  	gicv5_free_domains();
> -- 
> 2.25.1
> 

