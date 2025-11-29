Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66800D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 14:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fB1ealt8pzh8boCF5sRwTWfwt4mYMQBASojwWSOdH+c=; b=RcNYBlTFdz6m6jdJ3c/ya2gPmQ
	UC2lOmKOupIBJoK/KGs+VKBzF4tCs/pDcJU81dE6uYT/7+XQFRDtHOoY4tQQu+DFA1Cbtso0xT4RK
	b3pQEBzagiZAOf4SD7XFKlaY9D9tSUZXfh9WJ4Cwc8dbdDqk/+BD0vE5WMlAhiqJg0ONSThfj7gA5
	vBC8GA1FG+ItGhM/LSZZeZ1apUfc1vZzd4rTr2dDmbJHJCZ/QMUJ6mStNv01hiDc2f0X2K5bd556A
	d7c6IO7OolcEPLXoOQVl2XsonxB0frUsoPlKQFtXrqIqJvAY3oA/GlF+JofA3ZVnrGdM95bkQpVNC
	ev/cu8nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPMCc-00000001bfG-1Xcl;
	Sat, 29 Nov 2025 14:45:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPMCa-00000001beT-0MgE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 14:45:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FF2660127;
	Sat, 29 Nov 2025 14:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E051C4AF0B;
	Sat, 29 Nov 2025 14:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764427530;
	bh=7tC7op/J6rZJJxjSeQrwuiT/WKqfCsxg4T0/eT/3V3w=;
	h=From:To:Cc:Subject:Date:From;
	b=Xwjdl5EyjbRBMY8k6J8fOB0VOKULwD7uBLYx5dibgztz6l5wo1AYAfMx/y3nk3Noa
	 eV9rdA28P2qWeOnQI4mX5trNfM2QOAwZp2mC+JVNXDIWmO4nWKyAnCDJGkS4S7WXLI
	 +865rIi2o597uELMkfbM3zf50KODmH89OZislubOkVaDzkYSoJzn4Em38YHQYuXCsL
	 XBZfI5+3CWT8D5DKOOgcNcCDXXVYsUmIVF62BlJXW0DM9FWtqNUV2WDDKDjf3e/CYs
	 qFwGt9I3KqyQr+Cl0SYMevJMCnBTQWGvCnDKOoQalvdPbybItKrBAEudZHw2VYS0Hv
	 hy3eYAPLt12TQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vPMCW-00000009HnQ-14Nf;
	Sat, 29 Nov 2025 14:45:28 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH 0/4] KVM: arm64: VTCR_EL2 conversion to feature dependency framework
Date: Sat, 29 Nov 2025 14:45:21 +0000
Message-ID: <20251129144525.2609207-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, alexandru.elisei@arm.com
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

Alexandru recently pointed out [0] that the RES0 handling of VTCR_EL2
was broken now that we have some support for stage-2 AF.

Instead of addressing this piecemeal as Alexandru was suggesting in
his series, I've taken the approach to do a full-blown conversion,
including moving VTCR_EL2 to the sysreg file (the latter resulting in
a bit of churn in the page table code, both canonical and nested).

The result is, as usual, on the larger side of things, but mostly made
of generated stuff, though the definition for FEAT_LPA2 is horrific,
and required some adjustments to the way we define TGRAN*_2.

Lightly tested on M2.

[0] https://lore.kernel.org/r/20251128100946.74210-1-alexandru.elisei@arm.com

Marc Zyngier (4):
  arm64: Convert ID_AA64MMFR0_EL1.TGRAN{4,16,64}_2 to UnsignedEnum
  arm64: Convert VTCR_EL2 to sysreg infratructure
  KVM: arm64: Account for RES1 bits in DECLARE_FEAT_MAP()
  KVM: arm64: Convert VTCR_EL2 to config-driven sanitisation

 arch/arm64/include/asm/kvm_arm.h | 52 ++++++-----------------
 arch/arm64/include/asm/sysreg.h  |  1 -
 arch/arm64/kvm/config.c          | 72 +++++++++++++++++++++++++++++++-
 arch/arm64/kvm/hyp/pgtable.c     |  8 ++--
 arch/arm64/kvm/nested.c          | 11 +++--
 arch/arm64/tools/sysreg          | 63 ++++++++++++++++++++++++++--
 6 files changed, 151 insertions(+), 56 deletions(-)

-- 
2.47.3


