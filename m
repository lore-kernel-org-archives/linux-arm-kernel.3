Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8244CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 18:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C+tGfZ+PB6bqyZBJbISv2GUdNO7/NRkQ7bMldVAPn1E=; b=Bgln0RFQZYqC0iCYDIMkBsBD1a
	62aZkSuG/eQHF/tCaTg02flWWq0H20BVan1EBQFnHNKVzpBpddB1irgZ5YzeGFiWVJ4AZL2spMSIA
	8rPsl1QHQAeoo4n3YBPry3e3zSWAedHxF/7owe64uCLCopIKfkyw4Pq1EAhPEucrol9GA9M48rHmL
	fB26QXbBdMo1lLe1F+Qt1/vozLmTEVSP1k7OGaF8+FDGSeo94l+eFsTvLbrt7ndQ3pomqFebUYVQM
	fxaq3jwmeKH8XNMZ33ZB3s9Oe8NpV3mxFMG5vPMXDA1G5dkelNrzWmmpo9UN6anENTqKsf4b7T4dl
	Jr+h+KMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urKhj-0000000GRkQ-2pmq;
	Wed, 27 Aug 2025 18:17:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIjZ-0000000G8mC-0v4k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:10:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBFDD42B6F;
	Wed, 27 Aug 2025 16:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997DDC4CEF0;
	Wed, 27 Aug 2025 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756311048;
	bh=hHsu9WQdYQHrwXxayIAM189ualpE0/qjEduc1G4m+4U=;
	h=From:To:Cc:Subject:Date:From;
	b=WXyPwnSSQQpLkBnT/nHeRzsbEeft4QEWRzGqnJioHYVLz5VBgSLPHlhmM8B7ukBNR
	 euietACguNGUwzaKWzYFImpSkuACz3nx1bJASGJLgNCv7dl/rrVjofb9KNIS7fgIMD
	 DIum4u0/0SbmA+IwODqj3MRJ+89ohmISCIJwfeaNGixHtR1YC1/16ch68mzJtT6IbI
	 1OuagGUMsPmOEnQU2vwlaSgibhuIKrRYn7nc73wLPOAFtenb6PhpoVywKGdHs43NX0
	 ZfTWPmm/nr65DPYBrdVhaLqiioCSfp+AC+Rpy7INoLJHaI84aKOuXq4iwHtp9cy4tI
	 pEOuLFMw8VcxQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1urIjW-00000000yGc-24Sv;
	Wed, 27 Aug 2025 16:10:46 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 00/16] KVM: arm64: TTW reporting on SEA and 52bit PA in S1 PTW
Date: Wed, 27 Aug 2025 17:10:22 +0100
Message-Id: <20250827161039.938958-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_091049_300057_16E73EC6 
X-CRM114-Status: GOOD (  14.85  )
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

Yes, $SUBJECT rolls of the tongue.

This series was triggered by the realisation that when injecting an
SEA while on a S1PTW fault, we don't report the level of the walk and
instead give a bare SEA, which definitely violates the architecture.

This state of things dates back to the pre-NV days, when we didn't
have a S1 page table walker, and really didn't want to implement one.
I've since moved on and reluctantly implemented one, which means we
now *could* provide the level if we really wanted to.

However, nothing is that simple. The current code in at.c is firmly
48bit, as our NV implementation doesn't yet support 52bit PA, while an
EL1 VM can happily enjoy LPA and LPA2. As a result, it is necessary to
expand the S1 PTW to support both LPA and LPA2. Joy.

Then, once the above is achieved, we need to hook into the PTW
machinery to match the first level of the walk that results in
accessing the faulty address. For this, we introduce a simple filter
mechanism that could be expanded if we needed to (no, please no).

Finally, we can plug this into the fault injection path, and enjoy
seeing the translation level being populated in the ESR_ELx register.

Patches on top of 6.16-rc3.

Marc Zyngier (16):
  KVM: arm64: Add helper computing the state of 52bit PA support
  KVM: arm64: Account for 52bit when computing maximum OA
  KVM: arm64: Compute 52bit TTBR address and alignment
  KVM: arm64: Decouple output address from the PT descriptor
  KVM: arm64: Pass the walk_info structure to compute_par_s1()
  KVM: arm64: Compute shareability for LPA2
  KVM: arm64: Populate PAR_EL1 with 52bit addresses
  KVM: arm64: Expand valid block mappings to FEAT_LPA/LPA2 support
  KVM: arm64: Report faults from S1 walk setup at the expected start
    level
  KVM: arm64: Allow use of S1 PTW for non-NV vcpus
  KVM: arm64: Allow EL1 control registers to be accessed from the CPU
    state
  KVM: arm64: Don't switch MMU on translation from non-NV context
  KVM: arm64: Add filtering hook to S1 page table walk
  KVM: arm64: Add S1 IPA to page table level walker
  KVM: arm64: Populate level on S1PTW SEA injection
  KVM: arm64: selftest: Expand external_aborts test to look for TTW
    levels

 arch/arm64/include/asm/kvm_nested.h           |  25 +-
 arch/arm64/kvm/at.c                           | 341 +++++++++++++-----
 arch/arm64/kvm/inject_fault.c                 |  27 +-
 arch/arm64/kvm/nested.c                       |   2 +-
 .../selftests/kvm/arm64/external_aborts.c     |  43 +++
 .../selftests/kvm/include/arm64/processor.h   |   1 +
 .../selftests/kvm/lib/arm64/processor.c       |  13 +-
 7 files changed, 362 insertions(+), 90 deletions(-)

-- 
2.39.2


