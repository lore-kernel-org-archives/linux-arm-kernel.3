Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15036CEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5WVE3Hl8yIdruGNt8XIVgNufhaprbpT9QA5T5hpVt8=; b=uC7k8ZWeWOIpYOY6znCVB7Pe6+
	rYhP1QEwrmxI+TGmXhcJeapJEPGjkYCWHB5/ChRCtxoZgpFu9GU+IiQQZ+3SiOVJSyO1NF+YUb033
	D3AICeXzeVYbJqeY0qdMT2vyXq8kCIM9/kaOoRi+2nZRxMOHcCj57GkvSB75i7O/qIGJxBkDtBI3Y
	7HfXaINFbpo49uEVtraYVlqDXoAC/XK7Qkx+3j3rScCbtZ+Fb6rpnWcSdVbA4Ibe51Vcp7aP3UrLf
	Kdg03SMxMRBp53z0ZZS7EHdINFFCSsbS7l9SsuVUK/vdnMFfYJ2Crd+ZmuIoGQNoM8F6DRNDEoVLE
	CjCx5T0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4Hg-0000000Gdyy-01oY;
	Mon, 17 Nov 2025 18:49:04 +0000
Received: from mail-wm1-f73.google.com ([209.85.128.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HR-0000000Gddl-2ly7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:48:51 +0000
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477a11d9f89so1924705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405327; x=1764010127; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5WVE3Hl8yIdruGNt8XIVgNufhaprbpT9QA5T5hpVt8=;
        b=I8wH2x8aS4MAUjpc1P6/8QfVbroonChAU6cyVyKuJRitw9D6a7SKRFTi3uErVB2B7z
         ZPoMlEmD0rw+B5l6aknm6mTPTUpVyk4VAoTH3zSFElTd1IZEOem/6whZJ8PQGTAq8Gaq
         +A04nC8j79DGfM3XzIJSTOmfedeZms8mnDu6U6ckSPVlmKJ2lokh2gdEh67kQn1otHeg
         esPDlnmtp9qjU5WuLSDkkfSqj1h3PiQ8QamBEQJvnaJPwNQcmdtZ6d3AZK60Xv0FSBCs
         1sIQQfVitkOQmtGvmqWkgac7FklFgUYrjGBBiSiHhgTnPDgRj+iJ/6vCsoJp2hzNKUXw
         jpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405327; x=1764010127;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M5WVE3Hl8yIdruGNt8XIVgNufhaprbpT9QA5T5hpVt8=;
        b=lUkvgkCTxQttN6/10yzZoh+vmoaB+ZGVpt/TWUxnXsz/6nMBB5PYdrF+QU3/MLvMMU
         nPQdL2gCDlpcwcXzBajLF/7nMDrT13DWpWYXZDu2cuA4ECo8BHBUlQmR/vpvYpba026o
         ZSQvr7pUWZaT7Mtx/HckTh18ovLOYFbSjoA4c5UMYQVBMuGdQVkK74tV2cTCG8v9jVCk
         EotsavlYJKXFRWrIOy0Uvl7yxJTHd5S4h1cjaCuuqH0MBFgtUguzO7XHfkqONQMdBXrg
         kllRhR94t4QgRNj0DFWuYVXaqPJQhm/h51iGZ30jgYy8Agg0V6TKjo6zhtEqS+VE4SgZ
         RDbA==
X-Gm-Message-State: AOJu0Yxb1a1DuxVZ4JvOiWhuUhJO48D9huaDe+FPFu+Yu5NJyI2r0i9T
	yf9NcKc+yZtOw8DkUCAzeEKVud3Z/FaMB3APw9Ig19p6NRPYVcGpZalxqGg+fA3bHyF5/UaRSmp
	PVlzYU6Zw41pMuZCAohajSIAUYQn/Nz+Lw40WM49laAFaf2r9xNPZkSw6xIE0FpPXozMKuwqZDn
	/1UZymHKYTciXEYBzJVkXrTfRNHpEXSSXOZ2ktiVHMVJNRxbM6UdWB11pq+DS0mShNwQ==
X-Google-Smtp-Source: AGHT+IHvvN75ZRrmEK6mbR78xTnUzHtBzNs3L5jIM2mnz88x+TZ3qPg9z7gWLJIqDbGhhpJDNO5GQC2qpVQ4ZQ==
X-Received: from wmgg23.prod.google.com ([2002:a05:600d:17:b0:477:7aa2:99cb])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4452:b0:477:8b2e:aa8f with SMTP id 5b1f17b1804b1-4778fe6a42fmr114864735e9.15.1763405326933;
 Mon, 17 Nov 2025 10:48:46 -0800 (PST)
Date: Mon, 17 Nov 2025 18:48:08 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-22-smostafa@google.com>
Subject: [PATCH v5 21/27] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_104849_733938_FB84DC87 
X-CRM114-Status: GOOD (  21.51  )
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
- ARM_SMMU_CMDQ_CONS: Writes move the sw copy of the cons, but the host can=
=E2=80=99t
  skip commands once submitted. Reads return the emulated value and the err=
or
  bits in the actual cons.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 119 +++++++++++++++++-
 1 file changed, 115 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iom=
mu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index a970b43e6a7e..746ffc4b0a70 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -60,6 +60,16 @@ static void smmu_reclaim_pages(u64 phys, size_t size)
 	WARN_ON(__pkvm_hyp_donate_host(phys >> PAGE_SHIFT, size >> PAGE_SHIFT));
 }
=20
+static void smmu_copy_from_host(struct hyp_arm_smmu_v3_device *smmu,
+				void *dst_hyp_va, void *src_hyp_va,
+				size_t size)
+{
+	/* Clean and inval DC as the kernel uses NC mapping. */
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		kvm_flush_dcache_to_poc(src_hyp_va, size);
+	memcpy(dst_hyp_va, src_hyp_va, size);
+}
+
 /*
  * CMDQ, STE host copies are accessed by the hypervisor, we share them to
  * - Prevent the host from passing protected VM memory.
@@ -89,7 +99,6 @@ static int smmu_unshare_pages(phys_addr_t addr, size_t si=
ze)
 	return 0;
 }
=20
-__maybe_unused
 static bool smmu_cmdq_has_space(struct arm_smmu_queue *cmdq, u32 n)
 {
 	struct arm_smmu_ll_queue *llq =3D &cmdq->llq;
@@ -327,6 +336,88 @@ static int smmu_init(void)
 	return ret;
 }
=20
+static bool smmu_filter_command(struct hyp_arm_smmu_v3_device *smmu, u64 *=
command)
+{
+	u64 type =3D FIELD_GET(CMDQ_0_OP, command[0]);
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
+		WARN_ON((FIELD_GET(CMDQ_CFGI_1_RANGE, command[1]) !=3D 31));
+		break;
+	}
+	case CMDQ_OP_TLBI_NH_ASID:
+	case CMDQ_OP_TLBI_NH_VA:
+	case 0x13: /* CMD_TLBI_NH_VAA: Not used by Linux */
+	{
+		/* Only allow VMID =3D 0*/
+		if (FIELD_GET(CMDQ_TLBI_0_VMID, command[0]) =3D=3D 0)
+			break;
+		break;
+	}
+	case 0x10: /* CMD_TLBI_NH_ALL: Not used by Linux */
+	case CMDQ_OP_TLBI_EL2_ALL:
+	case CMDQ_OP_TLBI_EL2_VA:
+	case CMDQ_OP_TLBI_EL2_ASID:
+	case CMDQ_OP_TLBI_S12_VMALL:
+	case 0x23: /* CMD_TLBI_EL2_VAA: Not used by Linux */
+		return WARN_ON(true);
+	case CMDQ_OP_CMD_SYNC:
+		if (FIELD_GET(CMDQ_SYNC_0_CS, command[0]) =3D=3D CMDQ_SYNC_0_CS_IRQ) {
+			/* Allow it, but let the host timeout, as this should never happen. */
+			command[0] &=3D ~CMDQ_SYNC_0_CS;
+			command[0] |=3D FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
+			command[1] &=3D ~CMDQ_SYNC_1_MSIADDR_MASK;
+		}
+		break;
+	}
+
+	return false;
+}
+
+static void smmu_emulate_cmdq_insert(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u64 *host_cmdq =3D hyp_phys_to_virt(smmu->cmdq_host.q_base & Q_BASE_ADDR_=
MASK);
+	int idx;
+	u64 cmd[CMDQ_ENT_DWORDS];
+	bool skip;
+	u32 space;
+	bool use_wfe =3D smmu->features & ARM_SMMU_FEAT_SEV;
+
+	if (!is_cmdq_enabled(smmu))
+		return;
+
+	space =3D (1 << (smmu->cmdq_host.llq.max_n_shift)) - queue_space(&smmu->c=
mdq_host.llq);
+	/* Wait for the command queue to have some space. */
+	WARN_ON(smmu_wait(use_wfe, smmu_cmdq_has_space(&smmu->cmdq, space)));
+
+	while (space--) {
+		idx =3D Q_IDX(&smmu->cmdq_host.llq, smmu->cmdq_host.llq.cons);
+		queue_inc_cons(&smmu->cmdq_host.llq);
+
+		smmu_copy_from_host(smmu, cmd, &host_cmdq[idx * CMDQ_ENT_DWORDS],
+				    CMDQ_ENT_DWORDS << 3);
+		skip =3D smmu_filter_command(smmu, cmd);
+		if (skip)
+			continue;
+		smmu_add_cmd_raw(smmu, cmd);
+	}
+
+	writel_relaxed(smmu->cmdq.llq.prod, smmu->cmdq.prod_reg);
+
+	WARN_ON(smmu_wait(use_wfe, smmu_cmdq_empty(&smmu->cmdq)));
+}
+
 static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
 {
 	smmu->cmdq_host.llq.max_n_shift =3D smmu->cmdq_host.q_base & Q_BASE_LOG2S=
IZE;
@@ -360,17 +451,37 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_d=
evice *smmu,
 		mask =3D read_only & ~(IDR0_S2P | IDR0_VMID16 | IDR0_MSI | IDR0_HYP);
 		WARN_ON(len !=3D sizeof(u32));
 		break;
-	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_CMDQ_BASE:
 		if (is_write) {
 			/* Not allowed by the architecture */
 			WARN_ON(is_cmdq_enabled(smmu));
 			smmu->cmdq_host.q_base =3D val;
+		} else {
+			regs->regs[rd] =3D smmu->cmdq_host.q_base;
 		}
-		mask =3D read_write;
-		break;
+		goto out_ret;
 	case ARM_SMMU_CMDQ_PROD:
+		if (is_write) {
+			smmu->cmdq_host.llq.prod =3D val;
+			smmu_emulate_cmdq_insert(smmu);
+		} else {
+			regs->regs[rd] =3D smmu->cmdq_host.llq.prod;
+		}
+		goto out_ret;
 	case ARM_SMMU_CMDQ_CONS:
+		if (is_write) {
+			/* Not allowed by the architecture */
+			WARN_ON(is_cmdq_enabled(smmu));
+			smmu->cmdq_host.llq.cons =3D val;
+		} else {
+			/* Propagate errors back to the host.*/
+			u32 cons =3D readl_relaxed(smmu->base + ARM_SMMU_CMDQ_CONS);
+			u32 err =3D CMDQ_CONS_ERR & cons;
+
+			regs->regs[rd] =3D smmu->cmdq_host.llq.cons | err;
+		}
+		goto out_ret;
+	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_STRTAB_BASE:
 	case ARM_SMMU_STRTAB_BASE_CFG:
 	case ARM_SMMU_GBPA:
--=20
2.52.0.rc1.455.g30608eb744-goog


