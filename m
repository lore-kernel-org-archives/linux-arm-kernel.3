Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7660CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 21:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O/4ZDPfisq1bDU+cypy52bTEPD40rVLXrFwdCfhs680=; b=vSGRECjVzhgwd2cwjqHbCo9Pil
	AEawjlQz2+3w9Cq1HanTMkneO7AoiJVO+xnClmHmx4XPFIZfwW3+sPR37S8sO+L59XfuKTrtNOhJY
	Sdlz7PoN04sQDCD1BdZxn/lmNJrWVAGk0vrtzNtf0QARVd3J0FD61g7GR8MR7kPLVPvONgS7hf7Ak
	e4MOfMEyIQ7nL3/A6mtm/1x0AUZJoPd84mEvdGj/QFl6I2S1pG+lmxh/ZLmcKFq5yK7GhKgr+PLoZ
	2JqHUSkPglwrHwG7KBPItwfRj/s0WCGhGXhAVVi0RUKvUOVvdTniZQtnT+hE5tHL1YKMEh2KKy10z
	01BzT7Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVFQG-0000000HJuA-3hlD;
	Thu, 04 Jun 2026 21:16:17 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVFQD-0000000HJtX-3NeO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 21:16:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2bf36a6905cso8599485ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 14:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780607773; x=1781212573; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/4ZDPfisq1bDU+cypy52bTEPD40rVLXrFwdCfhs680=;
        b=jdwzwVNAYdQcm5gti6ng8eQ+Sp1+PpmB7lp8P0QjNeNIERG804wuvLJcHbtt1qd4sa
         6/i2gaLeXHb4e4UkI1a+ZSpRmxiNM2dFOUzxApzYgUUHnIBOhL9CAjCFQiRvOOfYbXgP
         fRZtSrXdOGRMsior3BTevt0GKGycWHpWY33jnyRB2RVhEPU0d5icZhlwrvz6GGl/Zr35
         fMsSmhD93PsQSwk+EqQPCV/AYQRfVJoHu4xy60j7xcM+aW2PLZbZpQ9ERqFcr6GegKod
         /lFTwvFUQO4VFk4iBHmLOpdOsVWyiXY2J7jvZAA7FIXdPweqAG9G60DTYyrMG14pzOOl
         oVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780607773; x=1781212573;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/4ZDPfisq1bDU+cypy52bTEPD40rVLXrFwdCfhs680=;
        b=k+SlPxEwtYAHSFl0Ln+spiCvwfAoGRgPlz4uXQT7uW0ZJ6M2trr0O98n0O/52B1p6P
         wt+0vejejvVqIZelhu/FvfBKXS8EnJ/Tmwq8P4uFbBMSA61udL1cjeuOgnFyR24AJ1op
         JZFa6NoSBp7oWIwWOVhKsRcV3HTTG9cLQPcmKrVWDFTJVb6r7x2h8ZxncxDQgzyMnGB3
         o+pPyfaijA8CDKpcWajAO4NGwLzOG/mMCNNUlSK6tLRdo1pQklBnNO/rAwxi4mY9/WnV
         JbgQ6ZCiOTd6KKU2dsCyaeA39QIXGqjzTWiQLltBE4qRNcfh/0HVWgWlz8lxZOeL44K+
         qbBA==
X-Gm-Message-State: AOJu0YyH01kZvxABHO4Lwd/zPyN2bifIPrWGtHaAhXeJTidxDVCLVTVA
	zywqEFN3j8MsKIXNcvDM6iMvKyCFJJOXfthV/xhrsV1DNFwLOQnNq7Gi
X-Gm-Gg: Acq92OFP9pgUdacT8Kkv9IFQBTRSrwvRbRzvKyDGeeLdDSJxesDuvIfYX2UlIlJkHRN
	lulXUHxHoovpnQTWGlvRbPXCjIlo1Sj1eZpDpRirgloLaanahEI680QDVelpzm8MnicrQhV2veb
	2RgC2rZRZDLU0kzuY5LLk+eG2R+KxgoSt6FKf3fl2HBC+x4wAz9HWuBfG2fwBtHb8rGetrJ02El
	sfkO6LjTgzfWGIlsTIp+OHwB7/kAY5O1XHGuUt7N51ObFmjMMchJQ9v/ARJj2DTDTFGO2kBGp3p
	2CCLCDOJZ7DZ+D7d2xWrgcs2hVAHgmkXH1Li8BivO4wXSRgmQfrklfQLPrY9Lx8jyrqS96Rviv2
	mHXeRqNzl6Scuex192SuBt5kgLFZQRjtN6LElwOf6R83dBMe3quL6GvCzxIJxRt9jknXVLyd7DQ
	nDET5iNkECyS51uJqcUdg1KIJ45ST7ntKaCkSX2uNZMHxQjQXiO8VJtg==
X-Received: by 2002:a17:902:e78c:b0:2c1:42d2:2a66 with SMTP id d9443c01a7336-2c1e8368d03mr3172835ad.33.1780607772824;
        Thu, 04 Jun 2026 14:16:12 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d59csm65156465ad.4.2026.06.04.14.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 14:16:12 -0700 (PDT)
Date: Fri, 5 Jun 2026 06:16:08 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, Sascha.Bischoff@arm.com,
	jic23@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: [PATCH] KVM: arm64: vgic: Use list_del_rcu() when flushing pending
 LPIs
Message-ID: <aiHrGM1f8czcUby4@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_141613_844084_73776719 
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

vgic_v3_fold_lr_state() walks the ap_list from last_lr_irq without holding
the ap_list_lock, relying on vgic_irq being freed via kfree_rcu() and on
interrupts being disabled. vgic_flush_pending_lpis() removes entries with
list_del(), which clobbers a node's next pointer, so when another vCPU
disables LPIs via GICR_CTLR the walk can follow the clobbered next pointer
from a removed node, or from the node that last_lr_irq points to.

Remove entries with list_del_rcu() so that the next pointer stays valid
until the walk completes.

Fixes: 3cfd59f81e0f ("KVM: arm64: GICv3: Handle LR overflow when EOImode==0")
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 arch/arm64/kvm/vgic/vgic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 1e9fe8764584d..73efc0f95bfb1 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -204,7 +204,7 @@ void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu)
 	list_for_each_entry_safe(irq, tmp, &vgic_cpu->ap_list_head, ap_list) {
 		if (irq_is_lpi(vcpu->kvm, irq->intid)) {
 			raw_spin_lock(&irq->irq_lock);
-			list_del(&irq->ap_list);
+			list_del_rcu(&irq->ap_list);
 			irq->vcpu = NULL;
 			raw_spin_unlock(&irq->irq_lock);
 			deleted |= vgic_put_irq_norelease(vcpu->kvm, irq);
-- 
2.43.0


