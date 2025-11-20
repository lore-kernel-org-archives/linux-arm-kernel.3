Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93A0CF8860
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfqKJfrocFCotJ0w2MXbh9V8T/H1xPhczpXuKuEYt1A=; b=yb614FX+TAIPYYl1dVPQZBC4L1
	RG1Zy/EpoAT24tfolUXQ5T411AuTSQiGTL2GeYQsJk/CbSdADokjv34CW1HZxqMVTnXei82XIH4+d
	wOR9A8iV82nW7Wa/o0bxUY10FrpGwC/EKhe27IdQ8WRlMyg5pEP3Be0kUCGzgRA+wd7BGMKdLi4SV
	TeBeDHiacG21l72pQb5QHsyWjOy5s/9ESOvIWimZ76RoWxbWXoIr1XCjuEOk5SXR8XT1Z+TL9TcHG
	TQl5xLE9Eyn0Fy/OX+sCBCOvhxygUSIV/PoB+DjnQawLevVji3lnfF05vcm0j7dykXI0cGAyAEGDO
	rrSAi2cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5Gr-00000006nJ8-2L02;
	Thu, 20 Nov 2025 14:04:25 +0000
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.12.53.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5Go-00000006nHg-3hmC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 14:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1763647462; x=1795183462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UfqKJfrocFCotJ0w2MXbh9V8T/H1xPhczpXuKuEYt1A=;
  b=rqutX890UozNwerOkqVnN6mZJ0JtZ3OVhHe5rnKU1BdMREVa89NHuRx5
   Cee4azXzmbeB6a3DJilzt4H48bUPTBJ65TCxGy9h+VADnQTsaIOjaW4qP
   wtDyFEve2tbLHW1/yq2QDaVNsYEUh62s/KfWekDeff2BwYw9ypyBUbnrW
   7GBl6SmZSGTtDSTIl7KaXUpr93FS5I4azkAalNGi1wqpxU3Q0H9vNTwgT
   7l3qQwm/zApxW98AWJUI0c7vyEnxAxSXIRdggJs1ejWmukRdYeXWSvRN0
   nfdQF7GJW/dsRUxepYiuZ1xqCT7NTVBc44vbgVMupeqWxxybntbTdkHRF
   g==;
X-CSE-ConnectionGUID: v75K3nozTkabLQBGwgEkgQ==
X-CSE-MsgGUID: QEh0uMF7RxGlsKxF+l6ZPg==
X-IronPort-AV: E=Sophos;i="6.20,213,1758585600"; 
   d="scan'208";a="7310715"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 14:04:18 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:3019]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.19:2525] with esmtp (Farcaster)
 id a18503df-0779-4b42-9ac7-24839b6decf4; Thu, 20 Nov 2025 14:04:18 +0000 (UTC)
X-Farcaster-Flow-ID: a18503df-0779-4b42-9ac7-24839b6decf4
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Thu, 20 Nov 2025 14:04:17 +0000
Received: from amazon.com (10.1.213.15) by EX19D001UWA001.ant.amazon.com
 (10.13.138.214) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29; Thu, 20 Nov 2025
 14:04:15 +0000
From: Maximilian Dittgen <mdittgen@amazon.de>
To: <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <pbonzini@redhat.com>, <shuah@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <kvm@vger.kernel.org>,
	<mdittgen@amazon.de>, <lilitj@amazon.de>, <sauravsc@amazon.de>,
	<nh-open-source@amazon.com>, Maximilian Dittgen <mdittgen@amazon.com>
Subject: [RFC PATCH 04/13] KVM: arm64: Implement vLPI QUERY ioctl for per-vCPU vLPI injection API
Date: Thu, 20 Nov 2025 15:02:53 +0100
Message-ID: <20251120140305.63515-5-mdittgen@amazon.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251120140305.63515-1-mdittgen@amazon.de>
References: <20251120140305.63515-1-mdittgen@amazon.de>
MIME-Version: 1.0
X-Originating-IP: [10.1.213.15]
X-ClientProxiedBy: EX19D046UWB004.ant.amazon.com (10.13.139.164) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_060422_974403_C27F4311 
X-CRM114-Status: GOOD (  14.41  )
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

Implement kvm_vgic_query_vcpu_vlpi, which handles the KVM_QUERY_VCPU_VLPI
ioctl to query whether a vCPU is currently initialized to handle LPIs via
direct vLPI injection. This function checks whether the vCPU's entry in
the VM's vPE array is populated.

Signed-off-by: Maximilian Dittgen <mdittgen@amazon.com>
---
 arch/arm64/kvm/arm.c          | 13 +++++++++++--
 arch/arm64/kvm/vgic/vgic-v4.c | 15 +++++++++++++++
 arch/arm64/kvm/vgic/vgic.h    |  1 +
 include/linux/kvm_host.h      | 11 +++++++++++
 4 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 31db3ccb3296..afb04162e0cf 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1959,8 +1959,17 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 		return -ENOSYS;
 	}
 	case KVM_QUERY_VCPU_VLPI: {
-		/* TODO: create ioctl handler function */
-		return -ENOSYS;
+		int vcpu_id;
+		struct kvm_vcpu *vcpu;
+
+		if (copy_from_user(&vcpu_id, argp, sizeof(vcpu_id)))
+			return -EFAULT;
+
+		vcpu = kvm_get_vcpu_by_id(kvm, vcpu_id);
+		if (!vcpu)
+			return -EINVAL;
+
+		return kvm_vgic_query_vcpu_vlpi(vcpu);
 	}
 	default:
 		return -EINVAL;
diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index 4a1825a1a5d7..cebcb9175572 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -617,3 +617,18 @@ void kvm_vgic_v4_unset_forwarding(struct kvm *kvm, int host_irq)
 	raw_spin_unlock_irqrestore(&irq->irq_lock, flags);
 	vgic_put_irq(kvm, irq);
 }
+
+/* query whether vLPI direct injection is enabled on a specific vCPU.
+ * return 0 if disabled, 1 if enabled, -EINVAL if vCPU non-existant or GIC
+ * uninitialized
+ */
+int kvm_vgic_query_vcpu_vlpi(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+	struct vgic_dist *dist = &kvm->arch.vgic;
+	int i = kvm_idx_from_vcpu(kvm, vcpu);
+
+	if (i == UINT_MAX || !dist->its_vm.vpes)
+		return -EINVAL; /* vCPU non-existant or uninitialized */
+	return dist->its_vm.vpes[i] != NULL;
+}
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 99894806a4e9..295088913c26 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -468,5 +468,6 @@ int vgic_its_debug_init(struct kvm_device *dev);
 void vgic_its_debug_destroy(struct kvm_device *dev);
 
 bool kvm_per_vcpu_vlpi_supported(void);
+int kvm_vgic_query_vcpu_vlpi(struct kvm_vcpu *vcpu);
 
 #endif
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 5bd76cf394fa..bc7001f8c5dd 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1030,6 +1030,17 @@ static inline struct kvm_vcpu *kvm_get_vcpu_by_id(struct kvm *kvm, int id)
 	return NULL;
 }
 
+static inline unsigned int kvm_idx_from_vcpu(struct kvm *kvm, struct kvm_vcpu *target_vcpu)
+{
+	struct kvm_vcpu *vcpu;
+	unsigned long i;
+
+	kvm_for_each_vcpu(i, vcpu, kvm)
+		if (vcpu == target_vcpu)
+			return i;
+	return UINT_MAX;
+}
+
 void kvm_destroy_vcpus(struct kvm *kvm);
 
 int kvm_trylock_all_vcpus(struct kvm *kvm);
-- 
2.50.1 (Apple Git-155)




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Christof Hellmis
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


