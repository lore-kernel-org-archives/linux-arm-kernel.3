Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664C2CF885C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 13:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOPYVuiX+eC6v+YxbpxtG/x/4/eZk8oLc2kV8kLnBKI=; b=4NMflbXFzRXE3Jy5F33ldcbmi7
	O3eWrZYzFYXNrt8+5w+dprbGGM7PnTFIgIfB0Sdu8bq3OJK4aGFYMqqxZpxtaiIip5PTmc7kNgjZR
	ftPwVXWNN96E3hH+LuPOBX0aeVaeZ3HvJbtR0cJaIWIuhO5LkJa6Ng+5F2cCdrcWb7FnIere1oQZZ
	B/8OEeWr3vlSJDj8kPDcb1D7GAqytbXEPpaZPkOi+V+6QZLovtYTYXp2+A+Jz7aVWgIpgjzVuQeEp
	VPgmJ+oSR2Tebf9yo1lOCHjYKFafNM7Vcs52Rj1iP/D5vfitXrRgR4KG5HvQypYaUwYM9g/2o1phk
	x8vLPnaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4m0-00000006jYp-0jnN;
	Thu, 20 Nov 2025 13:32:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4lp-00000006jUK-1Qgu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 13:32:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60A83443CF;
	Thu, 20 Nov 2025 13:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA0EC16AAE;
	Thu, 20 Nov 2025 13:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763645540;
	bh=b2L49jfqGv4rJQF7Nj77KE4YqTNOsdlKLv3vMtsROlg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p8BSLByVUD3MU8KJdONAL/52a2W5AKt8Fe3bxtJBNoUX8WZbH3LbTeiT5uw/+nYwd
	 IhLc5S44IdJwpVDSuPiil+u8R3wqIvLwGZZrEFGgfTz6jO7kbS3co9gxFa8aPIOUAz
	 dRbULX72ahYLqSYjEKzipM8E8CozhwG8oY4tcrNZrhYEZcENjgvjqQQwj17C+wSHGk
	 skD5E+Af0s2Hf8Yq+2YRwFpmiMS5NFeMz5hz3Gi7OkMqSQz0K0vNHQqQ3Fpkq6WzjO
	 VaZO+ZwmKrdGnUbIYMTFoanIZaK8hvgIcK2P4T+JUitE0VpQ8m6CDOtErZsfgSMoy9
	 KwXR5BR5lzOkQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM4lm-00000006tUG-0kH8;
	Thu, 20 Nov 2025 13:32:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 2/5] KVM: arm64: Force trap of GMID_EL1 when the guest doesn't have MTE
Date: Thu, 20 Nov 2025 13:31:59 +0000
Message-ID: <20251120133202.2037803-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120133202.2037803-1-maz@kernel.org>
References: <20251120133202.2037803-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_053221_398291_AB05179C 
X-CRM114-Status: GOOD (  10.25  )
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

If our host has MTE, but the guest doesn't, make sure we set HCR_EL2.TID5
to force GMID_EL1 being trapped.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 84e6f04220589..40f32b017f107 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5558,6 +5558,8 @@ static void vcpu_set_hcr(struct kvm_vcpu *vcpu)
 
 	if (kvm_has_mte(vcpu->kvm))
 		vcpu->arch.hcr_el2 |= HCR_ATA;
+	else if (id_aa64pfr1_mte(read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1)))
+		vcpu->arch.hcr_el2 |= HCR_TID5;
 
 	/*
 	 * In the absence of FGT, we cannot independently trap TLBI
-- 
2.47.3


