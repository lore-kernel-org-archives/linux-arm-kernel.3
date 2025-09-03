Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C93CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 19:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GWtECCYO/W3ZeQTeOSKG2/hfJYDhLePie2ke5lizwtk=; b=HZ3AuGGr+fmNA92V9UWlHxXDQd
	CFbClUaUMWOHFPt3rdzKJHRK589XYQYkibXaUit4mVanV2Pq3u/uDCx6gzxK48w9H56CCvP5K4B9k
	s2bUcfWbKklG8HyuowYyPyc4qa3IIsby8HrWTou3r+WgLIXTwWtzSWF04o+Dl/sHnVehUCA8CiOT6
	nrry7xJhsoMb/EOUsHNbr5ipJMh8Q62Vpv/sSDPOsQce37PxxOe2qVQh6UHTei8Juy4Pwj9H5tINS
	CMFmkx4/xwzoreDQetfHgClJqFF3Z963RQ35fMtGmZAjG54vKmATvHhns0FcOCb3L8yrGNAjliEV8
	6EIubI1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uttZB-00000007Ugy-2Ts6;
	Wed, 03 Sep 2025 19:54:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utoyT-00000006otL-3jIy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 15:00:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65C9A1688;
	Wed,  3 Sep 2025 08:00:21 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D89543F694;
	Wed,  3 Sep 2025 08:00:25 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	corbet@lwn.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	scott@os.amperecomputing.com,
	jhubbard@nvidia.com,
	pankaj.gupta@amd.com,
	leitao@debian.org,
	kaleshsingh@google.com,
	maz@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	james.morse@arm.com,
	ardb@kernel.org,
	hardevsinh.palaniya@siliconsignals.io,
	david@redhat.com,
	yang@os.amperecomputing.com
Cc: kasan-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v7 0/2] introduce kasan.write_only option in hw-tags
Date: Wed,  3 Sep 2025 16:00:18 +0100
Message-Id: <20250903150020.1131840-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_080037_995970_A536F131 
X-CRM114-Status: GOOD (  11.47  )
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

Hardware tag based KASAN is implemented using the Memory Tagging Extension
(MTE) feature.

MTE is built on top of the ARMv8.0 virtual address tagging TBI
(Top Byte Ignore) feature and allows software to access a 4-bit
allocation tag for each 16-byte granule in the physical address space.
A logical tag is derived from bits 59-56 of the virtual
address used for the memory access. A CPU with MTE enabled will compare
the logical tag against the allocation tag and potentially raise an
tag check fault on mismatch, subject to system registers configuration.

Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
check fault on store operation only.

Using this feature (FEAT_MTE_STORE_ONLY), introduce KASAN write-only mode
which restricts KASAN check write (store) operation only.
This mode omits KASAN check for read (fetch/load) operation.
Therefore, it might be used not only debugging purpose but also in
normal environment.

This patch is based on v6.17-rc4.

Patch History
=============
from v6 to v7:
  - modify some comments on KASAN kunit test.
  - rebased to v6.17-rc4.
  - https://lore.kernel.org/all/20250901104623.402172-1-yeoreum.yun@arm.com/

from v5 to v6:
  - change macro name for KASAN kunit test.
  - remove and restore useless line adding/removal.
  - modify some comments on KASAN kunit test.
  - https://lore.kernel.org/all/20250820071243.1567338-1-yeoreum.yun@arm.com/

from v4 to v5:
  - fix wrong allocation
  - add small comments
  - https://lore.kernel.org/all/20250818075051.996764-1-yeoreum.yun@arm.com/

from v3 to v4:
  - fix wrong condition
  - https://lore.kernel.org/all/20250816110018.4055617-1-yeoreum.yun@arm.com/

from v2 to v3:
  - change MET_STORE_ONLY feature as BOOT_CPU_FEATURE
  - change store_only to write_only
  - move write_only setup into the place other option's setup place
  - change static key of kasan_flag_write_only to static boolean.
  - change macro KUNIT_EXPECT_KASAN_SUCCESS to KUNIT_EXPECT_KASAN_FAIL_READ.
  - https://lore.kernel.org/all/20250813175335.3980268-1-yeoreum.yun@arm.com/

from v1 to v2:
  - change cryptic name -- stonly to store_only
  - remove some TCF check with store which can make memory courruption.
  - https://lore.kernel.org/all/20250811173626.1878783-1-yeoreum.yun@arm.com/

Yeoreum Yun (2):
  kasan/hw-tags: introduce kasan.write_only option
  kasan: apply write-only mode in kasan kunit testcases

 Documentation/dev-tools/kasan.rst  |   3 +
 arch/arm64/include/asm/memory.h    |   1 +
 arch/arm64/include/asm/mte-kasan.h |   6 +
 arch/arm64/kernel/cpufeature.c     |   2 +-
 arch/arm64/kernel/mte.c            |  18 +++
 mm/kasan/hw_tags.c                 |  70 +++++++++-
 mm/kasan/kasan.h                   |   7 +
 mm/kasan/kasan_test_c.c            | 205 +++++++++++++++++++----------
 8 files changed, 240 insertions(+), 72 deletions(-)


base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


