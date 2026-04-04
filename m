Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF5BE88D70
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 07:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kI3rlSKvLXjOnIGBM/nCi97GMUjHxk2mPfVufcNpMfw=; b=29w/hi5AC6drJ9lJNijKf5X6ac
	AWYjOoQWRQbnny7fuGRkTYFa37GTc0x+2vC8FGWm/rZA8bUp/jee5gX7YxbDgVGMchr0KoPSTJH2t
	1FVoASo7DZW7RhqR9EHWDQ1jEW6p0WBVO9utqZczZfPdJqFVppdEo2JzyFYLn9kX+uocGHH8CRNQe
	4O+l/uLEuMnClxyIaLq8u27q6C59B6OuJpPjJNIPo6jqg81C6BOgpE4983bXTomSc3X8IIU9NV+FQ
	awFWriWM1+A2VX4+YXvmB8oG7y+6191HavQ+JntICzbWcVnijkYUaGPmT4G3sfebkqFCgLLEoY0aD
	3nQurczw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8vGK-00000003EYh-2zTL;
	Sat, 04 Apr 2026 07:17:44 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8vGI-00000003EXu-0cY0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 07:17:43 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2b24fdac394so25019145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Apr 2026 00:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1775287061; x=1775891861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kI3rlSKvLXjOnIGBM/nCi97GMUjHxk2mPfVufcNpMfw=;
        b=Ygt9ozD/nvW22WcvsSc8DrjXyXIw0W/S5ujvBggHO9IftIoiF5BordzO9RmvmJjwzA
         PY5ylNRb4lHjjo+91X0sCaYd8VEfZZ7YVpiKceCEBgVYyhV5ohlyvWWjNIV/wCA1bi2m
         Da+ULx16u4inKH/9fwfjciNKx7xte6qsVETWN+Sz/QymsSf2xkfdoT84QqKmnJujupMZ
         yFQ1A9z/ygJrrqYHsYG0yfI3DZorSVktkqrUGeYB91mJj2GMgjmG6LAEq7cN3Vva78uj
         P/0MgfEeRPNu1bEbV7geSN3eftoV8pfeyAxYFGW8dMn7rVczR+BxLzzeij0t4Baj6nPn
         hIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775287061; x=1775891861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kI3rlSKvLXjOnIGBM/nCi97GMUjHxk2mPfVufcNpMfw=;
        b=NjMOBySDPua+ypF1XoqagiwpzL+2MjypN/D4tAfvslV4UgKb3aqSpsogXQqTxfYGAZ
         dDaOzrinY5GSEbkkafmzHNH1vjPrR3NlNOytEhLPtwrYL3Or3yMO/3DEz4lAYIz9kym/
         6RxKM91L9h79+sl5gfKsuHrAHllYX+6JS8Y+zM9Ckmak63i2qHH+cdwPcZ8Gsq138V+H
         AjTA1FSgSOZ2uwn4fFIEW7mF0VtH/1S0SsC1ohbWj5ehcun/hBQjO/1E+pOUVqKdPsFg
         odvJildonlaEhaBVKkAfKtU0BCk0WS8KM9aVai/0x+CyrD7dXRQNlaYlsz9g3ssQtObG
         RLNg==
X-Forwarded-Encrypted: i=1; AJvYcCXLGBflGq9OBWC3TzgUP3cy9uc0jEb3cY6xvnsIPiK05f897uBz2eZXzzipxCgcxNAybDzhTXiwXmwOFEKaFQ6D@lists.infradead.org
X-Gm-Message-State: AOJu0YzaC4DNtMkMdx015huVmURT7pYla5f9Z6fudg1vFeF3MUMQupN7
	3zcMQSV7rRAazQ5uCg5B8BJKu+bFBXJ9rSW/Czxbc47B5gcvt145ZY2CsWmTh7MiGgE=
X-Gm-Gg: AeBDievtfViHofBxcjgu4UvFXxUzA31+hYbe6Zu/L0g4ES2yf2py3YHqD+EkFcYg3s8
	2P9HMNCn/hjQe4hFd+oA6V7wyELrhgqLxY9VGCPhropVzYDKT6Eq0CgH3av5TH6TboSrWk+yRxH
	+AgDRrCaI8TkUZAcbKjLkLdW0ycIGvl0dsjci0rYwa2jYgEnkgVKNOOhFsWpWBT32uP0ongZv0a
	gkNK84wIU+GtF1h7HA9zVqDjYAWAjEVP5cxh3FBCUB98p2857sxzIQIhDQhjAzRy8d4066Ts9Zz
	Ca1LVGcdV9eTvtCGoAnO6bg6PzFuheSxT7A4Yy3zGv5u4u7XdNMPK4V/XhZv6no+R7AL4QWCbL5
	dGw9Yj8NTc7GuVhjm6cXKi4XMlkWSZG7PVQkUH8ZSf/d8iIYmfw11vd9C28RUXscbZBUnifOIbF
	2lvw2s3EQbwacKX8M60vJXnQVuESjlSVJvRUB/c2JTots=
X-Received: by 2002:a17:903:3586:b0:2b0:b325:748a with SMTP id d9443c01a7336-2b281705e9fmr60126785ad.22.1775287061123;
        Sat, 04 Apr 2026 00:17:41 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274979525sm94675115ad.45.2026.04.04.00.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 00:17:40 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64/mm: drop vmemmap_pmd helpers and use generic code
Date: Sat,  4 Apr 2026 15:17:05 +0800
Message-Id: <20260404071720.3577290-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260404071720.3577290-1-songmuchun@bytedance.com>
References: <20260404071720.3577290-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_001742_190171_A7C3E282 
X-CRM114-Status: UNSURE (   8.52  )
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


