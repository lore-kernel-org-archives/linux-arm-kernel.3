Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEF5C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvYNwuZspYmqJYkW4Kvv5dJobx9eOS6NsDNgvr2VGvU=; b=iI782cDXI/s5LQdRbbOuFTu0g9
	Ln0tj+zzMXJIepXcDEUQsLK+Z4CQcFW1iI6nApZY6xrQb/5G3/KuN8ktRExWAyveDvazHbBm2te1v
	7FaN1q+SXG2f6pEEJHd952QqAcQq1xbR/XwmNYMWLRTmTQ86m1TQQ1o0q8mAJDSmIDwUZQeXRDpcW
	HEi/mkd/3gIa9clKKJJZv9WrfEZkkYPQmLRI5vR6SgmBNj6o4+kBxRquKQmQGJ+db2EhQrsToyCl+
	90J4ShefLBSk3h8slxdSe772mAXAQ10xYNzWAt3crhvRQwL/f0uIXZF1uAl+n2EADV/sqP3JjJZz2
	Kub5ngug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fFn-0000000AVpp-0zok;
	Thu, 24 Sep 2026 08:56:31 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fFk-0000000AVoe-1RqZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:56:29 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-487038a4a88so809624f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 01:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790240186; x=1790844986; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gvYNwuZspYmqJYkW4Kvv5dJobx9eOS6NsDNgvr2VGvU=;
        b=bxpd2vHinppcrNZzAdwVjq67w+SRWhH+Y9jGkC7HVXc+EErzi3nuXHlFcuJb/mn1K8
         x7oS8J50mteqVtFxVdcCmeTAK4v52YEGjYifBlHqA9b7dLjAJSHxWFkAkWQIumvWfUqn
         ZcCtJayjr6NJQKwEQbVk93wt8shMTTle+S54iNllof7sz3SiDJexMAq+uwbbHQo60Zo7
         ZLiKk8ES8hX4mRHywLTa7k1EiHRsgNNkyEoPsHrQRwMl8Cg+6gES/OGRrzpwvynuOO8J
         MLDRaA2Mch7/oinN2Ch99AJsHSWz+lcXq6wuNbJiM0MYHyFDyU6fnz2L4eMpJK3j5YyQ
         XekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240186; x=1790844986;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gvYNwuZspYmqJYkW4Kvv5dJobx9eOS6NsDNgvr2VGvU=;
        b=KBtq5e3+2BIyFFluLJi6UFuLJWz5axgegk+ETBs/2tMLtKtju4mV+qo3Z/lY68mosP
         ZrL9g5M7S3+l4/6dLjnD58PRlgGnB+bwvqJ395SO/Tvm/hcEpXAHIIr5W4rpCN2HSy96
         rjzYQc0zQwryepx4SolfFAesG4ZnupEui6wCdlUdmZBK187WRGjUw914mNAfChp38fhe
         +zkFjA8BFmyEEXafYJ4nUbFun5ln595BR+SsWJOhJPTPP2zQy7KwAsKp40/RppHh+E/x
         uGI/Bk5Ih+5xUFi/mc2R9n5O35h9FK/Wup0fDDwUuD9QCypepmfdX8A2r2WgoUwoMDI4
         rBlw==
X-Forwarded-Encrypted: i=1; AKwUvBxCFjAm+l8g2D3pgNof3v8yF33tWXmkUvCRRRr+gS/+74DMC6ulfXhFekrQ8ZIhY/63cwHKKBGiqwNkicJJJAXG@lists.infradead.org
X-Gm-Message-State: AFuF++njO88mwKPQPE+yXHGXwikKwy0NstIHCNyPmsNgQQaqyOZfUzay
	4Epn0ugMnatM/IeaRftscbVBNphdnX/tVxdYrY1lhaFQw5+WdZ09BO0wGmGeYcokthK5tGAP1nN
	1FV+DjL9CmXDWGQ==
X-Received: from wrbft16.prod.google.com ([2002:a05:6000:2b10:b0:47f:74c9:84ee])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:310a:b0:486:f980:2367 with SMTP id ffacd0b85a97d-488716aaa53mr3150067f8f.48.1790240185585;
 Thu, 24 Sep 2026 01:56:25 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:56:12 +0000
In-Reply-To: <20260924085616.300650-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260924085616.300650-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924085616.300650-2-smostafa@google.com>
Subject: [PATCH v2 1/5] iommu/arm-smmu-v3: Ensure L2 tables are visible before
 L1 ptrs
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_015628_403535_57D6AF8D 
X-CRM114-Status: GOOD (  10.92  )
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
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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
2.56.0.rc1.315.gc6ed9934b7-goog


