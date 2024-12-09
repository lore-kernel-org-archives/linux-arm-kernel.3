Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BF9E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 09:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NKrCjYYWE/lsChaQNLrFncA/X5ni23Gn191uerwli9M=; b=O8y9c6YjJXtdL9GmrTc/FbrKGW
	rm87NM+uKWNUYdYAurLBQFI/N89W42pMX7MPLBKzzpSInPPl2lSjWFpttEmzMQpHmje8oHr/DWzYx
	tRrx4aRYP60wAUKkJJhv8VhPqKN4g9ZKLwun80SsdoOClRK8dwDhywd9E5l05LUu/xsAMKqbk7w6D
	CF1qI3Yau4m63Nd7K/fiTSrkBtlOnj8R7HsB2iOoxVtXaVKbhl+ZMjJQ4g5r6v7H3u2xrW7KfACql
	Ci66X3sEW2HAO0wCo5bjMS5v88INDhiokGQoYH9W7SAvwCYroWlHGFwqc6tZUhIhdjtuY3rkUgRi9
	fddKPIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaUj-00000007BEC-0Yku;
	Mon, 09 Dec 2024 09:56:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaPZ-000000079Bc-3ECX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:50:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69759113E;
	Mon,  9 Dec 2024 01:51:07 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EAAF3F720;
	Mon,  9 Dec 2024 01:50:37 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	akpm@linux-foundation.org,
	aruna.ramakrishna@oracle.com,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 00/14] pkeys kselftests improvements
Date: Mon,  9 Dec 2024 09:50:05 +0000
Message-ID: <20241209095019.1732120-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015041_896477_D49AA77D 
X-CRM114-Status: GOOD (  16.21  )
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

This series brings various cleanups and fixes for the mm (mostly
pkeys) kselftests. The original goal was to make the pkeys tests work
out of the box and without build warning - it turned out to be more
involved than expected.

The most important change is enabling -O2 when building all mm
kselftests (patch 5). This is actually needed for the pkeys tests to run
successfully (see gcc command line at the top of protection_keys.c and
pkey_sighandler_tests.c), and seems to have no negative impact on the
other tests. It certainly can't hurt performance!

The following patches address a few obvious issues in the pkeys tests
(unused code, bad scope for functions/variables, etc.) and finally make
a couple of small improvements.

There is one ugliness that this series does not fix: some functions in
pkey-<arch>.h call functions that are actually defined in
protection_keys.c. For instance, expect_fault_on_read_execonly_key() in
pkey-x86.h calls expected_pkey_fault(). This means that other test
programs that use pkey-helpers.h (namely pkey_sighandler_tests) would
fail to link if they called such functions defined in pkey-<arch>.h.
Fixing this would require a more comprehensive reorganisation of the
pkey-* headers, which doesn't seem worth it (patch 9 adds a comment to
pkey-helpers.h to clarify the situation).

Some more details on the patches:

- Patch 1 is an unrelated fix that was revealed by inspecting a warning.
  It seems fairly harmless though, so I thought I'd just post it as part
  of this series.

- Patch 2-5 fix various warnings that come up by building the mm tests
  at -O2 and finally enable -O2.

- Patch 6-12 are various cleanups for the pkeys tests. Patch 11 in
  particular enables is_pkeys_supported() to be called from outside
  protection_keys.c (patch 13 relies on this).

- Patch 13-14 are small improvements to pkey_sighandler_tests.c.


Many thanks to Ryan Roberts for checking that the mm tests still run
fine on arm64 with those patches applied. I've also checked that the
pkeys tests run fine on arm64 and x86.

- Kevin

---
Cc: akpm@linux-foundation.org
Cc: aruna.ramakrishna@oracle.com
Cc: catalin.marinas@arm.com
Cc: dave.hansen@linux.intel.com
Cc: joey.gouly@arm.com
Cc: keith.lucas@oracle.com
Cc: ryan.roberts@arm.com
Cc: shuah@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kselftest@vger.kernel.org
Cc: x86@kernel.org
---
Kevin Brodsky (14):
  selftests/mm: Fix condition in uffd_move_test_common()
  selftests/mm: Fix -Wmaybe-uninitialized warnings
  selftests/mm: Fix strncpy() length
  selftests/mm: Fix -Warray-bounds warnings in pkey_sighandler_tests
  selftests/mm: Build with -O2
  selftests/mm: Remove unused pkey helpers
  selftests/mm: Define types using typedef in pkey-helpers.h
  selftests/mm: Ensure pkey-*.h define inline functions only
  selftests/mm: Remove empty pkey helper definition
  selftests/mm: Ensure non-global pkey symbols are marked static
  selftests/mm: Use sys_pkey helpers consistently
  selftests/mm: Rename pkey register macro
  selftests/mm: Skip pkey_sighandler_tests if support is missing
  selftests/mm: Remove X permission from sigaltstack mapping

 tools/testing/selftests/mm/Makefile           |   6 +-
 tools/testing/selftests/mm/ksm_tests.c        |   2 +-
 tools/testing/selftests/mm/mremap_test.c      |   2 +-
 tools/testing/selftests/mm/pkey-arm64.h       |   6 +-
 tools/testing/selftests/mm/pkey-helpers.h     |  61 ++---
 tools/testing/selftests/mm/pkey-powerpc.h     |   4 +-
 tools/testing/selftests/mm/pkey-x86.h         |   6 +-
 .../selftests/mm/pkey_sighandler_tests.c      |  32 +--
 tools/testing/selftests/mm/pkey_util.c        |  40 ++++
 tools/testing/selftests/mm/protection_keys.c  | 212 +++++++-----------
 tools/testing/selftests/mm/soft-dirty.c       |   2 +-
 tools/testing/selftests/mm/uffd-unit-tests.c  |   4 +-
 .../testing/selftests/mm/write_to_hugetlbfs.c |   2 +-
 13 files changed, 163 insertions(+), 216 deletions(-)
 create mode 100644 tools/testing/selftests/mm/pkey_util.c

-- 
2.47.0


