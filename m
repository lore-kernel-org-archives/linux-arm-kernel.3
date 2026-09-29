Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517DBCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJUc8W66LdXd5niQlho6vVTddWB/e8RRGn6UCJy7ACg=; b=QmRdPF7MUTcmhrqSy4QVftQ7Q3
	4Yxp9dBS+7tIyNyfxYllvm4VUHhwvN3iqF4VW3y1tybMN07Hf7rAd4/Qv2LELJIxfPES5kqmVfmkC
	FU3/48Hnl25GwSkj3GRUqTZTzrJzuva3CnV7Nn1pg2xrcq+P0WBw+sEpWNvR6D8rn4I6/aHuMirsf
	bCURkKJOjZ9Ynn4CxE1KhvFqRBrZOddkFkuY3aew7KLdssmG25d8w+yaOd6CfO1tZatrfGSC9Q/vB
	fyNKindcQzXZ6rrp65mNvl5a1KjnIm6Wvg0byxSlcrIiOmD/DosEpFlhW0McIT9S9QAyPCBjqVjQJ
	ocgBi4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOns-00000002GvY-3BLx;
	Tue, 29 Sep 2026 03:46:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmw-00000002GNl-1J6O
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 03:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DJUc8W66LdXd5niQlho6vVTddWB/e8RRGn6UCJy7ACg=; b=GgHYXmoay6J1THCcqzNFCNhOJX
	X5f0gZAHHXK2EV6VyORigkRX1z/xquqVHd99BycA3y+mMz471FhFteL8tB5PMYQ4QCSTFrVieeMlo
	NbCGRCm8BLrPleEbA1x59FDIOIzFcul7Uvco75zsXb5gF5+/wt/3TTvGq4S8H5ebWcvjxYRwwhQVg
	nym2y+BFJs+fBgKPSfhbba3/WFwZ7sxFx9HKQx+5627hYyMKd/FlA++puusMJJjxR/4UdZVz5iy+V
	Mav5Br4ufBvr4IBg5AvYgaBzETUfc8+qIUDeOeGzmAy+6hrxjLnivKxqY4My2EdaTsK1uLAwnz3/p
	KyJ0885A==;
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmt-0000000AYYX-0pXI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:45:53 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cc51591102fso2532127a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653547; x=1791258347; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DJUc8W66LdXd5niQlho6vVTddWB/e8RRGn6UCJy7ACg=;
        b=SvIdW1DdSKwYM48aczhbC8T1d0bCY1NgOeO/wvysRAuRv3sbOo7P5m/K+dX64fclA8
         RM+G/IseRl9yUEiNuFnS0F/PRIX7cipvAJ0DSihfDq7nGIebR7sNhFkXhrMLNs77ZKVy
         F7ZsO8a/tHicjEYMST5Potc/wKCK14fihlpMmR5lc9qBGnLDAHUxV1sOSLIhncHVW+rM
         06/pRVLhTVx0s41P6Ubziipv9NrZJ62s/Jupf+HaZ5IMqR0HEHEE0ODxPLHmIyvAEJH6
         oCIYUzsZDnOYPx3jZl1s9rSCkafUv4XBxyEs1t4fCbEO0YdHEqCP0Zj33xN/yAJbCkuy
         P70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653547; x=1791258347;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJUc8W66LdXd5niQlho6vVTddWB/e8RRGn6UCJy7ACg=;
        b=CBaC+5R3v3RQX7VBdzYK6b0w13AYPCjwNksYZ0Z7bR4rVI1C3y6rCqUF0IWHG23hZq
         tHjPzfiry+dybx6S6GKwNNidH6Dk0/OCus89hWpZKzBeHQ8wRgo9X8jV4drZrHDi5HeD
         iXBisnfuX+lN7yggI8UCySCvN5EwCkEz7E5qxCexErcKDXtvK0wMTVIXNATVxOMhNMgd
         k2OFz1HBB3AolzOtVp0y4uyiM1oS33w4e4F+lazl3vCFGPIWSFGTAUSoJneLDM+e3pf8
         gDZecuxC848W0IW1hFzd81dxskONHY48XjbysW3JRCRy5l5O1b6Phz+E7Bwdz0O++wnm
         aLkA==
X-Forwarded-Encrypted: i=1; AKwUvBwtTjLoTnU6nKxKsX0Zb2ivyNzM5KPGck9IxI9ZfHEQqauYaNDibDwu+nwMfrAIxWa6R//qMQOFy9arMqYRi6pH@lists.infradead.org
X-Gm-Message-State: AFuF++kkMN/dB1C0irnbTgCBc//T7DdLr57F6Wbg8fVLbNE6WhdLo0Ki
	jfFg/6yeGx6CIsDtockRg/rIPKg11p8dHx0Aegq1o/puRVjGt+BRmE+H+HTFATCa73/RZ2Cn1ku
	7rQ==
X-Received: from pgdf1.prod.google.com ([2002:a05:6a02:5141:b0:cc7:56f1:71ad])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6f06:b0:3d3:ae40:51e5
 with SMTP id adf61e73a8af0-3de0e750b0dmr13391618637.25.1790653546468; Mon, 28
 Sep 2026 20:45:46 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:45:05 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-12-praan@google.com>
Subject: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to gate
 CMDQ submissions
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
X-CRM114-CacheID: sfid-20260929_044551_345389_377DDC6C 
X-CRM114-Status: GOOD (  18.22  )
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
index a123810fac57..7f89e2306942 100644
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
2.56.0.rc1.315.gc6ed9934b7-goog


