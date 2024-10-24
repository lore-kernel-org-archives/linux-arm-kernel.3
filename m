Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00C1CE8E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wi4glAx+wEgGST5LdDDBKp+Mkl9kiSGTU6STDe7K1/o=; b=KT4gFzeuxDL2a8uahY4hWMD125
	6aUzWj9AcqgGMNIdyYwWHdAOHvL9MEkAPOkdjS+PAzHN9hWRXim5zn+HNBJn4vsdEuzJi2BuTIzhL
	L6jOI4vu3TbyTVbrB6FtBbtEyj22s+T5Gl0e4NEkQS/2H4xJ1n8tnlZEuKDArrghXBSPZPShqUJbS
	tnArMhsXC5srv4ruWl8yvWWkPpMW9PE/JjCzGRZDq3W3UDCJJykbqzO+izMu+ZcZjufy7ffjuerps
	LiKvOGgLhM2w7ZuuYe//l8vJ34ykbqqCUlyprYZnu4qM0LZQ0uBaoF09I6x+vPL2EsEAsbphCA2YK
	nhcwuDhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40FF-000000010qB-3ywQ;
	Thu, 24 Oct 2024 15:59:29 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zjC-00000000uCq-3w7S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 15:26:24 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20ca4877690so124695ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729783581; x=1730388381; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wi4glAx+wEgGST5LdDDBKp+Mkl9kiSGTU6STDe7K1/o=;
        b=Xvlxl8hTDMYX4sAOE3xWv/6lzPJ/wlXC4Ah4fn+4PN1RSCX1QVzynOl/mZYhqob/no
         3+DXs8h1zvMCqivnm1heFKD+b3ZpPjGGSzUuY6yheiXAWdf4lruIw8ZAbGLAND/QEVbV
         DmJbTZG4QvoecCYfJ5sHC+nIG16ZkBjxDWgRdouXW+MAZ1ir8K0TZe6lmYYQkoJsYyc7
         Yqra+pDGBXtT7dshoDWdb1WXKL30ZYKpTpD860DgaUB5yF0lJW7GavuxdQGtxW9w2gID
         K2rgqQ5sPzgwsBiq65oV8NesaZ6T7YxVt+u/BzpxHy8PC2gIIFOc7ZZeAsPJMZHZ+wsK
         8GNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729783581; x=1730388381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wi4glAx+wEgGST5LdDDBKp+Mkl9kiSGTU6STDe7K1/o=;
        b=bS42Dk/WD8ftQBATDoj31U2kka/rMilw4IcoKnT3FAEnGdtqspg3KReLJD5WkAlM15
         MfC9TeOiK8GKnNMlNXKU870QcZNCFIp6TVitxizvc2kDnJiNS6aRtVSd3eKJW7CU32xJ
         +qEpZw7rduTjh/ReLE2rknNqctHSTTezvPrmlWfKgaHSrwHkhggvBxkvsKzpPn89HCYV
         j+ChApBGoQO3Y691N0++gb1ohlsUvmTI9yeEB9IMGeyHi8M8KxZLZjuPZmFmLaQfdoR7
         iK+4MQQlrMvBfu9/HzSaYjCM57AWURQq82X6Q+gpWwpkb47zC+AuknyxBOvE5Pd5nsGm
         Nm6w==
X-Forwarded-Encrypted: i=1; AJvYcCWZmgBdLr+po2sAJLlKp4ZfDzDGp81a2NIF9wOt56DZsNSCvBuM4t+XWt9CH8oEEhYfXkH9k1AtqhakOpHUtFPI@lists.infradead.org
X-Gm-Message-State: AOJu0YwRA6Rm1G71pd5xHKW7uSfYcCwNz1F+1zkOrObLSK4z2e6MLAul
	p4hP7pM7FBfZoI5rlzS8e7e4UhqAgxGr8c5IUcB4c3y5Uyxw1Chknoh6Rgazkw==
X-Google-Smtp-Source: AGHT+IG9fIxEp3nE+7sh8sAPl79Ygp1jwOjhJKusBS4VmwGbdjSog8+lupqcuyio5msUO7yn6X4epA==
X-Received: by 2002:a17:903:2304:b0:20c:e169:eb8c with SMTP id d9443c01a7336-20fb76b7b3emr2448315ad.1.1729783580393;
        Thu, 24 Oct 2024 08:26:20 -0700 (PDT)
Received: from google.com (62.166.143.34.bc.googleusercontent.com. [34.143.166.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeabb83easm8788835a12.72.2024.10.24.08.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 08:26:19 -0700 (PDT)
Date: Thu, 24 Oct 2024 15:26:12 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Will Deacon <will@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Rob Clark <robdclark@chromium.org>,
	Georgi Djakov <quic_c_gdjako@quicinc.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH 22/51] iommu/arm-smmu: Switch to
 __pm_runtime_put_autosuspend()
Message-ID: <ZxpnFPsk2OBC8vqd@google.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <20241004094123.113725-1-sakari.ailus@linux.intel.com>
 <ZwfztwoGAcvyvlWL@google.com>
 <20241023164835.GF29251@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023164835.GF29251@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_082623_018104_480FDC07 
X-CRM114-Status: GOOD (  35.61  )
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

On Wed, Oct 23, 2024 at 05:48:36PM +0100, Will Deacon wrote:
> On Thu, Oct 10, 2024 at 03:33:11PM +0000, Pranjal Shrivastava wrote:
> > On Fri, Oct 04, 2024 at 12:41:23PM +0300, Sakari Ailus wrote:
> > > pm_runtime_put_autosuspend() will soon be changed to include a call to
> > > pm_runtime_mark_last_busy(). This patch switches the current users to
> > > __pm_runtime_put_autosuspend() which will continue to have the
> > > functionality of old pm_runtime_put_autosuspend().
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu/arm-smmu.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > index 8321962b3714..cad02d5dc6d2 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > @@ -79,7 +79,7 @@ static inline int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
> > >  static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
> > >  {
> > >  	if (pm_runtime_enabled(smmu->dev))
> > > -		pm_runtime_put_autosuspend(smmu->dev);
> > > +		__pm_runtime_put_autosuspend(smmu->dev);
> > >  }
> > 
> > Seems like a straightforward change as a result of [1].
> > Although, I had a few things to discuss:
> > 
> > 1. The `rpm_resume` in drivers/base/power/runtime.c seems to call
> > `pm_runtime_mark_last_busy` in case the ->runtime_resume callback
> > returned successfully. In such a case, why would we want to move
> > `pm_runtime_mark_last_busy` within `pm_runtime_put_autosuspend` ?
> > 
> > 2. In the arm-smmu driver, we seem to rely on the rpm_resume to call
> > `pm_runtime_mark_last_busy` as a part of the ->runtime_resume callback.
> > The only other case, where we might wanna `*mark_last_busy` is if we
> > want the autosuspend timer to be re-started in case of a failed suspend.
> > However, the `arm_smmu_runtime_suspend` doesn't return errno in any case
> > hence, I don't see any other case where we'd benefit from using
> > `mark_last_busy` in the arm-smmu driver. 
> > 
> > On the other hand, I don't see a problem with using it either :)
> > Any thoughts Will/Rob/Robin?
> 
> To be honest, I think the current driver code is pretty weird. We're
> calling arm_smmu_rpm_use_autosuspend() during device attach and that
> does:
> 
> 	pm_runtime_set_autosuspend_delay(smmu->dev, 20);
> 	pm_runtime_use_autosuspend(smmu->dev);
> 
> whereas I would've expected these autosuspend parameters to be configured
> once during SMMU probe and then for attach to do something like:
> 
> 	pm_runtime_mark_last_busy();
> 	__pm_runtime_put_autosuspend();
> 

Ack. I had missed the `*set_autosuspend` call during attach, there's no
need for that to happen with each attach. I agree that we should setup
autosuspend delay once during the smmu probe and mark_last_busy on
attach to retain the current behaviour.

> So I think we should probably rework the code we have slightly, which
> will hopefully make this giant refactoring series a little more
> straightforward.

+1.

> 
> Will

Thanks,
Pranjal

