Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38806C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mCtC/L2QMQLg4bx/Ud1/wKXg5QWFkydGDGZIq6OhZ8=; b=o0pcZrSJBk/gredJfLajQiQmx7
	3sEckiQ3+nB00ySKL5BcBUbmofrhDqXxdijpgcnBa3TgHr5q2RoGZMDJ56Oe5XNBTSh0Iaa9mGbHu
	6U5DqfQKKbNvogp3f3iqI8GIQM8XegRwFhceO/PYqkf4tI6iBsONX4RaGa9Chj/pxbDKeunvOo3gu
	MBgwqCAr1Qcj0n3JCo4YBYfSx1NmmNwsfK/KD/hG2QhqM1gzqpJbLGlYwo9jWu0yGxW/tcnyGRNoj
	YISp9hS9ZVzq3gzQZZRYHeFM4BcdLyCF5iBunP/7/XRdYxxrIrCQdID4oZUd1ViBfXMkxTLkFoEah
	RSArqDrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiah-0000000GLSe-2vDK;
	Wed, 07 May 2025 17:29:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCi4H-0000000GDpV-2jEe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 16:56:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA68942B5E;
	Wed,  7 May 2025 16:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F83C4CEE2;
	Wed,  7 May 2025 16:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746636984;
	bh=oQ6WF29+uZRNzzdfsh2Zj16NWn6C+aHAcSkHXBwTYaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rHMrd1H5Uhjvtskg8ZmSJ7heWfsXFotg/RaaElsTxnu/6+vwNCJHDG52PLrA6mEtT
	 Bz2MrH1iqRZrmbA++3wbd7SlosLxT0houbvBmidoK2LICRPWfqgRemAL8qBG60KO3y
	 tQTW9kdXFzaIsj5AsmbJmyd1z7SzWPP6qrQtGBB1DmYhUblO6NDg0f+/xoIjftL8x5
	 6M6/+h1OuYWneVr1lVlQJg47++xHPrOy/93AtfdiCnnG63BRmlYvKC4eABfn0iPDUP
	 lhmWM3I5FQnRmgY45xVeVWfaq0sd0abTY+vY3cbHQrQjXctoFYHn0lAL+Qpy/S+vBu
	 VYRpEeu6v19zQ==
Date: Wed, 7 May 2025 09:56:22 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, 
	rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org, 
	pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org, konradybcio@kernel.org, 
	dietmar.eggemann@arm.com, juri.lelli@redhat.com
Subject: Re: [RFC][PATCH 04/14] soc: qcom: smem: add minidump device
Message-ID: <voqxvemo6w7zmoo45yb7wlei6gz4wd4m7vdgvclptzx7y7avht@4x77c3frno32>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-5-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422113156.575971-5-eugen.hristev@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_095625_706705_36CFC15B 
X-CRM114-Status: GOOD (  19.20  )
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

On Tue, Apr 22, 2025 at 02:31:46PM +0300, Eugen Hristev wrote:
> Add a minidump platform device.

Please provide a bit more context here.

> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---
>  drivers/soc/qcom/smem.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index 592819701809..985147b563f8 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -270,6 +270,7 @@ struct smem_region {
>   * @partitions: list of partitions of current processor/host
>   * @item_count: max accepted item number
>   * @socinfo:	platform device pointer
> + * @mdinfo:	minidump device pointer
>   * @num_regions: number of @regions
>   * @regions:	list of the memory regions defining the shared memory
>   */
> @@ -280,6 +281,7 @@ struct qcom_smem {
>  
>  	u32 item_count;
>  	struct platform_device *socinfo;
> +	struct platform_device *mdinfo;
>  	struct smem_ptable *ptable;
>  	struct smem_partition global_partition;
>  	struct smem_partition partitions[SMEM_HOST_COUNT];
> @@ -1236,12 +1238,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
>  	if (IS_ERR(smem->socinfo))
>  		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
>  
> +	smem->mdinfo = platform_device_register_data(&pdev->dev, "qcom-md",

Let's spell out "minidump" here.

Regards,
Bjorn

> +						     PLATFORM_DEVID_AUTO, NULL,
> +						     0);
> +	if (IS_ERR(smem->mdinfo))
> +		dev_err(&pdev->dev, "failed to register platform md device\n");
> +
>  	return 0;
>  }
>  
>  static void qcom_smem_remove(struct platform_device *pdev)
>  {
>  	platform_device_unregister(__smem->socinfo);
> +	if (!IS_ERR(__smem->mdinfo))
> +		platform_device_unregister(__smem->mdinfo);
>  
>  	hwspin_lock_free(__smem->hwlock);
>  	__smem = NULL;
> -- 
> 2.43.0
> 

