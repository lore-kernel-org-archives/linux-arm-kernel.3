Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAD5606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gd4HQDjP;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fYBfivp2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WYKLhjZojkV/Tmsr5BGvWu2TVcuinj9/B2ZB1xR8yqQ=; b=Gd4HQDjPm158bqgO25Jm2ApeNT
	OuYPX7wvhRCaHEl0/ih67WEiGPCOA4Qj+MhrVLAU1NXVgJN2UrgXY1XJPq/SktkaQbhsKpMnkp3+L
	A4+1RJ9XwLzO42QyW+hLjiE1ycj5aCSQQWxhBP24lrrsulhgtSgPFFK+REa6XNKJ8w+EgUlOsiiVU
	VOdr7lQtBm1XoaA7WiDbbm7HAzPIp0BbW/CF1pg5YnekF3B7GWpWi+q4ru6T6SKetzP0ec+gcNsWQ
	F+MryGsDsmacQZqnmKR3vbatOvQ11bGiAkNNyhodAupsDI63INbjaGnP+BrsNNwYb+5hIypLuWCr0
	uPm3bBtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsKX-000000083rX-0Rf7;
	Thu, 05 Nov 2026 07:56:19 +0000
Received: from out-122.mta1.migadu.com ([95.215.58.122] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsKU-000000083q2-2OHC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 07:56:16 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=k9y24bW4jo8B40iHLCIlVJwO4M8UIaQgR1LB6bPJ2yc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793865371; v=1; x=1794470171;
 b=fYBfivp2nsHXnzHfCaZu2p4VvmARdAKyhzKpFcorw9fQJ3KMvFxuByEbdejQ7hQ/Qpo0G8sv
 PYz7ZtNuMQCFJ7li90DL/bjY1uO0fZDw+DJ4Ei2bgEdGR/bedx5bGdnwqqqaX/3Kt0bRMWwt+1o
 rA+7J/Y7hWrnG8kFnuThfOLY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 36aa00a02140456e;
	Thu, 05 Nov 2026 07:56:11 +0000
X-Mizu-Trace-ID: 36aa00a02140456e
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Martijn Bogaard <martijnbogaard@google.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] KVM: arm64: Honour KVM_VM_TYPE_ARM_IPA_SIZE under pKVM
Date: Thu,  5 Nov 2026 07:56:03 +0000
Message-ID: <20261105075606.367005-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_235615_175159_FDFB88F5 
X-CRM114-Status: GOOD (  11.47  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

Changes since v1 [1]:
  - Dropped v1's kvm_get_ipa_max() patch. EL2 checks the requested IPA
    size against a copy of the host's limit taken at init.
  - Added patch 2, which aligns the PGD of EL2's selftest VM.
  - Rebased on 7.4-rc1.

pKVM ignores KVM_VM_TYPE_ARM_IPA_SIZE: every VM gets the host's IPA
limit, and an out-of-range request is accepted. So the vgic_init
selftest fails on any pKVM host whose limit exceeds 40 bits.

With patch 3, a VM gets the IPA size its VMM requested, and EL2 rejects
one the host itself would reject.

Patch 1 rejects a PGD donation that isn't aligned to its size, which
crashes EL2 today. It's first because patch 3 lets the host choose
that size. Patch 2 aligns the PGD of EL2's own selftest VM under
CONFIG_NVHE_EL2_DEBUG.

A VMM that requests less than the host limit now gets that size. One
passing the default type gets 40 bits. On a host whose limit is below
40 bits the default type is rejected, as it is without pKVM. kvmtool
and QEMU request the size their memory map spans, and crosvm the host
limit, so none of them places anything beyond its request.

On QEMU, with 7.4-rc1 as a 64K/PA_BITS_48 pKVM host on a 52-bit part,
KVM_RUN fails on a 52-bit VM's first access to a memslot above 2^48.
With patch 3 the guest writes through it. The same kernel, with
CONFIG_NVHE_EL2_DEBUG, panics at pKVM init on cortex-a57, which patch 2
fixes.

On an M4, whose limit is 40 bits, pKVM now rejects a 44-bit request, as
the M4 does without pKVM. A protected kvmtool guest there boots with the
32 bits it requests.

Based on Linux 7.4-rc1 (6628e7d4c6b25).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260917091826.2639205-1-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: Align the pKVM selftest VM's stage-2 PGD
  KVM: arm64: Honour the requested IPA size under pKVM

Quentin Perret (1):
  KVM: arm64: Check PGD alignment when creating a pVM

 arch/arm64/include/asm/kvm_hyp.h      |  1 +
 arch/arm64/kvm/arm.c                  |  1 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c |  2 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c        | 34 +++++++++++++++++++++------
 arch/arm64/kvm/mmu.c                  |  4 +---
 5 files changed, 31 insertions(+), 11 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


