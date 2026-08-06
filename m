Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7245FC5620A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfpLkO0z7XT9QDSQsybvalFkn5acGM788D+d/q1c9Ds=; b=1QuM6bOLBKldyVHScdiPsPDjfp
	V90GQICsQic2mlV4fe9b3Rn5lwBtvkwoNynD0JcimE+Dm0eA3LISalU14IGYEg4Jo31qYbeLliLRb
	7/SFDugV74ov57t+bQr1EWhPnfmeaYkAXoG2imwZ50BDac0TBNgnn5HjuXPGZjcf9Xc9BAPlsXTJc
	kCEH2TjHfggzcRKqoqea3mgIMeJiRFlEjCLDYpLoS2SvH6Et8uQrv2hucvOSrp8L5WGgmI1crZ/Gy
	yzR4ftc2HEBs4XqVpMvNFBNRGiIij+ukVtWwWycGOKEsuXYyEn3yok8R+oa9rujW6VXMdp677rg/x
	5UNHGEgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruxG-00000005Udf-1Pnv;
	Thu, 06 Aug 2026 10:04:02 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruxD-00000005Uaf-1QND
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:04:00 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786010636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LfpLkO0z7XT9QDSQsybvalFkn5acGM788D+d/q1c9Ds=;
	b=T++QlOkzH/ZJ163nv2/cuMVhISi9opZp+Cyw+QHMDZ+LoXjRuJieqOrFU8bRfETOodbMCx
	eQ7gSRsS8CGdgAYgkKTsCASbsF55JhY71OjNR11vJpKzZbuUR37IYX9G9+dL5JcrgktzC2
	acSMHDwTvZdEUNb9xYMwNO3g32rGoxE=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Subject: [PATCH v1 4/4] KVM: arm64: Fix stale VGICv3 comments in the nVHE world switch
Date: Thu,  6 Aug 2026 11:02:56 +0100
Message-Id: <20260806100256.371164-5-fuad.tabba@linux.dev>
In-Reply-To: <20260806100256.371164-1-fuad.tabba@linux.dev>
References: <20260806100256.371164-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_030359_525062_83F6365B 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

__hyp_vgic_save_state() and __hyp_vgic_restore_state() handle GICv5 as
well as GICv3, but their comments name VGICv3 only.

No functional change intended.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/switch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 7318e3e6a5f36..6b9e20f6b31b3 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -110,7 +110,7 @@ static void __deactivate_traps(struct kvm_vcpu *vcpu)
 	write_sysreg(__kvm_hyp_host_vector, vbar_el2);
 }
 
-/* Save VGICv3 state on non-VHE systems */
+/* Save vgic state on non-VHE systems */
 static void __hyp_vgic_save_state(struct kvm_vcpu *vcpu)
 {
 	if (vgic_is_v5(kern_hyp_va(vcpu->kvm))) {
@@ -125,7 +125,7 @@ static void __hyp_vgic_save_state(struct kvm_vcpu *vcpu)
 	}
 }
 
-/* Restore VGICv3 state on non-VHE systems */
+/* Restore vgic state on non-VHE systems */
 static void __hyp_vgic_restore_state(struct kvm_vcpu *vcpu)
 {
 	if (vgic_is_v5(kern_hyp_va(vcpu->kvm))) {
-- 
2.39.5


