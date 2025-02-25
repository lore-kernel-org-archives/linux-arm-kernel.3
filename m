Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5BAC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVRk0yB65CPsto062Mwh9f3/ElnLNfocBLBdtZ4W6mU=; b=eGehu/MfyDA4bWO6ag9qPAuFcl
	KGW7zUGULWkE6Oxa0yx203J6QA7pCJP4Xz4qXa4r1++qGFc0EP11eA1zO7qqqvrBnDu6Is6x/sY0Z
	5dzGeB1Crn/BB504EbhrGOrXQvcP0sYKuAcV/wNr2Uu+KMPqSIzuIX39wCZDbkkXjCIdxElI4JLaC
	vavuE4UgUUNzk4YxQkJN9v8aKuZa1PGnWHmfBKUUlBW8bo1+jRp2vrUwqknyoXNQ7+DGynSpiD9u8
	uGY+H2V4C/vzp2k7gXCUCmwW55wCI/dUucoqfGE+vxFKHZO7SeNqIfXO9h1tQBYQJqJMR9qTEKJ1o
	HfMTJWZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzMa-00000000qEO-0jRM;
	Tue, 25 Feb 2025 18:09:00 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmykd-00000000eA8-1g8T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:29:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9049612C2;
	Tue, 25 Feb 2025 17:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72268C4CEE7;
	Tue, 25 Feb 2025 17:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740504586;
	bh=ESwX6EF3BCC2lwWOyls+2h12qkuPf4F6Nzx6z8FG6xE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TrmrLfkE3MXvktJ1qmq9aaNk2MKuMwqxqdwltXNdTiJMsL54zz3H3MoFcgS2jcy9T
	 xbJFFQrWs/b/HTSNIjUDy166HhoKaMyiSqCfEuPOVjWNA1SUBQ4xVXs8FU0rjO2ny9
	 OTkq3wttKNrLsI/l6B4ilXS9qqbs0V7mu2tVxkgrUryosYCxWF4KyQVbhs9X/DDLt9
	 yr1xF9fmiSTjmmm1XgLf30NZpmnf/UwHa5+pYJULd4LCMM8edA0CUQNZHEybs578nR
	 jlPJ+rg7tX0X+SpgY5n2TABhuKWEyhOZcN4YEyPdMMi0jy2umA58KK6pJhfKMOD07z
	 A+8UvNkh/ZWXQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tmyka-007rKs-Gk;
	Tue, 25 Feb 2025 17:29:44 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v4 04/16] KVM: arm64: nv: Load timer before the GIC
Date: Tue, 25 Feb 2025 17:29:18 +0000
Message-Id: <20250225172930.1850838-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250225172930.1850838-1-maz@kernel.org>
References: <20250225172930.1850838-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

In order for vgic_v3_load_nested to be able to observe which timer
interrupts have the HW bit set for the current context, the timers
must have been loaded in the new mode and the right timer mapped
to their corresponding HW IRQs.

At the moment, we load the GIC first, meaning that timer interrupts
injected to an L2 guest will never have the HW bit set (we see the
old configuration).

Swapping the two loads solves this particular problem.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index b8e55a441282f..f678a77438cc0 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -576,8 +576,8 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 nommu:
 	vcpu->cpu = cpu;
 
-	kvm_vgic_load(vcpu);
 	kvm_timer_vcpu_load(vcpu);
+	kvm_vgic_load(vcpu);
 	kvm_vcpu_load_debug(vcpu);
 	if (has_vhe())
 		kvm_vcpu_load_vhe(vcpu);
-- 
2.39.2


