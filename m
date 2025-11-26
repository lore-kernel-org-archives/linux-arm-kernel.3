Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93962D11184
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Zh1/m01Eu7R6Y+qEVBSqwCo3ncCT9rGztVxHS0TqKo=; b=cry3XHTHsU56g4+Zkb3NfqWvj3
	7ykF6gXN8PwBDGV+7PgZVhlB0v3I4q/lZQ9JoNdTzWXVbVL2oUqWNUFucpkNIsf8e8FkA2SUqdXWD
	5E6NY5RfuQyepoljeAHoWWjH8z/ypSvZ5O7xEAgNqvRqtI8FUSDONpoKSvLq38p9AH3DKrDT6At29
	IT9FwHlNxPPSRpXXbt/VBuqDvfHIr5Z9sqslNDyfDmXYgEivrWe3i8CMxDLxy9Cu9M5sHi43jF9XE
	Jk5oTjmm7IUtYYLR6NPnAXqCp7nMsiWoh77U/Ac6rGmjT1bainPjWgPabqA4JMF53rFZV+e9RgnOz
	TmLM9Itw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHw9-0000000FDni-1jkK;
	Wed, 26 Nov 2025 16:00:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHw2-0000000FDhi-3Ir4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:00:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8898640102;
	Wed, 26 Nov 2025 16:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C936C116B1;
	Wed, 26 Nov 2025 16:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764172801;
	bh=+BV4THtYsQfcXI7IsOiiCra+PKb2lEDeuC2fbyHx94E=;
	h=From:To:Cc:Subject:Date:From;
	b=YF9z44E5JESLD5d1T4C1tdQX09Ei64wnllaj1pF7GgnSEPVlsMh75pmmVQ3tVA/Rg
	 /q08fZDQTARboGe2lRON/sXRoPNXSl9rzgBpPdvl3Zc+sFtUtJyrdgeghOkG9e/Eeu
	 Ao1s76QSGpGnryGXrPcZu5JGIszepPuKsoJ3llFP8jsZ0U8R1YFSE4vkpHKWIOO+sK
	 ZKBFNTVwarwcwn/33LXaFnENMmh5/7BbQFaRzE1Hp2Mt4G2R8j1zk6OAUG+bmBRgZU
	 FP+EfQPKbe/9uMvMtfmUu0ahsj+vGzY+LD5cPWqDzacJXdcITJWhiThMpEDS6PS7Vq
	 f7azhSdV3moNw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vOHvy-00000008WrH-132B;
	Wed, 26 Nov 2025 15:59:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v2 0/5] KVM: arm64: Add support for FEAT_IDST
Date: Wed, 26 Nov 2025 15:59:46 +0000
Message-ID: <20251126155951.1146317-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_080002_857470_8CB812A1 
X-CRM114-Status: GOOD (  12.77  )
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

FEAT_IDST appeared in ARMv8.4, and allows ID registers to be trapped
if they are not implemented. This only concerns 3 registers (GMID_EL1,
CCSIDR2_EL1 and SMIDR_EL1), which are part of features that may not be
exposed to the guest even if present on the host.

For these registers, the HW should report them with EC=0x18, even if
the feature isn't implemented.

Add support for this feature by handling these registers in a specific
way and implementing GMID_EL1 support in the process. A very basic
selftest checks that these registers behave as expected.

* From v1: [1]

  - Fixed commit message in patch #4 (Ben)
  - Collected RB, with thanks (Joey)

[1] https://lore.kernel.org/r/20251120133202.2037803-1-maz@kernel.org

Marc Zyngier (5):
  KVM: arm64: Add routing/handling for GMID_EL1
  KVM: arm64: Force trap of GMID_EL1 when the guest doesn't have MTE
  KVM: arm64: Add a generic synchronous exception injection primitive
  KVM: arm64: Report optional ID register traps with a 0x18 syndrome
  KVM: arm64: selftests: Add a test for FEAT_IDST

 arch/arm64/include/asm/kvm_emulate.h          |   1 +
 arch/arm64/kvm/emulate-nested.c               |   8 ++
 arch/arm64/kvm/inject_fault.c                 |  10 +-
 arch/arm64/kvm/sys_regs.c                     |  17 ++-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/arm64/idreg-idst.c  | 117 ++++++++++++++++++
 6 files changed, 149 insertions(+), 5 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/idreg-idst.c

-- 
2.47.3


