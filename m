Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D07C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBu9oh+TkSTLVV9ZYrPVk83cxnj3jVdJUheu3Z2jp4I=; b=fEjny7VI8bhlYYFCI6DwojZEqn
	/kBX54dD8itbdVyCrnOuC6+ekNfzohP9qGklYSgK07/dJxmiRoY4zpC8QH+2HUGo/MqjmJNc531Af
	yu15pUPkEbeSlrPha9AARVzSTSeKRW8DLP3HMaU0rx+h2eFsXtFMIV1RUBKJHBJCQ+XjxLzmmH2CA
	msOTy6+uvTOFK/4ZdYNR8w/G6BLdF7tAYjthCbuCzOVkCclWUDjfxHPljVY5nS/HC+ts4hBkn5ww9
	Zu4H1217JI5HN/jkGEckEA/TmX172EnDSw80NWltJWOj0kY7dXf//9DruWd9Lf1NrZnlh7lEdw6ib
	LZpYD2Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90J8-00000005S8p-0C4U;
	Tue, 22 Sep 2026 13:13:14 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90J2-00000005S48-3BJv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:13:09 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-6a5d57a8d51so5420403a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082787; x=1790687587; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBu9oh+TkSTLVV9ZYrPVk83cxnj3jVdJUheu3Z2jp4I=;
        b=HnZuSQiRd5tq3KObyTPw+ZgX1BNYn8Bw4Jcyr7vu25NzARNr/o6KtvIkxRbdLnKv6H
         i617pnUkpyp3EjzRGYMwafvCgE3ezs6fDfH1V6jubPMfudTLK7CoIz62+V2yFYQMQL5q
         5ihq86fZGmhD7Tj1VeHNfcNvPGG+C7liOKTkGfVDM/6BPTHMjiTnl0qqVHbzyPu7DB5A
         hvoJFhgvZWKC1lZKwYPn7n/nS1JJDhzrH7Qk4BJrCFABoea6Ibv1pCH2IWzpnMYwO6/S
         s+4UPrN5j5ouWGaN0GoYniHZ28xZr/zgnrOLo6wGoG3WJdb6W8M5IcGMQIhhwDeOfN3e
         eupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082787; x=1790687587;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBu9oh+TkSTLVV9ZYrPVk83cxnj3jVdJUheu3Z2jp4I=;
        b=IowpywOCLJY7mC4RcA37LxQw4st2C8oI8iqMExBN8UOwOgp7X72rj94Pnv0M8U5B7F
         Z+QDrvkNRNqp25zLskv1WCdEOFsTnQ/IA1y8+qgVqplGA71QSer5U+DcaanCrRYZcnNL
         GEw1YDnNUmVXrh61imOD9I0J2SljEvW66HE0pdhwUHrxhiex3322X7QNPsp2j0pa91oG
         bnWn2UE0gIPHGq9jFLYhm3uw4ChulcuDJZ48WCmz/bseMKXDY6DjcLwCx0geybhne3rE
         KRB8AkLgsTLf/9KYAtZq+I4x1Tc0mCLN6mgWFhwd/9JjL9bgTaPKUm4UluS34711Tdps
         maoQ==
X-Gm-Message-State: AFuF++nD//dfoh6IVn/vEstkdvFWZwxuVWinj4Km5mnk5+O1hN/8cr3G
	tDzGlOFPGVlgLnkc+Zjtp1iKJvV/MosZGl/a1C2ZBRR3ZQbWFsD2ZJZrQaCarqZQIwjvFEsczwq
	/ff5zl3PPbW8frfoDUn9JlWGTcFfmDfIiSOEwgXQ/GPw0sZAEtU6vEFQnjluGMpzRR5e23PuA7g
	cWKZMXtqm5OezlPfFEcyb+R9MW04MTgftbExssJVguiGGakOERmEseKtwsepEuqWYgIw==
X-Received: from edxz22.prod.google.com ([2002:aa7:cf96:0:b0:6a9:8583:17bd])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:e08:b0:6a9:5669:9b77 with SMTP id 4fb4d7f45d1cf-6aa569b484dmr983240a12.44.1790082786225;
 Tue, 22 Sep 2026 06:13:06 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:36 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-4-smostafa@google.com>
Subject: [PATCH v8 03/25] iommu/arm-smmu-v3: Introduce RangeInval encoding helpers
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_061308_813586_568E3DD4 
X-CRM114-Status: GOOD (  15.75  )
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

Move some of the RIL encodings into helpers so the hypervisor can
reuse them.
The hypervisor is going to have its own algorithm to determine the
sequence of RIL commands needed.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
I removed the refactoring from this patch as this code would be
deleted anyway.
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 14 +++-------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 30 +++++++++++++++++++++
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index df1924969212..2e54d1ba2566 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2418,8 +2418,7 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
 	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
 		num_pages = size >> tg;
 
-		/* Convert page size of 12,14,16 (log2) to 1,2,3 */
-		tg_enc = (tg - 10) / 2;
+		tg_enc = arm_smmu_tlb_inv_tg_enc(tg);
 
 		/*
 		 * Determine what level the granule is at. For non-leaf, both
@@ -2430,7 +2429,7 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
 		 * where both scale and num could be 0 as well.
 		 */
 		if (leaf)
-			ttl = 4 - ((ilog2(granule) - 3) / (tg - 3));
+			ttl = arm_smmu_tlb_inv_ttl(granule, tg);
 		else if ((num_pages & CMDQ_TLBI_RANGE_NUM_MAX) == 1)
 			num_pages++;
 	}
@@ -2452,10 +2451,8 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
 			/* Determine how many chunks of 2^scale size we have */
 			num = (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;
 
-			/* Keep the pre-DS 5-bit truncation when scale > 31 */
 			cmd->data[0] = orig_data0 |
-				FIELD_PREP(CMDQ_TLBI_0_NUM, num - 1) |
-				FIELD_PREP(CMDQ_TLBI_0_SCALE, scale & 0x1f);
+				arm_smmu_tlb_inv_range_enc(num, scale);
 
 			/* range is num * 2^scale * pgsize */
 			inv_range = num << (scale + tg);
@@ -2469,10 +2466,7 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
 		 * command and something would be very broken if iova had them
 		 * set.
 		 */
-		cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_LEAF, leaf) |
-			       FIELD_PREP(CMDQ_TLBI_1_TTL, ttl) |
-			       FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) |
-			       (iova & ~GENMASK_U64(11, 0));
+		cmd->data[1] = arm_smmu_tlb_inv_addr(iova, leaf, ttl, tg_enc);
 
 		arm_smmu_cmdq_batch_add_cmd_p(smmu, cmds, cmd);
 		iova += inv_range;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 5b23f6ee78d4..f3e80d103ba1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1285,6 +1285,36 @@ static inline void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
 	WRITE_ONCE(dst->l2ptr, cpu_to_le64(val));
 }
 
+/* Convert page size of 12,14,16 (log2) to 1,2,3 */
+static inline u8 arm_smmu_tlb_inv_tg_enc(size_t tg)
+{
+	return (tg - 10) / 2;
+}
+
+/* Only valid for leaf invalidations, non-leaf must use TTL=0 */
+static inline u8 arm_smmu_tlb_inv_ttl(size_t granule, size_t tg)
+{
+	return 4 - ((ilog2(granule) - 3) / (tg - 3));
+}
+
+static inline u64 arm_smmu_tlb_inv_addr(unsigned long iova, bool leaf, u8 ttl, u8 tg_enc)
+{
+	return FIELD_PREP(CMDQ_TLBI_1_LEAF, leaf) |
+		FIELD_PREP(CMDQ_TLBI_1_TTL, ttl) |
+		FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) |
+		(iova & ~GENMASK_U64(11, 0));
+}
+
+/*
+ * @num: Number of 2^scale granules, must be >= 1.
+ */
+static inline u64 arm_smmu_tlb_inv_range_enc(u8 num, u8 scale)
+{
+	/* Keep the pre-DS 5-bit truncation when scale > 31 */
+	return FIELD_PREP(CMDQ_TLBI_0_NUM, num - 1) |
+		FIELD_PREP(CMDQ_TLBI_0_SCALE, scale & 0x1f);
+}
+
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
 void arm_smmu_sva_notifier_synchronize(void);
-- 
2.55.0.1082.g2b9226bbc0-goog


