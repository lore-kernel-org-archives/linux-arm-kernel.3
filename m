Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902A6606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 10:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A4nLeVc+;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wtk2tfok
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tytNRA2x/cdXQgb+WGb9wUkqID3jyg9++uqej4viFWA=; b=A4nLeVc+nCXL079mOALSvf0SFK
	Iu0PmdHek79+R4ie2HUDQ6YbXGr0BIcdYrJOtrFFqduR5eMbWKkBg+jQQPgdQBUVEmITXrE/VrCD1
	/dkrm34z6B9NM9legEcdySEXcbbfyTjSmxxW9N8RHyqD8e0Jc2nLcwdJ4QdBlgmhHMYAq1MIqsaDW
	2tR6KY8JrE4IeUERoC/c5dfkIkbUKh2EfIhM271W6CQAfose5vXoTPFajSeupwwIx49VdiiY4GT2G
	pJYf+6suD8ZU0pM1hg131ZgwBOWUGyigPeOgh04j7J6xNH9Y49J2K65v5gLQCI05dYCrWDKmkiZBX
	14nNaqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpdy-0000000Dtq9-2EEZ;
	Thu, 22 Oct 2026 10:03:30 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpdw-0000000Dtp1-2Tjs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 10:03:30 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=bdwUyWR/ogB0uruaLKskLrPi9QHrdsAZ7cDFPYUW9pg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792663405; v=1; x=1793268205;
 b=wtk2tfok5DtBnkyhCxjarl+rdNrbWxaw0zgeTVXX5yy8E2cuEb/99lvOMktpGjXG8J7EZTTy
 bg1c+GRjmsR49oOige7EXjMJX5sPG1WvlEBZE3G99e7u2PSI/+nOqZwamt61pyDbnTEOIurVOqb
 tLoHOQjWAxXblrJLzQ5B+KD0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f968876e0cbfdf44;
	Thu, 22 Oct 2026 10:03:25 +0000
X-Mizu-Trace-ID: f968876e0cbfdf44
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: nv: Don't WARN when L1 sets IMO and FMO differently
Date: Thu, 22 Oct 2026 11:03:19 +0100
Message-ID: <20261022100319.3046476-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_030328_773110_0E7D5516 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When L1 runs L2 with only one of IMO and FMO set in its HCR_EL2,
vgic_state_is_nested() WARNs that this isn't supported. KVM then runs
L2 as if both bits were set.

However, IMO and FMO are independent bits, so any L1 can trigger the
WARN, which panics a host running with panic_on_warn.

Drop the WARN.

Fixes: 146a050f2d8c4 ("KVM: arm64: nv: Nested GICv3 emulation")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260714235020.2F4151F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
I dropped the WARN rather than demoting it to a print, the same way
e6e3e0022ef8f ("KVM: arm64: timer: Drop warning on failed interrupt
signalling") dropped one that was loud and easy to trigger from
userspace.

Tested on QEMU with kvm-arm.mode=nested. A reproducer of mine sets
L1's HCR_EL2 to IMO=1, FMO=0, TGE=0 through KVM_SET_ONE_REG and starts
the vCPU at EL1. The host WARNs on the first KVM_RUN without this
patch, and not with it.

Based on kvmarm/fixes (c5b7894f1a26b), which has the HCR_EL2_* rename.

 arch/arm64/kvm/vgic/vgic-v3-nested.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index 82bfc4d4f122f..c70e06c46a7a5 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -121,9 +121,6 @@ bool vgic_state_is_nested(struct kvm_vcpu *vcpu)
 
 	if (is_nested_ctxt(vcpu)) {
 		xmo = __vcpu_sys_reg(vcpu, HCR_EL2) & (HCR_EL2_IMO | HCR_EL2_FMO);
-		WARN_ONCE(xmo && xmo != (HCR_EL2_IMO | HCR_EL2_FMO),
-			  "Separate virtual IRQ/FIQ settings not supported\n");
-
 		return !!xmo;
 	}
 

base-commit: c5b7894f1a26b5cc942be1cd11b15c3876c837a1
-- 
2.47.3


