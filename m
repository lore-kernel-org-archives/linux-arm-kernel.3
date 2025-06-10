Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F1AC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1cJe902L5Fmu1I390q3hKJDnbyZton5mKNCwWQ2f1zs=; b=0BhiWUM0yB0buD7rRTeUzLvXt8
	NMENBDVWuWdbV2kXIQehSuMQQuFMW6vztlRBJ0YScQbIddpjbx2urB0KW9yi+tnT+6Jbz3AiT/nXn
	1qpEeIuKSHeHc2VUWmpshZd3Yvn7I4DeEC5d/Bt8FtREtcqRoABJVHNMbu7BkjVUYkY5bE626eBtC
	j3yTILhqjWNn+81znYCKboh7ha+LLo2POBI3mUkvVgAye0beHR1U0Q8CDIo/i2Sfs+PzR4BxfrJiC
	9ANc/BRZS3CrDezC3oG7lrYNJA23hTulIh+rv+i7FE32MeUdE9HCZIR8j8xq0pDMIZM9T9xRr4Bwc
	vIUZgQqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOy2b-00000006lQW-3Yr8;
	Tue, 10 Jun 2025 12:25:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxOu-00000006gNB-3PqV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 11:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=1cJe902L5Fmu1I390q3hKJDnbyZton5mKNCwWQ2f1zs=; b=ByDqLY90WRl+veD0luxyzO8KeD
	5NbNZaS+YerxM7S9WJwYQ+kXvKZgZgnprFKGYl/u7ezaprb5XxWwgn/xiKVaEFhSrhIbCxo/8n7Qp
	pYMi5z/hNsacN3fX2NSPX6NcQShCvcjaXCRod8swdqXGEqOy5adblkGq1iY7tnWf95xjhpSQXcc0e
	4aLn04z5+3x1IcQ3GSTL9QCmZ6TkyMKwRdnjG2Gt79IzPXesREdKoI/jt3t1K8DX0JUjGtTOthELW
	4ttH8mKlZ6hufp8lgiNDIQykqxJ2Gvxcj9ijifLOX0U1gc/A6/CsQlsdmt0zajxIMTFwNdhLvmd8O
	nIikkcNQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxOs-00000001mub-0a0x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 11:44:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A987C169C;
	Tue, 10 Jun 2025 04:43:55 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B5713F59E;
	Tue, 10 Jun 2025 04:44:08 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	yang@os.amperecomputing.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2 0/2] Enable permission change on arm64 kernel block mappings
Date: Tue, 10 Jun 2025 17:13:59 +0530
Message-Id: <20250610114401.7097-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_124418_392997_86178821 
X-CRM114-Status: GOOD (  10.21  )
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

This series paves the path to enable huge mappings in vmalloc space and
linear map space by default on arm64. For this we must ensure that we can
handle any permission games on the kernel (init_mm) pagetable. Currently,
__change_memory_common() uses apply_to_page_range() which does not support
changing permissions for leaf mappings. We attempt to move away from this
by using walk_page_range_novma(), similar to what riscv does right now;
however, it is the responsibility of the caller to ensure that we do not
pass a range, or split the range covering a partial leaf mapping.

This series is tied with Yang Shi's attempt [1] at using huge mappings
in the linear mapping in case the system supports BBML2, in which case
we will be able to split the linear mapping if needed without break-before-make.
Thus, Yang's series, IIUC, will be one such user of my series; suppose we
are changing permissions on a range of the linear map backed by PMD-hugepages,
then the sequence of operations should look like the following:

split_range(start)
split_range(end);
___change_memory_common(start, end);

However, this series can be used independently of Yang's; since currently
permission games are being played only on pte mappings (due to apply_to_page_range
not supporting otherwise), this series provides the mechanism for enabling
huge mappings for various kernel mappings like linear map and vmalloc.

[1] https://lore.kernel.org/all/20250304222018.615808-1-yang@os.amperecomputing.com/

v1->v2:
 - Squash patch 2 and 3
 - Add comment describing the responsibility of the caller to ensure no
   partial overlap with block mapping
 - Add comments and return -EINVAL at relevant places to document the usage
   of PGWALK_NOLOCK (Lorenzo)
 - Nest walk_kernel_page_table_range() with lazy_mmu calls, instead of
   doing so only per PTE level, fix bug in the PTE callback, introduce
   callbacks for all pagetable levels, use ptdesc_t instead of unsigned
   long, introduce ___change_memory_common and use them for direct map
   permission change functions (Ryan)

v1:
https://lore.kernel.org/all/20250530090407.19237-1-dev.jain@arm.com/

Dev Jain (2):
  mm: Allow lockless kernel pagetable walking
  arm64: pageattr: Use walk_page_range_novma() to change memory
    permissions

 arch/arm64/mm/pageattr.c | 158 +++++++++++++++++++++++++++++++--------
 include/linux/pagewalk.h |   7 ++
 mm/pagewalk.c            |  23 ++++--
 3 files changed, 151 insertions(+), 37 deletions(-)

-- 
2.30.2


