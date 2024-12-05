Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4776E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zfxb2RLPC+1/iUCdJ/q2I8FfgFuLsBd7nl7oCaiu/iE=; b=zPZDXeiO+zFsjhJ1CLBw1fwKgv
	/BJfGesu4MZX94M6UxN0TLCWc+KMOJnyqHruRw72NdHuynhtDKog2Dz712r1bNsv9kCyvgMh/FWhb
	iL5J/joBvMZr7wP4tpaUiO8Qi+wLEw/7k4sZw/NgjlEImeZTZuYQLvp3Y22VwfHpL0NW6+c0OWH3C
	qsfZrKBK0KWED0M7aW4gnpWUAirTSHBP18M4Ksa+s+vgWYExlHUP4sJalOdptT9YdU4ya6eQC8RWq
	zBCImo/Lw7QaMmXziph2wR9Ru8lmke30RfeAflJeZfetJgMvPZ1tdYh5n1JQcUROQGr5t/C9GiFeb
	R+RIjyxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAsE-0000000FvbR-2aLU;
	Thu, 05 Dec 2024 12:22:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAn5-0000000Fun4-0U12
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 12:17:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70DEF1063;
	Thu,  5 Dec 2024 04:17:32 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 98A693F5A1;
	Thu,  5 Dec 2024 04:17:03 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	joey.gouly@arm.com,
	mark.rutland@arm.com,
	will@kernel.org
Subject: [PATCH 0/4] arm64: ptrace: fix handling of partial SETREGSET calls
Date: Thu,  5 Dec 2024 12:16:51 +0000
Message-Id: <20241205121655.1824269-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_041707_193993_6C4CD05A 
X-CRM114-Status: GOOD (  11.50  )
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

A few of arm64's regsets forget to handle partial-length SETREGSET
calls, and copy a small portion of uninitialized kernel stack memory to
the backing storage of the relevant registers. In all cases the read is
limited to a specific slot on the stack, and the issue does not provide
a write mechanism.

For example, a zero-length SETREGSET to NT_ARM_FPMR will reset FPMR to
an arbitrary uninitialized value from the kernel stack:

| # ./fpmr-test
| Attempting to write NT_ARM_FPMR::fpmr = 0x900d900d900d900d
| SETREGSET(nt=0x40e, len=8) wrote 8 bytes
|
| Attempting to read NT_ARM_FPMR::fpmr
| GETREGSET(nt=0x40e, len=8) read 8 bytes
| Read NT_ARM_FPMR::fpmr = 0x900d900d900d900d
|
| Attempting to write NT_ARM_FPMR (zero length)
| SETREGSET(nt=0x40e, len=0) wrote 0 bytes
|
| Attempting to read NT_ARM_FPMR::fpmr
| GETREGSET(nt=0x40e, len=8) read 8 bytes
| Read NT_ARM_FPMR::fpmr = 0xffff800083963d50

This series (based on v6.13-rc1) fixes affected regsets. To fix each
case there are three approaches we could follow:

(a) Preserve the registers which are not explicitly written to. Most
    other regsets (e.g. NT_PRSTATUS, NT_PRFPREG, NT_ARM_SYSTEM_CALL)
    follow this approach.

(b) Reset registers to a fixed value (e.g. zero) if not explicitly
    written to.

(c) Forbid writes that are smaller than the entire regset. For example,
    x86 does this in xfpregs_set().

For most regsets, partial-length SETREGSET calls follow option (a)
today, so I've taken that approach for all the affected arm64 regsets.

I've checked all of arm64's regsets (native, native view of compat, and
compat view of compat), and as far as I can tell, the only affected
regsets are NT_ARM_TAGGED_ADDR_CTRL, NT_ARM_FPMR, NT_ARM_POE, and
NT_ARM_GCS. All other regsets either either initialize a temporary
buffer prior to copying in, or copy directly to the backing storage, and
so don't copy uninitialized data.

There are some other cleanups which could be made here in future;
ideally we'd have a compiler warning for these cases, or a mechanism
that avoids the problem entirely.

Mark.

Mark Rutland (4):
  arm64: ptrace: fix partial SETREGSET for NT_ARM_TAGGED_ADDR_CTRL
  arm64: ptrace: fix partial SETREGSET for NT_ARM_FPMR
  arm64: ptrace: fix partial SETREGSET for NT_ARM_POE
  arm64: ptrace: fix partial SETREGSET for NT_ARM_GCS

 arch/arm64/kernel/ptrace.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

-- 
2.30.2


