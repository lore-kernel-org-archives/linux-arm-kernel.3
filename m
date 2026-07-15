Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00A6C4450F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eFC7jmqsBzC+eazaElzsGpHmLo+EQxKGjp4/qK1rg8=; b=NBPGme/EM0yIaQprI6vIWRcDaz
	6HpoTb5nKqrmeNsvMbC+Thb1ynGsB7ZQ0rOraUtgyeUGmzCx9CfNAgc2zOkLn8R6ct5KgYzgnhx/J
	RdyjCOTQNBJR6epWQV94DyO3+ewAtGCkVukgkqCPq9c4CvCX8UpQgCaA1TzPoobkE8Y40Fb9TVWjQ
	SV60mh3ZdV0/VAQDYYszvaEIUfRTUqcz8ae5eiyYo5dzpgGzHDy7F3RAOOQHv5Wr7ImvnM53dVVB9
	6sPTdNsNgT9TMWIdh+PDZEPGk8RZpPlZ13vunTtGjbP68ExpqYN/nh/5fLlMbvCfIu3nWkGi1OOrZ
	eJp6xisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyHZ-0000000EfsQ-1q0n;
	Wed, 15 Jul 2026 12:00:09 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyH8-0000000EfNk-1D1C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:59:45 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-47e9f03e80bso2112815f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784116779; x=1784721579; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8eFC7jmqsBzC+eazaElzsGpHmLo+EQxKGjp4/qK1rg8=;
        b=krV9wLPjctpgHWBpGZSIhocpBOnIMVSQy25o3oKEN0Yc80fS5zlRXTF2psS4pdpIzt
         RqO5lUoLozi613+37hOntC6C+udfNX/s7j54BYojxLOCf9CpKun58aU9NDQcwxtE2UCa
         rslJk+O+Ji8f7OirqGrNetMcs9S3dUlEWWHJueza7NLasfRUZINROm2WSTNpQTFoSdnE
         6SyZzpAni9vK+xBD6RQEBNQAPUJOvYzWWxtq3aIdadkkLpz/SnbVZuu8+PQwF+AcJ7O5
         PRAs6U+gMFCMMONAtRxiVxJLBox+4AoPd0aSxrhZk4WlGUa+5qMLEAvvze2aDOPRQYy3
         tW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116779; x=1784721579;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8eFC7jmqsBzC+eazaElzsGpHmLo+EQxKGjp4/qK1rg8=;
        b=nHMS1QwBYiiZpf83CpMDOGRGxkAOziymIZ/FkosaCFTBDIrdv8165KtZZLgLme1Bgh
         eUo8n8DG7/JQnEPZblKau8S2AxVMxhBtz9EDgc7qmGckoGLoPgW5XnMR5sfRTbh4lT1V
         AeSYd/M9aSnuiQ/P2sm4yTcpUWYrEg3DtePPhtdc/7kKXLBTZhqsC7j3nhIuC7Jb+dpH
         e8w65Kq6G6o97RrUvDhTh5dekWnX1xsCGvE3rfPLfp5m8QnERhEKqy4ryd6HDdzvdkAy
         pUYfUL1DkAyF5/2kmoe8Gd8xT6CPhP1L92GZxLk/K2ygMJ6Cxbe8iNM6iSXd/RQrawqn
         RSVw==
X-Gm-Message-State: AOJu0Yy5UGzZi5NgSNiCJheEMTKEVqMGsjRHWTMrI1GTeeKJixUl0ORk
	B0BerUo1srhMMasZn7EERRJVBpGCCsXVFuJ3oZxVlF+oywrBfWzMg/gHK9F2rCa/bHkVr3+KF2M
	wFkZXp0zYtxdMhEK4YRn0IbP40xOrH8wmKcTFQpbCOPAXHP8UMivadXXvLH1W9uc4T1pTP/9P/G
	Hs8fu1yS6HZBY0akMUmQyxoWfEPg76hZS1fEVJG+WjEUfuIclfcnfYghEd/KqxV2oxyg==
X-Received: from wrrg11.prod.google.com ([2002:adf:fc8b:0:b0:47f:4e4d:2531])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:310d:b0:474:83d4:9916 with SMTP id ffacd0b85a97d-47f4885698emr7936900f8f.17.1784116778676;
 Wed, 15 Jul 2026 04:59:38 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:59:01 +0000
In-Reply-To: <20260715115906.2664882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260715115906.2664882-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715115906.2664882-21-smostafa@google.com>
Subject: [PATCH v7 20/24] iommu/arm-smmu-v3-kvm: Emulate GBPA
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
X-CRM114-CacheID: sfid-20260715_045942_498273_0CFEAEFB 
X-CRM114-Status: GOOD (  14.94  )
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

That's is done by setting the GBPA to ABORT at init time, and host
writes are always ignored and host reads always return ABORT.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 32 +++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iom=
mu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 11de73640a6f..45dbab1b18ad 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -139,6 +139,22 @@ static bool smmu_cmdq_has_space(struct arm_smmu_queue =
*cmdq, u32 n)
 	return queue_has_space(llq, n);
 }
=20
+static int smmu_abort_gbpa(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int ret;
+	u32 reg;
+
+	ret =3D smmu_wait(false,
+			(readl_relaxed(smmu->base + ARM_SMMU_GBPA) & GBPA_UPDATE) =3D=3D 0);
+	if (ret)
+		return ret;
+
+	reg =3D readl_relaxed(smmu->base + ARM_SMMU_GBPA);
+	writel_relaxed(GBPA_UPDATE | GBPA_ABORT | reg, smmu->base + ARM_SMMU_GBPA=
);
+	return smmu_wait(false,
+			 (readl_relaxed(smmu->base + ARM_SMMU_GBPA) & GBPA_UPDATE) =3D=3D 0);
+}
+
 static bool smmu_cmdq_full(struct arm_smmu_queue *cmdq)
 {
 	struct arm_smmu_ll_queue *llq =3D &cmdq->llq;
@@ -450,6 +466,10 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_dev=
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
@@ -763,10 +783,16 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_d=
evice *smmu,
 			val =3D smmu->host_ste_cfg;
 			goto out_update_regs;
 		}
-	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_GBPA:
-		mask =3D read_write;
-		break;
+		if (len !=3D sizeof(u32))
+			break;
+
+		/* Ignore write, always read to abort. */
+		if (!is_write) {
+			val =3D GBPA_ABORT;
+			goto out_update_regs;
+		}
+		goto out_ret;
 	case ARM_SMMU_CR0:
 		if (len !=3D sizeof(u32))
 			break;
--=20
2.55.0.141.g00534a21ce-goog


