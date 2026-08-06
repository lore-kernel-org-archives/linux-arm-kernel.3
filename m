Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DF4C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqHVzp5pYqarvaM7RLacv87HuepiYTxatZ5ud7gmocA=; b=KC5REw3MoHlAop2v/9O8fI3vJF
	IDqDMDr8qQCaweKtbvmIprUle0LfeN6aSdRAfGtOpvKuPjmxfQV8Zh0gxDNRzyENmpkGyXIeQn2LW
	VXTOSuCB4Z5IUN1cEgEdzzr2ctuUgzJw6Z/DwJuxFY9lzAuYB3IhJfBLU45bkbkU38gnyQJFuzovt
	YLLxMGXAnIbkknSTlKWLfuamao5hnKwm11rNV6/8y2YpPUx+dZOwnE55kia1qzej72gfpbFaDcAKe
	svPYJXWSvpg9WNroNh9+Ywti5JKWqYINBlc4HbAKscG5dufXL0tfFxplcnTvC3rNhgeacuzqQ/D+E
	a5O46X9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruxB-00000005Uag-0TCK;
	Thu, 06 Aug 2026 10:03:57 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrux9-00000005UYc-1NSv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:03:56 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786010632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RqHVzp5pYqarvaM7RLacv87HuepiYTxatZ5ud7gmocA=;
	b=qIqVUJTIWoTr8awgN3nLzRpxI3w0oTdjLrALY/hIFWhsUh8ni9EZCMy6PcS50Tt6Os+oNm
	CNS6/FCsoKWs5vMwAsR2SnmrK4hmhnj6toTYhjV1mjpa1slEFB+XSohBLXM+my73Qy9R4p
	fMlxvYQlK036C+9ZQOvD0geFg8VF2sk=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Subject: [PATCH v1 2/4] KVM: arm64: Reject the GICv5 CPU interface hypercalls under pKVM
Date: Thu,  6 Aug 2026 11:02:54 +0100
Message-Id: <20260806100256.371164-3-fuad.tabba@linux.dev>
In-Reply-To: <20260806100256.371164-1-fuad.tabba@linux.dev>
References: <20260806100256.371164-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_030355_512647_CAF3FDD5 
X-CRM114-Status: UNSURE (   8.42  )
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

__vgic_v5_save_apr() and __vgic_v5_restore_vmcr_apr() remain callable
after pKVM finalises. pKVM never registers a GICv5 vgic, so neither has
a valid caller in protected mode, and on a GICv3 machine the registers
they access are UNDEFINED at EL2 and panic the hypervisor.

Reject both when protected mode is enabled.

Fixes: af325e87af5da ("KVM: arm64: gic-v5: Add vgic-v5 save/restore hyp interface")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index d3df96ed8ba42..a9afd350b1fb3 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -695,6 +695,9 @@ static void handle___vgic_v5_save_apr(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct vgic_v5_cpu_if *, cpu_if, host_ctxt, 1);
 
+	if (unlikely(is_protected_kvm_enabled()))
+		return;
+
 	__vgic_v5_save_apr(kern_hyp_va(cpu_if));
 }
 
@@ -702,6 +705,9 @@ static void handle___vgic_v5_restore_vmcr_apr(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct vgic_v5_cpu_if *, cpu_if, host_ctxt, 1);
 
+	if (unlikely(is_protected_kvm_enabled()))
+		return;
+
 	__vgic_v5_restore_vmcr_apr(kern_hyp_va(cpu_if));
 }
 
-- 
2.39.5


