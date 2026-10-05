Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA11CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkbCb8GILuXUqD56abruGf/LuH3Xk1TvEzRD0hwiQKc=; b=KxLvpU9/v2wqSwIgkEFGqn/Mb8
	HLQvJALIVDx5DQY1ldPyWlUY9Oc0QFTM2DTNKKtanEODbdxFD+2Jv00PpG1satV9SzUl1+GD9oecA
	dbsN922o04bA/egadEDYgygr+r1lnvffgkjwxVz4ePgWlIeHIrL/INBC49NTg4BjuV4BGkEIh3GNA
	CiwafCjYqTnm3uUf4JykXB7CaF/9yGwsGClnQmb5qzWX68rENPJi0sTZ0B8Bag1RtGUn3xKIWPUDk
	H6J77QYMBnuL7yNtqhtf97X+TyY9I22LAFCv+BW/pjk7gHOd0BN1qZ2tQcKkiz5zbPYn53e4XWFdM
	JthK1Qvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDehH-0000000FxgV-2lBA;
	Mon, 05 Oct 2026 09:09:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDehG-0000000FxdK-0MB2
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 05 Oct 2026 09:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tkbCb8GILuXUqD56abruGf/LuH3Xk1TvEzRD0hwiQKc=; b=dxv4DCm7hPeXQCTlkU0VzD1MFi
	bFP09d98dGp8Sd7ilq5ZFgtdiJDtZRfneVnxOxyeoS5wYs+J50TCJlHZI8Y5XwvnrWhRuFyAIMZC4
	ZvHycI2T1ypFDf1banrdCHqsNAwwdDnX2GIMsSqoVBDLSK3B4orM6KuCqRVD+pG/y0+7iDsfaECvk
	aWIpSHQfHL9JXTA1FKw38MWjJrDMQWRt3EzbiNdlr2CYwANRkOLrqRJojxuXjLGNtNg/OeuJ9i/Rb
	pDchx8+mUkXc3XeV/n7/WiIjMjvCCRRjvrx8edT7e64eyBnnM2EFTGePyhEx0Koz4nZbz58GCE+DF
	T9IodMfQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xDehB-00000007ksg-1PUR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:09:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAC7D152B;
	Mon,  5 Oct 2026 02:09:12 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 258323F66F;
	Mon,  5 Oct 2026 02:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791191356; bh=AOVF4a7/lSQM973EMT8NHAVecCRsdK6HnC8EakUQ6v8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=drmSrw37nQLY1U4zQE5Jcthv9eSmCCZ6NmFY8F7NvhegecpofHsHtaHe482RPOstG
	 72WAm2SWQyJoRFXXJ8QL9ucaXx53zBql9u/1f7BXVgl6cGyBEfT3GwIfjlRik0UTVI
	 d4Ei8iz3Qf/zDDTBfGX42iea7QHiSQWTUEE32ix8=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v22 21/23] KVM: arm64: CCA: Support timers in realm RECs
Date: Mon,  5 Oct 2026 10:07:52 +0100
Message-ID: <20261005090754.2140522-22-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005090754.2140522-1-suzuki.poulose@arm.com>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_100917_834418_D2B713C8 
X-CRM114-Status: GOOD (  15.39  )
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

From: Steven Price <steven.price@arm.com>

The RMM keeps track of the timer while the realm REC is running, but on
exit to the normal world KVM is responsible for handling the timers.

A later patch adds the support for propagating the timer values from the
exit data structure and making sure the values are in sync for KVM.

Also, RMM doesn't support injecting virtual interrupts backed by Physical
interrupts. So, use the existing software resampling mechanims for Realm
timer interrupts.

Signed-off-by: Steven Price <steven.price@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kvm/arch_timer.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index a45845f4ae4ea..428709f499205 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -56,11 +56,25 @@ static unsigned long kvm_arch_timer_get_irq_flags(void)
 	return kvm_vgic_global_state.no_hw_deactivation ? VGIC_IRQ_SW_RESAMPLE : 0;
 }
 
+static unsigned long kvm_realm_timer_get_irq_flags(void)
+{
+	/*
+	 * RMI_REC_ENTER rejects LRs with the HW bit set, so use the existing
+	 * software resampling mechanism for Realm timer interrupts.
+	 */
+	return VGIC_IRQ_SW_RESAMPLE;
+}
+
 static const struct irq_ops arch_timer_irq_ops = {
 	.get_flags	 = kvm_arch_timer_get_irq_flags,
 	.get_input_level = kvm_arch_timer_get_input_level,
 };
 
+static const struct irq_ops realm_timer_irq_ops = {
+	.get_flags	 = kvm_realm_timer_get_irq_flags,
+	.get_input_level = kvm_arch_timer_get_input_level,
+};
+
 static const struct irq_ops arch_timer_irq_ops_vgic_v5 = {
 	.get_input_level = kvm_arch_timer_get_input_level,
 	.queue_irq_unlock = vgic_v5_ppi_queue_irq_unlock,
@@ -1617,8 +1631,12 @@ int kvm_timer_enable(struct kvm_vcpu *vcpu)
 
 	get_timer_map(vcpu, &map);
 
-	ops = vgic_is_v5(vcpu->kvm) ? &arch_timer_irq_ops_vgic_v5 :
-				      &arch_timer_irq_ops;
+	if (vcpu_is_rec(vcpu))
+		ops = &realm_timer_irq_ops;
+	else if (vgic_is_v5(vcpu->kvm))
+		ops = &arch_timer_irq_ops_vgic_v5;
+	else
+		ops = &arch_timer_irq_ops;
 
 	for (int i = 0; i < nr_timers(vcpu); i++)
 		kvm_vgic_set_irq_ops(vcpu, timer_irq(vcpu_get_timer(vcpu, i)), ops);
-- 
2.43.0


