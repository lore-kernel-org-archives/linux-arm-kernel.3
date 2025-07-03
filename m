Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201B2C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pVIr4humR6TBu1+iRIPQQ1ib1N4hNVLHGDx+5WEIxSk=; b=vGk4yaJ2Ph75mrouvnu+L1DYnb
	E7F+GDxu6DpGGfzll7nI2OPZz8rT9KKltjIFe9C3jamituSG+y3YpCzHAGa0o19/wz8Auoa+g0bYu
	qC4Y1BrPPrsP7XjoYV+0hWAWyKgWzhv8xteFRAI/gHN7moL44H/piwxJgqsKoWQcI7LvDknQm66gB
	aYkmMtfGzlgJ5+Wq/zaBKmjhsFeQCnyautWacGXcYPG2Xh9qBYmhWEAxP81zrJnAcc37bPQZ22FJB
	nOQ9m2s5nXas6knlerXkFtahPabTbqmh0Dr9dU+dUF1OZ73eiJeU8cZiwP3kZVpk7emUL8tJ5up/G
	y05CRhUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMCK-0000000BtN0-0DbP;
	Thu, 03 Jul 2025 15:50:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKRt-0000000BZGl-3hp7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 13:58:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFCBF1596;
	Thu,  3 Jul 2025 06:57:44 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C8B83F63F;
	Thu,  3 Jul 2025 06:57:56 -0700 (PDT)
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
Subject: [PATCH 0/2] Fix and add warning of misuse of type##_replace_bits()
Date: Thu,  3 Jul 2025 14:57:27 +0100
Message-ID: <20250703135729.1807517-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_065801_964731_9ED099C5 
X-CRM114-Status: UNSURE (   7.62  )
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

Ben Horgan (2):
  KVM: arm64: Fix enforcement of upper bound on MDCR_EL2.HPMN
  bitfield: Ensure the return value of type##_replace_bits() is checked

 arch/arm64/kvm/sys_regs.c | 2 +-
 include/linux/bitfield.h  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.43.0


