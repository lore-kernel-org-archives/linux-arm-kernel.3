Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62947CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vATAefFncjVhqyGhRqlwugSahVgGlHw5Wlc2XkFchc=; b=sAlk58fASfO9iCih1wQNh7BllC
	Z4rk37yUxrBHvXn8eCcWk1UUlU0X6JRYpiEVuqDEnXVFZ6g1p9qGs2NoU+L4RSFknLeQ7EVc8I/Cp
	nVjc86JQkOZxg0V83DiTWBY1rf8HzEPTPS1KZx6D5JEazipHy2Y2DDFwAAWxrV7U0TITSgwMxH1+Q
	haKi3WPWsd5WMyNGn9OqPu9RuLRxrLI+oGfl7Wasrry9rnJChxLdLOCpkcmbLKm43I04bf3rpE7m+
	3FIK903hrBuVAOIhB+BcGAxT+ldvuoO0+pJaI8KR8IjMWg1LR8mueC2vQdU73ujDGTpAf/RVU0xCJ
	QEJtw/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GNc-00000002uH7-00iP;
	Mon, 29 Sep 2025 16:05:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GNA-00000002twI-1VmW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:05:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FEB748BC0;
	Mon, 29 Sep 2025 16:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4383CC4CEF7;
	Mon, 29 Sep 2025 16:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759161907;
	bh=sxh21aUMK0goU7+ee1G2UCf1HO4Rfb84evxHrAlsjD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BK2ikC9NkCAgqKRbqpMLgH7fXcG3NXQ7TbMMs8Ja9lwk0tDI277lW7yasOWyl80c6
	 B0r3Gb+HxTj7tigapfVLGaisgJTg59FNtdiavwowynAY7YOPi4tnUaOegFzG9Ucyk8
	 EETCPgirsp2mGPgQqultjo0twyTJbDdLalCiFxJLYVptOPPuMzn1l5BcZO+r51Ajo3
	 XcUfKHSDyq/lCA4sneNvVbaXpRoqrEteGWl11Y6R1EuUjU4558QkgTiUuMtF7vXyG9
	 GsUqWkeUmXmiLySRH9NXoSOV94NJhwZFqCgEyZkLcuGj5altqQCL7s+XpItW+T6csT
	 vCK0HqwbwLgpg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v3GN7-0000000AHqo-1oaN;
	Mon, 29 Sep 2025 16:05:05 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 09/13] KVM: arm64: Fix WFxT handling of nested virt
Date: Mon, 29 Sep 2025 17:04:53 +0100
Message-ID: <20250929160458.3351788-10-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250929160458.3351788-1-maz@kernel.org>
References: <20250929160458.3351788-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_090508_424081_667413D8 
X-CRM114-Status: GOOD (  13.58  )
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

The spec for WFxT indicates that the parameter to the WFxT instruction
is relative to the reading of CNTVCT_EL0. This means that the implementation
needs to take the execution context into account, as CNTVOFF_EL2
does not always affect readings of CNTVCT_EL0 (such as when HCR_EL2.E2H
is 1 and that we're in host context).

This also rids us of the last instance of KVM_REG_ARM_TIMER_CNT
outside of the userspace interaction code.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/handle_exit.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index d449e15680e46..415f91ee8bcbf 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -147,7 +147,12 @@ static int kvm_handle_wfx(struct kvm_vcpu *vcpu)
 		if (esr & ESR_ELx_WFx_ISS_RV) {
 			u64 val, now;
 
-			now = kvm_arm_timer_get_reg(vcpu, KVM_REG_ARM_TIMER_CNT);
+			now = kvm_phys_timer_read();
+			if (is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu))
+				now -= timer_get_offset(vcpu_hvtimer(vcpu));
+			else
+				now -= timer_get_offset(vcpu_vtimer(vcpu));
+
 			val = vcpu_get_reg(vcpu, kvm_vcpu_sys_get_rt(vcpu));
 
 			if (now >= val)
-- 
2.47.3


