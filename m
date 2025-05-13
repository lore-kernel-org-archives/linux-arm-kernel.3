Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BA4C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 06:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXntx+M2BhKIcyz9lzWiJ8ZAdlFNdFzw96DGOzndFsQ=; b=304MvuDqXuFo4DegArMkxxESoN
	28apU20UJLgomZs+DBFaAF5s4K4PA/ckBmjYv/ZaNx+9TS0LmiWGpHaqT3xlkUCWxnIOxL8PxHQAH
	3C7OJywuQidGmJkmaiCicak2fjyp50vvn/2sL2Ni6M8EkCiQa2daAYqHlZJztIg7vTHoKmJeaMlmy
	/nT+gsqXvKWGr12Tb5DpS5cR3dZvGQWV3o3iT7qQOcgs1H4PHJivjpn2uGAeHDpiHkWspaEdhy89q
	STcmkxEqZ0lNXyabj3OwNKPUKxDiZae3r1S5jDkacizCos5o4t8ylacwZeM6i8gPkRak9GvQ4LML6
	7HN9l4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEjAQ-0000000BVPj-1fzP;
	Tue, 13 May 2025 06:31:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEj8Q-0000000BV6z-1ZHs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 06:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8BE475C63F8;
	Tue, 13 May 2025 06:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81838C4CEED;
	Tue, 13 May 2025 06:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747117740;
	bh=CS2K4IBTS8BkewmPKf8FL6tLALwgWKThVfrXRfxYC+8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Dqm0UN82QsfC4IQP/Cp66v3A1+Ww/WMaecVYDP4VjXCwpB3PAqxXIdYKQ31lj2bC6
	 g3YdR99MU4ZMe+Tc44aqWBGRC9BD5nq3a9N5tJ1poXYgvDqUrtUkHXRAaSt4nni0UF
	 lP6psQWqFDko3jhH8QfJBioRZdbI1rZeX+geLEH930tpEIJchSBMQmGYux68a49iea
	 SEC63Gqe5N2+Dzw9lF5Js+VMnOciEeOUbz/N6u+wP0oApZLxr54DcLfVehzik7RaNd
	 WfMmzJaU+9h7VzMXD/maBUJuQ8UhUlsU6JXbEDnD7OJ6xkO6sQzpCRKv+B2T4jUwyB
	 nE/lxI14+gryA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C62AC3ABD9;
	Tue, 13 May 2025 06:29:00 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Tue, 13 May 2025 06:28:30 +0000
Subject: [PATCH v3 1/3] KVM: arm64: Restrict FF-A host version
 renegotiation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-virtio-msg-ffa-v3-1-d66c76ff1b2c@google.com>
References: <20250513-virtio-msg-ffa-v3-0-d66c76ff1b2c@google.com>
In-Reply-To: <20250513-virtio-msg-ffa-v3-0-d66c76ff1b2c@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, sebastianene@google.com, 
 lpieralisi@kernel.org, arve@android.com, qwandor@google.com, 
 kernel-team@android.com, armellel@google.com, perl@immunant.com, 
 jean-philippe@linaro.org, ahomescu@google.com, tabba@google.com, 
 qperret@google.com, james.morse@arm.com, Per Larsen <perlarsen@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747117739; l=1163;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=Prs9vwH1PpI7boVTkM9t7dd2Gj6IXNMISFZbJ9u0HHQ=;
 b=iD3MoRDcl6vsNTRQcIKy81Aq/kHV0QjJvlLIp932eUrLbxYG5Q8loKlRusWWZDX7lgiC6r6kh
 mqLFZjkse+hA86wrqJ46kG7NDve/h1wBZyoRavVqXmupHV3UmqOlBhP
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_232902_499712_7E7EFCC2 
X-CRM114-Status: GOOD (  12.26  )
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
Signed-off-by: Per Larsen <perl@immunant.com>
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
2.49.0.1045.g170613ef41-goog



