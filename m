Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A0DE937E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 14:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RiDpDTMGGx8eiQSD+q2v/5nmcknSOpW0eF/+RmUk7II=; b=KzQM8sQC7bVRpGGYPD3jEYZimm
	IHb5OzRlXdd97cRepj0oBls0k4Atg7kVigjivZXyTJ3Mkbto1idAuq5R9Hq+6r3ow+JQ5mg+BkxXU
	nIwDAyR6NDKZdSYtMvCQWjv8gk9iPCjH0Wu3Up+3sYoGhvEptu7FQhRxKm9SnMbSYEslmNx44JJcQ
	UzIQ3aiF1g7+9qpFuwB/jP1rEU2vnboS4VQ9Lj7BvUOVd8oSavJIAPDxYcwFtfu5HHQVfh5pjtyVD
	37zHOnxpCuAH0ldSKX040GJuqiUAztx1aG8/chcCCY6zvK06aFEtZ8+0uiWS+Oa8GJvGKHlHqHUdU
	3AU44AqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvi8-0000000ENCd-29UI;
	Sun, 12 Apr 2026 14:22:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvi5-0000000ENBH-0brP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 14:22:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A98523555;
	Sun, 12 Apr 2026 07:22:39 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B0CE3F641;
	Sun, 12 Apr 2026 07:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776003765; bh=x5b6a2lnu4dYKEG9M/n+bLgsEZhpt2lX5ouBIpHYT7E=;
	h=From:To:Cc:Subject:Date:From;
	b=Q4w/sVDeLN62hSuLNCnXhATJ2i/gfeOMvOG5WNLbhewr1EplLMWXzA1GqhytEX2k8
	 AdtE9x/iT/pZ3CTmEjXx8xhJDdHNP4XYgr2mBlZhnTvaMBcAY1WxPwOuPzmpNJmDa0
	 ywOcA5dEIqotsHAmui1HLFUb6j0GnTWm+8FGi4Ak=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v2 0/4] KVM: arm64: selftests: Basic nested guest support
Date: Sun, 12 Apr 2026 15:22:12 +0100
Message-ID: <20260412142216.3806482-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_072249_408687_8A657AAD 
X-CRM114-Status: GOOD (  11.58  )
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

Hi,

This is v2 of adding basic support for running nested guests (L2) in
kselftest. After getting feedback from v1 [1], I mostly started over
from scratch. Therefore you won't lose any context if you start here.
Nonetheless, I still compiled the broad changes.

Patch 1 adds GPR save/restore code for guest, and vEL2 exception
vectors.

Patch 2 adds other hypervisor helpers.

Patch 3 adds the hello_nested selftest to jump from vEL2 -> EL1 -> vEL2.

Patch 4 enhances the hello_nested selftest so that vEL1 handles a
hypercall from EL1.

* Changes from v1 [1]:

  - Set HCR_EL2.E2H for the guest.

  - Pivoted from "userspace setting up everything" to "make L1 more like
    a proper hypervisor". Guest EL2 exception vectors, and GPR
    save/restore are added. There is also some infrastructure to
    save/restore system registers, right now only SP_EL1 is
    saved/restored to give L2 a stack. More system registers can be
    added in the future.

  - Removed the stage-2 page table generator. The stage-2 page table
    generator was bad, and the changes needed for the previous point
    alone is already making the series larger, so I decided to not add
    any guest stage-2 code in this iteration.

Thanks!

[1]: https://lore.kernel.org/kvmarm/20260325003620.2214766-1-weilin.chang@arm.com/

Wei-Lin Chang (4):
  KVM: arm64: selftests: Add GPR save/restore functions for NV
  KVM: arm64: sefltests: Add helpers for guest hypervisors
  KVM: arm64: sefltests: Add basic NV selftest
  KVM: arm64: selftests: Enhance hello_nested test

 tools/testing/selftests/kvm/Makefile.kvm      |   4 +
 .../selftests/kvm/arm64/hello_nested.c        | 132 +++++++++++++++++
 .../selftests/kvm/include/arm64/nested.h      |  62 ++++++++
 tools/testing/selftests/kvm/lib/arm64/entry.S | 137 ++++++++++++++++++
 .../selftests/kvm/lib/arm64/hyp-entry.S       |  77 ++++++++++
 .../testing/selftests/kvm/lib/arm64/nested.c  |  58 ++++++++
 6 files changed, 470 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/hello_nested.c
 create mode 100644 tools/testing/selftests/kvm/include/arm64/nested.h
 create mode 100644 tools/testing/selftests/kvm/lib/arm64/entry.S
 create mode 100644 tools/testing/selftests/kvm/lib/arm64/hyp-entry.S
 create mode 100644 tools/testing/selftests/kvm/lib/arm64/nested.c

-- 
2.43.0


