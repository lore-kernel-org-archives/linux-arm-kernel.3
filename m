Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE65CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 12:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lHyFWkcD1tak3aCabuEGcsNjmaeUE5sDRHI0wMf7ceY=; b=e8pmcJL8WDiQyRVaKZLMoVyPK4
	9YueuH9/p85UfO52iIXmOn/s1h5uLAit6Jrx7hkHDjvfMl1z1J9/HjQw4XAisHN/9fta0j6zli6F2
	oCfi6FAhJuFmmFVludOMJ8uBLZfx0D4vFeXZlMPKFCJF9DQcih/TSjZwTmhBMMUYYn+EIAN/4x/wb
	UiMy5wbZBKqFS1c84WVtlpR6yhNxiqMZGThK9s1sv/MUT5qdC6iNIhJ/zwL0hQNK3JP18YEF/FljH
	Pci01i+h03LqrVaQ6XkNhM/aNTOPNHPrM0zVacxt7LtMU04T4TlcFhwhfqjkxYlUgwVST2VsWKJK+
	a/i+CK9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqAFJ-000000069ln-3EYw;
	Sun, 24 Aug 2025 12:54:53 +0000
Received: from smtps.ntu.edu.tw ([140.112.2.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqA4u-00000006996-2Scw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 12:44:11 +0000
Received: from x415ea.vlan11.wl120.cc.ntu.edu.tw (ip24-218.wifi.cc.ntu.edu.tw [140.112.24.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtps.ntu.edu.tw (Postfix) with ESMTPSA id 5BDC82E656;
	Sun, 24 Aug 2025 20:43:47 +0800 (CST)
From: b10902118 <b10902118@ntu.edu.tw>
To: oleg@redhat.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	b10902118 <b10902118@ntu.edu.tw>
Subject: [PATCH 0/3] ARM/arm64: ptrace: fix unaligned hardware breakpoint validation for 32bit
Date: Sun, 24 Aug 2025 20:43:14 +0800
Message-Id: <20250824124317.390795-1-b10902118@ntu.edu.tw>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_054408_762712_FC1AAC00 
X-CRM114-Status: UNSURE (   8.61  )
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

PTRACE_SETREGSET and PTRACE_SETHBPREGS fail when setting a hardware
breakpoint on a non-4-byte aligned address with a valid length to
a 32-bit tracee. The length should be valid as long as the range
started from the address is within one aligned 4 bytes.


The Cause:

The kernel modifies a breakpoint's addr and ctrl separately, but
each modification comes with validation, so the first validation
sees the user-provided addr and old ctrl (and vice versa for
PTRACE_SETHBPREGS). This combination can be invalid if the address
is unaligned and the control's length is too long (ex: the 4-byte
default).

The kernel only checks the alignment for 32-bit tracees, so this only
happens to them.


The Fix:

1. Fix PTRACE_SETREGSET by modifying addr and ctrl together.

2. Mitigate PTRACE_SETHBPREGS by minimizing default length.

   This cannot be fixed without removing or relaxing the alignment
   check because partially modified breakpoints are unavoidable for
   PTRACE_SETHBPREGS, which receives either addr or ctrl per call.


b10902118 (3):
  arm64: ptrace: fix hw_break_set() by setting addr and ctrl together
  arm64: ptrace: minimize default bp_len for hw breakpoints to pass
    check
  ARM: ptrace: minimize default bp_len for hw breakpoints to pass check

 arch/arm/kernel/ptrace.c   | 16 ++++++++++++-
 arch/arm64/kernel/ptrace.c | 49 ++++++++++++++++++++++++++++++++------
 2 files changed, 57 insertions(+), 8 deletions(-)

-- 
2.50.1


