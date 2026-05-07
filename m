Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D29CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ns8GiU7JpBrxm2tCxgyo0Vrbr/2PTrgnrkNgo2RuOyk=; b=gIhl4Qtg4SRg6yTMxn74FNUpv9
	aa7m/jwOrVB+FVg0uq7Z5kEV74HafiTToUhc2dTOrZx5vGgjhTtKl38Pwz+fb4POabD/AGUTn6UPX
	sHxVhPXnaywjqshAXZV+oSIWnFNDOt3OvCVOvWTSQpDZrPsotTUZ2tdj3VSprzFr8HQ4yxdMZIjCp
	oJiMWNzvcN45n96vho3M0C/zYHB5C6JSKIz5p6w8DcXzYRLFCU9Cg5+dcX8JZPVOLkuZ7ibnbXlsI
	Y2BdC5Ktxk3A9C2dwyVcVmY7aK9gOXgL3oOUgZOtvC9yciLnOgZcIHIcJ9IWxnr2XI7rgPDUXFwvl
	Jb5lOJNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuwB-00000003Jvr-2m8x;
	Thu, 07 May 2026 09:22:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuw8-00000003JtQ-28jp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:22:29 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48d1c670255so77815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778145746; x=1778750546; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ns8GiU7JpBrxm2tCxgyo0Vrbr/2PTrgnrkNgo2RuOyk=;
        b=fSMnM7f8wHffTl+95hHCUX6P3hP3E7jL7A50e5K622KwfPGPky0X0o7V8ta7lvApVU
         bykIoeoGYKRq9F50IHd9o/2bU7Nnj8h0M5dTywImvBMd+VnnxAzKuyFhQArDg04kndwb
         7IEweJOIUzREilP26mYTuaikTkeipiYFn9O1HXGXkVCi5bGX/r/vmK5u471mh5dFDOAo
         umATnf0yJcgTby9TUD7DoAAmcJgRnFiDOP2yOUC1Dmx6OmgZXexmbQ60axUlmOvF8i6l
         mJtHL09oLQiBiXyjilcgEpMTeSeXufGVxTjGcJalPcj61Xy7YGqApqi4ip7vVHS4b45x
         EFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145746; x=1778750546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ns8GiU7JpBrxm2tCxgyo0Vrbr/2PTrgnrkNgo2RuOyk=;
        b=MzLt4zazkXXpq9G4HFn47Ir1fv/iMXbYQ8q+oqTPMyGcWqUl+pqFG2r/JeJwKFivVN
         n5JqsPOjZcacv+F8qMvp4JxMdUDNH3XKeQdv0lAVpB2DHZSyenBzpfndC+aAzRFTgIhu
         Ijq2H+w4kqZTvbKJPtpvuSfYIKpeFD/Eb5gFvFOxPtJZN2+ixCQt1tT6D6y+yLC5TerV
         1DQzWi53Vt99pB6uprUjFyTcgQlUPq9qKT5kkkEdql/+hDg7A8ORaVb6xWJZ3SeG6FOK
         k2w9pWaSUq5XEfJYDiY64clLPod7B7L0YDO4fK6PESfx8rcn3085lmFpf6aDgdwV975L
         f6WQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CntZPajZ8IjNAaEKCxc95V3brpyPEc7eW6SNNj/AJxs8C4lsOlV5GistNdooQ6zU0EPMb5k7e/8zLHaC24dYU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2xf0tzY0df8J5FtRmIg4qN0GWUf5EYmSmnZR7sChunxQzYUsm
	2VVsBhhoXGz3VkdGAiRRtYjDMOE77fLzdoMBMWh052L5Qn3Vis8svfdOjWVD51j+iQ==
X-Gm-Gg: AeBDies8X4Yc/vKKVm56KgdIZWlP8PmOTCUGWIlBCsF8warxfdtKef8m+byfGmhRIkk
	MyLKS7Ef0uT8g33QMVsnOOaJTpL0yTWs1JVQOLuT7bw9hfGepGp7Qu0BWYOdCjoaeZM28dtgtvm
	dauXHKS9ABbGId1iqMqbtmKRojezmB69wnMot7Rgc3n16Wq26BUr+IpToRzmPde1sGzJrIBDgqO
	IQJ8KcdmqUnX6OEfhWLqK2nUweqNeioX+J29zqNqM72KdGU1eCcNFmnfkZtbh5mPVp30GUfcuUo
	v1OZ0f6ny/40TOEIyBncmtz07XXT9ydJyEOOeltkmHtzHlVuAMRWPXg2ViP5GNnTqCnvTAJiBmN
	KUUR+oS7GEUhapbuCENGaF1kdqPNNstvSenuMPYQHG/335VKfg/Qa9LZo97TG4Y59GDzJC6DZG0
	s4Jkokmi6RkPYaLkOi8bMDdTDHWrl6+zd2tIshWV5rSa5rFkoqLJYBkBSyYm/dEWqYGaIEutq63
	8ZuHQ==
X-Received: by 2002:a05:600c:6c08:b0:48a:6321:87f7 with SMTP id 5b1f17b1804b1-48e5d64c0dcmr657235e9.8.1778145746114;
        Thu, 07 May 2026 02:22:26 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538aaa0fsm135407645e9.7.2026.05.07.02.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:22:25 -0700 (PDT)
Date: Thu, 7 May 2026 09:22:21 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH 5/9] iommu/arm-smmu-v3: Remove CMDQ_OP_CFGI_CD_ALL from
 arm_smmu_cmdq_build_cmd()
Message-ID: <afxZzd7s2SobJwW7@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <5-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_022228_562903_B31A9F19 
X-CRM114-Status: GOOD (  14.66  )
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

On Fri, May 01, 2026 at 11:29:14AM -0300, Jason Gunthorpe wrote:
> Nothing uses this, just dead code.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index b3ef001ce80d23..ef0907b1a2204f 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -290,9 +290,6 @@ static int arm_smmu_cmdq_build_cmd(struct arm_smmu_cmd *cmd_out,
>  		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
>  		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_LEAF, ent->cfgi.leaf);
>  		break;
> -	case CMDQ_OP_CFGI_CD_ALL:
> -		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
> -		break;
>  	case CMDQ_OP_CFGI_ALL:
>  		/* Cover the entire SID range */
>  		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
> -- 
> 2.43.0
> 

