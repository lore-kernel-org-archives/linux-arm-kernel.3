Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5831CEBF8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yqv9vt6rYdUcUmbSADKPrtDVgWOjgzH7G7qmk1O24d8=; b=N5+upuCePdO02gpvhh/Kli99p0
	QCODfiLRDUTRo1Kp4R9o6vRBrJGn6vfqbnJJKyM0yRMRl6VLfHZbY5BBh91m1xpZmHfMPLiYKvNBM
	Y2ZThrnW35bON3Dc66zYB/OjBp6oXSelhAnBpxjlLel1SeJYkQEnxIS06zMORqKWdvyI3rExAFm1/
	3V6o1nUKFcGWa04d7oSMcHNhzTAvQw75Y1RRHLuhGeu5YH1dMNCzHmnKw5p0jYhsmtu2dSMgItnce
	MiicysUv7Qf0BC7uC039v5qNIrWoaunCls4+TTuB3EeElEcoqRgwvSO3wI6/XHoVj8L3mDNZDpnCf
	Nqjm3SoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4IO-0000000Genl-01id;
	Mon, 17 Nov 2025 18:49:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4Hb-0000000Gdri-0BXC
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 18:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Yqv9vt6rYdUcUmbSADKPrtDVgWOjgzH7G7qmk1O24d8=; b=LDOn5pncz7vEA585jyjRPcpt9o
	UDUtTJ5qg7RL7SO+fHrLROyXpXVH91hqDaen4DQDq9ih7pphu7X5y0Agrh/le7E8Sb5u6W31iHOTt
	BXhcRkZmtbiEUobqUTNIfA4x9riTYRtOvgka8T5eVa1g+rnKMUtL706TXesCyP/iqVicHa8gxY7QU
	1QsyTBaW9/by05+/Jh4MLZHGylhnb8tWUdqu2px6fyBOktX39D+O0Xh/tORqCL+HZ+TaTzrQVmjDN
	r4xOR9q8HFxbq/qAKEIKWxcUXMcL1dj85OOYjlGyUdlpZ2VelycR4WKn5v2OLpq3YHCPuRON/hvaB
	d2p+9bBg==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3Pt-00000007wh8-0Vxe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:53:32 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4775f51ce36so40130225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405333; x=1764010133; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yqv9vt6rYdUcUmbSADKPrtDVgWOjgzH7G7qmk1O24d8=;
        b=SSSGUu4uUPrQ3s5/tauBm5RsdQOfTSqI/8kPn3t8G4mmgAOrVSuY1d2B0bruMO8eqt
         EnIvVr8/Ek48UKwUK7WFFJNPhdUO6TRGxE+auOGAxV/LRbq4E6kqwyp+W9Yds12Aj4TQ
         KkeL4EOI0IcJvNm1gZcggC/Ja0SYMa6YoNNDW2Oc/tjttGZnXTBVbWdAnEnsC43YGykT
         egYC2QfyRsQ+877XVeHCXIXQyNQTxrjI34Ry7BF/amGhxIC0LQVQX26RwTDUxqH3wlyY
         +jCZgeKqwOq1yx3d6icq0aNIH1Ctu+vVBFztkcu2XHk1GFnSgiUWBcNFW/qf24oQFD6L
         VPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405333; x=1764010133;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yqv9vt6rYdUcUmbSADKPrtDVgWOjgzH7G7qmk1O24d8=;
        b=CUT89uHMO8TT8+XCDfEj2Dl4XO2pQ5PrFIu5tsKXX9jps14mCvWYdX7hp+sxEebO/h
         U/1Zvznp0xZJeys1XdecnxPRWNq3P8RcJBJaogQu/Ne2ipPBa0lADj3ifESaIb1RiNle
         5mu/LLZ/xGvYRUgCvyuNavV0PWgWwZ3V8eiYpqWmLjQ+6WDWSIpfzH0dipZrEAJkPivX
         fGWvTSc3wtDSQ/npaghEdlMLNNMTtQp3fdT+nG8T2rSWX7I92aCfANduHg7Abgkv3Txp
         iyuVhZ5fzqyI4nXFpAojf8z8+8D4WaFhE5W/nCJyeLU3DsKnHpqAuGGKxp8HpBcfK80N
         gIUw==
X-Gm-Message-State: AOJu0YwIWRyXD3PpeZb8KfzP3tpCUbOQyC0ZN/e8y+5/fccsYxJKzNrS
	DCznFo2LhAu/Gh0cK9OZyndc2p9pOC/iCJ7eXv8YuG46s6Kzy2GTf468zzixPlhD/0yy4kEr3ks
	RXboFSAwxqLmuYJPx9trE9qbEA9vbdQmACAc64v1wpK07oeihVamPKFnxAsLeEGDBHxM2lRb0t2
	Dlzw/HwIHXlLP3HXHSjwpg+RrmxLQLA+y/6USnJvuXAPHg0lsgJvC7E7Ac4k3Z454zYg==
X-Google-Smtp-Source: AGHT+IFKuKQmQwETqVMo5V4rZDWAjfD2WAPxG29C33FYX0labdGr2WvGuWsAPiA9DtRuNjEGIDoqy8Foar2wTg==
X-Received: from wmqy12.prod.google.com ([2002:a05:600c:364c:b0:477:9aa2:7d50])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d15:b0:477:9bfc:dcb6 with SMTP id 5b1f17b1804b1-4779bfcde09mr72288665e9.14.1763405333101;
 Mon, 17 Nov 2025 10:48:53 -0800 (PST)
Date: Mon, 17 Nov 2025 18:48:14 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-28-smostafa@google.com>
Subject: [PATCH v5 27/27] iommu/arm-smmu-v3-kvm: Enable nesting
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
X-CRM114-CacheID: sfid-20251117_175329_311983_DB44AE03 
X-CRM114-Status: GOOD (  20.13  )
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

Now, as the hypervisor controls the command queue, stream table,
and shadows the stage-2 page table.
Enable stage-2 in case the host puts an STE in bypass or stage-1.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 75 ++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index f0075f9a0947..3e451cef937c 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -371,6 +371,46 @@ static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+static void smmu_attach_stage_2(struct arm_smmu_ste *ste)
+{
+	unsigned long vttbr;
+	unsigned long ts, sl, ic, oc, sh, tg, ps;
+	unsigned long cfg;
+	struct io_pgtable_cfg *pgt_cfg =  &idmap_pgtable->cfg;
+
+	cfg = FIELD_GET(STRTAB_STE_0_CFG, ste->data[0]);
+	if (!FIELD_GET(STRTAB_STE_0_V, ste->data[0]) ||
+	    (cfg == STRTAB_STE_0_CFG_ABORT))
+		return;
+	/* S2 is not advertised, that should never be attempted. */
+	if (WARN_ON(cfg == STRTAB_STE_0_CFG_NESTED))
+		return;
+	vttbr = pgt_cfg->arm_lpae_s2_cfg.vttbr;
+	ps = pgt_cfg->arm_lpae_s2_cfg.vtcr.ps;
+	tg = pgt_cfg->arm_lpae_s2_cfg.vtcr.tg;
+	sh = pgt_cfg->arm_lpae_s2_cfg.vtcr.sh;
+	oc = pgt_cfg->arm_lpae_s2_cfg.vtcr.orgn;
+	ic = pgt_cfg->arm_lpae_s2_cfg.vtcr.irgn;
+	sl = pgt_cfg->arm_lpae_s2_cfg.vtcr.sl;
+	ts = pgt_cfg->arm_lpae_s2_cfg.vtcr.tsz;
+
+	ste->data[1] |= FIELD_PREP(STRTAB_STE_1_SHCFG, STRTAB_STE_1_SHCFG_INCOMING);
+	/* The host shouldn't write dwords 2 and 3, overwrite them. */
+	ste->data[2] = FIELD_PREP(STRTAB_STE_2_VTCR,
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, ps) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, tg) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, sh) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2OR0, oc) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2IR0, ic) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2SL0, sl) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2T0SZ, ts)) |
+		 FIELD_PREP(STRTAB_STE_2_S2VMID, 0) |
+		 STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2R;
+	ste->data[3] = vttbr & STRTAB_STE_3_S2TTB_MASK;
+	/* Convert S1 => nested and bypass => S2 */
+	ste->data[0] |= FIELD_PREP(STRTAB_STE_0_CFG, cfg | BIT(1));
+}
+
 /* Get an STE for a stream table base. */
 static struct arm_smmu_ste *smmu_get_ste_ptr(struct hyp_arm_smmu_v3_device *smmu,
 					     u32 sid, u64 *strtab)
@@ -426,6 +466,15 @@ static void smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 	u64 *hyp_ste_base = strtab_hyp_base(smmu);
 	struct arm_smmu_ste *host_ste_ptr = smmu_get_ste_ptr(smmu, sid, host_ste_base);
 	struct arm_smmu_ste *hyp_ste_ptr = smmu_get_ste_ptr(smmu, sid, hyp_ste_base);
+	struct arm_smmu_ste target = {};
+	struct arm_smmu_cmdq_ent cfgi_cmd = {
+		.opcode	= CMDQ_OP_CFGI_STE,
+		.cfgi	= {
+			.sid	= sid,
+			.leaf	= true,
+		},
+	};
+	int i;
 
 	/*
 	 * Linux only uses leaf = 1, when leaf is 0, we need to verify that this
@@ -441,8 +490,32 @@ static void smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 		hyp_ste_ptr = smmu_get_ste_ptr(smmu, sid, hyp_ste_base);
 	}
 
-	smmu_copy_from_host(smmu, hyp_ste_ptr->data, host_ste_ptr->data,
+	smmu_copy_from_host(smmu, target.data, host_ste_ptr->data,
 			    STRTAB_STE_DWORDS << 3);
+	/*
+	 * Typically, STE update is done as the following
+	 * 1- Write last 7 dwords, while STE is invalid
+	 * 2- CFGI
+	 * 3- Write first dword, making STE valid
+	 * 4- CFGI
+	 * As the SMMU MUST at least load 64 bits atomically
+	 * that gurantees that there is no race between writing
+	 * the STE and the CFGI where the SMMU observes parts
+	 * of the STE.
+	 * In the shadow we update the STE to enable nested translation,
+	 * which requires updating first 4 dwords.
+	 * That is only done if the STE is valid and not in abort.
+	 * Which means it happens at step 4)
+	 * So we need to also write the last 7 dwords and send CFGI
+	 * before writing the first dword.
+	 * There is no need for last CFGI as it's done next.
+	 */
+	smmu_attach_stage_2(&target);
+	for (i = 1; i < STRTAB_STE_DWORDS; i++)
+		WRITE_ONCE(hyp_ste_ptr->data[i], target.data[i]);
+
+	WARN_ON(smmu_send_cmd(smmu, &cfgi_cmd));
+	WRITE_ONCE(hyp_ste_ptr->data[0], target.data[0]);
 }
 
 static int smmu_init_strtab(struct hyp_arm_smmu_v3_device *smmu)
-- 
2.52.0.rc1.455.g30608eb744-goog


