Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326DA606D80A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZKRlKMZB;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pYFNCO5R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hu/VCXv0pK0QVa21PPH8FfuyU2lKhIQq9BLyUFz++I8=; b=ZKRlKMZBitXXpJUJg3H98qTyr2
	DG8FDzVAdUYzrQmwvt14cPF4Rtkpb1T9x54s8TdlxKo/bfoXz903U2lxMT+EbAo33LMSjynpAOn5f
	rEk3Mf5ap9VCHPEfteWgWwJK57eYo+98lamj92Mo8NCfDNWZR+fCTDpSXWQdtnWk9SOx8TPne3gE3
	qFpHSuWyDySCP1WNsbHoF03QUKPK0aqG7zw+HumZFnUp0Dmp1KuWgmvlP0RNQj3qbpx03IDPaBTsO
	8DNh9vPXHlglgPT5lNiDfVk5oIcbXBAvVMvr+5QdlV0Un+xRwmF9GwTs+EIEtwCL7oCmQeEjHZtE9
	k81UaVGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvDL-00000008Xi0-3Vcf;
	Thu, 05 Nov 2026 11:01:03 +0000
Received: from out-111.mta0.migadu.com ([2001:41d0:1004:224b::6f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvDI-00000008Xcy-1bpG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:01:02 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=oNPULxolfeqGA8zrrmcWP4Y839okpyulp0cDosAwCuY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793876456; v=1; x=1794481256;
 b=pYFNCO5ReUUb9bCeJh5k8Bha0VGFUNkzsI6W94p8DZtvb3jItrNzFYdis6QmrRZeXTPxBVVA
 rv5NwalCekzo2akHMoO+hdQMpOMI6rA72isnBFz6bY8Wg0eTBLFOqdE4Bbypt4xiEedTIMt7j2J
 4RabLKy843sMm9ww4zCMmWGc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a394ecf1d1f2d65a;
	Thu, 05 Nov 2026 11:00:56 +0000
X-Mizu-Trace-ID: a394ecf1d1f2d65a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Yuchao Zhang <ndaugoing@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] KVM: arm64: vgic: Drop stale LPI pending state
Date: Thu,  5 Nov 2026 11:00:47 +0000
Message-ID: <20261105110050.1244525-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_030101_009944_778F0054 
X-CRM114-Status: GOOD (  13.29  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

The GIC just keeps on giving. Three follow-ups to my LPI fixes for
redistributors with LPIs disabled [1], to fix pre-existing bugs Sashiko
found.

The first drops the pending state of every LPI targeting a
redistributor when the guest disables its LPIs, not just of those on
the AP list, so a re-enable with GICR_PENDBASER.PTZ set doesn't bring
any of them back. Linux never sets PTZ.

The second stops the pending-table save from writing to the table of a
redistributor while its LPIs are disabled.

The third stops KVM reading the pending table when mapping an LPI, so
that mapping a discarded LPI's INTID again doesn't make it pending a
second time. A Linux guest can hit that after its VMM pauses and
resumes it. It also drops the copy that patch 2 of [1] takes, which is
why it comes after the second. An LPI mapped after its redistributor
enabled LPIs no longer takes a bit the guest wrote into the table
before the enable. Keeping that needs a per-redistributor record of
the pending state of unmapped INTIDs. I can add it on top if you think
it's worth it.

A pending LPI that MOVI moves onto a redistributor with LPIs disabled,
or that a device signals there through a translation cached before the
move, can still be taken once after a PTZ-set enable. The architecture
lets KVM drop it, but that's pending state moved or raised onto a
redistributor with LPIs disabled, not state the guest gave up. I've
left it alone, but can fix it on top if you think it's worth it.

Reproducers for all three fail on kvmarm/fixes and pass with the
series. I'll fold them into vgic_lpi_stress separately.

Based on kvmarm/fixes (181a701fc14d3), which has [1].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261026092802.2636798-1-fuad.tabba@linux.dev/

Fuad Tabba (3):
  KVM: arm64: vgic: Drop the pending state of all LPIs when disabling
    LPIs
  KVM: arm64: vgic-v3: Don't save pending tables with LPIs disabled
  KVM: arm64: vgic-its: Don't read the pending table when mapping an LPI

 .../virt/kvm/devices/arm-vgic-v3.rst          |  1 +
 arch/arm64/kvm/vgic/vgic-its.c                | 33 ++++++++----
 arch/arm64/kvm/vgic/vgic-mmio-v3.c            | 13 ++---
 arch/arm64/kvm/vgic/vgic-v3.c                 | 50 ++-----------------
 arch/arm64/kvm/vgic/vgic.c                    | 16 +++++-
 arch/arm64/kvm/vgic/vgic.h                    |  1 -
 6 files changed, 49 insertions(+), 65 deletions(-)


base-commit: 181a701fc14d3d468c603b5ecfb9f12115c5fb72
-- 
2.47.3


