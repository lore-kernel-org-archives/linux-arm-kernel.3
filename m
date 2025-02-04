Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCDDC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IjWmY71vhhvOmpr24LVXSKNDg69joTog2aZSEy45Xc=; b=W5M9ObF/sVnaCz6VFP4LiZ/trC
	seFkKk577GoCpuMGm1E3viQCYT7XkuWn1L2fEj1nFHd++jk9DXg1B7nPMmsvtgM1ixpdG697WNvs6
	1K8sntUzaf8CG50UJVwEg30xuQ8NJBBY7vZ0v9jIMmMiwXdBzaVs4j/hxdhHskqRIeID7qJbUX/BA
	0z/us00wehJ3KyJCg/AI/Uc2ZiQdljRKQcyyluwRjuMxHUR8vCUmeOeTg3wpsB+PzUlzKHjDsPluZ
	bLHHdtMaLQJv5o6m6HM4gtSmJJJXszJNmHggjkvgl5U25SZE81yBqEPM1RxB3nN/ljdAc4T5U3wI2
	5fMxyW4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGjj-00000000Dav-3MFu;
	Tue, 04 Feb 2025 11:04:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGfp-00000000D9L-2nGJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 11:00:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0B455C624E;
	Tue,  4 Feb 2025 11:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF1AC4CEE4;
	Tue,  4 Feb 2025 11:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738666856;
	bh=zUnsuDJ9SEtgVgV4nZafL+jOte8yEfS+p4rbkLAt0yE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BXqJEl5FE86KtnSgh6caDW6MvW+Dkj8aqvM0MH72GVd/g2sG3AXgAB7D6bXxPsgSM
	 I2fOukfFjK+NeZ2dMZawZ4eiMWdvZ06OPT7nTTQRC41M3+2UtxAR4iGQTuEekRLA4Q
	 oD48RW7FnAvA+E0L2BGvAXPQWoYZ3Oen8/eZQGB0bG2enbVV7WbxUoQqUCTW0JFqDV
	 vu9xeYJK9WN2uZCyipo7MVV25Zx9bhBIXsR4Y+SmcLp9DZrpMYLe17Xam1fDlQ4Js3
	 XbjoUTxTjak9bWl4BpSY5kf4cezCzjK2+dumNP2tWh4gFmQiFfe3IAUT84sPWaHjcT
	 RNMrOKspiTUxQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tfGfm-000OVe-7Y;
	Tue, 04 Feb 2025 11:00:54 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Dmytro Terletskyi <Dmytro_Terletskyi@epam.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] KVM: arm64: timer: Always evaluate the need for a soft timer
Date: Tue,  4 Feb 2025 11:00:48 +0000
Message-Id: <20250204110050.150560-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250204110050.150560-1-maz@kernel.org>
References: <20250204110050.150560-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, r09922117@csie.ntu.edu.tw, Volodymyr_Babchuk@epam.com, Dmytro_Terletskyi@epam.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_030057_747493_39F4041D 
X-CRM114-Status: GOOD (  15.65  )
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

When updating the interrupt state for an emulated timer, we return
early and skip the setup of a soft timer that runs in parallel
with the guest.

While this is OK if we have set the interrupt pending, it is pretty
wrong if the guest moved CVAL into the future.  In that case,
no timer is armed and the guest can wait for a very long time
(it will take a full put/load cycle for the situation to resolve).

This is specially visible with EDK2 running at EL2, but still
using the EL1 virtual timer, which in that case is fully emulated.
Any key-press takes ages to be captured, as there is no UART
interrupt and EDK2 relies on polling from a timer...

The fix is simply to drop the early return. If the timer interrupt
is pending, we will still return early, and otherwise arm the soft
timer.

Fixes: 4d74ecfa6458b ("KVM: arm64: Don't arm a hrtimer for an already pending timer")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/arch_timer.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index d3d243366536c..035e43f5d4f9a 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -471,10 +471,8 @@ static void timer_emulate(struct arch_timer_context *ctx)
 
 	trace_kvm_timer_emulate(ctx, should_fire);
 
-	if (should_fire != ctx->irq.level) {
+	if (should_fire != ctx->irq.level)
 		kvm_timer_update_irq(ctx->vcpu, should_fire, ctx);
-		return;
-	}
 
 	kvm_timer_update_status(ctx, should_fire);
 
-- 
2.39.2


