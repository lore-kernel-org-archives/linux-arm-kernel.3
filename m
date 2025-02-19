Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55338C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 16:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1RP0+fbCXCF1Su/4k8PvsGf6I2tcY786uVlC0vpj+YU=; b=xcUsoa1b5aktjD1tQOx/ABHC/L
	XpMODe60Ud4pnVbFJ05RjvRB70HYzSh9heoTrfRUGzgBDXEd39hU3oJT/TAOc01BZu8xHEfQ6ESg5
	p+GV9J+35EpaIbO5jrc9rSp9wdan/kr4jQyYKznTnCGGoAv8qHUOKInPukqw9ZFye00n3RPs/WjS8
	zh4JDgtlHGc/3oI0HcnbF/zT0gVuLyk5ud7m860Nm9ey8k8fStT9DoGBvG8kjtZXnnwbm5AxSC60b
	Rbf4IslYdUoj/Z1z9+lNujouzXblwGxD9k/hv9u86DB7V//JzAilV3QhjmGwRcbs31M2X6njJ283R
	P/qZA7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tknBP-0000000Dtnk-0CRI;
	Wed, 19 Feb 2025 16:44:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkn8Q-0000000DsOT-1toO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 16:41:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E83E1682;
	Wed, 19 Feb 2025 08:41:34 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 792C83F6A8;
	Wed, 19 Feb 2025 08:41:14 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 0/3] Minor improvements for PIE/POE helpers
Date: Wed, 19 Feb 2025 16:40:26 +0000
Message-ID: <20250219164029.2309119-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_084118_530676_1BE30AED 
X-CRM114-Status: UNSURE (   6.76  )
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

This is a collection of minor cleanups and improvements for the PIE/POE
macros in asm/sysreg.h and asm/por.h. Besides the readability
improvement, it will also come in handy for the kpkeys series [1] that
performs more calculations on POR_EL1.

- Kevin

[1] https://lore.kernel.org/linux-hardening/20250203101839.1223008-1-kevin.brodsky@arm.com/

---
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Will Deacon <will@kernel.org>
---
Kevin Brodsky (3):
  arm64/sysreg: Improve PIR/POR helpers
  arm64/sysreg: Rename POE_RXW to POE_RWX
  arm64/sysreg: Move POR_EL0_INIT to asm/por.h

 arch/arm64/include/asm/pgtable-prot.h | 36 +++++++++++++--------------
 arch/arm64/include/asm/por.h          | 11 ++++----
 arch/arm64/include/asm/sysreg.h       | 15 +++++++----
 arch/arm64/kernel/signal.c            |  2 +-
 arch/arm64/kvm/at.c                   |  8 +++---
 arch/arm64/mm/mmu.c                   | 10 +++-----
 6 files changed, 43 insertions(+), 39 deletions(-)


base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
-- 
2.47.0


