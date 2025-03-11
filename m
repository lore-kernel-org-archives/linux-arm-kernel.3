Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AEDC2BA1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 08:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2OUtjUvOZ9zxMihiTmpFy6kD5qxMhWOXI3qeEENs1k=; b=0bIa99G6j3Hd3vXsbeGDjMkVWb
	JCEJBUGxpb4bamWUCcaIW7YQZKOYQGguiLl8uUfb3nXl8h9gPSsDzy0Txcm35ArY1o+lIqdp/AmnP
	UqY8bWnIV6ftyo1Ud1WBzWL5eUVC7nV1qMLFRyYsgBNZBHQpxLolrWznVgi/FgkHpFNFpmuoXBjvk
	7JzIvUoq/cv8s61iuKFB0wqQExu0JrFEl68kxMNc2is5rweUVETZ0kd/XwFO2grFXc2e+CQX261e0
	VLjEn+BWvPdgZdc589zGEF+WA/SmGfMUS7u7qHehJ63MO9E/p4MjZ7Mq3ulaxIlj5pP4mUhMRGUle
	M/5DE03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1truak-00000004w6V-1m8U;
	Tue, 11 Mar 2025 08:03:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1truPj-00000004uhv-2QZu;
	Tue, 11 Mar 2025 07:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741679553;
	bh=EimAiqOb8wjiUPBJICf8ehV1iDRon72lxCFcAtQyG1A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RC5XNDhswZec48hvGwJO3Ne0/FLgT7vITlZQ0t2ppxFhr8b6Yinjer64D49aJuXVm
	 fb9xWd3Gx9HrmuCr1BCZpoc4Ys4/wHamUXeX56j75E+9niet0Ku/ZEjbQwrIME+QYy
	 WbzAXLVyPRvs4dFaPXa+azYplQUMs8IMaY/r9XlLbb2iLnIlMo21YzuQH4cV4kGg+j
	 RnMiqz2lA5/i5lJfPYa7YhSyD/+RDtCEmSHM9r+ekNcwNvkNux4Dt9hBoEsUuEL9qP
	 aq17fyGgqimLjGUfkXGm3OjulnGBOaImG4LYUH4Gm3JXD+EjbgQXQ/ThqNupvPZlHR
	 qd+uYu7o8NyiA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A8B5817E0237;
	Tue, 11 Mar 2025 08:52:32 +0100 (CET)
Date: Tue, 11 Mar 2025 08:51:58 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com
Subject: Re: [PATCH v1 3/6] drm/panfrost: Unify panfrost_mmu_enable/disable
 common code
Message-ID: <20250311085158.37329b0c@collabora.com>
In-Reply-To: <20250310195921.157511-4-ariel.dalessandro@collabora.com>
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
	<20250310195921.157511-4-ariel.dalessandro@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_005235_767991_9669CB6F 
X-CRM114-Status: GOOD (  17.01  )
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

On Mon, 10 Mar 2025 16:59:18 -0300
Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:

> Both these functions write to MMU_AS_CONTROL register in the same way.
> Define a common _panfrost_mmu_as_control_write function with the shared
> code.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 33 ++++++++++++-------------
>  1 file changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 294f86b3c25e7..31df3a96f89bd 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -121,38 +121,37 @@ static int mmu_hw_do_operation(struct panfrost_device *pfdev,
>  	return ret;
>  }
>  
> -static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
> +static void
> +_panfrost_mmu_as_control_write(struct panfrost_device *pfdev, u32 as_nr,
> +			       u64 transtab, u64 memattr)

I'm honestly not convinced this is needed. Let's just stick to
panfrost_mmu_enable/disable().

>  {
> -	int as_nr = mmu->as;
> -	struct io_pgtable_cfg *cfg = &mmu->pgtbl_cfg;
> -	u64 transtab = cfg->arm_mali_lpae_cfg.transtab;
> -	u64 memattr = cfg->arm_mali_lpae_cfg.memattr;
> -
>  	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
>  
>  	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
>  	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
>  
> -	/* Need to revisit mem attrs.
> -	 * NC is the default, Mali driver is inner WT.
> -	 */
>  	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
>  	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
>  
>  	write_cmd(pfdev, as_nr, AS_COMMAND_UPDATE);
>  }
>  
> -static void panfrost_mmu_disable(struct panfrost_device *pfdev, u32 as_nr)
> +static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
>  {
> -	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
> -
> -	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), 0);
> -	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), 0);
> +	int as_nr = mmu->as;
> +	struct io_pgtable_cfg *cfg = &mmu->pgtbl_cfg;
> +	u64 transtab = cfg->arm_mali_lpae_cfg.transtab;
> +	u64 memattr = cfg->arm_mali_lpae_cfg.memattr;
>  
> -	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), 0);
> -	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), 0);
> +	/* Need to revisit mem attrs.
> +	 * NC is the default, Mali driver is inner WT.
> +	 */
> +	_panfrost_mmu_as_control_write(pfdev, as_nr, transtab, memattr);
> +}
>  
> -	write_cmd(pfdev, as_nr, AS_COMMAND_UPDATE);
> +static void panfrost_mmu_disable(struct panfrost_device *pfdev, u32 as_nr)
> +{
> +	_panfrost_mmu_as_control_write(pfdev, as_nr, 0, 0);
>  }
>  
>  u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)


