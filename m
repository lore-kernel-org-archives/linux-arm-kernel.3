Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26529C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZIjsc40BexYNa4/UmyaQ5ZhdFME16IoYcTPfDokrdjs=; b=EoLMWmbgfa91LJVg+EAaYk4n6n
	nLgVZhp/8c4XtWZZRZCYHX3JhgFvEXcHjU416Cmi5i5nFyqmFBktZgDcOCj5sT5PPPtckIqS9T06q
	+0ZhxWQtekZht1rUNY+C/KF+hdRhutzQoiFbyCZy3LnU2wf4kd8roKcN2q97t1Yl/LBO/5yK7L2QE
	oToFCwE+vWHvK0bDAuG4IsRAbk2wGXQpeL8RcFYxKfuo3+jXW1zEpdCyY6bPz7m+TmX3TtulGDBjm
	NPLwTwpSpE5HEJIXIByNpBjCxI/cODZyctzPTR9Gd8UibxcyrrqusZFzpytyTbPD5+n5qn8KBfdcF
	z6FJ/kwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3od-0000000BqVX-41xh;
	Fri, 28 Feb 2025 17:06:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3jD-0000000BorV-2OCj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 17:00:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B8C1150C;
	Fri, 28 Feb 2025 09:00:59 -0800 (PST)
Received: from e126864.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CE373F6A8;
	Fri, 28 Feb 2025 09:00:42 -0800 (PST)
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tong Tiangen <tongtiangen@huawei.com>,
	Robin Murphy <robin.murphy@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH v2 0/3] arm64: Use memory copy instructions in usercopy routines
Date: Fri, 28 Feb 2025 17:00:03 +0000
Message-Id: <20250228170006.390100-1-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_090047_653166_F5C185A5 
X-CRM114-Status: UNSURE (   8.97  )
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

Hi,

This is a follow-up to the series using CPY/SET instructions in the kernel's
memory copy routines [1]. This series extends that to the usercopy routines.
This required some additions to exception fixups since a CPY instruction
accesses both user and kernel memory.

Changes in v2:
 - Improved readability of cpy_faulted_on_uaccess()
 - v1: https://lore.kernel.org/all/20250218171430.28227-1-kristina.martsenko@arm.com/

Note that this conflicts with Tong's series [2].

Thanks,
Kristina

[1] https://lore.kernel.org/all/20240930161051.3777828-1-kristina.martsenko@arm.com/
[2] https://lore.kernel.org/all/20241209024257.3618492-1-tongtiangen@huawei.com/


Kristina Martšenko (3):
  arm64: extable: Add fixup handling for uaccess CPY* instructions
  arm64: mm: Handle PAN faults on uaccess CPY* instructions
  arm64: lib: Use MOPS for usercopy routines

 arch/arm64/include/asm/asm-extable.h | 10 +++++++-
 arch/arm64/include/asm/asm-uaccess.h |  4 ++++
 arch/arm64/include/asm/extable.h     |  5 +++-
 arch/arm64/lib/clear_user.S          | 25 +++++++++++++++----
 arch/arm64/lib/copy_from_user.S      | 10 ++++++++
 arch/arm64/lib/copy_template.S       | 10 ++++++++
 arch/arm64/lib/copy_to_user.S        | 10 ++++++++
 arch/arm64/mm/extable.c              | 36 +++++++++++++++++++++++++++-
 arch/arm64/mm/fault.c                |  6 +++--
 9 files changed, 107 insertions(+), 9 deletions(-)


base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
-- 
2.34.1


