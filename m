Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEB5C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 13:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/ejW372tLidV6m7pAYZ/EWeHW7tRte3yRmvT+hobzE0=; b=xYQ9bJj+DvzVlxBsJ6eiIq0aGN
	dUm83O8ERGN0KlgEH9c8VIrE3ro5OMamoRLmqRKJd/wVzjAiepxvOFpSfHYtQj2luySI5UCI/G8Bz
	vQVm0Qro/gnqEWFOcI3SvuCucr66ZOM22UAF+SRBlSndSYE5xig15iaew4qRKlYi58YvRGszRivxm
	vSBCr9Wvf95BlyUuzp+lHHEdcfTUfRBQT1tP/r8hmjlh5gRttAqUKYysLsCyca797AKnZrkJI0S5M
	wW1CQ6BPKXBibtot+whj8L3r6zCRypviCErxUVE2KWNBpmoR1Aikylsokiq4jMZME+JAjKzVYpUsj
	/bzNrekQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4u4-0000000GaRs-3xW6;
	Fri, 13 Jun 2025 13:57:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4hQ-0000000GWUd-2OTY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 13:44:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D264F2B;
	Fri, 13 Jun 2025 06:43:41 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 89B9A3F59E;
	Fri, 13 Jun 2025 06:43:56 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Enable permission change on arm64 kernel block mappings
Date: Fri, 13 Jun 2025 19:13:50 +0530
Message-Id: <20250613134352.65994-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_064404_650815_6161B7DD 
X-CRM114-Status: GOOD (  12.62  )
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
changing permissions for block mappings. We attempt to move away from this
by using the pagewalk API, similar to what riscv does right now; however,
it is the responsibility of the caller to ensure that we do not pass a
range overlapping a partial block mapping; in such a case, the system must
be able to support splitting the range (which can be done on BBM2 systems).

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

v2->v3:
 - Drop adding PGWALK_NOLOCK, instead have a new lockless helper
 - Merge patch 1 and 2 from v2
 - Add a patch *actually* enabling vmalloc-huge permission change

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
  arm64: pageattr: Use pagewalk API to change memory permissions
  arm64: pageattr: Enable huge-vmalloc permission change

 arch/arm64/mm/pageattr.c | 161 ++++++++++++++++++++++++++++++---------
 include/linux/pagewalk.h |   3 +
 mm/pagewalk.c            |  26 +++++++
 3 files changed, 155 insertions(+), 35 deletions(-)

-- 
2.30.2


