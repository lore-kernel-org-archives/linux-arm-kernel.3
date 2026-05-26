Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAA7CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 20:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqsXzG3EIwp1sqqf8YZYAAjA95+BZS9vLPguSQeo5Yk=; b=vMpx3GmuBGOazQNGH/3MQJUvVx
	aCA6JKmUxU1FNZJOQjEMiDe11CMQPtJf9/zwbX3LFY8Bb1WyuM0naFtEgw7sf8+TkwcF6C7XZC6dV
	7DUqrYdfiMNhV2KNuutneWc7NcVUrd2Hu89U69Vzt7AiT2ODJZExMeZQ808oKz6cYagspPTl3CUg5
	kSx/kjzM/alohRk9pqdt3dgY5wfSQWRpFMKVLVtnMWvF5zGd/GbJbnBn8s4T+4y0K2xIgGmycvtNF
	1LdgvdhErrot068eLpRq/7/CELnIAyj2Dapfzu7G8Snz2DHPvIOTTVM029ox+axuvSNejAVU86fSq
	poCCH8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRxZ7-00000002uks-3wav;
	Tue, 26 May 2026 19:35:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRxZ6-00000002ukh-3Mpy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 19:35:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 018F160018;
	Tue, 26 May 2026 19:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2820A1F000E9;
	Tue, 26 May 2026 19:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779824147;
	bh=UqsXzG3EIwp1sqqf8YZYAAjA95+BZS9vLPguSQeo5Yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NI2hQmpEQE/z2Z+7tSge10ATcMoE1mRlOv0DhD0ugjyRU8c2YkeTcET/dsexrEUuI
	 NxWxcN5OYV/eg8o9PKGj8IlOs6gyc+Thd8rGvEeP032p2tY+eC/tzPoned/ulilAO/
	 X2S+PGlRRo8VZASpofRBcHQTuJQPIqzh561oweaoJJ4Hi0nOEvLsLGSZBKcJaiF3Z6
	 CxEu+yj+o1BSaHDOci5WbBZn+7dp79waI68V8PVkUWse7BCiYkUbEFOa+huLp5dQ0H
	 /45bVYFa1BKQu1uvIiqFiSFstTPw2GPObKEIkixs/hj1fbmRAT3VOtlTschOIxgRw3
	 CeOXypizc93Sg==
Date: Tue, 26 May 2026 12:35:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH] firmware: arm_ffa: Treat missing FF-A feature on a
 platform as a probe miss
Message-ID: <20260526193543.GB2851089@ax162>
References: <20260526103649.5684-1-sudeep.holla@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526103649.5684-1-sudeep.holla@kernel.org>
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

On Tue, May 26, 2026 at 11:36:49AM +0100, Sudeep Holla wrote:
> When FF-A initialisation is driven from a platform device probe, systems
> that do not implement FF-A can return -EOPNOTSUPP from the early transport
> or version discovery paths. Driver core treats that as a matched probe
> failure and prints:
> 
>   |  arm-ffa arm-ffa: probe with driver arm-ffa failed with error -95
> 
> That is noisy for a firmware interface that can be absent on otherwise
> valid systems. Driver core already treats -ENODEV and -ENXIO as quiet
> rejected matches, so translate only the early unsupported discovery cases
> to -ENODEV. Keep later setup failures unchanged so real FF-A
> initialisation problems are still reported as probe failures.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/all/20260523001148.GA1319283@ax162
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Appears to work for me.

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/firmware/arm_ffa/driver.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index 54984e1b9741..0f468362c288 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -2109,7 +2109,7 @@ static int ffa_probe(struct platform_device *pdev)
>  
>  	ret = ffa_transport_init(&invoke_ffa_fn);
>  	if (ret)
> -		return ret;
> +		return ret == -EOPNOTSUPP ? -ENODEV : ret;
>  
>  	drv_info = kzalloc_obj(*drv_info);
>  	if (!drv_info)
> @@ -2117,8 +2117,11 @@ static int ffa_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, drv_info);
>  
>  	ret = ffa_version_check(&drv_info->version);
> -	if (ret)
> +	if (ret) {
> +		if (ret == -EOPNOTSUPP)
> +			ret = -ENODEV;
>  		goto free_drv_info;
> +	}
>  
>  	if (ffa_id_get(&drv_info->vm_id)) {
>  		pr_err("failed to obtain VM id for self\n");
> -- 
> 2.43.0
> 

-- 
Cheers,
Nathan

