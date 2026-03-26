Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD1C10A88DF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQKMrab/lrM5EC897F4cv12T3UfzLmUCZpQbSKZ7Mkc=; b=HAK8NIMkbtRG74GwalhrO+TNF3
	0oEDDGPrMzylvipoaej2unk+B/hK8GjJjB7Wj/1n7Urhtf7J7PaQ2f4O1j2zbXkbTssaefZYeW2VP
	lgXbtoznegscOSa2tRWXcPgsvU8jkHP6g6fH2NDKF877osLh0gWSALWnWMPpUDDpfoB44Nn2wV3dQ
	RxkW1yoHZzc+kHAPsyLYtKHUAnOr6I4EkkI9FIK/VNFjr14pAtBIqAefLWPhoIaIa1r66iPFgYX/r
	3HH1WfIJ7GU4WtHGGJmwK/vestWU5wmLu8sEOOeST103LQlZhnEohYT7tyPoUb7hcxum2fkCqVibq
	Asu4wAUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkP-00000005lEb-3kUR;
	Thu, 26 Mar 2026 15:35:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkF-00000005l4x-2Crm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:35:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0379C44707;
	Thu, 26 Mar 2026 15:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D153FC19424;
	Thu, 26 Mar 2026 15:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539337;
	bh=cnv6DmntcMXagmxMgyBXvT6QXRuTNqmKUclId5YjCv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A2MMWq4VrW2KplKrXpd2DAHmL5+mAbUgm5NsC2O8y4tHml8H15wMjWwKQY2dNIdd8
	 AMSNsGWyZr3t0Rhx50arn9aBG7MA5R2Z71WMH8erNdQQ+oldOjpefZJuZda8swrB1p
	 3sVYzBb6XUPDwF3qEZRY9suh6XweNPlbNfMspZBsIj6lUjJE22YU9BPLPljBdeSsN1
	 /LTu2a8T3gNQgM7Hgp135O5KT9ETMoqgZ7zqFRn88J65dztLnrkCTJ4PizO9gecgHd
	 wHAW6yWvxf8YXBMPGU/jY1S1z0WZoKDGwBSsPfpWms5cwuRgywnCcQGu22yZjszsTY
	 yhdqKoh70x4Ig==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w5mkB-000000060II-3zaq;
	Thu, 26 Mar 2026 15:35:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 08/15] KVM: arm64: vgic-v5: Cast vgic_apr to u32 to avoid undefined behaviours
Date: Thu, 26 Mar 2026 15:35:23 +0000
Message-ID: <20260326153530.3981879-9-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326153530.3981879-1-maz@kernel.org>
References: <20260326153530.3981879-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_083539_604259_D5F06BF5 
X-CRM114-Status: GOOD (  14.00  )
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

Passing a u64 to __builtin_ctz() is odd, and requires some digging to
figure out why this construct is indeed safe as long as the HW is
correct.

But it is much easier to make it clear to the compiler by casting
the u64 into an intermediate u32, and be done with the UD.

Fixes: 933e5288fa971 ("KVM: arm64: gic-v5: Check for pending PPIs")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v5.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 422741c86c6a8..0f269321ece4b 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -212,7 +212,7 @@ int vgic_v5_finalize_ppi_state(struct kvm *kvm)
 static u32 vgic_v5_get_effective_priority_mask(struct kvm_vcpu *vcpu)
 {
 	struct vgic_v5_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v5;
-	u32 highest_ap, priority_mask;
+	u32 highest_ap, priority_mask, apr;
 
 	/*
 	 * If the guest's CPU has not opted to receive interrupts, then the
@@ -227,7 +227,8 @@ static u32 vgic_v5_get_effective_priority_mask(struct kvm_vcpu *vcpu)
 	 * priority. Explicitly use the 32-bit version here as we have 32
 	 * priorities. 32 then means that there are no active priorities.
 	 */
-	highest_ap = cpu_if->vgic_apr ? __builtin_ctz(cpu_if->vgic_apr) : 32;
+	apr = cpu_if->vgic_apr;
+	highest_ap = apr ? __builtin_ctz(apr) : 32;
 
 	/*
 	 * An interrupt is of sufficient priority if it is equal to or
-- 
2.47.3


