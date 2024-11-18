Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F934D591A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 17:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCr0sYPsogCz+quxodgEQ3ar7fg9yYSS/OcvrMaer1g=; b=B81TyT7M7Wkrj1Qf7/4v0fJXpK
	+rTn8WtqQ0zNrmRvYnPEnXHCbWzDfuAzP4XsgPDxtsrDu85LMpDcAW6aysZYQXMEFrdsYZt5bDtyx
	BZvonGdsuE+DKy627fUbojjQopE9/aQG3uYRKsgn0SXVLB8SY/zX3rwzbscww7djMnDHTt51uxBha
	Ms8hvNbKiHINEG860qQoa4b8+hlFAvljuH5qHT99JFLJE+bMd7U3VKlBTq1yfit5wjWfUOP4cgAMK
	pm2pDXdhNGug4t3sdMRQiDdQGqREr6LTECA+8VQ/M8ssuBZGmxrUDYPFfUPTb+0MkewutEhkff4j7
	VP7SXczQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD5wY-0000000AGAh-3bwW;
	Mon, 18 Nov 2024 17:53:46 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD5vd-0000000AG0k-2NFa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 17:52:50 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7f450f7f11dso1662235a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 09:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731952368; x=1732557168; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fCr0sYPsogCz+quxodgEQ3ar7fg9yYSS/OcvrMaer1g=;
        b=p68fG19p7xpbXEd7LwyIVdappHYSRbkhABSrRjwwDDRQ/ozxr2G/x4uD693PgOSz1v
         NG2gEexghnY4iMxkBQUYYY2sTKd3p39f8moGQWhF6cCNFCUOKHq7ff6kxbVMllkm/188
         eXI0YeE+G3MOlpeDGCpyIO/kAMA/OHHLc1RKpIyVwHC/A2LphNZsyP6OJgo5gR17osvZ
         Lr85yCui1v4g3YZKmvt1/Z0orT3/veOASNzpVfS3QdrF2B6lKfrNuocydAWaqPpZbF+O
         rcW8kCqVm0XMwAZxpS58W+GmUg7Aa43acxR0Zom1uZaxArr+L4ZAz5FRZ9PK7jvStHBK
         Z5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731952368; x=1732557168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCr0sYPsogCz+quxodgEQ3ar7fg9yYSS/OcvrMaer1g=;
        b=f/xxCp3NGcCAxn+/R01Acg/d6PxYq9HdBKLcuBLK0r9XsXpmp42EUKe9U38Yprmy8K
         ZLIBTBe7rfx2Tpl2QFDuEyjVbrGRAlt4oGWrwr7mGImmXGoKw4fLcmcSO6CBWWT4dkmv
         MZZ6n4dcpVX5dPCtJRZjpnYNd7+7lmgKBjoeBdpNFctKd+jJ3n2NUIcUX4eHdFXMur+N
         1NPla9UeokF2Q89hllU4jYuu5+2dNzN/Uk/nbHVTWJThovUAL9WMIDy8L+43dqBCnEOs
         KFlBJLqXdBLzSdkYnBu9DldCEULpAN6MuXK/2o90B7UAdMS+bePT55kRKLzuh/BveULj
         4v2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzrGFpVRgmR/shQOpuMt/wlrA6AAs5b7YbBNKuJrhgjJDCWWixPSosquB1Z30irCpr02fzLja6Xx1hvqEGxugb@lists.infradead.org
X-Gm-Message-State: AOJu0YyV0E7qpI4BhlPyrJJQmYlG5nZ0G9apoguXz1+nyZ8Lr759aGGQ
	imePW3E8HsJTBKl5g0OIUQOjwGoouZkTV2fEKEL8joooIgWqJtn7ZDit1x9FeF8=
X-Google-Smtp-Source: AGHT+IEJRNX9bZE0xzeLu7+8kcJ+xIr7Kwr2Ag4WKPpTArbvdH5l5IPyQ32YkKJbAIpbhDtnUqCUSw==
X-Received: by 2002:a05:6a20:43ab:b0:1db:e508:cf68 with SMTP id adf61e73a8af0-1dc90b4bbebmr18325105637.24.1731952368452;
        Mon, 18 Nov 2024 09:52:48 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ced4:eca8:f5e9:9a5c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724770f9d0asm6707357b3a.26.2024.11.18.09.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 09:52:47 -0800 (PST)
Date: Mon, 18 Nov 2024 10:52:44 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v13 4/7] remoteproc: Introduce release_fw optional
 operation
Message-ID: <Zzt+7NBdNjyzWZIb@p14s>
References: <20241104133515.256497-1-arnaud.pouliquen@foss.st.com>
 <20241104133515.256497-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104133515.256497-5-arnaud.pouliquen@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_095249_643895_9A502E0C 
X-CRM114-Status: GOOD (  26.64  )
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

On Mon, Nov 04, 2024 at 02:35:12PM +0100, Arnaud Pouliquen wrote:
> This patch updates the rproc_ops struct to include an optional
> release_fw function.
> 
> The release_fw ops is responsible for releasing the remote processor
> firmware image. The ops is called in the following cases:
> 
>  - An error occurs in rproc_start() between the loading of the segments and
>       the start of the remote processor.
>  - after stopping the remote processor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Updates from version V11:
> - fix typo in @release_fw comment
> ---
>  drivers/remoteproc/remoteproc_core.c | 5 +++++
>  include/linux/remoteproc.h           | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 7694817f25d4..46863e1ca307 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1258,6 +1258,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>  
>  static void rproc_release_fw(struct rproc *rproc)
>  {
> +	if (rproc->ops->release_fw)
> +		rproc->ops->release_fw(rproc);
> +
>  	/* Free the copy of the resource table */
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
> @@ -1377,6 +1380,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  unprepare_subdevices:
>  	rproc_unprepare_subdevices(rproc);
>  reset_table_ptr:
> +	if (rproc->ops->release_fw)
> +		rproc->ops->release_fw(rproc);
>  	rproc->table_ptr = rproc->cached_table;

I suggest the following:

1) Create two new functions, i.e rproc_load_fw() and rproc_release_fw().  The
only thing those would do is call rproc->ops->load_fw() and
rproc->ops->release_fw(), if they are present.  When a TEE interface is
available, ->load_fw() and ->release_fw() become rproc_tee_load_fw() and
rproc_tee_release_fw().

2) Call rproc_load_fw() in rproc_boot(), just before rproc_fw_boot().  If the
call to rproc_fw_boot() fails, call rproc_release_fw().

3) The same logic applies to rproc_boot_recovery(), i.e call rproc_load_fw()
before rproc_start() and call rproc_release_fw() if rproc_start() fails.

4) Take rproc_tee_load_fw() out of rproc_tee_parse_fw().  It will now be called
in rproc_load_fw().

5) As stated above function rproc_release_fw() now calls rproc_tee_release_fw().
The former is already called in rproc_shutdown() so we are good in that front.

With the above the cached_table management within the core remains the same and
we can get rid of patch 3.7.

Thanks,
Mathieu

>  
>  	return ret;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 2e0ddcb2d792..08e0187a84d9 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -381,6 +381,8 @@ enum rsc_handling_status {
>   * @panic:	optional callback to react to system panic, core will delay
>   *		panic at least the returned number of milliseconds
>   * @coredump:	  collect firmware dump after the subsystem is shutdown
> + * @release_fw:	optional function to release the firmware image from ROM memories.
> + *		This function is called after stopping the remote processor or in case of an error
>   */
>  struct rproc_ops {
>  	int (*prepare)(struct rproc *rproc);
> @@ -403,6 +405,7 @@ struct rproc_ops {
>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>  	unsigned long (*panic)(struct rproc *rproc);
>  	void (*coredump)(struct rproc *rproc);
> +	void (*release_fw)(struct rproc *rproc);
>  };
>  
>  /**
> -- 
> 2.25.1
> 

