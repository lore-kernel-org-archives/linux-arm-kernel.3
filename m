Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FB1CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qs8S7LI/sbSmCau3G8bqaka/RHnKzp9VmZFW3fnA4G8=; b=qfMY12X0uMYW0cJQaGaJp83/h6
	Rzi4ToebhOnzelGg0IZLsAap86UZJ0Tl1GO0WpDy5djWDcndxJ8mavXgsbu3vHb0nxeOglx+eyZX/
	h1379AkdBIA9OjLw7WZF/naPQe05I51+G6BmLmWanNsYg2MJCpjQYeeJ7dAkiki6F1VEhGD5LsUqh
	NnmDddZHdSWR0yEs+zcUiupQTH7HjLSaINVE5SIxlf6SVwzK8lRV9WqVR+sLlwJGdC2GbF13TN/AW
	k1b7Sk5eXaFceLS8DX2k9Eo9dT65LmaI3c0GlOeAj2US+lj+qJJQt3tCuY/8t89kjfN1RxVYhmaWF
	pv2Z6b1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4II-0000000GeiF-1bhk;
	Mon, 17 Nov 2025 18:49:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HW-0000000Gdl5-4BxG
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 18:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qs8S7LI/sbSmCau3G8bqaka/RHnKzp9VmZFW3fnA4G8=; b=ZcUHPDPU/l9NR+o/6R3zZP6nw8
	tC1tWtKDUrrhwGuAJmInRIimHOFEEkeXheVHnK3PHGLvICSnEyjvbXyigsj0lG498nQdUyAVUkycH
	P4ek7SJ3kTdupl/fDAAZUIY0ydk1C3HK8tAPmXmyTL3S2WvzBuUb/OraTv8aP2e1LLJAQZeXdotv5
	Qjs6SThQD0bFstPPVtyduTIKxODCE+GqLMV5movejvUp7TY0l0UXdaYLJf3c0SyslQHRtwVHiav4D
	d5xflX+jtBVZx+GPL9ywptHPVobBeUCgRLeYcj8sEdjQD+UmsovvP0HEtLuC8rvk5R7BWGQEw9qEo
	RBCYgUWQ==;
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3Po-00000007wet-42or
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:53:28 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-42b2ffbba05so2450781f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405329; x=1764010129; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qs8S7LI/sbSmCau3G8bqaka/RHnKzp9VmZFW3fnA4G8=;
        b=iHD1LScn3feG7BeO90Np8TNNuWCAqgs8cKrRK03/uu2yXsXCZMAAWOM9qHVCceL+Cc
         UA8xdD6UuVaQBW+pfMCiG60ElR1bD2WaraXUJf6QfJY0PWu4kIg4c9QNJtOIl7SbM17s
         A7Wnf+3Qgr+xogII+b59UCkhjrZOmwRO3Fn8T8dwGklx5F/fjwDubVJZQaV3HCw4Em7o
         EFDUIZpVAYkGSX4QYJRrTJ5Wy5wtjxaRYKSupztzZawDmis9BZoR5y4Le1O4pQygYsx/
         9g3JDRBJzxxcpLMSIPUFHLQ6lNsbk+dWUGNVHPvvdCZqoIomGRIwJLSiCN7atiAS1Gh1
         tLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405329; x=1764010129;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qs8S7LI/sbSmCau3G8bqaka/RHnKzp9VmZFW3fnA4G8=;
        b=IaoEisCFhwbpqWdF4htsklQSVKWKDzxfCJaihD2aA0vCy9yZlLbQq+4kO4t03vY7Ai
         OoZL0hNY+09MybpzkTUTDj10DrdMufsqK4PCSSEIeNo58WCSOhsa5oYc0+N803Eo0zgr
         57u/ECkA7bxLa8Os8x1SASWiBygrFYHHQHxyqsLU7pjjDEbvvYK321E7xosRh+puGQPs
         6lqL1zgBro6migi+g2tIXkhJXiC+bTwirzUbk1svIBFHFjdNBSnG27N9uK8otzX3M+YA
         fCsyUwCySLgCF2EfixQjZlSB7b9ZlPjtAIvr8BKsqXz4Sm8hcdkTvP2DvQhD2PFgRCJa
         zzJg==
X-Gm-Message-State: AOJu0YxOJm9GWEmraaPy67VV6+1P1LZhGqL2IbJ1/8Gc4EqyxlUlsuOJ
	QZrdI5L2M15KyGl/eJaZnrqBDSgogemqP1DKH2BIqyE+DcpY2Upzb0uEAFBJ/SmlE/m9pqj3E68
	uc2O6Arf69rAB5gM4+t9RWeXU4rxjaFk6Ym2DQ1rw6Mvk2h124an7dFulpV3RG67obhtqYJ6Yv8
	namBQ5RYb8oxLF0yrVjyDdd/eCSq8JiDcm6e9C383z5m/tiwPqxFp3x1MQ2/39806HhQ==
X-Google-Smtp-Source: AGHT+IEaVN1RJqQh1usVWtaU2+GmutZ2HuXAEHxOLo10Rm858igk+GLC7xcyxVVFvzJzEDXSgQJrFWO0SiMrKA==
X-Received: from wrbfq12.prod.google.com ([2002:a05:6000:2a0c:b0:42b:5250:ee1b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:3106:b0:42b:3b4c:f411 with SMTP id ffacd0b85a97d-42b5938a9e3mr13616468f8f.36.1763405328637;
 Mon, 17 Nov 2025 10:48:48 -0800 (PST)
Date: Mon, 17 Nov 2025 18:48:10 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-24-smostafa@google.com>
Subject: [PATCH v5 23/27] iommu/arm-smmu-v3-kvm: Shadow STEs
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_175325_147212_D1ECA47E 
X-CRM114-Status: GOOD (  19.46  )
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

This patch adds STE emulation, this is done when the host sends the
CFGI_STE command.

In this patch we copy the STE as is to the shadow owned by the hypervisor,
in the next patch, stage-2 page table will be attached.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 92 +++++++++++++++++--
 1 file changed, 86 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 9e515a130711..fbe1e13fc15d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -22,6 +22,9 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 #define strtab_split(smmu)	(FIELD_GET(STRTAB_BASE_CFG_SPLIT, (smmu)->host_ste_cfg))
 #define strtab_l1_size(smmu)	((1 << (strtab_log2size(smmu) - strtab_split(smmu))) * \
 				 (sizeof(struct arm_smmu_strtab_l1)))
+#define strtab_hyp_base(smmu)	((smmu)->features & ARM_SMMU_FEAT_2_LVL_STRTAB ? \
+				 (u64 *)(smmu)->strtab_cfg.l2.l1tab :\
+				 (u64 *)(smmu)->strtab_cfg.linear.table)
 
 #define for_each_smmu(smmu) \
 	for ((smmu) = kvm_hyp_arm_smmu_v3_smmus; \
@@ -283,6 +286,80 @@ static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+/* Get an STE for a stream table base. */
+static struct arm_smmu_ste *smmu_get_ste_ptr(struct hyp_arm_smmu_v3_device *smmu,
+					     u32 sid, u64 *strtab)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	struct arm_smmu_ste *table = (struct arm_smmu_ste *)strtab;
+
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+		struct arm_smmu_strtab_l1 *l1tab = (struct arm_smmu_strtab_l1 *)strtab;
+		u32 l1_idx = arm_smmu_strtab_l1_idx(sid);
+		struct arm_smmu_strtab_l2 *l2ptr;
+
+		if (WARN_ON(l1_idx >= cfg->l2.num_l1_ents) ||
+			!(l1tab[l1_idx].l2ptr & STRTAB_L1_DESC_SPAN))
+			return NULL;
+
+		l2ptr = hyp_phys_to_virt(l1tab[l1_idx].l2ptr & STRTAB_L1_DESC_L2PTR_MASK);
+		/* Two-level walk */
+		return &l2ptr->stes[arm_smmu_strtab_l2_idx(sid)];
+	}
+	if (WARN_ON(sid >= cfg->linear.num_ents))
+		return NULL;
+	return &table[sid];
+}
+
+static int smmu_shadow_l2_strtab(struct hyp_arm_smmu_v3_device *smmu, u32 sid)
+{
+	u32 idx = arm_smmu_strtab_l1_idx(sid);
+	u64 *host_ste_base = hyp_phys_to_virt(strtab_host_base(smmu));
+	struct arm_smmu_strtab_l1 *l1_desc = &smmu->strtab_cfg.l2.l1tab[idx];
+	u64 l1_desc_host;
+	struct arm_smmu_strtab_l2 *l2table;
+
+	l2table = kvm_iommu_donate_pages(get_order(sizeof(*l2table)));
+	if (!l2table)
+		return -ENOMEM;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		kvm_flush_dcache_to_poc(&host_ste_base[idx], sizeof(*l1_desc));
+	l1_desc_host = host_ste_base[idx];
+
+	arm_smmu_write_strtab_l1_desc(l1_desc, hyp_virt_to_phys(l2table));
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		kvm_flush_dcache_to_poc(l1_desc, sizeof(*l1_desc));
+
+	smmu_share_pages(l1_desc_host & STRTAB_L1_DESC_L2PTR_MASK, sizeof(*l2table));
+	return 0;
+}
+
+static void smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool leaf)
+{
+	u64 *host_ste_base = hyp_phys_to_virt(strtab_host_base(smmu));
+	u64 *hyp_ste_base = strtab_hyp_base(smmu);
+	struct arm_smmu_ste *host_ste_ptr = smmu_get_ste_ptr(smmu, sid, host_ste_base);
+	struct arm_smmu_ste *hyp_ste_ptr = smmu_get_ste_ptr(smmu, sid, hyp_ste_base);
+
+	/*
+	 * Linux only uses leaf = 1, when leaf is 0, we need to verify that this
+	 * is a 2 level table and reshadow of l2.
+	 * Also Linux never clears l1 ptr, that needs to free the old shadow.
+	 */
+	if (WARN_ON(!leaf || !host_ste_ptr))
+		return;
+
+	/* If host is valid and hyp is not, means a new L1 installed. */
+	if (!hyp_ste_ptr) {
+		WARN_ON(smmu_shadow_l2_strtab(smmu, sid));
+		hyp_ste_ptr = smmu_get_ste_ptr(smmu, sid, hyp_ste_base);
+	}
+
+	smmu_copy_from_host(smmu, hyp_ste_ptr->data, host_ste_ptr->data,
+			    STRTAB_STE_DWORDS << 3);
+}
+
 static int smmu_init_strtab(struct hyp_arm_smmu_v3_device *smmu)
 {
 	int ret;
@@ -402,8 +479,13 @@ static bool smmu_filter_command(struct hyp_arm_smmu_v3_device *smmu, u64 *comman
 
 	switch (type) {
 	case CMDQ_OP_CFGI_STE:
-		/* TBD: SHADOW_STE*/
+	{
+		u32 sid = FIELD_GET(CMDQ_CFGI_0_SID, command[0]);
+		u32 leaf = FIELD_GET(CMDQ_CFGI_1_LEAF, command[1]);
+
+		smmu_reshadow_ste(smmu, sid, leaf);
 		break;
+	}
 	case CMDQ_OP_CFGI_ALL:
 	{
 		/*
@@ -576,23 +658,21 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 			regs->regs[rd] = smmu->cmdq_host.llq.cons | err;
 		}
 		goto out_ret;
-	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_STRTAB_BASE:
 		if (is_write) {
 			/* Must only be written when SMMU_CR0.SMMUEN == 0.*/
 			WARN_ON(is_smmu_enabled(smmu));
 			smmu->host_ste_base = val;
 		}
-		mask = read_write;
-		break;
+		goto out_ret;
 	case ARM_SMMU_STRTAB_BASE_CFG:
 		if (is_write) {
 			/* Must only be written when SMMU_CR0.SMMUEN == 0.*/
 			WARN_ON(is_smmu_enabled(smmu));
 			smmu->host_ste_cfg = val;
 		}
-		mask = read_write;
-		break;
+		goto out_ret;
+	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_GBPA:
 		mask = read_write;
 		break;
-- 
2.52.0.rc1.455.g30608eb744-goog


