Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF17C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 09:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t+c/bO35uxhfQbzhvft1Y5jNzKahIerMMVy9JiRFQts=; b=b9HCADLvx2ATNRna2z+nwK4eUO
	TaSCWxipfZIiQHdqN4SpNfxJBG4cu6AQR7sbMNC6XiC582ihYz9Sdc0mHkPmck5BQN94kc9B4l+/Y
	/Dno0PKjdMhdt1R4FIqnG+H9iXKEIqASf8wdljEEIJJ67MsYDiRo/thCNtJK4kSemKD6nmg+eeQTj
	qcl8TUmX5P5/kors/9Crt9qiP1hGE4vAux+rl40WdnebH7Av9FuAhouSY9edZVpOv3dI4/Nu1yw7Z
	goY2JgbhaUn5Ow5sgm8tWfU0kYNNLyTy+sT+XPaT8X3q7lswpDRXM4MAuqe9L2QL9xnAB0WiOdPip
	ouFV3KPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werSQ-00000001D8F-3CeL;
	Wed, 01 Jul 2026 09:42:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werSP-00000001D86-05p4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 09:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=t+c/bO35uxhfQbzhvft1Y5jNzKahIerMMVy9JiRFQts=; b=kTEOBoxRQqOi9yF/tP25ZdJmjk
	lySaR7u/GtykvT+G34SzO0AapSsq96r9x6nanxo5E8SD1coy5n8noL8CcP4sOzDKYrH9lSqczB4Lg
	XQN+V1OaEsnaIG7SCVM0sBu6eh6M+FZp/0gj7AgcYOc9nAF/S2zvzk1RZb9dlVYD90eWtFhRJTgA4
	4zfV4Z20P1Twi5fvgMZvZlBJI2yzyrlLB9m8BF/dyiFsrWL5x2+KelnR34W1pD9pPrXlT47aP9BgP
	Ln4F1LlvhpvX6Cn66yo1DTJL9svzI8t0jMf5B8mKPkt88RmdGx5B1LLsNV/F0JzsEauEj94stU3Ib
	z55nFfeQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1werSM-00000002Zna-0OpB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 09:42:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2C7A22FC;
	Wed,  1 Jul 2026 02:42:03 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A24993FAFB;
	Wed,  1 Jul 2026 02:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782898928; bh=2vV0uYyp5r9BgMOHjlDCPSJ4nNnsL8Dmdf5a8DIhKd4=;
	h=From:To:Cc:Subject:Date:From;
	b=KP0xdo3rUjIVuh8KST5fi5RRyC5+IHb1OD7HvejL055sKUHEnA7tlqDPXDX6EbY1M
	 gqKRA5zPeCxWOLoHuJxZHRDaI2o5W32YMDRWXmpy7xpE7ec4vcufmoYtsNZa7sBy5Z
	 8+b8jXAvKIV4clO4xGDL3HZOzpxwDoxGl51l774Q=
From: Linu Cherian <linu.cherian@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linu Cherian <linu.cherian@arm.com>
Subject: [PATCH 0/5] Add BBML3 cpu feature 
Date: Wed,  1 Jul 2026 15:11:26 +0530
Message-ID: <20260701094131.677636-1-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_104210_328371_75C69F42 
X-CRM114-Status: UNSURE (   8.81  )
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

Patches 1 and 2 introduces BBML3 cpu feature
Patches 3, 4 and 5 adds more cpus to the BBML3 support list,
	which dont advertise themselves through the standard
	MMFR2_ID registers.

Linu Cherian (5):
  arm64: cpufeature: Add BBML3
  arm64: cpufeature: Detect BBML3 based on MMFR2 ID
  arm64: cputype: Add Cortex-A520AE definitions
  arm64: cputype: Add C1-Nano definitions
  arm64: cpufeature: Extend bbml3 support list

 arch/arm64/include/asm/cpufeature.h |  6 ++--
 arch/arm64/include/asm/cputype.h    |  4 +++
 arch/arm64/kernel/cpufeature.c      | 51 +++++++++++++---------------
 arch/arm64/mm/contpte.c             | 21 +++++-------
 arch/arm64/mm/mmu.c                 | 52 ++++++++++++++---------------
 arch/arm64/mm/proc.S                |  4 +--
 arch/arm64/tools/cpucaps            |  2 +-
 arch/arm64/tools/sysreg             |  1 +
 8 files changed, 69 insertions(+), 72 deletions(-)

-- 
2.43.0


