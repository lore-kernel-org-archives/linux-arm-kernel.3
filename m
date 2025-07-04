Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB77C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 18:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuxUGCJzgBIyontDTdqwJrs5j4TnI5gqZ41JcRqn9+o=; b=VMRnpX0phWFsSsxzWwXrQJhy2G
	JoJvvUmkphTzlsZmQTo2RhuPpiSs0tMaBpa7jJT37+EoAfHawznbrULFcoF1tVQXroznq1g6d8yNH
	FvUhM0DnqBXkal2jARz8tmvu28yeSmN37yO5sJOjRmbqFSyK4facQdKp//4GCRv+vhQmdqjgXTw1M
	ab+eOGv2Ke5Q0EDR3BYnMWyYtk7JCDjX/YwXxHab8Tuzmz8JlMl7Mco1E/OOoCnuWlkkbgV5uTXF5
	HMMq9J7rfLiybJPTOwjxATzYcKxvaLG1OImcLJBXVIeGlt76OaG8BelDBDKcQEA/3P2UCAhUZcZAo
	xd0ipWZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXl8Q-0000000FEFR-0iE4;
	Fri, 04 Jul 2025 18:27:42 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkcF-0000000F9WW-3ZM6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:54:28 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3190fbe8536so1060516a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 10:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1751651667; x=1752256467; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XuxUGCJzgBIyontDTdqwJrs5j4TnI5gqZ41JcRqn9+o=;
        b=AEj0SNaj+UFlGBjxePsM4CEjaG9G/L9C5NLSkcw0PYFp/2Fi1F18UWal3LBSSYCGS/
         5m3BWxQqHUO7PSC6THann6P+Y4f2QT8a//RQfY2OTQsdxfsWIym2NdRfDAbo/Je47pcW
         +wL2V9P5C7ZIoQR5aghgcmc1/COK0duTuj5dwthqb1Lqh5A89sVEe+cvBwVuRYTPgSTq
         9maY+Y6EBW6WvcXhM2bHOU1wFzBOOwFzjWMHmf5wg2FG9lag1Wpwhe1UObPsiDEsDJJu
         mxgSip7mrtItRjcRgtDLyec8wmzDlgt3zmpT8QQFDLrzledgPU5puzJDizY3K6NA94V4
         +JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751651667; x=1752256467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuxUGCJzgBIyontDTdqwJrs5j4TnI5gqZ41JcRqn9+o=;
        b=r+HDYUTPEcmz+MvKZZhOmtg0ZU5d9vGkTyyVDobplChXOz8NQQmat67ybytfhn2myl
         EzEu8bOQ6ER1ORXAuXQ1Bi///ydRXW2gp0RRaKap5OO16dx8oH4Z7+zMsMLXQjBehANg
         84NHpmjQNhk+n3L3NJ2jmCTkW+Kad1gbJneH1aEh37GotysHK5qAuLaaXlR7cc4opwTw
         VNb1zX7cFHJCLWTcmwIqIwHstJk7wDPlwutOKF8duozYD3o7NTW05NxN5tt7V1UVvd1d
         V7L3FLeV9ZszVAFXW0VnhEh07CtuXBAaVL+L4MpfFupaB8GXaYtRE7qXKBy6hAp3uula
         HeqA==
X-Forwarded-Encrypted: i=1; AJvYcCUb33Lwj2TrymEdcGmpQMXlpciZlMeSt9J94NlMc7TPW0FwWzCO4wmUy1jqEFxqNRisPoGs7oLackiMQpMUioKU@lists.infradead.org
X-Gm-Message-State: AOJu0YyURRgeqkRK6u0d2NjzsOjWSLCTOIHNqcbTes8uiaGBvvebOAnl
	0crDYuTCbWvCxPbhSyJTvUNa+DQChZw2uTJnzzHDqPlaBGYVs8RPCULdx4gf8gEmALY=
X-Gm-Gg: ASbGncsiO5pk46VRPTiM4r75ZM15bN6CvuPfYHtcLxEPVx1jvkLF3/GXjsVJ23nioCY
	qqxMq7wMWi7cEeoqmvQJMBALWjFloegpjz4JSG8lTImzaOtqdADkbFYgCiYgsaNtRRNy9uPPm50
	UXO5beYhDSmciXumUGLczp+dDjXh7uuYE9A7ha1zsutnuzia/vNXqGtmaLQSXkynIj2JU+B/xRo
	sU+tP2He1kvc6XNWQkuqUEwf3yNfq86kgVzF1pjzQEuMXrioiyg1Krj07uW8cF7chxOCBlqM7qn
	AioIn0ERypmDnYiQ74ExSof3eX17d1MJQDno
X-Google-Smtp-Source: AGHT+IEh1aJoFY/nLlH7wiffnloJQKoRXxbF/IF6yLU1DedrCGkd2rfvxrkg/X7+7Uo3KEx9efT39g==
X-Received: by 2002:a17:90a:dfcc:b0:313:1e9d:404b with SMTP id 98e67ed59e1d1-31aadcf8e2bmr4389360a91.2.1751651667045;
        Fri, 04 Jul 2025 10:54:27 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae4095asm2682225a91.8.2025.07.04.10.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 10:54:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uXkcD-00000005zua-0liE;
	Fri, 04 Jul 2025 14:54:25 -0300
Date: Fri, 4 Jul 2025 14:54:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250704175425.GM904431@ziepe.ca>
References: <20250623153931.158765-1-benjamin.gaignard@collabora.com>
 <20250623153931.158765-4-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623153931.158765-4-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_105427_889388_27AF1810 
X-CRM114-Status: GOOD (  20.34  )
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

On Mon, Jun 23, 2025 at 05:39:27PM +0200, Benjamin Gaignard wrote:
> The Verisilicon IOMMU hardware block can be found in combination
> with Verisilicon hardware video codecs (encoders or decoders) on
> different SoCs.
> Enable it will allow us to use non contiguous memory allocators
> for Verisilicon video codecs.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> change in version 4:
> - Kconfig dependencies
> - Fix the remarks done by Jason and Robin: locking, clocks, macros
>   probing, pm_runtime, atomic allocation.

It broadly seems OK to me

Though I did notice this:

> +static struct iommu_domain *vsi_iommu_domain_alloc_paging(struct device *dev)
> +{
> +	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
> +	struct vsi_iommu_domain *vsi_domain;
> +
> +	vsi_domain = kzalloc(sizeof(*vsi_domain), GFP_KERNEL);
> +	if (!vsi_domain)
> +		return NULL;
> +
> +	vsi_domain->iommu = iommu;

So we store the iommu in the domain? And use the iommu->lock all over
the place

> +static int vsi_iommu_attach_device(struct iommu_domain *domain,
> +				   struct device *dev)
> +{
> +	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	ret = pm_runtime_resume_and_get(iommu->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	spin_lock_irqsave(&iommu->lock, flags);
> +	/* iommu already attached */
> +	if (iommu->domain == domain)
> +		goto unlock;

But here we don't check that the domain matches the iommu of dev.

This seems a bit weird to me, I didn't quite get why the domain uses
iommu->lock instead of just having its own per-domain lock?

But if it does use iommu->lock then this does need to prevent using
domains with the wrong iommu because the also use the wrong lock and
then this:

> +
> +	vsi_iommu_enable(iommu, domain);
> +	list_add_tail(&iommu->node, &vsi_domain->iommus);

Is not safe?

Jason

