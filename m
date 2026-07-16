Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6086C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MW3VkNC58mnWKcn8BtrFop2mUDTlw3bfVwg/aYM+yrM=; b=EucSv+KSZbiok0HY9jvo1xuxAc
	H0zJr3fcEaJiNxbMhDIoam3UKn1IxEO8/VNr9UVTtvnD+QDZ/54t9Jl/2fP8vDR+X51JzuW3nuN7k
	hg9Cxv5O7o3iP80j/Pv+2Vjr/o5jGjCeTWWZpI+zs6ZQUIvKTA8PD3P7XP1kHC6mLD9QxDbkriUQq
	YaqpFrwl13BD3KICqjeILEhSSaZnlSQrW5UqGi8aP4XpYdRcSlyXkWSx4+IKdigYrTihQzJaNblU1
	l5Ge18UGISMZIly5eoWluSSEG6SKybyVh91tKqN3mkHnxXsSrKOMeMob5wU3E2t+1z1jj5S2hfOLO
	LbhmdGUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLS0-0000000HJeT-11Wc;
	Thu, 16 Jul 2026 12:44:28 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRv-0000000HJYk-3m2x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:44:27 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-848593533cbso3358420b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 05:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205863; x=1784810663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MW3VkNC58mnWKcn8BtrFop2mUDTlw3bfVwg/aYM+yrM=;
        b=I/I2ivd63Cm998WrNygaFsbuokYI75uuARjFE123bNhex8aElOjpT+Kd4JbqRMza+u
         CkL331yE8OyYgY/d5lCYycVA+BymqBlxT5PyUrOriOURns3K8OiSmsPbnTto9stMZY9H
         /kOp4UaSSTeSQLIffB2yLtgXkGxz91n3dZlfJeSjmXO60mYAGHB1JVZCIlfWEaYa0qg5
         t3UbeZd3MKPlOG43jWc/q+oEV51jMh40h4WWuq58hfwRW2Jp7oe7OhD6NvNXUK7F0fcO
         P8KgMg+1oZGzT/EXMwaBgESiire0kScwjFDAo4oBuJ/Iv8cJAp47d8vcvARoiGeN8fn2
         koJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205863; x=1784810663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MW3VkNC58mnWKcn8BtrFop2mUDTlw3bfVwg/aYM+yrM=;
        b=IIJxs39REKYR5vobkXaYJfvYiAh9Dyn5JFu1fLHpyK32KO4ADJbHoiVMLj8U/LajYg
         4NE9q+s7LxBbtst88moe5W284rJ5WgaaKUnnAtZ7e/GKiPahwAiO0qmMk7qVcUMzBnAY
         Hf4um8E/i7zIuEVt9PH+FXt/byWWBM6vCnvnVLzGBccI0qj2bJMFli6qQeOjJIbYCnXW
         TqwILye3XlEJFAilzYfUt6bh/JsAODn1fBlN/YRAvy7IGzFxHXC9BVgXdn/mDRRpv/L0
         l9Aos+Buk9zMt0vg69Ug6KWdololbOEYFv7eB3tCcExhNzYv7OxS8hErbBnvMIiPhomq
         gfaw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3fH8Gc6GeYBI7JVY1vY5Ju5TzrhCgxTg8zJiqTg/lUr0vaR8OwN78TqKK4cKZD/5e/pFRyNvkyAEZ4j7YLsau@lists.infradead.org
X-Gm-Message-State: AOJu0YxGTzyTsY8W/609BHir6eS3+69CtXKx2TD6rMnnuhTdnLhSVSBw
	NVPwXjz4rUl3tbSJaWXPDsZNyGx6P740Hy16nVyDMJ2pFAJCALve0c1FHK5ssIaQM0s=
X-Gm-Gg: AfdE7clSWejr/eJ61o+6BNyS39ks19msvlGRDBy+/kekKNvtTUAH4xt/cecxreE2hDA
	+sOZfnYzfmSLsD6aMSYo+BASQqj6nzyZQeBwrKCvQIEDz8eEJWYdN6p7OIw79khzqZKqCfdACuR
	KUUr89j54k0eiyn167WcRQK5iX5fNpbWjvP9xyZmbcCc4xueAVtKjBYqTuClax+GKHZotRwphdr
	tsAg9a6Tf3RWanz+GLGW0cWGfgilh0eH3sLuqbLU30uTXiM92IVwgkp8C1QOssVjgi1C6iIKwXA
	/U2UmJaOAEUyNdi/ST3btmgp70RpcK6R8UpZIJvC19NnFkbCdOYunWFg1CABomPB99L6qCXvQ2+
	yizMlaKxPUlxSwI1WpB8HnkRE8NHos++moygNRGdNNPgzVfHZWRdReQMJvZftqGaXr46IuKMuUT
	OvwlV1h0E0ARHOGpZdUiAAAZE=
X-Received: by 2002:a05:6a00:4c98:b0:848:4b27:36ce with SMTP id d2e1a72fcca58-84a673c79a1mr6078389b3a.73.1784205863094;
        Thu, 16 Jul 2026 05:44:23 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.44.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:44:21 -0700 (PDT)
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
Subject: [PATCH v2 11/15] riscv: mm: avoid Svnapot A/D aggregation in fast-GUP
Date: Thu, 16 Jul 2026 20:41:46 +0800
Message-Id: <95699db9c9b90fd1f95310e9d95b000eb8cfc616.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054424_019910_C9DFDA2D 
X-CRM114-Status: GOOD (  11.39  )
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

fast-GUP only needs the PTE state for the current virtual address and
revalidates the raw PTE after pinning the page. It does not consume the
block-wide accessed/dirty aggregation provided by the public Svnapot
lockless getter.

Override the fast-GUP PTE helpers to translate a NAPOT PTE into the
current sub-PTE without scanning the whole NAPOT block. Keep the public
ptep_get_lockless() semantics unchanged for other lockless users.

With 64K THP enabled in always mode, fio 4K random direct read
throughput improves by about 10% over the previous implementation on the
same system, from 2.615M to 2.874M IOPS and from 9.97GiB/s to 11.0GiB/s,
while average clat drops from 95.54 usec to 86.97 usec.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 20 ++++++++++++++++++++
 arch/riscv/mm/contpte.c          |  9 +++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index dd56c20a817bb..3727c148fa0fc 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -597,6 +597,7 @@ void __napotpte_try_unfold(struct mm_struct *mm, unsigned long addr,
 			   pte_t *ptep, pte_t pte);
 pte_t napotpte_ptep_get(pte_t *ptep, pte_t orig_pte);
 pte_t napotpte_ptep_get_lockless(pte_t *ptep);
+pte_t napotpte_ptep_get_gup_fast(pte_t *ptep, pte_t orig_pte);
 void napotpte_set_ptes(struct mm_struct *mm, unsigned long addr,
 		       pte_t *ptep, pte_t pte, unsigned int nr);
 void napotpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
@@ -956,6 +957,25 @@ static inline pte_t ptep_get_lockless(pte_t *ptep)
 	return napotpte_ptep_get_lockless(ptep);
 }
 
+#define gup_ptep_get_lockless gup_ptep_get_lockless
+static inline pte_t gup_ptep_get_lockless(pte_t *ptep, pte_t *rawp)
+{
+	pte_t pte = __ptep_get_lockless(ptep);
+
+	*rawp = pte;
+
+	if (likely(!pte_present_napot(pte)))
+		return pte;
+
+	return napotpte_ptep_get_gup_fast(ptep, pte);
+}
+
+#define gup_ptep_revalidate gup_ptep_revalidate
+static inline bool gup_ptep_revalidate(pte_t *ptep, pte_t raw_pte)
+{
+	return pte_val(raw_pte) == pte_val(__ptep_get_lockless(ptep));
+}
+
 #define set_ptes set_ptes
 static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 			    pte_t *ptep, pte_t pteval, unsigned int nr)
diff --git a/arch/riscv/mm/contpte.c b/arch/riscv/mm/contpte.c
index 0f66426b0ecfd..b0b8ff0aade3a 100644
--- a/arch/riscv/mm/contpte.c
+++ b/arch/riscv/mm/contpte.c
@@ -413,6 +413,15 @@ pte_t napotpte_ptep_get_lockless(pte_t *orig_ptep)
 }
 EXPORT_SYMBOL(napotpte_ptep_get_lockless);
 
+pte_t napotpte_ptep_get_gup_fast(pte_t *orig_ptep, pte_t orig_pte)
+{
+	if (!napot_hw_supported() || !pte_present_napot(orig_pte))
+		return orig_pte;
+
+	return napotpte_subpte(orig_ptep, orig_pte);
+}
+EXPORT_SYMBOL(napotpte_ptep_get_gup_fast);
+
 unsigned int napotpte_pte_batch_hint_from_pte(pte_t *ptep, pte_t orig_pte,
 					      fpb_t flags)
 {
-- 
2.39.5


