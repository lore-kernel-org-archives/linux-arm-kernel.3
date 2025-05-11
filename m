Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F44AC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 09:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IRn/0LOS5BEpnRhEoq6+3hT5wYSnfcZRCSqQCR3gGj8=; b=Jv18lG8Fl0EDGiVrxGnlp1OtQJ
	GwU2jSGON7MOrh5Qdwc/G+pP24Ezwf30DNgGF6Fj1hw3VFNsXpx0toO/nn/52FxK5L/J2YntfAxG9
	vNaXVOOgX85IE+V+od8cnP7fIVUN34VEM4iQJpUqxEqojAkW2wtLUpRZ0zNRXN46Nl3o/Y0RkVXG3
	vLBl3mrssCAqEdV7Ml5f9RvYRG6Lpzr2NnWqrBgw/8tBFOQHqWf5ICSTGWhABoZZYxm3M6Wk0SQ60
	IqZwY5EBegafiIOGP8plhDbOZKBR5iPqsKiWDDVS9dxoQzmIIVFj2qv3b85OvI5yVd7xN0wnMHDJn
	YcKORRAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE3O7-000000072u0-0gzi;
	Sun, 11 May 2025 09:54:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE3M5-000000072fi-0Azn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 09:52:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0071B1516;
	Sun, 11 May 2025 02:52:06 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 361373F5A1;
	Sun, 11 May 2025 02:52:17 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	mark.rutland@arm.com
Subject: [BOOT-WRAPPER PATCH 0/3] Enable use of FPMR and ZT0
Date: Sun, 11 May 2025 10:52:08 +0100
Message-Id: <20250511095211.1638852-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_025221_126533_1874FC45 
X-CRM114-Status: UNSURE (   7.59  )
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

When the kernel gained support for FEAT_FPMR and FEAT_SME2,
corresponding support was not added to the boot-wrapper. Both of these
features require some (trivial) enablement to avoid traps being taken to
EL3 durung normal operation.

These patches add the missing support to the boot-wrapper.

The first two patches were prviously posted as part of an earlier
series:

  https://lore.kernel.org/linux-arm-kernel/20241126153955.477569-1-mark.rutland@arm.com/

I've updated their commit messages for clarity, but I have made no
functional changes.

Mark.

Mark Rutland (3):
  aarch64: shuffle ID_AA64PFR{0,1}_EL1 definitions
  aarch64: Enable use of FPMR
  aarch64: Enable use of ZT0

 arch/aarch64/include/asm/cpu.h | 11 ++++++++---
 arch/aarch64/init.c            |  6 ++++++
 2 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.30.2


