Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A042DC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 12:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Thp73DKm6JO24PWrqan5R+YfnElzkHZpkgKKuA6jZCM=; b=n5m6sRPT0fVwl6hpVPndTRcUnP
	8rDJEacGU2dvSF2y+nnVbSyXKXONSc6/joO59EFEIKrboKLRdLuAwNLEWKh68PU4ieZunGwbiinj9
	B84JUXfe8IkK3Fy0PnS38yfs76NPtQKVZn18TcGAOlEMWLwik8jHCZy2FKqQay/HIn3SGzX9t8/Lm
	T0l5xbQG/o4Z4sLGfCe9jAL05KybOYFqtWipPQNn6+YLR9sX96bZ+h4AhE1IAxQl+BpXAwNsH7HfL
	lR9kJHa3bI4UMz/Apynpdo1TMkmsyCqcN7qCJvXnEpxtMb2WZs1sX3lH1bDior8eSU4LkaOz8WSN4
	/jo+R5XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uEX-0000000GFcX-2iC2;
	Sat, 19 Sep 2026 12:31:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uEV-0000000GFc8-3xux
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 12:31:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 59CDF43B43;
	Sat, 19 Sep 2026 12:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366CB1F00893;
	Sat, 19 Sep 2026 12:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789821115;
	bh=Thp73DKm6JO24PWrqan5R+YfnElzkHZpkgKKuA6jZCM=;
	h=From:To:Cc:Subject:Date;
	b=WyhswBnBmEtrQyxk43p2ixsKmtp5K3L0JKNkJJ85FTbVTbvooGVitehSP4Le+7XKr
	 e/TDJhf2XlzeSoZA243M192/jUtbmkJ5tFeJle9SmCFoezZ+ghcdTMAKfLNJFFiFpF
	 0Io+2Fzl6sxXwMKcfWmciNYJKCe0Pxf0TwPaLm+s3s8pQRvm0xV/gkIDJ5NgBBovmb
	 2OZ0f9zw0GgHtjFWljwhgjFxyrsabTRopatzBKgEZMqsNRflIBoYuDhI/Gin+jFna6
	 lPGEr0YrpmH+AnZyH+c6igSMyQrLlovdhYErmGh6Xtc1iMv20YpPe+xNAGJHdTixOF
	 EJlqRiSzLSEuw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x7uET-0000000AwvV-0OcV;
	Sat, 19 Sep 2026 12:31:53 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 0/4] KVM: arm64: vgic-v5: Random sparse fixes
Date: Sat, 19 Sep 2026 13:31:46 +0100
Message-ID: <20260919123150.3283606-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, sascha.bischoff@arm.com
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

The LKP bot has been reporting a bunch of sparse warnings in the newly
merged vgic-v5 code (mostly in the table code) that we could do
without. I've therefore investigate those, fixed them, and some more.

I'm queuing this on top of the existing branch.

Marc Zyngier (4):
  KVM: arm64: vgic-v5: Drop __iomem attribute from {vmd,vpet}_base
  KVM: arm64: vgic-v5: Correctly reset h_lpi_ist to NULL
  KVM: arm64: vgic-v5: Tidy-up programming of vpe descriptor address
  KVM: arm64: vgic-v5: Correctly handle host ISTE __le32 conversion

 arch/arm64/kvm/vgic/vgic-v5-tables.c | 24 +++++++++++-------------
 arch/arm64/kvm/vgic/vgic-v5-tables.h |  4 ++--
 2 files changed, 13 insertions(+), 15 deletions(-)

-- 
2.47.3


