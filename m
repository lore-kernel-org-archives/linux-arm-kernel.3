Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE9CCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 16:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHPDYQbyPP1ku3yBPr6G5hWWFQvi7Z4+YXceflcUoUE=; b=dF4i6S138huKBo7+vgyjVfH7LG
	Dd4ACK4cCF1LX1g4ud2Y6NwrpWj+0400XjVF45LRFeIZXB195Hu3ADNcowVi7qI/F35El7ShxsdZt
	pAbVUWftxX1LIYygPPixLxHX4C6ib/1MxY7vpXGVVxxAONMxsJ2IWyjUBrnQt24x0r/ck5eJYzsqJ
	Fb67MFrkuFML1mzmwxXneTo/uC/VMZgvbF1683ILtQwPJhDYzpdU7MAlkx5uMtqYX6T13poZiYMQp
	DLShu5+AAqxUAdqUVezcFl/T174xCkOz1LnYwMGyO3xvnVl8iaajpbpyC/SyvCGxNwI1vAkS4n52E
	BdecGLqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgM7-0000000C4AI-184x;
	Fri, 02 Oct 2026 16:43:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgM6-0000000C4A5-2oLI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 16:43:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BDCBF60214;
	Fri,  2 Oct 2026 16:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501091F000FF;
	Fri,  2 Oct 2026 16:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790959409;
	bh=sHPDYQbyPP1ku3yBPr6G5hWWFQvi7Z4+YXceflcUoUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oyf7DrWXsPmbKy8znM9DpP18qVBew8jD+mX6KMuUW7h0hSR8uR2+Z9YFavg5A1Gmb
	 Gx+rJT7zxzdsiD760v+6u1+uIGoohC9HT410iZpEeQMdWOHRuO8MfAIEruMEaSI16E
	 +UPbKHD34W+47OMoA3wro6E9qyC+fibAjwcJ+69CGYskb5LrqB3h2ki81EcuMM5sJ/
	 GIKYq1nZQt+5OCPU8Hm+cFMCWOaPc1FfEoQQRRlf3+FmRtj4wjxi1+DdH6RLl/46sD
	 wF44GeRcBI2oiMvs23S9olNR912JtujBAWNNDyOHN0Wz/rbX+z3Gfk0mST5ZEDWoou
	 d36z++H2evNvA==
Date: Fri, 2 Oct 2026 17:43:24 +0100
From: Will Deacon <will@kernel.org>
To: phucduc.bui@gmail.com
Cc: Mark Rutland <mark.rutland@arm.com>, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf/arm-smmuv3: Propagate errors from optional IRQ
 lookup
Message-ID: <ar_fLAeFU4rmrwiH@willie-the-truck>
References: <20260811041934.7609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811041934.7609-1-phucduc.bui@gmail.com>
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

On Tue, Aug 11, 2026 at 11:19:34AM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available, while other errors should be propagated.
> 
> Propagate all error codes returned by platform_get_irq_optional() other
> than -ENXIO.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  drivers/perf/arm_smmuv3_pmu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
> index 621f02a7f43b..6c942697e57f 100644
> --- a/drivers/perf/arm_smmuv3_pmu.c
> +++ b/drivers/perf/arm_smmuv3_pmu.c
> @@ -893,6 +893,8 @@ static int smmu_pmu_probe(struct platform_device *pdev)
>  	}
>  
>  	irq = platform_get_irq_optional(pdev, 0);
> +	if (irq < 0 && irq != -ENXIO)
> +		return irq;

Not sure about this. If it's optional, why should we bail the probe if
we don't manage to get an irq? Surely it's better to continue without
the interrupt in that case?

Will

