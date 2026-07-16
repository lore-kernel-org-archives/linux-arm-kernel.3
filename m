Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1811DC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpVNfPM2loki1/2WSjY19UJOAg4x0MrZ4b63t+Pbr9Q=; b=bZu2BdmSZI0JDBUTfvtzM8wSwC
	T3E7V2Ymy/8Jdk8EgW1K/FCj4UPOMudPKIFUCtThvPW2I4TvM9mUIAjPzjKQgep47LyE48x7YQnI1
	e005wGN6/y4ED8AdTs/0fDijmRF4vfldbkw2YQk1ZLD2tPFQxpaRM8m2ah8bQoFFLp37JqSjFwQFJ
	lSzIUW22njJ91skU8Qz91A4ESj/HNUufLp8Jfj+UuFVgJdIUAM/IV8bGBZmfF8OaUHaUd/EoFrSd8
	srGHW1hLMa9C+Kz0OB39pGvMJhSlYzGnMoUHSGU3bQMOyi3wZtX5Gbuv9VC4lg+BAdAfZ7w39r+1K
	roiG4Q5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRP-0000000HIrP-2YPM;
	Thu, 16 Jul 2026 12:43:51 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRL-0000000HIlY-1gV8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:43:49 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84830c774a0so2549235b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 05:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205826; x=1784810626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpVNfPM2loki1/2WSjY19UJOAg4x0MrZ4b63t+Pbr9Q=;
        b=lyuLzvXdRLLhuj3d0zlhHMLxj0HW8DPPBBF7R6Jeh8ri+hWUfH1q8kX3WET4DPz3dV
         WR4beW/y/8pWRtKc06E6QMASC2Z8tkgtCnwBllF25jevxhBm4/prqmNA1bva/Lo2pop/
         GFePlMjjEbY1QgFlUEUcx1yEgcYK8hiboTnrtJC1WSXhl4kEHXPFd3/H+ODoDk6u4Nhp
         umHphZ93fZysNQctOji8wG3nijRUlkhk1pI5O6jYV2ur17pdTGaJnlhYsLRgowT+Nlx7
         wY7umP1QNrXF1agpFU76NpqI6IxvlFf/rmt1mb+GgykEfFyBFemCK7l+ZT+GdB0Q0mOU
         lFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205826; x=1784810626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpVNfPM2loki1/2WSjY19UJOAg4x0MrZ4b63t+Pbr9Q=;
        b=tU/foQzOfLSO3gTRN1Fl2gP6GxF47/7vM+0nVszqV4Dg3GjH78EHZUXmyENbvijkS6
         AL1BGtdEzghtpdeLG+BuWmdCkzK+Yhtm3YXJ+Ae43X8APATY4VBD+Kt68iJ1Cn+5W+EU
         YOP3DueQb8dQj+VBdMUmWYyky9inr7ZJCfm/dEq2gwsmsf76hgvaelJblm49O30ZDI12
         dLU4xM1P8sPv8HTTorSk0I9R2I8TpfE3z2F3zcibK+2Kt7Ir/+6qgLZpr4KecW5HkxaQ
         bgzBB5W5lnvcz8AFo3QsnByw/D6oPvNMJASw7tiK6E0++p7Dovfg2KbUDSEZA+fWc5h5
         6Wtg==
X-Forwarded-Encrypted: i=1; AHgh+Roj9ZmUeCEvLPRXRWlXTXQaMzON2F2ulTEHtPiWd7MExg2L3hIbf1EZARG1NpGb7ZfwyhP5eYN0wJY1+UDjF28k@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx1qkT7zFgjC9DLw1iqu+EYUCeXQTpVTQydSYmgjHanmSJsLfL
	K+RsXGbincQXq2K+IEoovO3BJx5gLUQF3/y1RMrivuSfc+Dv9YdIzvqIt997QPUnqsI=
X-Gm-Gg: AfdE7clYuCrL1iSEhuptoJQZLrdww8/KMv4DZ4em6weBcvr8h2RyWNGKVNEFNmfoPtH
	1UtDTXlUTgimARjVjNHptQN3OSgY/+pSom0J9lAci6bXAhdwCLoUHxFCRsz4rPEnoI8GaL1yYxv
	1S4cmgrlO7DMKMq0LVe+NpCWhv67ixgjbb/wf6DkThg/NTtns+mSdJk25ymA1aa8vuvT46npKL6
	Wqxt/nQaGm/560kNY8UwBdBakQmm2xLiS9B+ZTOmhY6X3CKlCL5/a6VQ6ZLdroDhZMlV0E/3yN3
	cY0zgDukZKYEXAvNT9ngk0GBSosTwARqRKh05HJSSa269ynuY0+rhxWAlGzW0888E2RzPmM2Yg9
	YY9ig28jKa80Bv5Ky83B0T2suIyd1wcrTskPCqceJQ8yLfdYwBheZX8n1MlDth/O3TonQ0zGIJ8
	KHQn7N27m7dvRl7/YAohn6v3s=
X-Received: by 2002:a05:6a00:451c:b0:848:2f74:d8d8 with SMTP id d2e1a72fcca58-8488986dd0bmr19929855b3a.73.1784205826475;
        Thu, 16 Jul 2026 05:43:46 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.43.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:43:45 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 07/15] riscv/mm: preserve Svnapot leaf-size semantics for page-table consumers
Date: Thu, 16 Jul 2026 20:41:42 +0800
Message-Id: <180084b20de76f7ad61641e9b7abe6d103caf5f3.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054347_442925_776274E6 
X-CRM114-Status: GOOD (  10.30  )
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

Svnapot keeps a folded 64KB mapping encoded in the page table, while the
public PTE helpers may expose a logical per-page sub-PTE view to generic
MM users. That logical view is suitable for leaf-style PTE consumers, but
it must not change the effective leaf size reported for the mapping.

Use the original page-table entry for leaf-size queries, so page-table
consumers continue to observe the Svnapot leaf size instead of incorrectly
treating a folded mapping as PAGE_SIZE entries.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index da7ffea0dcd98..e4b9c05014c00 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -580,6 +580,17 @@ static inline pte_t pte_swp_clear_soft_dirty(pte_t pte)
 					napot_cont_size(napot_cont_order(pte)) :\
 					PAGE_SIZE)
 
+#define __ptep_leaf_size __ptep_leaf_size
+static inline unsigned long __ptep_leaf_size(pmd_t pmd, pte_t *ptep, pte_t pte)
+{
+	pte_t raw_pte = READ_ONCE(*ptep);
+
+	if (pte_present_napot(raw_pte))
+		return pte_leaf_size(raw_pte);
+
+	return PAGE_SIZE;
+}
+
 void __napotpte_try_fold(struct mm_struct *mm, unsigned long addr,
 			 pte_t *ptep, pte_t pte);
 void __napotpte_try_unfold(struct mm_struct *mm, unsigned long addr,
-- 
2.39.5


