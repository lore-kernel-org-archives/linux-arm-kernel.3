Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D48C55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 09:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XA6uf0vdp8ORAw6TXnT7k194lRleDVJK9cishIOZQWw=; b=1+zoqdchmLLqflHDFA+T4bxFLa
	U9py0j06iDu9nlX5MyINVISxLGC5ZoKBvWAyOrOujqvyduLjBG6qg4/N9NWJOcgIGqnfAqtg6jGw2
	zDfVtNwgpO5DpzwbQyCn8Pdm70F7kake57v1HEVTU6vJgeZl4jUvs4zzXHFQdtoAN4JLZA9m6ampC
	D/z3a8TZiGPFv0u/0b9JjG9mLXxKsNkxz5rAjWj78UHekBRUFjjpXkzG4bb7qqfsReeW0gHMIaNnF
	LUtwtxb0X2ZHaKiXaCTGtHvp0ybJQW6tbpsjbU5Iz055zQzyvpNpdBMNTsYCHoHk8didcDBlyw/AB
	dzl/UT1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrY5Q-00000003dvV-1rVP;
	Wed, 05 Aug 2026 09:38:56 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrY5N-00000003duc-3DdT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 09:38:55 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785922725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XA6uf0vdp8ORAw6TXnT7k194lRleDVJK9cishIOZQWw=;
	b=tfOMAQdcMAp+kwN52T099XsJCEIwqGyaubYGQJI3nJug/ZIvnEdlj9Ew39ZD8Min4I1Y2x
	P/iccTt1D69eUcYPcDyhwKa4cwDC9wakk9dMpXYzGF4aRNFc2IEhshkG5uD6AMZrd+RYGN
	DJT/p+XuuDeus5tnAmHA8xT3DRfEJr0=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] KVM: arm64: vgic: Fixes for ITS table save and init retry
Date: Wed,  5 Aug 2026 10:38:25 +0100
Message-Id: <20260805093828.3626610-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_023853_948142_3DE10BFA 
X-CRM114-Status: GOOD (  11.29  )
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

Hi folks,

Three unrelated vgic fixes.

These came out of reviewing the GIC-related postings on the list lately,
from Sebastian's ITS hardening series [1] to Sascha's GICv5 IRS series
[2]. These three are from the ITS table save paths and vgic init. Stare
into the GIC long enough and it stares back!

The first is the one that matters the most. A guest that issues MAPD,
MAPTI and then MAPC(V=0) leaves an ITE mapped with no collection, and
the next KVM_DEV_ARM_ITS_SAVE_TABLES from the VMM oopses the host. That
is three ITS commands and an ordinary migration save, with no race and
no allocation failure.

The other two are weaker and come after it. The init fix stops the SPI
array leaking when userspace retries KVM_DEV_ARM_VGIC_CTRL_INIT after a
failure. The collection table fix bounds a walk that a guest can drive
past the end of the table KVM computed, which stays inside guest
memory, so the guest only corrupts itself. Its error code is a
judgement call, and the commit message says which one and why.

The first and the last are reproduced, each with a selftest that fails
on an unfixed kernel and passes on a fixed one. Those are not part of
this series, happy to post them separately if they are worth having.
The init leak needs an observed allocation failure rather than a crash,
so there is no reproducer for it.

Based on Linux 7.2-rc6 (075b74841bd00).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260310124933.830025-1-sebastianene@google.com/
[2] https://lore.kernel.org/all/20260724104819.1296803-1-sascha.bischoff@arm.com/

Fuad Tabba (3):
  KVM: arm64: vgic-its: Don't dereference a NULL collection on ITT save
  KVM: arm64: vgic: Don't leak the SPI array when init is retried
  KVM: arm64: vgic-its: Don't write past the end of the collection table

 arch/arm64/kvm/vgic/vgic-init.c |  3 +++
 arch/arm64/kvm/vgic/vgic-its.c  | 11 +++++++++++
 2 files changed, 14 insertions(+)


base-commit: 075b74841bd0065a3bda3440873c747938e69b68
-- 
2.39.5


