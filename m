Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250F0D3C546
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5xErZxqsFBxLHzX1LqiDFVmmtg57smbnhrNYyHTL/Hk=; b=rswCH5YCLQTXU0Vgx+/zB7E2fc
	UPWVLyfCsS8A7Z5jSW95WbLs5v4J2VWJ8TRGEiKXxSnHjQrcyggQ4ESTCKiES+hZAeRDehh2bKj0m
	Zs82wSuDAgnV/fWC6SHFoeGXkw4PK2Vxp8MFF9LQUv6Wd6YmBBL18nJsvFYdikWUgFI2296gOJX0V
	xuZUhsgg7CQKniv+wPKYW5ltRkEhE8BnGJhFQPszWeeljKcScCsBtdrBKjtflLredE1mgRUdmwXuf
	+P7izj3Nn5RWrNnSeMQS4wcWy/JaDtXrThPK8LyaWF9HVQPV+UGJ1c/XxbRuVJSWG8/m2iK1bHurl
	DmnOjPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTK89-0000000FTgp-0xr6;
	Wed, 10 Dec 2025 13:21:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTK84-0000000FTfc-2Smo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 13:21:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B45D153B;
	Wed, 10 Dec 2025 05:21:06 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B44203F762;
	Wed, 10 Dec 2025 05:21:11 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	qperret@google.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH 0/2] KVM: arm64: pKVM fixes
Date: Wed, 10 Dec 2025 13:21:00 +0000
Message-ID: <20251210132102.137631-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_052116_671761_FFCAF583 
X-CRM114-Status: UNSURE (   8.90  )
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

Similar to [1], when trying to run an unprotected VM on FVP with S1PIE enabled
and kvm-arm.mode=protected, writes to PIRE0_EL1 made by the guest in
__cpu_setup() are trapped by KVM and the BUG_ON(!r->access) is hit. That's
because HFGWTR_EL2.nPIRE0_EL1 is an inverse polarity trap and the FGT values for
the unprotected pKVM VCPU weren't being propagated from kvm_arch_vcpu_load().

Couldn't figure out how to run a protected pKVM VM, so that's untested.

Patch #2 is just a minor fixup for something I found by code inspection when I
trying to figure out how unprotected pKVM works.

[1] https://lore.kernel.org/all/20251112102853.47759-1-alexandru.elisei@arm.com/

Alexandru Elisei (2):
  KVM: arm64: Copy FGT traps to unprotected pKVM VCPU on VCPU load
  KVM: arm64: Remove extra argument for
    __pvkm_host_{share,unshare}_hyp()

 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 12 ++++++++++--
 arch/arm64/kvm/hyp/nvhe/pkvm.c     |  1 -
 arch/arm64/kvm/mmu.c               |  2 +-
 3 files changed, 11 insertions(+), 4 deletions(-)


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.52.0


