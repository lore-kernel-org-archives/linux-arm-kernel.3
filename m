Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEC8C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 11:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QZ3NuUnzekYPaWePBAK6Km1jXLP7hXxB0k4AOBR7tHI=; b=eJVYrgnspzA3ujPcAh5ueHNFFf
	p+PR+djgx5hS/ziq06y0RcnlCTp0Rj8S5Ov0yqRAFsdFfZBPDThLlzwX9cNJMMM+BaxwNs+5y2rF7
	CLuu7LbFTGMa7igBHMvlUFX6bGBawMzFF8gmkLPNAphNK5nU2B842ADnNlL1ei2whH1apZxAcIY1e
	2MNHJfcSkNBdceDJZ1U/+5i99P7FQNmt0g5XiOEd7l2FOlk2OOKyS1cmupd4l2cbxe5AsCgRVITfE
	2ZhvsoTcAMyzLWdb5hFEPVm1TT0vY46xOp2kaeW5vXxc0U9tZYmLvmZmcQzdZvnBKWPmNQnja84kh
	u+O8G5HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSjm-00000008SY0-0t7C;
	Wed, 09 Jul 2025 11:13:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRFu-000000089yh-2ufx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 09:38:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07DB9153B;
	Wed,  9 Jul 2025 02:38:08 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 947B43F738;
	Wed,  9 Jul 2025 02:38:17 -0700 (PDT)
From: Ben Horgan <ben.horgan@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	linux-kernel@vger.kernel.org
Cc: james.morse@arm.com,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v2 0/2] Fix and add warning of misuse of type##_replace_bits()
Date: Wed,  9 Jul 2025 10:38:06 +0100
Message-ID: <20250709093808.920284-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_023822_816634_CD00E84E 
X-CRM114-Status: UNSURE (   8.54  )
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

By inspection there is one mistake in the use of u64_replace_bits(). Fix
this and while I'm here add a __must_check annotation to help avoid the
same mistake happening again.

Changes since v1:

Patch 1: Add Rb tag from Zenghui Yu - thanks!
Patch 2: Extend to add __must_check on _get_bits() and _encode_bits()

Ben Horgan (2):
  KVM: arm64: Fix enforcement of upper bound on MDCR_EL2.HPMN
  bitfield: Ensure the return values of helper functions are checked

 arch/arm64/kvm/sys_regs.c | 2 +-
 include/linux/bitfield.h  | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.43.0


