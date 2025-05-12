Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEC6C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 15:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bulm+OAY6G9mwFtOIOO/nNbm8lthx9J/UosG91L7fxY=; b=MjBn3UMCUBnxFN7dcG/P4uRlRv
	7FmGrGG/J8dGebxZFWKYg2D3aU0+/iILWFqKu97xfIYH/WnMlbf0CjN+UJWYNfQHj5282khwxytO9
	oHvU+YaEjOvyLzVvZbqWzN8C7fzEq2tbgzFJ7abpMoxsVSwTBR2TMTVJ+mHzUQqBPe5rmXJBVhURI
	xrv3fcMgx6RZtXT06V7Ya0QWmPFG/4lW2sZhkCvbHtWHy+fgCEkmb1eYEY52mKMY73Menq8MtocxU
	30+N29ZlGcKj6C7RdoK/DsVYoVgHKLLiDrMeKqY1iuGQVFmh+E/pvQLmk6Al2RLjUglnLMpMzBc5/
	EbS+/gag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUeE-00000009pL3-2TCn;
	Mon, 12 May 2025 15:00:54 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUA2-00000009jcG-2OFy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 14:29:43 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747060180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bulm+OAY6G9mwFtOIOO/nNbm8lthx9J/UosG91L7fxY=;
	b=4rinRmW/uHX018N9DTYr1SW3h7Gu25O2gbpdwtFNhPlVbNQvUwcr9VHWmVpF3nfsYzqqmc
	KVce5f4CcEK9fIKVKT0LGr1vwauRVdMqo6Zeosa4WxKBPuKdxrWmxXQWRU53sNvP4Eg04H
	bdMUpaO2SBM1JzYM/GpCWzXbxomu1h5XIHxQAIktWV1ZeTSoz1iq1xqYBBv+ZH1YyXah0c
	ml30ow+kz8VjwD9/kmNpLQGMa5ssSvMRjk6UjPiYbiTCyp3Wx908+6gCvMd5QKcf9Kfrev
	mFrJwvC8ijh/viUhHQRt3bhXB22TGZ6tSwCvbt5Szvg+Di3gbkrMvnnSP4OEEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747060180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bulm+OAY6G9mwFtOIOO/nNbm8lthx9J/UosG91L7fxY=;
	b=hdgwawyoaz9LAbwRHhGPcvSIjfXofFwW37OX343vDtRGeIc57x8igVldAwumhSllL9Gpi1
	3YktCIBb4sSGy1Bg==
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH 1/4] genirq/msi: Add .msi_teardown() callback as the
 reverse of .msi_prepare()
In-Reply-To: <20250511163520.1307654-2-maz@kernel.org>
References: <20250511163520.1307654-1-maz@kernel.org>
 <20250511163520.1307654-2-maz@kernel.org>
Date: Mon, 12 May 2025 16:29:39 +0200
Message-ID: <87h61plx64.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_072942_757452_EB7071ED 
X-CRM114-Status: GOOD (  15.24  )
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

On Sun, May 11 2025 at 17:35, Marc Zyngier wrote:

> While the MSI ops do have a .msi_prepare() callback that is
> responsible for setting up the relevant (usually per-device)
> allocation, we don't have a callback reversing this setup.

..., there is no callback reversing ...

> For this purpose, let's a .msi_teardown() callback. This is

'let's a ...' is not a sentence. Just say: add a .... calback.

> reliying on the msi_domain_info structure having a non-NULL

  ^^^^^ spell check is your friend.

> alloc_data field.
>
> Nobody is populating this field yet, so there is no change

No driver is ..

>  
> +static void msi_domain_ops_teardown(struct irq_domain *domain,
> +				    msi_alloc_info_t *arg)

No line break required.

> +{
> +}
> +
>  static void msi_domain_ops_set_desc(msi_alloc_info_t *arg,
>  				    struct msi_desc *desc)
>  {
> @@ -821,6 +826,7 @@ static struct msi_domain_ops msi_domain_ops_default = {
>  	.get_hwirq		= msi_domain_ops_get_hwirq,
>  	.msi_init		= msi_domain_ops_init,
>  	.msi_prepare		= msi_domain_ops_prepare,
> +	.msi_teardown		= msi_domain_ops_teardown,
>  	.set_desc		= msi_domain_ops_set_desc,
>  };
>  
> @@ -842,6 +848,8 @@ static void msi_domain_update_dom_ops(struct msi_domain_info *info)
>  		ops->msi_init = msi_domain_ops_default.msi_init;
>  	if (ops->msi_prepare == NULL)
>  		ops->msi_prepare = msi_domain_ops_default.msi_prepare;
> +	if (ops->msi_teardown == NULL)
> +		ops->msi_teardown = msi_domain_ops_default.msi_teardown;
>  	if (ops->set_desc == NULL)
>  		ops->set_desc = msi_domain_ops_default.set_desc;
>  }
> @@ -1088,6 +1096,10 @@ void msi_remove_device_irq_domain(struct device *dev, unsigned int domid)
>  
>  	dev->msi.data->__domains[domid].domain = NULL;
>  	info = domain->host_data;
> +
> +	if (info->alloc_data)
> +		info->ops->msi_teardown(domain, info->alloc_data);

Hmm, that's weird.

Why not call it unconditionally. The empty teardown() default callback
does not care about @arg being NULL. No?

Thanks,

        tglx

