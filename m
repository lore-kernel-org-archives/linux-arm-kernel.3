Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA92C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 14:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwGP79sbQzUJuu2Im6hj7gL3f7oPZvu+Vx/tDk+e0hg=; b=djnB9v1Q0cuhcHt6j2dfsOrEke
	qPPigBYN2Qkk6l9C6GSSOcYYNqc5WrS4GzLnuUottKqecm92mVSNj+LN3zH6Tjnp96kfr9kLkkxGg
	m8dENFsJ0KUAT9xvcsjK/ZVnsz5SJXast/w2eJ5OtNXHTLXmhysnt25URURCDOmJyfkSqFjbk5y9Z
	D2vgxtLtel4Y20/1OsWUYiTkqJNXFAFnayj+W1MQV+a9rm3RfKjgmzZBz4b7F4eknRO38XKp+DoDh
	erqbeXjv9GwXPbaT/65jrP+IpdQHU4NZUnu9qMA47RN9nEtzSve5/u0ud/2QzIGdOWCiTn5aI3Bb8
	dJJHHz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukkwq-00000004anV-0PQv;
	Sat, 09 Aug 2025 14:53:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukkrv-00000004aPz-0zFs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 14:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 64E57A559AF;
	Sat,  9 Aug 2025 14:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082CAC4CEE7;
	Sat,  9 Aug 2025 14:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754750902;
	bh=tQJASm8aH44i/KGmtlC/YVwcBXyOdMk6jpYTylxFeag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DE3BhcyzzLLWP6RIECv2n6Rkklaq1bx+l7gtzPmjlecPTS5W3RvumiXgsCVMR2LPd
	 FOCwzQ/H7MXKfaErfjUsXkDTwk1fNzavdr9q60Mznibgx+bILe9kCjIgSyliVK+8Z+
	 sL+AFABq1CJ6XkcbquVO6D7HLxcLVkxsJyJiQsA3ZqrhHS0aOyl0dZzWC68ZSwpl71
	 wZYvUYEvaHXEn/BWypf+cP0j07Ccg3xVPUVuzMm+X3Dj0YY0VNslXKrF0ogyoHsqCN
	 +cRYft5U9GvMCQHejK8ZwMweDZbooGLIwVXct306dutCA1VBvSSCzJT1c1zBGQpacZ
	 r2Zt4EL9YqwUw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ukkrm-005eZC-VO;
	Sat, 09 Aug 2025 15:48:15 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 1/2] KVM: arm64: nv: Fix ATS12 handling of single-stage translation
Date: Sat,  9 Aug 2025 15:48:10 +0100
Message-Id: <20250809144811.2314038-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250809144811.2314038-1-maz@kernel.org>
References: <20250809144811.2314038-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, volodymyr_babchuk@epam.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_074823_349220_F59FE293 
X-CRM114-Status: GOOD (  14.10  )
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

Volodymyr reports that using a Xen DomU as a nested guest (where
HCR_EL2.E2H == 0), ATS12 results in a translation that stops at
the L2's S1, which isn't something you'd normally expects.

Comparing the code against the spec proves to be illuminating,
and suggests that the author of such code must have been tired,
cross-eyed, drunk, or maybe all of the above.

The gist of it is that, apart from HCR_EL2.VM or HCR_EL2.DC being
0, only the use of the EL2&0 translation regime limits the walk
to S1 only, and that we must finish the S2 walk in any other case.
Which solves the above issue, as E2H==0 indicates that ATS12 walks
the EL1&0 translation regime.

Explicitly checking for EL2&0 fixes this.

Reported-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Suggested-by: Oliver Upton <oliver.upton@linux.dev>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Fixes: be04cebf3e788 ("KVM: arm64: nv: Add emulation of AT S12E{0,1}{R,W}")
Link: https://lore.kernel.org/r/20250806141707.3479194-2-volodymyr_babchuk@epam.com
---
 arch/arm64/kvm/at.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 0e56105339493..d71ca4ddc9d1e 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1420,10 +1420,10 @@ void __kvm_at_s12(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 		return;
 
 	/*
-	 * If we only have a single stage of translation (E2H=0 or
-	 * TGE=1), exit early. Same thing if {VM,DC}=={0,0}.
+	 * If we only have a single stage of translation (EL2&0), exit
+	 * early. Same thing if {VM,DC}=={0,0}.
 	 */
-	if (!vcpu_el2_e2h_is_set(vcpu) || vcpu_el2_tge_is_set(vcpu) ||
+	if (compute_translation_regime(vcpu, op) == TR_EL20 ||
 	    !(vcpu_read_sys_reg(vcpu, HCR_EL2) & (HCR_VM | HCR_DC)))
 		return;
 
-- 
2.39.2


