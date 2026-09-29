Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FD1CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnUSb4lP0yPlj/wu8X8ngRGHkepeNm6ppJnOg67H/0o=; b=xmeUBeE5hxM3GfbeaTVxZnqzki
	IUtn5E4d4IzulYBjeZEjNSbzFI21HVIYlvgC6eLxfXe0OgAhQ++O8wTFw1oAOMjVUyVgzNATC4Vsz
	YAbtwekUDx7pVu4rk3PjkUBdkibtZ/sQ6Y4DASpztDjBVaVtQlKqQP0BTTBzrPE4EdugAuwUQWcGx
	CQyAYxb0MzBxUTDDuPb/f6XpsxSDS7MoCb9lUmo2/I4ODIjupAdo8MJEM7CUE2v7Edc5a6ZKHXjia
	VLTCAj+k/OKWqF6NHbK+FqIYAo9jJJ+PV2IVJ5jCeVMGBCIOP/1L3y5wKCi3rwo8rdVFgyW1vGGE0
	fUW63NfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOms-00000002GJM-2oB0;
	Tue, 29 Sep 2026 03:45:50 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmW-00000002G74-3JLO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:45:29 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so2624386a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653527; x=1791258327; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnUSb4lP0yPlj/wu8X8ngRGHkepeNm6ppJnOg67H/0o=;
        b=XJ5nkc9cWuQ95QzoXSrdlbbRUp6apnFXDeIYGa0WkNhI0ZkUCx6noNqGQ7SjHZgsUL
         qxx/Z6/s/zXM1GYxfI0tdwUWoifMTHwo1POqSi7Ozc9cs9H4/6BjC8R9VyzBYddq78yI
         mThkoMV9cdUHzOOeeT4wn3M2XcnaD//Rwus/5uT+3ByW3A6JD0Pnc04i4u7SL9dk07jv
         Fy5ULczvM54R2/JJjLTGJhJBYHMKIwSJYDvFXA0oad824cmhr1gGkKew6Vn6ujLJn0NO
         OEsO4DR3Hfjb8jwue9mm5efJbCK2Kf2hX2Jq63tesZ1pY8uXKj/DFt3z+7HBgzEr/RjA
         niKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653527; x=1791258327;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnUSb4lP0yPlj/wu8X8ngRGHkepeNm6ppJnOg67H/0o=;
        b=dm/eUm11xxLirvtQ2TmEM19hbW0RElpBsfYZ+7fX5X81Znb2iMT0Jr5x1RVdUpLavI
         XovTsP+2DLzglgEEaKV1yjXA827nnLmEfBKcrKzxqiz3hM+6oDJ5SRzY15JIEzOkvr+4
         eLF1Vnh1KOnytZaOoo1q4lr84LVVf6/evcqvzb2PVeKvsvXvo83eGc3lO0m5MjviNoHT
         itTNrJv88iW/WrAZEjnIEc5nFIrMn2OZwIm+zeN+5bxf/AsV+royRsjVF3/wNXPTI4dn
         UsSPJRJRLuwY0XTFGocxFGRrm/mIxiNAre6/+Rs0XBI3NpEFgjWdIx0SPl00ipvKM/bc
         eeqg==
X-Forwarded-Encrypted: i=1; AKwUvBw9LTo/T1oUOH/8wUdt1zkOHvTaFpr4R4gr6KBfa8SlJe1dKvyJYSe4rdgHAxl3tImwhFz5+HOesAbNrEky9Iqr@lists.infradead.org
X-Gm-Message-State: AFuF++ncB2aYbm0LTwME8P6rPB6+poxDJVVUWpcyKhvkqtF3vjjfgBXK
	1IxHO9bSTcjnq2VDTWPymMxdWpUbuX0l88hCd6V1VTkSg7/ovBHRrgCDGnSDMK8OsNdWxAvQUbA
	GaA==
X-Received: from pgdh4.prod.google.com ([2002:a05:6a02:5184:b0:cc7:b470:94ff])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2583:b0:3dd:85a9:55b8
 with SMTP id adf61e73a8af0-3de0e8b481emr12791744637.35.1790653526784; Mon, 28
 Sep 2026 20:45:26 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:44:59 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-6-praan@google.com>
Subject: [PATCH v11 05/16] iommu/arm-smmu-v3: Add a helper to drain cmd queues
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
	Pranjal Shrivastava <praan@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_204528_858277_1B6D3371 
X-CRM114-Status: GOOD (  13.68  )
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

Before we suspend SMMU, we want to ensure that all commands (especially
ATC_INV) have been flushed by the CMDQ, i.e. the CMDQs are empty.
Add arm_smmu_drain_cmdqs() that drains the command queue using the
arm_smmu_drain_queue() helper.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 27 +++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d809b625f7fb..dc2fc02b5163 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1028,6 +1028,33 @@ int arm_smmu_drain_queue(struct arm_smmu_device *smmu,
 	return -ETIMEDOUT;
 }
 
+/*
+ * Lockless, the caller must ensure that no concurrent command submissions
+ * can happen (such as during suspend where clients are already quiesced).
+ * Polling until PROD == CONS ensures all pending commands in the queue have
+ * been consumed by the hardware.
+ */
+static int __maybe_unused arm_smmu_drain_cmdqs(struct arm_smmu_device *smmu)
+{
+	int ret, err;
+
+	/*
+	 * We skip cmdq locking here since this helper is only called
+	 * from contexts (like suspend) where the caller has already
+	 * ensured that new command submissions are fully closed.
+	 */
+	ret = arm_smmu_drain_queue(smmu, &smmu->cmdq.q, true);
+
+	/* Drain all implementation-specific queues */
+	if (smmu->impl_ops && smmu->impl_ops->drain_queues) {
+		err = smmu->impl_ops->drain_queues(smmu);
+		if (err)
+			ret = err;
+	}
+
+	return ret;
+}
+
 static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused,
 				   struct iommu_page_response *resp)
 {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


