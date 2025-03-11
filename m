Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D026C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 13:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+f8Kek21jSS/vF/5c35N051Do/tp8+UE9ctaplwonPU=; b=gUAqYcwyg67FQ7LB4GsRDBiZEt
	DGYDttVVcIMN3jwhIi0Ql65jbjz63NZGO5vISSi1QQw5g9iNZVUIYW+WVkqW4b0YM5Y+mHEIismvQ
	zxHx+MLnoAR2rEgTvBa6cRGUusdGOnS/gTwtEBuCf6F6gWWYAYD/+329J+1MCoyX9VFMIhMyoGxJl
	tWaEJYiY3m6uk81JFEAYMBcrcDUQsW7l1hpq8Sm9SgEOXGPpTSXFZu3etb1WipxR4t2qkk+iLTuM3
	A1NFL8LAAk31GgOAph1Nms3Ga+Zd4O3Xm2piBgpNDJfkal1iBcoPDoG8UAU0dxkf4Qr2ctG1Wcl92
	wXAvSfVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trzVW-00000005nxt-0pv9;
	Tue, 11 Mar 2025 13:18:54 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trzRv-00000005nEF-1zGa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 13:15:12 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 362FD4507E;
	Tue, 11 Mar 2025 14:15:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1741698906;
	bh=5rBouzA5ngZzdOL7plSCJDVP3pR56/JX8o/OYsWjk84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdWpvjhuSPUTc99yhcU6GjBIpOCU9aP+9cfG9gLhEumyfid+90D4p713r3tRAFjYq
	 IY+aHO7tp8T0bAUxfRkKPJYFlS4wT+Hexz+SVpIkCWcUhvlWnIfWvECzbBzv67To2z
	 mzvGeXrX+n9WvnDkJSOpS9ruDWNZz3GB09jKD5yMHoSetJOTbKicxSyFtx4XqoOPO8
	 nks0QZPUrRZ7e3Cuojv58dRazmW90XQWHeHm+B0PXC444kWWaViUnI0nX3qrKX6emI
	 joE42xEnS7afPMd98FhM0QVnGa1QmAHC6Gp+giqLMlMb/l1g9agIwfEApnWqIDCuf/
	 6sZTaBSSzwZog==
Date: Tue, 11 Mar 2025 14:15:04 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, yong.wu@mediatek.com,
	thierry.reding@gmail.com, vdumpa@nvidia.com
Subject: Re: [PATCH] iommu: Unexport iommu_fwspec_free()
Message-ID: <Z9A3WJSgUPjROev6@8bytes.org>
References: <36e245489361de2d13db22a510fa5c79e7126278.1740667667.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36e245489361de2d13db22a510fa5c79e7126278.1740667667.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_061511_734915_F2D3E0B5 
X-CRM114-Status: GOOD (  13.66  )
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

This patch triggered two compile issues on ARM32, which I fixed up in my
tree:

On Thu, Feb 27, 2025 at 02:47:47PM +0000, Robin Murphy wrote:
>  static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
>  {
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	struct iommu_fwspec *fwspec = NULL

Missing semicolon here.

>  	struct of_phandle_args iommu_spec;
>  	struct mtk_iommu_v1_data *data;
>  	int err, idx = 0, larbid, larbidx;
>  	struct device_link *link;
>  	struct device *larbdev;
>  
> -	/*
> -	 * In the deferred case, free the existed fwspec.
> -	 * Always initialize the fwspec internally.
> -	 */
> -	if (fwspec) {
> -		iommu_fwspec_free(dev);
> -		fwspec = dev_iommu_fwspec_get(dev);
> -	}
> -
>  	while (!of_parse_phandle_with_args(dev->of_node, "iommus",
>  					   "#iommu-cells",
>  					   idx, &iommu_spec)) {
> @@ -476,6 +467,9 @@ static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
>  		idx++;
>  	}
>  
> +	if (!fwspec)
> +		return -ENODEV;
> +

Wrong return type here.

Please be more cautious next time and make sure to compile-test all
changed files of a patch.

Thanks,

	Joerg

