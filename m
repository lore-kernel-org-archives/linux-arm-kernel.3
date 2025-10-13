Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE011CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 08:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N0c6PYSt8Bgv/5lzGFjtL+f+ELRSC6Av2kcMUTyNIX0=; b=aGJw4BwVRzzjTJqXiz3SRV8IDZ
	OHyrvOgL67hkkSwkJQ5QH9ySV11vbSWKFWIUuiVErD7SZhZIYs5o4HTFsik49cF2j5UmL3DwKUDez
	crYBE2YpugqWAlzmDfNPomf5V/i+0d4rdnbikvU2axBh4Is6TkxvOw7hIeNRI0We6coYHdBztgLR5
	iZkZmQwZ+lpZbMv3Ts9AsNQAyCHBEgKykJAgDXo49WbDUpX+AIFZBGfyihz1Zi7V4JDQTfM8TT6SH
	RnILADImGas8kzlwC15LbjpHVXOCVTU6EgcMDZQ4oTy4f61V2XQYaSmFNEniFRFfU8Luc3CbaygGm
	H6smiVqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Dyh-0000000CbrO-2EQX;
	Mon, 13 Oct 2025 08:32:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Dye-0000000CbpQ-3n4q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 08:32:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D20CD419D0;
	Mon, 13 Oct 2025 08:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FC1C4CEE7;
	Mon, 13 Oct 2025 08:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760344338;
	bh=/r+3j0SKLRbol6b7Xk7E08I5lDJ39fKkIbvrxbt9VW0=;
	h=From:To:Cc:Subject:Date:From;
	b=pT6kW/yC/Ig0omWUPcmGNTGFRBBXXAJUfyHWDC9NnpkJvGYeWNLjznPjQMpcTpUuR
	 5TBrC8O1347fgAE+GJb3MqYttL52FJMkwJ/T63OQrs6PV7Nb3AkVN4e2Xj7eaV2/6w
	 rTwN9zlyfqQTwN5k6wjVKAv2Fnoek/LO6DcOtuh/kiC9P5xIrc6hGupJt3579Cir4K
	 2EO9R/H+tvfjl6VvrHOiqNPFVoS/x7iagqY6X/iPnNjfjFtFUePi4ibV2J8z3M3q/M
	 zi0fPyEL53yqoX237As6mE+HC397mJzkasuihdYlRY5cm/pPt+MWe1vc9prLPqpDn0
	 3Mk6oP2G6qcXw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v8Dya-0000000DRrP-2UGy;
	Mon, 13 Oct 2025 08:32:16 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/3] KVM: arm64: Fix handling of ID_PFR1_EL1.GIC
Date: Mon, 13 Oct 2025 09:32:04 +0100
Message-ID: <20251013083207.518998-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, peter.maydell@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_013220_968628_45955510 
X-CRM114-Status: UNSURE (   9.05  )
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

Peter reported[1] that restoring a GICv2 VM fails badly, and correctly
points out that ID_PFR1_EL1.GIC isn't writable, while its 64bit
equivalent is. I broke that in 6.12.

The other thing is that fixing the ID regs at runtime isn't great.
specially when we could adjust them at the point where the GIC gets
created.

This small series aims at fixing these issues. I've only tagged the
first one as a stable candidate. With these fixes, I can happily
save/restore a GICv2 VM (both 32 and 64bit) on my trusty Synquacer.

[1] https://lore.kernel.org/r/CAFEAcA8TpQduexT=8rdRYC=yxm_073COjzgWJAvc26_T+-F5vA@mail.gmail.com

Marc Zyngier (3):
  KVM: arm64: Make ID_PFR1_EL1.GIC writable
  KVM: arm64: Set ID_{AA64PFR0,PFR1}_EL1.GIC when GICv3 is configured
  KVM: arm64: Limit clearing of ID_{AA64PFR0,PFR1}_EL1.GIC to userspace
    irqchip

 arch/arm64/kvm/sys_regs.c       | 12 ++++++++----
 arch/arm64/kvm/vgic/vgic-init.c | 10 ++++++++--
 2 files changed, 16 insertions(+), 6 deletions(-)

-- 
2.47.3


