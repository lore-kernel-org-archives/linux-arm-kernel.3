Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1721CEE20B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7fQkwk+wPXieg0NkOTWjKgPZp/IlTl5T8xOo7PjnBw=; b=3P92uZGs3C6stZSrzGa9AQq+59
	C/gwkODqjGc9u1Pi3sbzBmazkITahvwLpa+DtXEfFkTsTB+ELbUFRdLTf6JyiYihvdnIX9loc1DIW
	JTwcRsP61dNNB9nrNNj/H1L062BK61dhb5T25ZSrMCvngnz7wCLlij0yoSVwuMtdjTWkpl03Yj1Di
	l0HlesiwFDBSpdJh86rLxAE4rSzy447hG057tLyYxqmh0h8h1CYtCpzSXscY28cfH1AOp8rOiFTyg
	nFhW92s9Fd7SwzoqznQ5S8q9uG3B+KYuS4f+ACRZz5PPphBflCeV3HYbbg12IF7Rdodh65yggoa4F
	ztxy+tDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voOiX-0000000BYq2-3qCp;
	Fri, 06 Feb 2026 16:30:01 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voOiU-0000000BYpL-0NvV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 16:30:00 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-81f39438187so1715871b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 08:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770395397; x=1771000197; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X7fQkwk+wPXieg0NkOTWjKgPZp/IlTl5T8xOo7PjnBw=;
        b=ZlgqFXhEDm/XIRDTtTZ0O4frnO0YTkkc6QBDUomI7NQjJy6Pi/8W6wex35j/8E1IHX
         St5lo+8FIbvDMyx9P91Rv7XHaEThIklGwyKv6LV1addwLXY/344RZgVzBuqfV6tBK7HA
         ho5N+JaKsqZlBIi2+4Bb0p68wZ3CPyrAw6CEvV5B8RmGyEmsKQ7u8gU0TpmlnN0+dzRu
         YvKOgLKMfWAhq1vq+efFnIqAVMTb9XuYHwnNC34jAWurHgITh3gV6LI2YaBvlyEF7VY0
         C7Zh7XQJdsnBpS8jlES6o2q2AEVUJClFl2jpJUY2CM/0KrUlXy7LAjIHcyBYlHpEPb60
         GZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770395397; x=1771000197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7fQkwk+wPXieg0NkOTWjKgPZp/IlTl5T8xOo7PjnBw=;
        b=pC110YR8qHLL1/tBVDCc0pMTIYpWs05eq1yyk0/JtpYRdKOCBx+RPX/kYfgB21SK/Y
         WTeh1DEDfvkF/RjZ2/5gL5MU9MqCqbcRfv/okbZwvk0wkLSB+EK1N54rXgLlP+TxWJyZ
         I+P1O6/t2hf1LUbXFw0Ys1GJNwDJllFoP9eB3wro1KpKS1axQROZ3ylMVS+ZbEwsYL0q
         LIH3Po5tH2RlKWofnaRA/lL39H1A76s4F8evG2DnDZBtmNSxwG8fJv7mPO2GMwlhO8xR
         gQWMyN3cxtFlxr1GeVkT5mWYENxEYnAmn5aj9YQcjqF2CV+gLVKVfT5Kkr+fbPi7XIBt
         Ju2g==
X-Forwarded-Encrypted: i=1; AJvYcCXlDRYoxL5JMpu74hrtDrZHh1mJtQRjnuLlT6rD2jQshuXj9nDX1LwgCfvv6LUjP509uqbxVdbnBJlvPWWXZou6@lists.infradead.org
X-Gm-Message-State: AOJu0YyigpJ2TBorQg7Dktz2yUAWLM+w3jaPCu6K8H9hO2WuAWg+eEqN
	/lcGLP212MnBTydjG1xceikTlT+AVMqklHlhsBgwIpE3TiX1usRBObT2lzjNCQKrF4k=
X-Gm-Gg: AZuq6aIQKOIlZ7RB3bghc5XuVepaIbpau4eASrA6YpEESvtYiby+GMY4TTuK/Il98jl
	fINJweuRiBsPDSRKrlaEgA0FawX4KkWhHoKx4xdbZr0tL0anCxl0j5QqpA3+I7x4P6uPy+se8be
	be+IgrYEzXGGk+nZkjDArgmRdFf1z8EVgIJ9I/4dZVdAlxNlrK9S8k37tCyXuSbfz6P/Y73DFPc
	HpTdY5uOKrh0QCl0XT1PbA1kBlKZLh6PAiHUgQKYUyohxIGzZrM+3rc1wZlmLtb7WU4t/zgHum6
	k9C1ykzZj75dCSXjivacNaa6mqv8MPKIOZZBs6gB3B4ZHZpqQx57P/0Ly2evERS2xv/RE/Ppg1W
	B2VV70OCN2qsphDFyXnXbb/Erg+Zy8X4Q428QVQOQUO0j6l7Q5RKDHMG3XT32W0BtFuLD+LdA26
	p1xzL1+3Fg+lP+
X-Received: by 2002:a05:6a00:37c4:b0:821:70e7:74ca with SMTP id d2e1a72fcca58-824417df29fmr2464858b3a.70.1770395396788;
        Fri, 06 Feb 2026 08:29:56 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:fa3:e3b4:3597:587a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441884959sm2603694b3a.32.2026.02.06.08.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 08:29:56 -0800 (PST)
Date: Fri, 6 Feb 2026 09:29:53 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [bug report] remoteproc: imx_rproc: Introduce prepare ops for
 imx_rproc_dcfg
Message-ID: <aYYXAa2Fj36XG4yQ@p14s>
References: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
 <aYXveV_Y1gT73JoK@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYXveV_Y1gT73JoK@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_082958_157814_85601B73 
X-CRM114-Status: GOOD (  13.73  )
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

On Fri, Feb 06, 2026 at 04:41:13PM +0300, Dan Carpenter wrote:
> [ Smatch checking is paused while we raise funding.  #SadFace
>   https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]
> 
> Hello Peng Fan,
> 
> Commit edd2a9956055 ("remoteproc: imx_rproc: Introduce prepare ops
> for imx_rproc_dcfg") from Jan 9, 2026 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/remoteproc/imx_rproc.c:648 imx_rproc_prepare()
> 	warn: ignoring unreachable code.
> 
> drivers/remoteproc/imx_rproc.c
>     605 static int imx_rproc_prepare(struct rproc *rproc)
>     606 {
>     607         struct imx_rproc *priv = rproc->priv;
>     608         struct device_node *np = priv->dev->of_node;
>     609         struct rproc_mem_entry *mem;
>     610         int i = 0;
>     611         u32 da;
>     612 
>     613         /* Register associated reserved memory regions */
>     614         while (1) {
>     615                 int err;
>     616                 struct resource res;
>     617 
>     618                 err = of_reserved_mem_region_to_resource(np, i++, &res);
>     619                 if (err)
>     620                         return 0;
>     621 
>     622                 /*
>     623                  * Ignore the first memory region which will be used vdev buffer.
>     624                  * No need to do extra handlings, rproc_add_virtio_dev will handle it.
>     625                  */
>     626                 if (strstarts(res.name, "vdev0buffer"))
>     627                         continue;
>     628 
>     629                 if (strstarts(res.name, "rsc-table"))
>     630                         continue;
>     631 
>     632                 /* No need to translate pa to da, i.MX use same map */
>     633                 da = res.start;
>     634 
>     635                 /* Register memory region */
>     636                 mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
>     637                                            resource_size(&res), da,
>     638                                            imx_rproc_mem_alloc, imx_rproc_mem_release,
>     639                                            "%.*s", strchrnul(res.name, '@') - res.name,
>     640                                            res.name);
>     641                 if (!mem)
>     642                         return -ENOMEM;
>     643 
>     644                 rproc_coredump_add_segment(rproc, da, resource_size(&res));
>     645                 rproc_add_carveout(rproc, mem);
>     646         }
>     647 
> --> 648         if (priv->ops && priv->ops->prepare)
>     649                 return priv->ops->prepare(rproc);
> 
> This is unreachable code.

It looks like Dan (and Smatch) has a point.

> 
>     650 
>     651         return 0;
>     652 }
> 
> regards,
> dan carpenter
> 

