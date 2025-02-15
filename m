Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA148C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 17:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fG9eNLAZJUZTuIvF0w5SB78GN1GvreEw429gv6gjbOU=; b=Y7UQgUQDFd+NUCtVTqE0zRyVCS
	j+F4aP9c33IGetqzgmXn8V4zgdH+eCauCf7faPgJK80mhAafAa9ngj1VwSkTV+JO7L+LTULOPAzxA
	FCaBpJbrSO2HACm5HN8ExkpzgfsehmOUIBb/74BxvWxm9sWVsE0d8Aju+NozwAZGmKhZ0+EFhikZe
	MOiacLqOIiyX28iOo/rDgXY60Rv7mKp4cnh11z2Rf8gEr2oOW5zGLScuPLdFtF4+wmhYybz2kxo7B
	50g6ifpxASxzgBuuVL9ssQHyqZHwEqyMK/gjhpk/QvHSaMRKPwXGTriWtyVeDaVcoxqNwA3pRSCXi
	Idq35pcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjMQ0-00000000XS7-1Bgq;
	Sat, 15 Feb 2025 17:57:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjM7W-00000000Us0-0tVN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 17:38:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ABCECA40765;
	Sat, 15 Feb 2025 17:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A029AC4CEE9;
	Sat, 15 Feb 2025 17:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739641104;
	bh=XrR6EufsQEHc3su339NPCgvj8egd8HG9nLlDbIZ7ZzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CYYw7Lp/tf67yV7SEf83U0rIspum+TG0z1f4OhgFLMZ6wUcvVW1hBu38dL++/0LE9
	 HRLyNZam6lqIL1bBNq39v8tDuScFrdzOl/bz3/3onca9CPEYyDvDKkxvEYNBQa7jf6
	 hd8DJ+WOF7clwPxF3oitOITZhL3TvdtnkvEMPXmoyDZtQPbGicP0rA/L5HuyRz9Qpv
	 WskQ/FHaOH2baw65NqwycoaueeHxttg9gtk3GKMM2cu1kPhL3trQm71P6dMeV1gBFr
	 6hXhMD4Se0mBA2CNSwC0By36J2jr9OfDvU+2oUxMlmsNZyfU1K9nmE4zT2W4p533Mt
	 Tx0ER+w01i6Uw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjM7T-004Pqp-0P;
	Sat, 15 Feb 2025 17:38:23 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 14/14] KVM: arm64: Document NV caps and vcpu flags
Date: Sat, 15 Feb 2025 17:38:16 +0000
Message-Id: <20250215173816.3767330-15-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250215173816.3767330-1-maz@kernel.org>
References: <20250215173816.3767330-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_093826_331045_7CA3CB37 
X-CRM114-Status: GOOD (  10.95  )
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

Describe the two new vcpu flags that control NV, together with
the capabilities that advertise them.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 Documentation/virt/kvm/api.rst | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 2b52eb77e29cb..2d7b516ae408d 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -3456,7 +3456,8 @@ The initial values are defined as:
 	- FPSIMD/NEON registers: set to 0
 	- SVE registers: set to 0
 	- System registers: Reset to their architecturally defined
-	  values as for a warm reset to EL1 (resp. SVC)
+	  values as for a warm reset to EL1 (resp. SVC) or EL2 (in the
+	  case of EL2 being enabled).
 
 Note that because some registers reflect machine topology, all vcpus
 should be created before this ioctl is invoked.
@@ -3523,6 +3524,17 @@ Possible features:
 	      - the KVM_REG_ARM64_SVE_VLS pseudo-register is immutable, and can
 	        no longer be written using KVM_SET_ONE_REG.
 
+	- KVM_ARM_VCPU_HAS_EL2: Enable Nested Virtualisation support,
+	  booting the guest from EL2 instead of EL1.
+	  Depends on KVM_CAP_ARM_EL2.
+	  The VM is running with HCR_EL2.E2H being RES1 (VHE) unless
+	  KVM_ARM_VCPU_HAS_EL2_E2H0 is also set.
+
+	- KVM_ARM_VCPU_HAS_EL2_E2H0: Restrict Nested Virtualisation
+	  support to HCR_EL2.E2H being RES0 (non-VHE).
+	  Depends on KVM_CAP_ARM_EL2_E2H0.
+	  KVM_ARM_VCPU_HAS_EL2 must also be set.
+
 4.83 KVM_ARM_PREFERRED_TARGET
 -----------------------------
 
-- 
2.39.2


