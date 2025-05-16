Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6844C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mB4SVkKuBA15tT2jCm88V8QA+COYhSU4zM2R+cEdwCE=; b=cxEBNcBkojihGq43p5CggIEwDi
	0yLXp8rbTxg7beT1LTAgGJfjvFBLQt5HwkfH65Yy9i3z41i+5SB05AZYs1F7vywspNFDi64WRo7Ot
	mvGUO08xW0K8hcEbitX3/+hobP80n24TIjdXJwRXPSKBrUWIPEqN65DPJUGr/86C9UbtRIpNu+gtI
	Kzkp7crPPM/FecJUxls/6PUpIsg3VGnyxj47yaQlE7ApBefuYOhFwBgU1lSI3U0AJq2gGhHUzn+M/
	FDXH1PWdtcBjc2boQL5VEG7B9sz6RlRfncn6bzn9eABm39vWxC56r6HVDyCFTE/ft6T0wu+M2O2vG
	KrgDG4WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFu5A-00000003MVE-1ehP;
	Fri, 16 May 2025 12:22:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFtx5-00000003LCk-1qBJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 12:14:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2EA14A53D;
	Fri, 16 May 2025 12:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8C78C4CEEB;
	Fri, 16 May 2025 12:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747397650;
	bh=/lGfEK9zU2R6gaBuqIOJeoWF1339hPhixjeue3QgP5o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dbMC5gGKFmMSORqwk1vfo9RNP992blX2U+MtZhiFH0ZBTH4MwmBnf3smKSjRzdNbo
	 nujshAmCrXxBQcWrow3owAlU854/VsrBKy9vvhAHlecQZogET+TaMMpRbt+FVYyj76
	 er5nodp0v8i/Tq+3/EYIGZV2+3b9Cq5D6+39xg6+QP3I8b5zEthRzd/omD9lMuVqdd
	 vy5I7Szstaok1mMmuU3wrMOlMe5AjzVlivc54oZesUbuey9/nk0DNmcju5xyTgyDGX
	 1PScCs8ufZFbYT6pGdDvuNHRnecFd5sxFu8rWE04hcSeqAMAy9LDZtRwlWHM01/oYR
	 yttLZu/itLtPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C67C3ABD8;
	Fri, 16 May 2025 12:14:10 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Fri, 16 May 2025 12:14:00 +0000
Subject: [PATCH v4 1/5] KVM: arm64: Restrict FF-A host version
 renegotiation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-virtio-msg-ffa-v4-1-580ee70e5081@google.com>
References: <20250516-virtio-msg-ffa-v4-0-580ee70e5081@google.com>
In-Reply-To: <20250516-virtio-msg-ffa-v4-0-580ee70e5081@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, sebastianene@google.com, qperret@google.com, 
 qwandor@google.com, arve@android.com, perl@immunant.com, 
 lpieralisi@kernel.org, kernel-team@android.com, tabba@google.com, 
 james.morse@arm.com, armellel@google.com, jean-philippe@linaro.org, 
 ahomescu@google.com, Per Larsen <perlarsen@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747397650; l=1116;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=KE0l+d+r+QSm1fqDkNHRHhbIpv9VyyzBoa1V1b9tCZk=;
 b=LpJQ30mDqqHwDjaicF57PfEsiV7MpwOBSa0ddOhXxE84Qd3wunEL4UivPaPq6LT+HD2GHuv3p
 j+jb5zbBL7OCb+5b7E/fOyA9HFK3/8f8HvTAypL/tv+h04OrdDwtmbL
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_051411_501013_2AA7CABE 
X-CRM114-Status: GOOD (  11.92  )
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
Reply-To: perlarsen@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Per Larsen <perlarsen@google.com>

Prevent the host from re-negotiating a lesser minor version with the
hypervisor. Once the hypervisor negotiates a version, that should
remain locked in. Fix the current behaviour by returning NOT_SUPPORTED
to avoid the FF-A interoperability rules with lesser minor versions that
allow the host version to downgrade.

Signed-off-by: Per Larsen <perlarsen@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 3369dd0c4009f84ad3cf9481c747bdc57a162370..2c199d40811efb5bfae199c4a67d8ae3d9307357 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -712,7 +712,10 @@ static void do_ffa_version(struct arm_smccc_res *res,
 
 	hyp_spin_lock(&version_lock);
 	if (has_version_negotiated) {
-		res->a0 = hyp_ffa_version;
+		if (FFA_MINOR_VERSION(ffa_req_version) < FFA_MINOR_VERSION(hyp_ffa_version))
+			res->a0 = FFA_RET_NOT_SUPPORTED;
+		else
+			res->a0 = hyp_ffa_version;
 		goto unlock;
 	}
 

-- 
2.49.0.1101.gccaa498523-goog



