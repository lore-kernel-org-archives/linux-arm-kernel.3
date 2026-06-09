Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C18CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PrEJxF0yh93aYoKZLB7gzVG9smZNwV0emvSqK1PE4BQ=; b=R98We99kWwKu/79SeEM8DPtr8r
	SBu8UU4b25bbyfuZ34pgyN951MZH9CqXR7a+SjKfZZIWtxP9uzljiilGrTe525UnkaVQt8RPSZElG
	a+75Fof2kLyiMcz6YfaMYz0EA24ptdK/9U0fqTYxpCyqZ73DMOT+1MEu8TTliGoezu09FhYMLhtaD
	cZe0aBfOsGM2doHqdzM36MvaMY8nRN1ejLX9D1CAwVZiuv0Ppv7zmNIaCWbYHMLP9eD7h+UDk5ueT
	GDE03bcjMbj433TRkONg/JHzaJWccuFBASuQg5A5y/jXOQe1eP0TlKEMVosVi87I+ZtReAfUV1QFF
	kkTEAjbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtRq-00000005JNK-09C7;
	Tue, 09 Jun 2026 10:12:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtRm-00000005JLB-1PKX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 10:12:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 846BA2680;
	Tue,  9 Jun 2026 03:12:30 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8DD7D3FDBD;
	Tue,  9 Jun 2026 03:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780999955; bh=gswkRcdPDTUG0hZICYvu7w+a1ECgSO14nXP3KW8/bSk=;
	h=From:To:Cc:Subject:Date:From;
	b=kPN0JCP5/GIB2JYr/REGoTgPe0cOacbXResCybyEnBdBo9vnJexI/zQEhFStVAxWy
	 AJ2zAJ2L3+WSby5Kw2cAwvxYF25lNwgkt9rbObELbL0jcDSHqvdvoBxFlhX+yNogS2
	 fSJEYQkmpqiN4AH9+zc2FD735k2yfGIjwrocvi80=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	will@kernel.org
Subject: [PATCH 0/3] arm64: errata: Mitigate TLBI errata on various Arm CPUs
Date: Tue,  9 Jun 2026 11:12:00 +0100
Message-Id: <20260609101203.1512409-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_031238_432543_ACB3036D 
X-CRM114-Status: UNSURE (   7.85  )
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

A number of CPUs developed by Arm suffer from errata whereby a broadcast
TLBI;DSB sequence may complete before the global observation of writes
which are translated by an affected TLB entry.

The ARM64_WORKAROUND_REPEAT_TLBI workaround is sufficient to mitigate
the issue. This series enables the workaround on affected parts,
requiring the addition of MIDR values for C1-Ultra and C1-Premium.

I've based the series on the arm64 for-next/core branch to avoid
conflicts with the recent formatting changes to
Documentation/arch/arm64/silicon-errata.rst.

This issue has been assigned CVE ID CVE-2025-10263, and Arm have
published a security bulletin:

  https://developer.arm.com/documentation/112137/latest/

This will require manual backporting, so I haven't CC'd stable
explicitly. Once this is queueud I'll push out branches with backports
to the active stable trees.

Thanks,
Mark.

Mark Rutland (3):
  arm64: cputype: Add C1-Ultra definitions
  arm64: cputype: Add C1-Premium definitions
  arm64: errata: Mitigate TLBI errata on various Arm CPUs

 Documentation/arch/arm64/silicon-errata.rst | 42 +++++++++++++++++++++
 arch/arm64/Kconfig                          | 36 ++++++++++++++++++
 arch/arm64/include/asm/cputype.h            |  4 ++
 arch/arm64/kernel/cpu_errata.c              | 32 +++++++++++++++-
 4 files changed, 112 insertions(+), 2 deletions(-)

-- 
2.30.2


