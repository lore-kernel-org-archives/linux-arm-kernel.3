Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6254FCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QbDbQso41QqgyKlOx5JdQWCd/kcKn17Mo7AWujX2QKs=; b=LSGqE0fPKJ8H9jhGKlLKX5vnut
	tiLZ8U0K70MlJYUR2FK4XXwvGarjhY4DPcdKBjw05WIr+du6HVXUZw0q0A7GlfCd+RXNFzcUdeQQV
	0g06MqMqIWLCx5NCWL93Wdoj6q/H2+yGSBhlGFM0anCmMK7CsZ31+tU950d3fai6DTrhUPh8DeA+V
	4C4GRlDI6dHJxzCAUKUzOqD36pe9LbwJ6VscKMb+prSj2opOr0dcFH5ilEI9Iw3jlWhb9R/pJwoyR
	v6CX28MmZgtACv2jFdzDj3jtWgXFGvno/LmoQOhk8ZO2UyQrTEJJWKB6D55Q2PEPDd9fCojlDfZQw
	aFlUX03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERkJ-0000000471Y-0tZ7;
	Thu, 30 Oct 2025 12:27:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERkG-00000004702-3RuG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:27:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 369A143643;
	Thu, 30 Oct 2025 12:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156E7C4CEF1;
	Thu, 30 Oct 2025 12:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761827232;
	bh=jo/0EMLbTp/Ctoi6txojoXXpfGK/dAchax3ckErLqx0=;
	h=From:To:Cc:Subject:Date:From;
	b=khJDio1fuT04VjpQ8He+rtGT5FbjQ8PpZVphdEJOu13J9L8viFj4PPeeI0iofiiWq
	 wmKDfdBeh3IPfEgzc0aFMoAiELoo+gTpekm+4iUrFxmRl6X1uIz4oAPCFsTUzBk4vF
	 6piVM+F8G1vywkXSxBfVcJaR7IWLSBrEp8D1sxLCHvYn7ZRDAcVFTaSW8Zvk8QxF4g
	 ks9H4/AoM+4efSqGttfTGiJzR3MVcqIvBoDMQ5IHiWdaX9gBqzh5sN1YKRoKvldrKr
	 w/NqOsix/qiSchx9VI3DqvvsX5nA/m9t/FSojSNRhUFV8rcCXx1k5hHlJDZUIZrNg1
	 c7KhalLn1z1Hw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vERkE-00000000yNP-0Lxl;
	Thu, 30 Oct 2025 12:27:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/3] KVM: arm64: Fix handling of ID_PFR1_EL1.GIC
Date: Thu, 30 Oct 2025 12:27:04 +0000
Message-ID: <20251030122707.2033690-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, peter.maydell@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_052712_879865_6BE4ADA1 
X-CRM114-Status: UNSURE (   8.76  )
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

Peter reported[0] that restoring a GICv2 VM fails badly, and correctly
points out that ID_PFR1_EL1.GIC isn't writable, while its 64bit
equivalent is. I broke that in 6.12.

The other thing is that fixing the ID regs at runtime isn't great.
specially when we could adjust them at the point where the GIC gets
created.

This small series aims at fixing these issues. I've only tagged the
first one as a stable candidate. With these fixes, I can happily
save/restore a GICv2 VM (both 32 and 64bit) on my trusty Synquacer.

* From v1 [1]:

  - Make all 32bit ID regs writable

  - Use official accessors to manipulate ID regs

  - Rebased on 6.18-rc3

[0] https://lore.kernel.org/r/CAFEAcA8TpQduexT=8rdRYC=yxm_073COjzgWJAvc26_T+-F5vA@mail.gmail.com
[3] https://lore.kernel.org/r/20251013083207.518998-1-maz@kernel.org

Marc Zyngier (3):
  KVM: arm64: Make all 32bit ID registers fully writable
  KVM: arm64: Set ID_{AA64PFR0,PFR1}_EL1.GIC when GICv3 is configured
  KVM: arm64: Limit clearing of ID_{AA64PFR0,PFR1}_EL1.GIC to userspace
    irqchip

 arch/arm64/kvm/sys_regs.c       | 71 ++++++++++++++++++---------------
 arch/arm64/kvm/vgic/vgic-init.c | 14 ++++++-
 2 files changed, 50 insertions(+), 35 deletions(-)

-- 
2.47.3


