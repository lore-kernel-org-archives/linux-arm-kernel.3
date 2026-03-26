Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7C310A88E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aa0TPbSsySUyCihvU2ChoHTAN/2zJ0oxfiWd7rP/Gw=; b=lKGqkw7Bu4S1wbsdGtABBLn++n
	gFXhIsX6Z6jg9O+9vpj9aeoYxPJxhq69EZK5n5WdYJ/0f2VVNXl7Mg3PrxSMloHzoA5Uq1Naw0033
	kX+VYArKqeoQprnRLNpEdjYvCeKw+g1Nffh3uVPaAuDcdKi4ox3AuHXpydhUQnaBhmvvyQiR03XAA
	WoeWEIKC4RZWWXnPeEEZhht704Uba/Ddbm4qm7afSV5HnzL2tGp2p7kxk6BVqOuuqO7913gBcG6ta
	lKl9szaT4e7Os2PG31oMtgyqNk0ZAf5Td1xmakorGmr3rdc9exp+rLVyeBlxuA8/t6IWe13FT7Fr0
	/3Ejavhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkS-00000005lKD-3TRW;
	Thu, 26 Mar 2026 15:35:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkG-00000005l5k-1Qit
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:35:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 342BA44713;
	Thu, 26 Mar 2026 15:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA81C2BCB1;
	Thu, 26 Mar 2026 15:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539338;
	bh=fro4HwPkgBXwJWfWk9t+zbkprwm2rp0aKeHmCvbxKAk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sC4D9CgUhu9snrPZjupBAazZ5AVJGRj4+MbTkpfh3KwtF0XzWazZbF0qJIJRCcnxm
	 rTIw8+7OSqrBoDIg1GySkUdx6MXmab5Y/XKkBQk4NmR8CpbZSfEnTzgYCHZdDgvPwz
	 qqGcamDJOVCHirzxXlZk7TKQXhIgIk2YS0BsTIobMHMTTzG/Yckn/sUvQTAx+q2/gU
	 JXeaBSGDBXawM1g/WtXAKg8zvo5rmQMBsw6P2vYceZ7FSYHDRhNGkQBjR08h+LcZDX
	 Ftfl/X0wwkZsfBxcFgCbCrbUxEsbrnsBaJi3f8BT68dbTf7Aln/OK52xp61sgv1EVg
	 8zdP1MPSYe2tg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w5mkC-000000060II-1e9D;
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
Subject: [PATCH 10/15] KVM: arm64: vgic-v5: Correctly set dist->ready once initialised
Date: Thu, 26 Mar 2026 15:35:25 +0000
Message-ID: <20260326153530.3981879-11-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260326_083540_575032_A5BF8CA7 
X-CRM114-Status: GOOD (  11.47  )
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

kvm_vgic_map_resources() targetting a v5 model results in vgic->dist_ready
never being set. This doesn't result in anything really bad, only
some more heavy locking as we go and re-init something for no good reason.

Rejig the code to correctly set the ready flag in all non-failing
cases.

Fixes: f4d37c7c35769 ("KVM: arm64: gic-v5: Create and initialise vgic_v5")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-init.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index fd872079f2a24..ecb0aea180327 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -657,16 +657,20 @@ int kvm_vgic_map_resources(struct kvm *kvm)
 		needs_dist = false;
 	}
 
-	if (ret || !needs_dist)
+	if (ret)
 		goto out;
 
-	dist_base = dist->vgic_dist_base;
-	mutex_unlock(&kvm->arch.config_lock);
+	if (needs_dist) {
+		dist_base = dist->vgic_dist_base;
+		mutex_unlock(&kvm->arch.config_lock);
 
-	ret = vgic_register_dist_iodev(kvm, dist_base, type);
-	if (ret) {
-		kvm_err("Unable to register VGIC dist MMIO regions\n");
-		goto out_slots;
+		ret = vgic_register_dist_iodev(kvm, dist_base, type);
+		if (ret) {
+			kvm_err("Unable to register VGIC dist MMIO regions\n");
+			goto out_slots;
+		}
+	} else {
+		mutex_unlock(&kvm->arch.config_lock);
 	}
 
 	smp_store_release(&dist->ready, true);
-- 
2.47.3


