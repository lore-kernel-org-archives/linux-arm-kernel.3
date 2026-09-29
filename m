Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFFECA5FAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TURFZphfVPL8QZrp+2aK2dezkQwEA5VMpCPWip8CV2s=; b=ii0fFC/Z9+6OXFpSjIxQ9k+coz
	2SDmz8nsL53eZSsipRSBOEIXoiPAoWgDBfSToj0u3nNlCccQ/Lrvv9Ju9lXC6OSphIeDQUg6B0XGs
	GPo5FfZIppMlynLvZdSiNn/G0nW43TQo+YKsGmt2rAkntG0DKQp4f0wnNN6bdHxGUU0gQadqBDixq
	I0KQFbC8kYKy03AcA8DN/vz94V4RiRKWabiZd1mSLsjb8P50Uq3+i2EE647jmhsjfkbFlFieoICmW
	ugIipEwV8qXRA5oElNee7EkzNO7gFYAuoqNsNVXcY3stUbOKZenxK9r3xYA9FkOvqc6ntDAKcafXQ
	IM2humSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmV-00000002G67-0TEb;
	Tue, 29 Sep 2026 03:45:27 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmO-00000002G41-3JD7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:45:21 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-86a43fc3527so487501b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653519; x=1791258319; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TURFZphfVPL8QZrp+2aK2dezkQwEA5VMpCPWip8CV2s=;
        b=X4l0d0T+iSGpCAA2Jx839KiLO+DBaKCcMhigFCvdU0llVp7hpCCibUtYXgG8oY52pD
         RF8Qig5sFhtiZ24ULq8SFaFkXM8UkC1IQ31iUd2uj1OEpRpmbWPeCB5bCHv56LhKbHbN
         Eo7oHvGMp/0axrmY5QRLhax4YiejavpWfQCiaK4JatMXUvRh4ILHrStEYKPmk0E2swBL
         YxSQRTnNV3lceJx64i2JAVGTnHc9a2Al8Rz0lBEg7EfXBauzWlXRxmRHWRYVM0l20LOA
         gnaoxnTRQmR4HPWdv3blBphIZVmCYX4v2xeINrKjV/LXdZZ52Jt12gFpOX7acJKIq8Ej
         kyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653519; x=1791258319;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TURFZphfVPL8QZrp+2aK2dezkQwEA5VMpCPWip8CV2s=;
        b=eAy/lGaUH3TqMvuumUaqfTncITALB18y/Hno4FCj2XIOAfyioCMyuWm224dpnvvo36
         qrYriQXdFtiI+sqoKKTd1FHT7XdU2UUhrtuxQenRqB5N20gzOU6K0lz+uMfJOBz2cJvs
         wtCDjVkkKXzA0VP9w6at4/QQRTpTKs9Z02OtWL2uWiKftiw60RW2stxppi0EDv1GcObC
         pYjjbLRyYTbD8lyJGJuTQ+Qyo5xn+GTez2F1+R9MquCQMADzebvokS/3dhElipYmwKtg
         un+cMdP/7EHvXbPfP1oMlR0NvXicP9O7u27AyjWMXIbiUwbR0kLN3gEtxclNgVuJvLtI
         CVMg==
X-Forwarded-Encrypted: i=1; AKwUvBy7KzRWaexkqhJVJtKOeDKwZBoBcdwDSr9NYAmjGOWxb0rxGfSIqCJY2CBFOQEPbyZz1cm9bcq/LACyhS/XfeU6@lists.infradead.org
X-Gm-Message-State: AFuF++k5J5/Wpv1KehmutltZ4ri7IyEf4PoxPVMCoP9W/KJPubuetRZO
	CU3bQ02dorHd/pSEvC/AwJ+tl2hFXQqWLG9fm9VJoI7K5H1PdSg81EUUmajAWVHbc4G8d2GUpi1
	UAw==
X-Received: from pgut3.prod.google.com ([2002:a65:6083:0:b0:cc7:85b1:2114])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d1a:b0:3dd:a9a9:3967
 with SMTP id adf61e73a8af0-3de7cf9d001mr1160408637.43.1790653518920; Mon, 28
 Sep 2026 20:45:18 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:44:56 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-3-praan@google.com>
Subject: [PATCH v11 02/16] iommu/arm-smmu-v3: Add Q_POS() macro
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_204520_842810_F19480A6 
X-CRM114-Status: GOOD (  13.75  )
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

From: Nicolin Chen <nicolinc@nvidia.com>

A queue position, the wrap bit combined with the index, is Q_WRP | Q_IDX.
It is a (max_n_shift + 1)-bit value that wraps at twice the queue capacity.
queue_inc_cons(), queue_sync_cons_ovf(), and queue_inc_prod_n() currently
compute such positions by open-coding the two macros at each call site.

Add a Q_POS() macro and switch the open-coded sites to it.

A subsequent change will apply Q_POS() to a position difference, to count
the entries that a queue pointer moved past.

No functional change intended.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 +++++------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  2 ++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 270e6617a19a..06b7de2e6e4b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -181,8 +181,8 @@ static void queue_sync_cons_out(struct arm_smmu_queue *q)
 
 static void queue_inc_cons(struct arm_smmu_ll_queue *q)
 {
-	u32 cons = (Q_WRP(q, q->cons) | Q_IDX(q, q->cons)) + 1;
-	q->cons = Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
+	u32 cons = Q_POS(q, q->cons) + 1;
+	q->cons = Q_OVF(q->cons) | Q_POS(q, cons);
 }
 
 static void queue_sync_cons_ovf(struct arm_smmu_queue *q)
@@ -192,8 +192,7 @@ static void queue_sync_cons_ovf(struct arm_smmu_queue *q)
 	if (likely(Q_OVF(llq->prod) == Q_OVF(llq->cons)))
 		return;
 
-	llq->cons = Q_OVF(llq->prod) | Q_WRP(llq, llq->cons) |
-		      Q_IDX(llq, llq->cons);
+	llq->cons = Q_OVF(llq->prod) | Q_POS(llq, llq->cons);
 	queue_sync_cons_out(q);
 }
 
@@ -218,8 +217,8 @@ static int queue_sync_prod_in(struct arm_smmu_queue *q)
 
 static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
 {
-	u32 prod = (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + n;
-	return Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
+	u32 prod = Q_POS(q, q->prod) + n;
+	return Q_OVF(q->prod) | Q_POS(q, prod);
 }
 
 static void queue_poll_init(struct arm_smmu_device *smmu,
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index dd2fee2f560e..84e618a7fa9e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -187,6 +187,8 @@ struct arm_vsmmu;
 
 #define Q_IDX(llq, p)			((p) & ((1 << (llq)->max_n_shift) - 1))
 #define Q_WRP(llq, p)			((p) & (1 << (llq)->max_n_shift))
+/* A position is Q_WRP | Q_IDX, wrapping at twice the queue capacity */
+#define Q_POS(llq, p)			(Q_WRP(llq, p) | Q_IDX(llq, p))
 #define Q_OVERFLOW_FLAG			(1U << 31)
 #define Q_OVF(p)			((p) & Q_OVERFLOW_FLAG)
 #define Q_ENT(q, p)			((q)->base +			\
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


