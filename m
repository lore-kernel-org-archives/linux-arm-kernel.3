Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEE81073CA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 11:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6TzX40mZ42Ra39otAJCKSTIeu0P/Czs5MfsYtFj7/fo=; b=ekNHsuH/yuhd9+BswuJDmvrGWc
	vE7hKSqlhOAVsaPYdYcNsKMPF0e3lb/6f2HaHVFvUtjwAY1J6JUkAD+HoBVDe3ec6sjHt5JY91OqO
	b7mlenjZSrsrJASdqLOX93Bya/wNHRv6k8hOZfD6ZD7ZtBz06uI8FOhsD0Lui2MIStXIi+t3mYonc
	eknjwTvIZh5g8qxFy9r4q0KSjP1MgO4IPFUXWZCbBdLoXHjx6qhE1vSaJxN3Xo93r0mGzvuC5XGN/
	3cscd7xdRwYVVwH+LlYf1m+6AhzO1KmBwMKn41MN5cIm04HGHm1hK7sNvcL3Hk0g4F8BOJ+1q8SME
	PuFuoFpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAR9d-00000008kjO-0deG;
	Wed, 08 Apr 2026 11:33:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAR9a-00000008khX-0moK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 08 Apr 2026 11:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=6TzX40mZ42Ra39otAJCKSTIeu0P/Czs5MfsYtFj7/fo=; b=gSwmlzvySp4I9bHhapW2U8Puw6
	uo3jm5afYRluhqtMwvZ9J52kY8F8p/mVCtDV1z1aia/iUUbITmUAp6O9Fs0x4FJFm/0mHGWyGx3qs
	f/UnZOJZWu3DE+5Hogsb3qtdcr/z55k64TgjzJ5DGqRIrd2B546+3TmzzznNtixaffyp3uaaUnt63
	4nJG1oU+hpbKpMs6uiK+z39WyX4S1aVAkM1hPZ65PYBxR8/Ef8caMcndZgOCQx97yuv0kQ5UojHtJ
	jfsQufYmR25whddmpm1iyU/O/Js85gtQTpsGW9Nu1z3iQH+/M5vHIuBetjEmVVPPwbrGxT79ow8xJ
	W1AucIZA==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAR9V-00000005Ier-2k1t;
	Wed, 08 Apr 2026 11:32:57 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAR9V-00000008n9x-0nmU;
	Wed, 08 Apr 2026 12:32:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 0/5] KVM: arm64: vgic: Fix IIDR revision handling and add revision 1
Date: Wed,  8 Apr 2026 12:30:31 +0100
Message-ID: <20260408113256.2095505-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
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

The uaccess write handlers for GICD_IIDR extract the revision field
from the wrong variable, making it impossible for userspace to actually
change the implementation revision. Fix that.

Additionally, allow userspace to select IIDR revision 1, restoring the
behaviour from before commit d53c2c29ae0d ("KVM: arm/arm64: vgic: Allow
configuration of interrupt groups") where interrupt groups are not
guest-configurable. This is needed by hypervisors that were reverting
that commit to preserve the original guest-visible semantics, and to
allow for a safely controlled deployment of the new behaviour.

For GICv2, kill the v2_groups_user_writable flag and make the behaviour 
depend directly on the IIDR. The existing default behaviour of setting 
the IIDR to revision 3 and allowing the groups to be writable by the 
*guest* but just not by userspace was just weird, and almost certainly
not intentional. (New in v2 posting).

Tested on Graviton 3 (Neoverse-V1) metal for GICv3 selftests, and
under QEMU TCG with GICv2 emulation for GICv2 selftests.

v2:
 • Fixed -Wdiscarded-qualifiers warning from 0-day bot.
 • Remove GICv2 v2_groups_user_writable flag and just use IIDR.
 • Address Marc's review feedback (no special cases in read_group,
   other minor cleanups).

v1: https://lore.kernel.org/all/20260407210949.2076251-1-dwmw2@infradead.org/

David Woodhouse (5):
      KVM: arm64: vgic: Fix IIDR revision field extracted from wrong value
      KVM: arm64: vgic: Allow userspace to set IIDR revision 1
      KVM: arm64: selftests: Add vgic IIDR revision test
      KVM: arm64: vgic: Remove v2_groups_user_writable and use IIDR revision directly
      KVM: arm64: selftests: Add GICv2 IGROUPR writability test

 arch/arm64/kvm/vgic/vgic-mmio-v2.c                 |  18 +--
 arch/arm64/kvm/vgic/vgic-mmio-v3.c                 |   6 +-
 arch/arm64/kvm/vgic/vgic-mmio.c                    |   4 +
 include/kvm/arm_vgic.h                             |   4 +-
 tools/testing/selftests/kvm/Makefile.kvm           |   2 +
 .../testing/selftests/kvm/arm64/vgic_group_iidr.c  | 118 +++++++++++++++
 tools/testing/selftests/kvm/arm64/vgic_group_v2.c  | 168 +++++++++++++++++++++
 7 files changed, 306 insertions(+), 14 deletions(-)


