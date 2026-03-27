Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C301E10ED664
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 13:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cmKEJw/Cj9xm1e8qrjGHcR9wgMrGReZF95ggP692XqY=; b=Di+aHqkPUHuUJrvRoYmzhFi2Cr
	thZxyBJfaa8wE8XOCzKBnwLZ3m/OGPRdwVfaQDqCkHjfnFalcpNUkNE3Z0oyGOdn71Mgd96rke1yn
	hNAxkNqly8bMociv9Qg5l2i77cmWyXjqwcf1rhX7ZaWI8H5gZnwZ60nyHu4fxkLcmcJ/uGHwQ7uHG
	qRZtC0UZxH3fmILUViT0KFigKcF8OQsr4Cz9Hk2H6uGxI5VzWFVqraFxQKjx73WyLfe31Hwko+kvl
	5dUQHO9EuCo/fMGHmUtcJIe4X+kqLrQm0yx8gpx4OXimwOmZrOTqPiC9sW/kZD4oLnGTCJktWpjNd
	JbJLSHXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66oO-00000007NtP-2YtV;
	Fri, 27 Mar 2026 13:01:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66oM-00000007Nsx-1Ym8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 13:01:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86EBB6132B;
	Fri, 27 Mar 2026 13:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD901C19423;
	Fri, 27 Mar 2026 13:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774616473;
	bh=clZGoSYnunaz353uIOTaKe0JjLBlcI1p6Gjqr/3pQlY=;
	h=From:To:Cc:Subject:Date:From;
	b=PwixPOwjLr7IToaBIVQvvm8EabafJiiQs273lGLio3ZnZ8LquoyM5RStVq6Qk3YWr
	 30tO7KfGGpZ1oNVvK6uagOMCmIYGrWTpQ94VQXQpWgPm4NFzOeGe7QRY0EtloRCMFK
	 m4qsJlfszlS+hAs6Zo942V0Bkt3efxd/4e8G5R+ShjiyVsUJAUrG8QFFI6nK2T7A1n
	 uHPfneNduK9KhIrEipXQwXPZ43AHYCQjv4DtY3SeaDDQN49omOBhg2GcIUKv0gcNgo
	 TQ8JinVdHIm2XoWjIBXJNJDj87EQ555xSPCQSvhj69fbGS8crz5jTPSNSHGQ3QkC6R
	 EFjv/ZmAfr0qA==
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
Subject: [PATCH v4 0/3] KVM: arm64: Fix SPE and TRBE nVHE world switch
Date: Fri, 27 Mar 2026 13:00:43 +0000
Message-ID: <20260327130047.21065-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi all,

I got the Sashiko treatment on v3, so here's a quick respin to address
the BRBE thinko it found in the last patch.

Previous versions of the series are available at:

  v1: https://lore.kernel.org/r/20260216130959.19317-1-will@kernel.org
  v2: https://lore.kernel.org/r/20260227212136.7660-1-will@kernel.org
  v3: https://lore.kernel.org/r/20260326141214.18990-1-will@kernel.org

Changes since v3 include:

  * Retain zeroing of *brbcr_el1 when saving BRBE state
  * Dropped R-b / T-b tags on the BRBE patch

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
 arch/arm64/kvm/hyp/nvhe/debug-sr.c | 116 +++++++++++++++++++++++------
 arch/arm64/kvm/hyp/nvhe/switch.c   |   2 +-
 3 files changed, 95 insertions(+), 25 deletions(-)

-- 
2.53.0.1018.g2bb0e51243-goog


