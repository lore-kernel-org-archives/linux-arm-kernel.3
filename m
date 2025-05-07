Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1D1C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 12:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GnhEISw3uGIDyfHb0gPweyuJLRblMAvgxFm4MZzLf4=; b=T9Ni4isrxrjvxqkzyTXKZH7KbT
	8mAb/2KzbuL4n2M7BwNG8IDg9554EWoHfd9ibH0xYR80fyJ6DMxDQ+xgqBkNHgYRWmwzpg7WJw1DM
	RSanrJtLYcHhdMg/ei91frShUtNmV5ICMG1DeNvxBTcw0FVnn1mW67cz4CCirmgseahY9X6BMRkAo
	/X/KdjXkJ42GLuqpOnIildbJWSk/lwyffh7/oAbacp+CxqkcFhOhPDyk0499VvrykDWBahF+Ovs7D
	go5HqpBxiIutS0kgkjnqZcwu0lY2VPLYgK9tnSb2cuAy7Yr22E7qX0osuPvXTdH/ZSBr9VwxFXTyp
	6Vk2Npvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeIr-0000000FU1u-0t89;
	Wed, 07 May 2025 12:55:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeGu-0000000FTmY-2hUz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 12:53:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EC585629D5;
	Wed,  7 May 2025 12:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1640C4CEE7;
	Wed,  7 May 2025 12:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746622391;
	bh=im10zCPO48DJVksV0r0nTYWoHjvZi8pKqsbOdSPnI58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMfaLJUD9Ygyo0cTN4iwPP+0E+c5nPnoxz1KeP/YcUUFrLae7FrribbCy0tCLU/KG
	 /8wfJceYEZ9Vp9S4Er0xYCyYGWirlcpNAmsa4vxh5/CESwZCrat3ritG7fLzoefLy5
	 AGVFS+rtCtaPxt1OPZMjl7PyEVUFNR9g+NLvdgiuuQ9du+UStu9guAKi7HknZHWBsM
	 XGV3jwrcOoMa2uO2vkjx/KGcbCLQk1obRfRBmTRk4lxPTQGh2M1jKNrEqDx313R4MA
	 qjNMIfQaBoNdNwTmrLF9JM94fwr93ky3ZnTroaMnYXAyJb7SH+ZZ0Jnu82MVKcaWO/
	 XA9geYEFtG8AQ==
Date: Wed, 7 May 2025 18:23:01 +0530
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
Subject: Re: [PATCH v8 07/14] tee: refactor params_from_user()
Message-ID: <aBtXrbZ6DByMl6b4@sumit-X1>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-8-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502100049.1746335-8-jens.wiklander@linaro.org>
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

On Fri, May 02, 2025 at 11:59:21AM +0200, Jens Wiklander wrote:
> Break out the memref handling into a separate helper function.
> No change in behavior.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/tee_core.c | 94 ++++++++++++++++++++++++------------------
>  1 file changed, 54 insertions(+), 40 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 685afcaa3ea1..820e394b9054 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -353,6 +353,55 @@ tee_ioctl_shm_register(struct tee_context *ctx,
>  	return ret;
>  }
>  
> +static int param_from_user_memref(struct tee_context *ctx,
> +				  struct tee_param_memref *memref,
> +				  struct tee_ioctl_param *ip)
> +{
> +	struct tee_shm *shm;
> +
> +	/*
> +	 * If a NULL pointer is passed to a TA in the TEE,
> +	 * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
> +	 * indicating a NULL memory reference.
> +	 */
> +	if (ip->c != TEE_MEMREF_NULL) {
> +		/*
> +		 * If we fail to get a pointer to a shared
> +		 * memory object (and increase the ref count)
> +		 * from an identifier we return an error. All
> +		 * pointers that has been added in params have
> +		 * an increased ref count. It's the callers
> +		 * responibility to do tee_shm_put() on all
> +		 * resolved pointers.
> +		 */
> +		shm = tee_shm_get_from_id(ctx, ip->c);
> +		if (IS_ERR(shm))
> +			return PTR_ERR(shm);
> +
> +		/*
> +		 * Ensure offset + size does not overflow
> +		 * offset and does not overflow the size of
> +		 * the referred shared memory object.
> +		 */
> +		if ((ip->a + ip->b) < ip->a ||
> +		    (ip->a + ip->b) > shm->size) {
> +			tee_shm_put(shm);
> +			return -EINVAL;
> +		}
> +	} else if (ctx->cap_memref_null) {
> +		/* Pass NULL pointer to OP-TEE */
> +		shm = NULL;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	memref->shm_offs = ip->a;
> +	memref->size = ip->b;
> +	memref->shm = shm;
> +
> +	return 0;
> +}
> +
>  static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>  			    size_t num_params,
>  			    struct tee_ioctl_param __user *uparams)
> @@ -360,8 +409,8 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>  	size_t n;
>  
>  	for (n = 0; n < num_params; n++) {
> -		struct tee_shm *shm;
>  		struct tee_ioctl_param ip;
> +		int rc;
>  
>  		if (copy_from_user(&ip, uparams + n, sizeof(ip)))
>  			return -EFAULT;
> @@ -384,45 +433,10 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> -			/*
> -			 * If a NULL pointer is passed to a TA in the TEE,
> -			 * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
> -			 * indicating a NULL memory reference.
> -			 */
> -			if (ip.c != TEE_MEMREF_NULL) {
> -				/*
> -				 * If we fail to get a pointer to a shared
> -				 * memory object (and increase the ref count)
> -				 * from an identifier we return an error. All
> -				 * pointers that has been added in params have
> -				 * an increased ref count. It's the callers
> -				 * responibility to do tee_shm_put() on all
> -				 * resolved pointers.
> -				 */
> -				shm = tee_shm_get_from_id(ctx, ip.c);
> -				if (IS_ERR(shm))
> -					return PTR_ERR(shm);
> -
> -				/*
> -				 * Ensure offset + size does not overflow
> -				 * offset and does not overflow the size of
> -				 * the referred shared memory object.
> -				 */
> -				if ((ip.a + ip.b) < ip.a ||
> -				    (ip.a + ip.b) > shm->size) {
> -					tee_shm_put(shm);
> -					return -EINVAL;
> -				}
> -			} else if (ctx->cap_memref_null) {
> -				/* Pass NULL pointer to OP-TEE */
> -				shm = NULL;
> -			} else {
> -				return -EINVAL;
> -			}
> -
> -			params[n].u.memref.shm_offs = ip.a;
> -			params[n].u.memref.size = ip.b;
> -			params[n].u.memref.shm = shm;
> +			rc = param_from_user_memref(ctx, &params[n].u.memref,
> +						    &ip);
> +			if (rc)
> +				return rc;
>  			break;
>  		default:
>  			/* Unknown attribute */
> -- 
> 2.43.0
> 

