Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7467CC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4BzM6KVx3CrULleE/chJHARjg5UmkLIIEygQtH23kqM=; b=IAqvKsP2amE9V2fjJXVAaGBCBI
	y1guvaeKrtphqIlGYk90R7G8dMAGEpfy0iIpy7otraf1ZfZOvdy0PPjPsbyd8uLtlMmTHlYUjfhzd
	UlNiopb3JEN6+ZnjHKKr1GNQ+FCCHaq9CMkRSCzcjxVJ4fXboekltCOqHUL2qJTtJKCCKIz75pT3w
	sLhvGPMVREXe+jAsoikUzh5S7EX0sA66HGpoTTakpubmQaUNp3PkUZbVcn4UNlsnUkwejYjROzfCg
	efxVvVz2TxSNg/igVr35cdvcu+GDOYiLMt6CLsCGk/ZjIb/DAtZgIE6Pe4hh8tz1KxT8DLeP3YydC
	xxRMD8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdX7-00000009Y35-1RHA;
	Wed, 19 Aug 2026 10:28:33 +0000
Received: from out-148.mta1.migadu.com ([2001:41d0:203:375::94] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdX0-00000009Xzr-3Wg5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:28:29 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=YaVhIGIsz8p83eXEbXp+Vqimu9cE0WdJmkMbBsASobQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787135304; v=1; x=1787740104;
 b=j+/7hSd/yd2P78Bb6G0ncFkcmr7pOaRdq/AgYH7WgEWyW6SNVfnB3VN9U76i/gqHGbnhaDVv
 9vbNLMCbZWmt2+mkU0eVzNr/E1WDxCm/RgejL6vf3csFvRXD/ECbG46WWnxv6P6psvSEnNOYa/u
 a/+v9KPDi+jCWkv4xHAdWDpM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.lan (37.156.72.212)
	by smtp.migadu.com with ESMTPS id b8ee4b28d9b81da1;
	Wed, 19 Aug 2026 10:28:14 +0000
X-Migadu-Flow: FLOW_OUT
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
	Eric Auger <eauger@redhat.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] KVM: arm64: vgic-its: Make the ITS table save reliable
Date: Wed, 19 Aug 2026 11:28:05 +0100
Message-Id: <20260819102809.310708-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_032827_046417_8B10635D 
X-CRM114-Status: GOOD (  16.06  )
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

Marc pointed out on the v2 ITS series [1] that patch 3 fixed the wrong
end of the problem: KVM should drop the collections when the guest
changes the table that described them, rather than validating them at
save time. He also called that patch's -EINVAL a mistake, since it
aborts a save userspace has to be able to issue. This series does both,
following his answers [2] to the two open questions: purge the whole
list, and skip the offending device rather than fail.

vgic_mmio_write_its_baser() now frees the cached devices or collections
whenever the stored register value changes, not only when VALID is
cleared. It tests for a change rather than a write because the ITS
driver rewrites an unchanged GITS_BASER<n> on resume. With that in place
the check patch 3 added is unreachable, so it is reverted, and
vgic_its_save_device_tables() skips a device the table can no longer
address instead of failing the save.

Note that compute_next_devid_offset() now calls vgic_its_check_id(),
which reads guest memory for an indirect table, so the save does 2n
reads rather than n. It stays linear, as the scan stops at the first
reachable successor. Patch 1's Fixes: tag names a v4.15 commit, so it
will be picked up for stable. Drop the tag if that is not wanted.

Patches 1 and 3 apply to v7.2 unchanged, but patch 2 reverts a commit
only in kvmarm/next, so the series is based there.

Tested on QEMU: the new selftest, vgic_irq, vgic_lpi_stress and boots.
Both cases of the new selftest reset and restore the tables they saved,
and both fail without the series.

Based on kvmarm/next (57e7cf13ac26b).

Cheers,
/fuad

[1] https://lore.kernel.org/all/87ecg9owwa.wl-maz@kernel.org/
[2] https://lore.kernel.org/all/86bjaz5s6v.wl-maz@kernel.org/

Fuad Tabba (4):
  KVM: arm64: vgic-its: Free the caches when GITS_BASER changes
  Revert "KVM: arm64: vgic-its: Don't save collections the table cannot
    hold"
  KVM: arm64: vgic-its: Skip unreachable devices instead of failing the
    save
  KVM: arm64: selftests: Add ITS table save tests

 arch/arm64/kvm/vgic/vgic-its.c                |  44 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/vgic_its_save.c       | 441 ++++++++++++++++++
 3 files changed, 467 insertions(+), 19 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/vgic_its_save.c


base-commit: 57e7cf13ac26bf1a3dba6cfa601f7b2481811575
-- 
2.39.5


