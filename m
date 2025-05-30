Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637B8C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DSnT7hLZpXtRcoCv7t02WsnQl/qQ3MFmNgoXi+Oqtno=; b=j2swRwovCwVrm7hBVCADOBbpuS
	rOy87PfPskiQN9qcAGYDM/45W8/bK4Vq/saEDymN2rBkGEwScUUGq1feWH2F30gAB71PGCOgoLIyR
	CdrdY+5XGCNIjzd+cm49M2GJLnOROlxYUK8xze4N7cvX1OrbXs+JZ6L6Z6ZACBczAheUDBx+iEIsS
	C8gC93AvWYcOxFeijSg2lxGCNtKeSg91jN3qEe3AqmL+Q52D/4Sv/IljBRGemdvuizJJunZq00MC6
	zN24ai9Qq8VP4q3T2JtTbR0znf5FCv3+JN42Jq4v4w+CAANM3K+2X4+oE9Siku/HiutGW7AUhwFel
	6umnV8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvhO-000000004dX-2uU9;
	Fri, 30 May 2025 09:06:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvfE-000000004Lm-128x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 09:04:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27EB116F2;
	Fri, 30 May 2025 02:04:15 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (unknown [10.164.18.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5CF463F5A1;
	Fri, 30 May 2025 02:04:26 -0700 (PDT)
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
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 0/3] Enable huge-vmalloc permission change
Date: Fri, 30 May 2025 14:34:04 +0530
Message-Id: <20250530090407.19237-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_020432_330693_CA8FCB6B 
X-CRM114-Status: UNSURE (   9.06  )
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

This series paves the path to enable huge mappings in vmalloc space by
default on arm64. For this we must ensure that we can handle any permission
games on vmalloc space. Currently, __change_memory_common() uses
apply_to_page_range() which does not support changing permissions for
leaf mappings. We attempt to move away from this by using walk_page_range_novma(),
similar to what riscv does right now; however, it is the responsibility
of the caller to ensure that we do not pass a range, or split the range
covering a partial leaf mapping.

This series is tied with Yang Shi's attempt [1] at using huge mappings
in the linear mapping in case the system supports BBML2, in which case
we will be able to split the linear mapping if needed without break-before-make.
Thus, Yang's series, IIUC, will be one such user of my series; suppose we
are changing permissions on a range of the linear map backed by PMD-hugepages,
then the sequence of operations should look like the following:

split_range(start, (start + HPAGE_PMD_SIZE) & ~HPAGE_PMD_MASK);
split_range(end & ~HPAGE_PMD_MASK, end);
__change_memory_common(start, end);

However, this series can be used independently of Yang's; since currently
permission games are being played only on pte mappings (due to apply_to_page_range
not supporting otherwise), this series provides the mechanism for enabling
huge mappings for various kernel mappings like linear map and vmalloc.

[1] https://lore.kernel.org/all/20250304222018.615808-1-yang@os.amperecomputing.com/

Dev Jain (3):
  mm: Allow pagewalk without locks
  arm64: pageattr: Use walk_page_range_novma() to change memory
    permissions
  mm/pagewalk: Add pre/post_pte_table callback for lazy MMU on arm64

 arch/arm64/mm/pageattr.c | 81 +++++++++++++++++++++++++++++++++++++---
 include/linux/pagewalk.h |  4 ++
 mm/pagewalk.c            | 18 +++++++--
 3 files changed, 94 insertions(+), 9 deletions(-)

-- 
2.30.2


