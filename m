Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9CEC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 13:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2+1NqPvaIfnlCLjCKHB5j5DJdAmlBEYwyNPxM6Gzb/w=; b=fJmcaGtcDovODhPAL7gyPwxMDG
	i5Y3uIiZ/LbjHu7ukTIfoFzfiaXc0YaYO++a1R0WfRsHdkPVJy5rrOfo3ehRKXlEjfsH87NKexrvD
	diqj2GTfZPHMSf9uZruRgxDZrPrDAX3dYpyR/N/jcoRUW62ykZ1HokQSPjAObAHZTteF6ufoEt3Iz
	3LPOTYjBYR5YzaX+pbJW+BxB8OYTTS+JBX+DTbiy0oGhYN5x+MtocmcmCbBk5r2XSjXUvfkg6ZBVb
	2iQkn7FCz07fCpTtDR6La5Hn26AILna2jAz7uDo1Jb1HQLdqvREWAB4JEzQ3imkOc8VfhIWy9j9bH
	+gUGOg6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whSWc-0000000HCq9-2WVN;
	Wed, 08 Jul 2026 13:41:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whSWY-0000000HCoc-3x3T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 13:41:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10CE11D14;
	Wed,  8 Jul 2026 06:41:07 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B07673F66F;
	Wed,  8 Jul 2026 06:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783518071; bh=eAIG+1tdkUjfLhi8Y8FkIzAF5Cl7mijllxZ5rBU5AKU=;
	h=From:To:Cc:Subject:Date:From;
	b=a1FkJSKWYcB+PAO7SnOuI9BjrlDrYjJQMlJsvP4NF5B6BYBW8jTwxU5CmNpHx22j9
	 1HSNqvYPUtcB+wMlAWyVENS7Jf7h+nQqq2xpol0T8kG9D0TmkGv8GmOHi4LZU+QtJ+
	 981SiJ53eS00au/vSV+CMtatKWEEGO7ZK0uE6xLQ=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Optimize S2 page splitting
Date: Wed,  8 Jul 2026 14:40:56 +0100
Message-ID: <20260708134101.2514759-1-leo.bras@arm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4333; i=leo.bras@arm.com; h=from:subject; bh=eAIG+1tdkUjfLhi8Y8FkIzAF5Cl7mijllxZ5rBU5AKU=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLL8gvX350z00dK+a9Pw0re7M+vRC8dVDH+sb+pFGc01C PfRmd3bUcrCIMbFICumyCL7aP4qnu9TMo5c+bEAZg4rE8gQBi5OAZiI/npGhvuM0x6dXnXzxh+x /ss2YfNk71QFHeJe12Rz9kxxm8v/eiWG/5431btuPeDK/1BwcI6uW1myx2urxltqiY9Lz0odmRs gzQkA
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_064115_062709_964BAEB3 
X-CRM114-Status: GOOD (  14.25  )
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

While playing with dirty-bit tracking, I decided to take a look on how page
splitting works. Found out all entries are walked, even though we can infer,
for instance that:
- If a level-3 entry is walked, it means the parent level-2 entry is split
- If a split just succeeded in an table entry, it means all children nodes
  are already split

This patches' idea is to introduce new walking flags to skip pagetable
levels 0-3.

The idea of skipping child nodes was also tested, but it was marginally
slower than just skipping levels, so it was discarted.

Optimization measured on two scenarios involving eager-splitting on a
VM with 32 memslot of 2GB (total 64GB), and vcpu per slot:
- Scenario 1: No manual protect, whole memslot split at dirty-track enable
  (KVM_SET_USER_MEMORY_REGION2 ioctl with KVM_MEM_LOG_DIRTY_PAGES)
  - Split happens only once, whole region
  - Evalutes improved batch performance of splitting
- Scenario 2: Manual protect, split happens during every dirty-bit clean
  (KVM_CLEAR_DIRTY_LOG ioctl), average for 2 iterations.
  - Split called multiple times, for smaller 64-page sections.
  - Evaluate improved performance for multiple calls

Scenario 1, improvement on dirty-track enable ioctl for the memslot:
- Memory was already split (4k pages):  -43.18% runtime (stdev 3.87%)
- THP backed memory:                    -25.77% runtime (stdev 1.01%)
- 64x1GB hugetlb memory:                -25.62% runtime (stdev 1.09%)

Scenario 2, improvement on dirty-log clean ioctl for the memslot:
- Memory was already split (4k pages):  -39.88% runtime (stdev 2.71%)
- THP backed memory:                    -25.18% runtime (stdev 0.32%)
- 64x1GB hugetlb memory:                -49.17% runtime (stdev 1.86%)

For collecting above numbers, the following script was ran in both vanilla
and patched kernels, with kernel parameter 'default_hugepagesz=1G', on an
TX2 with 128GB RAM.

--- dirty_test.sh
#!/bin/bash
filename=$(uname -r |cut -d'-' -f 4-)

run_test(){
  base_test="./dirty_log_perf_test -b 2G -v 32 -m 6 -m 8"

  # Manual cleaning disable
  ${base_test} -g
  ${base_test} -g -s anonymous_thp
  echo 64 > /proc/sys/vm/nr_hugepages  
  ${base_test} -g -s shared_hugetlb
  echo 0 > /proc/sys/vm/nr_hugepages

  # Manual cleaning enable
  ${base_test}
  ${base_test} -s anonymous_thp
  echo 64 > /proc/sys/vm/nr_hugepages  
  ${base_test} -s shared_hugetlb
  echo 0 > /proc/sys/vm/nr_hugepages
}

run_test 2>&1 | tee ${filename}
---

Above dirty_log_perf_test command is the standard kvm selftest found in the
kernel tree. It tested the following guest modes:
Testing guest mode: PA-bits:40,  VA-bits:48,  4K pages
Testing guest mode: PA-bits:40,  VA-bits:48, 64K pages
(Modes with PA-bits:36 were discarted in this version, given the amount
of RAM being used for testing, and the similarity of previous results)

Performance numbers from above modes were used to calculate average and
stdev showed in the optimization results.

Changes since v2:
- Rebased on top of v7.2-rc1
- Improved testing, added more memory, re-tested
  - Now: 32 vcpus @ total of 64G
  - Before: 1cpu @ 16G

Changes since v1:
- Fixed inverted flag verification priority (Sashiko)
- Fixed incorrectly skipping POST call if level was skipped (Sashiko), and to that
- New pre-patch that changes goto-out -> return to avoid re-testing walk_continue 
v1 Link: https://lore.kernel.org/lkml/20260610202112.2695205-2-leo.bras@arm.com/

Changes since RFC:
- Changed approach from return value to walk flags (Will Deacon)
- Discarted skip_child approach (Oliver Upton)
- Measured in real hardware, and from userspace perspective (Marc Zyngier)
- Better explanation of what and how numbers were collected
RFC Link: https://lore.kernel.org/all/20260515195904.2466381-1-leo.bras@arm.com/

Thanks!
Leo


Leonardo Bras (3):
  KVM: arm64: Avoid re-testing walk_continue
  KVM: arm64: Introduce KVM_PGTABLE_WALK_SKIP_LEVEL* walk flags
  KVM: arm64: Make stage2_split_walker() skip unnecessary walks

 arch/arm64/include/asm/kvm_pgtable.h | 13 +++++++++++++
 arch/arm64/kvm/hyp/pgtable.c         | 28 +++++++++++++++++++++-------
 2 files changed, 34 insertions(+), 7 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.55.0


