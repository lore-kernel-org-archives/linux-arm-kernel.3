Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A04CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O7GEdAiyDOwyLdF7enDZh1aPgl+/ZJvbV+Kk7bU5e7Y=; b=b9+o1/sqCUyh4IwawQKK9PQ9Su
	3yCh4cpCjzNOMjTf71z3WII4sjiOUJLa3G9YJKNXlT1HvbSBBsmoGw/zVQ0uqN2VU7IZj9Qic7EqU
	xXh4lsAfNc3FTeamUfBdCqdX9yQv7+OVKVDS77DqDmFFS0brIrd2yeQfpTj2mSN+iqwnvB0w9R5KX
	tylUg1j9KasWyBV2ZjOz51dhy5wpaTTDDql3KLwipPC9axGavo3Y36PkODFt13UOhOzY5Kaupq16C
	/yqsj7u3DO7/jgBDSep+GuqBrJEmtjuelc3sKUAR0t6PNG2dox4IJ8yXzwvho9IC2q2h6q9FHFSYl
	83RXUvZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQ74-000000085AO-3Lbj;
	Wed, 24 Jun 2026 16:06:06 +0000
Received: from confino.investici.org ([93.190.126.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQ72-0000000859t-357L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 16:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1782316847;
	bh=O7GEdAiyDOwyLdF7enDZh1aPgl+/ZJvbV+Kk7bU5e7Y=;
	h=From:To:Cc:Subject:Date:From;
	b=WXGfyhLOSN9iYMPngnr6gWVCGMvyhzd8+T/Kkm7C9Ioqs3REsr+2dLVS2cZgPmnmf
	 kAIgCFPDbfKj6s4biQTogPMknehIbHHP+aAMLxkNlRuvZ0cPx5SA/iX9QkUtNyzLQD
	 RqyzGIKKgu81fKG3vR7KBmapJLyUgvp03yrG2GyU=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4glmqy72M4z10qk;
	Wed, 24 Jun 2026 16:00:46 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4glmqx0sBTz10rF;
	Wed, 24 Jun 2026 16:00:45 +0000 (UTC)
From: Bradley Morgan <include@grrlz.net>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Gavin Shan <gshan@redhat.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <include@grrlz.net>
Subject: [PATCH v3 0/3] KVM: arm64: fix pKVM mapping cache corner cases
Date: Wed, 24 Jun 2026 16:00:25 +0000
Message-ID: <20260624160028.15591-1-include@grrlz.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_090604_945692_BD682E3A 
X-CRM114-Status: UNSURE (   8.72  )
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

This is a standalone v3.

Patch 1 fixes pKVM cache maintenance for non cacheable mappings without
growing struct pkvm_mapping.

Patch 2 fixes a pKVM mapping cache topup bug on permission faults that
replace page mappings with a PMD mapping.

Patch 3 fixes the generic dirty logging case where a permission fault
can still need a page table allocation to split a block mapping.

Changes in v3:
- Send as a standalone series with a cover letter.
- Store the pKVM cacheable bit in nr_pages instead of adding a bool.
- Drop stable from patch 1.
- Add patch 3 for dirty logging permission faults.

Changes in v2:
- Add patch 2 for the pKVM permission fault mapping cache bug.

Bradley Morgan (3):
  KVM: arm64: skip pKVM cache flushes for non cacheable mappings
  KVM: arm64: top up pKVM mapping cache for permission faults
  KVM: arm64: top up stage 2 memcache for dirty logging faults

 arch/arm64/kvm/mmu.c  | 32 +++++++++++++++++++--------
 arch/arm64/kvm/pkvm.c | 51 ++++++++++++++++++++++++++++++++++---------
 2 files changed, 64 insertions(+), 19 deletions(-)

-- 
2.53.0

