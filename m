Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8D0CFA455
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pt3wbpJJB/JJv78L+a9NEK0woKagEoUR23P1gOTgai8=; b=krgap8uq8mal69Ks9MdCUENnXv
	myUklLUsQ5oLKlL+p4xphQ9d4uoHVCwSmTsJEAZo9UjIB5TJ55PKVEA4gYWF7CKMGrbmjB2BkIAwm
	WvVYyPKWpD6yxYjySgUibXyG9IwwkbJILicPn0AT7zUp1RUVrDMW0k7xD6RW2GhhXEoWOqqPM+aAA
	dHGgbIX3VetwFURpOGBztiVuyuBU3ZUB59Tw/AbiO93sYUTvXe2GdftHYwaMjArTIZ9L40lmkFFRs
	YIplbzOvAtVqd+E0FZMSdQnm2Z7FJMUaU+73fPH0QBEgXRAfQc4NVuOKDXGuPaTj0UnIce49l7CIE
	+7TiSuaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3f7o-0000000FMsa-0mTm;
	Wed, 23 Oct 2024 17:26:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eXK-0000000FD0h-28Nf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:48:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6E40CA40174;
	Wed, 23 Oct 2024 16:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909A0C4CEC6;
	Wed, 23 Oct 2024 16:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729702121;
	bh=iy3H7Y8wiH+9W2VzDb6agrLlBF3HQPtyn601x1v6ENU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+ZUYXE0fYPevqho+CIKbcmZtnPZ5hTZsTs5XEjG6K3sZTrhQG8V6a+KGyeQ4BKbS
	 aBrgoXumVBwB5kFn5743hjxONFfrgNhKOG8zOvWzbrBU/Qxj6gChxqTn4A9N+96JTd
	 WAr/2ZJkQF8YuFM9sI51LNL/5SzY66Q10qvw293+xuD014TlR7rhdRm1Z2DPlJ2CGX
	 0QA84jUgazRzp/c02v3Gc2QAYG754C5mNKpJMjI/Q4mZsuuhqQPnd/ZXEeRhpBtUpp
	 Rna07CAUAmFXIzD97ePjlud8ArPs7X14q65KHf7QI42w3ZUx461TodATgO6s01hivT
	 kFKUW6LzFnUFQ==
Date: Wed, 23 Oct 2024 17:48:36 +0100
From: Will Deacon <will@kernel.org>
To: Pranjal Shrivastava <praan@google.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Rob Clark <robdclark@chromium.org>,
	Georgi Djakov <quic_c_gdjako@quicinc.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH 22/51] iommu/arm-smmu: Switch to
 __pm_runtime_put_autosuspend()
Message-ID: <20241023164835.GF29251@willie-the-truck>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <20241004094123.113725-1-sakari.ailus@linux.intel.com>
 <ZwfztwoGAcvyvlWL@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwfztwoGAcvyvlWL@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_094842_701458_0AC85097 
X-CRM114-Status: GOOD (  28.74  )
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

On Thu, Oct 10, 2024 at 03:33:11PM +0000, Pranjal Shrivastava wrote:
> On Fri, Oct 04, 2024 at 12:41:23PM +0300, Sakari Ailus wrote:
> > pm_runtime_put_autosuspend() will soon be changed to include a call to
> > pm_runtime_mark_last_busy(). This patch switches the current users to
> > __pm_runtime_put_autosuspend() which will continue to have the
> > functionality of old pm_runtime_put_autosuspend().
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > index 8321962b3714..cad02d5dc6d2 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -79,7 +79,7 @@ static inline int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
> >  static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
> >  {
> >  	if (pm_runtime_enabled(smmu->dev))
> > -		pm_runtime_put_autosuspend(smmu->dev);
> > +		__pm_runtime_put_autosuspend(smmu->dev);
> >  }
> 
> Seems like a straightforward change as a result of [1].
> Although, I had a few things to discuss:
> 
> 1. The `rpm_resume` in drivers/base/power/runtime.c seems to call
> `pm_runtime_mark_last_busy` in case the ->runtime_resume callback
> returned successfully. In such a case, why would we want to move
> `pm_runtime_mark_last_busy` within `pm_runtime_put_autosuspend` ?
> 
> 2. In the arm-smmu driver, we seem to rely on the rpm_resume to call
> `pm_runtime_mark_last_busy` as a part of the ->runtime_resume callback.
> The only other case, where we might wanna `*mark_last_busy` is if we
> want the autosuspend timer to be re-started in case of a failed suspend.
> However, the `arm_smmu_runtime_suspend` doesn't return errno in any case
> hence, I don't see any other case where we'd benefit from using
> `mark_last_busy` in the arm-smmu driver. 
> 
> On the other hand, I don't see a problem with using it either :)
> Any thoughts Will/Rob/Robin?

To be honest, I think the current driver code is pretty weird. We're
calling arm_smmu_rpm_use_autosuspend() during device attach and that
does:

	pm_runtime_set_autosuspend_delay(smmu->dev, 20);
	pm_runtime_use_autosuspend(smmu->dev);

whereas I would've expected these autosuspend parameters to be configured
once during SMMU probe and then for attach to do something like:

	pm_runtime_mark_last_busy();
	__pm_runtime_put_autosuspend();

So I think we should probably rework the code we have slightly, which
will hopefully make this giant refactoring series a little more
straightforward.

Will

