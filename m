Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F131C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 15:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UHMm2Z1OTcyZHwDxnaYxeN3t4Vh1LnM+EKpoEcU3r9c=; b=JAWQFjpHyrKyW7fF6DhIp8ATvB
	yN3tfOGm227tCOpl7S/Ji2IEe5DzQUj3/zNEdGkr6EUNm0AQu6D2Sifv1wubP2yiAQrv7q94z0QkB
	b2nQjJp4rnQcqJHM0DKSm05kYjDn89X8nMFffkLf2FJVsXDl2K2kqh9gJMGU/lKotxb3U1NpRe6Z9
	I1RN+3aqlfDL+UvvVEMiGg6biKJFtr+KILRZRmiDNSNMsQBB+Y19MXdOEkWs39evYTshbIbTqLbzz
	yqP9Ps4j8Oy2+bVt9lm+63oJT2asRed2BBoBgAbon/9plSqkIXALXfHR+6C1WcWYoRivv+1a0vXHF
	BUR+vx1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXo8-0000000FmP1-1yEJ;
	Sun, 02 Aug 2026 15:08:56 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXo5-0000000FmOe-0zDE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 15:08:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785683329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UHMm2Z1OTcyZHwDxnaYxeN3t4Vh1LnM+EKpoEcU3r9c=;
	b=gMKSneXPJFyeWLDYzxirNzasdTlr+W9DcufRPbjyJf1BfLd/u1/KeSM/pbKdNb3SA9gXYe
	W7NNh/2uQ4M0PsIYWE4gfoHErIm4C8IDArTrzSgAjN8YSdQEPOULsPYYpKeZjSlemCpj5N
	/TwGZzBRaAYdkao9EDGLC+gG/Cb04aQ=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: stable@vger.kernel.org,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] KVM: arm64: vgic: Reset in_kernel on private IRQ allocation failure
Date: Sun,  2 Aug 2026 16:08:45 +0100
Message-Id: <20260802150845.3485757-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_080853_407983_729D7A0C 
X-CRM114-Status: UNSURE (   7.21  )
X-CRM114-Notice: Please train this message.
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

kvm_vgic_create() sets vgic.in_kernel before allocating the per-vCPU
private IRQs, but the allocation-failure path resets only vgic_model and
leaves in_kernel set. As irqchip_in_kernel() is !!in_kernel, the VM is
left with an in-kernel irqchip but no model, and the -EEXIST guard at the
top of kvm_vgic_create() rejects every retry, so userspace cannot recover
from a transient -ENOMEM.

Reset in_kernel alongside vgic_model on the failure path.

Fixes: 9435c1e1431003 ("KVM: arm64: gic: Set vgic_model before initing private IRQs")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 907057881b26a..fdac6e24762da 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -176,6 +176,7 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 		}
 
 		kvm->arch.vgic.vgic_model = 0;
+		kvm->arch.vgic.in_kernel = false;
 		goto out_unlock;
 	}
 

base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
-- 
2.39.5


