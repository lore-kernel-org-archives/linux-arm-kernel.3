Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCF8C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SWD2OGzkfyFLvvWGkkmzqJVTao5BUbMKTC5Juv3i47Y=; b=QzBdYYTlunRJYCZueWCM/iq5GA
	rm7fkOZK8C5767aKBoXuR+Uz2V7Usjo07M1iM7PL3bkE+1gEtLI9phlgRJiXWuMLgzc8f7jOiH1BL
	qEO3lu23wTPZVP4x5DmQnVzsc4q2ld08//0l9FLHnE+Vo+YO1gYiRJI9f95M/e9y0wqRiNoOrmVPW
	kXvTdYKXIBa/3dXbFGt84kRQpkmRkg1TZZ/N3ats9/5mV/1immbXs2VTn4Si3zAoEQAB4E4w5E0eM
	3UAQMok9aDAjKgCaVquD2LOGUuHPr7NmfU0MwaMevUgp/+w4inSZ91aSrRx/94z/G7RPWoJZ4XY09
	CWqYA32A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZYT-000000016T5-1Ot1;
	Mon, 10 Feb 2025 19:34:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYjI-00000000yrP-1BbZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:42:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CC625C13FA;
	Mon, 10 Feb 2025 18:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7794BC4CED1;
	Mon, 10 Feb 2025 18:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739212919;
	bh=hYqQMC1uxn24XYBQz3XTDAv2RoReYBZDq3RgPAvawmg=;
	h=From:To:Cc:Subject:Date:From;
	b=ZLl2mJGaW0lIKbLosjdTexPvBdYbQTrm+tF+hJ3t5qGgucpd1nnFByxF1oKpNv1+S
	 KeQ3gUuf0DHqiJlo3yB6+O4InskYd18jVCM76Z96FyiGvJs0azB5K9zpdCpAyiIxW1
	 zlqL5miEoDCJyjzJRfDIPGO+O80e2MPyhcbv1/LOW8HVOHbZl5vKXAyfUW6npM7iEY
	 yEoEUdG2pB9mHGM1h6EdNARBNuQkRSvMEbZhv/REoOi1GfsjqWdGiwguT7W1d8wsHv
	 5qonaDCnX93JLMexjC1r1oQ0meF+NAt8oMnBsPeskG95ouqCYfuDUJT9W31hyDwiCR
	 Z/p9W3tsuP8Jw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1thYjE-002g2I-Uf;
	Mon, 10 Feb 2025 18:41:57 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 00/18] KVM: arm64: Revamp Fine Grained Trap handling
Date: Mon, 10 Feb 2025 18:41:31 +0000
Message-Id: <20250210184150.2145093-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_104200_420907_144D33DE 
X-CRM114-Status: GOOD (  21.73  )
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

Mark recently mentioned that the way we handled FGTs, and particularly
their RES0 behaviour was not entirely future-proof.

The main issue is that RES0 bits are extracted from the sysreg file,
which is independently updated, and that the KVM-specific enablement
is not necessarily done at the same time. This means that a bit that
KVM considered RES0 at some point all of a sudden acquires a meaning,
and that this can trigger unexpected behaviours.

One way of fixing that would be to mandate that everything gets
updated synchronously. While this is something I'd really want to see,
it is unlikely to happen within my lifetime.

So the next best option is to reintroduce KVM's own view of RES0
masks, so that it can continue to ignore a given feature in a safe
manner. But instead of going back to what we have a while back in the
form of hand-crafted masks that are likely to be wrong, this series
makes use of the rather exhaustive description of traps that we know
about, and then some more:

- compile the encoding_to_fgt[] array into individual positive,
  negative, and res0 masks

- use these masks in place of anything that is hardcoded

- fix a few bugs along the way (thanks Mark!)

- perform some validation and let users know that KVM may be missing
  some FGT bit definitions

But it would be foolish to stop here. We also use FGTs to implement
the so called "Fine Grained UNDEF" (FGU) bits, and make sure that
system registers that are not exposed to a guest do UNDEF. This means
evaluating the guest configuration and setting up these FGU bits when
said configuration isn't supported.

This series therefore goes one step further and, for the HFG*TR_EL2,
HDFG*TR_EL2, and HAFGRTR_EL2 registers, define which bit is controlled
by which feature. This is done mechanically, with very minimal human
intervention, by extracting the relevant data from the ARM-released
JSON files.

With that data, we greatly simplify the dependency between FGUs and
features, as no code needs to be written. We also use the same data to
set the RES0 bits for any register that requires sanitisation (the
VNCR-backed registers, for example).

Overall, and while this is a lot of new LoCs, it is IMO a reduction in
complexity and maintenance burden. I also have additional patches
addressing HCRX_EL2 and HCR_EL2, but this is already a large series
and I'd like some feedback on it.

This series is atop of 6.14-rc2, and contains bits and pieces of
FEAT_LS64 support thanks to the newly added HFGITR_EL2.PSBCSYNC bit
sharing an EC with LS64...

Marc Zyngier (17):
  arm64: Add ID_AA64ISAR1_EL1.LS64 encoding for FEAT_LS64WB
  arm64: Add syndrome information for trapped LD64B/ST64B{,V,V0}
  KVM: arm64: Handle trapping of FEAT_LS64* instructions
  KVM: arm64: Restrict ACCDATA_EL1 undef to FEAT_ST64_ACCDATA being
    disabled
  KVM: arm64: Don't treat HCRX_EL2 as a FGT register
  KVM: arm64: Plug FEAT_GCS handling
  KVM: arm64: Compute FGT masks from KVM's own FGT tables
  KVM: arm64: Add description of FGT bits leading to EC!=0x18
  KVM: arm64: Use computed masks as sanitisers for FGT registers
  KVM: arm64: Propagate FGT masks to the nVHE hypervisor
  KVM: arm64: Use computed FGT masks to setup FGT registers
  KVM: arm64: Remove most hand-crafted masks for FGT registers
  KVM: arm64: Use KVM-specific HCRX_EL2 RES0 mask
  KVM: arm64: Handle PSB CSYNC traps
  KVM: arm64: Switch to table-driven FGU configuration
  KVM: arm64: Validate FGT register descriptions against RES0 masks
  KVM: arm64: Use FGT feature maps to drive RES0 bits

Mark Rutland (1):
  KVM: arm64: Unconditionally configure fine-grain traps

 arch/arm64/include/asm/esr.h            |   9 +-
 arch/arm64/include/asm/kvm_arm.h        |  64 +--
 arch/arm64/include/asm/kvm_host.h       |  25 +
 arch/arm64/kvm/Makefile                 |   2 +-
 arch/arm64/kvm/arm.c                    |   8 +
 arch/arm64/kvm/config.c                 | 614 ++++++++++++++++++++++++
 arch/arm64/kvm/emulate-nested.c         | 140 +++++-
 arch/arm64/kvm/handle_exit.c            |  81 ++++
 arch/arm64/kvm/hyp/include/hyp/switch.h | 110 ++---
 arch/arm64/kvm/hyp/nvhe/switch.c        |   7 +
 arch/arm64/kvm/nested.c                 | 137 +-----
 arch/arm64/kvm/sys_regs.c               |  65 +--
 arch/arm64/tools/sysreg                 |   3 +-
 13 files changed, 976 insertions(+), 289 deletions(-)
 create mode 100644 arch/arm64/kvm/config.c

-- 
2.39.2


