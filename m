Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70047C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 14:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X49qZOu4mRzA9kiupZ/PP4T0O97sIjrpcZUf9r0wWp4=; b=rrK0skL64DotcrH1MA808pRbFw
	GZ+PKiGHtt9JJKu2Cgo3mHTTy+apU806Zceht9sQuJvtLbYolgBtKEFlvceCmKMva3k2phGYUggYi
	yTdSYaYwvrMRBcLVhQ0VWj/eTgrURerzEBdT4uQi08J968PVggJQJv6lO4wOYmPKRCMVJw+yXgKrf
	1wbRYlOW1zIdPyXL/bc4yzr1ZqZlfGJiMhEfo8zdr2dqxmbULu6G1XhAPChsLQDg0fP1PApgGMvId
	Ejvr8Rs0DlwWCzTb91bF+sLL5w4lOaAiBFg/rFBEuiGh6ZFByPXtkIL6J0GY8u3ikdNRwtJhx2Jxt
	GjMNKJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tklOL-0000000DNEJ-0vob;
	Wed, 19 Feb 2025 14:49:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tklLG-0000000DMK6-2eBb
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Feb 2025 14:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=X49qZOu4mRzA9kiupZ/PP4T0O97sIjrpcZUf9r0wWp4=; b=lGsp0vr1rD8Nmrcxhh6HIr1w8c
	bdkgZDDWrFEl4xMHQRvPn1H0jDOyptMxNCC3cKEwXrj/Dgyn+2Vy0Tk9FlXZaXl89e09Nwfr6X3eN
	yDoh921waV7eybwOGLfjlUMPQVdMAIS9H4J8H1FsdCB88u/oWyziUuwqxlKT2AAGdrpRASFcGEUwV
	AH/IsRtyJ9FSpKNoIyEyHUqnAniZZVMoLQ40xmg61Pyj8IY1i/ymS2ZMBzfy8DPPqGz54vu7Q9IF/
	dhL91BMRVeSKxCJVAvwkplwN9I1ydoFr2uTDwzmImSgJvYZGwIzZGXVkau+ir9h3UPargDHyrhYUf
	gqlhxJ3Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tklLD-00000002CpK-2eVc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 14:46:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68B071688;
	Wed, 19 Feb 2025 06:46:38 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B64FD3F59E;
	Wed, 19 Feb 2025 06:46:16 -0800 (PST)
From: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
To: ryan.roberts@arm.com,
	yang@os.amperecomputing.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	broonie@kernel.org,
	mark.rutland@arm.com,
	james.morse@arm.com,
	yangyicong@hisilicon.com,
	robin.murphy@arm.com,
	anshuman.khandual@arm.com,
	maz@kernel.org,
	liaochang1@huawei.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	baohua@kernel.org,
	ioworker0@gmail.com,
	oliver.upton@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
Subject: [PATCH v1 2/3] arm64/mm: Delay tlbi in contpte_convert() under BBML2
Date: Wed, 19 Feb 2025 14:38:39 +0000
Message-ID: <20250219143837.44277-6-miko.lenczewski@arm.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250219143837.44277-3-miko.lenczewski@arm.com>
References: <20250219143837.44277-3-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_144623_894504_0C844B13 
X-CRM114-Status: GOOD (  12.19  )
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

When converting a region via contpte_convert() to use mTHP, we have two
different goals. We have to mark each entry as contiguous, and we would
like to smear the dirty and young (access) bits across all entries in
the contiguous block. Currently, we do this by first accumulating the
dirty and young bits in the block, using an atomic
__ptep_get_and_clear() and the relevant pte_{dirty,young}() calls,
performing a tlbi, and finally smearing the correct bits across the
block using __set_ptes().

This approach works fine for BBM level 0, but with support for BBM level
2 we are allowed to reorder the tlbi to after setting the pagetable
entries. This reordering means that other threads will not see an
invalid pagetable entry, instead operating on stale data, until we have
performed our smearing and issued the invalidation. Avoiding this
invalid entry reduces faults in other threads, and thus improves
performance marginally (more so when there are more threads).

Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/mm/contpte.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index 55107d27d3f8..e26e8f8cfb9b 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -68,9 +68,13 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
 			pte = pte_mkyoung(pte);
 	}
 
-	__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
+	if (!system_supports_bbml2_noconflict())
+		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
 
 	__set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);
+
+	if (system_supports_bbml2_noconflict())
+		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
 }
 
 void __contpte_try_fold(struct mm_struct *mm, unsigned long addr,
-- 
2.45.3


