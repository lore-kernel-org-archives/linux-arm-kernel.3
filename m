Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3524CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 05:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8N+rFVtNdZ51dKl5Chv+doUD+ImVi+kXBB4grpnNGus=; b=vnvcv+wwlsdwLgLteJN9OvGeDh
	Z2lvHpyYzD8K6T326idgp3O8dgntFQWK8jVUdZfOLKhcOHBt0oKHkcvlMpN7UnmM8IJrGcsa7lwZU
	IKgpNVKNCqY+dmO+JBQLD4XGIKID1Mz22jSKU4xXXIP0loJVQqM7iuusZs+9duCzcT9GznRsda+sc
	0Oo7VbsfmwCeEDwklUrPFOwu1bzfVZtQ+QWbWSPWvn4NA4USfdO3tpl6fYUpMTNI1GbD3ylUkHNnK
	UqiHe9QoGdMho+GM5ILiiRdG0byuWnmVbYdT9n+Y+W9jvQ3uRGAclu51xb41G1vhxkXiQGxOySifO
	1BfsXk3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQIUN-00000009rWy-3JIe;
	Fri, 22 May 2026 05:32:03 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQIUI-00000009rVC-2Fmk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 05:32:01 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-36608b2f2dcso4390448a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 22:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779427918; x=1780032718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8N+rFVtNdZ51dKl5Chv+doUD+ImVi+kXBB4grpnNGus=;
        b=BX4AJHAX6GTrIrPufyFj487Ko6yIWuAVeU4m5qNK412lNkif0FKazUesa3BvlH9iZS
         r9Unr24v5Bbxr9FtRi0hcNvb7uZBjtqmqaOBQ5yFaivpcHzH/6bXRX03q91q6Fv6EOmw
         gh5onI5jVG/PIv+oNtnNWH7eRC8/kpzLKO1QgP2UdTkXtzXL7j+VhUhZJ7DDepW4dVKZ
         4UHYb2wCSZZ+q5i6Abv+tcKGUDDlGONBaPEDMTjYABVviD3Q5WYeroKCzj3IiwmezFVB
         nVvOtz58LhhAnLDMr8cYegoTO89fPdf2dPlDMfvmOJTdFYezw8D3+/I2EooJVgfiwoIg
         oqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779427918; x=1780032718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8N+rFVtNdZ51dKl5Chv+doUD+ImVi+kXBB4grpnNGus=;
        b=ngJqd+6GwSkQzHuz0niNLfSMqTWqU0RMyRvCwe/HdeJHV+2nbnhF1VXramgtZlV+9q
         0gyVzWVznwLKi6cVjBd/AYELXBVAwNIIvxuu4+LTaztXbWbPqOfwhG3EclzYoeb9v6xG
         j0LYNw7srEjUUzmaFXgOMBreLfYR1PHpFD7VsotNN8KLi7fgZQx4W/SDZVuQDg8TulEf
         mrfuh7ZqKX6ysEjrhop1z1yMthp5kPeGR/E0NXP2AZGWYXcMlzimmaM99r6aNeXcvNqM
         1CQNOrjPYUlTviVHbB6hBOQHGET1PCCPncNAqtcXqUN1nWyPboDmTCAnm1UUMTdfc5zw
         yJ2A==
X-Forwarded-Encrypted: i=1; AFNElJ8ZBqEWf8TjfKi+0e2Gv/pncf+9QNv2P7UQbhFmstNCQ4XZ/gqHiqwK4vdHEsaIzW+i9G6sd/G/MTw21sFDi6C/@lists.infradead.org
X-Gm-Message-State: AOJu0YyRVFF/sLf+Y7g40WcGY7vYz12aYagJAkT/FH+fuUZLO7HRnXMj
	ynBohA5fVyv026B1c2K45e8ojyYz+Kq7jMRlXuavlZcHZ28EOHcb15Im
X-Gm-Gg: Acq92OFjxbAXnsMKzr5x5tS4LWKWP1owVMc80Rib4npPnKzf//fUTYAZSHZ/aQ7a58X
	ioiwTZD1uCTXpvUEWWAKi3hVHr5CKe0BtVX7JGd6F5XS9Y+LiHoEMu/rs26G4XMO/F27uH4UtPt
	e81wy9Qud7pgNp/3jUGSzTQohyYFjnP9FPkLDlCy9BrvObdJ3a8+FkIgZDVSTwajfj3YzXSW58T
	Nod/l91m8MGYsyiIBGcHFzkJsThPW1JzN5cXiUKRpCjtxQvMuTdkxsLw37sPyhGldQEFaf6YGI4
	LBgwshDIGj+4QYqp6e7h1AHJeN4L2x0Plm4C1O3f/rHpfkrc7u8Ka8sh0Q9krUv1mCFDLBJja0o
	nsbYps3AdHArh7wR03F1oHUTqqsAZk0B13bo0XCOivyF0L/MIIsWaDC1Yfbp8OfRwIG+8wAv7Nq
	byYrhL3jXwTm0TCWj5F/qfQQPdfau/r2xc3TjjbkMB76VUeCB2NsE=
X-Received: by 2002:a17:902:db07:b0:2ba:3e50:e3f5 with SMTP id d9443c01a7336-2beb0634c8amr22954595ad.30.1779427917717;
        Thu, 21 May 2026 22:31:57 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56d68adsm4782665ad.32.2026.05.21.22.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:31:57 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: baohua@kernel.org,
	Xueyuan.chen21@gmail.com,
	dev.jain@arm.com,
	rppt@kernel.org,
	david@kernel.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org,
	jiangwen6@xiaomi.com
Subject: [PATCH v3 1/6] arm64/hugetlb: Extend batching of multiple CONT_PTE in a single PTE setup
Date: Fri, 22 May 2026 13:31:41 +0800
Message-Id: <20260522053146.83209-2-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_223200_791035_166736D5 
X-CRM114-Status: GOOD (  10.60  )
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

For sizes aligned to CONT_PTE_SIZE and smaller than PMD_SIZE,
we can batch CONT_PTE settings instead of handling them individually.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/arm64/mm/hugetlbpage.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index a42c05cf56408..c4d8b226126cb 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -110,6 +110,12 @@ static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
 		contig_ptes = CONT_PTES;
 		break;
 	default:
+		if (size > 0 && size < PMD_SIZE &&
+				IS_ALIGNED(size, CONT_PTE_SIZE)) {
+			contig_ptes = size >> PAGE_SHIFT;
+			*pgsize = PAGE_SIZE;
+			break;
+		}
 		WARN_ON(!__hugetlb_valid_size(size));
 	}
 
@@ -359,6 +365,10 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	case CONT_PTE_SIZE:
 		return pte_mkcont(entry);
 	default:
+		if (pagesize > 0 && pagesize < PMD_SIZE &&
+				IS_ALIGNED(pagesize, CONT_PTE_SIZE))
+			return pte_mkcont(entry);
+
 		break;
 	}
 	pr_warn("%s: unrecognized huge page size 0x%lx\n",
-- 
2.34.1


