Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C086C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nOYuQatwUoKOdneKkZwsHXH7XGXgHS/zUBIe0guUEhE=; b=HlWhK4+Qq8KQoRqJV1AcjkYofF
	VTdQkchNGVaaSA+SVWuARg0sDu42jn+6/Q5nlMOn+xL4d4jEo5UJwcHf2cuGj5HTNl4fojX0S0WpW
	wmyFLvA6Tzt1YLYFrSM0J5vedzVsgs1m7rcNzrbK1MfRq8BiPOKYD+VKxcERq8SUDtxgi6ijq1hw8
	eoeRiHQsjIyRZQTh6rWOYJIpec7YpDYR64xlsQ8fMm3cZy8TTq4foSgbKZHI2dBXpOkf4QiyjN+PQ
	DYt6DIn9LhVOjmgsFo6kRkGYx1ikLV++kS1J1Is1Ltm3xFt5IDbDmP4PCwJBgMuMD2s+5khOTZTdH
	yyAtdpFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5kZ-0000000CiO4-2VAX;
	Wed, 30 Apr 2025 11:37:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5A4-0000000CbsK-1SIn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:59:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CFEF36111C;
	Wed, 30 Apr 2025 10:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3710FC4CEEA;
	Wed, 30 Apr 2025 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746010771;
	bh=Gf0bCDz5S9cCsCORXQdBpRMQaop0LeWmIkddCqh70K4=;
	h=From:To:Cc:Subject:Date:From;
	b=W0Wtf3k49S2t8o89mCdewJkS1VjicLI/LCBqEUFRRkIrj8k8zgkKFIY3BFP0Eg8oL
	 CVVkOuk2GgZaDfWDTm46Mw+xXCmzdnpj+E9Bak7u+BJo5PR4XFRWqeZrgMZlptRmqK
	 WJTiZ4tBg1u8HZzz0X+Xlo3tx4rRyaIDL20RFwCsqLFNG33IK/gsiHuc6zU2eUurf4
	 wHDPCT3u37RmX8ZLex3kYwky+AAcp9p8Engfnd68Zratb7WiOPCWgzv3KwmjLpIRFk
	 riOcg9VYka/OoGUvmQ2CqFFMcSahL4kNnKibuCu8M1ZlSs/y/zAARo7LC4jDOBtX7M
	 Wnhyo05A1kP3Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uA5A1-00AFD9-2M;
	Wed, 30 Apr 2025 11:59:29 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] KVM: arm64: Fix HCRX_EL2.GCSEn handling
Date: Wed, 30 Apr 2025 11:59:14 +0100
Message-Id: <20250430105916.3815157-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com, broonie@kernel.org
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

Will points out[1] that GCS is completely busted on the host if we
ever run a guest, as HCRX_EL2 gets set to a fixed value on vcpu exit,
value that doesn't include the GCSEn bit. This is likely to kaboom on
a nVHE/hVHE setup.

Obviously, nobody ever tested this.

This series moves the handling of HCRX_EL2 to being correctly
saved/restored, which should address the problem. I say "should", as
in keeping with the tradition, I haven't tested it either. Or at least
not with GCS, as I don't have the correct SW setup (I don't even know
what you need to enable GCS).

I'd very much appreciate some help in testing this.

Marc Zyngier (2):
  KVM: arm64: Properly save/restore HCRX_EL2
  KVM: arm64: Kill HCRX_HOST_FLAGS

 arch/arm64/include/asm/el2_setup.h      |  2 +-
 arch/arm64/include/asm/kvm_arm.h        |  1 -
 arch/arm64/kvm/hyp/include/hyp/switch.h | 13 ++++++-------
 3 files changed, 7 insertions(+), 9 deletions(-)

-- 
2.39.2


