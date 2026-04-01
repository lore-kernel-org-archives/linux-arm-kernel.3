Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB64BD35174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szrYXJjrYyUy9A0/AuZtujeggU/Lo0bM+EfbmTb85vE=; b=t1pNIyHcYytRnOjB15OlW52zdx
	2X0QVlUyFv7c5j4OQYuqPiKheCUUs6mlgYlk7iojFIpya8dJUEiu+VOtUdjAFbO3mQHcS6KuGxl5N
	XocKCqP2F5iiypO1/l5XkwMCemL/sjNd9yV3kp26BU6l1EHQdcITyv2MNMhPKC0+miva/JGph5TCI
	7Oj59TCdYZ2EkOadO5MkuwAs5cwzCQlCDcULgEY87vWv6ksWItlpmgYu4oMHb5bRP7xNgNmlfN6Zt
	Gp7nj8bz2vR0vT87aChVou4H1Ns9qJ9DWnaInZ0e4CV70IQ55UU3bmuqmjiOTBUWGkH9r3vAWo4e+
	+oEiWX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7swE-0000000EWQz-2stu;
	Wed, 01 Apr 2026 10:36:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw6-0000000EWDK-1qxp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:36:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52DE840829;
	Wed,  1 Apr 2026 10:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34FFCC2BCB3;
	Wed,  1 Apr 2026 10:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775039793;
	bh=eXE9Q7fOTHuVMVAJDSqKZS9kp+vZ41E2oC5DvdD/1Co=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uEN9gI+okR178H3w2TuvDBRBg6ye8PeUrLj7xU6vkeazPZOHiFIk4pQn95/KyDIdS
	 yD1SgDo3Kq/Kd1MxVjb49rEIudEaDZPVnoacDsWLFmI8eH6DecK5wODmyR47FOVYeu
	 cxPLPfayqKXcnxilTVrA/MP0Prf7cTwKgwqaiEw/G5GMrZufy3b0vPQjKb2qtRz9Ui
	 oDrOumdPSS9W8Pi06H/EBhhl6k8BY7vU0/BuObSnI0rV9NtIvUIBzQPZO046whrJAU
	 W4pdVXClJWbzZOotLC/n88tTCoz/8CzRBXV78H3k0RLUMFffFUY4YvAiurc7IaevNv
	 aZyDo7TTpdDpQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w7sw3-00000007oRQ-1e9E;
	Wed, 01 Apr 2026 10:36:31 +0000
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
Subject: [PATCH v2 10/16] KVM: arm64: vgic-v5: Correctly set dist->ready once initialised
Date: Wed,  1 Apr 2026 11:36:05 +0100
Message-ID: <20260401103611.357092-11-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401103611.357092-1-maz@kernel.org>
References: <20260401103611.357092-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_033634_559192_612C40AC 
X-CRM114-Status: GOOD (  12.69  )
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

Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
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


