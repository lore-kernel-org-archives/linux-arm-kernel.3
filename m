Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C55C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 15:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkaC0JDmp9LDpZ4draWjYw8kfSk/HVwQq5Eku/l4nTM=; b=jTADWINDVSmxnpEeV2dILfLyPx
	x9oEHcS1if4jfY7N5nX8bxS8daWpjfyG5DoTAPJjM20sJ9iqBgfweWHaxqlcmWkye5rFjHUH7583u
	HAx+qwjVoyok7doOJZVNsYdHNGJKYg8ycm9DIxlrGSmny/oyOMVFs1+TpoGP8G0T8nZFEGq9zLXG4
	Bjv/W7ntkhsbyaTUwmW8hTXshLQwzQV5K0i/hRUoHC/M4cJ7aH8cFxNjxNrbQrYabzDYJPGrmPDKT
	zDiOANju5n0kJ1FAGkCbDFRe8HZLyArDFISpkr37XC3SjGUeUN1E1/8ldYnZa4k4fTcfBUdalA30Z
	mp0QJNPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3iC-00000006hDw-0OcP;
	Thu, 06 Feb 2025 15:22:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3gp-00000006h9Q-1cAZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:21:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B4A0EA43998;
	Thu,  6 Feb 2025 15:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAE2C4CEDD;
	Thu,  6 Feb 2025 15:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738855274;
	bh=FA5r9vVNn5Za/abXLyc0dZQCbgu8AwK0WPUB657F/R0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dtvx5bfG+YzBIuNgI8MutaU6u4MEd+a5+k0FDYQPlfyJjS/w8VfJWz/2rDBwnmhHC
	 GTOSIQgxMTddh1inJiPR9eaU10ug3jfaiyk90/Z95UOc5kty8cnBhHAXNVXPCA1yNV
	 BePhIjh0pabLNtOMr3NFUcDzG+qEfxk2Oxn6W16FCF1T/HNY4IfGVr3CzuCgTot6pT
	 5zRX+aogXO7Y9f0OkYxgnSzKRzEaggryQEKA+qhlmJbgbRxNhL965qeh9SWLix+inV
	 lRyOS2A1bHVUr8p9/Ri3QfixSve/FTtoy7Ovfg0EYgdOnBhkFLPYxGLAA0RCPgKdac
	 bhS9eyD6kp+Ug==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tg3gm-001Axu-0W;
	Thu, 06 Feb 2025 15:21:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Alexander Potapenko <glider@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 3/3] KVM: arm64: vgic: Gracefully handle resetting an unallocated interrupt
Date: Thu,  6 Feb 2025 15:21:00 +0000
Message-Id: <20250206152100.1107909-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250206152100.1107909-1-maz@kernel.org>
References: <20250206152100.1107909-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, glider@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_072115_491243_4A55F229 
X-CRM114-Status: GOOD (  10.89  )
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

Playing with racing vcpu reset and vgic teardown makes it relatively
easy to trigger a case where, by the time we try to reset a mapped
interrupt such as a timer's, the vgic is gone and there is no
interrupt to play with.

Check for NULL upfront to avoid further embarassement.

Reported-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index f454cef59e24b..2ea6d1d1d3091 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -542,6 +542,9 @@ void kvm_vgic_reset_mapped_irq(struct kvm_vcpu *vcpu, u32 vintid)
 	struct vgic_irq *irq = vgic_get_vcpu_irq(vcpu, vintid);
 	unsigned long flags;
 
+	if (!irq)
+		return;
+
 	if (!irq->hw)
 		goto out;
 
-- 
2.39.2


