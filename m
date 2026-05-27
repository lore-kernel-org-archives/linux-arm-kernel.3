Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CECCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 22:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8/bA1XI9FWDfhx4EbmdfcGilvJQlSvMoglKBnMjsyo=; b=yD6RBnxm2lNKKj1e7ORrRe5Thh
	66ydSz1gxcjnlJFkXOOSILMBcxChqFhL4nwA39ceajqGxH14CX4wwenH1QQCSF+KuEUyUUolw6Bi3
	4RndMElYF+4faz5B2exc76e/TThMgld+qHt48XHiJPMQd+q/daxh24a3DUVQDG/8H55PP5c0XW+W3
	/01YoPloHh4xiINvVZZ+k7gYXdbrlCQhvuJvM5F4mGkFep96/Zke2Ku0XDBVNNH3s5CNUCmDVHWOm
	Vy8nq2DOBZdRUeEDHW1gK7clETB4Y5r4P3cPb/NPQrQEq2whQPNMa//6+LCKX1FbTEXXscGu6A4AZ
	fiPvuqPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMWH-00000004mSz-0APi;
	Wed, 27 May 2026 22:14:33 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMWD-00000004mPb-4B5k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 22:14:31 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so11255497a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 15:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779920069; x=1780524869; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A8/bA1XI9FWDfhx4EbmdfcGilvJQlSvMoglKBnMjsyo=;
        b=aSWN58DNTyrY52b05yDdC5+mMCpSl1oHL1Z/pUkzDvaHnIYcSOfBdqD8YuZPzEFjHE
         pmwoNsT+WJH0kDg779OrUj2kaZkcBdAEzuvkMFeSVqHBG36vK4/tuD5We35V9YQzvNSN
         gnGzdQoAyRKVpq5aj/p3Vr5uagbgnl+zlTrPhxKT2hI0tt17iZoj3AhErA5HgoB7h/XG
         LXAYs8SjO41JKYd0EVHMmkbufDSrpyIWiapjM18oiNe5jQvjb1Mbp4Ggq2HOf97lMdfg
         zTzxcNDfij8Huoh5DZVYoQrWiBHM0g09XSTTt2zMZM/jhUiGMvam0m7Gecxilk00rP42
         atjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779920069; x=1780524869;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8/bA1XI9FWDfhx4EbmdfcGilvJQlSvMoglKBnMjsyo=;
        b=Hj899qkE6OgVmoOnaq1WpEK8wi2iJpWtUZPRsTJIxOrqJtGlcXCe8cdiBj9BaTz5A1
         cp4zvS128Q+PgwuFS/vmEFGffRuNFEdeK6H4/4n1QxFYsAH0Vnzlr0zd1xh8FszwW3Wn
         fgU6PHR6oySsNzLb5HZwKIA8EJYpXeZKMDhZzg3zQMiCkLC85FWdmATLzG9iJ7nwmv60
         /7+4pQbAxAtVLRX01tse0MXfJA5LMyC4AkiV2nXx9Fge0RTVIi+hRinQ/ponOyjBrGBY
         /EKAGwY9rav8QW6a1IScfZ7mngI0YCIO7u5a7jeqPmPJQWJo78GOOck1uez7V+fAsjGS
         4Huw==
X-Forwarded-Encrypted: i=1; AFNElJ9Mx+UzcEnrfatgWeG4IV6eOzhSF8zM/WuWTY7780S2bUfyrduOqGp2pgKlxOkO4ktKnPxa4LEeFqlq4hRb4c8W@lists.infradead.org
X-Gm-Message-State: AOJu0YwcXxBLZkOGvYE24Zh6fK4+CqrM4uNnPscCAPOb8sY1h9xMpLuE
	tl3WDEXCfDKcAKb9ayZI6ggYlo6F9nI3KmEmKsDITb6vZZ6yZbVQL/d21Lda16+XYMQcNNy8Klr
	uAA==
X-Received: from pfh4.prod.google.com ([2002:a05:6a00:12c4:b0:837:aa2e:b191])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7105:b0:3a0:c2b4:d976
 with SMTP id adf61e73a8af0-3b3293c0a32mr25162408637.44.1779920068760; Wed, 27
 May 2026 15:14:28 -0700 (PDT)
Date: Wed, 27 May 2026 22:14:03 +0000
In-Reply-To: <20260527221407.1756491-1-praan@google.com>
Mime-Version: 1.0
References: <20260527221407.1756491-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260527221407.1756491-8-praan@google.com>
Subject: [PATCH v7 07/11] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to gate
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
X-CRM114-CacheID: sfid-20260527_151430_045993_F8D151AE 
X-CRM114-Status: GOOD (  17.42  )
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
The flag checked in the compxchg loop in arm_smmu_cmdq_issue_cmdlist(),
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
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 20 +++++++++++++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  2 ++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 191b5b5b805c..a28417108a8a 100644
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
2.54.0.794.g4f17f83d09-goog


