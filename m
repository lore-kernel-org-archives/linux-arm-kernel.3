Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B098FC79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/jv1ovVCNeCubLupVeuht7eNIRLVbkvYJqOaymhU6s=; b=0xrMiUB3NYHruVwoeljIkJYguf
	4WNxIsEdaT0FxWkQYvkUQvE84hbO60j41d3oOgNe6SuJ355uSz9+HvNcOhc1YIJJJJCJR2xEM1HK6
	0LDbnd3UnE9OthSa33JRRIC2rqwDDCgyx5h5X1TkQOaxn2D7m1WMBG7y7xHJv0CoWIV/SAQnm0h1k
	NUXGv1FJi9nZs9AWkXeRd98Bv9gxd7yfKa1Ho29K0O+M9pQsZrBktMu+BdOe4a6s3zXNhbPTyfYUa
	iNrSRRk7I+phvjkBpCDCEwufCMNGkZTHoUmXuZg2B0Y13ITibS/NdAixZlV2aui9C/2rw5SA6aYKb
	34NU4p0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zSE-00000009mnU-0mNt;
	Tue, 08 Sep 2026 17:17:54 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zS1-00000009mZV-30hB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:17:43 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-8485d853b08so6368261b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887860; x=1789492660; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/jv1ovVCNeCubLupVeuht7eNIRLVbkvYJqOaymhU6s=;
        b=g1ohiOO/2zp33LrAvP9cy4eMqfWASSlYSOcBoD5ScL4jxzNWw+qgTP+uP04d/mWZNz
         c1KQ3sdHZq2um/+nkZ1sN85U1kRuqBywWo+xox6XZUPjvJIN/cUCQ5CRTgs2Led+rEJh
         4phyShWvK+Lc8senAYgzFe4psn/28c8QhZejx7VG4ATvK/byPCnyHHGvica9A3JjeZzI
         nm34f2QOW/eNsCU91Ybm/ZdoySEhz2H7213OdJFQplUTuCNwErCEWj4FKNVS9VuiWw+W
         iQvq+WGMQ6R+BpADgNdpIaE9OxQjac+podZXXo+qcO/JJhlGz3ZW+dwaQZ3wCQOOlGsM
         WMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887860; x=1789492660;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/jv1ovVCNeCubLupVeuht7eNIRLVbkvYJqOaymhU6s=;
        b=UNy4ZOfhiqo+3d8Ku0ZMLXsNbDeq/Lbdx1fbr3vevamaLPhzn/98gGWe95P/5YTQZa
         r8HKky8hg0Ok3RUv/H9WV0wCQTM7LYU5S1DqN7cs6IVf71SqJtrAAKsSqRHtR4Yi+F5a
         4DjbS4Ps0cqgPv5ITvMUgHTF8QR0Gd+pbDJbmgpSDjzNxKyN38zJgIvfMI0UTKIiksvI
         sDgj3rAFZdybYuMGC647grNrt2oyd9CmmG4SWNUd6eW7e+QhF482/DXdE48GySEtNEth
         4cTKIpGtcWN5O3hl8kNpNBjuEmoz5/2TER063nhD/yCYJXAtcSxyReLG2JGjrUF7UYDe
         9zdQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2qClP70zETUjGLt6bavWx8AvCDL/HMaL6S8gQ/Yj17CaAmyuulQEQLyq8l3eLMUAU/Aq2rlNwAeTZIoktFPC5@lists.infradead.org
X-Gm-Message-State: AFuF++lSRF8xP28WLf7QGP3HKni6OS7E4l5p1MdJj7DUV/0zWX/HYwGA
	o0HO3urIHCTUzYDHqT9kYsj+CmO8npMCsmsUYJf4WaeiaeXpRacgus6fNoWxt55WkJkR5pTrWwp
	FzA==
X-Received: from pfbce7.prod.google.com ([2002:a05:6a00:2a07:b0:866:a8ba:a59])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1950:b0:85c:3922:25d5
 with SMTP id d2e1a72fcca58-8616aa68194mr43353950b3a.21.1788887858247; Tue, 08
 Sep 2026 10:17:38 -0700 (PDT)
Date: Tue,  8 Sep 2026 17:17:06 +0000
In-Reply-To: <20260908171712.356645-1-praan@google.com>
Mime-Version: 1.0
References: <20260908171712.356645-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908171712.356645-11-praan@google.com>
Subject: [PATCH v10 10/15] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to gate
 CMDQ submissions
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_101741_763264_C8511395 
X-CRM114-Status: GOOD (  21.28  )
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

Introduce a new bit flag, CMDQ_PROD_STOP_FLAG (bit 30), in the command
queue's producer index to safely gate command submissions during device
suspension.

The flag embeds the suspend state directly into the existing global state
The flag is checked in the cmpxchg loop in arm_smmu_cmdq_issue_cmdlist(),
which acts as a Point of Commitment, ensuring that no indices are
reserved or committed once the SMMU begins suspending.

This prevents a situation of "abandoned batches" where indices are
incremented but commands are never written, which would otherwise
lead to timeout during the drain poll.

Update queue_inc_prod_n() to preserve this flag during index
calculations, ensuring that any in-flight commands that successfully
passed the point of commitment can proceed to completion while the
flag remains set.

Suggested-by: Daniel Mentz <danielmentz@google.com>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 35 +++++++++++++++++++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  5 +++
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 98af7c1fac94..65939a9b0619 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -218,7 +218,8 @@ static int queue_sync_prod_in(struct arm_smmu_queue *q)
 static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
 {
 	u32 prod = Q_POS(q, q->prod) + n;
-	return Q_OVF(q->prod) | Q_POS(q, prod);
+
+	return Q_OVF(q->prod) | Q_STOP(q->prod) | Q_POS(q, prod);
 }
 
 static void queue_poll_init(struct arm_smmu_device *smmu,
@@ -726,13 +727,42 @@ int __arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 	do {
 		u64 old;
 
+		/*
+		 * If the SMMU is suspended/suspending, any new CMDs are elided.
+		 * This loop is the Point of Commitment. If we haven't cmpxchg'd
+		 * our new indices yet, we can safely bail. Once the indices are
+		 * committed, we MUST write valid commands to those slots to
+		 * avoid indefinite polling in the drain function.
+		 */
+		if (Q_STOP(llq.prod)) {
+			local_irq_restore(flags);
+			return 0;
+		}
+
 		while (!queue_has_space(&llq, n + sync)) {
 			local_irq_restore(flags);
+
+			/* Avoid waiting for space if the SMMU is suspending */
+			if (Q_STOP(READ_ONCE(cmdq->q.llq.prod)))
+				return 0;
+
 			if (arm_smmu_cmdq_poll_until_not_full(smmu, cmdq, &llq))
 				dev_err_ratelimited(smmu->dev, "CMDQ timeout\n");
 			local_irq_save(flags);
 		}
 
+		/*
+		 * If we exited the polling loop because the queue finally
+		 * has space, but the STOP_FLAG was set during the poll,
+		 * we must abort immediately. If we proceed, we will
+		 * commit new commands beyond the Point of Commitment while
+		 * the SMMU is suspending.
+		 */
+		if (Q_STOP(llq.prod)) {
+			local_irq_restore(flags);
+			return 0;
+		}
+
 		head.cons = llq.cons;
 		head.prod = queue_inc_prod_n(&llq, n + sync) |
 					     CMDQ_PROD_OWNED_FLAG;
@@ -779,7 +809,8 @@ int __arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 		/* b. Stop gathering work by clearing the owned flag */
 		prod = atomic_fetch_andnot_relaxed(CMDQ_PROD_OWNED_FLAG,
 						   &cmdq->q.llq.atomic.prod);
-		prod &= ~CMDQ_PROD_OWNED_FLAG;
+		/* Strip all metadata flags */
+		prod &= CMDQ_PROD_IDX_MASK;
 
 		/*
 		 * c. Wait for any gathered work to be written to the queue.
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index deefb17e31eb..794b258550dd 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -394,6 +394,11 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
 #define CMDQ_ERR_CERROR_ATC_INV_IDX	3
 
 #define CMDQ_PROD_OWNED_FLAG		Q_OVERFLOW_FLAG
+#define CMDQ_PROD_STOP_FLAG		(1U << 30)
+#define Q_STOP(p)			((p) & CMDQ_PROD_STOP_FLAG)
+
+/* Mask out software-only metadata flags to get the pure queue index/wrap bits */
+#define CMDQ_PROD_IDX_MASK		~(CMDQ_PROD_STOP_FLAG | CMDQ_PROD_OWNED_FLAG)
 
 struct arm_smmu_cmd {
 	u64 data[CMDQ_ENT_DWORDS];
-- 
2.55.0.979.g7e5102b832-goog


