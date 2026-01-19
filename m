Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF2ECCF2DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sIBC3t87Yu7qPE6Nv2qbCt4k1GkXsZsoRdGLr380cJA=; b=q+ajYyeRJysMDuQO240WhSbYv3
	PiLSi7ABu1DPvDfWJyrY61ILBtl1bk+5BpHi6A2KdEnFuTZfWy3NCPeWAqeSz9qdKO3UxvawKAIFe
	ZglHDQpeRuRra9jRfZHGsuzYl2HewSzvPZdNHfygwMfr7+6gqenCK33WYnMHpJwr3INbNi+C/zS++
	Vm0efpUYsoMwBU6xeSEvl5nptYseWzTYpHBYfv1K7jjDrRampziy4iiQDZSzJbRe66BF8wpH5HC7R
	wGpyl8fbkyyhGE45P/YA9jdxVAGy2u1AFCuA0BsgaUKd1qKngFkiTJ3pOApPQeUhX0xdIr6oCsFjS
	3WJeDbCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmwM-00000001pVM-41lv;
	Mon, 19 Jan 2026 10:56:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmwM-00000001pTp-0TRq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:56:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35B6460140;
	Mon, 19 Jan 2026 10:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7BEC116C6;
	Mon, 19 Jan 2026 10:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820216;
	bh=+At1IbBtGnJKCQBdyPPtACTjJjP82alOLGMVRxdUrr0=;
	h=From:To:Cc:Subject:Date:From;
	b=rCUFcs26jIdaWZm/OTN5XSTR9tpmwDaxhoEsRrCNvkWPQdFXacysw5XnLc+1OhPmo
	 QHHnRh6RqaEsmztkORXUVD55Df8kg36waWLOFB0SdOEe1q1HPGTZ1ErjD3qZ/do0J/
	 5kIpBIYs3b4TOv3XHWvSCsXE1kIF99pflt8uFCD2sIe9XAm39ZY/6I23fnl3L6OWE2
	 0WcbndlGfzW3nle+qBsou6IrulrgUWd85+9pJh2uGxei8xz7FDKL9Na/sz52L9HeQL
	 JtFQBAJvvoUmtUWeFpJBiwq07qg2cYun7whpe1EazgQTD9LfMv4W48QDQKMMJqvoqe
	 QrWafwSnvpY3w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vhmwI-00000003YVK-2yfA;
	Mon, 19 Jan 2026 10:56:54 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 0/6] KVM: arm64: ... and FWB for all
Date: Mon, 19 Jan 2026 10:56:45 +0000
Message-ID: <20260119105651.255693-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, will@kernel.org, qperret@google.com, tabba@google.com
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

[Yes, you can tell what I was listening to]

Today, running in protected mode puts the host under it's own S2 with
FWB=0, even if the rest of the guests are running with FWB=1. The
rationale for this special-casing of the host is that we want the
combined attributes to actually reflect the ones exposed by S1.

We therefore use NormalCacheable (which is the weakest memory type) as
the default attributes at S2 so that S1 can only strengthen the final
memory type.

But there is no reason why we cannot achieve the same effect with
FWB. We normally use FWB to enforce cacheable memory from S2,
irrespective of S1. But it is possible to configure the S2 attributes
as "pass-through", so that the S1 attributes are always used.

This small series implements that change, adding a flag that actually
describes what we are trying to do (instead of the NOFWB flag which is
pretty obscure), and fixes an interesting gotcha with CMOs.
Interestingly, CMOs never actually worked with NOFWB on an FWB-aware
platform...

Patches on top of 6.19-rc5.

Marc Zyngier (6):
  arm64: Add MT_S2{,_FWB}_AS_S1 encodings
  KVM: arm64: Add KVM_PGTABLE_S2_AS_S1 flag
  KVM: arm64: Make stage2_pte_cacheable() return false when S2_AS_S1 is
    set
  KVM: arm64: Switch pKVM host S2 over to KVM_PGTABLE_S2_AS_S1
  KVM: arm64: Kill KVM_PGTABLE_S2_NOFWB
  KVM: arm64: Simplify PAGE_S2_MEMATTR

 arch/arm64/include/asm/kvm_pgtable.h  |  7 +++---
 arch/arm64/include/asm/memory.h       | 11 ++++++---
 arch/arm64/include/asm/pgtable-prot.h |  4 ++--
 arch/arm64/kvm/hyp/nvhe/mem_protect.c |  4 +++-
 arch/arm64/kvm/hyp/pgtable.c          | 32 +++++++++++++++++++--------
 5 files changed, 39 insertions(+), 19 deletions(-)

-- 
2.47.3


