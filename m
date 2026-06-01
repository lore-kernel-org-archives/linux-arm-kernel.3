Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB03DCD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8iZQN+oxehRhbRDFp2Djf7RG6EvHlnyDB08mWf0NvrQ=; b=Z8qRql3LB03+BGoJrW/dYnZS2Y
	m94v3Rn0Tk18yKXfkq/whqKOGbH0ap95nGoLphrvkCcjaqaBD3zumG3MtbOpu7m9MjaIzYo1jANkP
	7wO7wBrAUhx6ZPfukhuLRX4k6ok2bmlMzjRq4Hi1mrRau9IaiGTSFajpcw1SK/4KEuuxNn27IZ8nM
	3h5+UF2ZBOe2Vj84I+Lx6UEHSs8hIKZefnkx1223ryjolx0gSj64tGHR5FZJJmOMoVg6B1ZNBAUPQ
	7A8tW5HxA3gCFzXLTl1yJMvWCcAkDvZT9Lh8ktu3OotTGfezBjMnQdw8HRWjyl9nVnZQpjBCpeLl+
	MuY+Apdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKY-0000000APn8-3zq2;
	Mon, 01 Jun 2026 08:49:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKX-0000000APm2-28xf
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 08:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8iZQN+oxehRhbRDFp2Djf7RG6EvHlnyDB08mWf0NvrQ=; b=UIYCJn0yZqA46vUy2vlTXT/jPi
	LDk/sJmVYd43rsfPZCfY2fWgp0/dvrTqN0EREkVpmfshfniSfELUtmr5UbGqJw+hPx5v6LAq/6evH
	D/KEPJ34Oq4f3CdZCvKS3f6q8AbCu9StYzhOKhJ+NIdyalUmRFkkZBKxmENWMXpkSC/eEw/2oDBbU
	9XgjSKp+5AvaQnmLaoUatlh95ZO1dIEtAbaUYtj+mDGaXYDkPx0JlnzMaFOR6TJKRGN30l3e6L6Zs
	/fbupH5IU6MPweyqeKZbioi2SB1ZNGNCZZcNmoy4z0wMpyufut9IPDxuamzCXOySNhrt4q/aVj+UU
	YGjfNKiA==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKU-000000067cM-1vEa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:49:04 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8423f420455so361890b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 01:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303741; x=1780908541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iZQN+oxehRhbRDFp2Djf7RG6EvHlnyDB08mWf0NvrQ=;
        b=CAohNwVT3FgCYvmkTgvtbsvTn7ogfms7JZaqbS0o/B2cRw1QhKWTc94iWPJjoNBmS3
         6jqtrEPJbGlcDAormnUJW19PGjuALnAjLGSBA0TE3Rm2inRivAkUVykjO3n9ikzNW8b3
         oRRsfLjrJhSnKGIK1eDWMuSIN4MCTN45wic44B2mpY1kN7tlxg157nQoqrrFhoDHmUrY
         LRO0CmqP8EZBqi3eDfgUqmNj4Tu0Du6qkT6y87NHV/FaEt44Dsfu3K9m2v3u08slmaZq
         pHbbwZUQp+nw+y5RwEPW+uFq4GjfRggXb1usuHLD6EuVIadOOmsyeSgJL0AGOY4LMWLa
         tlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303741; x=1780908541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8iZQN+oxehRhbRDFp2Djf7RG6EvHlnyDB08mWf0NvrQ=;
        b=mPn6fw8G23qzFJnWzVDmGni8kCGEK3xU97C8ayn8ulGlC1KiL/5W8CObzrnSF/cEx0
         ZFKrChb5s2hdQlaN4POwvapzLfSC8ylTugDYbOoP/Ackh+ibwPPcZqawmBeud3Y7FMxd
         0N7vR5NSzyz73duod4EX172bwhWgtXDIo7OA+rIzbKHB72Wf7Ha2HwARHhNVERC35XVp
         DUnDebJX1RXU6dtcTRvuud0ECPWggQpn9oSSRHd3u30kANeHdx7tQsxJGS++ibE21H7b
         HsdAWZy7ujFi1JXuy0tEzheuD1t6icbSm3UEMyyLcGBnUbCk4O24xMvM4flnvP2DiLi1
         a57g==
X-Forwarded-Encrypted: i=1; AFNElJ93WYbJNRmRDgODmHwwY2UtDAPtqMdZSWFPcmBalQFiyMi8urETJH9aKTKtUi6MX0gssvj72/9en9RBKKN4wbsU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz84u0QXOKDM5BF1HkZcii+maL8TX4r4ht3Qe3leAxQsPD7ltD7
	BCQocoZEA7FKvHCsidekbVieGNmjQlMGWxexawnmGKrOE2mM7e29lZH3ad6i1pICGww=
X-Gm-Gg: Acq92OFHK2ClaGi/9WdS1SFy/Avh+0pnmwZ8INQngHR8CGYwhMxgca+TNiDINZ8j6ay
	IsXRlsZWE38xCmFggWtV6U3DiF10q583USsh1SMkiSayB2QvKq1U/3zXpTDqrMMNiLXSqzyaJ16
	Ms5rhPpmQUxyyX9PbMX7o1TLm0gXiW9pZzstJ3dbvF9rNPpmKRACeF4TXzGgddP0xLgMF2yF/1W
	bAezIvobVrpth75r9O1q9WcCZ8reg+4Mx4yf0F+cEq5FiqTowlz26JC4Q1jA0+jP5VW3qfQu7id
	GVl/l5tBK75vZOABgweygR2btIJGV/zF+WAjnGsX0DICZGn+dc7fveH/emDxp8NCQM+K5C3ACAZ
	dIXCHg3X/v7OJaYXU7FoVCfMAQCKsppgJWBkKh2tbEK2on6Ux0BsCMoKSLAjUUaB3vyO2tCvYCC
	MwPvkIXcCfGKGrPoylBEVesWuXogh3Kyxu+RNDSEWUw4vBC+JYssarEA==
X-Received: by 2002:aa7:9a86:0:b0:83c:928:6e5a with SMTP id d2e1a72fcca58-84225376b00mr9579300b3a.13.1780303741104;
        Mon, 01 Jun 2026 01:49:01 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:49:00 -0700 (PDT)
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
Subject: [PATCH v3 1/5] mm/sparse-vmemmap: provide generic vmemmap_set_pmd() and vmemmap_check_pmd()
Date: Mon,  1 Jun 2026 16:48:40 +0800
Message-ID: <20260601084845.3792171-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084845.3792171-1-songmuchun@bytedance.com>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_094902_935807_A31A7317 
X-CRM114-Status: GOOD (  12.15  )
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

The two weak functions are currently no-ops on every architecture,
forcing each platform that needs them to duplicate the same handful
of lines.  Provide a generic implementation:

- vmemmap_set_pmd() simply sets a huge PMD with PAGE_KERNEL protection.

- vmemmap_check_pmd() verifies that the PMD is present and leaf,
  then calls the existing vmemmap_verify() helper.

Architectures that need special handling can continue to override the
weak symbols; everyone else gets the standard version for free.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2->v3:
- Replace BUG_ON() with WARN_ON_ONCE() in vmemmap_set_pmd()
---
 mm/sparse-vmemmap.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 112ccf9c71ca..99e2be39671b 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -386,12 +386,17 @@ int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
 void __weak __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 				      unsigned long addr, unsigned long next)
 {
+	WARN_ON_ONCE(!pmd_set_huge(pmd, virt_to_phys(p), PAGE_KERNEL));
 }
 
 int __weak __meminit vmemmap_check_pmd(pmd_t *pmd, int node,
 				       unsigned long addr, unsigned long next)
 {
-	return 0;
+	if (!pmd_leaf(pmdp_get(pmd)))
+		return 0;
+	vmemmap_verify((pte_t *)pmd, node, addr, next);
+
+	return 1;
 }
 
 int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
-- 
2.54.0


