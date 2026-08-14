Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D349BC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 10:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gWoF82RYFJwJElEEQ8rjV8LHygpxdWPmPiSAGiUpOdo=; b=Go0/1hyfZ3LKgHFQu3F5FcmMMt
	g5nGyhg7R3RS3D/ajSLK1Tmp0Y1p8NlF51Ex2BYUh2d0XZ4EpLOQbx/bXd4imJQcDfXRUSKnvPxl/
	FIlsJYlHUjI/m0j/WZjtNR1IW7tHfDFFadPqhQddUzKZQsB39BwatJkZTwCDXm0aBjMdBXwDol2em
	Y3QMyyKaYSz5s91a+nxQmAOOasdEDwKLJ91IbTIefWZXWNRNML5uCYkH3I2AhNaC8t4Tqw2BBjQe/
	YidJV1KhcipnZ2XfyeH19ULl2ZgicbP087tB1aoASrIngqWahzhbHLYCSOIhnVx6y9STzQPT+JmDI
	DG3hCXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wupE8-00000002WTB-1yL6;
	Fri, 14 Aug 2026 10:33:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wupE7-00000002WSU-0Z3Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 10:33:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6763E600C3;
	Fri, 14 Aug 2026 10:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7301F00A3A;
	Fri, 14 Aug 2026 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786703606;
	bh=gWoF82RYFJwJElEEQ8rjV8LHygpxdWPmPiSAGiUpOdo=;
	h=From:To:Cc:Subject:Date;
	b=ZzamFo2DtTzFVfcyeEGG5XXsD6QQ8f8/ttmwPHVWHJs2K+rWmDWh/1qJf5UpSpaG4
	 vZNOVWKua1TrwjTJqow68LlRDfTZaayZN9SD9gg/vlEmSnIcXPHFPOiFliORc0UtRz
	 O7eADigC6mm85FtO0EvwjatK+KuVAQs98FnwLt/ROJ6zdoFriWhCG1KnsfPrToMO8s
	 0eOtXvh+om/BvTzMvwEYInx5ruKBetI3NWTf91qfXaivH/qv1ep7yOzmLP6lehDm/L
	 Sb15ufTnux1c3ZZ3KinLPlQsMYaNLZUXHwqxi+DvCEP0FnGDH+mbNFYo19SJGOCn3O
	 kobtgTpIVbpog==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wupE3-0000000FdQO-32Xs;
	Fri, 14 Aug 2026 10:33:23 +0000
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
Subject: [PATCH v2 0/2] KVM: arm64: nv: Shadow S2 life-cycle fixes
Date: Fri, 14 Aug 2026 11:32:28 +0100
Message-ID: <20260814103230.858578-1-maz@kernel.org>
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

This is yet another stab at trying to fix a bunch of annoying issues
(i.e. very stupid bugs) that plague the life cycle of shadow S2 MMU
structures and page tables.

The first patch is identical to [1], only with added lockdep_assert(),
as suggested by Joey. The second patch finishes the job (at least one
hopes) by freeing the S2 MMUs when it is actually safe to do so.

Both are targeting 7.3, and are stable candidates.

[1] https://lore.kernel.org/r/20260811122057.754772-1-maz@kernel.org

Marc Zyngier (2):
  KVM: arm64: nv: Fix life cycle of the nested_mmus array
  KVM: arm64: nv: Delay freeing of shadow S2 structures until VM
    destruction

 arch/arm64/include/asm/kvm_host.h   |   2 +-
 arch/arm64/include/asm/kvm_nested.h |   3 +-
 arch/arm64/kvm/arm.c                |   8 +-
 arch/arm64/kvm/nested.c             | 115 +++++++++++++++-------------
 4 files changed, 69 insertions(+), 59 deletions(-)

-- 
2.47.3


