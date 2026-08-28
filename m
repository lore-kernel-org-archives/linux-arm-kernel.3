Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5571C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 12:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIbaVf3ZrMQ638kyQmo2xKF0JXdpiB0/s407XZc/gcU=; b=vmNuJOd9+3pSGHTk8LEIV/+r6Z
	msyLdq9zoTg+34vTKY9Oe23QE7/M4xinlUC3mxXXxMhlvC2aufCMDYmyEXxtfQhSi8WVnwk0Tzhc5
	p04vInzIywNP4RUMye2iWTCECJ0FEB48svYL/QJ4HvfQv1TZCJ/CZEvn7GV7mKN9uaJukGmjkTe43
	qYElV0XfFL9EXp2muGik97yHM5VxDinN+aiXQYWCfKbmofO7bypaNddKaoavg50M8NnZ+QXyqNXXa
	VhAgJTe2GOoZzeU5tIME5dm3COWLBifVr2geePGU6z07ZGv7Q3ojxVrj0EbXGk7QluF3LyveuCGOf
	QFFxpNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw6B-00000005lPh-44Nl;
	Fri, 28 Aug 2026 12:54:23 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw66-00000005lOO-1ksl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 12:54:19 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49cc954a3edso836065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 05:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787921656; x=1788526456; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TIbaVf3ZrMQ638kyQmo2xKF0JXdpiB0/s407XZc/gcU=;
        b=YKKX3G7vRzr1ZSvy4EcnKWqfDF0Yq9SiHuoknKTl7kIm95CqpTnhJxiztOEK/ee1Ab
         WfdhNBP8Bx/WJRXRIy3KO+TfpWpX+Lfo9+JxNJ2ZN7VLshjSIkp33l8bO17uWpeUE5LA
         0fB5AACN5QaeSujE96MdtmQbSCY8e23kEtJRsZzpe+vEsuJfZAeEPoCLrMLR7Q7vXZNu
         EBBDRCDb3lW1JG5MX3TCQCIXAAdJqgfXpNrS1nXRV+roLpMYyfpZvVfHNTibuCqOQAtk
         Rd8TjeTgopqM5u9xG9UHes5tBJcIJcPEpeULZGl4LOys7TKpwd6u7YtHFF8GV2WuBRgm
         uL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921656; x=1788526456;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TIbaVf3ZrMQ638kyQmo2xKF0JXdpiB0/s407XZc/gcU=;
        b=f0suBJ9XGdHrlQHy2z+gbAu7qlIlP7YMdjl5//NrM8u5XqwKKNthPwlmqUvgVb4/tc
         Ye08KByoe8YtQcsNHch3G80pZp0CyFpHZe5YLwdGDtKJ+0YSLw1L/JEoni+i3k2Hy5PR
         WfyA/NhcPRlyqoGkjckWYRV23OZKSc8S1borkof+6dZ5nHAWmBf0PNng7tm3/MkD0dFq
         1WGs9kZwCVCZ261E48fv95gyVD3wi93bkLxzfWFxh/eU6kMYkXpSAcDfFFD2+GWUz8rQ
         3qcV4nMbANUWSASiTx2IYTO++jA9Ban+1Qwlt85fleXwj4fOqSZyfGvaXGEUikT7OtC6
         b6yw==
X-Forwarded-Encrypted: i=1; AHgh+RoYdoG+La/y2KOnjzCGfA4t1+ZQbNstG1IBbEvPvT3ye23aB4HqM1DNiRmQDJnaJGs6ohmvitdpN0kxf0dC8Ybj@lists.infradead.org
X-Gm-Message-State: AFuF++nTVhTCfLlswg6YbIEsbVNjujNxh784z6z8zt4H3cSQTwPwODyB
	RVSJojoI9WPSG3Pn2ONpqrXQQj5SW+0uzwlmVa3wn8/abBtr3D0Q5H0zMtgYKhYd86CNU8RZ4co
	fqcohexryfsKOug==
X-Received: from wmof19.prod.google.com ([2002:a05:600c:44d3:b0:493:beda:c864])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr88157945e9.12.1787921655833;
 Fri, 28 Aug 2026 05:54:15 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:53:36 +0000
In-Reply-To: <20260828125409.1921538-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260828125409.1921538-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828125409.1921538-2-smostafa@google.com>
Subject: [PATCH 1/7] iommu/arm-smmu-v3: Ensure L2 tables are visible before L1 ptrs
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_055418_461330_FFDE534D 
X-CRM114-Status: GOOD (  10.57  )
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

Commit 6fabce53f6b9 ("iommu/arm-smmu-v3: Add a missing dma_wmb() for hitless STE update")
adds a dma_wmb() to arm_smmu_write_entry() to make sure stream tables
and context descriptors are observed first.

However, STE L1 table descriptors are configured directly
via WRITE_ONCE(), where before that they were zeroed with memset()
inside dma_direct_alloc() then written to abort in via memset() also
in arm_smmu_init_initial_stes() without a barrier in both cases which
means that the SMMUv3 can observe the allocated table before the
written descriptors causing it to fetch random data.

Similarly in arm_smmu_write_cd_l1_desc() where the L1 CD is written
after dma_alloc_coherent() with no barriers.

Add dma_wmb() in both cases.

Fixes: 48ec83bcbcf5 ("iommu/arm-smmu: Add initial driver support for ARM SMMUv3 devices")
Reported-by: Sashiko <>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5732f3ba0122..494bbfd2869f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1515,6 +1515,9 @@ static void arm_smmu_write_cd_l1_desc(struct arm_smmu_cdtab_l1 *dst,
 {
 	u64 val = (l2ptr_dma & CTXDESC_L1_DESC_L2PTR_MASK) | CTXDESC_L1_DESC_V;
 
+	/* Ensure the zero-cleared L2 table is fully visible. */
+	dma_wmb();
+
 	/* The HW has 64 bit atomicity with stores to the L2 CD table */
 	WRITE_ONCE(dst->l2ptr, cpu_to_le64(val));
 }
@@ -1804,6 +1807,9 @@ static void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
 	val |= FIELD_PREP(STRTAB_L1_DESC_SPAN, STRTAB_SPLIT + 1);
 	val |= l2ptr_dma & STRTAB_L1_DESC_L2PTR_MASK;
 
+	/* Ensure the new L2 table is fully visible. */
+	dma_wmb();
+
 	/* The HW has 64 bit atomicity with stores to the L2 STE table */
 	WRITE_ONCE(dst->l2ptr, cpu_to_le64(val));
 }
-- 
2.55.0.897.gb25b4bd76c-goog


