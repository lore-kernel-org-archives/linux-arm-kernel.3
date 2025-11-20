Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D65CF8860
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/S1pK5YZapKMjpMg4WdXuScaXdAILx18F1c2HTlfcU=; b=FlkFvYOS8rRAQy1I6ullmQaoc9
	ths/NnsQMb86ZcnwmJxMjCP1IJIInYXEBO/U6dSvGMbo1KbEQh/7HrRChzTH2SuTf7IqHjrsSIcxd
	mJzPUri9pYxOV4Um1lgKzmrjp3Dd1vND8AOns6TaVyBWLqUBFCxiyrahFW9YaseGkvZdxKGtfPaFm
	CmMpJ5XAaQWfmjNZ16oX6Aj8kJHkKGvmAecmiSSZ75xLxUUzAaaWc2gpWWrXlQC06OeVwDjF0wfmF
	bKTeWVL6s+2MFK6iqwPjTWRD3oXM+1mzCsINioUm2cMNVi4mP+6I9HNeVUfjaxTXw1pL2Y1WEkW/r
	3YHgmfNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5Ho-00000006nix-1NYk;
	Thu, 20 Nov 2025 14:05:24 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5Hl-00000006nhw-1aEb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 14:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1763647521; x=1795183521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i/S1pK5YZapKMjpMg4WdXuScaXdAILx18F1c2HTlfcU=;
  b=rwcb1vsOvKnmw6kuE3aZnJqKtjxbUQO56mo0hiPh8+xshRIUlIkvsDbJ
   l63OERKt/ZPPLtbdzHDFlKtcnFI7R5zWbTQ9s1P85UouEioBNyvsTKUGE
   I4EHbF1zcAbVXVG9Uu9oKlqISgeVuBPcDRV91CiSJ0PFxX6x6zmubR1BH
   QJ/TvRT5UU5wkUSrBTeJmteoUzoHiUVgi6UABPqep20yh9Y+1yNNBEpsU
   Uwh6a/E0iPDNH9WAzYDlJdKQ4ByA+n+LbnWaFycjYi4dLgVrt0zR3jbnG
   TElEGPGPNRYuyvL3okTR2Dca7fKbQzmWUuOAOkfnW7C1PzOwzA+Wq+kt9
   w==;
X-CSE-ConnectionGUID: EzYWF5H3RQ6W/QgoqzmDXA==
X-CSE-MsgGUID: n6TGPi8fQ0e2gPO0YLinmg==
X-IronPort-AV: E=Sophos;i="6.20,213,1758585600"; 
   d="scan'208";a="7249870"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 14:05:21 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:19313]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.53.70:2525] with esmtp (Farcaster)
 id bc3e93a5-8836-4ec4-b25f-7350314ba75e; Thu, 20 Nov 2025 14:05:20 +0000 (UTC)
X-Farcaster-Flow-ID: bc3e93a5-8836-4ec4-b25f-7350314ba75e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Thu, 20 Nov 2025 14:05:20 +0000
Received: from amazon.com (10.1.213.15) by EX19D001UWA001.ant.amazon.com
 (10.13.138.214) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29; Thu, 20 Nov 2025
 14:05:17 +0000
From: Maximilian Dittgen <mdittgen@amazon.de>
To: <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <pbonzini@redhat.com>, <shuah@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <kvm@vger.kernel.org>,
	<mdittgen@amazon.de>, <lilitj@amazon.de>, <sauravsc@amazon.de>,
	<nh-open-source@amazon.com>, Maximilian Dittgen <mdittgen@amazon.com>
Subject: [RFC PATCH 08/13] KVM: arm64: Make per-vCPU vLPI control ioctls atomic
Date: Thu, 20 Nov 2025 15:02:57 +0100
Message-ID: <20251120140305.63515-9-mdittgen@amazon.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251120140305.63515-1-mdittgen@amazon.de>
References: <20251120140305.63515-1-mdittgen@amazon.de>
MIME-Version: 1.0
X-Originating-IP: [10.1.213.15]
X-ClientProxiedBy: EX19D043UWA004.ant.amazon.com (10.13.139.41) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_060521_462289_CB18A966 
X-CRM114-Status: GOOD (  12.56  )
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

Per-vCPU vLPI enable, disable, and query ioctls should finish
reading or writing the state of their target vCPU before
another operation does the same.

Implement a vlpi_toggle_mutex to be acquired whenever
KVM_ENABLE_VCPU_VLPI, KVM_DISABLE_VCPU_VLPI, or
KVM_QUERY_VCPU_VLPI ioctls are handled.

Signed-off-by: Maximilian Dittgen <mdittgen@amazon.com>
---
 arch/arm64/kvm/arm.c          | 3 +++
 arch/arm64/kvm/vgic/vgic-v4.c | 5 +++++
 include/kvm/arm_vgic.h        | 3 +++
 3 files changed, 11 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 180eaa4165e9..c2224664f05e 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1961,6 +1961,7 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 		if (!vcpu)
 			return -EINVAL;
 
+		guard(mutex)(&vcpu->arch.vgic_cpu.vlpi_toggle_mutex);
 		return kvm_vgic_enable_vcpu_vlpi(vcpu);
 	}
 	case KVM_DISABLE_VCPU_VLPI: {
@@ -1974,6 +1975,7 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 		if (!vcpu)
 			return -EINVAL;
 
+		guard(mutex)(&vcpu->arch.vgic_cpu.vlpi_toggle_mutex);
 		return kvm_vgic_disable_vcpu_vlpi(vcpu);
 	}
 	case KVM_QUERY_VCPU_VLPI: {
@@ -1987,6 +1989,7 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 		if (!vcpu)
 			return -EINVAL;
 
+		guard(mutex)(&vcpu->arch.vgic_cpu.vlpi_toggle_mutex);
 		return kvm_vgic_query_vcpu_vlpi(vcpu);
 	}
 	default:
diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index 39fababf2861..b7dbc1789c90 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -325,6 +325,11 @@ int vgic_v4_init(struct kvm *kvm)
 		if (!dist->its_vm.vprop_page)
 			ret = -ENOMEM;
 	}
+
+	/* vLPI toggle mutex */
+	kvm_for_each_vcpu(i, vcpu, kvm)
+		mutex_init(&vcpu->arch.vgic_cpu.vlpi_toggle_mutex);
+
 #endif
 	if (ret)
 		vgic_v4_teardown(kvm);
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 18a49c4b83f8..c9dad0e84c77 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -372,6 +372,9 @@ struct vgic_cpu {
 	u32 rdreg_index;
 	atomic_t syncr_busy;
 
+	/* Ensure atomicity of per-vCPU vLPI enable/disable/query operations */
+	struct mutex vlpi_toggle_mutex;
+
 	/* Contains the attributes and gpa of the LPI pending tables. */
 	u64 pendbaser;
 	/* GICR_CTLR.{ENABLE_LPIS,RWP} */
-- 
2.50.1 (Apple Git-155)




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Christof Hellmis
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


