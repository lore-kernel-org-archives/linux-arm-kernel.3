Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8B210398B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 21:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DwcB5eTjFNMeSWQM+K8UuvEpR7Ktkirq9D+Y+JTyV4s=; b=ZjL8LLlO6YpjwIYvxPI5jGeMZs
	00uglBakOztLkxL2LuoQQdIjmXopmJJ/mqtQkFLufPZABsXKJRPhhCH3TPVfw+K6ZiUlDjO13wiIF
	2hLteV8WPuCxBwHrFkpkFp/Y2TrtC+qyy+ruIsfysH9cHtZvwfV1GTEzS1yjOpo/dwEYXtZaqv1qJ
	iAchHa2tcz9WpA3e/ZyUQAGz64O3tW09qbXxxczJTOxXIxErBkr2IRkOJ9sjH2fEDx1h0oGMbGoZM
	xzgDy0dojF5RPs4QD/bZcdEfwxN6LS58ZUOogF1VgNYNn3rz5KVO2tOCJfK7v9ZxouhDHZQi9c4iH
	5+mV6uLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5Hp-00000009Am4-2s9L;
	Fri, 27 Feb 2026 21:22:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5Hm-00000009AlN-0bDv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 21:22:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CF2043C4B;
	Fri, 27 Feb 2026 21:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22E0C116C6;
	Fri, 27 Feb 2026 21:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772227329;
	bh=lbmOvF2j4H2gM9f9E+jo9GT5XZZz8FGdqwqTpXMG4fI=;
	h=From:To:Cc:Subject:Date:From;
	b=AenEIsFCWc6WXPcDF5B6PhuzvHPP+0WZOmq0yCR8YrYKZtRKcgmiQY8y1aLEo8aFN
	 CTX3Z5J5eB4kt1QfbDT20nshkL+XgnPnNBX2zymU9dqxSKhzmfvd7WgNbQ5GlQE5mL
	 p7Nxm9CPlIPuD62DZlzdK8da64canH6RPMvx3DS+aAeS67nzSzsFopuAx8PAriw2CX
	 JBjj+PBYolRueSnaWjbdRgQk87H4CEOGaptmUoc3QVd9hOl1H9ukWG7IP5OAfv/UI0
	 i3es00DaYaEUKGlqhbsTNl1R47d14VKVFNjtmfIFG+D8hzQttU46ODDpPzNtQKvZek
	 szQlCXdVTM+ng==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Yabin Cui <yabinc@google.com>
Subject: [PATCH v2 0/3] KVM: arm64: Fix SPE and TRBE nVHE world switch
Date: Fri, 27 Feb 2026 21:21:32 +0000
Message-ID: <20260227212136.7660-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_132210_205332_3C2DE496 
X-CRM114-Status: UNSURE (   8.73  )
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

This is version two of the patch that I originally sent here:

  https://lore.kernel.org/r/20260216130959.19317-1-will@kernel.org

Changes since v1 include:

  * Add missing memory barriers and comments for each step
  * Work around known CPU errata in TRBE draining / enabling sequences
  * Fix SPE as well!
  * Minor clean up to BRBE so that it smells the same as SPE and TRBE

As before, I've not been able to test this as-is.

Cheers,

Will

Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Yabin Cui <yabinc@google.com>

--->8

Will Deacon (3):
  KVM: arm64: Disable TRBE Trace Buffer Unit when running in guest
    context
  KVM: arm64: Disable SPE Profiling Buffer when running in guest context
  KVM: arm64: Don't pass host_debug_state to BRBE world-switch routines

 arch/arm64/include/asm/kvm_host.h  |   2 +
 arch/arm64/kvm/hyp/nvhe/debug-sr.c | 118 +++++++++++++++++++++++------
 arch/arm64/kvm/hyp/nvhe/switch.c   |   2 +-
 3 files changed, 96 insertions(+), 26 deletions(-)

-- 
2.53.0.473.g4a7958ca14-goog


