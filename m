Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EB1C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MYE8lZNwA8V+CtJ7xD+fDgG1CwIKAYHRKTsCSyG9tD8=; b=28AGVyHDzzXBzH96f1rEJ/KJMm
	0tphGwrlZB2EK8nInQ3IJFM3pQg2CG8C0e6qIXtvXvRFMpswp7lmcY8Wsl5uFXjdi25KxLPEN8Uir
	zYutEgp1ZqUnFMBfmqvKWwqUOm4crK12vEw7cqK4m0EJRM1Jl5ui2zfsEL4pOK34+HcImmOxJ+JCp
	l+N8D6wSlkfGrpKnhCu8p8xLk67WGBhMpotTjrJdK1BC+d1Ab04XLTYWANh3+1oRzvRJPewVCkON6
	xXDhTpALCnAnXl6jUNbjli8vDx75l+EfjIqelCZl0KSuok9NP48zYjZZ79MbXDkmpz1HKifsqluxB
	Aj3LtspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r1R-00000001VAt-04sr;
	Mon, 07 Apr 2025 18:16:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oOM-00000000xhd-2Kzb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 15:28:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 763F961129;
	Mon,  7 Apr 2025 15:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14125C4CEDD;
	Mon,  7 Apr 2025 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744039685;
	bh=n7AuZH2NV6e9SfuaGYDx0Zea6O4ejBD51YJlqGzjX5E=;
	h=From:To:Cc:Subject:Date:From;
	b=LIs5oU82hOs58k3V/F0QMcM04ENZ6yVikRFy1jxLY1jTdOufd3aXIKFo0MgeKqlpo
	 ZRK6TMU2q+YnYppM0gLXQwDTZeinuRsnXL5oq6/jf32hYk7QrA1f1XGNZRAJ7yEFeY
	 /8GqXLXOAs01PE5O6x3WY5rBI4eiBMdDEPyr1taI4Qceyjgx0u57xqQaNWsnqRCTxb
	 OT7ROSjAHhkuH7/yWj4oAm2e1hsfXz1U3k3RSudbHlw+ZyIKkRV2Wid7cfQLQEVEDn
	 7ijCDZjmqsJ0PDau9zDwrTsJ6NyT7vjH1cDuiGC1SoYDGzgGSJePAHEsSCzxVczYmK
	 PEKYpHOf3NizA==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Quentin Perret <qperret@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH] KVM: arm64: Use acquire/release to communicate FF-A version negotiation
Date: Mon,  7 Apr 2025 16:27:55 +0100
Message-Id: <20250407152755.1041-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The pKVM FF-A proxy rejects FF-A requests other than FFA_VERSION until
version negotiation is complete, which is signalled by setting the
global 'has_version_negotiated' variable.

To avoid excessive locking, this variable is checked directly from
kvm_host_ffa_handler() in response to an FF-A call, but this can race
against another CPU performing the negotiation and potentially lead to
reading a torn value (incredibly unlikely for a 'bool') or problematic
re-ordering of the accesses to 'has_version_negotiated' and
'hyp_ffa_version' whereby a stale version number could be read by
__do_ffa_mem_xfer().

Use acquire/release primitives when writing 'has_version_negotiated'
with the version lock held and when reading without the lock held.

Cc: Sebastian Ene <sebastianene@google.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Quentin Perret <qperret@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>
Fixes: c9c012625e12 ("KVM: arm64: Trap FFA_VERSION host call in pKVM")
Signed-off-by: Will Deacon <will@kernel.org>
---

Found by code inspection rather than any real issue in practice.

 arch/arm64/kvm/hyp/nvhe/ffa.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index e433dfab882a..3369dd0c4009 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -730,10 +730,10 @@ static void do_ffa_version(struct arm_smccc_res *res,
 		hyp_ffa_version = ffa_req_version;
 	}
 
-	if (hyp_ffa_post_init())
+	if (hyp_ffa_post_init()) {
 		res->a0 = FFA_RET_NOT_SUPPORTED;
-	else {
-		has_version_negotiated = true;
+	} else {
+		smp_store_release(&has_version_negotiated, true);
 		res->a0 = hyp_ffa_version;
 	}
 unlock:
@@ -809,7 +809,8 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	if (!is_ffa_call(func_id))
 		return false;
 
-	if (!has_version_negotiated && func_id != FFA_VERSION) {
+	if (func_id != FFA_VERSION &&
+	    !smp_load_acquire(&has_version_negotiated)) {
 		ffa_to_smccc_error(&res, FFA_RET_INVALID_PARAMETERS);
 		goto out_handled;
 	}
-- 
2.49.0.504.g3bcea36a83-goog


