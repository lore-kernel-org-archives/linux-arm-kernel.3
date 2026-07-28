Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CB4C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E+3703fePyNSfsNt+o4YS0n51IZygR9Sm6Ij5ITQEeM=; b=qtulPW+va9zufO1sr/P1rYjwdh
	BjmzcPfog1m0MjCUWb4NIT59y/KM4yEulg2z0jJ95Ko/GiTcZ5BJvggU1An3LVE9J6ne4o4iQEPZZ
	6T41xQWt97JuH1wRK+HdfJluFhUC3fjyvbu88wtkD5PlspRfRYhtmGm23e9PSyUU9rxkBjxAXQVJp
	LpPYyQJYo5D0ybrzAleJAc/bZ//J53F3nGthjxHkJQXVKk2YwsWI8r4SFlUgPDgwEDZr2byLOVrZ1
	X/84Fgwzy7+1zLpqQdVipTKd+N8bsEVPFlP8MX0r7LukRrYmTL9cv5N1ULVwy2DLC/gKBFn37BmQB
	u1B462mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop5L-00000006Hos-2KaS;
	Tue, 28 Jul 2026 21:11:35 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop5F-00000006Hkj-2bRE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:11:34 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so229418a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785273088; x=1785877888; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+3703fePyNSfsNt+o4YS0n51IZygR9Sm6Ij5ITQEeM=;
        b=ad3oJExH/Al7anOgqWYW5VtdDixGndL9iVbnCnPeUYMKZ6qJDoPy8iCnm4lL00kWrr
         Qx7s3S2CSEG3puv2OBbZgIcRnJFWOrs3hHwKX62J80aGpVL/9jsxmtWG6m5tNWj+p0PD
         BZlj3SQmhpuSg7U6Bb0s3ypPmaU+AqOi2xFhUZG0XJMACFpa49NM/24+ji1Chad1hkY8
         Hdi/OFbVETT0/E0bs25iMCgemmxpbVbp4T80UtLSdsflv+1R3cXldVWc4dOY2NpJJVFR
         BYGmUJD0JOMBCHJ16FPv0GawqYbg8+ZJPU6V8BKHuTqg7JsEReerDZsXy/tNbZTrBsdV
         eZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273088; x=1785877888;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+3703fePyNSfsNt+o4YS0n51IZygR9Sm6Ij5ITQEeM=;
        b=rNmeVmLH3OFQf6IKCKbiTfab2aM0e+69yqhCe7d8+S/yx7ghy4kiNm8Q1MztxdrSj+
         ugOohZDx9HR6r4wyxjeFSrbwvVbbEyRj7jUtKuY2sBGkyv8siav5fSf5lZzgr0Tg5AVI
         ZCIacrhnd7JrUGihiYb5MYpIa2kBxvaQOo2hiCcz4+u24RWiTHsg3lWzTyGrQ1KIa3ss
         Vij9P9HwxBriB//h5HNZ1KQG/ucEueFpI8WF1GVmGgs/CoNyiBfd64jo7cgJjxzRP/Fk
         fBPzVydJE0litY3dwrgj/xBuXeuqkz8k944CQu07XbS3J7zjfc968oEnAoZd6NgMpIs8
         hqkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrADryzF9b2Ic5io0L5Oj8QBbxDjz3J3QpjC+D5kORIXz7UM7UHP3aRRYp5vH1em3KHBs5dwTbnZF1UUqYlawo8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4cASvg51sf7rI+4xNvGD73wzP6LezlAwK9Rc8V2K/04PHNn9V
	2SJ80wAU0OVU3OjzHdrj8s0qGzePEtvRq0rubpfnJPd1Tg6vwfVVKSka9bTqOzluShZKQntpOxX
	t4Q==
X-Received: from pgwa5.prod.google.com ([2002:a65:6545:0:b0:c99:d21a:f6b1])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7288:b0:3bf:6c08:2b27
 with SMTP id adf61e73a8af0-3c8ba5cdbc6mr4598322637.47.1785273087910; Tue, 28
 Jul 2026 14:11:27 -0700 (PDT)
Date: Tue, 28 Jul 2026 21:11:23 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728211123.1059708-1-praan@google.com>
Subject: [PATCH] iommu/arm-smmu-v3: Convert to use atomic poll timeout
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	linux-arm-kernel@lists.infradead.org, Pranjal Shrivastava <praan@google.com>, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_141129_677636_A03A4974 
X-CRM114-Status: GOOD (  13.41  )
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

The arm_smmu_write_reg_sync() helper is currently implemented using
readl_relaxed_poll_timeout() (that relies on usleep_range() internally)
which becomes a critical issue when used in the gerror irq handler.

If the SMMU hits a gerror and enters Service Failure Mode
(GERROR_SFM_ERR), the gerror handler calls arm_smmu_device_disable() in
hard-irq context. This becomes a problem as arm_smmu_device_disable()
inevitably calls arm_smmu_write_reg_sync() which might attempt to sleep
inside a hard-irq context.

Fix this by converting the arm_smmu_write_reg_sync to use the
readl_relaxed_poll_timeout_atomic() polling helper.

(Discovered while running Sashiko locally on another patch series).

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 48ec83bcbcf5 ("iommu/arm-smmu: Add initial driver support for ARM SMMUv3 devices")
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a10affb483a4..f8f8193d0830 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4533,8 +4533,9 @@ static int arm_smmu_write_reg_sync(struct arm_smmu_device *smmu, u32 val,
 	u32 reg;
 
 	writel_relaxed(val, smmu->base + reg_off);
-	return readl_relaxed_poll_timeout(smmu->base + ack_off, reg, reg == val,
-					  1, ARM_SMMU_POLL_TIMEOUT_US);
+	return readl_relaxed_poll_timeout_atomic(smmu->base + ack_off, reg,
+						reg == val, 1,
+						ARM_SMMU_POLL_TIMEOUT_US);
 }
 
 /* GBPA is "special" */
-- 
2.55.0.487.gaf234c4eb3-goog


