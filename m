Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0068FCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 05:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vqnep1ZnxMmFAazaW+76O9ZpZbmm9vZn7F9HbkPeTCg=; b=poET34Lr3PC3TFFnkb7sDgD02+
	k0dMAbdnj2awanTqyzZrby4/fBLYk3yDGiwGuXARDrtxTsd89VnWqskZ4+229dV96Sy9a+zebx+Ei
	GceYO95kJfPWygzJ7Pn5COfJRYR7Ii2Yi9GpjiaT9pAKzJYFFLbe7jqdnoB2LwcHguXCNqe0TQ8Zh
	yTMK53nRWvba03VIOEe2Le5UEIhPpiEXHMHR+oRbMyq4vlfl+u9d+RDUloi7bsRy9V0hxbbpIp+Eg
	8M0xn0HTdBRkKJjlGdqA3y60fytRO8QNXMGe1ro8oJwsxuqESP52vDvempkIq08ckQNbsxJXq4p1R
	192LlSPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9cnr-00000006ako-3tpE;
	Fri, 17 Oct 2025 05:14:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9cno-00000006akD-3pov
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 05:14:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 391D0153B;
	Thu, 16 Oct 2025 22:14:46 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 092BE3F66E;
	Thu, 16 Oct 2025 22:14:49 -0700 (PDT)
From: Linu Cherian <linu.cherian@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>,
	Dev Jain <dev.jain@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Linu Cherian <linu.cherian@arm.com>
Subject: [PATCH v4 0/2] arm64/mm: prevent panic on -ENOMEM in arch_add_memory()
Date: Fri, 17 Oct 2025 10:44:35 +0530
Message-ID: <20251017051437.2836080-1-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_221457_009213_B195F6BF 
X-CRM114-Status: GOOD (  10.73  )
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

arch_add_memory() acts as a means to hotplug memory into a system. It
invokes __create_pgd_mapping() which further unwinds to call
pgtable_alloc(). Initially, this path was only invoked during early boot
and therefore it made sense to BUG_ON() in case pgtable_alloc() failed.
Now however, we risk running into a kernel crash if we try to hotplug
memory into a system that is already extremely tight on available
memory. This is undesirable and hence __create_pgd_mapping() and it's
helpers are reworked to be able to propagate the error from
pgtable_alloc() allowing the system to fail gracefully.

Keeping in mind that it is still essential to BUG_ON()/panic if
pgtable_alloc() encounters failure at the time of boot, a wrapper is
created around __create_pgd_mapping() which is designed to panic() if
it encounters a non-zero return value. This wrapper is then invoked from
the init functions instead of __create_pgd_mapping(), thereby keeping the
original functionality intact.

This theoretical bug was identified by Ryan Roberts<ryan.roberts@arm.com>
as a part of code review of the following series[1].

[1] https://lore.kernel.org/linux-arm-kernel/20250304222018.615808-4-yang@os.amperecomputing.com/


Changelog

v4:
Few trivial code readability improvements 

v3:
* Added a Fixes tag to patch 1 and CCed to stable
* Fixed a maybe-uninitialized case in alloc_init_pud
* Update  pgd_pgtable_alloc_init_mm to make use of
  pgd_pgtable_alloc_init_mm_gfp
  * Few other trivial cleanups

v2:
* With cleanup merged as part of, "arm64: mm: Move KPTI helpers to mmu.c"
  changes in patch 2(v1) got much simplified and squashed to patch 1 itself.
* Patch 2 now does a trivial renaming for better readability 
* Make use of INVALID_PHYS_ADDR for error checks instead of 0.  
* Do early function return where we do not have any
  common cleanup in return path
* Remove redundant variable initialization
* Changed BUG_ON to panic
* Renamed ___create_pgd_mapping to early_create_pgd_mapping  

This series is now rebased to linux-6.18-rc1.



Chaitanya S Prakash (1):
  arm64/mm: Allow __create_pgd_mapping() to propagate pgtable_alloc()
    errors

Linu Cherian (1):
  arm64/mm: Rename try_pgd_pgtable_alloc_init_mm

 arch/arm64/mm/mmu.c | 220 ++++++++++++++++++++++++++++----------------
 1 file changed, 139 insertions(+), 81 deletions(-)

-- 
2.43.0


