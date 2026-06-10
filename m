Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10C2CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 13:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8cH7ELiB7PUfRPmkIhoyO3yqncqCyIggpzl6Mz6h3k=; b=U+/p2w+JCFItj5N73JtX9wh+Cq
	ewCpuU3ZKLZHhJC10hj0fLtZ8xB2RkXvXHrRSiF92X5c0ZBaqhdgSHHTkLbEZhd+Slqz2Ow/tFUDX
	69NWh+GghSrIMY855MH3p3WsqCSua9fprxtjOEmcNHc/y4OCO6F8nIK2xYJTG9JbY0Dko0mSr+W9K
	NbB1C8adZQJSGW2BgkQdSShGSgtZak7crvGrxTT1aHKn8G6kT6aHA60it+GnNacyxJLAOKdREbgiv
	SEe0gZrp7JCotftR++u+3HJAnzVK9P/193MMG+DCh0yzTQmb4XiqmpMK4K/jTzzZiEIJO+WmCDaAT
	nA6eJT3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJLw-00000007oLJ-2DFw;
	Wed, 10 Jun 2026 13:52:20 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJLt-00000007oKx-2WD1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 13:52:18 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84275887a3fso4854574b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 06:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781099536; x=1781704336; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m8cH7ELiB7PUfRPmkIhoyO3yqncqCyIggpzl6Mz6h3k=;
        b=QLR8noqN68vNG5h1x/ZFx+z63fCwRfoE7CxUZXUI6NYOIjeniBDt97+bY4pgpIo1ms
         DVkNhMr0JvpCkIbVISfI1UfFi0ZJS5RbRqAH9t6JVE4Y6JOdSTrAAnLmXAcIrd0KkFWK
         hLVJRkfWsMsqD1zechYSw7oI/H7kh2mk+JAg+19DyYlscqvU2qDpY1f8SVzIL3/TU06M
         517nWO0YOZgqMQuz3GVnUDU/pz3joutCcdFGR73m/wE+QIMZ1mW9ZHawR2tczeYYZvGG
         hlaw1Xi+IPUsTpL4Phqz6AjHXZ8IyV9QeWXYGLxoV8PZv9KygkX06hbXnMnm+Pj8+B9H
         5A1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099536; x=1781704336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8cH7ELiB7PUfRPmkIhoyO3yqncqCyIggpzl6Mz6h3k=;
        b=OXmLStmrFmZk24kOvoVkPANaL94H4Jxdc1Cv6P3TrbO+f9Xv7QSMYGTJFawjfv5rdA
         x0QhNH8L5CaxQMMYj8gm6MK5X2V4iZEYYAwV2bqmrbo0VWssn8sltWI+vqdHdFqPNxCx
         88cGAxWTBqptDFFRX5ZjGickGSDZKTrrQ7nSP4R+d5AbR7MxQURVQ4vwtjlhSXE2+BoV
         ezy3t4ofpzeLXJdhotrWNlLMgO+FH4k5vfeRO39KKyt6uaPzJxNfMwSo3J7v+HWvnbyA
         wBMEyr1S0GonsWEJBVmZTRp4L+ZEf6DdlNfj2SiaVb7LlpVmQ7LHrzxPI/3tSE10/mbj
         lnZA==
X-Forwarded-Encrypted: i=1; AFNElJ+GOqvsxR4cHEgp8tnfzCB2qs9rQu6Tb0cwdsyUmduQMrKT36KaFdL0/Ye1eagP3Nq/B83GZjwA6ZKxERelOn55@lists.infradead.org
X-Gm-Message-State: AOJu0YzsQQ/RtkTde47zsv3N0Tztas03P30y4eNZAJMrW2d7SxiSa/Y6
	g8Pa36+xDINMUvDdGSKTtWjVebm4dB09QBfFdKoc6TsWjnMP1kCz1zP1
X-Gm-Gg: Acq92OE4U8awoahKBzM+FQJ0Np9BnL9TmOWGsZc8nZ/5WWGiX0TZHpOxaJTYIBMAJn7
	OOSPEwpGznbN2Wn5dPZbb/NqIB06v2rAE3cnzxxguBBb/c72C+M6BReVQEklL+X5VAMGp++eWqq
	jP6IK/YBhASBCYnn+vNH6HkjJXbeEQqYyOovBRw3aiTTFxFjRsBI+B4xlCLS8iOhhPCCiC9USQy
	JR1gwgEcpBrLtmCihmAHK2UFHdrthXRckV5dk109ag3Zjy9cSTcM9y4ChhYySNdUaYFd17v1qCf
	yJYzXmKc8VHNV+ZJMYb2y2VtHbFFWarI7PLB0T4r0eGXrzme67GEvXD5zAHhcd+WIa3cnZB8bJM
	x9F5bSHH7QXyhz6IUIo9u+1IbTUMQAashFZI4Vvmt9Vvvhe/ALT7j/ieCQ4vT38/oIJlooj4b6U
	9NLEeArCAuUIrNwGz0+XTZNpwo2lGt/cxbJfNEUSyZ5t7eS0H8hG9VvA==
X-Received: by 2002:a05:6a00:32c4:b0:842:6259:5e2b with SMTP id d2e1a72fcca58-842b685d4demr20157465b3a.33.1781099536132;
        Wed, 10 Jun 2026 06:52:16 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372a16sm29689105b3a.18.2026.06.10.06.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:52:15 -0700 (PDT)
Date: Wed, 10 Jun 2026 22:52:10 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, Sascha.Bischoff@arm.com,
	jic23@kernel.org, timothy.hayes@arm.com, andre.przywara@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: Re: [PATCH] KVM: arm64: vgic: Check the interrupt is still ours
 before migrating it
Message-ID: <ailsCnyoS82r_QRz@v4bel>
References: <aiHnI1mu6SGQrgnz@v4bel>
 <aiJmBfXAxcytfGha@kernel.org>
 <87ecila0w3.wl-maz@kernel.org>
 <aiKMNIUMv9GQiIbD@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiKMNIUMv9GQiIbD@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_065217_675335_0C0BF4B6 
X-CRM114-Status: GOOD (  43.96  )
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

On Fri, Jun 05, 2026 at 01:43:32AM -0700, Oliver Upton wrote:
> On Fri, Jun 05, 2026 at 08:42:52AM +0100, Marc Zyngier wrote:
> > On Fri, 05 Jun 2026 07:00:37 +0100,
> > Oliver Upton <oupton@kernel.org> wrote:
> > > 
> > > On Fri, Jun 05, 2026 at 05:59:15AM +0900, Hyunwoo Kim wrote:
> > > > vgic_prune_ap_list() drops both ap_list_lock and irq_lock while migrating
> > > > an interrupt to another vCPU. After reacquiring the locks it only checks
> > > > that the affinity is unchanged (target_vcpu == vgic_target_oracle(irq))
> > > > before moving the interrupt, which assumes that an interrupt whose affinity
> > > > is preserved is still queued on this vCPU's ap_list.
> > > > 
> > > > That assumption no longer holds if the interrupt is taken off the ap_list
> > > > while the locks are dropped. vgic_flush_pending_lpis() removes the
> > > > interrupt from the list and sets irq->vcpu to NULL, but leaves
> > > > enabled/pending/target_vcpu untouched. As the interrupt is still enabled
> > > > and pending, vgic_target_oracle() returns the same target_vcpu, so the
> > > > affinity check passes and list_del() is run a second time on an entry that
> > > > has already been removed.
> > > > 
> > > > Also check that the interrupt is still assigned to this vCPU
> > > > (irq->vcpu == vcpu) before moving it.
> > > > 
> > > > Fixes: 0919e84c0fc1 ("KVM: arm/arm64: vgic-new: Add IRQ sync/flush framework")
> > > > Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> > > 
> > > Looking at this and the other VGIC patch you sent (which should've been
> > > a combined series), are you trying to deal with a vCPU writing to
> > > another vCPU's redistributor? I.e. vCPU B setting GICR_CTLR.EnableLPIs=0
> > > behind the back of vCPU A?
> > > 
> > > That is extremely relevant information as the off-the-cuff reaction is
> > > that no race exists. But since the GIC architecture is awesome and
> > > allows for this sort of insanity, it obviously does....
> > > 
> > > Anyway, for LPIs resident on a particular RD, there's zero expectation
> > > that the pending state is preserved when EnableLPIs=0. So I'd rather
> > > vgic_flush_pending_lpis() just invalidate the pending state.
> > 
> > Just clearing the pending state introduces a potential problem as we
> > now have an interrupt that is neither active nor pending on the AP
> > list. It is not impossible to solve (we now have similar behaviours
> > with SPI deactivation from another vcpu), but that requires posting a
> > KVM_REQ_VGIC_PROCESS_UPDATE to the target vcpu.
> 
> Right, I was suggesting that in addition to deleting the LPI from the AP
> list we actually invalidate the pending state so that someone sitting on
> a pointer to a to-be-freed LPI sees vgic_target_oracle() returning
> NULL
> 
> > > Beyond that, I see two other fixes for lifetime issues around the
> > > vgic_irq in the middle of migration. I'd like to see explicit RCU
> > > protection around the release && reacquire of the ap_list_lock rather
> > > than depending on the precondition that IRQs are disabled.
> > 
> > I'm not sure I follow. Are you suggesting turning the AP list into an
> > RCU protected list?
> 
> No, sorry, I should expand a little.
> 
> We store a reference on the vgic_irq struct in the AP list, which is
> stable so long as the ap_list_lock is held. It should be possible for
> the refcount to drop to 0 between releasing the ap_list_lock and
> reacquiring it.
> 
> So either vgic_prune_ap_list() takes an additional reference on the
> vgic_irq before dropping the ap_list_lock or rely on RCU to protect
> vgic_irq structs observed with a non-zero refcount.

What are your thoughts on this approach?


Best regards,
Hyunwoo Kim

---

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 933983bb2005..7fb871c3ccd8 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -523,7 +523,7 @@ static void __kvm_vgic_vcpu_destroy(struct kvm_vcpu *vcpu)
 	 * Retire all pending LPIs on this vcpu anyway as we're
 	 * going to destroy it.
 	 */
-	vgic_flush_pending_lpis(vcpu);
+	vgic_flush_pending_lpis(vcpu, true);

 	INIT_LIST_HEAD(&vgic_cpu->ap_list_head);
 	kfree(vgic_cpu->private_irqs);
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 5913a20d8301..f85d63f17af0 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -303,7 +303,7 @@ static void vgic_mmio_write_v3r_ctlr(struct kvm_vcpu *vcpu,
 		if (ctlr != GICR_CTLR_ENABLE_LPIS)
 			return;

-		vgic_flush_pending_lpis(vcpu);
+		vgic_flush_pending_lpis(vcpu, false);
 		vgic_its_invalidate_all_caches(vcpu->kvm);
 		atomic_set_release(&vgic_cpu->ctlr, 0);
 	} else {
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 1e9fe8764584..09629a38fc0a 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -192,7 +192,7 @@ static void vgic_release_deleted_lpis(struct kvm *kvm)
 	xa_unlock_irqrestore(&dist->lpi_xa, flags);
 }

-void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu)
+void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu, bool destroy)
 {
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
 	struct vgic_irq *irq, *tmp;
@@ -204,6 +204,13 @@ void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu)
 	list_for_each_entry_safe(irq, tmp, &vgic_cpu->ap_list_head, ap_list) {
 		if (irq_is_lpi(vcpu->kvm, irq->intid)) {
 			raw_spin_lock(&irq->irq_lock);
+			/* Leave interrupts pending a migration for prune. */
+			if (!destroy && irq->vcpu != vgic_target_oracle(irq)) {
+				raw_spin_unlock(&irq->irq_lock);
+				continue;
+			}
+			/* Pending state is not preserved across EnableLPIs=0. */
+			irq->pending_latch = false;
 			list_del(&irq->ap_list);
 			irq->vcpu = NULL;
 			raw_spin_unlock(&irq->irq_lock);
@@ -797,6 +804,9 @@ static void vgic_prune_ap_list(struct kvm_vcpu *vcpu)

 		/* This interrupt looks like it has to be migrated. */

+		/* Keep the interrupt alive while the locks are dropped. */
+		vgic_get_irq_ref(irq);
+
 		raw_spin_unlock(&irq->irq_lock);
 		raw_spin_unlock(&vgic_cpu->ap_list_lock);

@@ -839,6 +849,8 @@ static void vgic_prune_ap_list(struct kvm_vcpu *vcpu)
 		raw_spin_unlock(&vcpuB->arch.vgic_cpu.ap_list_lock);
 		raw_spin_unlock(&vcpuA->arch.vgic_cpu.ap_list_lock);

+		deleted_lpis |= vgic_put_irq_norelease(vcpu->kvm, irq);
+
 		if (target_vcpu_needs_kick) {
 			kvm_make_request(KVM_REQ_IRQ_PENDING, target_vcpu);
 			kvm_vcpu_kick(target_vcpu);
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 9d941241c8a2..c1ac24ede899 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -341,7 +341,7 @@ void vgic_v3_put(struct kvm_vcpu *vcpu);
 bool vgic_has_its(struct kvm *kvm);
 int kvm_vgic_register_its_device(void);
 void vgic_enable_lpis(struct kvm_vcpu *vcpu);
-void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu);
+void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu, bool destroy);
 int vgic_its_inject_msi(struct kvm *kvm, struct kvm_msi *msi);
 int vgic_v3_has_attr_regs(struct kvm_device *dev, struct kvm_device_attr *attr);
 int vgic_v3_dist_uaccess(struct kvm_vcpu *vcpu, bool is_write,

