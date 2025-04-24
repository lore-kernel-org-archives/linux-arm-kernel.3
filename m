Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC91C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98GtKQowyHwUXJ3/oi0BeOIZGrWAP4CATPU0kL4zC8c=; b=XPN3wFJttsaPjR45GRKaxyxreG
	unLnj5tgef6SaYwBxgsmsZu20Eb/sEtCFoIPCaCx9Ny09yuF+bXgdBL0c+vLRZx8najdeg1oGzix/
	lhHAP5jaXni5zGdnA45+lDlRiSiy42ks2vNXo0/wxaPQ/T6SEFSKREAQnhnia+vwDXgTpf6iURZqn
	AV2EDKT7Ax7siKdW02DW4IGrNp459HgApmmmC6tdkM4vADa4IR/Cr+XziSuj03ZQB7Rh//L/3ljqj
	3aWfwtPlO2jMyBXBpnQfW6U/tlEeK7EXP/8qNWMx4Bo7oN/8AhvmUfYTk/k7r9LHa3XOxnkVFhdpe
	xNX/uHLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z5f-0000000Edjm-2x44;
	Thu, 24 Apr 2025 16:06:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xLB-0000000EKmf-3w7b
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 14:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=98GtKQowyHwUXJ3/oi0BeOIZGrWAP4CATPU0kL4zC8c=; b=j9yLekEwg1WL7mlvrgEmPGf1nr
	+oG3JggaN1ZquOKs99L2IaR3j+RIPvjRExkcvOdiB9wQpF2bD2q3kY+n4hFnQbIHPhaLgjC+t4dyb
	Vpre+EsPm55M8O5kI+eNgNtM++yAClV/v5Tq2VeA2z/h2GplzIDiIbu8Cchigzy6r+F3PYVXQ1fRQ
	/kLGG64H2uVJBvIVPPhSr5UCAaa1b/NrDeAzp5ELe4SJVijdN0TcurpbpFOMB2k8EUZbkTJMMt+v/
	S5JRv19etl69ADtl/LnzqdQOhS/iMixzy9bA9X+trkS0KpRJkUs6J3AoFscjN48B6Uzv2PFzMYlq5
	bS5OOG3A==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7xL8-0000000Bpkc-3zAJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:12 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso757031f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504048; x=1746108848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98GtKQowyHwUXJ3/oi0BeOIZGrWAP4CATPU0kL4zC8c=;
        b=FQhY855Hhdn9GcOHYotl81iDLXNrNFJ8+u3mksnmGscDePfYd38Ocg/fOo8Mg/mnwv
         uM0GKNXiyzMdYYpXOWKh4s4W1oKyy4RNZ+9RTCqVx9yKfzrPvmlgatLGgou7HRtiJHuy
         OW+VMWWmslNstZcRM9yRlk0dzzr+4fTzCzZBnSRd8eFTdKh0qKRtlNYZDt8s1bpkLALa
         CAj1RUjfegeFfWeZg3jyCBzMgFJbotuZGx9JWarJmqEmS8R6krE4tIyNjkEVLkJmjeiK
         e9+s11244thbZM1vBcDSeI/TOs0hfPsQHui5WToQr2LD/S8aq28YBfgZ4yjHf9ZUXJFo
         TniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504048; x=1746108848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98GtKQowyHwUXJ3/oi0BeOIZGrWAP4CATPU0kL4zC8c=;
        b=CnjAdw/TNO9zDJQr9Eb0SCzrvrPLaKe1GzUrW2bEyCJ0YJ5pu8Q1B7efC2nCGuuyTe
         sogw8b1CqpfVQoB1QkDNG7oqW8Mxi9IfxeKoWfnPoHJdiwpkxoItKDBAW3bknfVcWs0J
         AocYPXWlbJzkLxniA/7cKfq6DYwhDfZoRP8MpqfQ8CqbHV5OHO6GEAyAsm12marGvNmv
         bZYjX+g1i7KvAuXzO1mAydlTJRKHcioTHNOUcwD1Da3HDyYi35FHWoTmdTspurWA7e/f
         TbZSfmJzkKZrC0+WHxGna1nnEggbgt0kXzhKsbZ01xsk+J+/djefwJo0FrTcK7lNM+g5
         ybhw==
X-Forwarded-Encrypted: i=1; AJvYcCV3LU/6P9W7ooF67LTv7Esdgo1i3q7LYfob2QZVHBOLmHBeZueBAg9HqBIpW2gGs11kQYQOHq3SiLQfvpFjsXG+@lists.infradead.org
X-Gm-Message-State: AOJu0YyPsqLRGDsgE7QtHuR76cr9JFMk+Hg9mhMsYrdh2nugVy2Nznrw
	PusCM9oD3SoFgRvlq8P+97piud4FdgGcWTNFpLm1Axe8kzNGMFlFlBabn9WtOWg=
X-Gm-Gg: ASbGncvyl4lVqUgD4ZLdShz+gYBSB6lds2wfpNhYCDWij5poO4PAPbC5/y9Mei7o9c8
	nhO4eBAR6v6AQXH+GL/QysawdmKVyhOXpPtiw2akrp3YJm3puisuugDwOVRZFsTp4luMVWwOCOp
	UgwECebl2hF/t+QZlL2S5PZyg3M6nVUU4wS3iVDA5q40kPvmEYAkRZKKAihHd+4JNRXHndV1aU1
	/lF4rK3vfQXsFYFZVRoM64JUzeI/z++afn0LcPzF7vLUnsTJwztZ3QfCD1F1GP6iloBlTCIBC+3
	wl65q3aokbtWHLDI8yiPvxYKoypDF7kSf7gaC+uBvsQvjvtH/1PQ9qxYitPNWAC8aGHXycpU1iv
	5BKBGedxO+HeymB1r
X-Google-Smtp-Source: AGHT+IFQAg02MXbpqUbddZDz1Nf5W/i1x6IwVsYQPoOcChQDsuxBB7Db2uzIfhJZTYe0HZGVw3TbTg==
X-Received: by 2002:a05:6000:18ae:b0:39f:cd2:1fa1 with SMTP id ffacd0b85a97d-3a06d647026mr2922759f8f.3.1745504048036;
        Thu, 24 Apr 2025 07:14:08 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:07 -0700 (PDT)
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
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>
Subject: [RFC PATCH 17/34] gunyah: Translate gh_rm_hyp_resource into gunyah_resource
Date: Thu, 24 Apr 2025 15:13:24 +0100
Message-Id: <20250424141341.841734-18-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_151411_139686_C700A90C 
X-CRM114-Status: GOOD (  26.46  )
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

From: Elliot Berman <quic_eberman@quicinc.com>

When booting a Gunyah virtual machine, the host VM may gain capabilities
to interact with resources for the guest virtual machine. Examples of
such resources are vCPUs or message queues. To use those resources, we
need to translate the RM response into a gunyah_resource structure which
are useful to Linux drivers. Presently, Linux drivers need only to know
the type of resource, the capability ID, and an interrupt.

On ARM64 systems, the interrupt reported by Gunyah is the GIC interrupt
ID number and always a SPI or extended SPI.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Reviewed-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/include/asm/gunyah.h | 35 +++++++++++++++++
 drivers/virt/gunyah/rsc_mgr.c   | 68 +++++++++++++++++++++++++++++++++
 include/linux/gunyah.h          |  2 +
 include/linux/gunyah_rsc_mgr.h  |  4 ++
 4 files changed, 109 insertions(+)
 create mode 100644 arch/arm64/include/asm/gunyah.h

diff --git a/arch/arm64/include/asm/gunyah.h b/arch/arm64/include/asm/gunyah.h
new file mode 100644
index 000000000000..29079d1a4df2
--- /dev/null
+++ b/arch/arm64/include/asm/gunyah.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef _ASM_GUNYAH_H
+#define _ASM_GUNYAH_H
+
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+
+static inline int arch_gunyah_fill_irq_fwspec_params(u32 virq,
+						 struct irq_fwspec *fwspec)
+{
+	/* Assume that Gunyah gave us an SPI or ESPI; defensively check it */
+	if (WARN(virq < 32, "Unexpected virq: %d\n", virq)) {
+		return -EINVAL;
+	} else if (virq <= 1019) {
+		fwspec->param_count = 3;
+		fwspec->param[0] = 0; /* GIC_SPI */
+		fwspec->param[1] = virq - 32; /* virq 32 -> SPI 0 */
+		fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
+	} else if (WARN(virq < 4096, "Unexpected virq: %d\n", virq)) {
+		return -EINVAL;
+	} else if (virq < 5120) {
+		fwspec->param_count = 3;
+		fwspec->param[0] = 2; /* GIC_ESPI */
+		fwspec->param[1] = virq - 4096; /* virq 4096 -> ESPI 0 */
+		fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
+	} else {
+		WARN(1, "Unexpected virq: %d\n", virq);
+		return -EINVAL;
+	}
+	return 0;
+}
+#endif
diff --git a/drivers/virt/gunyah/rsc_mgr.c b/drivers/virt/gunyah/rsc_mgr.c
index 75fc86887868..2d34b0ba98b2 100644
--- a/drivers/virt/gunyah/rsc_mgr.c
+++ b/drivers/virt/gunyah/rsc_mgr.c
@@ -9,8 +9,10 @@
 #include <linux/mutex.h>
 #include <linux/notifier.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 
+#include <asm/gunyah.h>
 #include <linux/gunyah_rsc_mgr.h>
 
 /* clang-format off */
@@ -118,6 +120,7 @@ struct gunyah_rm_message {
  * @send_lock: synchronization to allow only one request to be sent at a time
  * @send_ready: completed when we know Tx message queue can take more messages
  * @nh: notifier chain for clients interested in RM notification messages
+ * @parent_fwnode: Parent IRQ fwnode to translate Gunyah hwirqs to Linux irqs
  */
 struct gunyah_rm {
 	struct device *dev;
@@ -133,6 +136,8 @@ struct gunyah_rm {
 	struct mutex send_lock;
 	struct completion send_ready;
 	struct blocking_notifier_head nh;
+
+	struct fwnode_handle *parent_fwnode;
 };
 
 /* Global resource manager instance */
@@ -177,6 +182,53 @@ static inline int gunyah_rm_error_remap(enum gunyah_rm_error rm_error)
 	}
 }
 
+struct gunyah_resource *
+gunyah_rm_alloc_resource(struct gunyah_rm *rm,
+			 struct gunyah_rm_hyp_resource *hyp_resource)
+{
+	struct gunyah_resource *ghrsc;
+	int ret;
+
+	ghrsc = kzalloc(sizeof(*ghrsc), GFP_KERNEL);
+	if (!ghrsc)
+		return NULL;
+
+	ghrsc->type = hyp_resource->type;
+	ghrsc->capid = le64_to_cpu(hyp_resource->cap_id);
+	ghrsc->irq = IRQ_NOTCONNECTED;
+	ghrsc->rm_label = le32_to_cpu(hyp_resource->resource_label);
+	if (hyp_resource->virq) {
+		struct irq_fwspec fwspec;
+
+
+		fwspec.fwnode = rm->parent_fwnode;
+		ret = arch_gunyah_fill_irq_fwspec_params(le32_to_cpu(hyp_resource->virq), &fwspec);
+		if (ret) {
+			dev_err(rm->dev,
+				"Failed to translate interrupt for resource %d label: %d: %d\n",
+				ghrsc->type, ghrsc->rm_label, ret);
+		}
+
+		ret = irq_create_fwspec_mapping(&fwspec);
+		if (ret < 0) {
+			dev_err(rm->dev,
+				"Failed to allocate interrupt for resource %d label: %d: %d\n",
+				ghrsc->type, ghrsc->rm_label, ret);
+			kfree(ghrsc);
+			return NULL;
+		}
+		ghrsc->irq = ret;
+	}
+
+	return ghrsc;
+}
+
+void gunyah_rm_free_resource(struct gunyah_resource *ghrsc)
+{
+	irq_dispose_mapping(ghrsc->irq);
+	kfree(ghrsc);
+}
+
 static int gunyah_rm_init_message_payload(struct gunyah_rm_message *message,
 					  const void *msg, size_t hdr_size,
 					  size_t msg_size)
@@ -676,6 +728,7 @@ static int gunyah_rm_probe_rx_msgq(struct gunyah_rm *rm,
 
 static int gunyah_rm_probe(struct platform_device *pdev)
 {
+	struct device_node *parent_irq_node;
 	int ret;
 
 	gunyah_rm = devm_kzalloc(&pdev->dev, sizeof(*gunyah_rm), GFP_KERNEL);
@@ -695,6 +748,21 @@ static int gunyah_rm_probe(struct platform_device *pdev)
 	ret = gunyah_rm_probe_tx_msgq(gunyah_rm, pdev);
 	if (ret)
 		return ret;
+
+	parent_irq_node = of_irq_find_parent(pdev->dev.of_node);
+	if (!parent_irq_node) {
+		dev_err(&pdev->dev,
+			"Failed to find interrupt parent of resource manager\n");
+		return -ENODEV;
+	}
+
+	gunyah_rm->parent_fwnode = of_node_to_fwnode(parent_irq_node);
+	if (!gunyah_rm->parent_fwnode) {
+		dev_err(&pdev->dev,
+			"Failed to find interrupt parent domain of resource manager\n");
+		return -ENODEV;
+	}
+
 	/* assume RM is ready to receive messages from us */
 	complete(&gunyah_rm->send_ready);
 
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 1f4389eb21fb..40ea21b17195 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -35,6 +35,8 @@ struct gunyah_resource {
 	enum gunyah_resource_type type;
 	u64 capid;
 	unsigned int irq;
+
+	u32 rm_label;
 };
 
 /**
diff --git a/include/linux/gunyah_rsc_mgr.h b/include/linux/gunyah_rsc_mgr.h
index 294e847c27ed..c0fe516d54a8 100644
--- a/include/linux/gunyah_rsc_mgr.h
+++ b/include/linux/gunyah_rsc_mgr.h
@@ -97,6 +97,10 @@ struct gunyah_rm_hyp_resources {
 
 int gunyah_rm_get_hyp_resources(struct gunyah_rm *rm, u16 vmid,
 				struct gunyah_rm_hyp_resources **resources);
+struct gunyah_resource *
+gunyah_rm_alloc_resource(struct gunyah_rm *rm,
+			 struct gunyah_rm_hyp_resource *hyp_resource);
+void gunyah_rm_free_resource(struct gunyah_resource *ghrsc);
 
 int gunyah_rm_call(struct gunyah_rm *rsc_mgr, u32 message_id,
 		   const void *req_buf, size_t req_buf_size, void **resp_buf,
-- 
2.39.5


