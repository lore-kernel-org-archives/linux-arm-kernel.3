Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225D0C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxS0NRBY3i0kZcuHxe0V5BgtVYZZ3/0KR07GPgwzac4=; b=F0EkyWVWyOnOCPqzFZGFc7Jixl
	olrCQD1/TDHcLvtyDOHBF+YhpI/hJ2BFeZvSlEhZ1b479W9b+bUoEnIfs/HSjjWxzCPt3QR2tHrVx
	aHJljZX971tnAhhkdlwKlBB6HAtkOpp2X2nfO4oGYBFc5GZT+92J8BIePIRxEcepzKD+lus9FVxh/
	QfAVV8lx6WuWTzwtrWxqpCzfS/2LQ1JBm5yW/7G4IW6vCaJPO1XHJISENykef3X5/JwVq7+uLUbBI
	SI+W2QWVgeCp2hFKJ1L2hUgxMKMq5YIdz++s/mwkkqs/Afegcy1JmOjx4KFVT5Gu8oW8FZTbSm2Ku
	6Mp7dTmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAxX-00000001OsO-0nPc;
	Tue, 04 Aug 2026 08:57:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAxW-00000001Os9-0GAh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 08:57:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 09203600AA;
	Tue,  4 Aug 2026 08:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E3A1F000E9;
	Tue,  4 Aug 2026 08:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785833832;
	bh=xxS0NRBY3i0kZcuHxe0V5BgtVYZZ3/0KR07GPgwzac4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=UT90DsPzrSuia1XzFFet3nOueTooswWOFwwvIVVUp4i31U91QcZdNkPS7wDN44WfZ
	 5SW8BtiDJsI6Fx9pak/IUmX5Z2J+CsBdP8wwjY3f2mQUM4eQIABFyJaXxGJhayR1gn
	 U5R+0MEmOP50TZcTUR7p1eCgQVGCvP9a8smRHHuChY1zUBlFlrNOJSODIP4Z9/TPfi
	 uBn3/pDxKsMyP6756Kk1ACB4f53ti49Pq6U7ezDbTVRR4O1TOTd6/BFPY6zByPR6tj
	 IFWmH0hMFRtARMPxU/r8zriH6wy2JEQQcyViZK2NO2uukW7vthHJI/O6clzH5elLoU
	 7Nyp9EMGnWMEA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v16 21/45] KVM: arm64: CCA: Handle realm enter/exit
In-Reply-To: <20260803134403.80630-22-steven.price@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-22-steven.price@arm.com>
Date: Tue, 04 Aug 2026 14:27:03 +0530
Message-ID: <yq5a5x1q461s.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Steven Price <steven.price@arm.com> writes:

> +	switch (rec->run->exit.exit_reason) {
> +	case RMI_EXIT_SYNC:
> +		/*
> +		 * HPFAR_EL2_NS is hijacked to indicate a valid HPFAR value,
> +		 * see __get_fault_info()
> +		 */
> +		vcpu->arch.fault.hpfar_el2 = rec->run->exit.hpfar | HPFAR_EL2_NS;
> +		rec_exit_sync(vcpu);
> +		return ARM_EXCEPTION_TRAP;
> +	case RMI_EXIT_IRQ:
> +	case RMI_EXIT_FIQ:
> +		return ARM_EXCEPTION_IRQ;
> +	case RMI_EXIT_SERROR:
> +		return ARM_EXCEPTION_EL1_SERROR;
> +	case RMI_EXIT_PSCI:
> +		rec_exit_hvc(vcpu);
> +		kvm_make_request(KVM_REQ_RMI, vcpu);
> +		return ARM_EXCEPTION_TRAP;
> +	case RMI_EXIT_RIPAS_CHANGE:
> +		rec_exit_hvc(vcpu);
> +		return ARM_EXCEPTION_TRAP;
> +	}

Should we handle RMI_EXIT_RIPAS_CHANGE differently? Currently, the call path is:

kvm_rec_exit()
-> RMI_EXIT_RIPAS_CHANGE
-> handle_hvc()
-> kvm_rec_handle_hvc()
-> kvm_prepare_memory_fault_exit()

Could we instead treat RMI_EXIT_RIPAS_CHANGE as a special case and avoid
redirecting it through handle_hvc()? The completion part of the RIPAS
change could still be handled by kvm_rec_handle_request().


-bool kvm_rec_handle_hvc(struct kvm_vcpu *vcpu, int *ret)
+static int rec_exit_ripas_change(struct kvm_vcpu *vcpu)
 {
-	struct realm_rec *rec;
+	struct realm_rec *rec = &vcpu->arch.rec;
 	struct realm *realm;
 	unsigned long base;
 	unsigned long ripas;
 	unsigned long top;
 
-	if (!vcpu_is_rec(vcpu))
-		return false;
-
-	rec = &vcpu->arch.rec;
-	if (rec->run->exit.exit_reason != RMI_EXIT_RIPAS_CHANGE)
-		return false;
-
 	realm = &vcpu->kvm->arch.realm;
 	base = rec->run->exit.ripas_base;
 	top = rec->run->exit.ripas_top;
@@ -89,8 +83,7 @@ bool kvm_rec_handle_hvc(struct kvm_vcpu *vcpu, int *ret)
 			 base, top, ripas);
 		/* Set RMI_REJECT bit */
 		rec->run->enter.flags = REC_ENTER_FLAG_RIPAS_RESPONSE;
-		*ret = -EINVAL;
-		return true;
+		return -EINVAL;
 	}
 
 	/* Exit to VMM, the actual RIPAS change is done on next entry */
@@ -102,8 +95,7 @@ bool kvm_rec_handle_hvc(struct kvm_vcpu *vcpu, int *ret)
 	 * KVM_EXIT_MEMORY_FAULT requires a return code of -EFAULT, see the
 	 * API documentation
 	 */
-	*ret = -EFAULT;
-	return true;
+	return -EFAULT;
 }
 
 int kvm_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret)
@@ -169,8 +161,7 @@ int kvm_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret)
 		kvm_make_request(KVM_REQ_RMI, vcpu);
 		return ARM_EXCEPTION_TRAP;
 	case RMI_EXIT_RIPAS_CHANGE:
-		rec_exit_hvc(vcpu);
-		return ARM_EXCEPTION_TRAP;
+		return rec_exit_ripas_change(vcpu);
 	}
 
 	return rec_exit_fatal(vcpu, "Unsupported Realm exit reason",

-aneesh

