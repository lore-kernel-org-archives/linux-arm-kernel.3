Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C9CC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 11:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTGOoSFejSCt7RSvWMxFGw3nfuTQT9HDRX1Wlrbc3hQ=; b=OPE+ix+m2Ptrg+2aLW9ZUrF8ws
	yQo30FGnDTqGQmSUSvsoE3bZx26dfErscKXiWHXxSjvZ6ftbP9f1mnLvanVq+9Y6RJsFdm4X+yhYL
	Ij8vRhlQeVSaVgHqdaiIGqmBm0ExSBsXv1dHHzIa1v8MdUHKG/IxO9SN138BLttohK8kMKZhM5dJA
	7Ff08bXah358ccUUW0x6Hu79aBb4nK0+9WykWHB1xLp6l8K4kXhPPgn5TKyUO7LiBqPhE6oZ71V3I
	FEOM6OSjzYXiF5qCmyoGniPlZkwEPSr3FxZ4DhCeEj4zHpwQpb634laZmFkAu4tAaF2p0G0SnPDiy
	9BoxWH2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRUiO-0000000740V-1Bke;
	Tue, 17 Jun 2025 11:42:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRUeN-000000073QC-2ADE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 11:38:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C6EA5C5C03;
	Tue, 17 Jun 2025 11:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F29AC4CEE3;
	Tue, 17 Jun 2025 11:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750160326;
	bh=8caphRgx/Rs0Kb+XhmCJDHdciuqN6WMkJ9hS4WogXqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IsKgShY2HGqcseW/I48vr8m3HGQxCBoBbmUO8KVWAF6i4R1GO+H7i0/DfsuyYw7bg
	 xb9DFEtIW5Q1YwyNmi1YyyQrHJtWSrFEm3bLoOl4QE2nLxvU5DqXcXAXgyuprpWU6C
	 4TjJFVxLjXSJ5QLW3EqsV8m471NxhS3H6lD9fKyG/2MORJuybO/2y02vk46iHCvjp8
	 SsCEKzDhMu8f8byZc525vTh33DaMLRGK8SnFRQYM+Hi/VBmDpd2w5Z2ucXc12Cblhy
	 wc2KZHWZY5JQCsICR9Q96908oU0ZTHQQ0wAgodsM2Eklv+wb1YuRKGd5V6f1Woq5NF
	 385G3ffjQh3GA==
Date: Tue, 17 Jun 2025 17:08:37 +0530
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
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	robin.murphy@arm.com
Subject: Re: [PATCH v10 9/9] optee: smc abi: dynamic protected memory
 allocation
Message-ID: <aFFTvU-xXogA-ctF@sumit-X1>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-10-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610131600.2972232-10-jens.wiklander@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_043847_639657_EF85DD5B 
X-CRM114-Status: GOOD (  19.76  )
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

On Tue, Jun 10, 2025 at 03:13:53PM +0200, Jens Wiklander wrote:
> Add support in the OP-TEE backend driver for dynamic protected memory
> allocation using the SMC ABI.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/smc_abi.c | 78 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 75 insertions(+), 3 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index cf106d15e64e..fd1d873de941 100644
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
> @@ -1628,14 +1694,20 @@ static struct tee_protmem_pool *static_protmem_pool_init(struct optee *optee)
>  
>  static int optee_protmem_pool_init(struct optee *optee)
>  {
> +	bool protm = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM;
> +	bool dyn_protm = optee->smc.sec_caps &
> +			 OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM;
>  	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
>  	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
> -	int rc;
> +	int rc = -EINVAL;
>  
> -	if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM))
> +	if (!protm && !dyn_protm)
>  		return 0;
>  
> -	pool = static_protmem_pool_init(optee);
> +	if (protm)
> +		pool = static_protmem_pool_init(optee);
> +	if (dyn_protm && IS_ERR(pool))
> +		pool = optee_protmem_alloc_dyn_pool(optee, heap_id);
>  	if (IS_ERR(pool))
>  		return PTR_ERR(pool);
>  
> -- 
> 2.43.0
> 

