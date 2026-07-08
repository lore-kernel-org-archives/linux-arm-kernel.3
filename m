Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73FCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 16:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yfr5Zf8QzEAmiPLqkiJdK20n52r9vrdmIA+s+Q3YgkU=; b=tk/UH6QgBehGSXWq3XUer/7Ysx
	Y4PLCRJVBS9jhd69rWvjwntSslTYUQUJSzKV6BC4Gm7CqdjE83XajD3hN7I2//nxrPx2iLacFXon5
	Kytk3/eIndul0Gm85ajV23Yj6shDG/BP9KU8II1h28rpQye3RiOFzW5Hn7CyZKzX3oLjMawLY+sLE
	uTtbh59dlSz4dej/4V6Fdhxpp5DbQH06dXGV3A1Vg5jqrybKo7LaftyROqUt3xOyVKaWN2YVDN/GV
	naddsp0uV/LYoQCbzovv3JWovGkSBSVssLzyZNxKQGHDUGA076pkyJ/kmscijkWcmnVzEuLAdMglm
	Vi4bjjQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUtk-0000000HZfR-1EIO;
	Wed, 08 Jul 2026 16:13:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUti-0000000HZfI-3yn7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 16:13:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E8526601ED;
	Wed,  8 Jul 2026 16:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE901F000E9;
	Wed,  8 Jul 2026 16:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783527197;
	bh=yfr5Zf8QzEAmiPLqkiJdK20n52r9vrdmIA+s+Q3YgkU=;
	h=From:To:Cc:Subject:Date;
	b=QuQ5rORC2BJ+4iEkH95ElRXMac4sTZeDwlFIMs+c0EAVRrSNbJYdKVLCHsNma0q6G
	 crVKepBLgdIkmXpEXN1JkEoCjaXRu4Uvle7DTy/sB+Ep6l+cW1XCpw9J2sLT5VCFAS
	 CHLaOrUcfWitOSCaBkg67qi8ENFWWLbE0nOrEwZfm3pM/rMdza7glLLhpUwY4I9O4v
	 z/zgtpBgf28mkZt1GvcVa3881rb9e0XjU9iEFHJ+UsPaHiFG8y/iQubf/4pH+GdbeH
	 ElSQmDLINOMKkO6hHkCEh86k6Wgb4gc82Q3E544abnmfapLTrPUgjnEAzrFrL+4OZa
	 R9trNpAQZXiAQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1whUtf-00000002uOx-1Kbd;
	Wed, 08 Jul 2026 16:13:15 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Will Deacon <will@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] KVM/arm64 fixes for 7.2, take #2
Date: Wed,  8 Jul 2026 17:12:42 +0100
Message-ID: <20260708161242.1912769-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, fuad.tabba@linux.dev, broonie@kernel.org, smostafa@google.com, oupton@kernel.org, sebastianene@google.com, sudeep.holla@kernel.org, vdonnefort@google.com, weilin.chang@arm.com, will@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Paolo,

Here's the second drop of KVM/arm64 fixes for 7.2. This time around,
we have a locking issue in kvm_io_bus_get_dev(), which is only used by
arm64, a few S2 page table fixes, a set of FFA proxy fixes for pKVM,
and finally a very esoteric fix for emulation of sign-extended loads
from MMIO. Not only this is rather niche, it dates back to day one of
KVM support for 32bit ARM...

Note that this is on top of the kvmarm-fixes-7.2-1 tag pull request
posted at [1] about 12 days ago.

Please pull,

	M.

[1] https://lore.kernel.org/all/20260626133526.817232-1-maz@kernel.org

The following changes since commit d098bb75d14fde2f12155f1a95ec0168160867ce:

  KVM: arm64: account pKVM reclaim against the VM mm (2026-06-22 10:48:08 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-7.2-2

for you to fetch changes up to 8d187d4b33c262c0f3e44842553521151d8629e8:

  KVM: arm64: Fix propagation of TLBI level in kvm_pgtable_stage2_relax_perms() (2026-07-07 17:43:39 +0100)

----------------------------------------------------------------
KVM/arm64 fixes for 7.2, take #2

- Move locking for kvm_io_bus_get_dev() into the caller, ensuring
  race-free checks that the returned object is of the correct type

- Fix initialisation of the page-table walk level when relaxing
  permissions

- Correctly update the XN attribute when relaxing permissions

- Fix the sign extension of loads from emulated MMIO regions

- Assorted collection of fixes for pKVM's FFA proxy, together with a
  couple of FFA driver adjustments

----------------------------------------------------------------
Fuad Tabba (2):
      KVM: arm64: Fix sign-extension of MMIO loads
      KVM: arm64: selftests: Add MMIO sign-extending load test

Marc Zyngier (2):
      KVM: Move kvm_io_bus_get_dev() locking responsibilities to callers
      KVM: arm64: Fix propagation of TLBI level in kvm_pgtable_stage2_relax_perms()

Mostafa Saleh (3):
      KVM: arm64: Fix bounds checking in do_ffa_mem_reclaim()
      KVM: arm64: Ensure FFA ranges are page aligned
      firmware: arm_ffa: Fix out-of-bound writes in ffa_setup_and_transmit()

Oliver Upton (2):
      KVM: arm64: Ensure level is always initialized when relaxing perms
      KVM: arm64: Only update XN attr when requested during S2 relaxation

Sebastian Ene (3):
      KVM: arm64: Validate the offset to the mem access descriptor
      KVM: arm64: Zero out the stack initialized data in the FFA handler
      firmware: arm_ffa: Fix Endpoint Memory Access Descriptor offset calculation

 arch/arm64/kvm/hyp/nvhe/ffa.c                     |  44 ++--
 arch/arm64/kvm/hyp/pgtable.c                      |  15 +-
 arch/arm64/kvm/mmio.c                             |   7 +-
 arch/arm64/kvm/vgic/vgic-its.c                    |   2 +
 drivers/firmware/arm_ffa/driver.c                 |  25 ++-
 include/linux/arm_ffa.h                           |   9 +-
 tools/testing/selftests/kvm/Makefile.kvm          |   1 +
 tools/testing/selftests/kvm/arm64/mmio_sign_ext.c | 255 ++++++++++++++++++++++
 virt/kvm/kvm_main.c                               |  16 +-
 9 files changed, 331 insertions(+), 43 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/mmio_sign_ext.c

