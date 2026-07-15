Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F3DC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAFQ5BsXp17z8wDAJzX50F8XvcTlSxFTjmAveWqMmq0=; b=a3QYKcQI4nD6SUveBKyKawaoeR
	uWL4tJ1gsNJvaafgTtyaplUhLJEYUJRw2tAFAQ8OzWAGrSLpmwj9NgorzcxtN58Q3yCAlczl7u5Pt
	l7ZcoWoEKwYYzc3wDimwOx6gZvTTdwPZrQOHHPac9IvlD/ngGa9ArnYv5cX2QTaH5ElbpsPucHpa2
	JIXC2i0D0C+fnOPXD3xscpd5FxJcBXFLbDL09ii4a0nxuuepMD/xKvyWi5DA0xnPKirK4kbJdM1i6
	uo3emlYiKz7hq1Xct4OHfet9IHccrNUb9tB6g/vsE1MajCHfNRXLsemoS2mHvVnKs/6aS01ezHKY0
	vET8G0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyHX-0000000Efps-2G1R;
	Wed, 15 Jul 2026 12:00:07 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyH2-0000000EfFq-2bOW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:59:38 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-472bdd6f529so3313643f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784116774; x=1784721574; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XAFQ5BsXp17z8wDAJzX50F8XvcTlSxFTjmAveWqMmq0=;
        b=JIOQiMByEmUX9UlIGmFoIChAlLCaQ/yPXj880uN0TrfDUoDhZ9QM+JGjE8cJ+cmJSz
         A8GDw5cXBnEjWviAHsWKFxNg6N66fvShJmI2GqnyhfxUBXJ2lZM0xwh1NXh1E3sOjDwi
         rYDLXHKgRn4iUCcP06wmzuXBNkSr+/ljrbu1Z77tlEUAYZD6HC6jjZQvGcKFgMLou9+a
         3QPNEjPlXrKTEr4dpKDyvuTNOTAmxILleIXoy6JuXQmfa34YF3ipHHweNk+ukQhA1c20
         VQ8dTmXrcjOp9h13WwPyUT7MCn1XBGRKhNv5qAiFOUjE5yQwPBt5D05qvvmVcJb7VTvx
         7RiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116774; x=1784721574;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XAFQ5BsXp17z8wDAJzX50F8XvcTlSxFTjmAveWqMmq0=;
        b=Vrap3btZkbzthCW9izYrhKiRGzUPb1zQ95pcmF8s1gRS+eOmWFZuxPIwFXbaKrxXUs
         3LQQh001tPjN9sHBC56F+Ce5AuGyaE7xXxxAaPgRZZEZ/SdKbNlKvQ5zQfdakpRd6pLt
         febU7O9kiyc/3RuaY4Ar3v0Lw2DyqkGFJKJJ/BFkVu4H9l8/zri2OYDX8Fbe6nl98J+C
         JuOZnxsOuzhB1JniditosRz+Rp5sBV7OdF82jBWDZCEkMgQHVPoUd7lQz99YUvZOtIyc
         fzYiqzy+64nvrTYDWvC92FCfNMDMFOJwB37v7pmTfNooInSpK8tjKona+H82ijVuCMeD
         laOA==
X-Gm-Message-State: AOJu0Yzhj/dPSnnwITQMfFH9zTQE1eWynd9g3rwahR96efe661lLLoFH
	K5LtxqniGIA7tqej14LEaySjL7U2mdYLVdREjDyNxyJwIZ/2N2tOnQrFjZ9vY9aYLamW46/7TPP
	qdywWsolDn9ceTusn4G0VjBJK+wB+sNNPkiFBl4dqXnutLgGshW0VGnREUpsNI5MikZKh0d4ACK
	jGp2JXttf7Jf+8Md8/J8P3qlw4erDtsZf7LAzT4upxrirGbYmcMDR5wlr3gdqDV+YXrQ==
X-Received: from wmga21.prod.google.com ([2002:a05:600c:2d55:b0:490:b58a:2c9b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3486:b0:493:b7a6:3dac with SMTP id 5b1f17b1804b1-4953b156ee2mr37104465e9.33.1784116773557;
 Wed, 15 Jul 2026 04:59:33 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:58:57 +0000
In-Reply-To: <20260715115906.2664882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260715115906.2664882-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715115906.2664882-17-smostafa@google.com>
Subject: [PATCH v7 16/24] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_045936_697910_D65465BB 
X-CRM114-Status: GOOD (  22.11  )
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
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 133 +++++++++++++++++-
 1 file changed, 129 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iom=
mu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 8e798fd8fdaa..f62c9e8f2c59 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -105,7 +105,6 @@ static int smmu_unshare_pages(phys_addr_t addr, size_t =
size)
 	return 0;
 }
=20
-__maybe_unused
 static bool smmu_cmdq_has_space(struct arm_smmu_queue *cmdq, u32 n)
 {
 	struct arm_smmu_ll_queue *llq =3D &cmdq->llq;
@@ -330,6 +329,99 @@ static int smmu_init(void)
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
+		if ((FIELD_GET(CMDQ_CFGI_1_RANGE, command[1]) !=3D 31))
+			return true;
+		break;
+	}
+	case CMDQ_OP_TLBI_NH_ASID:
+	case CMDQ_OP_TLBI_NH_VA:
+	case 0x13: /* CMD_TLBI_NH_VAA: Not used by Linux */
+	{
+		/* Only allow VMID =3D 0 */
+		if (FIELD_GET(CMDQ_TLBI_0_VMID, command[0]) !=3D 0)
+			return true;
+		break;
+	}
+	case CMDQ_OP_PREFETCH_CFG:
+	case CMDQ_OP_CFGI_CD:
+	case CMDQ_OP_CFGI_CD_ALL:
+	case CMDQ_OP_TLBI_NH_ALL:
+	case CMDQ_OP_TLBI_NSNH_ALL:
+		break;
+	case CMDQ_OP_CMD_SYNC:
+		if (FIELD_GET(CMDQ_SYNC_0_CS, command[0]) =3D=3D CMDQ_SYNC_0_CS_IRQ) {
+			/* Allow it, but let the host timeout, as this should never happen. */
+			command[0] &=3D ~CMDQ_SYNC_0_CS;
+			command[0] |=3D FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
+			command[1] &=3D ~CMDQ_SYNC_1_MSIADDR_MASK;
+		}
+		break;
+	default:
+		/* Deny unknown commands */
+		return true;
+	}
+
+	return false;
+}
+
+static int smmu_emulate_cmdq_insert(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u64 *host_cmdq =3D hyp_phys_to_virt(smmu->cmdq_host.base_dma);
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
+
+	/* Wait for the command queue to have some space. */
+	ret =3D smmu_wait(use_wfe, smmu_cmdq_has_space(&smmu->cmdq, space));
+	if (ret)
+		return ret;
+	hyp_spin_lock(&smmu->hw_lock);
+	while (space--) {
+		int i;
+
+		idx =3D Q_IDX(&smmu->cmdq_host.llq, smmu->cmdq_host.llq.cons);
+		queue_inc_cons(&smmu->cmdq_host.llq);
+
+		/* Copy the command to local buffer avoiding TOCTOU */
+		for (i =3D 0 ; i < CMDQ_ENT_DWORDS ; ++i)
+			cmd[i] =3D le64_to_cpu(READ_ONCE(host_cmdq[idx * CMDQ_ENT_DWORDS + i]))=
;
+
+		skip =3D smmu_filter_command(smmu, cmd);
+		if (WARN_ON(skip))
+			continue;
+		smmu_add_cmd_raw(smmu, cmd);
+	}
+
+	writel(smmu->cmdq.llq.prod, smmu->cmdq.prod_reg);
+
+	ret =3D smmu_wait(use_wfe, smmu_cmdq_empty(&smmu->cmdq));
+	hyp_spin_unlock(&smmu->hw_lock);
+	return ret;
+}
+
 static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
 {
 	u32 shift =3D smmu->cmdq_host.q_base & Q_BASE_LOG2SIZE;
@@ -371,18 +463,51 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_d=
evice *smmu,
 		 */
 		mask =3D read_only & ~(IDR0_S2P | IDR0_VMID16 | IDR0_MSI | IDR0_HYP | ID=
R0_ATS);
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
 			if (is_cmdq_enabled(smmu))
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
--=20
2.55.0.141.g00534a21ce-goog


