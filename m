Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3B7C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 14:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YUbh/jeX6MQJU0OuMCBPWaUgK9Wq5JZDryZHeFVQHR8=; b=Uun6DzKC7tgTZcot0kEshhdwtW
	2r/2CpGNvmpiKKRwFmbdIkXLrfESpllyJCUmxg9E6iqC3Sr0i3x26ObJMOwGyGrfZZsyh6RjEmj2I
	G8vAlT+rVoeTVq1yzIJXxmWwt6MFDPTeWiwpdzLN38QFy+7WSEk+uVAWR1YUgctYokqtJdWjzmMp/
	xRoUqwQhdGic5Kjz7Xuzc2R6IeYELMN39VTQh2ZCHjE/VyBOuvPsQJRzidoXin4it/gYKDMmwA/ON
	lMMGzwLHrkoRXbV65Md2baDaE2P3wIO4WCjsDRJF5SvbOL9aVhahLWQps1s+lUmZd+3cBCJxhZcoF
	IJW3vuaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnzyM-00000001F71-1SEW;
	Sun, 26 Jul 2026 14:36:58 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnzyI-00000001F5u-0zm5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 14:36:56 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785076609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YUbh/jeX6MQJU0OuMCBPWaUgK9Wq5JZDryZHeFVQHR8=;
	b=CzwtEhdfxc/GE4a9FO6weiX1hwjqbESUyXiFvDp97OJf0TeRNIr1qbJS3TiqOZeQg7uihK
	XX6tWOP5ZQCLqZHOUIp2lFNA0SR1bXC2bp8IJI04qukvR3ICxbMq2+bojKu0D/qa7EoHuL
	eClDKyQSS0XyN5jTRVkccsBd8oDfp9M=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tabba@google.com
Subject: [PATCH 0/2] KVM: arm64: Fix host-directed debug for non-protected pKVM guests
Date: Sun, 26 Jul 2026 15:36:41 +0100
Message-Id: <20260726143643.303456-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_073654_926886_63C72468 
X-CRM114-Status: UNSURE (   8.32  )
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

Hi folks,

Under pKVM, host-directed hardware debug of a non-protected guest
(KVM_GUESTDBG_USE_HW) and userspace single-step never fire.

When the host owns the debug registers, the world switch loads
MDSCR_EL1 from external_mdscr_el1, where the host's MDE/KDE/SS bits
live. flush_debug_state() copies the guest's debug_owner and the
owner-selected debug register state to the hyp vCPU, but not
external_mdscr_el1, so the field reaches hardware as zero and the debug
exceptions stay disabled. Patch 1 propagates it.

Patch 2 adds a debug-exceptions selftest for a userspace watchpoint,
which the suite did not cover: it checks that the watchpoint fires and
reports the accessed address in debug.arch.far. It fails without patch
1 and passes with it. The existing single-step test passes even when
stepping never fires, so it does not catch this.

Found while adding self-hosted debug support for protected VMs.

Based on Linux 7.2-rc4 (1590cf0329716).

Cheers,
/fuad

Fuad Tabba (2):
  KVM: arm64: Flush external_mdscr_el1 to the pKVM hyp vCPU
  KVM: arm64: selftests: Add a userspace watchpoint test

 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 10 ++++-
 .../selftests/kvm/arm64/debug-exceptions.c    | 41 +++++++++++++++++++
 2 files changed, 49 insertions(+), 2 deletions(-)


base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.39.5


