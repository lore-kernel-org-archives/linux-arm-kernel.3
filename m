Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDB7C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jf3OMAFii79DvFjzmmOgKmfE+xvffqJHuhaGLaLcFJI=; b=3xSy0OUcRdkKTlrovHMJk8HOQ9
	3EBWbqOnjgNDH6fckUymaqRpAEk+nqh3q+gQcc2F0DJaqqR18sGn891C/hlcVOSz4N545oIhrTKK2
	A2hv4jyPq2WXltgKL+mPUY+6bfPGtSQ/IqLn5n2eQ+LjO78amyVtZEXgw2HXVdb8x0zF10kUZKfwD
	aPoQ0yOzxLLrcf8zdQkcGsSFhiuNRMYhOKZy6rf6aOM3i1XaEBqnc0L2tfh3gVgs9K0raOWyRUUlp
	j28RgZi52DW4JJCG0aueUWxIuwdHOQHzn/hSeyoP/QXfGWJeiXpTrI0Kw0LrKoadtwLmKmG5O+cGA
	84JoR9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nhO-0000000FC2B-1GtA;
	Wed, 02 Sep 2026 16:20:30 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nhL-0000000FC16-3O6H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:20:29 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2d9201076b3so15769645ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 09:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788366026; x=1788970826; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jf3OMAFii79DvFjzmmOgKmfE+xvffqJHuhaGLaLcFJI=;
        b=TPpec9uxAOoAnIjPoYxoSf71wMDxs/Na/3LIfRxSJ6JzE+4mzZzEGqkeN2+miWiUXQ
         d5fhPKg/LXt/stBWXrqnEqPbaa3gpdCmAr4IiXJNoeuYJ26+vUqyNrW+iIh8ytzm77d4
         Ess0BuFCjgWRCfznOZN+Eqym1G4DpNe5TU2cHv6WcBQQuIuJB8MqDfhkpBMMFjwqUAa8
         QaispC35mpoSUjpnHXBSs15DBLJAHzvzL4tOtMcT181uiow7vjDP4q6BOS7X4eyhFKax
         5vd0Mn9HjlKsnPvNhXGYDYylswhw4lZfe4u9QnLj04sEtl8hTJQ829a5wkpMITBXTUzJ
         QKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366026; x=1788970826;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jf3OMAFii79DvFjzmmOgKmfE+xvffqJHuhaGLaLcFJI=;
        b=IJbfGtuuzGMEbJ8ixU9BGeSsXAaB8daaYdl6B42x8We/oGI2l1tOf0Jr6y7ojRQXlL
         i16SDxta84GO+SVFta86suWJPZcJF1AffMIcvLvQbptzEEAnAlUpmFzWMjMCNkkJaU+d
         rKqr4bOWCLwqaB3K8jLN4Rg8Pd2hgw24Z717Mb/evnp8zAwepuAhhIo7TiQBzSu31Pcs
         RjosNuYcL1QyrcZnHI4KA2mTGxL+tWecIHP0QvtQ5i/oqdjA6J17GBGvINs55Tf/Cksy
         RDZN0GvYYnuJ4gMM0ctUpYhiVxl6bvz5N6QY1R8YegzLQPzmHQP/D310CXe85jRZYeP1
         R8mA==
X-Forwarded-Encrypted: i=1; AKwUvBy1CUzjTC8n0EY8Yc1VNEP/Ryf1Pnvuf8Xp2Q5KICccAQ8EPYBqzmDuAhp9VjljESgWRloNF6Q0sf/qaNoeWERW@lists.infradead.org
X-Gm-Message-State: AFuF++l0stuXKF71d2QGvZ9YcyiaK0vVb+cF0Uo/iNh237zS8hoLX5gk
	VLHpjFKb497SN5vcDG5II8EH+ORiCjdaVPMeylNh5lboSyQPgkZ3WBoLxT90eEG/xV0=
X-Gm-Gg: AYBFou07x2tXwUQeFLrQdByLOuhB63HnETCXgd61rWhTsMJKRxvrSb8BYEWA7zngQDH
	aqFnEVeK2zvd/kUwK4cczSQ+EEC5hxUe0RNV1g+tOoQE1mNDPtRxOpg+Y9FuSZzBuAiRsa9aCBH
	EYkBVyS+JACKD/pbeeAJYDpbApX9nce4KA7sXWfWsFo9Cjom5t17+3Ju3j2eRWnMHuLHcqv13oH
	kTgk36oRzfhkg5FF9rGNpUi8yBVQre6hK4tU8fN4Esft5tGkGBVn4ocu6qPQC5L36mAHemmrJgE
	qTgakA/0LUAFVMMyjs0z09BMGnA/FaatRjtxGKstuZ+io3I45bzq0a4jdfRh/2KQ2BBz2EAfrir
	P5YdAdrCZ6J8dIVkKGZrCzxnhVOtnsXDMkT/fZOkUKUcJxgH7lwxeSx/gDw1wIZK/V8Hse2gAo3
	VaV2pus7Jbhk17rh/O/iCYpR1ss9sQxvCmfrAbkqlDMDIoQzQS3Qd+LZeucrAK2kcb
X-Received: by 2002:a17:90b:268d:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39aee023191mr10058955a91.10.1788366025577;
        Wed, 02 Sep 2026 09:20:25 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fff4:86c5:8d86:9e93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0861e54csm169061a91.10.2026.09.02.09.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:20:25 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:20:22 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Marcel Hofmann <marcel@hofmania.de>, peng.fan@nxp.com,
	daniel.baluta@nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
Subject: Re: [PATCH v2] remoteproc: imx_rproc: allow mappings ending at
 region boundary
Message-ID: <aphMxtTvcvTqgqCm@p14s>
References: <20260827123136.438798-1-marcel@hofmania.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827123136.438798-1-marcel@hofmania.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_092027_857547_8879C451 
X-CRM114-Status: GOOD (  29.15  )
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

On Thu, Aug 27, 2026 at 02:31:36PM +0200, Marcel Hofmann wrote:
> From: Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
> 
> The address range checks in imx_rproc_da_to_sys() and
> imx_rproc_da_to_va() use a strict comparison for the exclusive end
> address of the requested range.
> 
> As a result, a valid request that ends exactly at the end of an address
> translation or mapped memory region is rejected. For a region
> [start, start + size), a request [addr, addr + len) is contained when:
> 
>     addr >= start && addr + len <= start + size
> 
> This occurs when a loadable ELF segment fills an entire mapped memory
> region. This can be produced by a linker script that extends the
> resource table section to the end of its designated region:
> 
>     .resource_table :
>     {
>       . = ALIGN(8);
>       KEEP(*(.resource_table)) /* Resource table */
>       . = ALIGN(8);
>       . = ORIGIN(m_rsc_tbl) + LENGTH(m_rsc_tbl);
>     } > m_rsc_tbl =0x00
> 
> This produces a ELF program header like:
> 
>     LOAD  0x010000 0xa4220000 0xa4220000 0x01000 0x01000 R   0x1000
> 
> In this case, the segment size matches the mapped region size exactly,
> causing the address translation to fail with:
> 
>     bad phdr da 0xa4220000 mem 0x1000
> 
> Rework the upper-bound checks to allow ranges ending exactly at the region
> boundary while guarding against integer overflow. 
> 
> Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver")
> Signed-off-by: Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
> ---
> 
> Changes in v2: 
> - Reworked the bounds check to guard against 64-bit integer overflow
> - Use u64 for offset instead of unsigned integer
> - calculate offset first and then validate len against remaining region
>   size
> 
> v1: https://lore.kernel.org/r/20260826155123.AEB731F000E9@smtp.kernel.org/
> 
>  drivers/remoteproc/imx_rproc.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 745ce52cd822..ea852ca143bb 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -540,6 +540,7 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
>  	/* parse address translation table */
>  	for (i = 0; i < dcfg->att_size; i++) {
>  		const struct imx_rproc_att *att = &dcfg->att[i];
> +		u64 offset;
>  
>  		/*
>  		 * Ignore entries not belong to current core:
> @@ -552,9 +553,11 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
>  				continue;
>  		}
>  
> -		if (da >= att->da && da + len < att->da + att->size) {
> -			unsigned int offset = da - att->da;
> +		if (da < att->da)
> +			continue;
>  
> +		offset = da - att->da;
> +		if (offset <= att->size && len <= att->size - offset) {
>  			*sys = att->sa + offset;
>  			if (is_iomem)
>  				*is_iomem = att->flags & ATT_IOMEM;
> @@ -585,9 +588,14 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
>  		return NULL;
>  
>  	for (i = 0; i < IMX_RPROC_MEM_MAX; i++) {
> -		if (sys >= priv->mem[i].sys_addr && sys + len <
> -		    priv->mem[i].sys_addr +  priv->mem[i].size) {
> -			unsigned int offset = sys - priv->mem[i].sys_addr;
> +		u64 offset;
> +
> +		if (sys < priv->mem[i].sys_addr)
> +			continue;
> +
> +		offset = sys - priv->mem[i].sys_addr;
> +		if (offset <= priv->mem[i].size &&
> +		    len <= priv->mem[i].size - offset) {
>  			/* __force to make sparse happy with type conversion */
>  			va = (__force void *)(priv->mem[i].cpu_addr + offset);

This looks sensible.  That said, I would like to see someone on the NXP team
test this patch in different configuration.

Thanks,
Mathieu

>  			break;
> -- 
> 2.55.0
> 

