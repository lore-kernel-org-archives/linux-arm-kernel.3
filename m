Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2047DE9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zM9Zo47+NRAgLWz5wQrX/J8d2M8u0d6t3FJfloErUUo=; b=LQDXme6ckOxCzZSxCEsE+ewtjW
	VAb8AmK5o9dIFtylYe6AKqgdiEpJ+hA9H3gu0xTnX/7+dTuTfsEXEYs2ZWS/yVj5Blp2exAiqtuie
	ng+B8r6DYVTwdaw4lh2NnW0kN4rDlzzNcxKxcPxmOYVlmQnXabSqW4eb4agA6hDBmNhEx/ky9xjas
	4ypge4675+xZLoGLtt6psdm1cbEvaIpRtBz4Y/PFABJY/PQNrs6LDozzUGeNF3r8+6/6QgAX+MBQi
	y3+vtQnjmQN78nGrq36vM+Rgnlaip+x2lSqs5bicTjvkvQAHTyylhKzzStLVFM+qk7e/iTFBvlwCv
	Sbc4+FUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsked-0000000A6eY-3FGn;
	Wed, 18 Feb 2026 16:43:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskea-0000000A6dp-3u22
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 16:43:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79383339;
	Wed, 18 Feb 2026 08:43:49 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A2D8F3F62B;
	Wed, 18 Feb 2026 08:43:54 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	ryan.roberts@arm.com,
	will@kernel.org
Subject: [PATCH 0/2] arm64: tlb: Optimize ARM64_WORKAROUND_REPEAT_TLBI
Date: Wed, 18 Feb 2026 16:43:46 +0000
Message-Id: <20260218164348.2022831-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_084357_017273_C9BB5250 
X-CRM114-Status: GOOD (  11.59  )
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

Hi all,

Some Arm partners have complained that the overhead of
ARM64_WORKAROUND_REPEAT_TLBI is too large, and despite the relevant
errata being categorized as "rare", they still want to use the
workaround in some deployments.

For historical reasons, the current workaround is far stronger (and
consequently far more expensive) than necessary. In part, the SDENs had
somewhat misleading descriptions, which have recently been clarified:

* Arm Cortex-A76 erratum #1286807
  SDEN v33: https://developer.arm.com/documentation/SDEN-885749/33-0/

* Arm Cortex-A55 erratum #2441007
  SDEN v16: https://developer.arm.com/documentation/SDEN-859338/1600/

* Arm Cortex-A510 erratum #2441009
  SDEN v19: https://developer.arm.com/documentation/SDEN-1873351/1900/

Patch 1 allows the __TLBI*() helpers to generate XZR as an argument.
I've split this out as its own patch to make bisection easier in case we
see any problems due to incorrect trap+emulation handling of XZR.
Otherwise this shouldn't have any functional change.

Patch 2 is the actual optimization, spelled out in detail in the commit
message. The gist is that it's not necessary to duplicate every
individual TLBI, and it's sufficient to have a single arbitrary TLBI;DSB
after any number of batched TLBIs;DSB.

As mentioned in the commit message for patch 2, this results in fewer
alternatives and better code generation whenever
ARM64_WORKAROUND_REPEAT_TLBI is built into the kernel, so it's a
(trivial) win on hardware that isn't affected by the relevant errata.

Mark.

Mark Rutland (2):
  arm64: tlb: Allow XZR argument to TLBI ops
  arm64: tlb: Optimize ARM64_WORKAROUND_REPEAT_TLBI

 arch/arm64/include/asm/tlbflush.h | 63 ++++++++++++++++++-------------
 arch/arm64/kernel/sys_compat.c    |  2 +-
 arch/arm64/kvm/hyp/nvhe/mm.c      |  2 +-
 arch/arm64/kvm/hyp/nvhe/tlb.c     |  8 ++--
 arch/arm64/kvm/hyp/pgtable.c      |  2 +-
 arch/arm64/kvm/hyp/vhe/tlb.c      | 10 ++---
 6 files changed, 49 insertions(+), 38 deletions(-)

-- 
2.30.2


