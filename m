Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D94CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 08:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gAc4ALuWz7da2AJB9gNh/HEjHuaJPJgeDEOGrHIOKdw=; b=R2EADDCSC8l6dmVt8pYwgr8vC0
	0clMf5dSCyxEHvJ2BvfTvqFzWTBvmfmmelmBfQovYNS2arUwpURziY+/AeOANtpc28KpdffJtpZPH
	9Z6uLqp4hTTYvYU+V4BjBPTTGa8ERev4M5g0WYXSixv9RgQ9reehbuHim2Q+14CT4DasQS1S2za6b
	gz60ottuLl1GWbuhmuqfPghmTT+eQ+61RS1aoi1O9r7lKJuH9832TWr3CFEYpHTWenDy7LjuWcW5E
	s5NO+MbVLp2s4RZtgHlyaY1+VjmjPclu4YlgSwSpwY63qdh16a+As8OrBmPi/hO3VDnxs47zOm3+L
	irGB/Fsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8DWN-0000000CXuj-185Y;
	Mon, 13 Oct 2025 08:03:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8DWK-0000000CXsT-21CZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 08:03:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7E9712FC;
	Mon, 13 Oct 2025 01:02:51 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 93C713F738;
	Mon, 13 Oct 2025 01:02:55 -0700 (PDT)
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
Subject: [PATCH v2 0/2] arm64/mm: prevent panic on -ENOMEM in arch_add_memory()
Date: Mon, 13 Oct 2025 13:32:18 +0530
Message-ID: <20251013080220.2027757-1-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_010304_584618_37B033DA 
X-CRM114-Status: GOOD (  11.21  )
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

I will be taking the stewardship for this patch series, as Chaitanya
has left Arm.

Thanks,
Linu Cherian.

Chaitanya S Prakash (1):
  arm64/mm: Allow __create_pgd_mapping() to propagate pgtable_alloc()
    errors

Linu Cherian (1):
  arm64/mm: Rename try_pgd_pgtable_alloc_init_mm

 arch/arm64/mm/mmu.c | 208 ++++++++++++++++++++++++++++----------------
 1 file changed, 132 insertions(+), 76 deletions(-)

-- 
2.43.0


