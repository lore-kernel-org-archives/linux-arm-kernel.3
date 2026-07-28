Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83034C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+Gi9b31nCs7m8qDvq9onthmRDdD1MWH6Z3rOryIWho=; b=Y8JCpthuTC+Ecm7UH3NElJxg9X
	U4Fr6C59qxf5qQXsEosKJUeuOupX8v8ZTNuSdLcDmIBAf/AHMO0c+PHRy2WaZW+zKB02PzTzE9kqA
	Fpp/7ywqVC4JfWxPAFg86ZKB+F2cWLFZkGxOH/xzBoauS6da3KjNf4BUm5vrvYXSgoLE40k/5J2YN
	wTeuI5UmvAX4zND8qnyGiVRuSEE5k/GSuseDRon9377UVpOr8C+xCeex/43M0MUo28hmqwD3D2o2I
	32S9ZyBt2i/JYXqQpDhjrTPv6tjtfkzehkJfF9313by3c2gld9WU0Eo4eht9wbSlKApxIsxTwjifu
	L3mb4Oxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3m-00000006GZ2-3HNI;
	Tue, 28 Jul 2026 21:09:58 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3g-00000006GTv-2OqI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:09:53 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso148138a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785272991; x=1785877791; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+Gi9b31nCs7m8qDvq9onthmRDdD1MWH6Z3rOryIWho=;
        b=WzyMNlh+MgwxXDZamlDIGDBBdhYldGhvoBOHk11mNjrVrQOT9CeS1GeEqwsS9ntiJt
         B05vip7AF8PCTEBissPnvr7OH5RN4bx3ylDFSYL6V+KIGV/SyVc0yxMh/+RfnFDJYKel
         iffSg5V8QvA2aLtlk9VrH9h431N8MFNR5oPUZowCA8C8uAO6gxOZVigzT+Le78R8Cg4s
         Zt5McFoopM2QVn/hj7ND1EbW6rnETkIpUFwFmnFC6+xvAFOsicMUDjA5ytXNdRDTf/dH
         tSOU31MxxqOfTz0bpeW+EHg71Lyr2q8ogqSdFVfk0QIYzFLVsAaDh2vWo70EAZtgB5Rv
         xJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785272991; x=1785877791;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+Gi9b31nCs7m8qDvq9onthmRDdD1MWH6Z3rOryIWho=;
        b=sYv8h2X7HLqrnpng5Ibp0QgJMtPLVgngDK7yYyGrU3TtG6Px+9T29WUPbicwYq/pPM
         u2hULuIMbgg5YHYyLzLrHj79V0LhxaYXXSHf6EELz//ChN8HodXfvD9gAq7YB3UNTt8j
         chkyPNR1WMZ1/NySlZCONSQ8l26VIZ5DC5FzW7bz+qgepRWImvJGc2A39+8mJCgcaCs0
         44pPgOsykusdXOYpYBs2ZPPZRj7j20GlYJSpjSCzuJNRAXgRaMJhDiJ33exIiatfj0ED
         SZKthX4akt9xowIibskS6oSSt6sCs7BOnmlJkhO5O+w2FEDfg0sKFOht03N7xuTzNz9a
         1fCA==
X-Forwarded-Encrypted: i=1; AHgh+RrNtGNLBiLTX+1SzZ/TaGMV/a5JF0yxWKeRcNfGoQVVEngmLPwuJT70bsC1L+WWpJ5qMtoo8IHIiWX0hOWWJ+hH@lists.infradead.org
X-Gm-Message-State: AOJu0YwGXFPH2gaVyYf2vhIDL/fHFE1lLg5H8spoaxfmqH51Xs7Hwrx/
	c7jyslLFDyE1V+NscLRRGufKOlhX9a4uhFnJExjdaU0MH1Nao+qoP7Gf/7KeSdWVa3w6Byg3rwq
	xAg==
X-Received: from pgbfu15.prod.google.com ([2002:a05:6a02:4a8f:b0:c8a:8cda:bd48])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9396:b0:3c0:9c19:b277
 with SMTP id adf61e73a8af0-3c8ba66a32emr5138162637.69.1785272991019; Tue, 28
 Jul 2026 14:09:51 -0700 (PDT)
Date: Tue, 28 Jul 2026 21:09:23 +0000
In-Reply-To: <20260728210928.1050849-1-praan@google.com>
Mime-Version: 1.0
References: <20260728210928.1050849-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728210928.1050849-8-praan@google.com>
Subject: [PATCH v9 07/12] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to gate
 CMDQ submissions
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	linux-arm-kernel@lists.infradead.org, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_140952_616618_0D545AD1 
X-CRM114-Status: GOOD (  18.24  )
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
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  5 +++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2a976f210d9b..8809757ebee8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -219,7 +219,8 @@ static int queue_sync_prod_in(struct arm_smmu_queue *q)
 static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
 {
 	u32 prod = (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + n;
-	return Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
+
+	return Q_OVF(q->prod) | Q_STOP(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
 }
 
 static void queue_poll_init(struct arm_smmu_device *smmu,
@@ -727,8 +728,25 @@ int __arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
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
index adfcbb654673..40b889998d5b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -389,6 +389,11 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
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
2.55.0.487.gaf234c4eb3-goog


