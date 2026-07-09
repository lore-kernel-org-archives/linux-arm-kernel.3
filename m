Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFABC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRIH/DXqtVKHJcgPpKlveFGh9fP942OgvH3RGS2tsDs=; b=Rtu9BT2tqGssCSM3OrIV0pLSNb
	kDVkum4KAEeP02sh34vnTJMtTQv+WDIN0ufUpDy91ndd+8ambhj+jPwCHmG+x9Bq87w3RJsdla9XN
	+U3VqO/Gr3VMvXZjDWlqsph7tcvhIRSrnRFB1xrUFFdBH2wKMTQPS4EqgrD3DjuFFY52pSDcHBwIx
	8CxAzMd1t98qiPUtWv20Bdd6n9Jg3zXldf0oWsHZ3Hk8yKMMx2bSdr7W8k4X76Uqo4XxlTXVGNzCo
	0WnHqc3lvd0Z6ORJcqAI6KR0xKIsTzxc1vhwICrkLrDJJpk8L0brJdmxwBxbKijadg/joGH5m9ZTV
	AuetRsRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjLH-00000001K1r-2L7u;
	Thu, 09 Jul 2026 07:38:43 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjLF-00000001K0z-1Nt2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 07:38:42 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-847a52edeb2so1343232b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 00:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783582720; x=1784187520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRIH/DXqtVKHJcgPpKlveFGh9fP942OgvH3RGS2tsDs=;
        b=ej9tZ6ZsXq4WEJlLCcyNB1mCHnfNr5p7Xt3nd4SFPaCaZ0I/n4hW/fy0n/t7BelBbu
         Pewp6Jna21igu0xsUrM0Szr4bsXbLq6ohCTfIIV/0wT1Z5IkLH2AsrqYoulD3+h0LvGn
         ZBQ6JjVu4rItxi6SHI5LaIT+Zg21v/cycD5KnaMykvXd6VRkNJHv6ZVFHcGxvFcWyMKp
         uj/uOtiM4pQFVMrqE31CCZSleqO/GSfSawh1S3iTIeH4gUevD9Oe4A2Da0XQXGu8StPZ
         pBNv0TnqFDCeoi3cYP/Xv3To17R8IF6e/UDv663Ukk/O73JBwAKSh76l/QvRu1YURTep
         GSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582720; x=1784187520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MRIH/DXqtVKHJcgPpKlveFGh9fP942OgvH3RGS2tsDs=;
        b=epeS+8Kyqi54aPDRQbyyz6zokJTJrP3QL27jMbrneMeT/qxUiYqXNSv3yHR3KwJMXG
         ZMY6mFOUKymqqDadOdRyj0KRcd5n9w6+PIw2ATE+EIcQ508raUq1JE7fJyogKVZ8HqXh
         AHjv2bplMvKRSjY/A2hXyyXQzR/DI735SSGk2x+w+Jpmqp0o3zpXPK+/a5y2P59lQ2Ug
         5DwPcCVcxuMw5c4rmN7luKIfZhI7P3v+Tt6jf2XRhW6VvDafF1HSOsCFeUV67fOcjluq
         /FkLlAk1YeYJkaxmoB9qI6hcQ+7ubLvy6O/eORvD5bGABwDhIFcwqOM1S6Edc5y5SxEZ
         +jWg==
X-Forwarded-Encrypted: i=1; AHgh+Rqo33q0iFTRAXNsYKuwialsDLYQwIAX9GXkd5R3XYsnXXPytm1PLuzwaA+PQ1J+aGY78SJuLklJJ0vVZlMSn20f@lists.infradead.org
X-Gm-Message-State: AOJu0YyjmrtvoU1wUJZVu5yJZc5xzE8F5peIVDMuStcd6DjBMcgPlcsd
	lsQo/Ak60y9PKHoTxYJUhUWBWxduu6wbxq19CST9jlhxsIzS5nrIyZEM
X-Gm-Gg: AfdE7ckyaXl/c15r4GhX6tlgXuyG1fad4PQDFRmgDrKT+lBMEWq9Q6xuGMuSe8wfZGj
	lxF7+Q/Q+POyZWW3ivq+DUsY0JOXW4MfRGJnxxRK6KC5gcEKK/+0KqJKt0EiNiEe0C5IiNNJzFv
	6cmuAr85Vjbmr1KOTAZx8cgEiEeBquBSUQExDDrriog035dg39HOneDo69DKp7OGT8bPHKDxgGe
	P1+irH86biw7mxQwZGA4ycCN3detPdJAsQKiXwUVwIjWcwdie+jrU8TMo8xm0p6N6TX+O5adCCc
	/WT2UJ9g7I3pF0A+B3eqRLUqDnAH1/hId54ckKzmM9NAco+uf8RAADNaJDmawsIgXQRHxRR/5rp
	nAIa0KASTEjzXDcAbRd0w76btUOXOsHqJSeiXokgDOKu/2L52mVZ67bbfwhCJc5/zxuxf6d8Za5
	duled0IC0BBKeCcD/6x6MY+rotCwqZuBa1kwI=
X-Received: by 2002:a05:6a20:ad98:b0:3ba:cd5b:3dd1 with SMTP id adf61e73a8af0-3c0bcf5d7f4mr7000339637.33.1783582720482;
        Thu, 09 Jul 2026 00:38:40 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162a49sm3334902a12.15.2026.07.09.00.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:38:40 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>,
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>,
	Leo Yan <leo.yan@arm.com>
Subject: [PATCH v6 1/6] arm64/hugetlb: Extend batching of multiple CONT_PTE in a single PTE setup
Date: Thu,  9 Jul 2026 15:38:18 +0800
Message-Id: <20260709073823.6643-2-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709073823.6643-1-jiangwen6@xiaomi.com>
References: <20260709073823.6643-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_003841_407051_4A830332 
X-CRM114-Status: GOOD (  10.41  )
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
we can handle CONT_PTE_SIZE groups together.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/mm/hugetlbpage.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index a42c05cf56408..0da746f729388 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -110,6 +110,12 @@ static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
 		contig_ptes = CONT_PTES;
 		break;
 	default:
+		if (size > 0 && size < PMD_SIZE &&
+				IS_ALIGNED(size, CONT_PTE_SIZE)) {
+			*pgsize = PAGE_SIZE;
+			contig_ptes = size >> PAGE_SHIFT;
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


