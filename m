Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E399C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 22:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Plrr8k8PwbP0asNK8PLRLisKRR82MlkAeS358DI6Z6Y=; b=PTW+pJXrzfv4M3WXcOf5PMRaSg
	MBp7SFpmVZJ4yBTX44P2jPevSHAeudXKbGKW5wg8mWM+qheilwlBgCNeYAvbXZc0urkPHGAqFNPPm
	ahMy38PjBe3zPkolJiNODPRPYlBxYy+ttwl7lIDcXmoo1e3/CEEUlT6casJqFUijrT8oHYWS/MEaS
	CzZoONfGY2AnAymRJtbziCEjh1Irwt2uK+IGpusNDIGhCsZtAg9TMeCk7VYFLLfqYD9Q6LKHXR15T
	gJQignROLycJoOhkJ4eCYlRyJXeEYxvG/8g0AUisBPEIEP9xmRRRMb6QwgdpRqiqVxjDmEJCBVnly
	67ronCGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv0LF-00000003GT0-3acM;
	Fri, 14 Aug 2026 22:25:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv0L9-00000003GS8-23GE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 22:25:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54F181BCA;
	Fri, 14 Aug 2026 15:25:21 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 091D93F632;
	Fri, 14 Aug 2026 15:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786746325; bh=6/V4aV3g0qBuiI8PmXGjHqwJRwdTQPSXQ+huEkBWn6M=;
	h=From:To:Cc:Subject:Date:From;
	b=gkLremvsiYLZ1ce5HKb0X2QbVeMJPn/ITko7pdh9kZC0H1Cz7GK6xNHbQ3Rz3126P
	 Xf3PwClxmIjqS3PmDICtaH2bKpYMGPT5omfmhabRR6lgmnBBv+4/LuEfnnJKFmPUh+
	 t5ITEnbKscduYz0JubZxreNQV9q/7x9w5ikpMGt4=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matt Fleming <matt@codeblueprint.co.uk>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 0/2] arm64: ptdump flush fixes
Date: Fri, 14 Aug 2026 23:24:56 +0100
Message-ID: <20260814222458.584906-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_152527_701335_011DBBA7 
X-CRM114-Status: GOOD (  13.40  )
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

This series fixes two problems around ptdumps:

1. note_page_flush(), which flushes out the last row of ptdumps, does
   not account for address spaces that have IA < 64. Other than making
   the last region extremely huge, the attributes of the last region
   within the address spaces appear to extend all the way to 1 << 64.

2. KVM/arm64's stage-2 ptdump missed calling note_page_flush().

To address Will's comment [1], I have created an end_address field for
struct ptdump_pg_state, and initialized it with the end address of the
ptdumps. It follows the same convention as the last range->end:
exclusive end, except for the case where the address space ends at
1 << 64. In that case it is set as ULONG_MAX.

Caching the end address avoids duplicating the range iteration in
note_page_flush(), at the cost of duplicating state in ptdump_pg_state.

Series is based on v7.2-rc5.

* Changes from v2:

  - Instead of scanning ptdump_state.range[] to find the end address,
    cache the end address in a new field end_address when we initialize
    struct ptdump_pg_state.

  - Adjust KVM's struct ptdump_pg_state initialization so it uses
    end_address instead of ptdump_state.range[].

  - Collected Reviewed-by and Tested-by from Dev, thanks!

  - v2: https://lore.kernel.org/r/20260724185431.2990395-1-weilin.chang@arm.com/

* Changes from v1:

  - Instead of manually calling note_page() for flushing, fix
    note_page_flush() so that it ends the ptdump at the end of the
    address space.

  - Changed the start address of the second marker to ULONG_MAX for KVM
    ptdump, so we don't output extra marker names, and advance past the
    end of the marker array.

  - v1: https://lore.kernel.org/r/20260717231233.2299068-1-weilin.chang@arm.com/

Thanks!

[1]: https://lore.kernel.org/r/anXFo-igVdqrCogQ@willie-the-truck/

Wei-Lin Chang (2):
  arm64: ptdump: Make note_page_flush() range aware
  KVM: arm64: ptdump: Flush the last region

 arch/arm64/include/asm/ptdump.h |  2 ++
 arch/arm64/kvm/ptdump.c         | 11 +++++++----
 arch/arm64/mm/ptdump.c          | 14 +++++++++++++-
 3 files changed, 22 insertions(+), 5 deletions(-)

-- 
2.43.0


