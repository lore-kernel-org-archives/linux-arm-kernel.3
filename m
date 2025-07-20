Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638B5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 11:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jfPVzAV4s2wTSWU0z80iXYYKkj6Q7I1XMGW7UICB8vo=; b=SsCdlE3CnoEuxxyu5og1JzpbBx
	ly2Hx/2nhw97qymlqe6hn7BCeVNvxiEaMNoo1tgRohbdl9lkupAvLakpIW5XHvfHtgWS9LzAzTgnt
	iTFXEP+3TkL7MUOdvf0zVBwzgcaLIS8eMfkTCdW7aENlWIQIMl+T+wMDGXD35wLSJVASpwINp3ZBF
	fJCXkxeAECxXwvQBCLtN0i/+A3Zc34+smzAzht+kj0qa2wkwq30nHWmys1JhyyIKL8Q47kNGyzDrg
	xR51Ct0LpnIxz2iooiwx4dsmmuJzzF0iqJ8Sqns14QuEHwzmqn/vB9X2y+W9t4k+zF3uIDFZJIbtY
	h0cHtb5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udSKz-0000000FD1x-2SCI;
	Sun, 20 Jul 2025 11:36:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udSIX-0000000FCxE-00Ql
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 11:33:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D66A4369A;
	Sun, 20 Jul 2025 11:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27123C4CEE7;
	Sun, 20 Jul 2025 11:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753011220;
	bh=aNlr1NlJcqoKmB1Eu5/pybwfz6dmNDQJXqvLOcxCBrc=;
	h=From:To:Cc:Subject:Date:From;
	b=C1UPvIEQqayCRFPawjxP7cgtxJAPCCspLaUs4JXUbYzPjyz//7D9InKvv4jZ0qD64
	 E5FWar+nu7BFWAVPyDSvXPnAwRXfgqpAuv/8lJcCyRwPUxt5wlVn9EoIRu6cYDGTNW
	 lNtSjnyOwmxsR208jOlUcRF+1icMyHHuoDubsFebBT5APeYhPJVpPsnn78akoiVHWH
	 2Mp0Ci7Tc3pO7zotiHs6MGCIJHCOltzvj8oW6jhwXRrbmUQi+soETBo7ATrW3KLKsi
	 uiUGAyuE6eTGm1ExTFX5KRIVqZS6aggwPujDi6nA+aADkU0TWgw3neJBUmHhDgToUj
	 Okhd9toOBXRXw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1udSIU-00HIzF-1g;
	Sun, 20 Jul 2025 12:33:38 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	stable@vger.kernel.org
Subject: [PATCH] KVM: arm64: Filter out HCR_EL2.VSE when running in hypervisor context
Date: Sun, 20 Jul 2025 12:33:34 +0100
Message-Id: <20250720113334.218099-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_043341_062709_C797D576 
X-CRM114-Status: GOOD (  11.39  )
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

HCR_EL2.VSE is delivering a virtual SError to the guest, and does not
affect EL2 itself. However, when computing the host's HCR_EL2 value,
we take the guest's view of HCR_EL2.VSE at face value, and apply it
irrespective of the guest's exception level we are returning to.

The result is that a L1 hypervisor injecting a virtual SError to an L2
by setting its HCR_EL2.VSE to 1 results in itself getting the SError
as if it was a physical one if it traps for any reason before returning
to L2.

Fix it by filtering HCR_EL2.VSE out when entering the L1 host context.

Fixes: 04ab519bb86df ("KVM: arm64: nv: Configure HCR_EL2 for FEAT_NV2")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/hyp/vhe/switch.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 477f1580ffeaa..eddda649d9ee1 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -68,6 +68,9 @@ static u64 __compute_hcr(struct kvm_vcpu *vcpu)
 		if (!vcpu_el2_e2h_is_set(vcpu))
 			hcr |= HCR_NV1;
 
+		/* Virtual SErrors only apply to L2, not L1 */
+		guest_hcr &= ~HCR_VSE;
+
 		write_sysreg_s(vcpu->arch.ctxt.vncr_array, SYS_VNCR_EL2);
 	} else {
 		host_data_clear_flag(VCPU_IN_HYP_CONTEXT);
-- 
2.39.2


