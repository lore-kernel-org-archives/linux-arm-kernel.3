Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA874CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2OiNO3KzQO8B0w4ffRojG8RRfuYkjFyK2nm+fAlxiU=; b=hFEMpPVk85LaDcx9Z0Xcn5oqKc
	WATEtiZkxuMpxM9/UqUbIYzY1f3ch0PzU9sbt9JN2TvVO8/gxf528bSiHcEX97Ay+Ac9Tarn8JW4/
	2RzahGdLfWMu965H24OT/GscmKYc0EYmRuOOzMxGlCyabEWYxq5EaBYJNdeFp1iFGQKV+TRNFFGIp
	ibSt3qvcrNDTc98sZOTWQH3aHuf3ZKyBm1uTiIBwsN+tij4aW34/j5MfgYQFkvArR5MkuYiZfgSu3
	SpeEBU1sOfeZ/f9uUXf9gcfWkGwAv1idWwPHjvXNAYd2neePNDBOKvKYxSr9FeBM87TMTYm4BH/hC
	fDnRys6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWgv-0000000Bwrw-2RQd;
	Wed, 20 Aug 2025 00:28:37 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUG7-0000000BfXD-2J7E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:48 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-afcb7af3e41so397773766b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640365; x=1756245165; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2OiNO3KzQO8B0w4ffRojG8RRfuYkjFyK2nm+fAlxiU=;
        b=F2SGp+0/CFX+gHHKPas4fDkeQr2zBXoYHUHKVULplgFDgzkS40Y/vrqICoLlQQn/8/
         fU6c9AjB4qhUidk4E3YgD3hYI+y0QJMeIbLR7FvSLoIEK5UbBNFACYf2IMIGnIbZhXqC
         8GAEMYnKoL0xbURHmxjG4GK1T5+Qo2PgMDVPMwPA5ZH3YkWr8larsvU6Kv/nUwxGa/rJ
         bxgcGWOLwR2scUZan+fOzmX3NVqYqC1heztGv4avEH1VcSY1KqOocXOcR+kDI0UlGOH1
         XfyEX3UqJtxjrlxohXl13o4HSw7MHKR9ewdd6dtpjbevFe0nh4fjrfAil8+lxMVhRKF5
         DzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640365; x=1756245165;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s2OiNO3KzQO8B0w4ffRojG8RRfuYkjFyK2nm+fAlxiU=;
        b=tf5o1bLo6Fwkg/w/r9yRkeYwvFy0Ml7+zMkPm7SOGM2kqx4NIk6/B7dpuFHJoubddD
         YOGus9Iwj2Vam3EzkG8Ook7OnXrIXGOQr7jSBtQncbztnMVbZM1GBU5KMT6/tImBOwUH
         IDx4Kc+0Pg61vbrPLX+jrA7IdM30ODPvUtzl+bZ8zRxJDXrRbewbydCaATU7BLM8SMnL
         Js/RVlaWz6CjJcPbe+ztJDujTK+SlAEkoO8a4oo9PkZ2g1NOc4gGC2PdiBXUulcMENHy
         P9mRaESHDS0L6RemjnOjy6xqxP+OnJm5rTI6KvCItUWQUNgqztcQUS42sYl9DJlV2Z0s
         Bs0w==
X-Forwarded-Encrypted: i=1; AJvYcCUrPDk3sZp0kYCKA8Ru789HKm4wLSXQqsuUC9HHD87rp56f4vro1bYGvD5dBRYb8WdqLpJRKZBGDrvleHFNZM5T@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/GzAjmoQY5NNzfRXqU9WR5nr30ufVldL19pAMwmynwsTKysPR
	UFB7jSthdCrJAZsFkmGk3ByS9O7P/cII0HvqxnUAdlkCPRlFH4xNmeQIEyTTphvbH9qYZ/CCp5x
	xPM/Ym5prRsZ7mQ==
X-Google-Smtp-Source: AGHT+IHd99Hbl/EO+Fv3HJ9l/C88pz7JGJRqrSKU6LiBDjnLkGYw7fqHFm99BcFANhnvyjy+geOwjTDrJ/MdzA==
X-Received: from ejcuy5.prod.google.com ([2002:a17:907:d105:b0:ae9:c7c1:c2a2])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7ba3:b0:ae0:d9f3:9131 with SMTP id a640c23a62f3a-afdf00bda1bmr33581766b.6.1755640365290;
 Tue, 19 Aug 2025 14:52:45 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:50 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-23-smostafa@google.com>
Subject: [PATCH v4 22/28] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_145247_591780_01EB9E9E 
X-CRM114-Status: GOOD (  21.53  )
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
- ARM_SMMU_CMDQ_PROD: Writes trigger command queue emulation which sanitise=
s
  and filters the whole range. Reads returns the host copy.
- ARM_SMMU_CMDQ_CONS: Writes move the sw copy of the cons, but the host can=
=E2=80=99t
  skip commands once submitted. Reads return the emulated value and the err=
or
  bits in the actual cons.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 108 +++++++++++++++++-
 1 file changed, 105 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iom=
mu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 554229e466f3..10c6461bbf12 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -325,6 +325,88 @@ static bool is_cmdq_enabled(struct hyp_arm_smmu_v3_dev=
ice *smmu)
 	return FIELD_GET(CR0_CMDQEN, smmu->cr0);
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
+		/* Malicous host */
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
+
+	if (!is_cmdq_enabled(smmu))
+		return;
+
+	while (!queue_empty(&smmu->cmdq_host.llq)) {
+		/* Wait for the command queue to have some space. */
+		WARN_ON(smmu_wait_event(smmu, !smmu_cmdq_full(&smmu->cmdq)));
+
+		idx =3D Q_IDX(&smmu->cmdq_host.llq, smmu->cmdq_host.llq.cons);
+		/* Avoid TOCTOU */
+		memcpy(cmd, &host_cmdq[idx * CMDQ_ENT_DWORDS], CMDQ_ENT_DWORDS << 3);
+		skip =3D smmu_filter_command(smmu, cmd);
+		if (!skip)
+			smmu_add_cmd_raw(smmu, cmd);
+		queue_inc_cons(&smmu->cmdq_host.llq);
+	}
+
+	/*
+	 * Wait till consumed, this can be improved a bit by returning to the hos=
t
+	 * while flagging the current offset in the command queue with the host,
+	 * this would be maintained from the hyp entering command or when the
+	 * host issuing another read to cons.
+	 */
+	WARN_ON(smmu_wait_event(smmu, smmu_cmdq_empty(&smmu->cmdq)));
+}
+
 static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
 {
 	size_t cmdq_size;
@@ -360,17 +442,37 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_d=
evice *smmu,
 		mask =3D read_only & ~(IDR0_S2P | IDR0_VMID16 | IDR0_MSI | IDR0_HYP);
 		WARN_ON(len !=3D sizeof(u32));
 		break;
-	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_CMDQ_BASE:
=20
 		/* Not allowed by the architecture */
 		WARN_ON(is_cmdq_enabled(smmu));
 		if (is_write)
 			smmu->cmdq_host.q_base =3D val;
-		mask =3D read_write;
-		break;
+		else
+			regs->regs[rd] =3D smmu->cmdq_host.q_base;
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
2.51.0.rc1.167.g924127e9c0-goog


