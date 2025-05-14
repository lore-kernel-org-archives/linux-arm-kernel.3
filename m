Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEBFC3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DxyHDNYwWFDoPpvVyJKUHKlRBU2ubBL/+PAmuM0YQQ=; b=e0flPOF1IoGz6jGSZYqUzE+LQb
	ze8VOKfaJxEtyfuYF7qFmCHSEulm2M0yp28fAIxHkSwjVxVXQRIW1BBfy8q2yhuEhRWs5d2Zq+/Ep
	FYI9w2+3m4zsdOIeQGJpl2n6vJcZTJBNYSJy0fK6IvABeueQZfsPmqMr1RPv0keN/cSqqIfjldf4W
	3DqrLFQ2ajS8wIQ25Pu5WB9oAVniztx1u1gEbu0UhNWDzs5HjwvAXABWgMR/9UWzUgUQxA85bd97l
	TpODK55ncYvY6pcsKa6RXsSNMya0pCl/xl9FW37veuFc/TWpyZ5hbC87Yff30UCEvhL96WuEa6c2U
	HSZPTxBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB62-0000000F404-0a4G;
	Wed, 14 May 2025 12:20:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF9SA-0000000EnqW-0Pfp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 10:35:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8439E61166;
	Wed, 14 May 2025 10:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5753BC4CEFA;
	Wed, 14 May 2025 10:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747218909;
	bh=vh1PnLqh01yaQsVDCDR6nY6QiSEdl+vmMW6IVytRf4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kKIW8hJwcLKgKdKqARim4AvIqPOa7nkWhKcJaCtk4Q3oD3BP8hhmvoS8u2OgpsgjW
	 Qq2+w9uZTqcKC+TDWO2ETNDNK6EweKvceVyXPUmKEzAy81FK0Vh+LxcpUxIpo0ZEx6
	 M58LBfC9DgWn4ONPECqGjLUPwS7eV5SZewNR2RQ1WUYaHnZT0TUQi8z4LqN7Nh9aMq
	 HMiX3FH/JIp78rZm7/DRT6lUIgIIsIewV7nEQ2Yqs/+DkQaf38PUdQ0V0uT93e0Vz2
	 HVEWPcLRyqw4tQb5YZlyPE7oYGVN+Ez5eE41Sl2U5WSSVqeT2vIqNc/ForbFTSCfqz
	 DrblEr4i4FOQA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uF9S7-00Eos3-KQ;
	Wed, 14 May 2025 11:35:07 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH v4 16/17] KVM: arm64: Allow userspace to request KVM_ARM_VCPU_EL2*
Date: Wed, 14 May 2025 11:34:59 +0100
Message-Id: <20250514103501.2225951-17-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250514103501.2225951-1-maz@kernel.org>
References: <20250514103501.2225951-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Since we're (almost) feature complete, let's allow userspace to
request KVM_ARM_VCPU_EL2* by bumping KVM_VCPU_MAX_FEATURES up.

We also now advertise the features to userspace with new capabilities.

It's going to be great...

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 2 +-
 arch/arm64/kvm/arm.c              | 6 ++++++
 include/uapi/linux/kvm.h          | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index b2c535036a06b..79e175a16d356 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -39,7 +39,7 @@
 
 #define KVM_MAX_VCPUS VGIC_V3_MAX_CPUS
 
-#define KVM_VCPU_MAX_FEATURES 7
+#define KVM_VCPU_MAX_FEATURES 9
 #define KVM_VCPU_VALID_FEATURES	(BIT(KVM_VCPU_MAX_FEATURES) - 1)
 
 #define KVM_REQ_SLEEP \
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 5287435873609..b021ce1e42c5c 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -368,6 +368,12 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_EL1_32BIT:
 		r = cpus_have_final_cap(ARM64_HAS_32BIT_EL1);
 		break;
+	case KVM_CAP_ARM_EL2:
+		r = cpus_have_final_cap(ARM64_HAS_NESTED_VIRT);
+		break;
+	case KVM_CAP_ARM_EL2_E2H0:
+		r = cpus_have_final_cap(ARM64_HAS_HCR_NV1);
+		break;
 	case KVM_CAP_GUEST_DEBUG_HW_BPS:
 		r = get_num_brps();
 		break;
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index b6ae8ad8934b5..c9d4a908976e8 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -930,6 +930,8 @@ struct kvm_enable_cap {
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
 #define KVM_CAP_ARM_WRITABLE_IMP_ID_REGS 239
+#define KVM_CAP_ARM_EL2 240
+#define KVM_CAP_ARM_EL2_E2H0 241
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.39.2


