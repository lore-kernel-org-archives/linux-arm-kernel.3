Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB65C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 15:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CR8OJi3JXIri+XClYP7WQmxe44jd5Yrs5TLJ0dX0NZY=; b=MC92mMY+7iPQebhsV685uFXVSs
	ZoAVkE+ROOE+fgDXt0R0qYyiu8QFK/vM02zZLKy20uh1Xzsa3SRlK5dJkujF2lLWD0DXuBG4BZcot
	ZdyrkZug82jPH0sP1l1Nqhp34ZnPCvTjGIcoCMw01xTdExRsrDSrTDDQHRfbx4pJIyYuXqE8NB6DK
	ip9j6Gtputq00bKnh+iaqoS0PKOPidNQKggD+4kCe/dGOUB+Vd9eUKs0l+0G7FAVholRExo5JOHV6
	QUWm0LV9p1R52+QvUNe3P/onH1DDlOmG4sJm8+XKOf3SmmPK4nJ0TR55r4NgnW8Pas1lNG+RHCGiY
	sAvaEjYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDTe-0000000ECVy-3dUt;
	Wed, 13 Aug 2025 15:33:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCto-0000000E5IN-3UWk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:56:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE2FE19F0;
	Wed, 13 Aug 2025 07:56:09 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B0EC3F738;
	Wed, 13 Aug 2025 07:56:13 -0700 (PDT)
From: Chaitanya S Prakash <chaitanyas.prakash@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>,
	Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH 0/2] arm64/mm: prevent panic on -ENOMEM in arch_add_memory() 
Date: Wed, 13 Aug 2025 20:26:05 +0530
Message-Id: <20250813145607.1612234-1-chaitanyas.prakash@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_075620_988936_33A4DD65 
X-CRM114-Status: GOOD (  11.46  )
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

Keeping in mind that it is still essential to BUG_ON() if
pgtable_alloc() encounters failure at the time of boot, a wrapper is
created around __create_pgd_mapping() which is designed to BUG_ON() if
it encounters a non-zero return value. This wrapper is then invoked from
the init functions instead of __create_pgd_mapping(), thereby keeping the
original functionality intact.

Lastly, create_kpti_ng_temp_pgd() which originally acted as an alias for
the void returning __create_pgd_mapping_locked() has now been updated
accordingly to handle the return value and BUG_ON() if needed.

This theoretical bug was identified by Ryan Roberts<ryan.roberts@arm.com>
as a part of code review of the following series[1].

[1] https://lore.kernel.org/linux-arm-kernel/20250304222018.615808-4-yang@os.amperecomputing.com/

Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Kevin Brodsky <kevin.brodsky@arm.com> 
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Chaitanya S Prakash <chaitanyas.prakash@arm.com>
Cc: linux-arm-kernel@lists.infradead.org 
Cc: linux-kernel@vger.kernel.org

Chaitanya S Prakash (2):
  arm64/mm: Allow __create_pgd_mapping() to propagate pgtable_alloc()
    errors
  arm64/mm: Update create_kpti_ng_temp_pgd() to handle pgtable_alloc
    failure

 arch/arm64/mm/mmu.c | 174 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 133 insertions(+), 41 deletions(-)

-- 
2.34.1

