Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E08AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 16:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GbfXgJ84JiWs1DCaYEa5Jfr1QNKfokLMlrtfPdfPcS4=; b=3Mtdy4EAr3tYpvWSRvk0Z7jw4E
	2CocGERoyJfRDm8HcqzoHK6LL2i7FRnz9lv6cQ/WVcfP9EJfYnVZJI/275KCqZg7s+tWnOmJR4J0C
	CmMUGd1X6flbhaSvkpNAS3IRb70Ik/hA+7qYYBzObTILL8F23ICqWMLEKLl3Gkb1SH8isBBEC/tG1
	Wq6IBWUTZDU2Ayo0ovF3cHLShxTkE+Bv7Ycc28Dws7l2TyRDf4l0wC1oUbEg9FTV9JzX9VL+i+pEx
	NncOCiZmsOKtV0hHncxHXT8ffbCzzNMG1W8CdfuU/02pJ0TiN6KmeVpR6CgxY7Jw5tnQfrLol+aiz
	43KNsj3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1EJ-000000035yk-3N4t;
	Sun, 12 Jan 2025 16:54:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1Ae-000000035cw-4523
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 16:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BCF295C02D7;
	Sun, 12 Jan 2025 16:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565DCC4CEDF;
	Sun, 12 Jan 2025 16:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736700637;
	bh=+VkGKow8plOWnLeNwlQycmgXpMLo8zy0sbUQstHgjn8=;
	h=From:To:Cc:Subject:Date:From;
	b=eaLyy0gIGDzMaxtKhSVA+XFYu7ZH/rYpprCQX0no9wYqYMc3xg+b0vPa4dH5hRn9Z
	 8MngDr5CYLQdZFoJdzHAnpsrJOlQ/2g7dWYY/qoRfT6B6SFx4bYdDz0qi+2MnOj4V6
	 FmyodEArNN3cpGRGpYMWxTyrvBPux1ihBLNvhnRvYY6cYprvh0vgpilbMXuKNv6qBh
	 Xt3rHeuieF4eRt0CehrhuTdnZnjXuRkoQKhnbFIaEjKkAeBMFX8rHKna2dRCi/75xo
	 AgetygdeJhZspkd4pRJiwAOdpgAXXEoq2FMU9BRIk8uW1GzqMnUouyFMXA85ZQC5hS
	 1iExjwFphUDtQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tX1AZ-00BNnv-2d;
	Sun, 12 Jan 2025 16:50:35 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 0/2] KVM: arm64: nv: Fix sysreg RESx-ication
Date: Sun, 12 Jan 2025 16:50:27 +0000
Message-Id: <20250112165029.1181056-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_085041_080690_8053113A 
X-CRM114-Status: GOOD (  12.28  )
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

Joey recently reported that some rather basic tests were failing on
NV, and managed to track it down to critical register fields (such as
HCR_EL2.E2H) not having their expect value.

Further investigation has outlined a couple of critical issues:

- Evaluating HCR_EL2.E2H must always be done with a sanitising
  accessor, no ifs, no buts. Given that KVM assumes a fixed value for
  this bit, we cannot leave it to the guest to mess with.

- Resetting the sysreg file must result in the RESx bits taking
  effect. Otherwise, we may end-up making the wrong decision (see
  above), and we definitely expose invalid values to the guest. Note
  that because we compute the RESx masks very late in the VM setup, we
  need to apply these masks at that particular point as well.

The two patches in this series are enough to fix the current set of
issues, but __vcpu_sys_reg() needs some extra work as it is doing the
wrong thing when used as a lvalue. I'll post a separate series for
that, as the two problems are fairly orthogonal, and this results in a
significant amount of churn.

All kudos to Joey for patiently tracking that one down. This was
hidden behind a myriad of other issues, and nailing this sucker down
is nothing short of a debugging lesson. Drinks on me next time.

Unless someone shouts, I'll take this in for 6.14.

Marc Zyngier (2):
  KVM: arm64: nv: Always evaluate HCR_EL2 using sanitising accessors
  KVM: arm64: nv: Apply RESx settings to sysreg reset values

 arch/arm64/include/asm/kvm_emulate.h | 36 ++++++++++++----------------
 arch/arm64/include/asm/kvm_nested.h  |  2 +-
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c   |  4 ++--
 arch/arm64/kvm/nested.c              |  9 +++++--
 arch/arm64/kvm/sys_regs.c            |  5 +++-
 5 files changed, 29 insertions(+), 27 deletions(-)

-- 
2.39.2


