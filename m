Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176D7C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 19:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHnQmsHLpTkXpk9pCYWZ2+u9EL7Tjau9DVeHds4Cfpo=; b=ObywneOSUq0wl/DEiML1H9siqw
	xaLPsciKsNZj5gif1pYhF4s1p536YQ0cxje0QEJrJ+Yw460cneS/OoCnbGaz0WO8YPB/ZhgT3mAA2
	5TPpVIIfK+rz9A9TweI7fBOgbcQOCwzVCTNTCwXIXlDc6TI+LZi/Y/bq2uBXWCaoAfhaL8Aqivg1a
	/p5nwxi8KB0WxuHXM+LbzFfGQc6+0x2kkHhjnMiToxIz+aebIrlRBnzjlWR9e8MlYuZC6EFG5E68w
	RqIBvZSKZrla8BZi77dpEimBygQzVrvO+7cOJl9ccCe9J9LFRPyiDnnnoLUlRY8Zbg9Br3I9YKNo2
	Sol/9m8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8OOb-00000000bgZ-0x8r;
	Fri, 25 Apr 2025 19:07:33 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MDE-00000000H5P-13KX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 16:47:41 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso3403768b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 09:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745599659; x=1746204459; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eHnQmsHLpTkXpk9pCYWZ2+u9EL7Tjau9DVeHds4Cfpo=;
        b=v5Uuj0IK90YlckQmJbPif+alB6XGw4PNbHHBg0u2X8V6z5f/NkuMYxkVe14nrHxqJw
         3xMmS2uMANy0EHSUfAMqfcLLLLf595Z5GTwX17BYGEXKKWvBXjmxETLy8hQgC4R3Yq2X
         WWcHLI2Fy6bwqD2l1Kb2R6i0XAvg2dAlUM1c67fs+quN3ubc7Hw5csOnjwtfTJh1XTLA
         MQwOxdrT9arMRw9P9QmLuW4ZbYKFYGRK8ZAsrpLJp+2/ksIi844IPlXjzt53ur1WzyTW
         qmJAbMQG351fWc3djZb5Q9kjG/8zppI/mGgmjzSZIVJwWWWRKyGxz6hcTLQSJ9Cuzbnq
         Yf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745599659; x=1746204459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHnQmsHLpTkXpk9pCYWZ2+u9EL7Tjau9DVeHds4Cfpo=;
        b=SdO4aXyXFrHaO8etPo+2Nu3tzc/XlVOfae+OXGm7JvaPzN1EZcSx49u+LkvLYURECH
         jCno0um5C1BuU6KPXLb28Gk4zBBJK/8GjaKwjpTQD62WO1R5+T5kZxgTmYHi+pLfPKJl
         zBTDSXqfcb4HDyufrLFmHDri4JFDTLG4qBJFFKuIF5LE2848SLk4Fyh9PBB+UW7rrRKN
         tsmMn1Eat7LQ5I2R+XNKQi9zDiTvUkI0nyxCgQOiee8tsqoJPeoK2JOwnTabcmipZLpJ
         fbtAK2bHXwRc1OeQsfI3MIS0b4BfZ8HPZC9dAF7SlrulJ7rlkRfcHh5i7X0PF0yV/oFN
         T13A==
X-Forwarded-Encrypted: i=1; AJvYcCX1cUGhwJr+DIyBOxDxPzMlSpOp5+2AM0CpVmDpBXWcACZH+DLOOlgKv17gGu9IyjzOg2O/iWRK2dE2MT7ZjYUt@lists.infradead.org
X-Gm-Message-State: AOJu0YzUa65p9vF3eF4d3UVkp0TWtU6+5D2HLDquhp12EMNOBwp2wUs5
	kSUWP5Ym2QXtY9oGHejOubQqOb1B/a7XkbJ5sf6lCXzsrs9RBiep/zUM7nELoiY=
X-Gm-Gg: ASbGncu+tkEL2XofBCEtJF4aPi4M7KHA0tjrJQ5Pp92Tvs8GZMqWsH+cvCtblT4/iuh
	E/Dj0KxxOrppEZJeuSF7+OISeNrNl6viC7hSPwA6FuhSv6yVEVX11DHxIXV6fYrji8lOhvL4eEf
	fkFHsSdlleuoDn2XK5H9EOK3o/llGcgSpxFTEENgyMPqXq2xqiVrnUkc310Htt3OXKFgWuXOvXd
	zMjQSGF2h31FKqP9iDTfOO8UoVazkbpLNT2fIv2Nny673F+aQ3/NNspifkMRC3xVdLOtOFL+ouG
	A4Eu2HIpzhZur0r4sj0PLnXI7DYkteFpd0w2q0ikaA83
X-Google-Smtp-Source: AGHT+IEFtm0kx9ryjYyAugqM7VqnMN866ofICD5304SL4j5RNB8nYzku/8tyb6zQ0c1+PCz7Hhe9FQ==
X-Received: by 2002:a05:6a21:920b:b0:1ee:c390:58ac with SMTP id adf61e73a8af0-2045b98feb4mr4519768637.34.1745599659333;
        Fri, 25 Apr 2025 09:47:39 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e9ed:84f3:2e15:1cdc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a420sm3487235b3a.107.2025.04.25.09.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:47:38 -0700 (PDT)
Date: Fri, 25 Apr 2025 10:47:36 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, festevam@gmail.com,
	kernel@pengutronix.de, linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: imx_rproc: release carveout under
 imx_rproc after rproc_attach() fails
Message-ID: <aAu8qPl7EpcIU0oe@p14s>
References: <20250424122252.2777363-1-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424122252.2777363-1-xiaolei.wang@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_094740_294484_DD3DF96C 
X-CRM114-Status: GOOD (  18.47  )
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

On Thu, Apr 24, 2025 at 08:22:51PM +0800, Xiaolei Wang wrote:
> Release all carveouts under imx_rproc after rproc_attach() fails to solve
> the following kmemleak:
>

Please provide more details on the steps needed to reproduce this problem and
where in rproc_attach() the original failure occured.

Thanks,
Mathieu

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

