Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F11EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQNFQGkYKXUyxK2xW+xQ5PHpuYoLcSUmJ0SBk4sWRaw=; b=NGixQwg0+oG+MIOJ9FmR7U+jRF
	OYPcZxQaQ4Oebk7GVx8thA1ZcPSiiT9MkocrEavqlHda3wxZei7R4P20tCJ/G8ceGC4i5/KyUdEOg
	bDv6ZK6aAI/f7osJTGJIqfpme+q/t8P6Xr9A3Ae8+SUaAJjP5D6qSyEiGiiiLvdCL7kamov4FKaIK
	oi5hKVvYbD2dVWgB110jitrl2vMx6mt5UbSUw8609YU3ajcmowuNPf4M//bQgvH0QkRFVv8fP5Azp
	xIWUxbzaycSiUQD3TYyiSxMQJ3Xj20TA4pKxUa2vsUg/QTH+ndZu8aRonUXsguuH2vyKULc3V4REY
	zxUpNDDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnwc-00000001QS5-2P4h;
	Thu, 12 Dec 2024 18:29:50 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZ5-00000001JlH-1f8c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:32 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3862c67763dso407080f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026729; x=1734631529; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rQNFQGkYKXUyxK2xW+xQ5PHpuYoLcSUmJ0SBk4sWRaw=;
        b=fR9iKuy8i6xNPZNCrBxUIunHlwxHfbGEwiQZ13wd5SM9uodl8DptONa+7V6lajOCV7
         Nrj6H/M4k3JfHE0P8MOMHsw/9D6q3od57BedGxc8/B0dBRpLmGtII4O3eRReHIjujUtZ
         efepwVl8SX1gR3khvVQF7g0bbOqS0SmUTu5mFIfaRpf1sVDLe2CSeX/iWeTomUV9b0PW
         q+nSgHpFo3SZ+VxA7Jr6bTaU2b16PdWNxrQ6YBgP6GxchbE4xuQx54DrnGR1hmb+q6b3
         Mlnz8aOxZwwM3WORZmjgbKcO8CgVJ6p9PZSoQl2EXpOnkSsXJiw7QJnP0xUBxi0C4BW4
         S9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026729; x=1734631529;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQNFQGkYKXUyxK2xW+xQ5PHpuYoLcSUmJ0SBk4sWRaw=;
        b=pbDzKsjOVmSb7ENOz61F4gVTiy8gL1/3cB7k3XqGv8/qMXUTIIQbgJCpg4r4Xgl5IC
         +cebTYbg7POuFAvMNtPrnNzIdswBPRZz1ngBkP8oMNUUakZs06EbHGiOIAAdWcBvrkqO
         XgMMLaHmlzvwJ0sIH98vaCTHmR99QNavJzN+tGWqSHCVeqYLPqhsj9Dd/v9vAjxbW5ZY
         zOgTN52EA3h8+odUoIr/wGI5AcsSckGcyONey80Jrz7pPOKL0dOabeMvAFiOUMUxlgH/
         OqKlZhPseVJGujlgn0IixjgLy2/SFXeu7tgyimeTtgyD/28Kj2eNu7IUTPpIuhNwJy/D
         w7+A==
X-Forwarded-Encrypted: i=1; AJvYcCV5QBtsR1kKYLf6DlFsBRtjQHC/q85Q+7Y2XcRhA/IedC6B66GnaDAlun99HPix1W/u4qvXsUnAMzECQTJeLBQA@lists.infradead.org
X-Gm-Message-State: AOJu0YzkeRXyyOk0X4s9ts7+htSVe1bZlmsi0fVdaLuYJwy0MHtmwXfy
	yX6k873cvVT00CCLW/caOvekFPrBydhGptL2tPG8gIyn2Sp7rrwK4OSc5kzVMIFcXdUT/+Vodtt
	DVmaO3BRe8w==
X-Google-Smtp-Source: AGHT+IEzjS9xw7sktl+QWCcIlB5qocD8lZy0X03FhVRyoTWsrcoNyuiGTV3JIHTs+nau+tAF2x1fcfdAg2BCow==
X-Received: from wrqk12.prod.google.com ([2002:a5d:428c:0:b0:385:ed82:2202])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:684:b0:385:f6c7:90c6 with SMTP id ffacd0b85a97d-3878768e976mr3581027f8f.20.1734026729788;
 Thu, 12 Dec 2024 10:05:29 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:46 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-23-smostafa@google.com>
Subject: [RFC PATCH v2 22/58] KVM: arm64: pkvm: Support SCMI power domain
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100531_439716_53714349 
X-CRM114-Status: GOOD (  34.10  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The hypervisor needs to catch power domain changes for devices it owns,
such as the SMMU. Possible reasons:

* Ensure that software and hardware states are consistent. The driver
  does not attempt to modify the state while the device is off.
* Save and restore the device state.
* Enforce dependency between consumers and suppliers. For example ensure
  that endpoints are off before turning the SMMU off, in case a powered
  off SMMU lets DMA through. However this is normally enforced by
  firmware.

Add a SCMI power domain, as the standard method for device power
management on Arm. Other methods can be added to kvm_power_domain later.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/kvm_hyp.h              |   2 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   4 +
 .../arm64/kvm/hyp/include/nvhe/trap_handler.h |   2 +
 arch/arm64/kvm/hyp/nvhe/Makefile              |   2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |   2 +
 arch/arm64/kvm/hyp/nvhe/power/scmi.c          | 231 ++++++++++++++++++
 include/kvm/power_domain.h                    |   7 +
 7 files changed, 249 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/kvm/hyp/nvhe/power/scmi.c

diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index ee85c6dfb504..0257e8e37434 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -119,7 +119,9 @@ void __sve_restore_state(void *sve_pffr, u32 *fpsr, int restore_ffr);
 
 u64 __guest_enter(struct kvm_vcpu *vcpu);
 
+
 bool kvm_host_psci_handler(struct kvm_cpu_context *host_ctxt, u32 func_id);
+bool kvm_host_scmi_handler(struct kvm_cpu_context *host_ctxt);
 
 #ifdef __KVM_NVHE_HYPERVISOR__
 void __noreturn __hyp_do_panic(struct kvm_cpu_context *host_ctxt, u64 spsr,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index e4a94696b10e..4d40c536d26a 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -158,6 +158,8 @@ int pkvm_init_hvc_pd(struct kvm_power_domain *pd,
 		     const struct kvm_power_domain_ops *ops);
 
 int pkvm_host_hvc_pd(u64 device_id, u64 on);
+int pkvm_init_scmi_pd(struct kvm_power_domain *pd,
+		      const struct kvm_power_domain_ops *ops);
 
 /*
  * Register a power domain. When the hypervisor catches power requests from the
@@ -171,6 +173,8 @@ static inline int pkvm_init_power_domain(struct kvm_power_domain *pd,
 		return 0;
 	case KVM_POWER_DOMAIN_HOST_HVC:
 		return pkvm_init_hvc_pd(pd, ops);
+	case KVM_POWER_DOMAIN_ARM_SCMI:
+		return pkvm_init_scmi_pd(pd, ops);
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h b/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h
index 1e6d995968a1..0e6bb92ccdb7 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h
@@ -15,4 +15,6 @@
 #define DECLARE_REG(type, name, ctxt, reg)	\
 				type name = (type)cpu_reg(ctxt, (reg))
 
+void __kvm_hyp_host_forward_smc(struct kvm_cpu_context *host_ctxt);
+
 #endif /* __ARM64_KVM_NVHE_TRAP_HANDLER_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 950d34ba6e50..d846962e7246 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -8,7 +8,7 @@ CFLAGS_switch.nvhe.o += -Wno-override-init
 hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o \
 	 hyp-main.o hyp-smp.o psci-relay.o alloc.o early_alloc.o page_alloc.o \
 	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o \
-	 serial.o alloc_mgt.o iommu/iommu.o power/hvc.o
+	 serial.o alloc_mgt.o iommu/iommu.o power/hvc.o power/scmi.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 5df98bf04ef4..1ab8e5507825 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -1806,6 +1806,8 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
 	handled = kvm_host_psci_handler(host_ctxt, func_id);
 	if (!handled)
 		handled = kvm_host_ffa_handler(host_ctxt, func_id);
+	if (!handled)
+		handled = kvm_host_scmi_handler(host_ctxt);
 	if (!handled && smp_load_acquire(&default_host_smc_handler))
 		handled = default_host_smc_handler(&host_ctxt->regs);
 	if (!handled) {
diff --git a/arch/arm64/kvm/hyp/nvhe/power/scmi.c b/arch/arm64/kvm/hyp/nvhe/power/scmi.c
new file mode 100644
index 000000000000..7de3feb2f1d9
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/power/scmi.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Linaro Ltd.
+ */
+
+#include <linux/bitfield.h>
+
+#include <nvhe/pkvm.h>
+#include <nvhe/mm.h>
+#include <nvhe/mem_protect.h>
+#include <nvhe/trap_handler.h>
+
+/* SCMI protocol */
+#define SCMI_PROTOCOL_POWER_DOMAIN	0x11
+
+/*  shmem registers */
+#define SCMI_SHM_CHANNEL_STATUS		0x4
+#define SCMI_SHM_CHANNEL_FLAGS		0x10
+#define SCMI_SHM_LENGTH			0x14
+#define SCMI_SHM_MESSAGE_HEADER		0x18
+#define SCMI_SHM_MESSAGE_PAYLOAD	0x1c
+
+/*  channel status */
+#define SCMI_CHN_FREE			(1U << 0)
+#define SCMI_CHN_ERROR			(1U << 1)
+
+/*  channel flags */
+#define SCMI_CHN_IRQ			(1U << 0)
+
+/*  message header */
+#define SCMI_HDR_TOKEN			GENMASK(27, 18)
+#define SCMI_HDR_PROTOCOL_ID		GENMASK(17, 10)
+#define SCMI_HDR_MESSAGE_TYPE		GENMASK(9, 8)
+#define SCMI_HDR_MESSAGE_ID		GENMASK(7, 0)
+
+/*  power domain */
+#define SCMI_PD_STATE_SET		0x4
+#define SCMI_PD_STATE_SET_FLAGS		0x0
+#define SCMI_PD_STATE_SET_DOMAIN_ID	0x4
+#define SCMI_PD_STATE_SET_POWER_STATE	0x8
+
+#define SCMI_PD_STATE_SET_STATUS	0x0
+
+#define SCMI_PD_STATE_SET_FLAGS_ASYNC	(1U << 0)
+
+#define SCMI_PD_POWER_ON		0
+#define SCMI_PD_POWER_OFF		(1U << 30)
+
+#define SCMI_SUCCESS			0
+
+
+static struct {
+	u32				smc_id;
+	phys_addr_t			shmem_pfn;
+	size_t				shmem_size;
+	void __iomem			*shmem;
+} scmi_channel;
+
+struct scmi_power_domain {
+	struct kvm_power_domain			*pd;
+	const struct kvm_power_domain_ops	*ops;
+};
+
+static struct scmi_power_domain scmi_power_domains[MAX_POWER_DOMAINS];
+static int scmi_power_domain_count;
+
+#define SCMI_POLL_TIMEOUT_US	1000000 /* 1s! */
+
+/* Forward the command to EL3, and wait for completion */
+static int scmi_run_command(struct kvm_cpu_context *host_ctxt)
+{
+	u32 reg;
+	unsigned long i = 0;
+
+	__kvm_hyp_host_forward_smc(host_ctxt);
+
+	do {
+		reg = readl_relaxed(scmi_channel.shmem + SCMI_SHM_CHANNEL_STATUS);
+		if (reg & SCMI_CHN_FREE)
+			break;
+
+		if (WARN_ON(++i > SCMI_POLL_TIMEOUT_US))
+			return -ETIMEDOUT;
+
+		pkvm_udelay(1);
+	} while (!(reg & (SCMI_CHN_FREE | SCMI_CHN_ERROR)));
+
+	if (reg & SCMI_CHN_ERROR)
+		return -EIO;
+
+	reg = readl_relaxed(scmi_channel.shmem + SCMI_SHM_MESSAGE_PAYLOAD +
+			    SCMI_PD_STATE_SET_STATUS);
+	if (reg != SCMI_SUCCESS)
+		return -EIO;
+
+	return 0;
+}
+
+static void __kvm_host_scmi_handler(struct kvm_cpu_context *host_ctxt)
+{
+	int i;
+	u32 reg;
+	struct scmi_power_domain *scmi_pd = NULL;
+
+	/*
+	 * FIXME: the spec does not really allow for an intermediary filtering
+	 * messages on the channel: as soon as the host clears SCMI_CHN_FREE,
+	 * the server may process the message. It doesn't have to wait for a
+	 * doorbell and could just poll on the shared mem. Unlikely in practice,
+	 * but this code is not correct without a spec change requiring the
+	 * server to observe an SMC before processing the message.
+	 */
+	reg = readl_relaxed(scmi_channel.shmem + SCMI_SHM_CHANNEL_STATUS);
+	if (reg & (SCMI_CHN_FREE | SCMI_CHN_ERROR))
+		return;
+
+	reg = readl_relaxed(scmi_channel.shmem + SCMI_SHM_MESSAGE_HEADER);
+	if (FIELD_GET(SCMI_HDR_PROTOCOL_ID, reg) != SCMI_PROTOCOL_POWER_DOMAIN)
+		goto out_forward_smc;
+
+	if (FIELD_GET(SCMI_HDR_MESSAGE_ID, reg) != SCMI_PD_STATE_SET)
+		goto out_forward_smc;
+
+	reg = readl_relaxed(scmi_channel.shmem + SCMI_SHM_MESSAGE_PAYLOAD +
+			    SCMI_PD_STATE_SET_FLAGS);
+	if (WARN_ON(reg & SCMI_PD_STATE_SET_FLAGS_ASYNC))
+		/* We don't support async requests at the moment */
+		return;
+
+	reg = readl_relaxed(scmi_channel.shmem + SCMI_SHM_MESSAGE_PAYLOAD +
+			    SCMI_PD_STATE_SET_DOMAIN_ID);
+
+	for (i = 0; i < MAX_POWER_DOMAINS; i++) {
+		if (!scmi_power_domains[i].pd)
+			break;
+
+		if (reg == scmi_power_domains[i].pd->arm_scmi.domain_id) {
+			scmi_pd = &scmi_power_domains[i];
+			break;
+		}
+	}
+	if (!scmi_pd)
+		goto out_forward_smc;
+
+	reg = readl_relaxed(scmi_channel.shmem + SCMI_SHM_MESSAGE_PAYLOAD +
+			    SCMI_PD_STATE_SET_POWER_STATE);
+	switch (reg) {
+	case SCMI_PD_POWER_ON:
+		if (scmi_run_command(host_ctxt))
+			break;
+
+		scmi_pd->ops->power_on(scmi_pd->pd);
+		break;
+	case SCMI_PD_POWER_OFF:
+		scmi_pd->ops->power_off(scmi_pd->pd);
+
+		if (scmi_run_command(host_ctxt))
+			scmi_pd->ops->power_on(scmi_pd->pd);
+		break;
+	}
+	return;
+
+out_forward_smc:
+	__kvm_hyp_host_forward_smc(host_ctxt);
+}
+
+bool kvm_host_scmi_handler(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(u64, func_id, host_ctxt, 0);
+
+	if (!scmi_channel.shmem || func_id != scmi_channel.smc_id)
+		return false; /* Unhandled */
+
+	/*
+	 * Prevent the host from modifying the request while it is in flight.
+	 * One page is enough, SCMI messages are smaller than that.
+	 *
+	 * FIXME: the host is allowed to poll the shmem while the request is in
+	 * flight, or read shmem when receiving the SCMI interrupt. Although
+	 * it's unlikely with the SMC-based transport, this too requires some
+	 * tightening in the spec.
+	 */
+	if (WARN_ON(__pkvm_host_add_remove_page(scmi_channel.shmem_pfn, true)))
+		return true;
+
+	__kvm_host_scmi_handler(host_ctxt);
+
+	WARN_ON(__pkvm_host_add_remove_page(scmi_channel.shmem_pfn, false));
+	return true; /* Handled */
+}
+
+int pkvm_init_scmi_pd(struct kvm_power_domain *pd,
+		      const struct kvm_power_domain_ops *ops)
+{
+	int ret;
+
+	if (!IS_ALIGNED(pd->arm_scmi.shmem_base, PAGE_SIZE) ||
+	    pd->arm_scmi.shmem_size < PAGE_SIZE) {
+		return -EINVAL;
+	}
+
+	if (!scmi_channel.shmem) {
+		unsigned long shmem;
+
+		/* FIXME: Do we need to mark those pages shared in the host s2? */
+		ret = __pkvm_create_private_mapping(pd->arm_scmi.shmem_base,
+						    pd->arm_scmi.shmem_size,
+						    PAGE_HYP_DEVICE,
+						    &shmem);
+		if (ret)
+			return ret;
+
+		scmi_channel.smc_id = pd->arm_scmi.smc_id;
+		scmi_channel.shmem_pfn = hyp_phys_to_pfn(pd->arm_scmi.shmem_base);
+		scmi_channel.shmem = (void *)shmem;
+
+	} else if (scmi_channel.shmem_pfn !=
+		   hyp_phys_to_pfn(pd->arm_scmi.shmem_base) ||
+		   scmi_channel.smc_id != pd->arm_scmi.smc_id) {
+		/* We support a single channel at the moment */
+		return -ENXIO;
+	}
+
+	if (scmi_power_domain_count == MAX_POWER_DOMAINS)
+		return -ENOSPC;
+
+	scmi_power_domains[scmi_power_domain_count].pd = pd;
+	scmi_power_domains[scmi_power_domain_count].ops = ops;
+	scmi_power_domain_count++;
+	return 0;
+}
diff --git a/include/kvm/power_domain.h b/include/kvm/power_domain.h
index f6a9c5cdfebb..9ade1d60f5f5 100644
--- a/include/kvm/power_domain.h
+++ b/include/kvm/power_domain.h
@@ -5,12 +5,19 @@
 enum kvm_power_domain_type {
 	KVM_POWER_DOMAIN_NONE,
 	KVM_POWER_DOMAIN_HOST_HVC,
+	KVM_POWER_DOMAIN_ARM_SCMI,
 };
 
 struct kvm_power_domain {
 	enum kvm_power_domain_type	type;
 	union {
 		u64 device_id; /* HOST_HVC device ID*/
+		struct {
+			u32		smc_id;
+			u32		domain_id;
+			phys_addr_t	shmem_base;
+			size_t		shmem_size;
+		} arm_scmi; /*ARM_SCMI channel */
 	};
 };
 
-- 
2.47.0.338.g60cca15819-goog


