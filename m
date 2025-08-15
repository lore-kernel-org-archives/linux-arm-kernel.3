Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DADCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 11:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pek06FZYpKhCq0C18nu7XVIwZs/91KGKAiP+QKBM6xM=; b=SQTKqDofro0a9fD+/uCCyoJME/
	uwGRoFpl3b0xr0F5WO3kkckkthFlTytYXObdAkF1/h/r3PfEmZD9WdysHc9lMJ1JLt9PdtWKLkJSP
	2JR4CODGtWV3yZj5wSKH2gV3MRchpEDcllM2Ge2teM0XJhZfe2h2mUWVJ5Dh+ypeCV3knp2f1V+nd
	ABwqplFIfMR22shntvaeDRdwes1YNZFs/Nq9Lvxb+kBEH2YPT53w4FK4g2hI9sGIaEjhZJ3GqnBFR
	NFci+leCpZ/U5wnXyLalPljlY6QqAQaBxYxSXseMmhegYIpiKcua3nJBoDI/KuIqrxNLHxrBPNPyj
	Q+CHAviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsFH-00000002Hsn-2xu8;
	Fri, 15 Aug 2025 11:05:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqIC-00000001xgw-0dqg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:00:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EA43497;
	Fri, 15 Aug 2025 01:59:59 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21AFE3F63F;
	Fri, 15 Aug 2025 02:00:02 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Howells <dhowells@redhat.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [RFC v2 PATCH 0/8] pkeys-based cred hardening
Date: Fri, 15 Aug 2025 09:59:52 +0100
Message-ID: <20250815090000.2182450-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020008_308786_87116A0E 
X-CRM114-Status: GOOD (  36.29  )
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

This series aims at hardening struct cred using the kpkeys
infrastructure proposed in [1]. The idea is to enforce the immutability
of live credentials (task->{creds,read_creds}) by allocating them in
"protected" memory, which cannot be written to in the default pkey
configuration (kpkeys level). Code that genuinely requires writing to
live credentials, such as get_cred(), explicitly switches to a
privileged kpkeys level, enabling write access to the protected mapping.

The main challenge with this approach is to minimise the disruption to
existing code. Directly allocating credentials in protected memory would
force any code setting up credentials to switch kpkeys level. Instead,
we use the fact that commit_creds() "eats" the caller's reference,
meaning that the caller cannot use that reference after calling
commit_creds(). This allows us to move the credentials to a new location
in commit_creds(): prepare_creds() still allocates them in regular
memory, and commit_creds() moves them to protected memory (i.e. memory
mapped with a non-default pkey). This ensures that _live_ credentials
are protected, without affecting users of commit_creds().

The situation isn't as simple with override_creds(), as the caller may
(and often does) keep using the reference it passed. In this case, the
caller should explicitly call a new helper, protect_creds(), to move
the credentials to protected memory. This seems to be the most robust
approach, and the number of call sites to amend looks reasonable (patch
7 covers the most important ones). No failure should occur if a call
site is missed; the credentials will simply be left unprotected.

In order to allocate credentials in protected memory, this series
introduces support for mapping slabs with a non-default pkey, using the
SLAB_SET_PKEY kmem_cache_create() flag (patch 3). The complexity is kept
minimal by setting the pkey at the slab level; it should also be
possible to do this at the page level, but where to store the pkey value
in struct page isn't obvious - especially since we've almost run out of
GFP flags.

Most of the cover letter for the original kpkeys series [1] is relevant
to this series as well. In particular, the threat model is unchanged:
the aim is to mitigate data-only attacks, such as use-after-free. It is
therefore assumed that control flow is not corrupted, and that the
attacker does not achieve arbitrary code execution.

Performance considerations
==========================

The main caveat in this RFC is RCU handling. Storing struct cred in
memory that is read-only by default would break RCU without special
handling, as it needs to write to cred->rcu (to zero out the callback
field, for instance). There is currently no efficient way for RCU to
know whether the object to be freed is protected or not, and executing
the whole of RCU at a higher kpkeys level would imply running RCU
callbacks at that level too, which isn't ideal (a callback could be
exploited to write to protected locations). The current approach (patch
4) therefore switches kpkeys level whenever any struct rcu_head is
written to. This is safe, but clearly suboptimal. Ideally, RCU would be
able to tell if a struct rcu_head resides in protected memory, maybe
using a flag - it isn't clear where that flag could be stored though.

Other performance-related notes:

* In many cases, the use of guard objects to obtain write access to
  protected data is nested: a function holding a guard calls another
  that will also create a guard object. This seems difficult to avoid
  without heavy refactoring. With the assumption that writing to the
  pkey register is expensive (which is the case at least on arm64/POE),
  patch 1 mitigates the cost by skipping the setting/restoring of the
  register if the new value is equal to the current one, as is the case
  when guards are nested.

* Because a struct cred may be freed before being ever installed,
  put_cred_rcu() may be operating on an object that is located either
  in regular or protected memory. This is handled by looking up the slab
  containing the object and checking if its flags include SLAB_SET_PKEY.
  The overhead is hopefully acceptable on that path, but the approach is
  not particularly elegant.

* Similarly, put_cred(), get_cred() and other helpers may be called on
  unprotected objects. Those helpers however create a guard object
  unconditionally if they need to write to the credentials. It is
  unclear whether skipping the guard for unprotected objects would give
  a performance uplift, as this depends on the cost of checking if an
  object is protected or not.

* It is assumed that calling arch_kpkeys_enabled() is cheap, as multiple
  guards are conditional on that function. (This boils down to a static
  branch on arm64, which should indeed be cheap.)

Benchmarking
============

Like the kpkeys_hardened_pgtables feature [1], this series was evaluated
on an Amazon EC2 M7g instance (Graviton3). A wide variety of benchmarks
were run, including hackbench, kernbench and Speedometer. The baseline 
(v6.17-rc1) was compared against this branch with the
kpkeys_hardened_cred feature enabled and an additional patch enabling it
to be run on current arm64 hardware; see the "Performance" section in [1]
for more details.

Unfortunately, none of the benchmarks yielded clear results. The
overheads remain in the few % and are generally not statistically
significant. Removing the RCU handling (patch 4) makes surprisingly
little difference, which suggests that the guard objects are not adding
overhead to a critical path in those workloads.

Overall it seems that credential manipulation doesn't happen often
enough to notice the overhead this series adds. It could mean that such
overhead is therefore acceptable, but it would be good to confirm this
with more targeted workloads. Suggestions are more than welcome!


This series applies on top of v6.17-rc1 + kpkeys RFC v5 [1]. It is also
available in this repo:

  https://gitlab.arm.com/linux-arm/linux-kb
    Branch: kpkeys-cred/rfc-v2

Any comment or feedback will be highly appreciated, be it on the
high-level approach or implementation choices!

- Kevin

---
Changelog

RFC v1..v2:

- Rebased on v6.17-rc1 and kpkeys RFC v5.

- Added benchmarking section to cover letter.

- Patch 7: fixed a bug that v1 introduced in overlayfs
  (ovl_setup_cred_for_create()). That function should return a reference
  to the protected credentials, which will later be passed to
  put_cred(); in v1 a reference to the unprotected credentials was
  returned, resulting in the unprotected object's refcount becoming
  negative (put_cred() called twice), and a memory leak for the
  protected object.

- Patch 4: added a guard object in rcu_segcblist_entrain() as it also
  writes to struct rcu_head.

- Patch 8: followed the KUnit conventions more closely. [Kees Cook's
  suggestion]

- Patch 8: added tests for protect_creds/prepare_protected_creds
  [Kees Cook's suggestion]

- Moved kpkeys guard definitions out of <linux/kpkeys.h> and to a relevant
  header for each subsystem (e.g. <linux/cred.h> for the
  kpkeys_hardened_cred guard).

RFC v1: https://lore.kernel.org/linux-hardening/20250203102809.1223255-1-kevin.brodsky@arm.com/


[1] https://lore.kernel.org/linux-hardening/20250815085512.2182322-1-kevin.brodsky@arm.com/
---
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: David Howells <dhowells@redhat.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Jann Horn <jannh@google.com>
Cc: Jeff Xu <jeffxu@chromium.org>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Maxwell Bland <mbland@motorola.com>
Cc: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Pierre Langlois <pierre.langlois@arm.com>
Cc: Quentin Perret <qperret@google.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org
Cc: x86@kernel.org
---
Kevin Brodsky (8):
  arm64: kpkeys: Avoid unnecessary writes to POR_EL1
  mm: kpkeys: Introduce unrestricted level
  slab: Introduce SLAB_SET_PKEY
  rcu: Allow processing kpkeys-protected data
  mm: kpkeys: Introduce cred pkey/level
  cred: Protect live struct cred with kpkeys
  fs: Protect creds installed by override_creds()
  mm: Add basic tests for kpkeys_hardened_cred

 arch/arm64/include/asm/kpkeys.h       |  14 +-
 fs/aio.c                              |   2 +-
 fs/fuse/passthrough.c                 |   2 +-
 fs/nfs/nfs4idmap.c                    |   2 +-
 fs/nfsd/auth.c                        |   2 +-
 fs/nfsd/nfs4recover.c                 |   2 +-
 fs/nfsd/nfsfh.c                       |   2 +-
 fs/open.c                             |   2 +-
 fs/overlayfs/dir.c                    |   1 +
 fs/overlayfs/super.c                  |   2 +-
 include/asm-generic/kpkeys.h          |   4 +
 include/linux/cred.h                  |  12 ++
 include/linux/kpkeys.h                |   4 +-
 include/linux/slab.h                  |  21 +++
 kernel/cred.c                         | 179 ++++++++++++++++++++++----
 kernel/rcu/rcu.h                      |   7 +
 kernel/rcu/rcu_segcblist.c            |  13 +-
 kernel/rcu/tree.c                     |   3 +-
 mm/Kconfig                            |   2 +
 mm/Makefile                           |   1 +
 mm/slab.h                             |   7 +-
 mm/slab_common.c                      |   2 +-
 mm/slub.c                             |  58 ++++++++-
 mm/tests/kpkeys_hardened_cred_kunit.c |  79 ++++++++++++
 security/Kconfig.hardening            |  24 ++++
 25 files changed, 401 insertions(+), 46 deletions(-)
 create mode 100644 mm/tests/kpkeys_hardened_cred_kunit.c


base-commit: dc8e5984111db485007d9a01bf8af760f8352d56
-- 
2.47.0


