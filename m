Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431C0C5DF98
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MFdz8NPU5/wMJeL/vsXxp5eUFzRpWg8luiFq5DUlWyE=; b=GKWdS2lpjpQvCVXVFroEaytnCH
	FCl74hPllZ6fabjsek0ivkbO7Gw6doDl2LQgI2XZ+NHv/852+rDO6qvfScZEm23KOXo6BHj9GIgpo
	X0y6H/J1LFSrHNS0ZEGDs2Aw1Y9Mjsc/rEn0ZxxFrhxBlvV856Lt5sfTYZvZVa6XsyuF1q1HMp+mi
	e1havAZKUqydnoAU4IkIXk/Rd63BBQQDuKQUukK4xlLnZfjpfsq+rhGsxX8gPY4616r3ANi1dyTKS
	+d5pqbNAo5X1+FaWXAxLaUemIT7hl8Th4a7bluDXuburqoW1FTp3zCPE3HjKeBPA1Oh7HEJwdSitk
	neVQynGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRx1-0000000Dmpt-3b9P;
	Fri, 21 Aug 2026 16:18:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRwx-0000000DmpK-1vIl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:18:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E9D2943270;
	Fri, 21 Aug 2026 16:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0CD1F000E9;
	Fri, 21 Aug 2026 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787329114;
	bh=MFdz8NPU5/wMJeL/vsXxp5eUFzRpWg8luiFq5DUlWyE=;
	h=From:To:Cc:Subject:Date;
	b=nleCJiktGqkqWtl23fu+RcGzfsMl6d7jrzCbnMJLx/lk38ApmF7vmtjFmfcyzf1RR
	 KDo6E0kSi4iCrBHUTfU7kN2k57AUNtD1d7nNTcaa7fOAjIyGxLE8gg84Fx6EnVjBpZ
	 IENHx3ord8GlXVxl40/u0mU5OmiNxYp9jkLm86sB2pwQhAb3Ol8HtIS0+3KJzeTRPe
	 /+oKnauFY+qVG9sF2S61KCqQBBLnBdyZ/jg0NUzgoG9Ij63CZrMcATTQXJI/y2HAYM
	 AcJvo4Sv9ALkTHF6Teyoteu4agOYnxyrz/5duftKjKSGef4h6+Vv8KmYIG6KxAGUk6
	 V9yM8pTkYqd0w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wxRwu-000000006fx-1M56;
	Fri, 21 Aug 2026 16:18:32 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	ljs@kernel.org,
	Shen Yongchao <grayhat@foxmail.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 0/2] KVM: arm64: nv: Shadow S2 life-cycle fixes
Date: Fri, 21 Aug 2026 17:18:27 +0100
Message-ID: <20260821161829.1032561-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, ljs@kernel.org, grayhat@foxmail.com, kmehltretter@gmail.com, weilin.chang@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

This is the (hopefully) last revision for this set of fixes for the
shadow S2 life cycle.

* From v2 [1]

  - Fixed the nonsensical type used for allocating the nested S2
    array, switching to kvmalloc_objs() in the process, guaranteeing
    some level of type checking

  - Dropped the extra S2 freeing after Wei-Lin pointed out that we are
    guaranteed to run the MMU notifier release callback, ensuring that
    nothing is left behind

  - Collected AB from Lorenzo, with thanks.

[1] https://lore.kernel.org/all/20260814103230.858578-1-maz@kernel.org/

Marc Zyngier (2):
  KVM: arm64: nv: Fix life cycle of the nested_mmus array
  KVM: arm64: nv: Delay freeing of shadow S2 structures until VM
    destruction

 arch/arm64/include/asm/kvm_host.h   |   2 +-
 arch/arm64/include/asm/kvm_nested.h |   3 +-
 arch/arm64/kvm/arm.c                |   8 ++-
 arch/arm64/kvm/nested.c             | 100 ++++++++++++++--------------
 4 files changed, 58 insertions(+), 55 deletions(-)

-- 
2.47.3


