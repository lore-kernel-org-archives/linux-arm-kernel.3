Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892A2C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvSif0ZiFcbo45REElIUdI7xtRbISNuAr1Y97HbCqdI=; b=HeHs5YDTY8Gh0vuEA04+1Ac/nE
	8uFbLOofJhWsvLZN+RaKqTShdzOXSi1UvfCtafqPFdH2in039ihg88WzxUarP4EJW54cNx+2gygJt
	rPeJIlCYq7BZ96mR4SBYT8IrjCbxbR+CZg58IKOJeErgtjeTVOL/IyYEuc0SsQQHqtbZa2EwYdQ4C
	7iZwMKekz5cj0vDKHRemkrtFykFncN4HcFJlxyfK8HEfgyi+e2YPLMZuYQiJn2PURrqD+uYUw2Skv
	GvuXtja78a5ypDqD0a4hoqTbJgbJPCECpwqlQpdNSAltYy567DsQrbZgQiYD2D/pKcctZ5zWRorpr
	9yBAnvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z54-0000000EcwF-2qxf;
	Thu, 24 Apr 2025 16:05:42 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xKr-0000000EKdi-2DRH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:13:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so17270835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504031; x=1746108831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvSif0ZiFcbo45REElIUdI7xtRbISNuAr1Y97HbCqdI=;
        b=zLBK1PpSEmnIfWGaXThNbeJ2jJfpmWHvkgwto8vfFZ+07+PiXrbTESkXZQQhXrU1NK
         QrsdMC5TIuEm2ltjwo06MmyuCuwWlgRB8/Lq/Yw6hPchN1tg9XwtYGotX9zc+NrBBRk/
         c0AVaD5OiWfPnMbpvbLBf+ZLfmMBIqqbe+HR2HOd7l3sOaruvV7DWxyOGNP+q/jkrfu2
         +jvl2zLvr5zfF5JZKsUklBOLn+3PP7xKX9aNb5FPyhj2juiUAbrW3Fr4I1M19m4J9cRh
         07Zq5UmKuom9Mm3xs2kd4b55W9eJs4jsk8egBp/i59yQb92yve/ac2K/pA3Yly9cYE6L
         i0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504031; x=1746108831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvSif0ZiFcbo45REElIUdI7xtRbISNuAr1Y97HbCqdI=;
        b=JqS8Br4BUdZEdpK4ym/PaL3EhLoEdw7lI2Qm0AlotV0EGlKACQk6BRIpImSRo+cdQ+
         WUJJa2MOfMZ2Z9LUkz4drQ8tww7ETWIRBIZM5fLAKeiov/Ddj1aZdmF80Aw1O8R0zhdp
         6oh4PN6jOMsg3xTwq+6h6W/MKtkGjqt4dIVh9yZWR8ndP4QI+l92DdVzSvyZZ0NrSH4v
         /+XPwaKNEyxtlZl0dqUDfYKqEEmguKJnhyc+FVAU5LpnAlEJm3ljYzfKrf04RZjRYWER
         ZpyAFgdhfDPxUH5Ciut8KqGKAw9TpzokMcOrZEplGIeXLqvvZ1CJk8LEOTzFvPUZuLuV
         UNkA==
X-Forwarded-Encrypted: i=1; AJvYcCUJOAh+M2BRSkIYD9SUc46qp471zDoj1gzs1pYjPH8qQiBYlObSjqnnbzb81x8KYZ6heRyJD7kzguh9Ua0CMzJg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0HAYhpNYjHuOc2chiigIrEEylTUGg0c+tQ91y3GBDglqVwB2J
	issR+WjSCQEdOG7jrLHBfhhEDFuQsdchZ8er5o900z/+TnXlxH82BHzlmwtVyeA=
X-Gm-Gg: ASbGnct/AkqYmFUksqQxcEA+1Dp5W6aezVXAYoN2o/SAHoRHAQlscWpyIWVe/X3NpH3
	+OypxSO9P7QxCwHdNq/6qOeun4CZm6o5hZlRilAQZrzs3WFafIyrB/Rpk0tyUrfUa7RVk/yGIVE
	/xbDUCxxgXpDwrYaqh4ZzxfmC8sYtyD2kvfbzp6zlmg4PgniEfDXLw5x6htQ2xbz1cz1GAyxxAa
	5qT1ma2+i+SeKWULPiw0yIHaX8N8AbR4h1GCmOxIQG+pj3d0cvFyiyu6xpit/7an1R87rC7Hi4X
	nAQ48WUQU8Wzk2WgMjyb/R0wb0yhcx5rgAsNdigmQOOWQqkmLdm5vRY1zsaaW1igzhmxxdBAGWe
	Un0Kmq3UBg51ffiYt
X-Google-Smtp-Source: AGHT+IGs6TOHidyOdLjO/aiH4v937+mffmDnW0sidZAyNfcPHTexYT+C0CxkEqdPf2DwJcaHqEXYnw==
X-Received: by 2002:adf:ebcc:0:b0:39c:1efb:eec9 with SMTP id ffacd0b85a97d-3a06d673778mr1956533f8f.13.1745504031472;
        Thu, 24 Apr 2025 07:13:51 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:51 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [RFC PATCH 05/34] KVM: Add KVM_SET_DTB_ADDRESS ioctl to pass guest DTB address from userspace
Date: Thu, 24 Apr 2025 15:13:12 +0100
Message-Id: <20250424141341.841734-6-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071353_567548_61D5462A 
X-CRM114-Status: GOOD (  19.32  )
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

Some hypervisors, such as Gunyah, require access to the guest's
device tree blob (DTB) in order to inspect and/or modify it before
starting the guest. The userspace virtual machine monitor (e.g. QEMU)
is responsible for loading the guest's DTB into memory at a guest
physical address, but the hypervisor backend must be informed of that
address and size.

To support this use case, introduce a new ioctl: KVM_SET_DTB_ADDRESS.
This allows userspace to provide the guest physical address and size
of the DTB via a `struct kvm_dtb`, which is now stored in `struct kvm`.

The ioctl allows platform-specific backends like Gunyah to retrieve
the DTB location when configuring the VM.

This patch also increments the KVM API version to 13 to reflect the
addition of this new ioctl.

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 include/linux/kvm_host.h |  1 +
 include/uapi/linux/kvm.h | 14 ++++++++++----
 virt/kvm/kvm_main.c      |  8 ++++++++
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3461346b37e0..4e98c7cad2bd 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -862,6 +862,7 @@ struct kvm {
 	/* Protected by slots_locks (for writes) and RCU (for reads) */
 	struct xarray mem_attr_array;
 #endif
+	struct kvm_dtb dtb;
 	char stats_id[KVM_STATS_NAME_SIZE];
 };
 
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index c6988e2c68d5..8f8161cd61a7 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -14,7 +14,7 @@
 #include <linux/ioctl.h>
 #include <asm/kvm.h>
 
-#define KVM_API_VERSION 12
+#define KVM_API_VERSION 13
 
 /*
  * Backwards-compatible definitions.
@@ -43,6 +43,11 @@ struct kvm_userspace_memory_region2 {
 	__u64 pad2[14];
 };
 
+struct kvm_dtb {
+	__u64 guest_phys_addr;
+	__u64 size;
+};
+
 /*
  * The bit 0 ~ bit 15 of kvm_userspace_memory_region::flags are visible for
  * userspace, other bits are reserved for kvm internal use which are defined
@@ -1190,11 +1195,12 @@ struct kvm_vfio_spapr_tce {
 #define KVM_SET_IDENTITY_MAP_ADDR _IOW(KVMIO,  0x48, __u64)
 #define KVM_SET_USER_MEMORY_REGION2 _IOW(KVMIO, 0x49, \
 					 struct kvm_userspace_memory_region2)
+#define KVM_SET_DTB_ADDRESS      _IOW(KVMIO, 0x50, struct kvm_dtb)
 
 /* enable ucontrol for s390 */
-#define KVM_S390_UCAS_MAP        _IOW(KVMIO, 0x50, struct kvm_s390_ucas_mapping)
-#define KVM_S390_UCAS_UNMAP      _IOW(KVMIO, 0x51, struct kvm_s390_ucas_mapping)
-#define KVM_S390_VCPU_FAULT	 _IOW(KVMIO, 0x52, unsigned long)
+#define KVM_S390_UCAS_MAP        _IOW(KVMIO, 0x55, struct kvm_s390_ucas_mapping)
+#define KVM_S390_UCAS_UNMAP      _IOW(KVMIO, 0x56, struct kvm_s390_ucas_mapping)
+#define KVM_S390_VCPU_FAULT	 _IOW(KVMIO, 0x57, unsigned long)
 
 /* Device model IOC */
 #define KVM_CREATE_IRQCHIP        _IO(KVMIO,   0x60)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index dbb7ed95523f..a984051e2470 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5121,6 +5121,14 @@ static long kvm_vm_ioctl(struct file *filp,
 		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
 		break;
 	}
+	case KVM_SET_DTB_ADDRESS: {
+		r = 0;
+		if (copy_from_user(&kvm->dtb, argp, sizeof(struct kvm_dtb))) {
+			r = -EFAULT;
+			goto out;
+		}
+		break;
+	}
 	case KVM_GET_DIRTY_LOG: {
 		struct kvm_dirty_log log;
 
-- 
2.39.5


