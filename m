Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFAED13597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 11:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8ohfpnIEvg7feisWnyEQsAMOz4YBMRZ4DT963EvlJY=; b=PgqqiDjfRjNQmqf/KpHsYVSEt7
	apuGLouog4fgV08WXenHI727UxAeE/Qj8HxfHKNxilk9+6If5htKa4KF9IaBMLW+XiqvYXuIwUVzg
	LkSEDaTU7u2uNhvvNW41m/yoT3CgZ7FWjcIr88rTZvoXujpkVhY4EoTN4eF9aINWwYHHLYR3oRmU+
	bcbtde0F/WML/+d/kCD630o/GqM9wRNbacFaY/Tl7rCHaC2AeQZjHUynK2AuMpis2tbDbfEmoQuaH
	dkMhtePV7rxUghVn5dGKOVXJGNGBNU5rJldh0EszmjCS+V16kYGi4Ewz6FBkB+7EhqsUk0fzoVj76
	GvWbqEFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OLD-0000000Addm-3qON;
	Mon, 28 Oct 2024 11:55:23 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OJY-0000000AdUY-0pOA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 11:53:45 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4315ee633dcso143655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 04:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730116417; x=1730721217; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s8ohfpnIEvg7feisWnyEQsAMOz4YBMRZ4DT963EvlJY=;
        b=2X1kCKYfpuKHnSJsHKNvYiKNegYm5Wnv79WUK4DQjK9heEcpzN9dWd/33JeTmFRjGf
         //ZtXXrqwOmfLSXCQLIfIXR39NNzUmwigkArpvTMG53rsoIJ8eVkhjIKHt57+4r5uZGJ
         x1Azl9vIJWKesodAEGhhb8jkdVvF996w99RrgMmovdgb1xZ0szqoYydxobAdBsKUQoZu
         SFYxHBDjLOU1JilGsqvgICbQCsPCyuM99BNuX2cPenpYfyGAbGZPbotFdJx9wWCWsRyc
         f62GP5fHn8t5Vx9QzgqHRcA73Y+1H9MohKyk/tWtcHdinvbStBmLCQq/my1E6MSrO3LH
         U/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730116417; x=1730721217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8ohfpnIEvg7feisWnyEQsAMOz4YBMRZ4DT963EvlJY=;
        b=CN8kUAuxPknBnhUVw9EAo/0ijmFjoCSHlYU3lBJBw46BZfY9XXRaEk4TEQyX7OV1sK
         IRrGG0s5ncaGz66JL6YUSuovGCFhTjA5z88VQ3kiyo1eyLJzxBUnRH4Z5Ou0BTiYaUxt
         uXdpEyLn2+GmcI+dzsTkBelZlwSV8STR+tnjdKl9TyTckXzTCpP1kkOqB+BkUfdSjTMb
         WCx6zb1ohjJfQP1w6a6ct2mRrawOr9criPTK8yYsGv00/ruLKxVveQhegeDe4B2DGPx6
         0FSj471H9Eb2nTX8vFcjdWUkGhP6ial7qyROlkQZZkfKuxSvOSr1x8OOhWTSSWbg2tNs
         0W2w==
X-Forwarded-Encrypted: i=1; AJvYcCW3lhe2gsTbTjm7auII0KIyurRp+7EuKIgaF9gGuOWQTmLN010aYbU6UNJfFtkCvTfjLNBhaJf6Wi9Esxq9oW46@lists.infradead.org
X-Gm-Message-State: AOJu0YwTvdgcWvn0qN35zgRxfU8HkE1gYB6jGso5OBY8OorPHfiot+Dd
	sF/zJbcgmANeVs96PgK43tWqFq+6i34LFaVfbslxVGbFDq4+v1i+fSNlnANNzA==
X-Google-Smtp-Source: AGHT+IFAG1wQgZSHD4GZ1FDVInCNhg5i9ZX5wl+jOWzRo1tsON7IOnOTabrNuttxFekm1NvUnzUp2w==
X-Received: by 2002:a05:600c:1e8f:b0:426:66a0:6df6 with SMTP id 5b1f17b1804b1-4319ab034e8mr4472705e9.0.1730116417455;
        Mon, 28 Oct 2024 04:53:37 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4319359527asm106666165e9.16.2024.10.28.04.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 04:53:36 -0700 (PDT)
Date: Mon, 28 Oct 2024 11:53:33 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@chromium.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	"open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
	"open list:DRM DRIVER for Qualcomm Adreno GPUs" <freedreno@lists.freedesktop.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joao Martins <joao.m.martins@oracle.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:DRM DRIVER for Qualcomm Adreno GPUs" <linux-arm-msm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sean Paul <sean@poorly.run>, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v9 0/4] io-pgtable-arm + drm/msm: Extend iova fault
 debugging
Message-ID: <Zx97PU7cUEVCnpPl@google.com>
References: <20240827181717.187245-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827181717.187245-1-robdclark@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_045343_413421_A8C9802E 
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

Hi Rob,

On Tue, Aug 27, 2024 at 11:17:08AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This series extends io-pgtable-arm with a method to retrieve the page
> table entries traversed in the process of address translation, and then
> beefs up drm/msm gpu devcore dump to include this (and additional info)
> in the devcore dump.
> 
> This is a respin of https://patchwork.freedesktop.org/series/94968/
> (minus a patch that was already merged)
> 
> v2: Fix an armv7/32b build error in the last patch
> v3: Incorperate Will Deacon's suggestion to make the interface
>     callback based.
> v4: Actually wire up the callback
> v5: Drop the callback approach
> v6: Make walk-data struct pgtable specific and rename
>     io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
> v7: Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty()
> v8: Pass pte pointer to callback so it can modify the actual pte
> v9: Fix selftests_running case
> 
> Rob Clark (4):
>   iommu/io-pgtable-arm: Make pgtable walker more generic
>   iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
>   iommu/io-pgtable-arm: Add way to debug pgtable walk
>   drm/msm: Extend gpu devcore dumps with pgtbl info

Do you have plans to post another version of this series, as I am
working on some patches, that would use some of the common page walk
logic, so it would be more convenient to have them upstream.
Otherwise, I can have your series as a dependency.

Thanks,
Mostafa


> 
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  10 ++
>  drivers/gpu/drm/msm/msm_gpu.c           |   9 ++
>  drivers/gpu/drm/msm/msm_gpu.h           |   8 ++
>  drivers/gpu/drm/msm/msm_iommu.c         |  22 ++++
>  drivers/gpu/drm/msm/msm_mmu.h           |   3 +-
>  drivers/iommu/io-pgtable-arm.c          | 149 +++++++++++++++---------
>  include/linux/io-pgtable.h              |  15 +++
>  7 files changed, 160 insertions(+), 56 deletions(-)
> 
> -- 
> 2.46.0
> 

