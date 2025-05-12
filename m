Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0125EC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nu6e7u4zlEaPLOwI3OMMxF8f3AfgQopTfH9NxUGGPeA=; b=kWpX90O8Ixd8xZhXSqrq+V4H/c
	QvJ5p0DTZbzN3ZLoO/ONP1d26MMkBKGiwK0H+LBDRHdqi8Qh8KzZfZEoexF30An2f4c+02EkNV5lJ
	ovPX2C6AgBWPXMXxMx1ryxatocv48FgSOBCBBgDwhHY8X61bRACkr+sfxTUpRpQbG8m8ebfz6uUkv
	lD3xZ4FKjpny1i90/AKznJIK78eZskoogqH4n0F584NHT6k5AzrJHiZZRj3jvjk+DysjRGFnMFQGr
	XFjBpdFYsAeVnvKjtlNiyFv/ZsxXlAAAbpI+nvKdkUL6OXxrsWv7jD6wo+pXMA+v/q9eS0n9Umhqo
	J087j/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUa2-00000009oM9-0noN;
	Mon, 12 May 2025 14:56:34 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU5D-00000009iIz-0Yud
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 14:24:46 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747059880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nu6e7u4zlEaPLOwI3OMMxF8f3AfgQopTfH9NxUGGPeA=;
	b=ynR0ViI9LVzx68V4gW83WzzLgoAXtjBBlPCJ4V/aRqIbqP3ZwPCEE12ncdQ3nvbqN3VcMH
	3Jo5W0sBzYNfIWiu4Y9yupFDWloPxOX9a/4lc59bcC0D98QOK7qFyRx5GpHeUxjzBm8GiI
	mBI4TSNyc6FwaYTqNAAf6h/qBUEufXotJhiBjt6JFOVk6NFFXM4YFtXE6LALa72EELjfY5
	7bHhsMeVGE60GvJKZzPpmZYOxh4cNbiGc5tsXDVEOy5ZzG9LrRTjPdTglo7UMjRvThl9yj
	22D2Tn6bi8Yb46z263s7DdZSY3S20sKYPBNBmVcb3FSVWYK3WecFxeu5kNJHSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747059880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nu6e7u4zlEaPLOwI3OMMxF8f3AfgQopTfH9NxUGGPeA=;
	b=hUqPEX1Ytc3z55oLoyPx9rrmwlywl/Bkxiedg7qUAH0+sBE5ICcZeaBi/nUywnfuSKDmOr
	eq+I/DxAhXWcRNBQ==
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH 3/4] genirq/msi: Move prepare() call to per-device
 allocation
In-Reply-To: <20250511163520.1307654-4-maz@kernel.org>
References: <20250511163520.1307654-1-maz@kernel.org>
 <20250511163520.1307654-4-maz@kernel.org>
Date: Mon, 12 May 2025 16:24:39 +0200
Message-ID: <87jz6llxeg.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_072443_314667_6FBB1B89 
X-CRM114-Status: GOOD (  21.76  )
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
> The current device MSI infrastructure is subtly broken, as it
> will issue an .msi_prepare() callback into the MSI controller
> driver every time it needs to allocate an MSI. That's pretty wrong,
> as the contract between the MSI controller and the core code is that
> .msi_prepare() is called exactly once per device.

That contract is nowhere written in stone.

There are some MSI controller which get confused about that, but that's
a problem of said controllers

> diff --git a/include/linux/msi.h b/include/linux/msi.h
> index 0a44a2cba3105..68a8b2d03eba9 100644
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -513,12 +513,14 @@ struct msi_domain_info {
>   * @chip:	Interrupt chip for this domain
>   * @ops:	MSI domain ops
>   * @info:	MSI domain info data
> + * @arg:	MSI domain allocation data (arch specific)

arg is a horrible name. Can this please be alloc_info or such?

> @@ -1025,6 +1026,7 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
>  	bundle->info.ops = &bundle->ops;
>  	bundle->info.data = domain_data;
>  	bundle->info.chip_data = chip_data;
> +	bundle->info.alloc_data = &bundle->arg;
>  
>  	pops = parent->msi_parent_ops;
>  	snprintf(bundle->name, sizeof(bundle->name), "%s%s-%s",
> @@ -1053,21 +1055,28 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
>  	msi_lock_descs(dev);

Please work against tip irq/msi which carries the guard() replacement
for msi_lock_descs(). This patch heavily conflicts with the queued
changes.

> +static int __populate_alloc_info(struct irq_domain *domain, struct device *dev,
> +				 unsigned int nirqs, msi_alloc_info_t *arg)
> +{

Why does this need double underscores?

> +	struct msi_domain_info *info = domain->host_data;
> +	int ret = 0;
> +
> +	/*
> +	 * If the caller has provided a template alloc info, use that. Once
> +	 * all users of msi_create_irq_domain() have been eliminated, this
> +	 * should be the only source of allocation information, and the
> +	 * prepare call below should be finally removed.

That's only a matter of decades :)

> +	 */
> +	if (info->alloc_data)
> +		*arg = *info->alloc_data;
> +	else
> +		ret = msi_domain_prepare_irqs(domain, dev, nirqs, arg);
> +
> +	return ret;

	if (!info->alloc_data)
        	return msi_domain_prepare_irqs(domain, dev, nirqs, arg);

	*arg = *info->alloc_data;
        return 0;

perhaps?

Thanks,

        tglx

         

