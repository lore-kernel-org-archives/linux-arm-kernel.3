Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAF2C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 22:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D18ouy4AsTB4IUhvK2F1WIxaRZzVY4gKkYirh/cKJ7w=; b=Vj53g4dgRSrxYBsodRS2bTN/cF
	I7X1iaZsxtMWn278cmmg2p+M/Tmmvqgmrnx4V2wcbsPek1ok3dbVsup2S88QG/6Wd7yUDHQ+lw6a1
	qmg+tz6frW+26pol2ubbHaVSbocVpd5zsjoEqtLagyEJ+66WahdBaG6Kssn66zdm9TYcqzXQuelfP
	vOmbxNELrmrqGIfkaPoPzZrwwCLL6emRLknc1YUVCfYC+yXUtbJNJER+VURU+4jUfOXbhbf9omdC6
	Vwk4uBv4OaFERUwWIXYalgU7aawKpA1s8z1rRmsbteJPqnhoKLmJPe7V3f9AEOzRol2eelJGNR3an
	9Lxn3mrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjEm-00000006lK9-423c;
	Tue, 01 Jul 2025 22:14:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWj7o-00000006k1d-2FxF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 22:06:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B47D46831;
	Tue,  1 Jul 2025 22:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6688AC4CEF3;
	Tue,  1 Jul 2025 22:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751407607;
	bh=coAKO9TLhK8MTIgf77yLemsOevi3hPcTUAqXS91Y2b4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ou9N1VQWEpWqTJgnCNRhMvXIzHw+LyYwPmDO37rQ0wuMJYADInvEcSP7RvEEPV/Hv
	 mVqafQKIUYfwd+DySyV4CkmOKFysZAppyNhCCyaW9eDiZRCLpJhfgKSPqrYYhfYsTR
	 /7BVBY/MaGyayNxtNwxudldX73TfASMmOL6567TXwhrtYAOsfHvQWnwBMAFNdSfiKK
	 AMWosxvMUEo6svrC0FM8qEiNOB11a6HiTt2O/s+26rztwzSVpZP618MK8p9vbU4OP+
	 Om5/EQ8pF8Q+ZsvRT9xtmLam1uNeiEwWs4onSDsdnQ7/i9G80Me0aAUuQ+dF49n2B2
	 0caV0cTO9jN4A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54480C8303D;
	Tue,  1 Jul 2025 22:06:47 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Tue, 01 Jul 2025 22:06:34 +0000
Subject: [PATCH v7 1/5] KVM: arm64: Correct return value on host version
 downgrade attempt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-virtio-msg-ffa-v7-1-995afc3d385e@google.com>
References: <20250701-virtio-msg-ffa-v7-0-995afc3d385e@google.com>
In-Reply-To: <20250701-virtio-msg-ffa-v7-0-995afc3d385e@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, ahomescu@google.com, armellel@google.com, 
 arve@android.com, ayrton@google.com, qperret@google.com, 
 sebastianene@google.com, qwandor@google.com, 
 Per Larsen <perlarsen@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751407606; l=1399;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=Dl9KrxrUP4K0W3dgejUfrC3aK93wdcqeauIVLeuo9f0=;
 b=5+AIZdXIIvjP+RFQX4/gsaepjpoFaUB3whIL6rjGFeBYlFyAuLRkoOvgzhSwRQhsyy388yIym
 3qKnZpyTKsYCmPGQlh0pIPCa2Xcoa7Q6uUDbGY9Mzwew3tvIgMN7r6E
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_150648_641060_BC7ABCE8 
X-CRM114-Status: GOOD (  14.23  )
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

Once the hypervisor negotiates the FF-A version with the host, it should
remain locked-in. However, it is possible to load FF-A as a module first
supporting version 1.1 and then 1.0.

Without this patch, the FF-A 1.0 driver will use 1.0 data structures to
make calls which the hypervisor will incorrectly interpret as 1.1 data
structures. With this patch, negotiation will fail.

This patch does not change existing functionality in the case where a
FF-A 1.2 driver is loaded after a 1.1 driver; the 1.2 driver will need
to use 1.1 in order to proceed.

Acked-by: Will Deacon <will@kernel.org>
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
2.50.0.727.gbf7dc18ff4-goog



