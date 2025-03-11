Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD7AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 16:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqvRLFZABNFz59PxDvNC6jhxqSM0D1mDrwx7DQYyiS0=; b=Qy4jgxTFmObRuWm27KCybkS51n
	IQufPJxfGVttnYiN9OCr+t0PWblgksG521FZ92rkk5ZVlxhGzfZU62vwU21/1OscHuEzhQ0LKihfh
	nNkn3m+Ki4vOeJf0dGtKEpXdt8A29N4vp7P+rGnryLCaowv/o02Hz8YunZDnUnt4LHn6pb4YSuOZ6
	AaAL7wUkI6rq0FSkl9G+JCaOf3LL8PyTEzGfwrpCkFWMBfluG4WZNym6KVy+xDQZ0VoVgvtfXfDHJ
	tyvys+I7EQqUIQyMyK64ae+3ewTngb4sDZmmL0yORJDaDsndzcCDWVlA4fmGM7IlKL7OC0AmOYX/c
	mGf7F3LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts21g-00000006GP4-3fQq;
	Tue, 11 Mar 2025 16:00:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1yI-00000006Ep2-3hqJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 15:56:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB68DA45D9E;
	Tue, 11 Mar 2025 15:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB9BC4CEE9;
	Tue, 11 Mar 2025 15:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741708605;
	bh=oEeQH0rYsSmg/7HCVUBRlhhmZdZyZi/GX5wONFWTHl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QcnlOA/qtl72u3TDbJ1lf5HzJDDK9/N8eROvzhHYwUPmLATxHcUICDp1hen1ndWir
	 QGrBaBLrloZ7IFp6BYHm2IMG4+VwbkSBkGHF1qrshStzbv7DHNFg4gPXvE5fo3WjgX
	 4/XlzVZI4/r1m57wwzgx1uduuvYjlhGsDCZay6LW5wp+DkG2HmyNbSQxmIJIC89jwU
	 KtSVHfGnazLTFG1Efm66DhlGr+JHhimScQAV4myEuW1z+fZ4jqXKte9R2qSZ8AP7u4
	 zeNzULL0UmeWh6K/LQUNjQTW/r6Hh4au+GPL0jwjnQaw2kET6KZh8AzKhc8f3SuZvL
	 CwMtNKQ2dHnvQ==
Date: Tue, 11 Mar 2025 15:56:38 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	praan@google.com, patches@lists.linux.dev
Subject: Re: [PATCH v8 13/14] iommu/arm-smmu-v3: Report events that belong to
 devices attached to vIOMMU
Message-ID: <20250311155637.GB5138@willie-the-truck>
References: <cover.1740504232.git.nicolinc@nvidia.com>
 <7f6813dc2b62f5f396ac3172dc2a7d9bf3b47536.1740504232.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f6813dc2b62f5f396ac3172dc2a7d9bf3b47536.1740504232.git.nicolinc@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_085647_044267_046DBF31 
X-CRM114-Status: GOOD (  14.36  )
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

On Tue, Feb 25, 2025 at 09:25:41AM -0800, Nicolin Chen wrote:
> Aside from the IOPF framework, iommufd provides an additional pathway to
> report hardware events, via the vEVENTQ of vIOMMU infrastructure.
> 
> Define an iommu_vevent_arm_smmuv3 uAPI structure, and report stage-1 events
> in the threaded IRQ handler. Also, add another four event record types that
> can be forwarded to a VM.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Pranjal Shrivastavat <praan@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  7 +++
>  include/uapi/linux/iommufd.h                  | 23 +++++++
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 17 ++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 60 +++++++++++--------
>  4 files changed, 82 insertions(+), 25 deletions(-)

[...]

> @@ -1866,7 +1869,14 @@ static int arm_smmu_handle_event(struct arm_smmu_device *smmu,
>  		goto out_unlock;
>  	}
>  
> -	ret = iommu_report_device_fault(master->dev, &fault_evt);
> +	if (event->stall) {
> +		ret = iommu_report_device_fault(master->dev, &fault_evt);
> +	} else {
> +		if (master->vmaster && !event->s2)
> +			ret = arm_vmaster_report_event(master->vmaster, evt);
> +		else
> +			ret = -EOPNOTSUPP; /* Unhandled events should be pinned */
> +	}

nit: You don't need this extra indentation.

Patch looks fine:

Acked-by: Will Deacon <will@kernel.org>

Will

