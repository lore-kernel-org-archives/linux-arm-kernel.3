Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18FAC54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hdCu1wf2k5fVGlVM7jRlnxeinlriHXvmsiXxLfmcKs=; b=q1xJ6ouXT/INPAEay45EsWF3gC
	OdUudYghFuGSyTKvW0u7F3LuqtrcG70omM3crfI7jPFd5CHw3l9rNjbnJEJC5rLIgD6uXkWjnk9rV
	ngrHwgIo3qKf/XSijPrWtjrkrbhuxXqMhGqaIXVrZDcBZmRfcrkfkOPjk1S0Ksxg3Hhbetwspep6A
	6o9unEZaR9Q92a4UJSNx7OD+s961difZw4e9Jf4AjrQVdIeB+WpumqIigsAr1xjwmGUU8QxDQ6po/
	FAZednwj53lnsiI3zLtdWSBakdwIwKTbm93iKiJmGl3mfzEWLmZzubNNPm+vS9Jd4H0MLTR7cKWGY
	sWzZ+SVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMje-00000009xYY-0kFZ;
	Thu, 30 Jul 2026 09:07:26 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMjZ-00000009xVx-02tZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 09:07:22 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38ecc48b3deso139371a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 02:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785402440; x=1786007240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5hdCu1wf2k5fVGlVM7jRlnxeinlriHXvmsiXxLfmcKs=;
        b=caAu74IRJNigOqu35P6yZo0Qsp5B6kN/JBrOXaAc1p2Y3RZRBdbpgG6MeiQD/dvGxj
         2XlvWEUu9ne+7O8Jnht4cG9x0PkCYCyKbrxND8PYV4FDWPhAxNLddKRzGle2v0wP17E1
         lHbL+v7UAf2tNrKjT3nOU2T8F2F4mSwWJ1RwcL2RUbe5TItIYnh7nKxBgO8EZzCoLg9f
         6UJYryKJ3xANgwtoGXvi1HRa47umOkQ9iMFT9Sc5FdacKdE52MEmlYKynywVkz4xtAsT
         Pe6yOt/0qQqVzDJkKy6gtYK+58xd3UBBCJJ8oRTXwV6lC966uOgyNhQOJCKHH5BiPIF5
         sx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785402440; x=1786007240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5hdCu1wf2k5fVGlVM7jRlnxeinlriHXvmsiXxLfmcKs=;
        b=JDLzM/EJTEebiWTzxyoPTBGgQ09Y5Z0/NLeaPumwuyV0KeSZcHktTTEjaH1yjrd5r4
         PPtPyrC1XLij/mqMqaEs8YuntJYYRI5CjNCuiDPcF/lHfe5+uMMWakw8SVkCLqwgx/sS
         AhBdE7LbgHYLfM+AAI4KH4ZeBSfRgTNxTBM5qarzcNej17grW+pLvxvOVGtzL7paZZ6l
         ln8FYyI1DEdleVZuSdQxZpOuCDfahlLTaRGap2Crqe+f06tkWNGtXDfvmloszIfbGodg
         rW8gtzxR1u+6p1qZ/olqyPSEF5YMt1YS8oTKF1uz3mqv/e7aXRLYrTk0tnw7Jfns5rFb
         Ex6g==
X-Forwarded-Encrypted: i=1; AHgh+Ro+r77hvZNvzdXF561tHhHl/I/FwSWPxng5EKGXqP5xVyAaNTnAoYsMfIpjBSfzMCW+cvucKOSLPuP9/47rq4jo@lists.infradead.org
X-Gm-Message-State: AOJu0YyY0SZjKQbumbzIfrUvaRVgix47prT53tXcQr8ND1UOoul8K1wA
	cHDVKguVEnpfosGhZ78OI50qD2M4f3BODKQ9VCFsUyuSUCwAo/oUKWex
X-Gm-Gg: AR+sD11NDhRoweynDfQw5f3bQDaqqLey+cfoKqs+a9m8mNywVC/0Gnp+zUW/H02bGK2
	GazRY2OjwFMGB80X6i0YdKsbJLFu0+K/cQCir5nwX8xHUcx4ysz4OzxCvWoTlC1bi1IBF715kzW
	2KPqSZ4pfU4U8RdV7UJgLhJ6k5xD//uJbk72FODc+h0s68N/xlTSP0NFM7ooE3DGkh1kyOip8r7
	EOhln5MSdUxYOlDq7VqM98dMLmlAAyYCXPLHqtNtHUMvopOYpJ9JvWkI96XAGVhVuvxEkgqnvcI
	WImBaMc9T5saWj8VUwK4W5Tw8OmyasxsS3q0Iwehnve77ilu5N3H0Ecsvba9HqPeqhgMckY5NjU
	i2fNOUgln0p9vAgEaVInESU1XTsJrRdgFiNHQ80S+4ACxcxGdRwP475gFGsjKtY/NvCuLTsgNdu
	Ym1n/WXIB3BpRj7sxwDP5XyXFh9RJ+IGzMtNfDAum9dn8T3L7EFnzY+NISwrkUqvj2PdNcraXTG
	wOoMMp9yHfogj2A90Hc2GmvKTDXP2Lo67pT8e+FiaWW/iwrqAEh
X-Received: by 2002:a17:90b:1c03:b0:381:2788:a437 with SMTP id 98e67ed59e1d1-38f9bcf6724mr2133282a91.1.1785402440025;
        Thu, 30 Jul 2026 02:07:20 -0700 (PDT)
Received: from debian.lan ([155.117.85.23])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba447107sm1902510a12.21.2026.07.30.02.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:07:19 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	usama.arif@linux.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	ziy@nvidia.com,
	baohua@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Xueyuan Chen <xueyuan.chen21@gmail.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v6 3/3] x86/mm: add set_direct_map_ro_noflush()
Date: Thu, 30 Jul 2026 17:06:47 +0800
Message-ID: <20260730090647.2401252-4-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730090647.2401252-1-xueyuan.chen21@gmail.com>
References: <20260730090647.2401252-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_020721_780148_B456D53C 
X-CRM114-Status: GOOD (  10.93  )
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


