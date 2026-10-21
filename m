Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A9260A2602
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 11:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EN4nhmaF;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ABx0n5+w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LamOgwOLGcvObJJ6uLyjNnr+OKxJmcO2SWrOkvHa4B0=; b=EN4nhmaF/ztFUuBJsvNVNZfBWW
	uNML8Unmv+dLGQWT6MXqu6F2Eu8BTH+NbHAKz3Y+4rBXKIwbCIypI80wn5JmFWWHVQBRsgbmvXGZ3
	th8uT1CZHQm+pAb414TXM4tQb0vZ9ChAQeN/mPNu5saARgxFWnbQOdqlOYI7nr1rZHN+555J5L+Di
	q0IypaHwbIv4uw8QK0HiFuJqDe1Sx2A3Uzr0EBu/saiqbn35w7Tbm1RtrT1/Nv/yebGoQZCsQUi1G
	T3N1j13TSrGW9e24R5NFFTc9zqeFDPVL5B3Pvtr4tJ1iEp6U8VeU8OOUjYQ0dA8VFh0OQWE992oGx
	7p+PdlvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUnR-0000000Bk7n-1lcn;
	Wed, 21 Oct 2026 11:47:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUnP-0000000Bk70-3f6g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 11:47:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C7E7A60D97;
	Wed, 21 Oct 2026 11:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4EE1F000C4;
	Wed, 21 Oct 2026 11:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792583270;
	bh=LamOgwOLGcvObJJ6uLyjNnr+OKxJmcO2SWrOkvHa4B0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ABx0n5+wJXHhNQk6ZRp0wqw4Rw7NF+bXiYQq2SvsBPoBKUDyPS1FKlsineSsqAOud
	 Ao6k/OkSWtjiesySf8tDYRaKmnk0uZRkpiMrIBtr1f2ZkErMR031WCq6j4RvxMdW9E
	 TlL1ttZOyHC6ksfHTx30Mk27mlMpFbUMTGp9dAVK/qVF0j0+sTE9ckvhejDBOOP2fj
	 g5edE9dWu6I9P5Qu8zdos9gI3ACgQlZET6Y0qNKIlglWaH78OpwE8XdhTD/l2cyU8Z
	 uwCY+GDwkDoxGJhOXUQeOP7COA7+6xbWzdWZl02/XKQzVrtVPJcHxnP7SW1o4Rf2aG
	 OXu998Y20Iu4g==
From: "Harry Yoo (Meta)" <harry@kernel.org>
Date: Wed, 21 Oct 2026 12:46:48 +0100
Subject: [PATCH slab/for-next 07/14] arm64/mm: specify SLAB_MAY_ACCOUNT for
 pgd_cache
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-7-096800aa3330@kernel.org>
References: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-0-096800aa3330@kernel.org>
In-Reply-To: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-0-096800aa3330@kernel.org>
To: Vlastimil Babka <vbabka@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Roman Gushchin <roman.gushchin@linux.dev>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, Muchun Song <muchun.song@linux.dev>, 
 Hao Ge <hao.ge@linux.dev>, Pedro Falcato <pfalcato@suse.de>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 "Harry Yoo (Meta)" <harry@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When PGD_SIZE != PAGE_SIZE, user PGDs are allocated from pgd_cache
with GFP_PGTABLE_USER, which includes __GFP_ACCOUNT. Specify
SLAB_MAY_ACCOUNT when the object may be charged to a memcg.
__GFP_ACCOUNT without SLAB_MAY_ACCOUNT will not be allowed.

Path (e.g. 64K pages): copy_process() -> mm_init() -> pgd_alloc()
  -> kmem_cache_alloc(pgd_cache, GFP_PGTABLE_USER)

Assisted-by: LLM
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>
---
 arch/arm64/mm/pgd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/pgd.c b/arch/arm64/mm/pgd.c
index bf5110b91e2f..0fd5b90b5160 100644
--- a/arch/arm64/mm/pgd.c
+++ b/arch/arm64/mm/pgd.c
@@ -63,5 +63,5 @@ void __init pgtable_cache_init(void)
 	 * Naturally aligned pgds required by the architecture.
 	 */
 	pgd_cache = kmem_cache_create("pgd_cache", PGD_SIZE, PGD_SIZE,
-				      SLAB_PANIC, NULL);
+				      SLAB_PANIC | SLAB_MAY_ACCOUNT, NULL);
 }

-- 
2.54.0


