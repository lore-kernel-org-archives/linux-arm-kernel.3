Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B9CD232CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 02:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=logLArlX7d3QTVIZ0ZdE29pdLadPZUhVFSbuJlr2Y/s=; b=FEQWuM6wb7GhUy0QrPoe3ssasY
	uPMnk+R1QWc5k9rtKgb+j9wrfc2u35bsN8k0gpLZn3axjQIZGQ/+1WWQgnJKT64Brh+R+l0DE5LDF
	nTUmchZWZ2wtQGSEdNZhgaaT7S0adBwpf/Ef0ED02eM44D1GRJOzFIkIqPHcwhFUM0ldtRcBhMxN3
	ZNIh8LT4evZAP0+3nF8PbIib/G5Duwgvm05x7kyddF0FocNq8QVNMuDG3kZMRfvwWXTCPOcanIWdb
	hPbMKuu2I9I/FmyxpI8+YmJz0T79P8jkk4Au44caoptMwVMBvFzhrMK2Gg/wPSVJ2TeE5vo5mBZUC
	WtaVBqEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve2iT-0000000191Q-1DRW;
	Fri, 09 Jan 2026 02:59:09 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve2iP-00000001917-2IkW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 02:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=lo
	gLArlX7d3QTVIZ0ZdE29pdLadPZUhVFSbuJlr2Y/s=; b=iCnBIoqhcnhRa/rtDw
	TyKk2twWVarzdlxiQnfd54idZ+Hoxnom67WjqzzcM9+2NGGNUcgzu5DCm06t2A3Q
	ew848I2ccSgBavI3aOz6wI8VivgGS0qiDZ1blerLq2siq7IXVsaEUxjcUE7ZvjXH
	mv8V5M62tx6n7lwPsW3HgL4KU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDXrunfbmBpFNwMKw--.28S2;
	Fri, 09 Jan 2026 10:58:42 +0800 (CST)
From: Dongxu Sun <sundongxu1024@163.com>
To: maz@kernel.org,
	oupton@kernel.org
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sundongxu1024@163.com
Subject: [PATCH] KVM: arm64: remove unused vcpu_{clear,set}_wfx_traps()
Date: Fri,  9 Jan 2026 10:58:37 +0800
Message-ID: <20260109025837.754242-1-sundongxu1024@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgDXrunfbmBpFNwMKw--.28S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Xry7Kw48WrW5CryDJF43Wrg_yoW8JF1rpF
	n3uwn3W3yrGryUJ34UWrnI93yYv3s8K34SqFy7Kr1FgF1qyFy5JrZYkry5AFZ8XFyvvayx
	ZFy7tF1DAw4UAFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRFoGdUUUUU=
X-Originating-IP: [58.250.18.76]
X-CM-SenderInfo: xvxqv05qj03iqqsuqiywtou0bp/xtbC8QJG02lgbuKQMQAA3C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_185906_049251_4F06F16E 
X-CRM114-Status: UNSURE (   6.37  )
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

Function vcpu_{clear,set}_wfx_traps() are unused since
commit 0b5afe05377d7 ("KVM: arm64: Add early_param to control WFx trapping")
Remove it.

Signed-off-by: Dongxu Sun <sundongxu1024@163.com>
---
 arch/arm64/include/asm/kvm_emulate.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index c9eab316398e..55d34192a8de 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -119,22 +119,6 @@ static inline unsigned long *vcpu_hcr(struct kvm_vcpu *vcpu)
 	return (unsigned long *)&vcpu->arch.hcr_el2;
 }
 
-static inline void vcpu_clear_wfx_traps(struct kvm_vcpu *vcpu)
-{
-	vcpu->arch.hcr_el2 &= ~HCR_TWE;
-	if (atomic_read(&vcpu->arch.vgic_cpu.vgic_v3.its_vpe.vlpi_count) ||
-	    vcpu->kvm->arch.vgic.nassgireq)
-		vcpu->arch.hcr_el2 &= ~HCR_TWI;
-	else
-		vcpu->arch.hcr_el2 |= HCR_TWI;
-}
-
-static inline void vcpu_set_wfx_traps(struct kvm_vcpu *vcpu)
-{
-	vcpu->arch.hcr_el2 |= HCR_TWE;
-	vcpu->arch.hcr_el2 |= HCR_TWI;
-}
-
 static inline unsigned long vcpu_get_vsesr(struct kvm_vcpu *vcpu)
 {
 	return vcpu->arch.vsesr_el2;
-- 
2.43.0


