Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B4CD232EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vjb+8F5dXms766UBf5RrIFwa6GnmPohIbLDUXuV3xwk=; b=k5jmWji2KyIsu/1WoVruEFyuFu
	VBQJ34yqZ8nGvGsNDp0lqfrscIItCuj9hCux6LqlvPCxn36EQ/USkaVKmfXarTOOy66dFNrS8Ajx+
	cdwFUt1I++dw8w5K7hYgeTUmIgZaSRxcnlvqZ8BbgvHlVZxXHUPqEXv3xBAxPfhHviHU+l6SrPyKC
	4fqE3H/SlrJIGmcOZQmFIC1uR9vlWuUAXYdKnCLrDaQjeOVHXJ7RVBWy0aZcxlp7AZzGs/QPc4dNC
	TCqKCD5hyeBGnuGJE3NEaFB5PPFu/4ioVlb+Yv8ndiAgm6mNSy5XuhVkw1LYFNgz1ltZGIjZ0etIM
	lYuavXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7SU-00000001pEY-0bXF;
	Fri, 09 Jan 2026 08:02:58 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7SR-00000001pCU-09Wg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 08:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Vj
	b+8F5dXms766UBf5RrIFwa6GnmPohIbLDUXuV3xwk=; b=IA2b+j6df2B+FLJ+m7
	ZvphKJsjHUccBDZbG5LK1k+ESAtpp63tsfBxU2T1RCaR4eAZ42B6S48YGMEfAx4s
	oS/LJXR4EZgK2ttX+ogvE2/yrC3qpsRx+/4xR7iBDzymUCrf3U3iuvnRlz+BaPST
	386g0N77FJF6NTKhMMnpArGAc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDXXksVtmBpNHXMEg--.30S2;
	Fri, 09 Jan 2026 16:02:30 +0800 (CST)
From: Dongxu Sun <sundongxu1024@163.com>
To: maz@kernel.org,
	oupton@kernel.org,
	yuzenghui@huawei.com
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sundongxu1024@163.com
Subject: [PATCH v2] KVM: arm64: Remove unused vcpu_{clear,set}_wfx_traps()
Date: Fri,  9 Jan 2026 16:02:26 +0800
Message-ID: <20260109080226.761107-1-sundongxu1024@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXXksVtmBpNHXMEg--.30S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrW8XF13Kr1rCF1xAr1DJrb_yoW8Xr1UpF
	sxCwn3W3yrKryUJ34UWwna93yjvwn8K34SqFy7Kr1FgF1qyFy5GrZYkry5AFZ8XFyvvayx
	ZFy7tF1DAw1jy3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRj2NtUUUUU=
X-Originating-IP: [58.250.18.76]
X-CM-SenderInfo: xvxqv05qj03iqqsuqiywtou0bp/xtbC0BclsmlgthfNegAA3P
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_000255_392551_2E8EFCDE 
X-CRM114-Status: UNSURE (   6.36  )
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
commit 0b5afe05377d7 ("KVM: arm64: Add early_param to
control WFx trapping").
Remove it.

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Dongxu Sun <sundongxu1024@163.com>
---
v2 -> v1: Update subject and commit message.
v1: https://lore.kernel.org/all/20260109025837.754242-1-sundongxu1024@163.com

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


