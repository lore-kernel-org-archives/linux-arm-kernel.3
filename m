Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E267BCD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dQBaHVEA8R39nVXfDncsPbJ/+uAVI3QDhXt4O/6+ME=; b=E34eFv4V5W3a5TJAYp/exv4y5L
	MsqMgLOYZ/lKvnRC/CrTR7smG6Jch9gvW/qILaB6it7q97xREzRLx00+7DdrR8OFgVxxICg1x7TnV
	duZUd5zEdnE9k+LC+IXI8D0aU352OQaLLOxV4uBZ7+9t76gMUCtO0qxIL8SNWkoEsa55pCgWmBoGC
	YqMqVL0SAScQeCuPW3uIgx75GIfo/m21yOD/0m/yfIe5CTy4W7GyaKro1hVJ3/mHWwR9/WTEo5rkV
	sk0dFbEa5h1pfqr2scdzC7FqBUtODdMfsPmm73HX26csBUubZSBN1B10eaUhicY+A78Mb8q8l9ZkC
	b21ns5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlv4-00000006dBh-1o62;
	Fri, 01 May 2026 11:20:30 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlv0-00000006d2N-1PQC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:20:28 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-44a56cf1466so476428f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634424; x=1778239224; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dQBaHVEA8R39nVXfDncsPbJ/+uAVI3QDhXt4O/6+ME=;
        b=DHUQyqql3Qhz2vCo7vHm0p+Jv0ynjT5JruxbCqmiSvK8D61hCYoxwScTWfwyv69uwS
         Zsh6ETFl8I+AZGcQrvlp2wFX99f5ZbXDpKaEAVcalLTn/2oFNDWV1ino+4ckeQ8H5kuE
         D03iW/7ptsGKiHQdgGjuOXMJQWkxvXQgYJqxMe4P29NxZZ3SfE6MXwBCU9WxZuY3Pn1j
         8N0zhApL8yvR8FcKbXYPy2WgZyKZNBW1Eo6waouscPnKYJAui/u2vi3wPVIC6BFa1CWV
         /oxI8QPTqG+IAtqzAbC5/EIvL5oqCYyrz4VULnbAyHPCfoCvKPRRMZd+nlMK6id452s3
         QJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634424; x=1778239224;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9dQBaHVEA8R39nVXfDncsPbJ/+uAVI3QDhXt4O/6+ME=;
        b=UvjJ1kgJF8RhTierdyOh9+9tRvETksujKzMolfmXl7yrVg+OD+i1X4kA7G52a8nTuV
         sRGFTd6498sePJc3sVYoJfkKQpE9HZuw0i41zBOKFgNS1MLQtPBv5o7SH7QvtB2qAsJ6
         p8MNPOubIAWzs/f3X1G+PQXqabh8mNFd7H86JqNiqDql96w+ZDSu/Ke3EMv5kI7xDVw3
         y3+yIvCxyDnMARldilZe4NyUOEan6SjvKjn2YJFrnsJWtv0SSNtSdQ/ok15XVwcsr+St
         gKk9SPdOOIH5dAQC9w0EUG7qxbLSm/X7BJVbJY2bfDQnDs+8O1dZEIZeD9IrUNbD4Dn8
         s8HQ==
X-Gm-Message-State: AOJu0YxmFB4hNJ0HV0UlQzB8G9vKgMIScOMBI9impSdTivziuQvEwujN
	XNpoYQGDd/ljhmYfaIR9FqpbZU4Q7ONpBngl4gEwMXVYiYjYkLN+CHGohJUE1RMKyljd81m71/Q
	5JKX5ks/xS3+FdGjW31nmBDWQFBcKt3gtUAiygkszUqZTDwr4TBL9sXkxLFF8PZuv+Bw83GQcr9
	DQTvzmqxhJOPfArxOVkm0KIlyi5+DgNNdt2ST2CzZK8G7/5c+HonlenvH1cdAEUuPEPQ==
X-Received: from wroj14.prod.google.com ([2002:adf:f00e:0:b0:440:62c9:5fd4])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:fc50:0:b0:449:e8c0:fd58 with SMTP id ffacd0b85a97d-449e8c0fe50mr5501396f8f.27.1777634423506;
 Fri, 01 May 2026 04:20:23 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:19 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-18-smostafa@google.com>
Subject: [PATCH v6 17/25] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	mark.rutland@arm.com, qperret@google.com, tabba@google.com, 
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042026_464163_91826498 
X-CRM114-Status: GOOD (  22.16  )
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

Don=E2=80=99t allow access to the command queue from the host:
- ARM_SMMU_CMDQ_BASE: Only allowed to be written when CMDQ is disabled, we
  use it to keep track of the host command queue base.
  Reads return the saved value.
- ARM_SMMU_CMDQ_PROD: Writes trigger command queue emulation which sanitise
  and filters the whole range. Reads returns the host copy.
- ARM_SMMU_CMDQ_CONS: Writes move the sw copy of the cons, but the host
  can=E2=80=99t skip commands once submitted. Reads return the emulated val=
ue and
  the error bits in the actual cons.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 128 +++++++++++++++++-
 1 file changed, 124 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iom=
mu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index aac455599728..1633a3cf8a3b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -100,7 +100,6 @@ static int smmu_unshare_pages(phys_addr_t addr, size_t =
size)
 	return 0;
 }
=20
-__maybe_unused
 static bool smmu_cmdq_has_space(struct arm_smmu_queue *cmdq, u32 n)
 {
 	struct arm_smmu_ll_queue *llq =3D &cmdq->llq;
@@ -351,6 +350,92 @@ static int smmu_init(void)
 	return ret;
 }
=20
+static bool smmu_filter_command(struct hyp_arm_smmu_v3_device *smmu, u64 *=
command)
+{
+	u64 command0 =3D le64_to_cpu(command[0]);
+	u64 command1 =3D le64_to_cpu(command[1]);
+	u64 type =3D FIELD_GET(CMDQ_0_OP, command0);
+
+	switch (type) {
+	case CMDQ_OP_CFGI_STE:
+		/* TBD: SHADOW_STE*/
+		break;
+	case CMDQ_OP_CFGI_ALL:
+	{
+		/*
+		 * Linux doesn't use range STE invalidation, and only use this
+		 * for CFGI_ALL, which is done on reset and not on an new STE
+		 * being used.
+		 * Although, this is not architectural we rely on the current Linux
+		 * implementation.
+		 */
+		if ((FIELD_GET(CMDQ_CFGI_1_RANGE, command1) !=3D 31))
+			return true;
+		break;
+	}
+	case CMDQ_OP_TLBI_NH_ASID:
+	case CMDQ_OP_TLBI_NH_VA:
+	case 0x13: /* CMD_TLBI_NH_VAA: Not used by Linux */
+	{
+		/* Only allow VMID =3D 0 */
+		if (FIELD_GET(CMDQ_TLBI_0_VMID, command0) !=3D 0)
+			return true;
+		break;
+	}
+	case 0x10: /* CMD_TLBI_NH_ALL: Not used by Linux */
+	case CMDQ_OP_TLBI_EL2_ALL:
+	case CMDQ_OP_TLBI_EL2_VA:
+	case CMDQ_OP_TLBI_EL2_ASID:
+	case CMDQ_OP_TLBI_S12_VMALL:
+	case CMDQ_OP_TLBI_S2_IPA:
+	case 0x23: /* CMD_TLBI_EL2_VAA: Not used by Linux */
+		return true;
+	case CMDQ_OP_CMD_SYNC:
+		if (FIELD_GET(CMDQ_SYNC_0_CS, command0) =3D=3D CMDQ_SYNC_0_CS_IRQ) {
+			/* Allow it, but let the host timeout, as this should never happen. */
+			command0 &=3D ~CMDQ_SYNC_0_CS;
+			command0 |=3D FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
+			command1 &=3D ~CMDQ_SYNC_1_MSIADDR_MASK;
+		}
+		break;
+	}
+
+	return false;
+}
+
+static int smmu_emulate_cmdq_insert(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u64 *host_cmdq =3D hyp_phys_to_virt(smmu->cmdq_host.q_base & Q_BASE_ADDR_=
MASK);
+	bool use_wfe =3D smmu->features & ARM_SMMU_FEAT_SEV, skip;
+	u64 cmd[CMDQ_ENT_DWORDS];
+	int idx, ret;
+	u32 space;
+
+	if (!is_cmdq_enabled(smmu))
+		return 0;
+
+	space =3D (1 << (smmu->cmdq_host.llq.max_n_shift)) - queue_space(&smmu->c=
mdq_host.llq);
+	/* Wait for the command queue to have some space. */
+	ret =3D smmu_wait(use_wfe, smmu_cmdq_has_space(&smmu->cmdq, space));
+	if (ret)
+		return ret;
+
+	while (space--) {
+		idx =3D Q_IDX(&smmu->cmdq_host.llq, smmu->cmdq_host.llq.cons);
+		queue_inc_cons(&smmu->cmdq_host.llq);
+
+		memcpy(cmd, &host_cmdq[idx * CMDQ_ENT_DWORDS], CMDQ_ENT_DWORDS << 3);
+		skip =3D smmu_filter_command(smmu, cmd);
+		if (WARN_ON(skip))
+			continue;
+		smmu_add_cmd_raw(smmu, cmd);
+	}
+
+	writel(smmu->cmdq.llq.prod, smmu->cmdq.prod_reg);
+
+	return smmu_wait(use_wfe, smmu_cmdq_empty(&smmu->cmdq));
+}
+
 static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
 {
 	u32 shift =3D smmu->cmdq_host.q_base & Q_BASE_LOG2SIZE;
@@ -388,18 +473,51 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_d=
evice *smmu,
 		/* Clear stage-2 support, hide MSI to avoid write back to cmdq */
 		mask =3D read_only & ~(IDR0_S2P | IDR0_VMID16 | IDR0_MSI | IDR0_HYP);
 		break;
-	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_CMDQ_BASE:
+		/*
+		 * Although allowed to use smaller size, we rely on the SMMUv3 driver
+		 * using 64-bit store instruction for simplicity.
+		 */
+		if (len !=3D sizeof(u64))
+			break;
 		if (is_write) {
 			/* Not allowed by the architecture */
 			if (WARN_ON(is_cmdq_enabled(smmu)))
 				break;
 			smmu->cmdq_host.q_base =3D val;
+			goto out_ret;
+		} else {
+			val =3D smmu->cmdq_host.q_base;
+			goto out_update_regs;
 		}
-		mask =3D read_write;
-		break;
 	case ARM_SMMU_CMDQ_PROD:
+		if (len !=3D sizeof(u32))
+			break;
+		if (is_write) {
+			smmu->cmdq_host.llq.prod =3D val;
+			WARN_ON(smmu_emulate_cmdq_insert(smmu));
+			goto out_ret;
+		} else {
+			val =3D smmu->cmdq_host.llq.prod;
+			goto out_update_regs;
+		}
 	case ARM_SMMU_CMDQ_CONS:
+		if (len !=3D sizeof(u32))
+			break;
+		if (is_write) {
+			if (WARN_ON(is_cmdq_enabled(smmu)))
+				break;
+
+			smmu->cmdq_host.llq.cons =3D val;
+			goto out_ret;
+		} else {
+			/* Propagate errors back to the host.*/
+			u32 cons =3D readl_relaxed(smmu->base + ARM_SMMU_CMDQ_CONS);
+
+			val =3D smmu->cmdq_host.llq.cons | (CMDQ_CONS_ERR & cons);
+			goto out_update_regs;
+		}
+	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_STRTAB_BASE:
 	case ARM_SMMU_STRTAB_BASE_CFG:
 	case ARM_SMMU_GBPA:
@@ -495,6 +613,8 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_dev=
ice *smmu,
 		val =3D readq_relaxed(smmu->base + off) & mask;
 	else
 		val =3D readl_relaxed(smmu->base + off) & mask;
+
+out_update_regs:
 	/*
 	 * Device might be read senstive, so do it but ignore writing
 	 * back for xzr.
--=20
2.54.0.545.g6539524ca2-goog


