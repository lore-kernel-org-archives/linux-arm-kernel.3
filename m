Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3D5C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 17:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=amf9A3ny0stjzBNYa5xxQpkuKUHxHwl/QGUYuXrMddg=; b=eSJfMdz0Lacjbg4sH81LBnizsE
	ZDYwh+zvFcVk+XUATK+kK6xRCckO3V7K7vcvzpJtNLyDP1yhwhQN73y/FL6ToPtBgjveN57xwBu3F
	5qn0P+mH33jEHz0JN2P2KOWmtIpjLq3FWgGwhPyz70S/zdNYAUKuWsediTv3sNxo7Y3CjK6iK5PMU
	C05K1F4YK0JHNCeH4WAof24TiwuitGWKuaJo3Oen4pfmtaAKGQZlP5xQ8lp2iiOEL7NGHlJFJeeOs
	Nu00fJtmmCrAXoB78YjHDUk5JoHAPi6ewEnxyXh7mfAXOFZvS6Asi6Zu4piZrZEbbXI499qZmb3Q2
	WRE0mcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVjm-000000003BV-38Qt;
	Wed, 08 Jul 2026 17:07:06 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVjj-000000003Ad-42Ve
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 17:07:05 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84347ad88edso1359020b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 10:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783530423; x=1784135223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=amf9A3ny0stjzBNYa5xxQpkuKUHxHwl/QGUYuXrMddg=;
        b=jiRz4hjv8tOT3T0Klo5vBE7wQsacDisZVt0TDNIPseZfrlFUD3dUff//h0wq0+YxTn
         yX4VJbEo0KHqbYwMXt3PGxON1tGGEjwbQpSgFzYKRzjZQy0nYsJRox+6WGhShsDK1nmt
         0NeIDgAMnuxIdUPJr42kr5YSRr0lcG/cjYChc7CR69k0PDSPVB8SDPETvZ5OcAsQzXz8
         PwK92I5KP3xXW69VisICPpZQkz8Z8W3BGD8Q+O5CEfVS/wZeoGeunA8Tb2Jv7kg6h9pt
         v84yiwL3QUktRUwOKw531rE1jaJKafpJfWJaz74FtTISAY9MuLcto6sA9PueWSDf2AW2
         Uncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530423; x=1784135223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amf9A3ny0stjzBNYa5xxQpkuKUHxHwl/QGUYuXrMddg=;
        b=NON9Qh9JBoy3wj9lRBRpjQEi93ICruCk4CnXCpIq5YB4blGmy0nodSQ+DB69h6lK0W
         leXYP5jfVCxSG6VLaMf3mgsK+1UyIOHpGk0BSvJ7SEJ+Pm1ZLoYC99tKd7mulojmgvCG
         IBZpI0bR+Kya8Oay30bppJ1Wqcx0DkvWkS4/aMvFNhCJxLRs7OXfVdn086p7rFjiSRKu
         yvK1ryy+ZGtKYZa999jJs0elBU6iBuOrS/cu/5/xGuokb4Chbu83YCT9HX7oAoDfkgia
         eVbAH3ywdEVFgTrN9xgCKWKB5alhrgumDybH+AdKKBkB6iUSS7IkIRIQNwKntSRL5aif
         g9zg==
X-Forwarded-Encrypted: i=1; AHgh+RqjnjMgLdxxrtCTyAD5SL1+5cKIRZbdswvXlgJNFJC/hPlvBoCc1/AtzoW54u4mrSez5WEYlUyxcWrcnfzPPWZX@lists.infradead.org
X-Gm-Message-State: AOJu0YxJNJPSJ+Gt5OGofRX3zYvTSlS+3DhIjumrRBUvRmgSbxRHyHqg
	1p36NwoO6s/aB6Ob0sFl5QYgRmNieHkMuuUj6yac/92as3zJhJ6qBfJI
X-Gm-Gg: AfdE7clv+9lqsor/zUhSyz8B9Ww9haPuaL3ena86ch2pzKpgiUi3xhAilL2VvA3uDnY
	ashvTp9WVbNOeMxwwawOAbkuixcfkef5qEIglI6YHKcef8Rzb1bkHaUub1V9yBAIZ32+jtrtwK1
	g3RnmGRAstsRMAD60I+yq4jwv7MWjRGMt0s9HljOBQp1ZEahHL0I9gEzAh1fvqgJUm9d4N1fQGD
	UdqKR6sV5ah0BkrEcvbfXBu+sDUO/w8FLlf4P2VPrdUafUHFUQGmW88FEgT2r5eKwrKXIXkr97A
	p0iDMhsU/phV9nchQ+yK7gHG4QyVHUQgo68rRoBje7/WMRHo3idodCtEfseeZyxJcXcKwhPu/y5
	MP6xfNDmQiYbxD94yYtal+D24w71jdE3LL7YjdChdV5ktoq9+9wjmEIBaDgxhTiL29OEktmvLAu
	wVxQr96a/Pgdkr2Y9tJg==
X-Received: by 2002:a05:6a00:a15:b0:848:2f77:e2df with SMTP id d2e1a72fcca58-8484392f4a8mr3717327b3a.72.1783530422835;
        Wed, 08 Jul 2026 10:07:02 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm1119528b3a.22.2026.07.08.10.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:07:02 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: akpm@linux-foundation.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Will Deacon <will@kernel.org>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: [PATCH 0/3] mm/early_ioremap: clarify and clean up early_ioremap_reset()
Date: Thu,  9 Jul 2026 02:06:44 +0900
Message-ID: <20260708170647.362562-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_100704_000724_B77D05C2 
X-CRM114-Status: GOOD (  10.27  )
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

__late_set_fixmap() and __late_clear_fixmap() are only used after
early_ioremap_reset() has been called, but the comment above them does
not say anything about that. So arm64, riscv and powerpc, whose
__set_fixmap() works before and after paging_init(), describe the same
situation in three different ways:

                 calls reset    defines the macros
        arm64    yes            yes
        riscv    no             yes
        powerpc  no             no

Patch 1 documents when early_ioremap_reset() needs to be called and
that only architectures calling it need to define the macros.

Patches 2 and 3 remove the unneeded riscv macros, which are
unreachable, and the arm64 reset call and macros, which change
nothing.

No functional change.

Sang-Heon Jeon (3):
  mm/early_ioremap: clarify early_ioremap_reset() semantics
  riscv: remove unused __late_set_fixmap() and __late_clear_fixmap()
  arm64: remove early_ioremap_reset() call and __late_* macros

 arch/arm64/include/asm/fixmap.h |  3 ---
 arch/arm64/kernel/setup.c       |  2 --
 arch/riscv/include/asm/fixmap.h |  3 ---
 mm/early_ioremap.c              | 10 +++++++---
 4 files changed, 7 insertions(+), 11 deletions(-)

-- 
2.43.0


