Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B682E88D88
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 07:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kI3rlSKvLXjOnIGBM/nCi97GMUjHxk2mPfVufcNpMfw=; b=m2u7bKeG4J5qngRX2FOeZFJrIL
	wqiCEhVxFqrEWLIQjGUG7xZyoThCsOoyiOYn7Iouw/dzvqLtTe9fGM1Wdm+NsZ6N78D631jr+0v0M
	wvRAklD9xh1qH28dCcmsReP9ml+nRkLnqExFXESWfz+LHBeKQRCmWllsci/4xwEtw41ccB1deDLb8
	eysXpqN5MxcROkqc1JplqdWh/IYCcY0E7Tv2r7snVvB4ubwYvkr54ANMv2faW+7Di5dEON+TkRuIE
	4K4MdzUtkiIboxU7e7UnTyvmKdwYzEc6ziJwCDNecRnaj1y4rT2tVox4uR8Jn7ji/9NjkZjnQ5bTN
	j0MGGaGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8vGV-00000003EbW-093r;
	Sat, 04 Apr 2026 07:17:55 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8vGT-00000003Eaq-0K4c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 07:17:54 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so857452a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Apr 2026 00:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1775287072; x=1775891872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kI3rlSKvLXjOnIGBM/nCi97GMUjHxk2mPfVufcNpMfw=;
        b=eFk1Oy+w0F/C8E/ZI/61fSnfTZEkcGDcbg7Klp5ZBPn2olUMReMiGoQnV9HraupKEt
         wQNup23BJ5w3pQV1pbC9zT/sqHLwpX0DE0bFDytLrx9N4PPxy/NUk12BmDm9USQJ1lGc
         fZUjNhj/2kp1il/ODuBS/bL4vhW3MzJq5HmSmVWCvZNVDrvrxcavI4nOBmXySdrdSouy
         LWYeWd3KLGPYDy8c8FBGdwXmTCCN7RpFbEooup+yJNCFr4Fd0FsSmA3JoKkWI8io1oQ+
         K4ZO5vTmCbXLFQQIf0aO+6ILNGB68BlfpJ2nWvtaUAW5lrYulJBTIsDdUuo5W9BxPQSc
         wiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775287072; x=1775891872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kI3rlSKvLXjOnIGBM/nCi97GMUjHxk2mPfVufcNpMfw=;
        b=DhWaaT9I3WvRDxM0vV52hxMFtUFq0vpJE4HyGDoRK5Huu+oaV0V/MXCPl36mGa0wL4
         xi3KktSrN1OMETlzGLL7lV0ee1KI3Cax5tpWIYBYMpWvZO3IQECKaIbR6y1jazpVsYKQ
         /MoEaTZeYFl7U1UJwA7okK6b4/2vK8QVDTF6bPErA3XqFYhHKAXIn2I1fgY14zWyvYuS
         LjXOEesYsJKXQ/wR6bCUtLAgkNokXDvV8XCzNMaOFZtWKqQCJ7KAfxTVcDViaURU8yCK
         M5WvVNnt+Tkaiz49YT/clIJ6e6isCLz3n33/lldde90zUxkwMIjRUKXSL9ZRZShlqEit
         qkQw==
X-Forwarded-Encrypted: i=1; AJvYcCVmF3jHTf3iJinsR/T7145MdHU+IhVsegLVLf4ersljklbRA5thbwIKi5jqBacuS99PkTYbkenP6VqPnRqtW+DX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2fZBsgPVobfXmobd6nE9V1qDgh0y/Zcoj8pbN6sSaa+gHrnJB
	69EoXbySAjzcoSInrYdTN7yiScVaYFekQQJbbZX30Vh0mmh4af/hdElq980Z/AOz/aE=
X-Gm-Gg: AeBDiesng5fq65NkdBdrbVQUL3eOjeltKXvXuD7zZ45pmZpWhS/WiA1TKLbzwJH0qUX
	Uk47gzZyll1sorG2eS4NLkEH5McT3yonSm37US26DFQWeA1LjiR2K+3sGVTuiidfV0Q+hfRYzCX
	8BCvgAdJTkMyxcwHMmGNiUVq1oGoomGghB5WfvNH1GQm/pfKV3WHWzKYgk6d7j7/7pUB4JMlRkP
	V39u1Un0PCYgHl2tEWCVImxVvD5OMzlBrPDLjck/ufN8M88fMPJmo+2xRXTevwG/aUcMWcqjN9D
	7GgflgdCCnBFzTdnDBqRlp2a5O515j/lFHrvjQYH9DDGLfodgdLMDIHcoK+1LukMDS0T2jr6O3s
	sFbc01hvKv9P53jcytC4M9EJSDDSro3UuBtAqMtB1VmXOBCJGuMqFyZKdmgcpUrEQpZBCUGnNge
	6ocYDaY7hFEaLrPXFiZ40J4WB1UUvVUtV6TlKUjpI1rxQ=
X-Received: by 2002:a17:902:ea0b:b0:2b2:5da8:14be with SMTP id d9443c01a7336-2b28190a213mr52475105ad.41.1775287071974;
        Sat, 04 Apr 2026 00:17:51 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274979525sm94675115ad.45.2026.04.04.00.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 00:17:51 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arm64/mm: drop vmemmap_pmd helpers and use generic code
Date: Sat,  4 Apr 2026 15:17:07 +0800
Message-Id: <20260404071720.3577290-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260404071720.3577290-1-songmuchun@bytedance.com>
References: <20260404071720.3577290-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_001753_114478_75CC97AC 
X-CRM114-Status: UNSURE (   8.31  )
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


