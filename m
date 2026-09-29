Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BDBCA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfOHrQoUb0vGCPal7wCh2ahQm0IriRIShcuFqEMo6IM=; b=Wwb8m+4VGCiGP2oFo0HiAhYSSz
	ZCLzD76cYrd1erSMe6Qw0li7MtVDAzpME/zfAhV3jEsArLo0of69W4+TAbuS//6vFi7C4NlSxNrER
	WUO5l92I/AyEi5pzjIEZXRKbmoSTVtWJTe6ENsZBziXKfUTeHxuVSuTYfNomm1/DkAcgtY7q5H/Oy
	eu2Sfq3PJu/wf94V6/Qc1NuV9WopyE6xWUqQUtRwmvwfSrbJSfFg2jbFsIcr/XVyDzLiNZT3XzLfj
	uAF8MAkF5NTqLnlkkvhccU2Mi2+qsgeUi0gq4+O11VyfdhHpYEDUFsJOjjHzEx/1RkjjKnEt3+rOS
	qV4Ks+VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOnt-00000002GxJ-2af1;
	Tue, 29 Sep 2026 03:46:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOnD-00000002Ges-0wZ1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 03:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mfOHrQoUb0vGCPal7wCh2ahQm0IriRIShcuFqEMo6IM=; b=HcClINl+g/ShkNUpW0uL6OugNB
	TunxSmgBSmxGTfHM3/mEFeHF2oBodRJ4ut9EiOQGYWQAvq4RNxJY2mu9CWDrg5BpI51ICluxD93ZN
	1W9JoMgEKobRDxezTx7gSxv78jCiRacpJQsLhoRx7if8+zcvhQ+Dg/YmvlCfB2PKITCPWiYA6t/nV
	JGexcoM7GFEQv0Dr6pgLvECySV+GDNDpSYxKgoEaUDW43Ee2d/IGS8fKbSRq3THrXzDTv7JHK6rB/
	rC9qZRFRlEHTdfPoYMssBDo7FuOdK1sbvogmpdjdd2Gz6KkZBdOiOlVleklS43G1WpPAu6Z6a3deq
	cA/EnCQQ==;
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBOn2-000000029Tu-3HEf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:46:06 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso4175808a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653557; x=1791258357; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfOHrQoUb0vGCPal7wCh2ahQm0IriRIShcuFqEMo6IM=;
        b=WFKaxKTOm+pkAH7JnJ87iknO8H/j4EPmxEMkM+FbCdrz8ropMh3C2X00v17ZDdmHcT
         LvBeSWcYNmIk4uGNg/YQxyF6C+WfGi9aYx55+a+WpP1Xizj41VmKALubsO/DJzPXGF1U
         XasyM3tMOClVIQxqf98jSBRa4xMmgB6ZQ9rQQ3ABaf0MgDcuAcAoHznGuNkAU4H1dUVP
         Y9HWWezk6vHSEqTx7fTDmjK46AvH34N3FXh68eoZMtRNlhEUhW2XBUJr0tbo4zm1kL0G
         rcssDA/ZbzIuUsBpWXvWWUl7EUCX7hGBNX0GaJZ7U+3iDUCjqk1PykM3jLCM5zgBZHJU
         R0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653557; x=1791258357;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mfOHrQoUb0vGCPal7wCh2ahQm0IriRIShcuFqEMo6IM=;
        b=0KC5zHsbBq3gS+2+WfwMpZ2eFReK1K8MTCOfWEuwRBn7UtQ7Zqiii0p5V0guGe+kIT
         aP004IgaN2xAievR9z1s3F4hGRVm3wX6RfgPNYphNySThUt8JwlR9hQLUthJHYixGDIT
         r2nFVjYC4FuvZHQXpO5lAOZtWKprOv7o/XTwMRdcTiR+h6jIcb4W1gY+Ijs0ibSGKFLb
         hO0LhOp5ozrL0WyB+3zOFHQHD4fk12yRBMq5oGAtCPR+uoh/cVT2d96vjTrsmSAPY20O
         sHutbwkyvjKsc3auXV8mMSpUZ+65kqVojMc35LjOxaB+AbuAfNCIdlAQff0DecQtQ1Vl
         5kLA==
X-Forwarded-Encrypted: i=1; AKwUvBzmqgP0i4OSSBvF71OKL+ZQuHBnJCTwext7vAfwhhl5Ym8uTz/g3R/BOg4neGqKaFA+rtXYQRyBFEPdKSc8Tj7a@lists.infradead.org
X-Gm-Message-State: AFuF++noFmtKOa/UtcC+ZprSsPe4Tr29mWyOzTsBIAjsctSHkvKrWGW/
	WBG3u2d0l8Z9Am7MSi32RTz4zsthYM7ZFJ17UTWxpt5CbytwiD9CWDz9Lbh2QJEl1Boo0JHCqaH
	/uA==
X-Received: from pgdg6.prod.google.com ([2002:a05:6a02:51c6:b0:cc7:ae70:fd9f])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:439f:b0:3dd:5831:ef5c
 with SMTP id adf61e73a8af0-3de26c5dbe1mr10012436637.17.1790653556991; Mon, 28
 Sep 2026 20:45:56 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:45:09 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-16-praan@google.com>
Subject: [PATCH v11 15/16] iommu/arm-smmu-v3: Invoke pm_runtime before hw access
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_044602_117094_B84C9885 
X-CRM114-Status: GOOD (  35.41  )
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

Invoke the pm_runtime helpers at all places before accessing the hw.
The idea is to invoke runtime_pm helpers at common points which are used
by exposed ops or interrupt handlers. TLB and CFG invalidations are
elided if the SMMU is suspended by observing the CMDQ_PROD_STOP_FLAG.

In the threaded interrupt handlers (EVTQ/PRIQ), arm_smmu_rpm_get_if_active()
is used to avoid sleeping and deadlocking against synchronize_irq() during
suspend. Because device links guarantee client devices remain suspended
and cannot issue DMA until the SMMU has fully transitioned to RPM_ACTIVE,
no client-generated events can be received or dropped during transient
states like RPM_RESUMING.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  20 ++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 163 +++++++++++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   3 +
 3 files changed, 175 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index 25982bdbcbd9..7150b9c497a4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -15,17 +15,28 @@ void *arm_smmu_hw_info(struct device *dev, u32 *length,
 	struct iommu_hw_info_arm_smmuv3 *info;
 	u32 __iomem *base_idr;
 	unsigned int i;
+	int ret;
+
+	ret = arm_smmu_rpm_get(master->smmu);
+	if (ret < 0)
+		return ERR_PTR(-EIO);
 
 	if (*type != IOMMU_HW_INFO_TYPE_DEFAULT &&
 	    *type != IOMMU_HW_INFO_TYPE_ARM_SMMUV3) {
-		if (!impl_ops || !impl_ops->hw_info)
-			return ERR_PTR(-EOPNOTSUPP);
-		return impl_ops->hw_info(master->smmu, length, type);
+		void *ret_ptr = ERR_PTR(-EOPNOTSUPP);
+
+		if (impl_ops && impl_ops->hw_info)
+			ret_ptr = impl_ops->hw_info(master->smmu, length, type);
+
+		arm_smmu_rpm_put(master->smmu);
+		return ret_ptr;
 	}
 
 	info = kzalloc_obj(*info);
-	if (!info)
+	if (!info) {
+		arm_smmu_rpm_put(master->smmu);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	base_idr = master->smmu->base + ARM_SMMU_IDR0;
 	for (i = 0; i <= 5; i++)
@@ -39,6 +50,7 @@ void *arm_smmu_hw_info(struct device *dev, u32 *length,
 	*length = sizeof(*info);
 	*type = IOMMU_HW_INFO_TYPE_ARM_SMMUV3;
 
+	arm_smmu_rpm_put(master->smmu);
 	return info;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2a1b5ce6ff1c..89ffa8346478 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -121,7 +121,7 @@ static int arm_smmu_alloc_cd_tables(struct arm_smmu_master *master);
 static bool arm_smmu_ats_supported(struct arm_smmu_master *master);
 
 /* Runtime PM helpers */
-__maybe_unused static int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
+int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
 {
 	int ret;
 
@@ -137,7 +137,7 @@ __maybe_unused static int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-__maybe_unused static bool arm_smmu_rpm_get_if_active(struct arm_smmu_device *smmu)
+static bool arm_smmu_rpm_get_if_active(struct arm_smmu_device *smmu)
 {
 	if (!pm_runtime_enabled(smmu->dev))
 		return true;
@@ -145,7 +145,7 @@ __maybe_unused static bool arm_smmu_rpm_get_if_active(struct arm_smmu_device *sm
 	return pm_runtime_get_if_active(smmu->dev) > 0;
 }
 
-__maybe_unused static void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
+void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
 {
 	int ret;
 
@@ -1186,6 +1186,7 @@ static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused
 				   struct iommu_page_response *resp)
 {
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+	struct arm_smmu_device *smmu = master->smmu;
 	u8 resume_resp;
 
 	if (WARN_ON(!master->stall_enabled))
@@ -1204,6 +1205,23 @@ static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused
 		break;
 	}
 
+	/*
+	 * The SMMU is guaranteed to be active via device_link if any master is
+	 * active. Furthermore, on suspend we set GBPA to abort, flushing any
+	 * pending stalled transactions.
+	 *
+	 * Receiving a page fault while suspended or suspending implies a stale
+	 * event when the master has already powered down. A lockless pre-check
+	 * on STOP_FLAG avoids taking the PM lock if already suspended. If active,
+	 * arm_smmu_rpm_get_if_active() atomically acquires a PM reference under
+	 * power.lock, avoiding races against concurrent suspend and rejecting
+	 * responses during transient states like RPM_SUSPENDING.
+	 */
+	if (!arm_smmu_is_active(smmu) || !arm_smmu_rpm_get_if_active(smmu)) {
+		dev_err(smmu->dev, "Ignoring page fault while suspended / suspending\n");
+		return;
+	}
+
 	arm_smmu_cmdq_issue_cmd(master->smmu,
 				arm_smmu_make_cmd_resume(master->streams[0].id,
 							 resp->grpid,
@@ -1214,6 +1232,7 @@ static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused
 	 * terminated... at some point in the future. PRI_RESP is fire and
 	 * forget.
 	 */
+	arm_smmu_rpm_put(smmu);
 }
 
 /* Invalidation array manipulation functions */
@@ -1739,7 +1758,6 @@ static void arm_smmu_sync_cd(struct arm_smmu_master *master,
 			smmu, &cmds,
 			arm_smmu_make_cmd_cfgi_cd(master->streams[i].id, ssid,
 						  leaf));
-
 	arm_smmu_cmdq_batch_submit(smmu, &cmds);
 }
 
@@ -2050,9 +2068,9 @@ static void arm_smmu_ste_writer_sync_entry(struct arm_smmu_entry_writer *writer)
 {
 	struct arm_smmu_ste_writer *ste_writer =
 		container_of(writer, struct arm_smmu_ste_writer, writer);
+	struct arm_smmu_device *smmu = writer->master->smmu;
 
-	arm_smmu_cmdq_issue_cmd_with_sync(
-		writer->master->smmu,
+	arm_smmu_cmdq_issue_cmd_with_sync(smmu,
 		arm_smmu_make_cmd_cfgi_ste(ste_writer->sid, true));
 }
 
@@ -2460,6 +2478,40 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
 	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
 
+	/*
+	 * Use a non-sleeping get to avoid a circular dependency deadlock
+	 * with arm_smmu_runtime_suspend().
+	 *
+	 * When using a combined_irq, the suspend thread waits for pending
+	 * threaded handlers to complete. If the IRQ thread blocks waiting
+	 * for the PM core, it creates a deadlock:
+	 *
+	 *  [Suspend Thread]                  | [IRQ Thread]
+	 *  pm_runtime_suspend()              |
+	 *    state = RPM_SUSPENDING;         |
+	 *                                    | IRQ fires
+	 *                                    | arm_smmu_rpm_get()
+	 *                                    |   sleeps (waiting for suspend)
+	 *  arm_smmu_runtime_suspend()        |
+	 *    ...                             |
+	 *    synchronize_irq()               |
+	 *      sleeps (waiting for IRQ)      |
+	 *
+	 *           <==== DEADLOCK ====>
+	 *
+	 * A non-sleeping get allows the thread to instantly drop the event
+	 * if the device is suspending, safely bypassing the synchronize_irq()
+	 * deadlock.
+	 *
+	 * Devlinks guarantee client devices cannot resume or issue DMA until
+	 * the SMMU has fully transitioned to RPM_ACTIVE, ensuring no valid
+	 * events can be generated during transient states like RPM_RESUMING.
+	 */
+	if (!arm_smmu_rpm_get_if_active(smmu)) {
+		dev_warn_ratelimited(smmu->dev, "client device is suspended, dropping event\n");
+		return IRQ_HANDLED;
+	}
+
 	do {
 		while (!queue_remove_raw(q, evt)) {
 			arm_smmu_decode_event(smmu, evt, &event);
@@ -2480,6 +2532,7 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
 
 	/* Sync our overflow flag, as we believe we're up to speed */
 	queue_sync_cons_ovf(q);
+	arm_smmu_rpm_put(smmu);
 	return IRQ_HANDLED;
 }
 
@@ -2518,6 +2571,18 @@ static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
 	struct arm_smmu_ll_queue *llq = &q->llq;
 	u64 evt[PRIQ_ENT_DWORDS];
 
+	/*
+	 * Use non-sleeping get to avoid deadlock. Devlinks prevent page
+	 * requests from arriving during transient states like RPM_RESUMING.
+	 * (see the detailed comment in arm_smmu_evtq_thread)
+	 * Page requests require active client masters, which are held in
+	 * runtime suspend until the SMMU is fully RPM_ACTIVE.
+	 */
+	if (!arm_smmu_rpm_get_if_active(smmu)) {
+		dev_warn_ratelimited(smmu->dev, "client device is suspended, dropping page request\n");
+		return IRQ_HANDLED;
+	}
+
 	do {
 		while (!queue_remove_raw(q, evt))
 			arm_smmu_handle_ppr(smmu, evt);
@@ -2528,6 +2593,7 @@ static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
 
 	/* Sync our overflow flag, as we believe we're up to speed */
 	queue_sync_cons_ovf(q);
+	arm_smmu_rpm_put(smmu);
 	return IRQ_HANDLED;
 }
 
@@ -2582,8 +2648,40 @@ static irqreturn_t arm_smmu_handle_gerror(struct arm_smmu_device *smmu)
 static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
 {
 	struct arm_smmu_device *smmu = dev;
+	irqreturn_t ret;
 
-	return arm_smmu_handle_gerror(smmu);
+	/*
+	 * Global Errors are only processed if the SMMU is active.
+	 *
+	 * When the STOP_FLAG is set, the SMMU is disabled (CR0.SMMUEN = 0)
+	 * Any errors captured during the quiesce/drain phase (suspend)
+	 * will be handled by the explicit arm_smmu_handle_gerror() call at
+	 * the end of the arm_smmu_runtime_suspend() callback before power
+	 * down.
+	 *
+	 * During resume (RPM_RESUMING), the only operations that could
+	 * trigger a gerror are the CMDQ invalidation commands which are
+	 * only issued after the STOP_FLAG has already been cleared.
+	 *
+	 * Thus, no legitimate gerrors can ever occur while STOP_FLAG is
+	 * set. Any interrupt received while !arm_smmu_is_active() is
+	 * strictly spurious. Hence, returning IRQ_NONE correctly signals
+	 * an unhandled IRQ without missing any valid hardware errors.
+	 *
+	 * A lockless check is favoured here over a dynamic PM core check
+	 * since the runtime_pm_get_if_active would return false during
+	 * transient states like RPM_RESUMING & ignore level-triggered
+	 * interrupts.
+	 */
+	if (!arm_smmu_is_active(smmu)) {
+		dev_err(smmu->dev,
+			"Ignoring gerror interrupt because the SMMU is suspended\n");
+		return IRQ_NONE;
+	}
+
+	ret = arm_smmu_handle_gerror(smmu);
+
+	return ret;
 }
 
 static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
@@ -2666,6 +2764,10 @@ static int arm_smmu_atc_inv_master(struct arm_smmu_master *master,
 	struct arm_smmu_cmd cmd;
 	struct arm_smmu_cmdq_batch cmds;
 
+	/* Shouldn't hit the WARN if there's no devlink inconsistency */
+	if (WARN_ON_ONCE(!arm_smmu_is_active(master->smmu)))
+		return 0;
+
 	cmd = arm_smmu_make_cmd_atc_inv_all(0, IOMMU_NO_PASID);
 	arm_smmu_cmdq_batch_init_cmd(master->smmu, &cmds, &cmd);
 	for (i = 0; i < master->num_streams; i++)
@@ -2912,7 +3014,16 @@ static void __arm_smmu_domain_inv_range(struct arm_smmu_invs *invs,
 
 		if (cmds.num &&
 		    (next == end || arm_smmu_invs_end_batch(cur, next))) {
+
+			/*
+			 * Concurrent suspend races are benign: the cmdq allocation cmpxchg
+			 * loop acts as the serialization point to safely drop the batch
+			 * without MMIO accesses. Concurrent resume is caught by the HW
+			 * reset cache invalidation, ensuring state consistency.
+			 */
 			arm_smmu_cmdq_batch_submit(smmu, &cmds);
+
+			/* Drop this batch to ensure the next one's fresh */
 			cmds.num = 0;
 		}
 		cur = next;
@@ -5116,14 +5227,37 @@ static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
 static void arm_smmu_disable_action(void *data)
 {
 	struct arm_smmu_device *smmu = data;
+	int ret;
 
 	/* If the SMMU is already suspended, nothing to do */
 	if (!pm_runtime_suspended(smmu->dev)) {
+		ret = arm_smmu_rpm_get(smmu);
+		if (ret < 0) {
+			dev_err(smmu->dev, "failed to resume device for disable: %d\n", ret);
+			goto disable_pm;
+		}
+
 		if (smmu->impl_ops && smmu->impl_ops->device_disable)
 			smmu->impl_ops->device_disable(smmu);
 		arm_smmu_device_disable(smmu);
+
+		/*
+		 * A PM ref was only acquired via arm_smmu_rpm_get() to
+		 * guarantee power for the MMIO register writes in
+		 * arm_smmu_device_disable().
+		 *
+		 * Drop the PM ref, we intentionally do NOT invoke a
+		 * synchronous put/suspend here since the HW was already
+		 * disabled above. Calling put_sync would invoke
+		 * arm_smmu_runtime_suspend(), redundantly attempting to
+		 * do the same. Any pending autosuspend timer is cleanly
+		 * cancelled by pm_runtime_disable() immediately below.
+		 * The core code ensures the power management here.
+		 */
+		arm_smmu_rpm_put(smmu);
 	}
 
+disable_pm:
 	if (pm_runtime_enabled(smmu->dev)) {
 		pm_runtime_dont_use_autosuspend(smmu->dev);
 		pm_runtime_disable(smmu->dev);
@@ -5965,12 +6099,27 @@ static void arm_smmu_device_remove(struct platform_device *pdev)
 static void arm_smmu_device_shutdown(struct platform_device *pdev)
 {
 	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
+	int ret;
 
 	/* If the SMMU is already suspended, nothing to do */
 	if (pm_runtime_suspended(&pdev->dev))
 		return;
 
+	ret = arm_smmu_rpm_get(smmu);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to resume device for shutdown: %d\n", ret);
+		return;
+	}
+
 	arm_smmu_device_disable(smmu);
+	/*
+	 * Drop the PM ref acquired for the MMIO disable write.
+	 * An asynchronous put is intentional here as the HW is already
+	 * disabled (CR0 disabled), and the system is in the middle of
+	 * reboot/poweroff. Initiating a synchronous runtime suspend here
+	 * would redundantly disable SMMU and delay system powerdown.
+	 */
+	arm_smmu_rpm_put(smmu);
 }
 
 static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index d0a3d497915c..a018913d3bb8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1249,6 +1249,9 @@ static inline bool arm_smmu_is_active(struct arm_smmu_device *smmu)
 	return !Q_STOP(READ_ONCE(smmu->cmdq.q.llq.prod));
 }
 
+int arm_smmu_rpm_get(struct arm_smmu_device *smmu);
+void arm_smmu_rpm_put(struct arm_smmu_device *smmu);
+
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
 void arm_smmu_sva_notifier_synchronize(void);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


