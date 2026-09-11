Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F99BC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RdS7Wqx1sTQW56FHfN0F8MYke0Taf2Z8VE/SYcQlAKc=; b=a7pq0piGd4eQJAVqPMlrTl2qNl
	FWzEDSKj5cbkke5mYka9D4dCCW5l7fIDxfPPMbWyBDyjjn5CKccRAVUo9CuSziGxe3N8xYZNotBSv
	hANMdY54gwY02aJU/KYFA6jpomvDatJL8AEHDfWMpbhFHywcFaoTIPAItjM6HM7FRvPoRWokSyPe9
	BxcTQN4ZAYhw0h2zlHerXIyvfZvKRc0K1gGrTGUMPKhUArizzz8AyYGopK5b2OOmTdJib6K8o2zOn
	0+RsOCfFbN3/p4YwhhYhpqISOg46x8mHWCc34TwbbkelSeo7sgtCOIp3e5v8BNYkB22mjf5K21pHE
	bpvPBjjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x541C-0000000HCUS-05Tm;
	Fri, 11 Sep 2026 16:22:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x541B-0000000HCTr-0IIb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:22:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CA2260008;
	Fri, 11 Sep 2026 16:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EFDD1F000FF;
	Fri, 11 Sep 2026 16:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789143744;
	bh=RdS7Wqx1sTQW56FHfN0F8MYke0Taf2Z8VE/SYcQlAKc=;
	h=From:To:Cc:Subject:Date;
	b=SNga7xVxglS3nXkDS0oG9a8sdDEq628Iww2bOjbe1k8tBzz4iq02lwlTpSJCRoin1
	 2jFalVbF1fNzrMeIhizlVb+oZJNZgUvxItMf/+8F7LVvE6F6l3grY1o8eZx7t32Q3C
	 JbZoMA82MgADt7UalOCIPLZwya3BvjmD/ABEaqwJMJLHFqODHy5HDvPRHL77XcMi7q
	 Bo7uxVevv0mJ8KZT3VhcaocvP8OxbIrNNTNzDoyPThxq/U6wVBWbE9F+ziG1QfwwA3
	 5bp9cfcc/WMvZ+cZbqqyV1fvSfuInMboNcv1UveB/0Acoi+FN9Un7nyg8TUXtqwrAp
	 i7XziZeujvKDQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x5417-00000007qRK-43EP;
	Fri, 11 Sep 2026 16:22:22 +0000
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
Subject: [PATCH v4 0/2] KVM: arm64: nv: Shadow S2 life-cycle fixes
Date: Fri, 11 Sep 2026 17:22:01 +0100
Message-ID: <20260911162203.1919330-1-maz@kernel.org>
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

7.3-rc2 has introduced annoying conflicts with this, so in the spirit
of making things a bit easier for Oliver, here's the version rebased
on -rc2!

* From v3 [1]

  - Fixed spacing (Wei-Lin)

  - Rebased on 7.3-rc2

  - Collected RB from Lorenzo, with thanks.

[1] https://lore.kernel.org/all/20260821161829.1032561-1-maz@kernel.org

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


