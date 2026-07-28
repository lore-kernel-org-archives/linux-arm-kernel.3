Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8ADC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYFlnlGtzGaTmpuO49iDLUfMpOme9Z4x8j8IG4rbPjY=; b=qGachi1sKUwFIes0EFOTIdySvw
	70eOBe8niF9TslgB6RAFqR1U1dBAFqMlRFdAqDQm6Vn3yDk2HweCiGUcUn1yYT2oXkdh/cpCKQPvp
	eGqX+VuXaISYUeCkuUgeNjVYiKiKst6Pp+jFSOiOPIBA0Ecs/oYCbA73ygrtu5pC6+rGaPgN+ncV/
	9HLGW8BO17l2HEIMnyvoKpMop82mRGRh4BZtGrk41LiDYa4EAUvjcX0ZAFvNDFEzAUYiG9AVwf8gm
	zYRUCNTcH3PHDWcSApl8gP3vCP6KboJLshwaq6jy7xkPKyZB6zyNkwzOuGPAo3dVRbbE2GKLEiMI8
	kupdVwSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopAd-00000006IZ3-1Kui;
	Tue, 28 Jul 2026 21:17:03 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopAa-00000006IYg-0GPe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:17:01 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cacef7d299so15355ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785273418; x=1785878218; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QYFlnlGtzGaTmpuO49iDLUfMpOme9Z4x8j8IG4rbPjY=;
        b=oK5XDU76VDHnSG6H/Ct+iTiM+1SLROO6YpwCIbyK8RnPs4YWnryp//dDZgDmiddfnB
         4Wye7UObg1yIebQNVMTfOR6a0GnPpKEEOesttTjR5/JtexpoLs5Sr4iD0zH7FnkclwVB
         frw4v5E2h9waRIao2nYPYDfhV9YDEz0UsuNWIfhzUeRbyL8BW1UhkgTgID0LMgeKQ5b3
         pCce1Z6E2qMJ4bDmvC1MEZb8INbEzZTihAdRhvJt7Bj2eiPulos8qJGsOvHWeHtNiksT
         r3YKewuyjnBcHlDSXru5YLwEXIDxoqL2yaaT/TJht4p6TETILOvNAlnesJ3DlvmTCLf4
         pVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273418; x=1785878218;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYFlnlGtzGaTmpuO49iDLUfMpOme9Z4x8j8IG4rbPjY=;
        b=WnKm3Ic/VS8meavKTMzQnOOo0KvZV8/uhE7+JRPKL+8GpL0AWw+q/vC3W74F3O5Hkj
         XIfjYoyXMn8YTCOAx9HI+Rm+nRp3VoSV+2qOkMUPLIleqqX6O8gO8vFzDKXhpWYdd4rc
         5qQyv5MMhQ+prOubAdvtm0AGGwLIwhTIrc/lTpR0n3ghQ5hDr+N0fmHjDVva7E1oe5t2
         /baBSAW8CrZANzKtMFMmfCVmyY+BUe6z5Xk47oEywwJ41CjucmNezQFLv/U4hOULI8wX
         PxtXhIn8WAxDV8TB92sA7kJr6M7tFSAPyr2z1EslcFDx3l5reWWw9uQdT88CPMewjUjJ
         QllQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEG0qdQ6oy/e1+GLTy8ZadEEQqirEN4O3UsvCpsIuWvoZKaOFK6Yo2eH6gBDZtNhbTEn8Txajw2sCwtAsmlw+y@lists.infradead.org
X-Gm-Message-State: AOJu0YwrzSHfZBz1oaKo096CJklKq5lSXmHdMAL8S7M/g9uniXEo0BhG
	cbepFfdem4y2vl8aXej9WYTG2gW2LXdKQqzs2fcopRS/NJsCCmKoJO4SEb2DShhTqA==
X-Gm-Gg: AR+sD11LbcRkrt1um4dKW36jaCYOuuQp3k8woMIA/CDvN5/Npdc3jetQ227IJkmRhZk
	RSQSiqnZSDF7J8PV9Fi4GAL+NLBD3KfkzS9ojXc+RoHsH3VvdY88gBNN5LdkP0o/SQtW6xWxF3c
	KH/Ml4BfKpMrnMTpDhBwXFug8qcZU1VRnEt3ghKpaey5wtT5xCL3hCnn8uXRw7o+brABaeZz63N
	5cgXWkiqH/tLIBd+HABwg023FivpoSc6dSmnNeyj/74RuJQxaTFf8BPUfquFSvLplp+Kl4zMGd1
	Qk/ZvYgMxYnpD9F43iB22lbRH4L10pWIy95a+9aj6BkmYM8GGb8On84IPliOKDSBBLmEXmeOKaY
	L3oDzOPTbeP58fZRcUH7f/K5oeUz2k44IMA0CaYNve7Vr/sPRycLgNbgMPw8l66ag1XkkXu2Hvq
	vu9UsV2lMTZYAbU0k89VVycRfYeRzN+uzAKR9T8OuShMnidfvDvrtdzQg3hjpRGec+bOAtYnfnX
	9xYRvRdDQeEU36OZuH+fUA=
X-Received: by 2002:a17:903:1a03:b0:2c7:b1e7:501e with SMTP id d9443c01a7336-2cfde09f0damr13311135ad.3.1785273417527;
        Tue, 28 Jul 2026 14:16:57 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c2d5a4sm1779895ad.71.2026.07.28.14.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:16:56 -0700 (PDT)
Date: Tue, 28 Jul 2026 21:16:49 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	bhelgaas@google.com, kevin.tian@intel.com, kees@kernel.org,
	smostafa@google.com, baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	skaestle@nvidia.com, mmarrid@nvidia.com, skolothumtho@nvidia.com,
	bbiber@nvidia.com
Subject: Re: [PATCH v2 03/11] iommu/arm-smmu-v3: Add
 arm_smmu_drain_queue_for_iopf() helper
Message-ID: <amkcQRVylEe_t-yP@google.com>
References: <cover.1779944354.git.nicolinc@nvidia.com>
 <a62db13ab63916e9a62cddeec41a74a98cdf6a8f.1779944354.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a62db13ab63916e9a62cddeec41a74a98cdf6a8f.1779944354.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_141700_111160_07D0A629 
X-CRM114-Status: GOOD (  36.37  )
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

On Thu, May 28, 2026 at 12:59:31AM -0700, Nicolin Chen wrote:
> A poll-until-empty form does not converge on the shared EVTQ or PRIQ since
> other masters keep advancing PROD with unrelated traffic. A fixed snapshot
> bounds the wait even under sustained unrelated load, since the target does
> not move with subsequent enqueues.
>

[...]

> 
> This is a prerequisite to apply bug fix calling iopf_queue_flush_dev().
> 
> Fixes: cfea71aea921 ("iommu/arm-smmu-v3: Put iopf enablement in the domain attach path")
> Cc: stable@vger.kernel.org # v6.16
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 27 +++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index cf41b3cf5985f..4794a15f351c4 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -894,6 +894,33 @@ static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
>  					   cmds->num, true);
>  }
>  
> +/* Drain an SMMU EVTQ or PRIQ to a PROD snapshot taken on entry */
> +static int arm_smmu_drain_queue_for_iopf(struct arm_smmu_device *smmu,
> +					 struct arm_smmu_queue *q)
> +{
> +	struct arm_smmu_queue_poll qp;
> +	u32 prod, cons;
> +	int ret = 0;
> +
> +	/* Snapshot PROD; entries [old_cons, prod) are the cohort to drain */
> +	prod = readl_relaxed(q->prod_reg);
> +	queue_poll_init(smmu, &qp);
> +	qp.wfe = false; /* No SEV on EVTQ/PRIQ PROD advance */
> +	/* Read MMIO each iteration; llq->cons is the threaded handler's */
> +	do {
> +		cons = readl_relaxed(q->cons_reg);
> +		if (__queue_empty(&q->llq, cons, prod) ||
> +		    __queue_consumed(&q->llq, cons, prod))
> +			return 0;
> +		cond_resched();
> +	} while (!(ret = queue_poll(&qp)));
> +
> +	dev_warn_ratelimited(smmu->dev,
> +			     "queue drain timed out at prod=0x%x cons=0x%x\n",
> +			     prod, cons);
> +	return ret;
> +}
> +
>  static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused,
>  				   struct iommu_page_response *resp)
>  {

Hi Nicolin,

The following is a unified drain_queue helper, that also attempts to
address Sashiko's concerns. This applies on top of my runtime PM v9
series [1], please see if it works for you:

Subject: [PATCH] iommu/arm-smmu-v3: Add a unified arm_smmu_drain_queue()  helper

Introduce a unified arm_smmu_drain_queue() helper to replace queue
specific polling loops. The helper handles both snapshot-based cohort
draining (for IOPF) and full queue draining (required for Runtime PM).

The Runtime PM explicitly gates the CMDQ (via CMDQ_PROD_STOP_FLAG) prior
to draining, this allows a single, snapshot-based target to natively
handle all drain scenarios.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 68 +++++++++++++++------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  4 +-
 2 files changed, 52 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 9106ffb75f7a..2deed6e3bf9b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1057,39 +1057,70 @@ static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
 					   cmds->num, true);
 }
 
+static bool queue_consumed(struct arm_smmu_ll_queue *q, u32 cons, u32 target)
+{
+	if (cons == target)
+		return true;
+	if (Q_WRP(q, cons) == Q_WRP(q, target))
+		return Q_IDX(q, cons) > Q_IDX(q, target);
+	return Q_IDX(q, cons) < Q_IDX(q, target);
+}
+
 /*
- * Currently, only used for CMDQ.
- * TODO: Update to handle PRIQ & EVTQ when PRI support is added
+ * Drains a queue until the consumer reaches the provided 'prod' snapshot.
+ * For CMDQ, the consumer is the SMMU hardware (polled via MMIO).
+ * For EVTQ/PRIQ, the consumer is the CPU IRQ thread (polled via software llq).
  */
-int arm_smmu_queue_poll_until_empty(struct arm_smmu_device *smmu,
-				    struct arm_smmu_queue *q)
+int arm_smmu_drain_queue(struct arm_smmu_device *smmu,
+			 struct arm_smmu_queue *q, u32 prod)
 {
 	struct arm_smmu_queue_poll qp;
-	struct arm_smmu_ll_queue *llq = &q->llq;
-	int ret = 0;
+	/* Secondary CMDQs don't support WFE*/
+	bool is_cmdq = (q == &smmu->cmdq.q);
+	u32 cons;
 
 	queue_poll_init(smmu, &qp);
+	qp.wfe = is_cmdq;
+
+	do {
+		if (is_cmdq) {
+			cons = readl_relaxed(q->cons_reg);
+			WRITE_ONCE(q->llq.cons, cons);
+		} else {
+			cons = READ_ONCE(q->llq.cons);
+		}
+
+		if (queue_consumed(&q->llq, cons, prod))
+			return 0;
+
+		cond_resched();
+	} while (!queue_poll(&qp));
 
 	/*
-	 * The events are only generated when CMDQ becomes non-full.
-	 * Thus, wfe can't be used here, mark it false explicitly.
+	 * Check once more after timeout: cond_resched() could have delayed us
+	 * until after the timer expired while the consumer finished draining.
 	 */
-	qp.wfe = false;
-
-	do {
-		WRITE_ONCE(llq->cons, readl_relaxed(q->cons_reg));
-		if (queue_empty(llq))
-			break;
+	if (is_cmdq) {
+		cons = readl_relaxed(q->cons_reg);
+		WRITE_ONCE(q->llq.cons, cons);
+	} else {
+		cons = READ_ONCE(q->llq.cons);
+	}
 
-		ret = queue_poll(&qp);
+	if (queue_consumed(&q->llq, cons, prod))
+		return 0;
 
-	} while (!ret);
+	dev_warn_ratelimited(smmu->dev,
+			     "queue drain timed out at prod=0x%x cons=0x%x\n",
+			     prod, cons);
 
-	return ret;
+	return -ETIMEDOUT;
 }
 
 static int arm_smmu_drain_queues(struct arm_smmu_device *smmu)
 {
+	struct arm_smmu_cmdq *cmdq = &smmu->cmdq;
+	u32 target;
 	int ret;
 
 	/*
@@ -1097,7 +1128,8 @@ static int arm_smmu_drain_queues(struct arm_smmu_device *smmu)
 	 * from contexts (like suspend) where the caller has already
 	 * ensured that new command submissions are fully closed.
 	 */
-	ret = arm_smmu_queue_poll_until_empty(smmu, &smmu->cmdq.q);
+	target = atomic_read(&cmdq->q.llq.atomic.prod) & CMDQ_PROD_IDX_MASK;
+	ret = arm_smmu_drain_queue(smmu, &cmdq->q, target);
 
 	if (ret)
 		goto out;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 15b5d5fad627..eddf6f41b570 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1176,8 +1176,8 @@ int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 int arm_smmu_cmdq_init(struct arm_smmu_device *smmu,
 		       struct arm_smmu_cmdq *cmdq);
 
-int arm_smmu_queue_poll_until_empty(struct arm_smmu_device *smmu,
-				    struct arm_smmu_queue *q);
+int arm_smmu_drain_queue(struct arm_smmu_device *smmu,
+			 struct arm_smmu_queue *q, u32 prod);
 
 static inline bool arm_smmu_master_canwbs(struct arm_smmu_master *master)
 {
-- 

[1] https://lore.kernel.org/all/20260728210928.1050849-1-praan@google.com/


Thanks,
Praan

