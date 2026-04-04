Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FD3E88D9A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 12:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kI3rlSKvLXjOnIGBM/nCi97GMUjHxk2mPfVufcNpMfw=; b=Cfd8AznL3CtZxoNIWOd/rcMdKg
	29p7x1nXO1k4CLGtrijwU6Z21Qw/rMy1jdXBUtL9/Lg6zwh1Fh+rAD7XnbZtbEA6k/BbeZGxhRjVJ
	H3cTbQzylJxFN7TqNynaUjAjyhK1Zke393Z7HwjySl48sgPsg15k9twStiZCKlxm+7NumnEWkGwSw
	GS/JDN9BiDRoo4J79KonpajfwRdSTcSpf6Zk/XWXg8zBnB6+kNEdr5J6x/arM4YRNkY8EqiXqPtwU
	E2CxL13OOHMP8t4e3eiz6dNmRxd+8Zi67HuJygXEXJiK9ffXSlvdNmKz2QjFjvcIX5ik4rHPWJTR3
	4sGMzKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w900I-00000003S4G-3yjc;
	Sat, 04 Apr 2026 12:21:30 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w900G-00000003S3J-3Hac
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 12:21:29 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82ce49785a0so1135813b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Apr 2026 05:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1775305288; x=1775910088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kI3rlSKvLXjOnIGBM/nCi97GMUjHxk2mPfVufcNpMfw=;
        b=ZEKEyz7rVdRXgFAzupnVLyQ1GqxE65ZiDLr3nl/BiAKIuU3H9ed47BNwjhO7NHkaeU
         W/AJe0RKNGDWKrCDH0I2zrbbuhD6+MPf18hxq+PVs2QA0caD9j4YRBxvFLGok86r4Qjr
         9XQinYkN7k3NYMzlf0huPlpfnzH64VB+s3nWy5OvLqOUuo6YKWHlazaMcaEnICMjjJ15
         ljZhaMxd+y5H4MWjVIg8qnx0o5lCD/ZdUuAHsqNUY2GmhOUAcOZXPYobJjrdD6ohgpk5
         4kewQ/T4FDRJEAJ7V2a0SxZxua5dFvZH2aPOJ8UP/imbhVSq4jeIpWenTxRlOXkKhdbm
         fdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775305288; x=1775910088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kI3rlSKvLXjOnIGBM/nCi97GMUjHxk2mPfVufcNpMfw=;
        b=a8wZioOdcdXGQ5q7p3RhY8/auOOCQ0+vd1AVp4owtF2ywlCPSUgoWPaW5n5bbQMPz+
         qMi26A1QK+hSOBaiff0W8GTYDPOCsCraJ5ULiqfOtMDQhUnEyHEsJXREfKVG2LBGB7ss
         R3jkCFGeIvTd6+sxb90RGEz0yzFMYzaooUytAf2qbePKmQKD72q51vpGgZFvM7QnflBI
         fnWwt8Uo2fx15Lkt2NGSF+Q9piL6DAECUepZ27DMHl/yxwO+jcpoNG17j6mUhgcn3LRy
         gh3/9Qyt5P2WfsBIndhy7WAEQx6jUSiLg4gF3Y9E/H4beJVV5IT2HZQiG+KVhiKg8Lef
         vZAg==
X-Forwarded-Encrypted: i=1; AJvYcCWhc178nhTrK3Fvmmb91GtDm2oksvh6l2muTVlKXjYtmnt0NyW1WzwRSPpwAWGGBc1Rhz6U6mU7i6cz6E3BxOuS@lists.infradead.org
X-Gm-Message-State: AOJu0YyY83KaCxJQLRu74ABGTzJrYz3kboBwZc+dH0syzcMstrROJype
	ADsgIH4V7Pej0wSCdLZ4iR9rd9Csj2FZrho/PpuBD2qRiWPwMGwSH+JiDsBbaiuB8ug=
X-Gm-Gg: AeBDieuaMGxpCNNTKT9qjqC3FMjOJrqH0BsxRNdtrkPpazv6u8zJsGf1ZFp37h7uuO+
	Fu/bnvN7KHykAJK8pWOPwBSS1gPgJQmIArPRgnUQbCjVlBmGui0GQ+0CYS9wNsLcVxmUED122rq
	GXMcpuIJFwZM+L4aI5f/jPoax4gDa5yCPZT4X4H2uSKfDlmXD3nb4EM6/a5CSZKREURgkUKhwM8
	2w1+4fuVG+NQy4lCZzv2G8bsZ+YyEbbC7CMkUfaGghRBL+FGwbLm+2rw7dO2FS6gwazfB4LYMLJ
	CIJhlZ75lBfHcBhEelh6n93D7URxPt9dW+YIbOxgleZkW4l8qn3wGkWjrlYK/LgW+hFrN9gGkss
	wIGcKGseI6BvjkS4tll7Rs1VFvClgMPdZlWY0labbT4skMrWdnyRYbbwFb0bi5XGrX4QhEw3j8y
	aKV/7CKOKS3N39WxuXtdADCmnvM5u3k9AufPzvD3l1NFk=
X-Received: by 2002:a05:6a00:181f:b0:82d:29f:d003 with SMTP id d2e1a72fcca58-82d0da2af95mr6055941b3a.12.1775305287696;
        Sat, 04 Apr 2026 05:21:27 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cfebe5b23sm8327063b3a.59.2026.04.04.05.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 05:21:27 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	Muchun Song <songmuchun@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] arm64/mm: drop vmemmap_pmd helpers and use generic code
Date: Sat,  4 Apr 2026 20:20:55 +0800
Message-Id: <20260404122105.3989557-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260404122105.3989557-1-songmuchun@bytedance.com>
References: <20260404122105.3989557-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_052128_818478_332785F0 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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

The generic implementations now suffice; remove the arm64 copies.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/arm64/mm/mmu.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index ec1c6971a561..b87053452641 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1745,20 +1745,6 @@ static void free_empty_tables(unsigned long addr, unsigned long end,
 }
 #endif
 
-void __meminit vmemmap_set_pmd(pmd_t *pmdp, void *p, int node,
-			       unsigned long addr, unsigned long next)
-{
-	pmd_set_huge(pmdp, __pa(p), __pgprot(PROT_SECT_NORMAL));
-}
-
-int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
-				unsigned long addr, unsigned long next)
-{
-	vmemmap_verify((pte_t *)pmdp, node, addr, next);
-
-	return pmd_sect(READ_ONCE(*pmdp));
-}
-
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 		struct vmem_altmap *altmap)
 {
-- 
2.20.1


