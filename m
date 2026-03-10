Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2068FD4F19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 19:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aN0nyrbMsrt5Hg63KWcZhSsf/H9up2uegNl8k8ebr10=; b=kEwardQBCN5E7rfACWiUTXLpqs
	w0M/obKcre+T87R5MMhAzhH7KO8o9xGI/5FviIDcZQxX/6Uqjh+CwDq4Pp/n9kRbdDmHnoQFOHYfN
	nBtnJNYwM0YluovWZ4DDWDcNRQY/iLI5VN+HHoG1wuSlbRKYf4ngk2k/D47uTRGgZN0tBLJ1tstum
	AleqPk89zAinHOsHsgAm6iFe74X3g0FmfKeHwcwUz0NQAhXwlAYILyx3yYUEz4+Cug/kfIZiGziaX
	vtiGhU5hreanAltrYdmatqJw9xRiDLMQSEDLT2Sdc24JQxNd4JOWrqJucjY8kjpLyds+GIWERvWSk
	WQuBsDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Yv-0000000AAGA-2Ezd;
	Tue, 10 Mar 2026 19:16:13 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Yt-0000000AAFg-0MFW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 19:16:12 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ae3f822163so23135ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 12:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773170170; x=1773774970; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aN0nyrbMsrt5Hg63KWcZhSsf/H9up2uegNl8k8ebr10=;
        b=ZUCLaqwYxpsVHVpDAl2rUrDd3vqn/nq5ldba54bkpK6nyaMg1mDmv7OT1Jx+irJu0+
         mEDCgtP7JM03sr+qFjpGiDA0Es7NQmWuXHxO690bBxTSA5tfxbEx1WhVFBPaA26o6TV8
         9ryZv9zVF28di9ZOG8FAz6OczBGMk3fjDa4PxUvZ5dgOL9jdh1/bgbT+7DBICwvIN9tT
         q7ebSheZSbX3xEkcTaD17SmncwFP8SrPeamIVqeubhTcL1HZFwXqoeVbdXS+vl2XvuOJ
         1p4ix1lzUgEpYXUm1xNp9VRYmp/eDnJrKEGC5RCn8ZKLyhtsr4sqyOjEKg/VE3P4HK0K
         9TSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773170170; x=1773774970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aN0nyrbMsrt5Hg63KWcZhSsf/H9up2uegNl8k8ebr10=;
        b=hrCSamj1w4//HwNyph8gku5avsIKebNTg3bb8Lg4yYLaBO5yrCwRyXYtwP/fKcwki+
         XRsKy6+ZRyYMMYThDRmjwt4zROkpKa1zeSoe+Rpcokj62WPCSf4ba6rXmMDJ+fpNAA3f
         cCda9v59R7yjtuaZ5QKMeqMUu+T+lYDTtrLa7ZSAhr8WWD/7anwPASKJu1HGIW0rR0AY
         k+mqb/s1gdkkddYC/K5ei5CdkrE7mpjLucKVmz+UC2dA1lpE2KuHsnQRg2A0TFIH3zlM
         Hsv5ltQh1YBEAFfaqA4OkuoEiOqYNEZXGCsre4XZ057Dsfz0iQ/HaRVspWVN5DW4inb2
         Xb9g==
X-Forwarded-Encrypted: i=1; AJvYcCXBwJTC6QqKGQh3rR5HIMfY9uqdBd+Umdr8CuZUiN76aa9TgnXH42QWVuVrUZ7oiNe77DTgSwA2ZLWn/WL2Y54U@lists.infradead.org
X-Gm-Message-State: AOJu0YwSkLJgm2SgjKmS2UdQirLbt8AU7di/LshlY92w/5aXSMTIoaD4
	8RfC+WjQ6nLJduNKo0S3+ZXvzuzwosXWLDDlov9sVkoQcPAquHRXZkYxAC1J0KAvZA==
X-Gm-Gg: ATEYQzzgmTVDm4VmtttJkiJnHzxsx5RRqmwJhaP5YUl+qxyVqyv3kpG7UUfb5e+yDw+
	JlCNB59yn/F5gy5/5hFdM4WGaV4Sexp6KcUVLtyjTDG4CmANxW87d57AhiqgklqgBu8l6CXaybz
	axA+LE9YFITvTbbmgVEKJ5/Y8EHcbZDUeUFVMWYxJvInQq2wPeUZ84XzB7BGS1IJQR20ELsdjCq
	XC5Q3l0zIP2Dn+Citg45LccdfC6EcCKAVfvdlwqs07jRIY5H3rSIphXmh7micCn1LTYb+DkaoVU
	d+0Y1/hw3pL8uF9zoMszGHtDXGl2rIJSJCpTMsH294ze5sQ+gpJMrVAixZg+lWTxFRLeACOwsyx
	jfiZ8Gic+rTtIPjnP5sPz5/HfS5RcfHYCHz3zz0WrMxezcicoRTIFUL17p540I9QWxMSMR0GWHf
	fCr0rBpr1eGreQyVtmuLtdsY0Y0bqOzbtu29pj0xE7KGGxZJGIhzBRQau5Tg==
X-Received: by 2002:a17:903:3d10:b0:2a7:6fd3:c11e with SMTP id d9443c01a7336-2aead3dbf39mr503375ad.18.1773170169056;
        Tue, 10 Mar 2026 12:16:09 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f70396cbsm15505b3a.58.2026.03.10.12.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 12:16:08 -0700 (PDT)
Date: Tue, 10 Mar 2026 19:16:02 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	bhelgaas@google.com, jgg@nvidia.com, rafael@kernel.org,
	lenb@kernel.org, kees@kernel.org, baolu.lu@linux.intel.com,
	smostafa@google.com, Alexander.Grest@microsoft.com,
	kevin.tian@intel.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, vsethi@nvidia.com
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <abBt8qj8QpkG-Fwh@google.com>
References: <cover.1772686998.git.nicolinc@nvidia.com>
 <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_121611_136263_0EA409CC 
X-CRM114-Status: GOOD (  46.93  )
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

On Wed, Mar 04, 2026 at 09:21:42PM -0800, Nicolin Chen wrote:
> Currently, when GERROR_CMDQ_ERR occurs, the arm_smmu_cmdq_skip_err() won't
> do anything for the CMDQ_ERR_CERROR_ATC_INV_IDX.
> 
> When a device wasn't responsive to an ATC invalidation request, this often
> results in constant CMDQ errors:
>   unexpected global error reported (0x00000001), this could be serious
>   CMDQ error (cons 0x0302bb84): ATC invalidate timeout
>   unexpected global error reported (0x00000001), this could be serious
>   CMDQ error (cons 0x0302bb88): ATC invalidate timeout
>   unexpected global error reported (0x00000001), this could be serious
>   CMDQ error (cons 0x0302bb8c): ATC invalidate timeout
>   ...
> 
> An ATC invalidation timeout indicates that the device failed to respond to
> a protocol-critical coherency request, which means that device's internal
> ATS state is desynchronized from the SMMU.
> 
> Furthermore, ignoring the timeout leaves the system in an unsafe state, as
> the device cache may retain stale ATC entries for memory pages that the OS
> has already reclaimed and reassigned. This might lead to data corruption.
> 
> The only safe recovery action is to issue a PCI reset, which guarantees to
> flush all internal device caches and recover the device.
> 
> Read the ATC_INV command that led to the timeouts, and schedule a recovery
> worker to reset the device corresponding to the Stream ID. If reset fails,
> keep the device in the resetting/blocking domain to avoid data corruption.
> 
> Though it'd be ideal to block it immediately in the ISR, it cannot be done
> because an STE update would require another CFIG_STE command that couldn't

Nit: s/CFIG_STE/CFGI_STE

> finish in the context of an ISR handling a CMDQ error.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |   5 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 131 +++++++++++++++++++-
>  2 files changed, 132 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 3c6d65d36164f..8789cf8294504 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -803,6 +803,11 @@ struct arm_smmu_device {
>  
>  	struct rb_root			streams;
>  	struct mutex			streams_mutex;
> +
> +	struct {
> +		struct list_head	list;
> +		spinlock_t		lock; /* Lock the list */
> +	} atc_recovery;
>  };
>  
>  struct arm_smmu_stream {
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 4d00d796f0783..de182c27c77c4 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -106,6 +106,8 @@ static const char * const event_class_str[] = {
>  	[3] = "Reserved",
>  };
>  
> +static struct arm_smmu_master *
> +arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid);
>  static int arm_smmu_alloc_cd_tables(struct arm_smmu_master *master);
>  
>  static void parse_driver_options(struct arm_smmu_device *smmu)
> @@ -174,6 +176,13 @@ static void queue_inc_cons(struct arm_smmu_ll_queue *q)
>  	q->cons = Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
>  }
>  
> +static u32 queue_prev_cons(struct arm_smmu_ll_queue *q, u32 cons)
> +{
> +	u32 idx_wrp = (Q_WRP(q, cons) | Q_IDX(q, cons)) - 1;
> +
> +	return Q_OVF(cons) | Q_WRP(q, idx_wrp) | Q_IDX(q, idx_wrp);
> +}
> +
>  static void queue_sync_cons_ovf(struct arm_smmu_queue *q)
>  {
>  	struct arm_smmu_ll_queue *llq = &q->llq;
> @@ -410,6 +419,97 @@ static void arm_smmu_cmdq_build_sync_cmd(u64 *cmd, struct arm_smmu_device *smmu,
>  		u64p_replace_bits(cmd, CMDQ_SYNC_0_CS_NONE, CMDQ_SYNC_0_CS);
>  }
>  
> +/* ATC recovery upon ATC invalidation timeout */
> +struct arm_smmu_atc_recovery_param {
> +	struct arm_smmu_device *smmu;
> +	struct pci_dev *pdev;
> +	u32 sid;
> +
> +	struct work_struct work;
> +	struct list_head node;
> +};
> +
> +static void arm_smmu_atc_recovery_worker(struct work_struct *work)
> +{
> +	struct arm_smmu_atc_recovery_param *param =
> +		container_of(work, struct arm_smmu_atc_recovery_param, work);
> +	struct pci_dev *pdev;
> +
> +	scoped_guard(mutex, &param->smmu->streams_mutex) {
> +		struct arm_smmu_master *master;
> +
> +		master = arm_smmu_find_master(param->smmu, param->sid);
> +		if (!master || WARN_ON(!dev_is_pci(master->dev)))
> +			goto free_param;
> +		pdev = to_pci_dev(master->dev);
> +		pci_dev_get(pdev);
> +	}
> +
> +	scoped_guard(spinlock_irqsave, &param->smmu->atc_recovery.lock) {
> +		struct arm_smmu_atc_recovery_param *e;
> +
> +		list_for_each_entry(e, &param->smmu->atc_recovery.list, node) {
> +			/* Device is already being recovered */
> +			if (e->pdev == pdev)
> +				goto put_pdev;
> +		}
> +		param->pdev = pdev;
> +		list_add(&param->node, &param->smmu->atc_recovery.list);
> +	}
> +
> +	/*
> +	 * Stop DMA (PCI) and block ATS (IOMMU) immediately, to prevent memory
> +	 * corruption. This must take pci_dev_lock to prevent any racy unplug.
> +	 *
> +	 * If pci_dev_reset_iommu_prepare() fails, pci_reset_function will call
> +	 * it again internally.
> +	 */
> +	pci_dev_lock(pdev);
> +	pci_clear_master(pdev);
> +	if (pci_dev_reset_iommu_prepare(pdev))
> +		pci_err(pdev, "failed to block ATS!\n");
> +	pci_dev_unlock(pdev);
> +
> +	/*
> +	 * ATC timeout indicates the device has stopped responding to coherence
> +	 * protocol requests. The only safe recovery is a reset to flush stale
> +	 * cached translations. Note that pci_reset_function() internally calls
> +	 * pci_dev_reset_iommu_prepare/done() as well and ensures to block ATS
> +	 * if PCI-level reset fails.
> +	 */
> +	if (!pci_reset_function(pdev)) {

I'm a little uncomfortable with this, why is an IOMMU driver poking into
the PCI mechanics? I agree that a reset might be the right thing to do
here but we wouldn't want the IOMMU driver to trigger it.. Ideally, we'd
need a mechanism that bubbles up fatal IOMMU faults to the PCI core and
let it decide/perform the reset. Maybe this could mean adding another op
to struct pci_error_handlers or something like that?

> +		/*
> +		 * If reset succeeds, set BME back. Otherwise, fence the system
> +		 * from a faulty device, in which case user will have to replug
> +		 * the device to invoke pci_set_master().
> +		 */
> +		pci_dev_lock(pdev);

Why are we using spinlock_irqsave across the worker? Also, why does
atc_recovery.lock have to be a spinlock? The workers run in process
context, and I also don't see anyone else take the atc_recovery.lock?
Why does it need to be irq-safe? If this can somehow run in irq context,
we also seem to be using pci_dev_lock and streams_mutex across the
worker? Mixing mutexes with spinlocks is brittle and invites 
"sleep-while-atomic" bugs in future refactors..

> +		pci_set_master(pdev);
> +		pci_dev_unlock(pdev);
> +	}
> +	scoped_guard(spinlock_irqsave, &param->smmu->atc_recovery.lock)
> +		list_del(&param->node);
> +put_pdev:
> +	pci_dev_put(pdev);
> +free_param:
> +	kfree(param);
> +}
> +
> +static int arm_smmu_sched_atc_recovery(struct arm_smmu_device *smmu, u32 sid)
> +{
> +	struct arm_smmu_atc_recovery_param *param;
> +
> +	param = kzalloc_obj(*param, GFP_ATOMIC);
> +	if (!param)
> +		return -ENOMEM;
> +	param->smmu = smmu;
> +	param->sid = sid;
> +
> +	INIT_WORK(&param->work, arm_smmu_atc_recovery_worker);
> +	queue_work(system_unbound_wq, &param->work);
> +	return 0;
> +}
> +
>  void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
>  			      struct arm_smmu_cmdq *cmdq)
>  {
> @@ -441,11 +541,10 @@ void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
>  	case CMDQ_ERR_CERROR_ATC_INV_IDX:
>  		/*
>  		 * ATC Invalidation Completion timeout. CONS is still pointing
> -		 * at the CMD_SYNC. Attempt to complete other pending commands
> -		 * by repeating the CMD_SYNC, though we might well end up back
> -		 * here since the ATC invalidation may still be pending.
> +		 * at the CMD_SYNC. Rewind it to read the ATC_INV command.
>  		 */
> -		return;
> +		cons = queue_prev_cons(&q->llq, cons);

What about batched commands? We might never know which command caused
the timeout? This just fetches the "previous" command and we might end
up resetting the wrong device if the invalidations were batched?

> +		fallthrough;
>  	case CMDQ_ERR_CERROR_ILL_IDX:
>  	default:
>  		break;
> @@ -456,6 +555,27 @@ void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
>  	 * not to touch any of the shadow cmdq state.
>  	 */
>  	queue_read(cmd, Q_ENT(q, cons), q->ent_dwords);
> +
> +	if (idx == CMDQ_ERR_CERROR_ATC_INV_IDX) {
> +		/*
> +		 * Since commands can be issued in batch making it difficult to
> +		 * identify which CMDQ_OP_ATC_INV actually timed out, the driver
> +		 * must ensure only CMDQ_OP_ATC_INV commands for the same device
> +		 * can be batched.
> +		 */
> +		WARN_ON(FIELD_GET(CMDQ_0_OP, cmd[0]) != CMDQ_OP_ATC_INV);
> +
> +		/*
> +		 * If we failed to schedule a recovery worker, we would well end
> +		 * up back here since the ATC invalidation may still be pending.
> +		 * This gives us another chance to reschedule a recovery worker.
> +		 */
> +		arm_smmu_sched_atc_recovery(smmu,
> +					    FIELD_GET(CMDQ_ATC_0_SID, cmd[0]));

I guess instead of attempting recovery, could we have the worker
attempt to mark the STE invalid / ABORT. Once we Ack the Gerror, we
should be able to issue a CFGI_STE?

> +		return;
> +	}
> +
> +	/* idx == CMDQ_ERR_CERROR_ILL_IDX */
>  	dev_err(smmu->dev, "skipping command in error state:\n");
>  	for (i = 0; i < ARRAY_SIZE(cmd); ++i)
>  		dev_err(smmu->dev, "\t0x%016llx\n", (unsigned long long)cmd[i]);
> @@ -3942,6 +4062,9 @@ static int arm_smmu_init_structures(struct arm_smmu_device *smmu)
>  {
>  	int ret;
>  
> +	INIT_LIST_HEAD(&smmu->atc_recovery.list);
> +	spin_lock_init(&smmu->atc_recovery.lock);
> +
>  	mutex_init(&smmu->streams_mutex);
>  	smmu->streams = RB_ROOT;

Thanks,
Praan

