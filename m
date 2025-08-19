Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D591CCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5Xrv+yZchFUzMTWX2SO30dKLg2MrQIxC8g2iyFC05M=; b=JLTOoI9aq/qi23TdNOuH7KCB7U
	/HUn0U+kjZ/OVGbzMBNZw9LcYUHMJrrpcUIxfZm0BMmrjCmrq2GwU1eCV8CMKXf5KqRNT/m7i7Soe
	OsVrq2Jtin/1FrwmAD4uiB6uTSWfyCzCfEwvCn4LZ82oFz7ow+IIssDqPk7F2l1hH96N09EtIwxWa
	mFSbiXjb7TweqeAtyxUzxUmWnVDpmjWNojsh681Mwqa+cZFQfFXghRbgGmUg3Xa4uRz9va7lmjJm0
	a/IcwzZDM7H+4m7RB1ecwIiIz0PuAw4vhWZUaCr+R6tBzwj324iKKCVsBTvMkn4lvCxej1xSHPVoL
	pn/tsNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWol-0000000ByEE-1AOV;
	Wed, 20 Aug 2025 00:36:43 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUG9-0000000BfYd-2QSN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:50 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a1b05d251so32896825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640368; x=1756245168; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5Xrv+yZchFUzMTWX2SO30dKLg2MrQIxC8g2iyFC05M=;
        b=njeCQPf+JRiNSkLi9/rSIek95P0W0uPbW668YQAEL6+U6gdVi6G+N/11MGAuqYWApd
         S2oOwz92mmn2jK+gXO6JKce9/TP/fcHOfXM1tTh6mCsQXgnCQ1Hxw88HgZjKRXN5oB7+
         ARC3/udxo9FaYZ8Fa/0zHMqX39xAgQmjVCTQTT0niFNelTmmHUMnwAT/7SKjRWjjnCnE
         wOLNj+x81MNAMbFZ22a6A4YLbkwfVI1kdiYQvrvF9gvKw/ZxkivI8kNzfSueWna+rYpw
         kytbNX78zdQ1gYd7ndC4jUvwURJ6CLzfbviaMXyGHv92BD4DF2mnSpnEUBAGjR7JBKdC
         DsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640368; x=1756245168;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w5Xrv+yZchFUzMTWX2SO30dKLg2MrQIxC8g2iyFC05M=;
        b=UDRFQUaDrdZV2Q/dti8CK0QqveCHg1O9hlHKerxKPHLEYJTL5jitdFA48qAkfN3SES
         ol2iXBbmp9Mwa5jcSfpWe3mFLGWwUYcUAkC9WVBgdBVCGo01/jlP3cCL2pzPKjyLogOC
         mxnRXvMroFuqSswLtizGLtS0lztJU4aZcBRAzThZvvDyXroBaqe/7dzxpItv1prdStzI
         lhv258+f2UaDkmWDD5BCr14AXlbQWSxgXofCgfrtcuDDKxyaQV8t7DmdSPSGRjXyzIwn
         aTUOXO/LIWzJCiPbeBHSSStV5LDIVTxS/bzt6yHJu51YVY7FRSdKeJKQn8hJwb647m7J
         DpIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9zPAkQB2eQgGEUyR5nLi/Dt2AoAHIQ30seNd8jFKPKMsaRLEt9OrUHzQNCGx+t4qJ0a01AiiD5wHEza5NoLzH@lists.infradead.org
X-Gm-Message-State: AOJu0YxZVT6637oQQ8OSyQxm7JVyKRNVN/lbF9Awi/PcxakPTuy1llE5
	BFyLYRqbeJNAbxlx4sT1lKMIavwAvFc5GY6uoB/5RGnFLORiTkyuf/DgMmz/fxZtHerUJ9y2Z2i
	BL3nCPZ9tlcjssg==
X-Google-Smtp-Source: AGHT+IEkIYLt8jKXZ6jlGQreyOBP5MPpq4IR1pMtFairXlGsN9A2lAviNYTKCG1j1G3gzMwAxgyEa1tGajcbqg==
X-Received: from wmqa4.prod.google.com ([2002:a05:600c:3484:b0:459:dbaa:93b0])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ba7:b0:458:bb0e:4181 with SMTP id 5b1f17b1804b1-45b47d904a1mr1114035e9.10.1755640367876;
 Tue, 19 Aug 2025 14:52:47 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:53 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-26-smostafa@google.com>
Subject: [PATCH v4 25/28] iommu/arm-smmu-v3-kvm: Emulate GBPA
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
X-CRM114-CacheID: sfid-20250819_145249_620433_B8F7EFFA 
X-CRM114-Status: GOOD (  16.90  )
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

The last bit of emulation is GBPA. it must be always set to ABORT,
as when the SMMU is disabled it=E2=80=99s not allowed for the host to bypas=
s
the SMMU.

That =E2=80=98s is done by setting the GBPA to ABORT at init time, when the=
 host:
- Writes, we ignore the write and save the value without the UPDATE bit.
- Reads, return the saved value.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 21 ++++++++++++++++---
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |  2 ++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iom=
mu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 0f890a7d8db3..db9d9caaca2c 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -100,6 +100,13 @@ static int smmu_unshare_pages(phys_addr_t addr, size_t=
 size)
 	return 0;
 }
=20
+static int smmu_abort_gbpa(struct hyp_arm_smmu_v3_device *smmu)
+{
+	writel_relaxed(GBPA_UPDATE | GBPA_ABORT, smmu->base + ARM_SMMU_GBPA);
+	/* Wait till UPDATE is cleared. */
+	return smmu_wait(readl_relaxed(smmu->base + ARM_SMMU_GBPA) =3D=3D GBPA_AB=
ORT);
+}
+
 static bool smmu_cmdq_full(struct arm_smmu_queue *cmdq)
 {
 	struct arm_smmu_ll_queue *llq =3D &cmdq->llq;
@@ -416,6 +423,10 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_dev=
ice *smmu)
 	if (ret)
 		goto out_ret;
=20
+	ret =3D smmu_abort_gbpa(smmu);
+	if (ret)
+		goto out_ret;
+
 	return 0;
=20
 out_ret:
@@ -663,10 +674,14 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_d=
evice *smmu,
 			smmu->host_ste_cfg =3D val;
 		}
 		goto out_ret;
-	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_GBPA:
-		mask =3D read_write;
-		break;
+		if (is_write)
+			smmu->gbpa =3D val & ~GBPA_UPDATE;
+		else
+			regs->regs[rd] =3D smmu->gbpa;
+
+		WARN_ON(len !=3D sizeof(u32));
+		goto out_ret;
 	case ARM_SMMU_CR0:
 		if (is_write) {
 			bool last_cmdq_en =3D is_cmdq_enabled(smmu);
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iom=
mu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index cf85e5efdd9e..aab585dd9fd8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
@@ -31,6 +31,7 @@
  * @host_ste_cfg	Host stream table config
  * @host_ste_base	Host stream table base
  * @strtab_cfg		Stream table as seen by HW
+ * @gbpa		Last value of GBPA from the host
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
@@ -54,6 +55,7 @@ struct hyp_arm_smmu_v3_device {
 	u64			host_ste_cfg;
 	u64			host_ste_base;
 	struct arm_smmu_strtab_cfg strtab_cfg;
+	u32			gbpa;
 };
=20
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
--=20
2.51.0.rc1.167.g924127e9c0-goog


