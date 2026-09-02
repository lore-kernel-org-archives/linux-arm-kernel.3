Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C302DC624D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 17:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsI+nhzULsUUSIbVGLobSbdGnJMPqPjlO3ivoC99fNk=; b=X6ISeMAokm9jHGQ1OzLtfKYbHi
	t2LV+1C6xGjFjQitldwrRFBJGHtuSG0ekEreII3PZAnzO+7hORj5Mi5bYjYQyKpuuta+6LyE5m62F
	kIbQP8vdyvq4L7U6c5Pa7py9qUGe8jQK4LuMDo341OP829/pRRw7yEtRhwUFkoHwSC/bZbxEnCKml
	z3OOVQnjjoRojlVY5kolAAzaoKjO14kmR6YRT/d7kV2zq8PI8cV9fez3wbHSWUwTGGsedPT1ShGHZ
	vCsEeWhQFj4QqMVFCBb6RxwWRT1Sd7Dg/WfV97M4w49qvZeCxyYHxvo8Yt87hH/Sz+FNmRBveOPzQ
	zhKY4EWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1our-0000000FT2l-19ly;
	Wed, 02 Sep 2026 17:38:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ouq-0000000FT2a-0M2Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 17:38:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D79040268;
	Wed,  2 Sep 2026 17:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629A91F000E9;
	Wed,  2 Sep 2026 17:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788370707;
	bh=fsI+nhzULsUUSIbVGLobSbdGnJMPqPjlO3ivoC99fNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T6Uzr4pq+Kb+UO4HsQ0X42ZQMwEqrNkLYI01z+d2YhKthM8zctAHyrriDmaHx4SzQ
	 aOqXsOPVcxNp5lj/SPnwfFKiaT7ZtsWIe1KheN4h+Ml8Al4W4oHiTCGKrfaq1Bw+aG
	 /vOTnHhel0XgusHtqAAQ15PacrnKnFeT6PElkPfnrsoAI71YQMp6glvP0d2VtCRYJP
	 Ikv6Em1jxZ8eUs/xdMnZmToKnAemXxHkr13Nwl/ucjDhwipTmwTr0OSYTe8se5zH/i
	 8vow2FHxR4TAQTO0V3RML/oWzxwCcFFeozjODhkhkYxpAXcQ1Ze8iSkxqp49wtEN+c
	 iRzeRHCPdTozg==
Date: Wed, 2 Sep 2026 12:38:26 -0500
From: Rob Herring <robh@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, mark.rutland@arm.com, sumit.garg@kernel.org,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 09/10] firmware: arm_ffa: Introduce ffa-lend-pool
Message-ID: <20260902173826.GC1440252-robh@kernel.org>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-10-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902104712.2399797-10-vdonnefort@google.com>
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

On Wed, Sep 02, 2026 at 11:47:11AM +0100, Vincent Donnefort wrote:
> When memory is lent to the Secure world via FF-A, fatal CPU speculative
> reads from Non-Secure can still occur as long as it retains a cacheable
> mapping to that memory. Introduce the "arm,ffa-lend-pool"
> reserved-memory CMA driver to unmap pages before lending
> (ffa_prepare_lend()) and restore them upon reclaim
> (ffa_lend_reclaimed()). Devices bind to the pool via the "memory-region"
> DT property or via ffa_lend_pool_attach().
> 
>   reserved-memory {
>       #address-cells = <0x2>;
>       #size-cells = <0x2>;
>       ranges;
> 
>       ffa_lend: ffa-lend-pool {
>           compatible = "arm,ffa-lend-pool";

Needs a binding schema...

>           reusable;
>           ll-map;
>           size = <0x0 0x4000000>;
>       };
>   };
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

[...]

> +static int __init ffa_lend_pool_setup(unsigned long node, struct reserved_mem *rmem)
> +{
> +	struct cma *cma;
> +	int ret;
> +
> +	if (!of_get_flat_dt_prop(node, "reusable", NULL) ||
> +	    of_get_flat_dt_prop(node, "no-map", NULL)) {
> +		pr_err("FF-A lend pool: node must be 'reusable' and not 'no-map'\n");
> +		return -EINVAL;

Your schema should enforce/check this.

[...]

> +static const struct reserved_mem_ops ffa_lend_pool_ops = {
> +	.node_init	= ffa_lend_pool_setup,
> +	.device_init	= ffa_lend_pool_device_init,
> +	.device_release = ffa_lend_pool_device_release,
> +};
> +RESERVEDMEM_OF_DECLARE(ffa_lend_pool, "arm,ffa-lend-pool", &ffa_lend_pool_ops);

Do you need this early? If not, you can create a platform driver for 
"arm,ffa-lend-pool". ramoops is implemented that way for example.

Rob

