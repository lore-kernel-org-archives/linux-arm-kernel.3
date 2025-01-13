Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011DFC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 18:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IlvSZhfl7BaNvJWJziRL558umu4RNqlaE16WHlC4RK0=; b=exZZPx6wVapJakjDQ4+th1WqFG
	np6BX7wxakAA+jqNBtVBm7BaV/6cxMKD7K7CDRGY/pVy9OqCpqxNxssoz4E972xii4w36HpDQI1Wx
	hK4SCHdQUTY45djt6VT+i2R2yXOc28nzag02DVhmLLGDSgA+MFctA8jOUXNbkqXKTmOjFr9p5FgJV
	FskVZzfykn3JLfp2nZfDRU8VUg9Y2Ujb54Rq5ZUOgprodTsT7T2kDTEBMJyUAzg9OozKK8JyLkx76
	rZvu1Aco1ju0xav5jYkbLRHQelOf06a1qlEdddK3W4HxsDilF35jFoS7AQIQMMmTb5F+6gLjMt8mP
	2oLuJRPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPJ0-00000006EF9-2zTl;
	Mon, 13 Jan 2025 18:36:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPHg-00000006DtZ-3bF7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 18:35:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CFB7FA41308;
	Mon, 13 Jan 2025 18:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC3DC4CED6;
	Mon, 13 Jan 2025 18:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736793331;
	bh=+nelPL94A/L/LysjtUbYGn+zQ/ua2mF4cag9OVMG7xc=;
	h=From:To:Cc:Subject:Date:From;
	b=b5DUKcBdxFCEyzKF9xG1/3Q96SB8CxtpX6JGK5XKhwOuEIDlouCF3+Xg/K/l4Twwm
	 KdRZSBxnxdX/UqKAaPIg/p4klpa5YwcGGCbvLMnQbTih3ub736z/5byc/jmirlUm7P
	 kFhNMEHu35vLOAScUZ3REMgwZZjX2s10bdhFAdbzcFRRLPZSeI+3J+eJlN1G8tRgNh
	 gDJnRXFBm6TSUBlf89uyW6mcwXY5zo+OtXQIJtPrmUiuxdjxtEjIaewyj4WRLO4MD/
	 kqKEl0sxUok/67vrGBY4v3zHe1VxfOS7ooloaxmdsLgU1GF2TmVvcC9QW36VPQ+Ajv
	 x3GNIs3IVKTsQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tXPHd-00BjrF-Qe;
	Mon, 13 Jan 2025 18:35:29 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [RFC PATCH 0/4] KVM: arm64: vcpu sysreg accessor rework
Date: Mon, 13 Jan 2025 18:35:20 +0000
Message-Id: <20250113183524.1378778-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_103533_021405_DFCC8B83 
X-CRM114-Status: GOOD (  13.69  )
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

As a follow-up to this series[1] fixing bugs around the RESx
behaviours, here's another that tries to bring some additional sanity
to the way the RESx masks are applied.

Currently, we have *one* accessor (__vcpu_sys_reg()) that can either
be used as a rvalue or lvalue while that applies the RESx masks behind
the scenes.

However, when used as a lvalue, it does the wrong thing, as it only
sanitises the value we're about to overwrite. This is pointless work
and potentially hides bugs.

Instead, I propose that we move to a set of store-specific accessors
(for assignments and RMW) instead of the lvalue hack. This then allows
the legacy accessor to be converted to rvalue-only.

Note that these patches are on top of the NV series, so not suitable
for the current set of upstream. But assuming I'm getting positive
feedback, I'm happy to rebase that on something less bleeding edge.

Thanks,

	M.

[1] https://lore.kernel.org/r/20250112165029.1181056-1-maz@kernel.org

Marc Zyngier (4):
  KVM: arm64: Add assignment-specific sysreg accessor
  KVM: arm64: Add RMW specific sysreg accessor
  KVM: arm64: Don't use __vcpu_sys_reg() to get the address of a sysreg
  KVM: arm64: Make __vcpu_sys_reg() a pure rvalue operand

 arch/arm64/include/asm/kvm_host.h          | 31 ++++++++++--
 arch/arm64/kvm/arch_timer.c                | 20 ++++----
 arch/arm64/kvm/debug.c                     |  4 +-
 arch/arm64/kvm/fpsimd.c                    |  6 +--
 arch/arm64/kvm/hyp/exception.c             |  4 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h    |  2 +-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h |  6 +--
 arch/arm64/kvm/hyp/nvhe/hyp-main.c         |  4 +-
 arch/arm64/kvm/hyp/vhe/switch.c            |  4 +-
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c         | 48 +++++++++---------
 arch/arm64/kvm/nested.c                    |  2 +-
 arch/arm64/kvm/pmu-emul.c                  | 20 ++++----
 arch/arm64/kvm/sys_regs.c                  | 58 +++++++++++-----------
 arch/arm64/kvm/sys_regs.h                  |  4 +-
 arch/arm64/kvm/vgic/vgic-v3-nested.c       | 10 ++--
 15 files changed, 123 insertions(+), 100 deletions(-)

-- 
2.39.2


