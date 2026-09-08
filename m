Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4428BC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYCuDUEGwNS1Zm5PcRgjWFl3h0js1k+eD8YzXNXMofU=; b=pJvOu/qGq8/9UrtljigVBEC9dM
	R/aPVRksa6GMThXgR//p/pheWyMDjU1XLYmaG4AbP+lkRMNmWWH0Kg/+X0GJcQX/l1IGWRFTUj63A
	Bsn+aVWVq1UJZAsYG19JZtxcA03zk87cSP+rO+ZaGkJZDnT4g5qy/lqkN19x/hrULW7tSZJDbDUZu
	0QRSWYd/MSSt3qo1Dhw9WerGbzkuCha4VhNA6bMNDz+tGhs2Af0bVRPgZGmBbZZ8R7htIOc9ck8SV
	11bC6vqVymWvzJjEfrYSHYnUR4IBR5ETU11RsmpFa+E5iKOsuqsUPaVFe9l+q+Gs+2W1gQRHC1zp1
	ghSeKo2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zRp-00000009mPg-1ViA;
	Tue, 08 Sep 2026 17:17:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zRk-00000009mNo-4C7K
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 17:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nYCuDUEGwNS1Zm5PcRgjWFl3h0js1k+eD8YzXNXMofU=; b=ohKGpZFnHqzZXIU+kNTsLsHK6A
	GPnDo8DfxpLv/gYhDJT35baHColWiEe199l8ggj8wr9c7tKeLeW8aO7fpBY5iD1l5Hydqxhvcrfm4
	VlJteHpi+aWazz3LZuaM3MS7sEpXTfAirUkOkoygaVyMFthNDF7zstX5FfqzUfpUUlOMmpwmHhFk7
	MGcpt0NKhSXYpQqGcWu92gM9tqpmIKPofCgCv1Spzza2TCEbOzOvff3nV6q1yC7XgcBvLkwauY/iY
	OtGz0oDByu9ZxJFb6f6iSOtgPoogvXB2X5FfIoSlrHMH/wxLjkf3n4GtN8hpCsyhyHxcPoROJckHL
	WZvPmqLw==;
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3zRi-000000008vL-1SIX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:17:23 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-855315ccb64so2176944b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887840; x=1789492640; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYCuDUEGwNS1Zm5PcRgjWFl3h0js1k+eD8YzXNXMofU=;
        b=UIpkNFj+/P32cFJzi4gNn3V7WI3Xgv7smZZUiaXqt2EFpO+lzVHPbUYR7HoTcD3Oyb
         T8rgW2d8D+zM8sxQKikT6SWaU7489xoGatSevXtOmdNxczBLmjx0LTnonNp4BaLPAMTc
         NLYQNWffc9OHexFr3Y883oYleDLCWZy1An81cCu3MoJrzMqGFOSkKyBR3EeJXg1wudvh
         tR/WLYCMGckbqe/qBSm/1DO4VNhAoChMsbynQeD3OlnUU5OlAs4rF9xHeG+/+yZDvy8F
         Q4RHYC/cyeciXTtHuEUviyMJEkZPSEChKlEwTqHzxgaYC1YwtcTV8N2u3HktNEp8EiS0
         DqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887840; x=1789492640;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYCuDUEGwNS1Zm5PcRgjWFl3h0js1k+eD8YzXNXMofU=;
        b=pfTgHOPFRzIbnmj7KnOE1T8Ekmtq3WbxKFHz/W0OZaUwN+UjR4gLl6KZxLOBAaun3W
         31uI+3sqM0FUG1poLznv5UFzRY0Y0dyiiZPpZsuIa2R9WJ7iMF8ztHHlgWCyVMx61lBr
         qsFECN7bOYGWMn+fBEl06Ogv6HFJ6Q/WOTUmCBDpr2tPtG352As+qENkCBfEYfQtOVn5
         LIpVSj7DYoAR8dSMgttoq8io7ARpBgcHOyXC6mk8HfNDbLqCvO5LoRl77NKIc3tSTErZ
         skXHyNVsibKB3f+eRRL08CPAhlNJzniTkkv8qozkq36cdS9BduFdhicWsstmUN+Yrpi1
         7Bsw==
X-Forwarded-Encrypted: i=1; AKwUvBxROrt3SYABwYQBcpiBUnbY6TEXoo+qak0OsQif09N6AZ6GzSLw3DfBVne3EYWCWebbT9l7icfuFZdNjVdMXvkI@lists.infradead.org
X-Gm-Message-State: AFuF++kLiMVlECCZiBbJYBemfLHW865wpN2L0/zjqZgGBIfzYkw9ChMH
	W1OSwoWNsm+fjYcB8b4jZHgPhivr1Fv/ZyLIOso654/Pfc/ppI8sNt1dPQMdrHbl4LZ+X+V0OLR
	G/Q==
X-Received: from pfam4.prod.google.com ([2002:aa7:8a04:0:b0:848:8808:ae6b])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1151:b0:85d:84a5:b7bb
 with SMTP id d2e1a72fcca58-86168d8c2fdmr41280329b3a.18.1788887839972; Tue, 08
 Sep 2026 10:17:19 -0700 (PDT)
Date: Tue,  8 Sep 2026 17:16:58 +0000
In-Reply-To: <20260908171712.356645-1-praan@google.com>
Mime-Version: 1.0
References: <20260908171712.356645-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908171712.356645-3-praan@google.com>
Subject: [PATCH v10 02/15] iommu/arm-smmu-v3: Add Q_POS() macro
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_181722_458753_9307E194 
X-CRM114-Status: GOOD (  13.85  )
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
2.55.0.979.g7e5102b832-goog


