Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5880FC71131
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FhMMj0edu/HvO8ePV5PlKjnSEISm5cjZVKNG9HOxoPY=; b=4xDFAFK4kaWhUYKEAHSqGIuYz8
	nJpmvO12JTULE5Dr3ReEzLDcv6mvHriTmbUOFhFM5ghGPUuEr5JXcl+cQprh9BBB8QbxwkirYQ+cW
	waih0DQPf9vHj9cnlLSKNYdLtFCsYHe+BogjmjLtlVgZ/NYqrfJwcTiJAObl0bZToWfTH2FxOJdQ3
	6Jdj13OWeBJmnUlPb1D8fbYJIsTVK8iWiP1i4WK9OAyEzTn5/GjGj86b69h3FIY0ESl3n4j1UK8Q+
	bZZAmjhoXwnO4wrAD0KIA3ArSY1mHQPgmbX0y3JDTMzz5/kx3ARw1Z8ptVlfSnGTYvXrNIZ64kEfz
	SzmZKHeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMnp-0000000AEVf-49S1;
	Wed, 11 Jun 2025 14:51:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJ1E-00000009fAq-24M6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 10:49:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76C981655;
	Wed, 11 Jun 2025 03:49:00 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 316543F77D;
	Wed, 11 Jun 2025 03:49:18 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	ardb@kernel.org,
	frederic@kernel.org,
	james.morse@arm.com,
	joey.gouly@arm.com,
	scott@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 0/6] support FEAT_LSUI and apply it on futex atomic ops
Date: Wed, 11 Jun 2025 11:49:10 +0100
Message-Id: <20250611104916.10636-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_034920_572600_0F31B61D 
X-CRM114-Status: UNSURE (   8.22  )
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

Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
previleged level to access to access user memory without clearing
PSTATE.PAN bit.

This patchset support FEAT_LUSI and applies in futex atomic operation
where can replace from ldxr/stlxr pair implmentation with clearing
PSTATE.PAN bit to correspondant load/store unprevileged atomic operation
without clearing PSTATE.PAN bit.

Patch Sequences
================

Patch #1 adds cpufeature for FEAT_LUSI

Patch #2 adds Kconfig for FEAT_LUSI

Patch #3 separtes former futex atomic-op implmentation from futex.h
to futex_ll_sc_u.h

Patch #4 implments futex atomic operation using lsui instruction.

Patch #5 introduces lsui.h to apply runtime patch to use former
implmentation when FEAT_LUSI doesn't support.

Yeoreum Yun (6):
  arm64: cpufeature: add FEAT_LSUI
  arm64/Kconfig: add LSUI Kconfig
  arm64/futex: move futex atomic logic with clearing PAN bit
  arm64/futex: add futex atomic operation with FEAT_LSUI
  arm64/asm: introduce lsui.h
  arm64/futex: support futex with FEAT_LSUI

 arch/arm64/Kconfig                     |   8 +-
 arch/arm64/include/asm/futex.h         |  99 ++++++-------------
 arch/arm64/include/asm/futex_ll_sc_u.h | 115 +++++++++++++++++++++
 arch/arm64/include/asm/futex_lsui.h    | 132 +++++++++++++++++++++++++
 arch/arm64/include/asm/lsui.h          |  37 +++++++
 arch/arm64/kernel/cpufeature.c         |   8 ++
 arch/arm64/tools/cpucaps               |   1 +
 7 files changed, 331 insertions(+), 69 deletions(-)
 create mode 100644 arch/arm64/include/asm/futex_ll_sc_u.h
 create mode 100644 arch/arm64/include/asm/futex_lsui.h
 create mode 100644 arch/arm64/include/asm/lsui.h

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


