Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493FFC5DF88
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 06:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BGSrzvIdIkPZaE9kABpnEnY3eADJufsvlxN/yD9EpPk=; b=TSS5V21V31ftDFiD3lbg47yYeh
	h8h9uKQOKgvUcHzVoJc9GFpuiwAD+/5llQMhaQrNqCCZM8NwoKIvUv2/DywFP8UFQJdoe3ndWSrIp
	LlbUFfrMQFYjhfOTYAyO38lj48KrGFWblFZK69qXegrfGwv8WfIWFKvYG9miFZrlDQUOrtio+IK9V
	sa4xz/A+/PyZoRRlWuF8MCQUx+H2945s9+CFOG0qFgvIyGFPtJ3z184VUOHLyscy1rOGjEuSkFa8G
	nRbwiOdFYQZZt1rDgCaDdrvJky0fRcQ27js+A+DAV7Z6FAtBQh18UmcdxGKmj9hKy/mBEgxA9/CF3
	dU0rHQoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxIzo-0000000CeKn-30Gm;
	Fri, 21 Aug 2026 06:44:56 +0000
Received: from out-43.mta1.migadu.com ([2001:41d0:203:375::2b] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxIzl-0000000CeK3-1CBc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 06:44:54 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=7kUZ/3+clATTzGfYeY9/JvP0FEHdJchyOMerj2uhDzk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787294691; v=1; x=1787899491;
 b=h+d68IfNnOkKYoiger1sCB8mu51rPUDsCw52+G+I2Rqm+f7iSLN0bmzUUtJHb3hikT1JRljb
 NP8gQpAAymWMBvgGLWVGveTVVpEvJLFsBtVXRKIQJFA7fQvq0TxF969YKBmmTN75W5PKq86P4X2
 l8X8+BGN5EmHU/eVZZEgR9PU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.lan (37.156.72.212)
	by smtp.migadu.com with ESMTPS id 873a31f318a0fe34;
	Fri, 21 Aug 2026 06:44:50 +0000
X-Mizu-Trace-ID: 873a31f318a0fe34
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Eric Auger <eauger@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] KVM: arm64: vgic-its: Make the ITS table save reliable
Date: Fri, 21 Aug 2026 07:44:41 +0100
Message-Id: <20260821064445.615838-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_234453_463209_E5851E64 
X-CRM114-Status: GOOD (  17.01  )
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

Changes since v1 [1]:
  - Free the LPI translation cache in vgic_mmio_write_its_baser() too,
    inside the its_lock section. (Eric)
  - Reworded patch 1 to name the register the write is to. (Eric)
  - Rebased onto kvmarm/next.

Marc pointed out on the v2 ITS series [2] that patch 3 fixed the wrong
end of the problem: KVM should drop the collections when the guest
changes the table that described them, rather than validating them at
save time. He also called that patch's -EINVAL a mistake, since it
aborts a save userspace has to be able to issue. This series does both,
following his answers [3] to the two open questions: purge the whole
list, and skip the offending device rather than fail.

vgic_mmio_write_its_baser() now frees the cached devices or collections
whenever the stored register value changes, not only when VALID is
cleared, and drops the translation cache with them. It tests for a
change rather than a write because the ITS driver rewrites an unchanged
GITS_BASER<n> on resume. With that in place the check patch 3 added is
unreachable, so it is reverted, and vgic_its_save_device_tables() skips
a device the table can no longer address instead of failing the save.

compute_next_devid_offset() now calls vgic_its_check_id(), which reads
guest memory for an indirect table, so the save does 2n reads rather
than n. It stays linear, as the scan stops at the first
reachable successor. Patch 1's Fixes: tag names a v4.15 commit, so it
will be picked up for stable. Drop the tag if that is not wanted.

Patches 1 and 3 apply to v7.2 unchanged, but patch 2 reverts a commit
only in kvmarm/next, so the series is based there.

Tested on QEMU: the new selftest, vgic_irq, vgic_lpi_stress and boots.
Both cases of the new selftest reset and restore the tables they saved,
and both fail without the series.

Based on kvmarm/next (aa8e5dc6a7a2a).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260819102809.310708-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/87ecg9owwa.wl-maz@kernel.org/
[3] https://lore.kernel.org/all/86bjaz5s6v.wl-maz@kernel.org/

Fuad Tabba (4):
  KVM: arm64: vgic-its: Free the caches when GITS_BASER changes
  Revert "KVM: arm64: vgic-its: Don't save collections the table cannot
    hold"
  KVM: arm64: vgic-its: Skip unreachable devices instead of failing the
    save
  KVM: arm64: selftests: Add ITS table save tests

 arch/arm64/kvm/vgic/vgic-its.c                |  46 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/vgic_its_save.c       | 441 ++++++++++++++++++
 3 files changed, 469 insertions(+), 19 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/vgic_its_save.c

-- 
2.39.5


