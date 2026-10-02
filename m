Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B63CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9MRhlz4pzaoGqz6XBjvYnXMN79/O0P66ZDWtWt6Lv4=; b=gYoM/Asn4COWhHzLL9LtjbiCqr
	TsMnlyEJw1bSWQ7Zvh0yWbatvQoc6ed7LmQdeudAtVKZHKvx7nxz9SwKWEq8bwSoL0wpS2uuXFKPG
	2LS6JE+5D5CM+Bz/wQNwL2JO6XaVFVdPCati1oh4xPOmohhk41Db0/05+N9Ahq91oJsXEambZQv3K
	NbhpSfeiRIxWE7XgqvO+M0g1J53kQmWcppNGodCOGbLlVFfWCXSBUSi3DPTuzTI9Res+Nuo8kA/KE
	HBWZ3X1GbqEOmub3MbprhdfgLZ5HyseBwX91jjaJWQz8Q77iLa0l5c06wrkWNxQmvLwLkgjeXNbmz
	f32AEEtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgMO-0000000C4EU-1cJj;
	Fri, 02 Oct 2026 16:43:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgMO-0000000C4E1-06lh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 16:43:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 62AAA40AFC;
	Fri,  2 Oct 2026 16:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9D71F000FF;
	Fri,  2 Oct 2026 16:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790959427;
	bh=y9MRhlz4pzaoGqz6XBjvYnXMN79/O0P66ZDWtWt6Lv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QVkvXH4MIkXiJq0i0bW6Gqqdu15m800MonrF8VWPSFxRDFxCfnKP9lVLCvJHIlwDF
	 DuUH5d68DiioC64U3/jjVHOkJyKYeMLCRpsowq7friAXvljxxrtfWWhjSHP84YnWoB
	 LD4qMtBBoJ+UWRUhpZssXzxjN2AhJ5QxKPUxF0AhDaplBSpuy/fYSIyGrW7BXGRyaj
	 5erZhJi3pLpFiENetIzPd/QJOvb5fNVhWkMBsRJLtrcEKxIhvG2Cyl+4ercWd1CieS
	 uV/oEuGTs+oBCAgQMruT/CBXs+6Bn7Rj5cJwF4dJ+VWLIsbfue0LQ0+c+Qe7Bfp990
	 eRlT/l+AABUeA==
Date: Fri, 2 Oct 2026 17:43:42 +0100
From: Will Deacon <will@kernel.org>
To: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Subject: Re: [PATCH v4] iommu/arm-smmu: Use pm_runtime in fault handlers
Message-ID: <ar_fPnbFMJQK69pZ@willie-the-truck>
References: <20260806-smmu-rpm-v4-1-8183d007331c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-smmu-rpm-v4-1-8183d007331c@oss.qualcomm.com>
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

On Thu, Aug 06, 2026 at 03:52:41PM +0530, Prakash Gupta wrote:
> Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the driver")
> enabled pm_runtime for the arm-smmu device. On systems where the SMMU
> sits in a power domain, all register accesses must be done while the
> device is runtime active to avoid unclocked register reads and
> potential NoC errors.
> 
> So far, this has not been an issue for most SMMU clients because
> stall-on-fault is enabled by default. While a translation fault is
> being handled, the SMMU stalls further translations for that context
> bank, so the fault handler would not race with a powered-down SMMU.
> 
> Adreno SMMU now disables stall-on-fault in the presence of fault
> storms to avoid saturating SMMU resources and hanging the GMU. With
> stall-on-fault disabled, the SMMU can generate faults while its power
> domain may no longer be enabled, which makes unclocked accesses to
> fault-status registers in the SMMU fault handlers possible.
> 
> Guard the context and global fault handlers with
> arm_smmu_rpm_get_if_active() and arm_smmu_rpm_put() so that all SMMU
> fault register accesses are done with the SMMU powered. If the SMMU is
> not runtime active, the fault can be safely ignored as
> arm_smmu_device_reset() clears fault registers on resume.
> 
> Additionally, disable fault reporting in arm_smmu_runtime_suspend()
> before powering down. pm_runtime_get_if_active() returns 0 during
> RPM_SUSPENDING, so without this, level-triggered fault interrupts would
> cause an interrupt storm while the device is being suspended.
> arm_smmu_device_reset() re-enables fault reporting on resume.

Separate patch?

> Also call synchronize_irq() for each context IRQ after masking fault
> reporting but before clk_bulk_disable(). This closes a race where a
> fault handler that passed arm_smmu_rpm_get_if_active() before the IRQ
> was masked could still be executing MMIO accesses after the clocks are
> cut.

Separate patch?

> Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
> Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> ---
> Changes in v4:
> - Add synchronize_irq() loop in arm_smmu_runtime_suspend() after masking
>   fault reporting but before clk_bulk_disable(), closing a race where an
>   in-flight fault handler could access MMIO registers after clocks are cut
> - Link to v3: https://patch.msgid.link/20260630-smmu-rpm-v3-1-f69874a580fa@oss.qualcomm.com
> 
> Changes in v3:
> - Add arm_smmu_rpm_get_if_active() wrapper that returns 1 when pm_runtime
>   is disabled, ensuring fault handlers work on non-pm_runtime systems
> - Disable fault reporting in arm_smmu_runtime_suspend() before powering
>   down to prevent interrupt storms during RPM_SUSPENDING state
> - Use pm_runtime_put_autosuspend() in arm_smmu_rpm_put() instead of
>   private __pm_runtime_put_autosuspend()
> - Link to v2: https://patch.msgid.link/20260313-smmu-rpm-v2-1-8c2236b402b0@oss.qualcomm.com
> 
> Changes in v2:
> - Switched from arm_smmu_rpm_get()/arm_smmu_rpm_put() wrappers to
>   pm_runtime_get_if_active()/pm_runtime_put_autosuspend() APIs
> - Added support for smmu->impl->global_fault callback in global fault handler
> - Remove threaded irq context fault restriction to allow modifying stall
>   mode for adreno smmu
> - Link to v1: https://patch.msgid.link/20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 101 +++++++++++++++++++++++++---------
>  1 file changed, 76 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 0bd21d206eb3..2b692a5293a2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -79,11 +79,16 @@ static inline int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
>  
>  static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>  {
> -	if (pm_runtime_enabled(smmu->dev)) {
> -		pm_runtime_mark_last_busy(smmu->dev);
> -		__pm_runtime_put_autosuspend(smmu->dev);
> +	if (pm_runtime_enabled(smmu->dev))
> +		pm_runtime_put_autosuspend(smmu->dev);
> +}
>  
> -	}
> +static inline int arm_smmu_rpm_get_if_active(struct arm_smmu_device *smmu)
> +{
> +	if (!pm_runtime_enabled(smmu->dev))
> +		return 1;
> +
> +	return pm_runtime_get_if_active(smmu->dev);
>  }

Can this race with pm_runtime_disable(), perhaps via
arm_smmu_device_shutdown()? If so, then we could return -EINVAL, which
doesn't look like it's handled correctly by the caller here:

>  static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
> @@ -462,10 +467,20 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  	int idx = smmu_domain->cfg.cbndx;
>  	int ret;
>  
> +	if (!arm_smmu_rpm_get_if_active(smmu))
> +		return IRQ_NONE;

^^^

Is this assuming that the irq is edge-triggered? Is that guaranteed?

Will

