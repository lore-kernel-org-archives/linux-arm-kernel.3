Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C2DCE8E92
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsCpK9EL3WBrTQl/LxYwj8dMuww/QQmOZNLTkcqzgvw=; b=23FiRNn+uEW//eqYcJ/Lhc170j
	A25Pa7eeX04L7TgXz+tUjdGeTtnJMyKIXVtHDrp9iUmppJQkCHQ4XkTR1sXKgME2A94ZQqYgFVRXy
	cLSv7doF8JmthdsTLmQQHztPkua1h2K0lZRh0MAxB7vS4OfwANqnGp+BmnuyKmMBUbcUxNSCrEM3N
	dz/PnX9ioJObJHfu53+8VP2gtBZ/V+nsdzER872hTsjX1f59MggZOHyMn5FMReFbqZ8GqMyJ48gfw
	v3tKywJ+knlAvGidxRbKkaqi0dLHdPfF1LAIzs6Oc9BmUUy2Zrhi3rVMSAuVTOdjaE52p1Q5INgjP
	KkkSju1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40m3-000000016g6-2Yef;
	Thu, 24 Oct 2024 16:33:23 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40ee-000000015CQ-1OzZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:25:45 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43159c07193so11276865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 09:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729787142; x=1730391942; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UsCpK9EL3WBrTQl/LxYwj8dMuww/QQmOZNLTkcqzgvw=;
        b=MXhgbB6PEIXCh4ZU7k8LCyCrdhx3m0HodS2f12Yd6MyuRRk5tej3SQ+7JBpC30h5sD
         /V3wALi4C3re36NskgaRF3AwYRhOA1OzlYnRPmGILapJkglRSpuVsuKfgnYZ8/6dqZOW
         iYgU21fZGWuGm3suMNI3nUSNJ9JmkknHutAf2aB4hxFxmffEFvGr00fwCOnAS0SVITo4
         9s8D46QWeRBfxvgTD9Ryt1nVRS4alNDhm5XF5qDnRx9gysy9P38vmkpnHdEl3TIndEl6
         ljPY57zVM/PtYZf/Chl3PxT0j8D6urVhQbbzwdqDs4IyVfV2fM+LzVYugiNm0zRw4ccg
         8rBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729787142; x=1730391942;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UsCpK9EL3WBrTQl/LxYwj8dMuww/QQmOZNLTkcqzgvw=;
        b=BO/3ygNa1II4uBGGPtOIcYSu8uvwPdD2prKNwH9lXku1731PA8HnLc0xmmyrXmKipa
         m9OrAOz4RECWWRESXzReRzlGHUXWO7i1Xb4iNxTj2pBrNJ4HrGQseakjsKmlRTkBWa3w
         J05ZcvDMW6hzhGYBLuh7e8gaOCwWmSww5VI16flsU7edmzmG0PBMvsSjB4UYVBnZCHEB
         gFcb2MNaW58f31tebZ+lPQcHW6oOxVMWv9YRdombBcMri3CydiMiqQcVrsy1ejB+RSjB
         bz5/zK3ADobc40dlXoPFqJX22466ZttvlAATJLFPXdSydm4N0RrgL0trRPS1TiPdeFNL
         KpCg==
X-Forwarded-Encrypted: i=1; AJvYcCUGe8pfZC8R+zUQTmsFrdK3kft7M5iD1GF7b4ITrSaCWJikATGU7ux0oic9iCQBjcNx2OmoYwN+NnFe5xP8Sru/@lists.infradead.org
X-Gm-Message-State: AOJu0YzvZQMGv1/n2lKmuayfWFFfyEdIyg6Dche+K931KMW77Ug51aU2
	KGdlfm1aAljZctS5TCMgrHh6X6c5y/vrA5L546hKtXuba/0C0IvuhJvRMItUde2m3aYd5uIZYek
	iBH2a8DKGPQ==
X-Google-Smtp-Source: AGHT+IG9pePnfv6Q2uIrCeDhwlQCCiK/QZZKTazhUEbVv0rozU2r0vhyS6+O/NBsXh3MroRlMS7z8qAoBEUUYg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:6b6c:b0:42c:a585:5ec3 with SMTP
 id 5b1f17b1804b1-4318c72bd26mr65625e9.4.1729787141740; Thu, 24 Oct 2024
 09:25:41 -0700 (PDT)
Date: Thu, 24 Oct 2024 16:25:16 +0000
In-Reply-To: <20241024162516.2005652-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241024162516.2005652-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241024162516.2005652-3-smostafa@google.com>
Subject: [PATCH 2/2] iommu/io-pgtable-arm: Add self test for the last page in
 the IAS
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_092544_403048_0D5A7E92 
X-CRM114-Status: GOOD (  13.18  )
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

Add a case in the selftests that can detect some bugs with concatenated
page tables, where it maps the biggest supported page size at the end of
the IAS, this test would fail without the previous fix.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 3ecbc024e440..71e8046671a4 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -1393,6 +1393,23 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 			iova += SZ_1G;
 		}
 
+		/*
+		 * Map/unmap the last largest supported page of the IAS, this can
+		 * trigger corner cases in the concatednated page tables.
+		 */
+		mapped = 0;
+		size = 1UL << __fls(cfg->pgsize_bitmap);
+		iova = (1UL << cfg->ias) - size;
+		if (ops->map_pages(ops, iova, iova, size, 1,
+				   IOMMU_READ | IOMMU_WRITE |
+				   IOMMU_NOEXEC | IOMMU_CACHE,
+				   GFP_KERNEL, &mapped))
+			return __FAIL(ops, i);
+		if (mapped != size)
+			return __FAIL(ops, i);
+		if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
+			return __FAIL(ops, i);
+
 		free_io_pgtable_ops(ops);
 	}
 
-- 
2.47.0.105.g07ac214952-goog


