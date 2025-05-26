Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9172FC5B542
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 08:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObfcIcKvJcdbwheA42Zk4t+KIbiTkS4fsOxskFvJ9TQ=; b=1kXI6oKiqleMZdjetqAT4gRSCa
	oqToHv81RJFObRcL4qCEt3hsR1KDmujoius1ohZb8mz40BsyiFZhvZKSAtTvkB0MIdBSA8uwKIfgZ
	RlakRZyOcr24euEMjmQwGUU7mXwtWBxw9xGW6fLUMae5tDVVFVh8SuIotE3XMFNVYgOUS3Ff/XJfe
	af05i94VOcphDVntBrFHQjbNt7CsXVdfLo12e0eAFAucdqCao/XfZZuopEuavCvVU5QIQzI6L9KSM
	2bbe2B5U6y8vrkakLmM7o+r57rBxAD5KecbXDuBDGkpPCCPr47neLnNR4Y73THH7Q2zyQgdECAxlk
	Hi2VTGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJT4u-00000008NLP-1vxM;
	Mon, 26 May 2025 08:21:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSy4-00000008MOW-2hJk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 08:13:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 177986112E;
	Mon, 26 May 2025 08:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A82C4CEEF;
	Mon, 26 May 2025 08:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748247235;
	bh=1FEQ33EDgRQThqrYNVwsS/ECQVP2rLowPOJ80r0AksE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=agdSSmCbJrmUXnITkYok9W4XfBvVB3JWo5GH7/dUZ9OT3dikuYr7e8Jk3qFWtEget
	 w/e3Tg4Xa5FJo2ZWKv/DtFisTjezwtQ0tRlsVDf1IIUcRak8q9MzXq45Ch8UfkYClb
	 ka3PsgQmgIVO6YONcdIrFSl+IAerxjmNQjGUlEEzZ9SttcolFiC0lmQsjnsiLwGX4j
	 HN51afGR8nZvZ8JZC19m42t//vGUbVlaavR7ykLnO5rN7/iAXZy2QnloB7CyOb0pKU
	 6AB9wlpNLcpMmiY+RTCrrkyePD1fe3IeqNWdRyIeT6vXVuRups6lO42EbG7qLy2kaw
	 NrXyQoUuDiD5g==
Date: Mon, 26 May 2025 13:43:41 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Subject: Re: [PATCH v9 9/9] optee: smc abi: dynamic protected memory
 allocation
Message-ID: <aDQitSd27Z4qC0xT@sumit-X1>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-10-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520152436.474778-10-jens.wiklander@linaro.org>
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

On Tue, May 20, 2025 at 05:16:52PM +0200, Jens Wiklander wrote:
> Add support in the OP-TEE backend driver for dynamic protected memory
> allocation using the SMC ABI.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/smc_abi.c | 102 ++++++++++++++++++++++++++++++------
>  1 file changed, 85 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index f3cae8243785..6b3fbe7f0909 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -965,6 +965,70 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
>  	return rc;
>  }
>  
> +static int optee_smc_lend_protmem(struct optee *optee, struct tee_shm *protmem,
> +				  u16 *end_points, unsigned int ep_count,
> +				  u32 use_case)
> +{
> +	struct optee_shm_arg_entry *entry;
> +	struct optee_msg_arg *msg_arg;
> +	struct tee_shm *shm;
> +	u_int offs;
> +	int rc;
> +
> +	msg_arg = optee_get_msg_arg(optee->ctx, 2, &entry, &shm, &offs);
> +	if (IS_ERR(msg_arg))
> +		return PTR_ERR(msg_arg);
> +
> +	msg_arg->cmd = OPTEE_MSG_CMD_LEND_PROTMEM;
> +	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
> +	msg_arg->params[0].u.value.a = use_case;
> +	msg_arg->params[1].attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
> +	msg_arg->params[1].u.tmem.buf_ptr = protmem->paddr;
> +	msg_arg->params[1].u.tmem.size = protmem->size;
> +	msg_arg->params[1].u.tmem.shm_ref = (u_long)protmem;
> +
> +	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
> +	if (rc)
> +		goto out;
> +	if (msg_arg->ret != TEEC_SUCCESS) {
> +		rc = -EINVAL;
> +		goto out;
> +	}
> +	protmem->sec_world_id = (u_long)protmem;
> +
> +out:
> +	optee_free_msg_arg(optee->ctx, entry, offs);
> +	return rc;
> +}
> +
> +static int optee_smc_reclaim_protmem(struct optee *optee,
> +				     struct tee_shm *protmem)
> +{
> +	struct optee_shm_arg_entry *entry;
> +	struct optee_msg_arg *msg_arg;
> +	struct tee_shm *shm;
> +	u_int offs;
> +	int rc;
> +
> +	msg_arg = optee_get_msg_arg(optee->ctx, 1, &entry, &shm, &offs);
> +	if (IS_ERR(msg_arg))
> +		return PTR_ERR(msg_arg);
> +
> +	msg_arg->cmd = OPTEE_MSG_CMD_RECLAIM_PROTMEM;
> +	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
> +	msg_arg->params[0].u.rmem.shm_ref = (u_long)protmem;
> +
> +	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
> +	if (rc)
> +		goto out;
> +	if (msg_arg->ret != TEEC_SUCCESS)
> +		rc = -EINVAL;
> +
> +out:
> +	optee_free_msg_arg(optee->ctx, entry, offs);
> +	return rc;
> +}
> +
>  /*
>   * 5. Asynchronous notification
>   */
> @@ -1216,6 +1280,8 @@ static const struct optee_ops optee_ops = {
>  	.do_call_with_arg = optee_smc_do_call_with_arg,
>  	.to_msg_param = optee_to_msg_param,
>  	.from_msg_param = optee_from_msg_param,
> +	.lend_protmem = optee_smc_lend_protmem,
> +	.reclaim_protmem = optee_smc_reclaim_protmem,
>  };
>  
>  static int enable_async_notif(optee_invoke_fn *invoke_fn)
> @@ -1586,11 +1652,14 @@ static inline int optee_load_fw(struct platform_device *pdev,
>  
>  static int optee_protmem_pool_init(struct optee *optee)
>  {
> +	bool protm = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM;
> +	bool dyn_protm = optee->smc.sec_caps &
> +			 OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM;
>  	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> -	struct tee_protmem_pool *pool;
> -	int rc;
> +	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
> +	int rc = -EINVAL;
>  
> -	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM) {
> +	if (protm) {
>  		union {
>  			struct arm_smccc_res smccc;
>  			struct optee_smc_get_protmem_config_result result;
> @@ -1598,26 +1667,26 @@ static int optee_protmem_pool_init(struct optee *optee)
>  
>  		optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
>  				     0, 0, 0, &res.smccc);
> -		if (res.result.status != OPTEE_SMC_RETURN_OK) {
> -			pr_err("Secure Data Path service not available\n");
> -			return 0;
> -		}
> -		rc = optee_set_dma_mask(optee, res.result.pa_width);
> +		if (res.result.status == OPTEE_SMC_RETURN_OK)
> +			rc = optee_set_dma_mask(optee, res.result.pa_width);

This change should be folded in patch 7/9.

>  		if (!rc)
>  			pool = tee_protmem_static_pool_alloc(res.result.start,
>  							     res.result.size);
> -		if (IS_ERR(pool))
> -			return PTR_ERR(pool);
> +	}
>  
> +	if (dyn_protm && IS_ERR(pool))
> +		pool = optee_protmem_alloc_dyn_pool(optee, heap_id);
> +
> +	if (!IS_ERR(pool)) {
>  		rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
>  		if (rc)
> -			goto err;
> +			pool->ops->destroy_pool(pool);
>  	}
>  
> +	if (protm || dyn_protm)
> +		return rc;
> +
>  	return 0;
> -err:
> -	pool->ops->destroy_pool(pool);
> -	return rc;
>  }
>  
>  static int optee_probe(struct platform_device *pdev)
> @@ -1788,9 +1857,8 @@ static int optee_probe(struct platform_device *pdev)
>  		pr_info("Asynchronous notifications enabled\n");
>  	}
>  
> -	rc = optee_protmem_pool_init(optee);
> -	if (rc)
> -		goto err_notif_uninit;
> +	if (optee_protmem_pool_init(optee))
> +		pr_info("Protected memory service not available\n");

This change can be folded in patch 7/9.

Rest looks good to me.

-Sumit

>  
>  	/*
>  	 * Ensure that there are no pre-existing shm objects before enabling
> -- 
> 2.43.0
> 

