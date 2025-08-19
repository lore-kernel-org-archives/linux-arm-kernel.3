Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBABCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAhjHEW7JiGbHkZ3+MEbEcd94kVTPfsHqLQCKJs7pUU=; b=dr5epz0YxOIGWjwt/E0Ezv9Vf9
	UI/PztuU0VPDVpgE2LIRplDWjAGLiaZZorkJAFHrDTk+T736Wva4qITMpPNm1D8rYRKhXX0b3d5No
	fAPjVp1TD6bRu2ydB9JF+NCfQK+zebKlujhEwdRssUadODjaoze8+lFIvJI+sDAsE2YxfrvNtnF/C
	W0Y4B74j5dxf0B7thyrJlP6aN1qG20sTFZDaiF3HHSV6jZqwM5aw4+vng5P6sfqVAyp7Xl9/xL9dA
	2j9ixn1bYESkWJH6gxUmyY+uQaL85gRAymZBGy9AjYIEr+pSKaTfrAo1Pay3mlgpeiQbSvnKpNrcc
	6Z18VkCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWwZ-0000000Bz7E-2mo4;
	Wed, 20 Aug 2025 00:44:47 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUGC-0000000BfaC-2T4W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:53 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45a28ff4793so15292905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640371; x=1756245171; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NAhjHEW7JiGbHkZ3+MEbEcd94kVTPfsHqLQCKJs7pUU=;
        b=V/d7/Po1/Ui+I2KnNtGIBAz1gexklPEaZ1dRheJYBaq5Z/YS7YqEmodYWrAOXsYHqb
         vS1313U7XFG3dB748YAOs75N5JnJsncP+0AWQf8VNLAC5YJfylAHtOxWzpmT2+bRTfnB
         6uS4S+WwHVGqBXb4qd/PEatMKAvoVRYSATcJgkVs2KvhhcJCph1GarOnWIWZfsusv+bq
         cy/pwVQRhhr00fQr85W02LdisuFJVJtLTK+tFeYZKkIMCp++BoeF4J5VIgKGXKtmsWIW
         Y4pb9S3dExX0rRk2Az88mquvspinstwlcj0WCejuT/BX9oqGqfkzWH+4XTif5FAz9HS8
         37/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640371; x=1756245171;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NAhjHEW7JiGbHkZ3+MEbEcd94kVTPfsHqLQCKJs7pUU=;
        b=dfruyLG2ud5t2QLsn+SVgwl02neX/6iRGaMBHHRQ1wgCZIuMEdfiunFbbwV711cGEV
         edOpk+Rr863M5qo0JaY3hFq3BOuq77lhEUXiD4gXVrVniOMWUXbEcg9lCPM6ddvA6pn9
         AJRpdQwgCWKp/fCS4Y7OxsIAkRbl06QTvKosf4Kkcph6cbInEOLp0NgM9chdsi00fbpn
         UTzNwWM3dXaO+y3HNa2jrzr9/iHbWrewJbIPyYKg64R8GXhoZZ4hcInLkwoZVvvHww1r
         Ser/7q7jrBlw1YUt550X5ZUJsLGYL7cUXtGKJAcAPiWNQZULxJdsnZobpI3WxBmGan2V
         04nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRCPK2FmnUtEMKaxlsuYZEleFY38IzpTPOmrSD5VPUIsV3ngiLxkzz7YD7uoTZ9ZKSpICFaEhrht69ZFkqhMjg@lists.infradead.org
X-Gm-Message-State: AOJu0YwKgdpx3PWtEMnH3tYJjvFW0MDPzQ+WbOgl1wvEiTNTDYUcuUpH
	zy2EiATcOTiOSWhb4lLte9xUUkrq50X17pLFu6bBfz9dRxxoqUuTDyN/K55MMyX1+xSJ82HQ7KC
	/JbjSEJXB/cJHTg==
X-Google-Smtp-Source: AGHT+IEZystQ29Iwydry030qs2Gr/OWu/XIzN2opOZePf7XxWhuKurUI07dQ/jVoWuLSREf7SL8Xi1ULimkXvw==
X-Received: from wmbhj7.prod.google.com ([2002:a05:600c:5287:b0:456:111e:4717])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f4d:b0:459:d5d1:d602 with SMTP id 5b1f17b1804b1-45b479a3f4dmr3809755e9.3.1755640370667;
 Tue, 19 Aug 2025 14:52:50 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:56 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-29-smostafa@google.com>
Subject: [PATCH v4 28/28] iommu/arm-smmu-v3-kvm: Enable nesting
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_145252_627664_247573F9 
X-CRM114-Status: GOOD (  21.29  )
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
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 72 ++++++++++++++++++-
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 2d4ff21f83f9..5be44a37d581 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -336,6 +336,46 @@ static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+static void smmu_attach_stage_2(struct hyp_arm_smmu_v3_device *smmu, struct arm_smmu_ste *ste)
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
@@ -394,6 +434,10 @@ static void smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 	struct arm_smmu_ste *host_ste_ptr = smmu_get_ste_ptr(smmu, sid, host_ste_base);
 	struct arm_smmu_ste *hyp_ste_ptr = smmu_get_ste_ptr(smmu, sid, hyp_ste_base);
 	int i;
+	struct arm_smmu_ste target = {};
+	struct arm_smmu_cmdq_ent cfgi_cmd = {
+		.opcode = CMDQ_OP_CFGI_ALL,
+	};
 
 	/*
 	 * Linux only uses leaf = 1, when leaf is 0, we need to verify that this
@@ -409,8 +453,32 @@ static void smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 		hyp_ste_ptr = smmu_get_ste_ptr(smmu, sid, hyp_ste_base);
 	}
 
-	for (i = 0; i < STRTAB_STE_DWORDS; i++)
-		WRITE_ONCE(hyp_ste_ptr->data[i], host_ste_ptr->data[i]);
+	memcpy(target.data, host_ste_ptr->data, STRTAB_STE_DWORDS << 3);
+
+	/*
+	 * Typically, STE update is done as the following
+	 * 1- Write last 7 dwords, while STE is invalid
+	 * 2- CFGI
+	 * 3- Write first dword, making STE valid
+	 * 4- CFGI
+	 * As the SMMU has to least to load 64 bits atomically
+	 * that gurantees that there is no race between writing
+	 * the STE and the CFGI where the SMMU observes parts
+	 * of the STE.
+	 * In the shadow we update the STE to enable nested translation,
+	 * which requires updating first 3 dwords.
+	 * That is only done if the STE is valid and not in abort.
+	 * Which means it happens at step 4)
+	 * So we need to also write the last 7 dwords and send CFGI
+	 * before writing the first dword.
+	 * There is no need for last CFGI as the host will do that.
+	 */
+	smmu_attach_stage_2(smmu, &target);
+	for (i = 1; i < STRTAB_STE_DWORDS; i++)
+		WRITE_ONCE(hyp_ste_ptr->data[i], target.data[i]);
+
+	WARN_ON(smmu_send_cmd(smmu, &cfgi_cmd));
+	WRITE_ONCE(hyp_ste_ptr->data[0], target.data[0]);
 }
 
 static int smmu_init_strtab(struct hyp_arm_smmu_v3_device *smmu)
-- 
2.51.0.rc1.167.g924127e9c0-goog


