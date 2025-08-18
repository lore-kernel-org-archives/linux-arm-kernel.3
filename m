Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64EACA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0jrew9vlE7D4OWdvpB34tH6C2TyWPGjMSum67Fi/zJw=; b=fYWqgDpOvS8S6d/B0QDx75sgub
	YLMitJ+BpXIn8tV8DbdbUme4eSfCZORvp3OcyyYDBmGCgaCdkxKQn5KnbZ/nmJfFYO+F7f5hqKThd
	y0Dw/+DhruiHMW1yqLCuiaugskxltyJYU69EYGQ7klC90tuREsbKVyURJLtVM7VMMjDmP7Dk16ipo
	fcS9e7XXX/dErkeifU13O3h9Y/MOtUF6A5fYiQq1yiWMeGwHneE+aXUwy63PLVvk9ouWUYxoG24zt
	g3SxGooXDLQvNsGgizZJDpw0iPG8BJiAfK/er06zJ+jNl/4NbqbxShVGVqvLPq4o54vP2SPz92dva
	9DagfB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo05m-00000007YFu-3K1U;
	Mon, 18 Aug 2025 13:40:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvwy-000000071t9-36eU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 09:14:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E45C21424;
	Mon, 18 Aug 2025 02:14:35 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD7203F58B;
	Mon, 18 Aug 2025 02:14:41 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC 0/3] arm64/ptdump: Add ARM64_PTDUMP_CONSOLE
Date: Mon, 18 Aug 2025 14:44:33 +0530
Message-Id: <20250818091436.938517-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_021444_818739_5B5719BC 
X-CRM114-Status: UNSURE (   8.15  )
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

Enable early kernel page table dump for debug purpose when required through
a new config ARM64_PTDUMP_CONSOLE. But first this reorganizes ptdump_init()
separating out the debugfs creation so that it can be called early on. Then
adds kernel console print support for existing pt_dump_seq_[printf|puts]()
helpers.

This series applies on v6.17-rc2

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Anshuman Khandual (3):
  arm64/ptdump: Re-organize ptdump_init()
  arm64/ptdump: Enable console output in pt_dump_seq_[printf|puts]()
  arm64/ptdump: Add ARM64_PTDUMP_CONSOLE

 arch/arm64/Kconfig.debug           | 12 +++++++++
 arch/arm64/include/asm/ptdump.h    |  9 +++++++
 arch/arm64/kernel/setup.c          |  3 +++
 arch/arm64/mm/ptdump.c             | 42 ++++++++++++++++++++++--------
 drivers/firmware/efi/arm-runtime.c |  4 +--
 5 files changed, 57 insertions(+), 13 deletions(-)

-- 
2.25.1


