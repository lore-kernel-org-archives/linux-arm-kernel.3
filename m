Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B47C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 14:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hdCu1wf2k5fVGlVM7jRlnxeinlriHXvmsiXxLfmcKs=; b=xJr3E/vvS7l8khzSiWpDssmB6P
	ukl9UnPltSiEV29J0uYYXurTvNVUU5jFtSJmv4tkPk7asNhWFcQObM5+NJJnm425AEpiuAaKDVjU0
	NWP4K3ZFAbrsJjv1coRC+qg+ZPaz5fOUMstf/GUv0RIBSZ2wiTYNTZVxkt3hofv46x9ypdLWGM9XW
	G84T4bBrDhFXF/WJxG+sSz1RR0oS5l2IZpc1nX1OMZVC84KlSDFyFFO8G7ruNAI/PMJ/qRdzDVsDB
	7ld8JaSz1viXmBcm1I0X3enAO1ANKVXqfIQZTZL3QFPLFwvmixmXOxk7TId2dv9ndROwHzHKrFZ2J
	CKwB4FWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMQd-000000030bn-3oIY;
	Mon, 27 Jul 2026 14:35:39 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMQX-000000030Yw-3qlA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 14:35:35 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cb20b0a387bso384025a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 07:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785162933; x=1785767733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5hdCu1wf2k5fVGlVM7jRlnxeinlriHXvmsiXxLfmcKs=;
        b=EsHtNPDW5rwC57Rvx0T6balRPK3Z2Gh7i3XeLnh4EU/urUbDOQ8lu5+bpMQhbXZaK+
         JrIahNAoPVpnedG6AQpmWc25HM1689j8z9tbYeGoW3bTOfHR3XoFdQ8/J5ilty6NWkPW
         q0pFyFPIGi82UoUcgDCp+TicnECd2l78MBCrRIISu0nhtmqsb2QDX0gn2aLQVKAkix8v
         nazSGFZk1IQQONhFbe/uLwdQzNkSJ6nfl040BCKn+wIsvIc3hTxtJUqvxpRVbHPMRdkc
         RapO5/0Q7ijmWPJIcPpla9ybt17aU4KtWjBUip6DF+/j24PQ8ekcQm++I0MmBuMIAY4e
         6DLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162933; x=1785767733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5hdCu1wf2k5fVGlVM7jRlnxeinlriHXvmsiXxLfmcKs=;
        b=phHMgCQMO1eHxdINDk4AwCS9Jvq74e6B5H5MuviJmSkhw3gl3oY4bvVWBAnSOhI57N
         pYWE4xMJsdt0G4lSoPyzknPxMfBh9yp88I/H+3Tt/d2ni7+amt7Gz5OUp9zHW5iibNod
         9rp42vHXNjRTDzgq1U8hfrfcKzMLxN7VV05YvSX1Inq08QQ+nZqaQD8O9Sk3boiLmV7T
         jlYohjVzd6MLUS30iAvQ7+/uniywvqZwjv75uDbSK2jGoKMScBJnd7UUERHENogTKABw
         vtZg2Iq28gEQUHJtV3Rbrtmb1rosYSB0Mykb3EVQnMJuUYY5ZokPwT3v5ZKF3dJBjhef
         AACQ==
X-Forwarded-Encrypted: i=1; AHgh+RppgMKaau+g4uaH7KqT/plYL5U/cQ07FjZ+/x9eXbhtALEkKripPYw0dRQNXyb/s4iGnWltEtgq2cXFcX2DG0br@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5tq1jL1lOcu+xOT8YyhDuQK4x+PL3hTOXAfSxtRyb2CQqqNZj
	NsQu2sD2vbPV0MMvjwCh7edej4bRmDu/YfgzMx3YNyDdsoeY6TCxkh+oaNfunHMIpuUMWHRb
X-Gm-Gg: AR+sD125rGjZHpn/+I4CrCejQnEr0fpXRt9xM+shyGhM1gp7NzAWYXKZFkU4WAaNCSU
	5Td2lRcJ+La9fEGcVmzB6Xti737Rf+lod8dBSesOECTOX8YAJqDcQPoHGZDcPgolSJgH37VzDMc
	gSK0GXrxgTak5BNln/XzVavQ93+YWRYrzF6WGzTmO2Nk39SWr0HNt3IJ87WSsC8/bxNHn/RGs4O
	5np1NJZGs0cnsai3za4CGca7wlQ2rquOlZN19dcdVbh7Gh6I3A3gZ2f3B27CoKV/MMdb7jXtpLA
	pMQmT81BTxs+lP40J/n0I4giQjRfg4uiUXeubFpTmXaGmiFPIv7lAAG8v7FZ/3j53GtvqvBBmbq
	Dx7J5KPy7MC0vf+B95TlnD/CAZYUp94lhXAhFa0cWaqk2uuKeJgzIf8Sh8eLG9YulF3XxmNlY2X
	YOlgy591j43BKEpM0d82nkcBt0d7+9d1OesXarzLGsjdv7NJaVKrF6nS19wrXHITR+
X-Received: by 2002:a17:903:1aee:b0:2cf:7dfa:7f56 with SMTP id d9443c01a7336-2d00b485487mr3911605ad.2.1785162932832;
        Mon, 27 Jul 2026 07:35:32 -0700 (PDT)
Received: from debian.lan ([141.11.42.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7d5297sm36877485ad.56.2026.07.27.07.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:35:32 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	jannh@google.com,
	yang@os.amperecomputing.com,
	rppt@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org
Subject: [PATCH v5 3/3] x86/mm: add set_direct_map_ro_noflush()
Date: Mon, 27 Jul 2026 22:34:26 +0800
Message-ID: <20260727143426.1077133-4-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727143426.1077133-1-xueyuan.chen21@gmail.com>
References: <20260727143426.1077133-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_073533_964734_25833B8A 
X-CRM114-Status: GOOD (  11.24  )
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

Implement set_direct_map_ro_noflush() for x86 using CPA directly on the
passed direct-map address. Clear _PAGE_RW and _PAGE_DIRTY, keep alias
checks disabled like the existing direct-map _noflush helpers, and leave
TLB invalidation to the caller.

Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/x86/include/asm/set_memory.h |  2 ++
 arch/x86/mm/pat/set_memory.c      | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index 4362c26aa992..bd3817e06052 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -89,6 +89,8 @@ int set_pages_rw(struct page *page, int numpages);
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
+int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages);
+#define set_direct_map_ro_noflush set_direct_map_ro_noflush
 bool kernel_page_present(struct page *page);
 
 extern int kernel_set_to_readonly;
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index d023a40a1e03..5987f4c84f6f 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2662,6 +2662,21 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 	return __set_pages_np(page, nr);
 }
 
+int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages)
+{
+	unsigned long tempaddr = (unsigned long)addr;
+	struct cpa_data cpa = {
+		.vaddr = &tempaddr,
+		.pgd = NULL,
+		.numpages = nr_pages,
+		.mask_set = __pgprot(0),
+		.mask_clr = __pgprot(_PAGE_RW | _PAGE_DIRTY),
+		.flags = CPA_NO_CHECK_ALIAS,
+	};
+
+	return __change_page_attr_set_clr(&cpa, 1);
+}
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
-- 
2.47.3


