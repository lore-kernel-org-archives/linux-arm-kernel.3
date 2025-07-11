Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1C7C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QvQZjITQUy1vehOVun9qYjbArQq16xcWUq4wj4bnXCI=; b=MArHKN5POOP8MQOIJnPzmbE1p8
	7Ub3K3ZtfR/h/Cjsw7dH8adWtnr1uLZ20M12QZsVLkiMAsnxQJIM1rBXCSwkfX+Wq36wBYcnHQiBn
	zcV3G//1TITeg4tGOgb3qg30s7AmgAFq1JvyJ82DniiK7KGe/3UReXDt2BVOUzNpE7Sb9y/BgKvEM
	dKP/kYsPuFhw4N9ABte5/JFdEpt/O6vRj/Ti5a3Nnj1auBc+fuLPvy0yLKJ6SpIoly3wZbX5nqtEQ
	TiA3+3LTCAvNLyefoFbV99E4QHIbhpeuBirBztz7eeKRuUmlfL7zH013z3fz+9a8+s8bVeVVkj0c6
	s6a4r02Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaATS-0000000EO6w-1vpy;
	Fri, 11 Jul 2025 09:55:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9RD-0000000ED0K-49jF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 08:49:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 58E1C6116F;
	Fri, 11 Jul 2025 08:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EADAC4CEED;
	Fri, 11 Jul 2025 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752223739;
	bh=qz00TFtiE4R9C6GWhLvgyU/ZW+rbFxh0EXwo9y3XYzc=;
	h=From:To:Cc:Subject:Date:From;
	b=NVbgk0xZyDfduDrHs8UvuNrW4RZ9tlGbUnqMtapN1luVq4ONDeRgmHkSO2+YZettB
	 RZmsn/qyEPqb2H8dhMuHSGbLcAAUR4nSPWWoYLPYQoRJmSduSWeUZNjYklwisZhrI1
	 1LESzMo/WKmdUSakFIYnsgiFVjabvXcWZGxnxShWXVXO53MDLCEtWXSwgwlwidGe/H
	 lcbCNOH6XXSf+OWLiuHzkj7eBYtwhW5xXXbOS8gSpvmJ8YHAUnUemdV7M39RTlVc9y
	 upB3qMCA/CZVN0sxmZOTpiaxPxGyBBEDCFB4jX0crY+grBRVLYv/JaPs4YyiB2YmVB
	 va1A2WSgGeXjA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ua9RA-00Eo6u-Ez;
	Fri, 11 Jul 2025 09:48:56 +0100
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ben Horgan <ben.horgan@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] KVM/arm64 fixes for 6.16, take #6
Date: Fri, 11 Jul 2025 09:48:34 +0100
Message-Id: <20250711084835.2411230-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, ben.horgan@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Paolo,

Here the (hopefully) last fix for 6.16, addressing what can adequately
be called a brain fart in dealing with the sanitisation of the number
of PMU registers in nested virt.

Please pull,

	M.

The following changes since commit 42ce432522a17685f5a84529de49e555477c0a1f:

  KVM: arm64: Remove kvm_arch_vcpu_run_map_fp() (2025-07-03 10:39:24 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-6.16-6

for you to fetch changes up to 2265c08ec393ef1f5ef5019add0ab1e3a7ee0b79:

  KVM: arm64: Fix enforcement of upper bound on MDCR_EL2.HPMN (2025-07-09 13:19:24 +0100)

----------------------------------------------------------------
KVM/arm64 fixes for 6.16, take #6

- Fix use of u64_replace_bits() in adjusting the guest's view of
  MDCR_EL2.HPMN.

----------------------------------------------------------------
Ben Horgan (1):
      KVM: arm64: Fix enforcement of upper bound on MDCR_EL2.HPMN

 arch/arm64/kvm/sys_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

