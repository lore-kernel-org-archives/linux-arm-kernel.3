Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D19DCCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 14:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:CC:To:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aW0vtNY+80ANt8g8vBvYcKAPWFdtwqr1pnE2CY5Stqs=; b=kexWAHFZx6e9rkMdPBpW6k70A0
	QZb8IcOxKRcPOuG+w3YM8TDO/gj5Xp1P3K1misBQorC5EvOYCx4jpaU+ZPOY1Gd76IjiqXKH47I1W
	jv91UN7lL2x5VHfQhjPMDTyNK1Qd4jUP4Z8RxyVXrvwD9RZGUMibLrzinoNuOIgZLeofA99VFMl4x
	lNNPfLlsfRoksfxe4mLMtnKlVKKWIcI1o15FiCJo5cIOewkPL3eTdRgNPcBJcJnHnR9QWSQAT0HHW
	U8nq7ORDvvzUREmaP1GZha2HRqekAdwHt8QLez/sKyLwsAqdSJ78aHCCXLebX+jg9vOgtcauhSGHC
	3m63vFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gHi-0000000GfZX-0M47;
	Tue, 14 Oct 2025 14:45:54 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gHe-0000000GfX6-1RPY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 14:45:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aW0vtNY+80ANt8g8vBvYcKAPWFdtwqr1pnE2CY5Stqs=;
	b=dro/0FNxZxUiay6DtOjZwbwDtlcfnS0Fs+LJ/+ezGGoyQ3bZYjhpRO1l7q8uIfrpgGDlB0flo
	seuAzsXwSbYnxP+sCAr8CSTYCdkLPb6FgEMF/cmrKjs7olLxbMlAR1KTENuyDdBCgd95HwIZTsb
	VL4GVyWC3PRBi0a3NFj1k18=
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4cmH7f56K8zRhR7;
	Tue, 14 Oct 2025 22:45:18 +0800 (CST)
Received: from kwepemh200008.china.huawei.com (unknown [7.202.181.115])
	by mail.maildlp.com (Postfix) with ESMTPS id AD6821402DA;
	Tue, 14 Oct 2025 22:45:38 +0800 (CST)
Received: from [10.174.176.125] (10.174.176.125) by
 kwepemh200008.china.huawei.com (7.202.181.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Oct 2025 22:45:37 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: [Question] Received vtimer interrupt but ISTATUS is 0
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, Joey
 Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
CC: "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)"
	<linux-arm-kernel@lists.infradead.org>, "open list:KERNEL VIRTUAL MACHINE FOR
 ARM64 (KVM/arm64)" <kvmarm@lists.linux.dev>, open list
	<linux-kernel@vger.kernel.org>, "wanghaibin.wang@huawei.com"
	<wanghaibin.wang@huawei.com>, Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <14b30b59-12bb-fc69-8447-aae86fcafcd1@huawei.com>
Date: Tue, 14 Oct 2025 22:45:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.125]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemh200008.china.huawei.com (7.202.181.115)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_074551_551461_BD718121 
X-CRM114-Status: GOOD (  13.25  )
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

Hi all,

I'm having a very strange problem that can be simplified to a vtimer 
interrupt being received but ISTATUS is 0. Why dose this happen? 
According to analysis, it may be the timer condition is met and the 
interrupt is generated. Maybe some actions(cancel timer?) are done in 
the VM, ISTATUS becomes 0 and he hardware needs to clear the interrupt. 
But the clear command is sent too slowly, the OS has already read the 
ICC_IAR_EL1. So hypervisor executed kvm_arch_timer_handler but ISTATUS is 0.
The code flow is as follows:
kvm_arch_timer_handler
     ->if (kvm_timer_should_fire)
         ->the value of SYS_CNTV_CTL is 0b001(ISTATUS=0,IMASK=0,ENABLE=1)
     ->return IRQ_HANDLED

Because ISTATUS is 0, kvm_timer_update_irq will not be executed to 
inject this interrupt into the VM. Since EOImode is 1 and the vtimer 
interrupt has IRQD_FORWARDED_TO_VCPU flag, hypervisor will not write 
ICC_DIR_EL1 to deactivate the interrupt. This interrupt remains in 
active state, blocking subsequent interrupt from being process. 
Fortunately, in kvm_timer_vcpu_load it will be determined again whether 
an interrupt needs to be injected into the VM. But the delay will 
definitely increase.

What I want to discuss is the solution to this problem. My solution is 
to add a deactivation action:
diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index dbd74e4885e2..46baba531d51 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -228,8 +228,13 @@ static irqreturn_t kvm_arch_timer_handler(int irq, 
void *dev_id)
         else
                 ctx = map.direct_ptimer;

-       if (kvm_timer_should_fire(ctx))
+       if (kvm_timer_should_fire(ctx)) {
                 kvm_timer_update_irq(vcpu, true, ctx);
+       } else {
+               struct vgic_irq *irq;
+               irq = vgic_get_vcpu_irq(vcpu, timer_irq(timer_ctx));
+               gic_write_dir(irq->hwintid);
+       }

         if (userspace_irqchip(vcpu->kvm) &&
             !static_branch_unlikely(&has_gic_active_state))

If you have any new ideas or other solutions to this problem, please let 
me know.

Looking forward to your reply.

Kunkun Jiang




