Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07508CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 21:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWOb+HolO8JcpaQsXLOMu+8Ojdlg6FqfnP4yGw0xQ0I=; b=puFUIsOoX3oUu1l0YUO4vDD0z5
	ODYDviOv0RaQ+cE2i/8uGtIEgKKScxPIqELPs1i2yA3pr2Ae/nBvMXwGAhJAAlgKO8Ih9GCygqqmo
	IN9dd6e+QeI4zVbvdhlZkzoYM8C/j1X8MvKLQmer9HL3dUysU6bwO3YzwtNhRegx/Um6JqdOSNIUx
	BlqhvAZHf3UXiC02MQO7UT2bcEAapIwUQpFrZG5qfYZBW0L+N6ZSbIRLZo0WSjySSaAHSs8yX9ADh
	69TOksH7y6wNoW1qJsYBK8guP6TaFLf6Cy4WDIAi1lrCowe4tQcOZyYOGJLZsCWqmcWTdq3/mMtNj
	BHkSIbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfS-0000000BtPq-3UVw;
	Mon, 01 Jun 2026 21:59:30 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfQ-0000000BtM6-0e0H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 21:59:29 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-84238e83851so1369210b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 14:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780351167; x=1780955967; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LWOb+HolO8JcpaQsXLOMu+8Ojdlg6FqfnP4yGw0xQ0I=;
        b=HfPg0AQXnRH13h7dswkEt7HtQIsP6k5bQPvj145LsENU/CkE/J+DaYIfeRPUtZQ61M
         fV9Fwtc/7KHX3V3kOvArGsaM8FbBc6y8jNY8oKsyIxATPqzQt2TjH3poaQeltWqv9WEf
         39U7iXjwK/3RH90PmfwFtpm5ewDVHZIMrAw1na5atyCjCaT9PpcjNQ9JlGBamfkVuEuC
         +hqyX+74Ev0V2vmShki+AiuXX7Ifbu6hzYghHW+mvK8p61miUHvJtlsxQ7uOHWlwc9Ez
         4zHrLZ7XyHAw20BAxk1r3MhmOju50QEmCUKgMlIficTnnGhO1XrFq5A8+9BE5ar1gM1o
         ID1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780351167; x=1780955967;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LWOb+HolO8JcpaQsXLOMu+8Ojdlg6FqfnP4yGw0xQ0I=;
        b=dDi9Yu5ody1ymy0FsDjLmBHT28mkw2/MQmQQxwt2kIx4anLe2dlCFcG+ioT6HUDZyJ
         8gKLGhZFp2ncRkFxgLytMxWhUBm+nKsBFZ5njyXQ7twvcB2a2bhARIneMxnzDpAqYqQB
         ENwJd2pE33NN5wFZgRR1yywISCfe1/NZYOVRqAUTLPCxp3fSUHGgIfC+E8vC56bRSCIn
         UsIF39yaFQhjuqB0nJjTCKCwH/I+whZwU0T+kl55g42TZtz+MAubBm/dlbth5eVYVpfx
         j6zKIMQXR5mE18dzxnUpscCjjhhCoQXQfbVN2EGBsse5wgwrB263fEvgS0BGBUv/a1Im
         Gtiw==
X-Forwarded-Encrypted: i=1; AFNElJ8tb4X0unQm4CZmjmBAER1bNHpz7ApZ7MRnNm7+hDc1NPazXeS71ODUya2uoJtLhmmrSL79/Q7vkaIlRmO4C8yq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz69zDwHsV11Z9EqfWo4UCQpcBzTWj/lvNRvkzxz8B1MnTsDmhG
	4mb9ijQNzfFjJBWiJrf84IcN8HHUFWX/Pf2Bx4OSGRhhXCS8WncZY6ovgDDrJ7eRtTURd7HhNhn
	twA==
X-Received: from pfaz8.prod.google.com ([2002:aa7:91c8:0:b0:842:4d1f:7750])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:908a:b0:837:e9cc:d46e
 with SMTP id d2e1a72fcca58-842253ed743mr11621319b3a.21.1780351166606; Mon, 01
 Jun 2026 14:59:26 -0700 (PDT)
Date: Mon,  1 Jun 2026 21:59:04 +0000
In-Reply-To: <20260601215909.3958732-1-praan@google.com>
Mime-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260601215909.3958732-8-praan@google.com>
Subject: [PATCH v8 07/12] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to gate
 CMDQ submissions
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_145928_199512_8E3599E7 
X-CRM114-Status: GOOD (  18.09  )
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
The flag checked in the cmpxchg loop in arm_smmu_cmdq_issue_cmdlist(),
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
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 20 +++++++++++++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  2 ++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 6c8631e2f153..c4315bdde7d5 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -210,7 +210,8 @@ static int queue_sync_prod_in(struct arm_smmu_queue *q)
 static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
 {
 	u32 prod = (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + n;
-	return Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
+
+	return Q_OVF(q->prod) | Q_STOP(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
 }
 
 static void queue_poll_init(struct arm_smmu_device *smmu,
@@ -718,8 +719,25 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
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
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 24d5e28eea88..a3c8417c87d8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -389,6 +389,8 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
 #define CMDQ_ERR_CERROR_ATC_INV_IDX	3
 
 #define CMDQ_PROD_OWNED_FLAG		Q_OVERFLOW_FLAG
+#define CMDQ_PROD_STOP_FLAG		(1U << 30)
+#define Q_STOP(p)			((p) & CMDQ_PROD_STOP_FLAG)
 
 struct arm_smmu_cmd {
 	u64 data[CMDQ_ENT_DWORDS];
-- 
2.54.0.1013.g208068f2d8-goog


