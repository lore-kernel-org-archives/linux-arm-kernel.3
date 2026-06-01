Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C641CD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zs9Ftk//Eli+AipH1EmAF2SPdnVVPcjuiC9Ml1N6W44=; b=TvvOy8DuE7ls2nGuX0pc2PabhM
	qWEAoDpXBVuH55AvNmkZl2DAbxhjxIMlay/2MgtpOdVOP07e2RvYn6eDEgrDVMXBlb1vZ0U8eeM7Q
	kqHldcdl9TC2eMrZ4M5hsqeBUiyqqgQ9xnC4WLFOz3M7EstasCmnvCk2aHPYuIQxxCLFbd9/D+gSW
	8mpoII2t81eB2aXzYPcBuLhs1zs7iviVQ34WnN+YoonnuP26yck8zo3RvPzeBIG36dt5aQJZhMs7Y
	Ym0rJ0wwl+b6LITw4Dl29BSnoEdiBiUoqU1MQMwitATQAhFReOTLvTfC2CctD/7nofBRJe3cphCBY
	fH5dUYtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyL1-0000000AQAj-0FhJ;
	Mon, 01 Jun 2026 08:49:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKz-0000000AQ8q-1UAw
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 08:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zs9Ftk//Eli+AipH1EmAF2SPdnVVPcjuiC9Ml1N6W44=; b=ddTPq3/EVuoyVM/+GTNJR+s+nv
	B/R50sVNt2SdZf6Qt81+d9k2xWqD+hsxkXn8NkIm0xMArH6CRweFqo5FAmQi/Y3nuIYuR6RmcJ7Uv
	zSpiHXpzUrcU0ZsGiW3NUst/UeQvH8a8pg9cBfCUxaDk/Nd3ojBu59VcBl1fUvLEpgwXHiZN3qjyU
	N7VIBRCkKwCV96W1+93rWvJxje6c6RBBrBNTCC2m4N0l9LGGFaVz28UL1Lc/X9rRpKJiiYoBNR1TR
	M1V+h8AUMURfXC4XG6XHj8HGJQKPtzj1FZLuTdRF961zYDf9pqzc/ye1dSIhfUk//MpgIu8w4grcu
	Wqdgf8lg==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKv-000000067n4-15x8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:49:31 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8422f148dfcso573454b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 01:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303768; x=1780908568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs9Ftk//Eli+AipH1EmAF2SPdnVVPcjuiC9Ml1N6W44=;
        b=lK2D7vQpGaZVME7t3tQ3bvny416SR8vrOkN55PS6TLxF5WKs8cMQU2FsTLGNmqWOuN
         CThluGzvSus6IrioaMgJ4KpMMPIB42X6sfHvX2F4N1Wr27hOGYakZBLufnfUWmUmV0RB
         RVTDiMScgPi5RTh2ox4SrdQwmYnX/nhNcfXyDu3ZGxleE8MiSioP34BUE2veAdvKjaZ2
         CXCkyRICQVPGRqwwQwNsw+GSgiDYO259AEBGebfHQBHDN6ZqBrIIKMJkOLzcG1DyKyEO
         kn1ZmJ8mDUoWzhc9awNoJxhy0uYoDGHc67gwevHeYYFjKGjAErkRh9IPgdjtlYVdPip9
         IgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303768; x=1780908568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zs9Ftk//Eli+AipH1EmAF2SPdnVVPcjuiC9Ml1N6W44=;
        b=fs5JuGf7yyDuTmZdQXDtAXth18+OXJ7cF7YgPYZIvAdJ0rX6mpmRv33WvEDPKkCL/d
         B03joHb+nWvZpIhaa1R0YztMBozXt1FCPvXvWFblohOEb0klXVk/3B06rzZci+NUm1tf
         Hz5/+uduJ/iZMbfXsQkEkQOjq+ZKBbjLn/dUNXMOJ5CiERGK61EfCZBqTpJ7quPWNh5L
         /C3RMB5GQgcuEKcrWIkeFWPVCJfDnTi4kXBv6R1Si7tSy6RIluBQ+IziCA8kaed9wRmb
         w1ykNq5iSgyMmLeTs3Jqp8NLIwRqwSPFMQ+FOmu37hGb4Utvig1zSAqKa94YuXpOAXDN
         e7Hg==
X-Forwarded-Encrypted: i=1; AFNElJ8PFFDNaov6lUHuVM5ZvxDL2ks8pq6X7fdtwoMLy4QGavqxCdliWEvPxq+RCw37tsH7Hoskz0rHdcnx8JpaS055@lists.infradead.org
X-Gm-Message-State: AOJu0YwFzQy2mrZAHySUwrUZ/onu7ET8yxUIH9o5/QoFJXkIMxPPkizj
	W2obKeUcIG4vKRx5U7Tuy4yG3tbFaQyyCYXl82Vog59RFb0yXPkBB7O8l/j2kTggJiY=
X-Gm-Gg: Acq92OHwftHK0VcZBxQdcU0UDf1k/nYw1XoDOVWcXEble0HmLY+TogwIFjuFoZzUzPy
	I7k7HUrhSOebejJeGjELAY4OyFzKjp1SVxOiccuTPi21M3YIcQ5Wpcw1POFRBMDI+WnrxcXZJFN
	gv6FW8CHDoFYLWdU0dDwOq+ZPfU702ApNm9oFWmDLyCF+Uv5hMQR20HC6hwvwokr2GSBmagh6XY
	9/9bIoEbEznJssvdmVLEpRt7oOzVGBZpSZAi5ZhGBVaZssWRadF/LVz8SrvWGvM5AnFm/xGphZ8
	I4LEIQTGap7gNbk0NpdWGgEAEs4U63Vx5zuZYZZn5EKLFm5rXpftQf6RPW9Oys1xZWGlgCnf7hN
	DVYFCnoLdVNowVL+1IGEX7VQG8SsZWYb7q330YZXj0dWkowajZnp17+1WiIiDRym4uWXZ9UB16q
	jQjA00Mc7hIOvp8lVsnumBPbXbKOUvafWs19JF1GHAJs1zizDWnAUT4w==
X-Received: by 2002:a05:6a00:4c8b:b0:842:43d1:4b41 with SMTP id d2e1a72fcca58-84243d15007mr4884011b3a.47.1780303767463;
        Mon, 01 Jun 2026 01:49:27 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:49:26 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	WANG Xuerui <kernel@xen0n.name>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v3 5/5] sparc/mm: drop vmemmap_check_pmd helper and use generic code
Date: Mon,  1 Jun 2026 16:48:44 +0800
Message-ID: <20260601084845.3792171-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084845.3792171-1-songmuchun@bytedance.com>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_094929_624390_F71BD279 
X-CRM114-Status: GOOD (  10.19  )
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

The generic implementations now suffice; remove the sparc copies.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/sparc/mm/init_64.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 3b679b1d1d72..103db4683b16 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2559,17 +2559,6 @@ void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 	pmd_val(*pmd) = pte_base | __pa(p);
 }
 
-int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
-				unsigned long addr, unsigned long next)
-{
-	int large = pmd_leaf(*pmdp);
-
-	if (large)
-		vmemmap_verify((pte_t *)pmdp, node, addr, next);
-
-	return large;
-}
-
 int __meminit vmemmap_populate(unsigned long vstart, unsigned long vend,
 			       int node, struct vmem_altmap *altmap)
 {
-- 
2.54.0


