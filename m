Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53DED637DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 22:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auWb4dQBMJYzfosA/pOnNDayLZ5ZzA6A+0CwU8nFlUY=; b=Dxr6SJRPuMg4Alb4ECE3SvQKo0
	DmFbU3VbJI8U0Qel1Sj2cxo9KSjBkOPp5rYJLqV3G9kXCcMWs3JGqkb9YC6bQaBI4v1wq4uorKfuA
	Ya9IV8g1ROV6O+B1zbBdShWKGHgCfZCFg/mjBY/+/7w+RuG3Mqn5whFtWTmTKt7Zn/39Rc2cwoohB
	y5iOWyNXurUOfTo9MVdQyzEBnTQH+TT2/zTsETuUcpOpLY4z5OyTrM0YZ3WQUPWNm+xLLf4YSZLqL
	hQB9wjw/UaT9L3XzEUU1HYUp4qvCmeXWrhc4dwMNIAZxQl9zdcxstCuZAH/8Sed0nW9jwwFJIEVyK
	654mO7qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVdI2-00000005syC-2ZDb;
	Tue, 16 Dec 2025 22:13:06 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVdHy-00000005sxp-1Dh6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 22:13:05 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a0bb2f093aso33742085ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 14:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765923181; x=1766527981; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=auWb4dQBMJYzfosA/pOnNDayLZ5ZzA6A+0CwU8nFlUY=;
        b=jbZzRJtrWgqDZbXwLPUj74OSGZW00E0kofG0Fw4IjYY+LUh9pM4bzvfroM5KeYUKqs
         ddhIvFvaDlM+kZxzFbYnPjRbROvbBs0oICXzhxLRSObOjWFdTwDTsPY+OjCSH89ZTQM1
         4M/mn/LGBgUXo7rmsbEsslLqH5TCdQiFdl5mzG+QJNzwPJpxVqwUgJPYci6m2t0rL72q
         VmGIwScuvK6nibWivgHiDddDRzSEpreTWD+0yn124DrX62BSOnOMwJz5gtXT4C9/jwRf
         h40ou6VxmizvU8ZSnSuy5oni9Vx7D7It/KyE14YbUMdVwtXhdPmKEeOBlLkWh7EbQOlG
         vybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765923181; x=1766527981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auWb4dQBMJYzfosA/pOnNDayLZ5ZzA6A+0CwU8nFlUY=;
        b=nP+scIflz64NEuAHihBychAgsJgVSzX0cghW5XwGS2szVEl29oQ8hgJxRFikp3ssDg
         DQRFNMVcLOlRkB7vluSfFuLc5BZroH0V6w7FN682jwgXBb6q7648L6kCY3vxF6XCjKCL
         t3AxNWwzdeumJdopQj+2ZeNE33UMWbfKJXcSvJBa2DMXU0Ou7Opq5m72DC88/1Qq9H2i
         FdJ8tKZsEhrnj+wpvhX3l6BzajTMJrLVV6zEUTwStAHwihk178J5+Y4pPnnzcEHscOn3
         YOOnlIe896Ij5hZlVrMY6EkzANmlEg5AFkikvqzqFBJ8/66hphoQTijrEcho2zQj0hvc
         f6hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmVHoBIWgr7FYgg2uHLrhi6J6k/ryqAhclaj4N56C11U4bqAcjpSci/QxNQvQwyeozzWr/T7kS8Aiu4/6pNT1G@lists.infradead.org
X-Gm-Message-State: AOJu0Yzckv5hhqUTYLjn23T2Fle4NXSx2VhSfeejLzgD4TZ5hkHLf7+b
	TvZqhJfFGMQlFOWoF1YSFHCu3cseANEbLv1i8co+xeNEUjEt/9D79vutGfQ9nJXt/bw=
X-Gm-Gg: AY/fxX5dfufIou/NqS+j3rYjv1hdQAHazZYU+eVDv/h0BhZ6i0zTQdAQ5BvwTmS/fSH
	myvW2rLA8ND02iH5sZdqVqmKKb+Y0e/Y/TOHUFRIWcNhTrJdl6oGfsDYLizJMGu9C8EFlHOnyj8
	1iwdvDZyzh2XCinANR6T6ss1XdB0ANnvVKWqBGDlMgd8YM6PVSAvIaM3Cxp9o9hnHRZ6ilmvvb4
	+2P/1v8vyGMEhwehc8CbUiy/h8gbDoduR4I8P4mHa4nJ9E6MUKBo8Ef7kPSGbfeYXmeb/YC+1+r
	JhJKmmlioP1uCG3kaRYLnlU2jKe9NhZ0ypkmlTdqpbz9iVll/DVn84GuTYDiaHZb2f2KuUHgopG
	uFEMBcpk6+jyt1rxPj/0soIGKYBNscNwGKBu3x43rQnn68fB5VciJ8ZPihPXWlYeehz7popu8X8
	kTtbBlUwLWXTzAog==
X-Google-Smtp-Source: AGHT+IG5tChOpyR0Nhxu0Rhdpo8VAFsmpzSG4K1uTUFmNnHdpvpNSpU1hBhSP/GWyCviK9VF9gEm4g==
X-Received: by 2002:a17:903:1986:b0:295:738f:73fe with SMTP id d9443c01a7336-29f23c7d087mr141376425ad.30.1765923181120;
        Tue, 16 Dec 2025 14:13:01 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ba5d:91e2:900a:fb01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea0594e8sm172904795ad.87.2025.12.16.14.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 14:13:00 -0800 (PST)
Date: Tue, 16 Dec 2025 15:12:57 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, m.szyprowski@samsung.com, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	arnaud.pouliquen@foss.st.com, robh@kernel.org,
	geert+renesas@glider.be, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iuliana.prodan@nxp.com
Subject: Re: [PATCH v2] remoteproc: imx_dsp_rproc: Fix multiple start/stop
 operations
Message-ID: <aUHZaapZ1IAs_mRE@p14s>
References: <20251210154906.99210-1-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210154906.99210-1-daniel.baluta@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_141302_360331_7AC792FA 
X-CRM114-Status: GOOD (  29.96  )
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

Good day,

On Wed, Dec 10, 2025 at 05:49:06PM +0200, Daniel Baluta wrote:
> After commit 67a7bc7f0358 ("remoteproc: Use of reserved_mem_region_*
> functions for "memory-region"") following commands with
> imx-dsp-rproc started to fail:
> 
> $ echo zephyr.elf > /sys/class/remoteproc/remoteproc0/firmware
> $ echo start > /sys/class/remoteproc/remoteproc0/state
> $ echo stop > /sys/class/remoteproc/remoteproc0/state
> $ echo start > /sys/class/remoteproc/remoteproc0/state #! This fails
> -sh: echo: write error: Device or resource busy
> 
> This happens because aforementioned commit replaced devm_ioremap_wc with
> devm_ioremap_resource_wc which will "reserve" the memory region with the
> first start and then will fail at the second start if the memory
> region is already reserved.
> 
> Even partially reverting the faulty commit won't fix the
> underlying issue because we map the address in prepare() but we never
> unmap it at unprepare(), so we will keep leaking memory regions.
> 
> So, lets use alloc() and release() callbacks for memory carveout
> handling. This will nicely map() the memory region at prepare() time
> and unmap() it at unprepare().
> 
> Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
> Changes since v1:
>  * https://lore.kernel.org/imx/091a4f29-5435-428a-9a1c-ef82465211cb@nxp.com/T/#t 
>  * took a different approach and instead of partially reverting the
>   faulty patch, used alloc() and release() callbacks to handle memory
>   region mapping.
>  drivers/remoteproc/imx_dsp_rproc.c | 50 ++++++++++++++++++++----------
>  1 file changed, 33 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 5130a35214c9..83468558e634 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -644,6 +644,32 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
>  	mbox_free_channel(priv->rxdb_ch);
>  }
>  
> +static int imx_dsp_rproc_mem_alloc(struct rproc *rproc,
> +				   struct rproc_mem_entry *mem)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	void *va;
> +
> +	va = ioremap_wc(mem->dma, mem->len);
> +	if (!va) {
> +		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> +			&mem->dma, mem->len);
> +		return -ENOMEM;
> +	}
> +
> +	mem->va = va;
> +
> +	return 0;
> +}
> +
> +static int imx_dsp_rproc_mem_release(struct rproc *rproc,
> +				     struct rproc_mem_entry *mem)
> +{
> +	iounmap(mem->va);
> +
> +	return 0;
> +}
> +
>  /**
>   * imx_dsp_rproc_add_carveout() - request mailbox channels
>   * @priv: private data pointer
> @@ -659,7 +685,6 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  	struct device *dev = rproc->dev.parent;
>  	struct device_node *np = dev->of_node;
>  	struct rproc_mem_entry *mem;
> -	void __iomem *cpu_addr;
>  	int a, i = 0;
>  	u64 da;
>  
> @@ -673,15 +698,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  		if (imx_dsp_rproc_sys_to_da(priv, att->sa, att->size, &da))
>  			return -EINVAL;
>  
> -		cpu_addr = devm_ioremap_wc(dev, att->sa, att->size);
> -		if (!cpu_addr) {
> -			dev_err(dev, "failed to map memory %p\n", &att->sa);
> -			return -ENOMEM;
> -		}
> -
>  		/* Register memory region */
> -		mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)att->sa,
> -					   att->size, da, NULL, NULL, "dsp_mem");
> +		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)att->sa,
> +					   att->size, da, imx_dsp_rproc_mem_alloc,
> +					   imx_dsp_rproc_mem_release, "dsp_mem");

Was there a reason you kept those here rather than moving them to probe() as
Iuliana suggested?  Note that I would be fine with this solution since this is
how it was before, but if we have to go through a refactoring we may as well
take those things into account.

>  
>  		if (mem)
>  			rproc_coredump_add_segment(rproc, da, att->size);
> @@ -709,15 +729,11 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  		if (imx_dsp_rproc_sys_to_da(priv, res.start, resource_size(&res), &da))
>  			return -EINVAL;
>  
> -		cpu_addr = devm_ioremap_resource_wc(dev, &res);
> -		if (IS_ERR(cpu_addr)) {
> -			dev_err(dev, "failed to map memory %pR\n", &res);
> -			return PTR_ERR(cpu_addr);
> -		}
> -
>  		/* Register memory region */
> -		mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)res.start,
> -					   resource_size(&res), da, NULL, NULL,
> +		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)res.start,
> +					   resource_size(&res), da,
> +					    imx_dsp_rproc_mem_alloc,
> +					    imx_dsp_rproc_mem_release,
>  					   "%.*s", strchrnul(res.name, '@') - res.name, res.name);

I'm fine with this part.

Thanks,
Mathieu

>  		if (!mem)
>  			return -ENOMEM;
> -- 
> 2.45.2
> 

