Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA530C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GBZrfrNZvXL9/hhC+705GE6IFkS8NTjU/aOVX4lNL00=; b=cPW8TgTm66lW0FMDpAj/ImayeN
	HSsVVKBin8LHio0LxuieUHcwmMkjxkb4Z9oHuTr8bL7tjTNSMwpcKEJM9r8yN4nQP8cUoB4olQktn
	JuVzL3QTgZZVbntS3/uON7i8Gl+DBwGAEXKBRTMj3LLSZvraTTyZ/hyjRpzwcY38G+HlO62DDUmMt
	RPQOGKbZeOI02U9YP2c5gjukbKUwJ3C2bO8zN14srETmJ8sZmcQP/upyJtFPxHIebZKhtbYAcijTR
	zRzjYcSOi75qrzDwmV6e4sTQj9/naa+ztXsSsp10JvorZywDyzj4uKPSfsSVVcgi9KK5LsNX/sKFD
	mSFJ3PgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnL2v-0000000H6E7-0KeV;
	Fri, 24 Jul 2026 18:54:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnL2s-0000000H6CT-0LU9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 18:54:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A89CB1476;
	Fri, 24 Jul 2026 11:54:43 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04F173F66F;
	Fri, 24 Jul 2026 11:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784919287; bh=BPTEFWR6tr6yjiQpGSUZyUAEINefQ30E9WfvG3o1+Eo=;
	h=From:To:Cc:Subject:Date:From;
	b=c7ljA7QLCJV9DHZyPmExC24ttLdsZ+joZ49WWP0oYB5jS7BgdX9FM0/ZziUFLpiF3
	 rqzAPY0y0uF7OQEie54KWys5LzQoqncrhCKAf0WTPW/mGFJmBDSV2OyBL8gPgmW+dG
	 ail9DpkcTYY/MAioSf1n4dtgeXfGSRRPD0bKoEvc=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Matt Fleming <matt@codeblueprint.co.uk>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v2 0/2] arm64: ptdump flush fixes
Date: Fri, 24 Jul 2026 19:54:29 +0100
Message-ID: <20260724185431.2990395-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_115454_418138_EA1B4A09 
X-CRM114-Status: GOOD (  10.47  )
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
   not account for address spacees that have IA < 64. Other than making
   the last region extremely huge, the attributes of the last region
   within the address spaces appear to extend all the way to 1 << 64.

2. KVM/arm64's stage-2 ptdump missed calling note_page_flush().

Please see the patches for more detail.

* Changes from v1 [1]:

  - Instead of manually calling note_page() for flushing, fix
    note_page_flush() so that it ends the ptdump at the end of the
    address space.

  - Changed the start address of the second marker to ULONG_MAX for KVM
    ptdump, so we don't output extra marker names, and advance past the
    end of the marker array.

Thanks!

[1]: https://lore.kernel.org/kvmarm/20260717231233.2299068-1-weilin.chang@arm.com/

Wei-Lin Chang (2):
  arm64: ptdump: Make note_page_flush() range aware
  KVM: arm64: ptdump: Flush the last region

 arch/arm64/kvm/ptdump.c | 16 ++++++++++++----
 arch/arm64/mm/ptdump.c  | 17 ++++++++++++++++-
 2 files changed, 28 insertions(+), 5 deletions(-)


base-commit: 679d7201c1f09e37fa1c12ce28d84079c17fc87f
-- 
2.43.0


