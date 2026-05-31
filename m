Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8D3CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 15:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4HGHSV+ymwGZVts9xs57iGtb0PHiB6C1QG35wARFiWM=; b=lauSBIYcg0x9+M6dzuCWOzCkQ6
	BXjxLtLnWiI36WX5197BzSa3kFO3gjDtn32Q5/4nLIKUSjCXwTsoxg2HfN5+MX9eSLJ5yD5yTCGLO
	Za4ePwZ+TC6fHsnbqgDHKX4hfpQ8DamXw+6a60cDX9FREAr4Foe6CIM73HqcvbxHseAMXquQvoiSq
	UqeRV0NBYD7TOrqd+F+hh0qXiCbZJgc+dZqHsLO3MZtcBwiYME81HqsURiDSNhRQfeEtQ7eINqQtY
	wQwt/SNETDvSzvBxwlbr5kdf9cmXiKfkmeKe4c/yPIlLHS69iIKv9WsePUy6ntPXQfkE9BDe2pS9J
	L4QSB7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTiMK-00000009iQU-4BLo;
	Sun, 31 May 2026 15:45:53 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTiMJ-00000009iPf-1Vyu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 15:45:52 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-beb7c5c1f52so78364766b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 08:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780242349; x=1780847149; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4HGHSV+ymwGZVts9xs57iGtb0PHiB6C1QG35wARFiWM=;
        b=NIifI5DEGyu0PJKui7GmZI9E28VzBvOhF3BtJkfAAmYVjx7bNY5GHRXUt8lDGiVhWE
         d0nGhGKDz6gwp0XgmxtfqDOQI+Rrl/I9Sokt3yvMSYED4VZkzv2Iuc4e5H9Hy6ct+4TI
         +4bgYQr0Yq0DRNzjwEGr7lRSAagfjSZ8f7sZLOunO6e6b2IqEt7XFFNtdhh2e9qawwMR
         nw3IFUZ/mngsCOH47F2Wf9XtKllWJ8j0HEatxhAWV4lzJr3Pyf+++4V/qAxmUseC19CM
         JQAF3HH2aYz/Wpq/SS6crr6sBtohvymM0SIBz5KY+0cJNpMvQRhqHO9b34iTuxrrLmtp
         XfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780242349; x=1780847149;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4HGHSV+ymwGZVts9xs57iGtb0PHiB6C1QG35wARFiWM=;
        b=tWhBHZlFO9/9H69O880yoi6mdT+dXv3BuuUxKPwBfKyuMHnI7jK4dTjxO8r8Bszn/h
         01h3G9Der2vE1wGDfgEmCoOVLlDpaz0R/f4vMQZLARRbDZejsDQxxYxnWaLJg6HwliTi
         epVvtxBCS9R7us+SzKvsS8sW20knwJNF0T8UGZJjRafJOvYCQW7Wsq5Q1iujcRwrQD5t
         ZQS37Nwddqyf8/TDWP3OeIla83QjS6znyYNajFZje/WMaZtfgqnE7OrQv0IoB/RHOiHu
         sxPg/SrCzdsNVpx6brJZVDm8ZQEO3yXSf1hkWoa/026t0ugD53jtC2CFrw5Xpys5dVxi
         i+/w==
X-Gm-Message-State: AOJu0Yye63GQVk06oRcD5mi4UzrtSnCftISfVVQjsDwY6MHSuVpuwNtN
	o27n9rl0Rg8xRKcLb6Glg43sdWrr0ZjIks0q2RUw5xyCJzMmxxTa6A1lnI71n/u61Byuu6RYj2J
	O4w==
X-Received: from edqm24.prod.google.com ([2002:aa7:c498:0:b0:68b:eff7:97f1])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:c10:b0:be2:6e41:ba8f
 with SMTP id a640c23a62f3a-beab5bebadfmr383941866b.44.1780242348882; Sun, 31
 May 2026 08:45:48 -0700 (PDT)
Date: Sun, 31 May 2026 16:45:48 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.929.g9b7fa37559-goog
Message-ID: <20260531154548.1505799-1-tabba@google.com>
Subject: [PATCH] KVM: arm64: Flush HCR_EL2.VSE to deliver SErrors to pKVM guests
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_084551_430983_BA1DBE49 
X-CRM114-Status: GOOD (  12.59  )
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

With pKVM enabled, the host injects a virtual SError by setting
HCR_EL2.VSE on its vCPU copy, but flush_hyp_vcpu() only flows TWI/TWE
into the hyp vCPU that runs, so VSE never reaches it and a deferred
(masked) SError is never delivered. VSE is a host-owned injection
control, not a trap-configuration bit, so restricting the host's
trap-register values should not have dropped it. Flow it on entry;
sync_hyp_vcpu() already copies hcr_el2 back, so delivery is reflected
to the host.

Fixes: b56680de9c648 ("KVM: arm64: Initialize trap register values in hyp in pKVM")
Reported-by: Sashiko (local):gemini-3.1-pro
Signed-off-by: Fuad Tabba <tabba@google.com>
---
Not an urgent fix. I should stop running Sashiko...
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 06db299c37a8..9e4a20df6409 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -129,9 +129,14 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	hyp_vcpu->vcpu.arch.ctxt	= host_vcpu->arch.ctxt;
 
 	hyp_vcpu->vcpu.arch.mdcr_el2	= host_vcpu->arch.mdcr_el2;
-	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
+	/*
+	 * HCR_EL2.VSE is host-owned (a pending virtual SError to inject), not a
+	 * trap-control bit, so it must flow to the hyp vCPU alongside TWI/TWE
+	 * for the vSError to be delivered. sync_hyp_vcpu() reflects it back.
+	 */
+	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE | HCR_VSE);
 	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
-						 (HCR_TWI | HCR_TWE);
+						 (HCR_TWI | HCR_TWE | HCR_VSE);
 
 	hyp_vcpu->vcpu.arch.iflags	= host_vcpu->arch.iflags;
 
-- 
2.54.0.929.g9b7fa37559-goog


