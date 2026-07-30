Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C346C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObdtBSjlBwpgFGsbg/wrosB7LM91UtGEZki+/E5+WZ0=; b=oNBF2uti9+Cki32+evmYifY3Ua
	iO4ySatiFnwUo3+KJgMmE17XJw6qsgswfnqKDELPeKxZ3+m5hpjmuTipXVHLh2wP+xv5QXmvENczW
	Qj/la8GAgpQAm0/mxVX3gWjMSPhqDvZ9RATpAFbrCt8Zo6N8ByrMC4hDo2L8fDdw1rhCHlW3Re+dm
	0hcWQCYeGv+fmGj+HokvhkJ0eFmzhyBJQPDIwz+BPdJTT/fw5dMa9znQyD5YeUuxPEeU6kwjGvO2v
	alJ1NpmVJKZXVJkf6qQR9Zr/9PnDu1wToTHZXbPVC7n+F5G6A1J0JkjonrLWL3ocgzzUqHiituw6I
	K1fSLFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMjW-00000009xUJ-0G6g;
	Thu, 30 Jul 2026 09:07:18 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMjR-00000009xSP-3bq2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 09:07:14 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8485ab7c382so293384b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785402433; x=1786007233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObdtBSjlBwpgFGsbg/wrosB7LM91UtGEZki+/E5+WZ0=;
        b=Df5r+XLw9pko1DFgthQ5ZChHiyfF7zNAvNy2JKOuw9NaQPwTAOaqGRIy1hHxHGovzc
         1k9rXS8QTUtt+KpSvjVQny3kW/7TQUaKJdF4xhSoblAIIst1krgjs7VuPlQ3y6wgIrz+
         etr4FpZIH7UKeaVvju3AY/QzqwHdW5yu9SryQYGO4V4pWtVsXCTjPTtL/W+nm/iy1B7R
         1ACpGhaFdCI+XhrNzUyxVDdA4x+264okvnsXxPuG96LHQCkh9tVJOLZMgab76ADSoiiG
         5d7SIECtHh4UiSi1+2t9wWJvT5WxZtBAyr1G3K0r4ZbYWWPMa1VdSinrXwAClJSnKQM0
         poOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785402433; x=1786007233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObdtBSjlBwpgFGsbg/wrosB7LM91UtGEZki+/E5+WZ0=;
        b=r3aRDpINIqNLPjv0STOQ+imvsINg/OqtMKhts9B5WnosZ7tP6f59MLh4NusYXuPaTc
         7i1SEIulTadZJqQa2nYDtXeRQKMZe8rn3VmmYqApbM06yj+PUjvJiYqv2i/m6/4UD5T5
         Dw/4e5vKIw/DEt0NJWCJLPPd+b1IHlA9W6TAaAPDCVRWwBN1VhR8qRD/KO5ROgh3j9rh
         W0J4xm1r2nn+yHQk7vEz0BNSPLye4aybIAjK42/O0ms6move1MtAWCMSlJVjYS+4Ibl9
         jdeUM4BZwOIbNpxDrpL/uqNnfY7qvD5gtFPzB0wqrR7TdD7wMcztScJLt/X5x2cWdkW0
         AcWA==
X-Forwarded-Encrypted: i=1; AHgh+RqtR6F2e+pPw5cgPPy4sC53+5CJYXZRTCyRh8Tm66re57wc/le8i92PI0EPyz0OvdMxPuf9GgJKTpnA3pzpmcBL@lists.infradead.org
X-Gm-Message-State: AOJu0YzbyTOY5DIU7pQCkEP+Ph8QrdWqfFwRpD8QOjhq2nVmH+IwlyF3
	F1BwPjfgcv7MFnDihqez7+OZmI2Zz/opt+potAUSsRroX7MTZfxCOtxa
X-Gm-Gg: AR+sD13niwbbzbNQWLSxi0OF0RUXA1OVHTkZDxAIgsb6yZhDakDylbeBMhLzvkfS3Wh
	EaBx77mKrdLjkU6sVsvoaHsh4e7CvbtQGq/5nFZhYo4gd8BPkFWwHkPY6leISXXGBqewwv9gEVf
	14ibwiT6HuL+H1a6P6l8+6vNITUSLSfjlNnmvp/F5HKkrwl4ACxGWaxVwFTZP6wubXepM/r0eo0
	bALXRQRUd/oDWUc0757LIWMLtJ5kP2USZgTzNbPreHNLr08VqxBxvc+SHye3boC+66na6bAEkIL
	RMUNXyVkrVJJwuGppKRVzBe6aktZxXRfq4JcMBjRz5G4p4GLGAjMWc4mly0Nob6Q7Zq05aNIYd1
	z9Boc4fRnEhAk9HtmC4RIc4Ta5rBFjHOb0aHVHU3VhBDRF95ztwmwZfhRMOXyVAYA0/SRE6UPcD
	mQOEzBVQmb7eMIikDBtAHKM0e2iSql/q2sbh4jN3fS1Bels0LcwJonAkUWDhKGMT7iX475IhflF
	Kej6xkfblKTOIdITj8Ondm+9U7p41VpvaXWmgay4rZtc+Mz3HSv
X-Received: by 2002:a05:6a21:487:b0:3bf:99ea:aeb2 with SMTP id adf61e73a8af0-3c900bbd69cmr2478612637.4.1785402432765;
        Thu, 30 Jul 2026 02:07:12 -0700 (PDT)
Received: from debian.lan ([155.117.85.23])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba447107sm1902510a12.21.2026.07.30.02.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:07:12 -0700 (PDT)
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
Subject: [PATCH v6 2/3] arm64/mm: add set_direct_map_ro_noflush()
Date: Thu, 30 Jul 2026 17:06:46 +0800
Message-ID: <20260730090647.2401252-3-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730090647.2401252-1-xueyuan.chen21@gmail.com>
References: <20260730090647.2401252-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_020713_924618_FBE651BA 
X-CRM114-Status: GOOD (  11.29  )
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

Implement set_direct_map_ro_noflush() for arm64 with update_range_prot() on
the linear map, setting PTE_RDONLY and clearing PTE_WRITE. Keep the
existing can_set_direct_map() guard and leave TLB invalidation to the
caller.

Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/arm64/include/asm/set_memory.h |  2 ++
 arch/arm64/mm/pageattr.c            | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 90f61b17275e..7083260303c3 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -14,6 +14,8 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
+int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages);
+#define set_direct_map_ro_noflush set_direct_map_ro_noflush
 bool kernel_page_present(struct page *page);
 
 int set_memory_encrypted(unsigned long addr, int numpages);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index ce035e1b4eaf..c51236b61651 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -365,6 +365,16 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 	return set_memory_valid(addr, nr, valid);
 }
 
+int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages)
+{
+	if (!can_set_direct_map())
+		return 0;
+
+	return update_range_prot((unsigned long)addr, PAGE_SIZE * nr_pages,
+				 __pgprot(PTE_RDONLY),
+				 __pgprot(PTE_WRITE));
+}
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 /*
  * This is - apart from the return value - doing the same
-- 
2.47.3


