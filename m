Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FA8606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 07:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ITXsJPP9;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QfSHTVGc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TG1eyQll9htKpm1l6pz9QtWqy0Nr7PBzEnyal9UacVU=; b=ITXsJPP91E9ZbPdxMJ3kW2F6FH
	ptIqFG+qpd5+1hAReNWhnainIG8ee6lwTgBGNE6hZ03tTySyqlnRsFf9fr1Y5fMSEWG83Sieb/1+Z
	ZgzY4AiVpNlI5y2tXNAUNkzKhOtt2TwM05h5SsSuTucHq2OK9Xsz3WJWsz1Ik+LV2y8O9QvJgFe+L
	sfYBh+aiHjvCJUlS2sZkjeCJo6hx0214oK5+6viwFKUR6YvYm1S3AzpC7oza7yyPEswjBCbH9J4g1
	VUKiAh5FAdJW2x7VIAXqXzB71I9eLyAfACuwhCUppflvtp+lJ+sK+mSopm7UDFrvCaqyaAsmNt4LF
	rscI2DYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOs2v-000000082FC-2SBw;
	Thu, 05 Nov 2026 07:38:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOs2u-000000082F6-2EOG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 07:38:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BC65434D8;
	Thu,  5 Nov 2026 07:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D0A1F000C1;
	Thu,  5 Nov 2026 07:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793864284;
	bh=TG1eyQll9htKpm1l6pz9QtWqy0Nr7PBzEnyal9UacVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QfSHTVGcwrQys8RV+6x3At5nZLdDK7XGzGgRHRSu8JWtk8fcy3PA4yCF7uveYwPYD
	 ImifG34ifLN9BxRMKKTAjgZdyiCfbkUvQP5ql/1C/33+Zi1ncYEng4QWnxJf0JXa5L
	 qw0nl+cwTL8lUePSvRKIBnvRzUWN0u9CR7GV55tzleee9tQDeYKoSx/RY+qiwy63zC
	 cf58EcJgLmpbsSc7NkybzCZLbd31V3bV6HVmHWaKfOnS6i2gb6MliyfaeZ2qXnmVkY
	 Haevm1iNN+m9SbjgdfBdMbcebeRQ63uV2XnCUt0LPLtxrdhBqwWWLDWcWi3N7IVLsL
	 iqVkpBK8/wZaw==
Date: Thu, 5 Nov 2026 08:37:59 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/10] irqchip/gic-v5: Clean the allocated linear
 device table size
Message-ID: <auwyV6kcrddK1VKf@red-moon>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261104-host_gicv5_fixes-v2-9-e47ad20ea3c8@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-host_gicv5_fixes-v2-9-e47ad20ea3c8@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 05:48:03PM +0000, Sascha Bischoff wrote:
> When the linear device table exceeds the kmalloc limit, the driver
> caps the DeviceID width before allocation but keeps the original size
> for cache maintenance. On a noncoherent ITS, this cleans beyond the
> allocated table.
> 
> Recalculate the size after capping the DeviceID width.
> 
> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index 4de07bbdc4923..aebab9f306476 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -594,14 +594,14 @@ static int gicv5_its_alloc_devtab_linear(struct gicv5_its_chip_data *its,
>  	 * kmalloc limits so that the system can chug along with a linear
>  	 * device table.
>  	 */
> -	sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
> -	if (sz > KMALLOC_MAX_SIZE) {
> -		u8 device_id_cap = ilog2(KMALLOC_MAX_SIZE/sizeof(*devtab));
> +	if (BIT_ULL(device_id_bits) * sizeof(*devtab) > KMALLOC_MAX_SIZE) {
> +		u8 device_id_cap = ilog2(KMALLOC_MAX_SIZE / sizeof(*devtab));
>  
>  		pr_warn("Limiting device ID bits from %u to %u\n",
>  			device_id_bits, device_id_cap);
>  		device_id_bits = device_id_cap;
>  	}
> +	sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
>  
>  	devtab = kcalloc(BIT(device_id_bits), sizeof(*devtab), GFP_KERNEL);
>  	if (!devtab)
> 
> -- 
> 2.34.1
> 

