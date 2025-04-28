Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B6BC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgUhPrW3pZPMoUmmVNbIH37mhjHyGadhBg8JhGzQp78=; b=jpJNbLp5isxhawZSAYFHtRxwXq
	anZUc8wfRWKZ6e3cWh8AEklMOe8GquCD15PUy9H35T4uZI5TXWxGrRgcHZTux+c/bFjniMEb5kone
	MmtwLQnLYeboWrssmJswoHl+ZZ35b2JlkQv8uHjfDY9iMXxk/igR7AW+KPecrcmcLty+j6pU6RXqq
	PBpB9UB1BVkh14vLeYSmkmeH3jSJ+2xjPESlg1UJj7n5UUhM0tjJoKdcDcOdwMEAjhJMtD2CKF9Jy
	HKeSE+DnD6tSeQg7vM6cBypHUVmYWnxvFepRwjxkSTL4y67lMS3TdfqZoyXzeYEmQ3ULcXkw/7jjn
	fxBWQkuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rhx-00000006zI6-2ZIw;
	Mon, 28 Apr 2025 16:51:53 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rfl-00000006yuJ-0Rb8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 16:49:38 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso4472691a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 09:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745858975; x=1746463775; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sgUhPrW3pZPMoUmmVNbIH37mhjHyGadhBg8JhGzQp78=;
        b=nN8O443QsVuZt7CE3l929VHeez5KhGjEdOCW6xyxVbFBidbZOloi4u5WBK3jDrQ8ed
         lHAiJy/NtKRbLPsjMiqvoVZy20fzOek5v3tpxLLMUDoifUbJfo6nPDLaoGAeIALv2APT
         i7kL4pdlBMD3d4eopNjhe/7xOsWoIdw5wnwSY2vsRaXa1QDWBO3/OD8hKHR0X+KuWMLI
         RSvsgyAE4HiDCRwBmlEN3FWC/5E3ndswFbH6IXyJeSvc/EOKhTCjtpdd+Bef/F9+El2T
         ivpMxZJ+zI4qSwuGEG5IMn1rdWUK8oJZGMNVIco7X3A6UJ/xa2La6MUMRXwHS+33Sd4j
         S6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858975; x=1746463775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgUhPrW3pZPMoUmmVNbIH37mhjHyGadhBg8JhGzQp78=;
        b=NIbksocM1l8LdumkWXPfGSObLmtziSxuunxtgHOgOlKAegE36BzRHCvLW9tJpWRK3W
         7M5nrWAOsZOetAAzdfyZnJ7ZYT2IOb1Bvf9+P8xIpXOQbAYiqTo6T49VtAhk83gTbFLk
         d22xa2WheBqEaMIeI6mettaaZxXs6wriyGOB6s27Tr9+FKJyftvcmqfRzWf/OG80ppfw
         0dc0yMk+VoRoPCaX71CLDBzrQZsXkFYzpHD0qPKN6Ve5nAZeJWX8MVjZrzXYUEXY8/MP
         sHqfhrLCFof3vBV8wgFe3X8s36VCQ2Ec7iN6ytj/r/LWw30GEq10mqDjuFfdax+MXJtq
         ig3w==
X-Forwarded-Encrypted: i=1; AJvYcCU0TA4bEY1ORje4H84O14W/JXyWfQTgoEnCuOp3TU02iT6hKcRM0p+xY5zdosgrftTKq5MHf35+e9W4vrLTglyZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2AHpf2KHY0KtPao9Yl7sRI2Bj7UgFUtlIdnzQ8I3RYHm3eyWM
	i/JIOEuD0G0ivg3zJ471GWSZQq834HYV1KZqSK5DBXAvnPYDOjtMPfMGchKh8Rw=
X-Gm-Gg: ASbGncv0v88TO3VNfhKxYl4NHbbqYjVtslWXkvgPqZqGosUwL2O/dG3CuGrU54Hmj7g
	LEoPXzJdFa/65bVozyn6FuKpPbWVHc7Ya7ltgdEzswJ/Uo9rpE0AuBoOM3yjP76MpzbQci9/7Su
	DAU7WOBhKXgN9A9ytD7vQkCYr+GredJEP9+DoIFQ3SXPevX3Z7rJzC6MzuAdog1pgS0mC/Jj+9B
	8Uh3Si1rT0HvMHh4nLXzmrYvgMnXxkrRtYf3D+F5c6+43nKTgrQVy7lH1m+C00+n5A0PdjvWZ5R
	R9pnBYhnSLBKH4b/CHb8CaI18ehJQQIh1YoVMebyLb/0
X-Google-Smtp-Source: AGHT+IGzMOhPgDfCKAp04nSjoWIJJPOKZvS99BrJ9oTEUG+UpqUfA4eSpR+xL5SbBU/UdauqUlNn0w==
X-Received: by 2002:a17:90b:4d08:b0:2f9:c144:9d13 with SMTP id 98e67ed59e1d1-30a2158ed10mr712782a91.24.1745858975414;
        Mon, 28 Apr 2025 09:49:35 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b816:4cd3:148d:1922])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d4d6sm7467577a91.38.2025.04.28.09.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:49:34 -0700 (PDT)
Date: Mon, 28 Apr 2025 10:49:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] remoteproc: imx_rproc: release carveout under
 imx_rproc after rproc_attach() fails
Message-ID: <aA-xnA_zFn8UlTDQ@p14s>
References: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
 <20250426065348.1234391-2-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426065348.1234391-2-xiaolei.wang@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_094937_147718_628DA04A 
X-CRM114-Status: GOOD (  25.78  )
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

Hi Xiaolei,

On Sat, Apr 26, 2025 at 02:53:47PM +0800, Xiaolei Wang wrote:
> When rproc->state = RPROC_DETACHED and rproc_attach() is used
> to attach to the remote processor, if rproc_handle_resources()
> returns a failure, the resources allocated by rproc_prepare_device()
> should be released, otherwise the following memory leak will occur.
> 
> Therefore, add imx_rproc_unprepare() to imx_rproc to release the
> memory allocated in imx_rproc_prepare().
> 
> unreferenced object 0xffff0000861c5d00 (size 128):
> comm "kworker/u12:3", pid 59, jiffies 4294893509 (age 149.220s)
> hex dump (first 32 bytes):
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
> 00 00 02 88 00 00 00 00 00 00 10 00 00 00 00 00 ............
> backtrace:
>  [<00000000f949fe18>] slab_post_alloc_hook+0x98/0x37c
>  [<00000000adbfb3e7>] __kmem_cache_alloc_node+0x138/0x2e0
>  [<00000000521c0345>] kmalloc_trace+0x40/0x158
>  [<000000004e330a49>] rproc_mem_entry_init+0x60/0xf8
>  [<000000002815755e>] imx_rproc_prepare+0xe0/0x180
>  [<0000000003f61b4e>] rproc_boot+0x2ec/0x528
>  [<00000000e7e994ac>] rproc_add+0x124/0x17c
>  [<0000000048594076>] imx_rproc_probe+0x4ec/0x5d4
>  [<00000000efc298a1>] platform_probe+0x68/0xd8
>  [<00000000110be6fe>] really_probe+0x110/0x27c
>  [<00000000e245c0ae>] __driver_probe_device+0x78/0x12c
>  [<00000000f61f6f5e>] driver_probe_device+0x3c/0x118
>  [<00000000a7874938>] __device_attach_driver+0xb8/0xf8
>  [<0000000065319e69>] bus_for_each_drv+0x84/0xe4
>  [<00000000db3eb243>] __device_attach+0xfc/0x18c
>  [<0000000072e4e1a4>] device_initial_probe+0x14/0x20
> 
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..c489bd15ee91 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -595,6 +595,19 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  	return  0;
>  }
>  
> +static int imx_rproc_unprepare(struct rproc *rproc)
> +{
> +	struct rproc_mem_entry *entry, *tmp;
> +
> +	rproc_coredump_cleanup(rproc);
> +	/* clean up carveout allocations */
> +	list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
> +		list_del(&entry->node);
> +		kfree(entry);
> +	}
> +	return  0;
> +}
> +

I have reflected long and hard on this.  The problem with the above approach is
that we do almost the same thing in imx_rproc_prepare() and
rproc_resource_cleanup().  Function rproc_resource_cleanup() is able to deal
with empty lists so I think it is better to fix the "goto" statements in
rproc_attach().  More specifically, replace the "unprepare_device" goto
statement with "clean_up_resources" and get rid of the "unprepare_device" label.  

Please see if that works on your side.  I am good with 2/2 of this series.

Thanks,
Mathieu

>  static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  {
>  	int ret;
> @@ -675,6 +688,7 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>  
>  static const struct rproc_ops imx_rproc_ops = {
>  	.prepare	= imx_rproc_prepare,
> +	.unprepare	= imx_rproc_unprepare,
>  	.attach		= imx_rproc_attach,
>  	.detach		= imx_rproc_detach,
>  	.start		= imx_rproc_start,
> -- 
> 2.25.1
> 

