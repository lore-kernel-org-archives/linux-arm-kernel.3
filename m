Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1361088E71
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 03:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z8ArazpuHzwIU8/sGdkPDAUgZ5Tq6d2MPt9c5EGHyCA=; b=Q0kqTo7EEOsEPG2Q1vW657zQjs
	WzJ2azmRVksaXPrhca5oHi7FOx8C0YeYtyC3JqxoVyw1Hgm6IMn/HJn1FPD9ojIEmWnyrY7Tgt0g1
	azDpLfTE7xs0Pur3lzpGFjYByv5h6nyLDQmXM1QjVsKFXsapxCUJIdtyk8u/Ij6+JeoMoYjDVV/0P
	4n8BiaihTfr3PvlEmHNj4ibQD4v5SkGhWB0LgYdhWTV42/xVmtpRndLzfT4HPqQIPlSSwQSHsOcYo
	KEopkpRL71FSFR+FLvtQxVeL3bp4oM5sC4qn8cCyIQ8+9i6pP33eNJNCpsvklJ/xjQC3BTNsrt2K7
	JtLYdnWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w33zo-00000009oQX-3ybl;
	Thu, 19 Mar 2026 03:24:28 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w33zk-00000009oOv-28eJ;
	Thu, 19 Mar 2026 03:24:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1773890658; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Z8ArazpuHzwIU8/sGdkPDAUgZ5Tq6d2MPt9c5EGHyCA=;
	b=EyTILYUbcZJcnd1smUvge8rFRD1LpYuRaDbj+hDft4CM6i8kVdB2FUWZe87xzXYqYGddH0ZtG27ugWwetFF2wBcra9yPFgVnqkiJjkyqJvfScTyqRIpwgQCZJVl2z3qSej5wz5ES2YZ+MAKltcSA2uNvZkf+oG3vdHQLxya7Du8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R541e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X.GnNVC_1773890655;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X.GnNVC_1773890655 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 19 Mar 2026 11:24:16 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	baolin.wang@linux.alibaba.com,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org (open),
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] change young flag check functions to return bool
Date: Thu, 19 Mar 2026 11:23:59 +0800
Message-ID: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_202425_240048_B2DED4EF 
X-CRM114-Status: UNSURE (   7.46  )
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

This is a cleanup patchset to change all young flag check functions to
return bool, as discussed with David in the previous thread[1]. Since
callers only care about whether the young flag was set, returning bool
makes the intention clearer. No functional changes intended.

Ran mm selftests on Arm64 and x86 machines, and no issues were found.

Note that I only CC'd the arch mailing lists to avoid disturbing too
many people.

[1] https://lore.kernel.org/all/d172d6bf-c60c-4cf5-9da9-f30de38cdfed@kernel.org/

Baolin Wang (6):
  mm: change to return bool for ptep_test_and_clear_young()
  mm: change to return bool for
    ptep_clear_flush_young()/clear_flush_young_ptes()
  mm: change to return bool for pmdp_test_and_clear_young()
  mm: change to return bool for pmdp_clear_flush_young()
  mm: change to return bool for pudp_test_and_clear_young()
  mm: change to return bool for the MMU notifier's young flag check

 arch/arm64/include/asm/pgtable.h             | 29 ++++----
 arch/arm64/mm/contpte.c                      |  8 +--
 arch/microblaze/include/asm/pgtable.h        |  2 +-
 arch/parisc/include/asm/pgtable.h            |  8 +--
 arch/parisc/kernel/cache.c                   |  8 +--
 arch/powerpc/include/asm/book3s/32/pgtable.h |  4 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 26 +++----
 arch/powerpc/include/asm/nohash/64/pgtable.h |  2 +-
 arch/powerpc/include/asm/nohash/pgtable.h    |  4 +-
 arch/powerpc/mm/book3s64/pgtable.c           |  8 +--
 arch/riscv/include/asm/pgtable.h             | 14 ++--
 arch/riscv/mm/pgtable.c                      |  8 +--
 arch/s390/include/asm/pgtable.h              | 16 ++---
 arch/x86/include/asm/pgtable.h               | 20 +++---
 arch/x86/mm/pgtable.c                        | 28 ++++----
 arch/xtensa/include/asm/pgtable.h            |  6 +-
 include/linux/mmu_notifier.h                 | 76 +++++++++-----------
 include/linux/pgtable.h                      | 53 +++++++-------
 mm/internal.h                                | 16 ++---
 mm/mmu_notifier.c                            | 20 +++---
 mm/pgtable-generic.c                         | 14 ++--
 virt/kvm/kvm_main.c                          | 40 +++++------
 22 files changed, 201 insertions(+), 209 deletions(-)

-- 
2.47.3


