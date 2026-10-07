Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4334ACA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 14:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a34pkNyMHqDWotBgFDFvUzoYploLh2exwXcXkkykzyk=; b=rux3Uc9GXzJ96XBIeUtWDkosMx
	O9iKZf8DlqxLl65NKmtVg7MPbir1fIz9d1TiatcfbvleU0O3mVF2TPKSVi8ZNbsclJgrY88HUpbcq
	48tXk3r3J37Pdauln+csz/JBSI4cJbKqhPIPFxf2EYYaCysU85q5ZJl13nZ3IQ4UTIqhlElj3hcUK
	MaBjvBv5gaTIIdXmty6Oe7eK7b4X1QFKHBzscOeF7OTv51guTJrYwaziVf1C+DVrsyTZAuzXnEJR0
	2qa02y9wZYi7OqlXbqWI07A9T/Jt37W4c1O2Fp9FJXFsj+1obKNps0mbgr4QXMLj/C7oNrT9TnCsv
	mGTODAUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESJq-00000002aYx-37pr;
	Wed, 07 Oct 2026 14:08:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESJo-00000002aYV-2qFq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 14:08:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E9CB409E8;
	Wed,  7 Oct 2026 14:08:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D222B1F0089B;
	Wed,  7 Oct 2026 14:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791382108;
	bh=a34pkNyMHqDWotBgFDFvUzoYploLh2exwXcXkkykzyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SsQHYbgIugkfdH0jgxX/wZcqd4yVfKZO4jtNM1hMUdqlLmITXkCQ2m2/DzRVg2lid
	 158ACliqX7K/UC6YCTQBmgk8Naa2PbPdqddC8LALmQxZtOAqCUtsssYh0puXSxFBSn
	 NKQHGyLwT6r1svTN6va11agVuQzqYsIGnyxx0Uly/CYG+jb7JvyUuGG9Pd39tR3fv1
	 Ploas+CgrUqF0JRB8a0enw41Efw3yLCf9nXqBib4rRoCIzNYtWW1SjXjwN8DMupVf0
	 Ex/ezzQsCqWP04SwU5TASc00sWpBk8cnWAnZB7/neEO8cHr+U4tNaOgKgsLRT+j92U
	 9uwGuVeb+TKzQ==
Date: Wed, 7 Oct 2026 15:08:22 +0100
From: Will Deacon <will@kernel.org>
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 13/16] iommu/arm-smmu-v3: Implement pm_runtime &
 system sleep ops
Message-ID: <asZSVtXc1Rk-NuuV@willie-the-truck>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-14-praan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929034510.2023173-14-praan@google.com>
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

On Tue, Sep 29, 2026 at 03:45:07AM +0000, Pranjal Shrivastava wrote:
> Implement pm_runtime and system sleep ops for arm-smmu-v3.
> 
> The suspend callback configures the SMMU to abort transactions, disables
> the main translation unit and then drains the command queue. A software
> gate (STOP_FLAG) quiesces submissions before power-off. Since devlinks
> ensure client devices are suspended before the SMMU, no client DMA can
> occur, making EVTQ/PRIQ IRQ synchronization during suspend unnecessary.
> Prod indices for EVTQ/PRIQ are synchronized via queue_sync_prod_in() to
> retain unread entries across power cycles.
> 
> The resume callback restores the MSI configuration and performs a full
> device reset via `arm_smmu_device_reset` to bring the SMMU back to an
> operational state. The MSIs are cached during the msi_write and are
> restored during the resume operation by using the helper. The STOP_FLAG
> is cleared only after the CMDQ is enabled in hardware.
> 
> Standard SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() macros are
> used to define dev_pm_ops, safely evaluating to NO_OPs when CONFIG_PM is
> disabled. The new RPM helpers are marked __maybe_unused to keep
> intermediate commits clean until invoked by respective handlers in the
> subsequent patches.
> 
> Suggested-by: Daniel Mentz <danielmentz@google.com>
> Signed-off-by: Pranjal Shrivastava <praan@google.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 255 +++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  15 ++
>  2 files changed, 265 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 89a4e756ff17..e127e3be3a6b 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -29,6 +29,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/sort.h>
>  #include <linux/string_choices.h>
> +#include <linux/pm_runtime.h>
>  #include <kunit/visibility.h>
>  #include <uapi/linux/iommufd.h>
>  
> @@ -119,6 +120,45 @@ static const char * const event_class_str[] = {
>  static int arm_smmu_alloc_cd_tables(struct arm_smmu_master *master);
>  static bool arm_smmu_ats_supported(struct arm_smmu_master *master);
>  
> +/* Runtime PM helpers */
> +__maybe_unused static int arm_smmu_rpm_get(struct arm_smmu_device *smmu)

Just guard all this on CONFIG_PM instead of adding __maybe_unused? That
way, the server folks don't even have to build this stuff.

> +{
> +	int ret;
> +
> +	if (!pm_runtime_enabled(smmu->dev))
> +		return 0;
> +
> +	ret = pm_runtime_resume_and_get(smmu->dev);
> +	if (ret < 0) {
> +		dev_err(smmu->dev, "failed to resume device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +__maybe_unused static bool arm_smmu_rpm_get_if_active(struct arm_smmu_device *smmu)
> +{
> +	if (!pm_runtime_enabled(smmu->dev))
> +		return true;
> +
> +	return pm_runtime_get_if_active(smmu->dev) > 0;
> +}
> +
> +__maybe_unused static void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
> +{
> +	int ret;
> +
> +	if (!pm_runtime_enabled(smmu->dev))
> +		return;
> +
> +	ret = pm_runtime_put_autosuspend(smmu->dev);
> +
> +	/* -EAGAIN & -EBUSY aren't failures */
> +	if (ret < 0 && ret != -EAGAIN && ret != -EBUSY)
> +		dev_err(smmu->dev, "failed to suspend device: %d\n", ret);
> +}
> +
>  static void parse_driver_options(struct arm_smmu_device *smmu)
>  {
>  	int i = 0;
> @@ -729,10 +769,66 @@ int __arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>  
>  		/*
>  		 * If the SMMU is suspended/suspending, any new CMDs are elided.
> -		 * This loop is the Point of Commitment. If we haven't cmpxchg'd
> -		 * our new indices yet, we can safely bail. Once the indices are
> -		 * committed, we MUST write valid commands to those slots to
> -		 * avoid indefinite polling in the drain function.
> +		 *
> +		 * Note that eliding ATC invalidations (CMDQ_OP_ATC_INV) is safe
> +		 * because client PCIe endpoints are guaranteed to be suspended
> +		 * (via device links) before the SMMU is suspended. With the PCIe
> +		 * links in a low-power state, no new TLPs can be transmitted.
> +		 * It is strictly the responsibility of the client/endpoint driver
> +		 * to quiesce DMA and ensure that the ATC state is cleared across
> +		 * power state transitions.
> +		 *
> +		 * This loop acts as the Point of Commitment.
> +		 * The CMDQ_PROD_STOP_FLAG ensures that no new commands are
> +		 * committed once the SMMU begins to suspend. The synchronization
> +		 * relies on the following observability invariants:
> +		 *
> +		 * 1. Other CPUs observe the STOP_FLAG only *after* the SMMU is
> +		 *    disabled. This is enforced in arm_smmu_runtime_suspend()
> +		 *    by using a fully ordered atomic_fetch_or() to set the flag,
> +		 *    guaranteeing that SMMUEN=0 (with ABORT set) at the time of
> +		 *    observation which ensures no in-memory structures are
> +		 *    accessed by the SMMU (IHI0070 spec section 6.3.9.6).
> +		 *
> +		 * 2. Other CPUs observe the cleared STOP_FLAG before the SMMU
> +		 *    is re-enabled. During resume, arm_smmu_device_reset()
> +		 *    issues CFGI_ALL and TLBI_ALL commands *after* clearing the
> +		 *    STOP_FLAG and before setting SMMUEN=1. The implicit
> +		 *    dma_wmb() executed while submitting these commands ensures
> +		 *    the cleared STOP_FLAG is visible to all other agents.
> +		 *    Thus, any transition from a set STOP_FLAG to SMMUEN=1
> +		 *    involves an invalidate-all operation prior to setting SMMUEN=1.
> +		 *
> +		 * Hence, if a CPU observes the STOP_FLAG, it is assured that:
> +		 *  (a) Txns are blocked + No in-memory structures are accessed
> +		 *  (b) If the SMMU is ever re-enabled, an invalidate-all is
> +		 *      performed prior to it being enabled during reset.
> +		 *
> +		 * Note: The smp_mb() in arm_smmu_domain_inv_range() orders the
> +		 * PTE update before the STOP_FLAG read, which ensures that if
> +		 * CPU1 reads the STOP_FLAG and decides to elide the command,
> +		 * the PTE update is already globally visible.
> +		 *
> +		 *  [CPU0]                            | [CPU1]
> +		 *  arm_smmu_runtime_suspend() {      | [PTE update]
> +		 *    SMMUEN = 0;                     | arm_smmu_domain_inv_range() {
> +		 *    // set STOP_FLAG                |   smp_mb();
> +		 *    target = atomic_fetch_or();     |   arm_smmu_cmdq_issue_cmdlist() {
> +		 *    while (owner != target)         |     // read STOP_FLAG
> +		 *      // wait for completion        |     Q_STOP(llq.prod);
> +		 *    arm_smmu_drain_cmdqs();         |     // reserve indices
> +		 *  }                                 |     cmpxchg(&cmdq->q.llq.atomic.prod);
> +		 *  ...                               |     queue_write();
> +		 *  arm_smmu_device_reset() {         |   }
> +		 *    // clear STOP_FLAG              | }
> +		 *    atomic_andnot();                |
> +		 *    [Invalidate all TLB & CFG]      |
> +		 *    SMMUEN = 1;                     |
> +		 *  }                                 |
> +		 *
> +		 * If CPU1 hasn't cmpxchg'd its new indices yet, it observes the STOP_FLAG
> +		 * and safely bails. Once the indices are committed, CPU1 MUST write valid
> +		 * commands to those slots to avoid indefinite polling in CPU0's drain path.
>  		 */
>  		if (Q_STOP(llq.prod)) {
>  			local_irq_restore(flags);
> @@ -5068,7 +5164,8 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool resume)
>  
>  	/* Command queue */
>  	writeq_relaxed(smmu->cmdq.q.q_base, smmu->base + ARM_SMMU_CMDQ_BASE);
> -	writel_relaxed(smmu->cmdq.q.llq.prod, smmu->base + ARM_SMMU_CMDQ_PROD);
> +	writel_relaxed(smmu->cmdq.q.llq.prod & CMDQ_PROD_IDX_MASK,
> +		       smmu->base + ARM_SMMU_CMDQ_PROD);
>  	writel_relaxed(smmu->cmdq.q.llq.cons, smmu->base + ARM_SMMU_CMDQ_CONS);
>  
>  	enables = CR0_CMDQEN;
> @@ -5079,6 +5176,9 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool resume)
>  		return ret;
>  	}
>  
> +	/* Clear the STOP_FLAG to resume CMDQ submissions */
> +	atomic_andnot(CMDQ_PROD_STOP_FLAG, &smmu->cmdq.q.llq.atomic.prod);

Presumably this needs to be ordered after the prior MMIO accesses? I think
we're probably missing some barriers with the code as you have it here.

> +
>  	/* Invalidate any cached configuration */
>  	arm_smmu_cmdq_issue_cmd_with_sync(smmu, arm_smmu_make_cmd_cfgi_all());
>  
> @@ -5830,6 +5930,150 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>  	arm_smmu_device_disable(smmu);
>  }
>  
> +static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
> +{
> +	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> +	struct arm_smmu_cmdq *cmdq = &smmu->cmdq;
> +	int timeout = ARM_SMMU_SUSPEND_TIMEOUT_US;
> +	u32 enables, target;
> +	int ret;
> +
> +	/* Abort all transactions before disable to avoid spurious bypass */
> +	arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> +
> +	/*
> +	 * Disable the SMMU via CR0.EN and all queues except CMDQ.
> +	 *
> +	 * Note on EVTQ/PRIQ: Due to device links between client devices and
> +	 * the SMMU, all masters are already runtime suspended and quiescent.
> +	 * As client DMA is stopped, no new translation faults (EVTQ) or
> +	 * Page Requests (PRIQ) can be generated, making it safe to disable
> +	 * these queues without an explicit drain.
> +	 */
> +	enables = CR0_CMDQEN;
> +	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0, ARM_SMMU_CR0ACK);
> +	if (ret) {
> +		/* GBPA comes into effect when CR0.SMMUEN = 0, no rollback needed */
> +		dev_err(smmu->dev, "failed to disable SMMU\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * At this point the SMMU is completely disabled and won't access
> +	 * any translation/config structures, even speculative accesses
> +	 * aren't performed as per the IHI0070 spec (section 6.3.9.6).
> +	 */
> +
> +	/*
> +	 * Mark the primary CMDQ to stop and get the target index before the stop.
> +	 *
> +	 * Note that the primary CMDQ's STOP_FLAG acts as a proxy for the SMMU's
> +	 * global power state. Because all queues are gated synchronously during
> +	 * suspend, checking the primary queue's flag is sufficient.
> +	 */

Strictly speaking, I think you need an mb() here.

> +	target = atomic_fetch_or(CMDQ_PROD_STOP_FLAG, &cmdq->q.llq.atomic.prod);

Then this could be atomic_fetch_or_relaxed()...

> +	target &= CMDQ_PROD_IDX_MASK;
> +

... and you can use smp_mb__after_atomic() here so that we don't read
owner_prod early.

> +	/* Wait for the last committed owner to reach the hardware */
> +	while (atomic_read(&cmdq->owner_prod) != target && timeout) {
> +		udelay(1);
> +		timeout--;
> +	}
> +
> +	/*
> +	 * Entering suspend implies no active clients. A timeout here
> +	 * indicates a fatal CMDQ lockup or hardware stall. We proceed
> +	 * anyway to prioritize memory safety (avoiding stale TLBs)
> +	 */
> +	if (!timeout)
> +		dev_err(smmu->dev, "cmdq owner wait timeout, (check runtime PM + devlinks)\n");
> +
> +	/* Wait for cmdq->lock == 0 to ensure last CMDQ_CONS_REG is written */
> +	timeout = ARM_SMMU_SUSPEND_TIMEOUT_US;
> +	while (atomic_read(&cmdq->lock) != 0 && timeout) {

This probably needs to be ordered after the read of owner_prod, so I would
add an smp_rmb() before the loop.

> +		udelay(1);
> +		timeout--;
> +	}
> +
> +	/* Timing out here implies misconfigured Runtime PM or broken devlinks */
> +	if (!timeout)
> +		dev_err(smmu->dev, "cmdq lock != 0, forcing suspend. Polling CPUs may fault.\n");
> +
> +	/* Drain the CMDQs */

Probably need another mb() here so that we don't start looking at the
hardware registers until we know that the producer threads have gone away?

> +	ret = arm_smmu_drain_cmdqs(smmu);
> +	if (ret)
> +		dev_warn(smmu->dev, "failed to drain queues, forcing suspend\n");
> +
> +	/* Disable the SMMU */
> +	arm_smmu_device_disable(smmu);
> +
> +	/* Disable IRQ generation */
> +	arm_smmu_disable_irqs(smmu);
> +
> +	/* Wait for pending gerror handlers */
> +	synchronize_irq(smmu->combined_irq ? smmu->combined_irq : smmu->gerr_irq);
> +
> +	/* Handle any pending gerrors before powering down */
> +	arm_smmu_handle_gerror(smmu);
> +
> +	/* Sync prod pointer for EVTQ and PRIQ to avoid clobbering unread entries on resume */
> +	if (queue_sync_prod_in(&smmu->evtq.q) == -EOVERFLOW)
> +		dev_warn(smmu->dev, "EVTQ overflow detected during suspend\n");
> +
> +	if (smmu->features & ARM_SMMU_FEAT_PRI) {
> +		if (queue_sync_prod_in(&smmu->priq.q) == -EOVERFLOW)
> +			dev_warn(smmu->dev, "PRIQ overflow detected during suspend\n");
> +	}
> +
> +	/* Avoid consuming stale commands on resume if we timed-out */
> +	cmdq->q.llq.cons = cmdq->q.llq.prod & CMDQ_PROD_IDX_MASK;

What is the problem with consuming stale commands in this case?

> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 0a841441cc44..d0a3d497915c 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -663,11 +663,14 @@ arm_smmu_make_cmd_tlbi(enum arm_smmu_cmdq_opcode op, u16 asid, u16 vmid)
>  
>  /* High-level queue structures */
>  #define ARM_SMMU_POLL_TIMEOUT_US	1000000 /* 1s! */
> +#define ARM_SMMU_SUSPEND_TIMEOUT_US	1000000	/* 1s! */
>  #define ARM_SMMU_POLL_SPIN_COUNT	10
>  
>  #define MSI_IOVA_BASE			0x8000000
>  #define MSI_IOVA_LENGTH			0x100000
>  
> +#define RPM_AUTOSUSPEND_DELAY_MS	15
> +
>  struct arm_smmu_ll_queue {
>  	union {
>  		u64			val;
> @@ -1234,6 +1237,18 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>  				bool sync);
>  bool arm_smmu_erratum_repeat_tlbi_cfgi(void);
>  
> +/*
> + * Lockless pre-check to test if the SMMU is actively powered.
> + * Races with concurrent suspend are benign: the cmpxchg loop in
> + * arm_smmu_cmdq_issue_cmdlist() acts as the true commit point.
> + * If we lose the race, that loop observes Q_STOP == 1 and safely
> + * drops the command. If we win, the suspend thread waits for us.
> + */
> +static inline bool arm_smmu_is_active(struct arm_smmu_device *smmu)
> +{
> +	return !Q_STOP(READ_ONCE(smmu->cmdq.q.llq.prod));
> +}

Why does this need to be in the header?

Will

