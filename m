Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4942DC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQfw1dQ4BpbkrA0hAQgHowNioCmtW9KgFDiEInCb4zo=; b=Oh78fethKSIFublTDgjjt5OweZ
	BYnsYvNH5yd7hZd6t8BSHlIPHoxh+rHxEoC5i2RjiLRAdSB6jxa/nLXF8Jz5ajLlylfNnCVmQ6iT/
	tzTLGhtHuuFoRiRdHAJ/59bA0N/xAnVFFvUD52TuS+zzvlPbObE8bdqQEc45nqkCUy3Olu+AFXXWh
	4ihWw7254dwZWUgOy7JmtOtU7QkkOAr/6MwR2D6xVJMUbXQ2b571PrNjUA2ukSJj3lUY5OYrsVxnu
	omdd5Iz9C+sbtn1dMqft9lLm/+sukQ+ZHWXxIL2rSkNfvEl49MmvV37rabtRArWUxC2x8tfpxpXdU
	8fdDMQWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl77E-00000001BuJ-40yb;
	Thu, 20 Feb 2025 14:01:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6va-000000018kv-157b
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Feb 2025 13:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pQfw1dQ4BpbkrA0hAQgHowNioCmtW9KgFDiEInCb4zo=; b=qVKXD5wC0v6V9Ef3NvPrgSn/2P
	Xbc/ta9RJ6d1RD3zufUvzItHii2EFfGvt8wU+LqL74yZ7AVgn6JDl9NsF3o5LoK/9Yw0V1M/F1zuK
	oy6T/CGYQnYKI4NJkLWz3FTezw83E9typKJu/vNz77Jcl1Qh/HmJaIJEmKC/5bSIiodvTtN0dongC
	PTDHbUGN+T/KpEDCVGqvx2Y6E0JrRb3184/JSIiMQcxMuVoOlmLLwfZX1YwWaIazrPqG8T4qZ0D2I
	N0YWTB2RfWQz83/AHNxhvbo1F4daXETCcFcK8I047OPk72jCojRpH3eHvDkr9CHUKwxpS2gxb85Y2
	ovcBl8VQ==;
Received: from tor.source.kernel.org ([172.105.4.254])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6vX-00000002RnN-1Qk4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 13:49:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AEACC6144E;
	Thu, 20 Feb 2025 13:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261DDC4CED1;
	Thu, 20 Feb 2025 13:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740059356;
	bh=ckzaA4fe/De/c/C7LV9KPu2PIvf0ztKKIvtA/g3YrnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B6V7mlwPR//Kznj54B6u0iavm0DW0OzTlBEdfOLJvsE+XWE5Dbf/FYy755Zsbti5H
	 RlYbu8gnNeX1otzX/y0LTyHAD4Y2X6ckwPIg3i+ySOLVtOwrJg/DPQZSajf2jGiVxs
	 2zTIRFzC24SATnblSH/uW1XuMKMcNiXGc5A7Uvsg9J6kWL0G8NfAH+Cs6HUDv/QW6q
	 dV7ZMGbBxdLXGzFblKzLkJHU6p04TxKEOpI/LZmicNFqfGzQF/Bnf3I/Hk/36avOOp
	 GE3CjEOAWERxtmJVPJ/e7qMskQ4cZruHSHlq+MiSA/iH0Ugn+3EN7FhoSpK8Ki597w
	 UyXy99cyvhfZQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tl6vS-006DXp-BF;
	Thu, 20 Feb 2025 13:49:14 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	gankulkarni@os.amperecomputing.com
Subject: [PATCH v2 14/14] KVM: arm64: Document NV caps and vcpu flags
Date: Thu, 20 Feb 2025 13:49:07 +0000
Message-Id: <20250220134907.554085-15-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250220134907.554085-1-maz@kernel.org>
References: <20250220134907.554085-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_134919_726850_E0FFE216 
X-CRM114-Status: GOOD (  11.37  )
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

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
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


