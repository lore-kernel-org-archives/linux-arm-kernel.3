Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BA5F43699
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 12:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sFF6mcnsdlClJfMzyYFul3iRT90Rsqxmeolnoc7CqU=; b=EApYXlojIc4kr15nxzN3d1fDsr
	LZOtc1F/opM7yHfrOqnr4WFvaAHTw3vhXtTEJSL0TtneDkFo339QZ2e+sJA/Q5w19KvDkCqNLAoMd
	m4i11Xk8vULahqKi+gW8lhB3+1Xx344Lgsfjr/NgACZ+kBw1ZAy2RTBo2LC1c0p6wNBlk0QtPOJ9f
	EGdbslaB4X7dQCJEZv7lZ0aKZjszTrLCl42N+8SE4bBM3y1J7E30Sfq1Na5Q/qLaxfgOlSbVaOA48
	VdFYj87kSl55eghtAuqfQ3st2IWYAikjXLY0pywcOArr2Rnu9KcEwfescjLJTMr76nkm8VSDXYk2p
	jA1NyvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiaU-000000043Ar-0TYx;
	Fri, 17 Apr 2026 12:46:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiaS-0000000439q-1EWu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 12:46:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A67AB6013A;
	Fri, 17 Apr 2026 12:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599D5C19425;
	Fri, 17 Apr 2026 12:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776429979;
	bh=ydJDYUjgybLlO9ISnWIIvpjgy9hzClj2miPHNIqLbo8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VcEN800/Y+pym/j0vQtweSLITtYEYNtGwcA7AQYcQ+cviUOlNOsjQFtGfUV8fs4Bf
	 y34BkdlUWrFFKEx2aJQ50Q+pu8MiLibP9RBoWnzlwQyCVy9hUMvCR28zsE1a0Veh+T
	 8pvl1dVW1LN2SFrdtZIq+ZKevrh8xa2KJbHM/lE6hQX94XVwXAok6BAJPcltpV9y5Q
	 vFyIP5+n5ztsDw7wc5d2cHI2kCNjXbq5Dz1zO0Y2gEO9hnw0iFCmHNKiWOVh20m+TY
	 sb9c5gbNANDXtsgZImI+L7gxRtTQCnZbZs+67PY7sQRSkDbcczKOfsSHSdArjBHfyZ
	 o7q5ZxdSfBbrw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wDiaP-0000000CRo5-1V07;
	Fri, 17 Apr 2026 12:46:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Deepanshu Kartikey <kartikey406@gmail.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 4/4] KVM: arm64: vgic-v2: Don't init the vgic on in-kernel interrupt injection
Date: Fri, 17 Apr 2026 13:46:12 +0100
Message-ID: <20260417124612.2770268-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260417124612.2770268-1-maz@kernel.org>
References: <20260417124612.2770268-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kartikey406@gmail.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

We how have the lazy init on three paths:

- on first run of a vcpu
- on first injection of an interrupt from userspace
- on first injection of an interrupt from kernel space

Given that we recompute the state of each in-kernel interrupt
every time we are about to enter the guest, we can drop the lazy
init from the kernel injection path.

This solves a bunch of issues related to vgic_lazy_init() being called
in non-preemptible context.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 1e9fe8764584d..9e29f03d3463c 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -534,11 +534,9 @@ int kvm_vgic_inject_irq(struct kvm *kvm, struct kvm_vcpu *vcpu,
 {
 	struct vgic_irq *irq;
 	unsigned long flags;
-	int ret;
 
-	ret = vgic_lazy_init(kvm);
-	if (ret)
-		return ret;
+	if (unlikely(!vgic_initialized(kvm)))
+		return 0;
 
 	if (!vcpu && irq_is_private(kvm, intid))
 		return -EINVAL;
-- 
2.47.3


