Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A959CC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 00:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qu1B0vc7yWbsW+rKAINzGAVsuBa1AMOLkrNMvFT9P3s=; b=aots8v0YDSr5KlIx0cILZ58+fj
	HP2ppSUloYRPTWbxNeVTmmgZJcca7IZXePNWwdUryZxguso1L5b8/WVY8OA+ZdxA2f8HDPkNFP67c
	mSE3U85EXQ7oXqDlYe4yPOoccQFyWx0n1lP6AmloB7xWMiA1ZE9xTKPZsfH4pPtOMx1296faQ7htG
	2vME7+bGC6X4NjD6tfz7B5DDIwGkXXCbggZFPntwHb8vC6gfvs/tVN+U/Qrxzp074v4jYGr5qTF4D
	v9Yu4I79XngWqqOp+16ZLed7F6XYGi1/2FMCpephJUqw1fR86aE1m9QEw+oUHGv/9CX4j5vsFombh
	5irXUiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNhOg-00000001BOV-1H4U;
	Sat, 07 Jun 2025 00:26:54 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvc-000000019Es-3wso
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:54 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-740270e168aso2079352b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 16:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254212; x=1749859012; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu1B0vc7yWbsW+rKAINzGAVsuBa1AMOLkrNMvFT9P3s=;
        b=CS/05qOlQkH8eyPZTChR5ohwl9fKMup+0et3gUvVwXQF5olwFNPmsmut6l7UNF/3t+
         Q6WPv+mtIUsS2fGydWyFFx2Qz2LXoKxluOYufK3cYqzxEhVtDHbpy/2O++PxdK6YpwPZ
         A3B/QeAzVjRcs7faHb2Ek+hjfhNQvGkv5th6GPqm/fZdFEa0WjbwyyN/uOBnqrmLKtOX
         6WURpLOznUN23twsBHm6viSGfQxV3gl4tcAhUKpGmjlL4fO5GJEW+FCAreszXB9DPsJZ
         TLoMlV5+Bh70B2ITXc16VQd1KZa70YkurZ5LBj94Cb0qrPMiV1xMcbDpU07xFyn4patD
         lJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254212; x=1749859012;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu1B0vc7yWbsW+rKAINzGAVsuBa1AMOLkrNMvFT9P3s=;
        b=aKkFhoejutagJ4FhfU+3fafRoBoQMfdyIRhdX17K7tueDsVHOkGfKw2Ek0PPeOdK/m
         hTpZUBukK/LF0QMll2Tm64yl1SVzqFsj8msAg4lstue1BwEXXk0zDXRbRN433Emr2zYG
         TIGO12sIfxZOsQzVWmtoO3xKPrN0J3U+RPZY3xhC+Yq0nu5BRcxTAQNQfR/+ZmH6fnTq
         hrHA1ejHFNCIEN+aFqeu2COV0xconNnAiQUE8/5CBQZ6MUY5OZ9qU+lfWezjLK6IsLmD
         53171EV4ASwUJbxqnKzUhka69WUIECygQeUT2flgr5ZhvDrSY722mYK8bP0MzNwhVClo
         BQUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3ZkcWszxSJJaQ2pB2AHDL/utohQjB9gnaEMlFDMlJnHYoQlDuaet9ibRhTQHAyuzw+QOAlrlXgCM4CI+jamE5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2nd7bQMYSBJ4SvIhy7QbjwsAy+GqdUt3lhR6A9HQ2cC28u9Hc
	rXMAB94JXo6DF6rnlrKRQhi1IhNpbfucqTXR6RTtxCvM3Lku6rBduzwHFAEVcNt6PLnjvn78vL5
	u5ttLq1H4QQ==
X-Google-Smtp-Source: AGHT+IE9Z9v/BE8RbJx8HxWBNlBZkwC9QUKC5wtM41pIlGUzD9tGi9yGCVQWA834njnwpPNlSWj8ZpkvvF9W
X-Received: from pfbhw18.prod.google.com ([2002:a05:6a00:8912:b0:748:8e9:968e])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:69b:b0:21a:de8e:5cc3
 with SMTP id adf61e73a8af0-21ee24cbf1bmr6832335637.4.1749254211881; Fri, 06
 Jun 2025 16:56:51 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:17 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-14-vipinsh@google.com>
Subject: [PATCH v2 13/15] KVM: selftests: Add arm64 auto generated test files
 for KVM Selftests Runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165652_984070_C11FE49A 
X-CRM114-Status: GOOD (  11.83  )
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

Add auto generated test files for ARM platform.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/kvm/tests/arch_timer/default.test        | 1 +
 .../selftests/kvm/tests/arm64/aarch32_id_regs/default.test       | 1 +
 .../selftests/kvm/tests/arm64/arch_timer_edge_cases/default.test | 1 +
 .../selftests/kvm/tests/arm64/debug-exceptions/default.test      | 1 +
 tools/testing/selftests/kvm/tests/arm64/hypercalls/default.test  | 1 +
 tools/testing/selftests/kvm/tests/arm64/mmio_abort/default.test  | 1 +
 tools/testing/selftests/kvm/tests/arm64/no-vgic-v3/default.test  | 1 +
 .../selftests/kvm/tests/arm64/page_fault_test/default.test       | 1 +
 tools/testing/selftests/kvm/tests/arm64/psci_test/default.test   | 1 +
 tools/testing/selftests/kvm/tests/arm64/set_id_regs/default.test | 1 +
 .../testing/selftests/kvm/tests/arm64/smccc_filter/default.test  | 1 +
 .../selftests/kvm/tests/arm64/vcpu_width_config/default.test     | 1 +
 tools/testing/selftests/kvm/tests/arm64/vgic_init/default.test   | 1 +
 tools/testing/selftests/kvm/tests/arm64/vgic_irq/default.test    | 1 +
 .../selftests/kvm/tests/arm64/vgic_lpi_stress/default.test       | 1 +
 .../selftests/kvm/tests/arm64/vpmu_counter_access/default.test   | 1 +
 tools/testing/selftests/kvm/tests/get-reg-list/default.test      | 1 +
 17 files changed, 17 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/tests/arch_timer/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/aarch32_id_regs/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/arch_timer_edge_cases/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/debug-exceptions/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/hypercalls/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/mmio_abort/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/no-vgic-v3/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/page_fault_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/psci_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/set_id_regs/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/smccc_filter/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/vcpu_width_config/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/vgic_init/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/vgic_irq/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/vgic_lpi_stress/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/vpmu_counter_access/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/get-reg-list/default.test

diff --git a/tools/testing/selftests/kvm/tests/arch_timer/default.test b/tools/testing/selftests/kvm/tests/arch_timer/default.test
new file mode 100644
index 000000000000..97cac72515e2
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arch_timer/default.test
@@ -0,0 +1 @@
+arch_timer
diff --git a/tools/testing/selftests/kvm/tests/arm64/aarch32_id_regs/default.test b/tools/testing/selftests/kvm/tests/arm64/aarch32_id_regs/default.test
new file mode 100644
index 000000000000..e9dc42eacb27
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/aarch32_id_regs/default.test
@@ -0,0 +1 @@
+arm64/aarch32_id_regs
diff --git a/tools/testing/selftests/kvm/tests/arm64/arch_timer_edge_cases/default.test b/tools/testing/selftests/kvm/tests/arm64/arch_timer_edge_cases/default.test
new file mode 100644
index 000000000000..ebc7f45fab7e
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/arch_timer_edge_cases/default.test
@@ -0,0 +1 @@
+arm64/arch_timer_edge_cases
diff --git a/tools/testing/selftests/kvm/tests/arm64/debug-exceptions/default.test b/tools/testing/selftests/kvm/tests/arm64/debug-exceptions/default.test
new file mode 100644
index 000000000000..dc427a64e1cd
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/debug-exceptions/default.test
@@ -0,0 +1 @@
+arm64/debug-exceptions
diff --git a/tools/testing/selftests/kvm/tests/arm64/hypercalls/default.test b/tools/testing/selftests/kvm/tests/arm64/hypercalls/default.test
new file mode 100644
index 000000000000..628731a70178
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/hypercalls/default.test
@@ -0,0 +1 @@
+arm64/hypercalls
diff --git a/tools/testing/selftests/kvm/tests/arm64/mmio_abort/default.test b/tools/testing/selftests/kvm/tests/arm64/mmio_abort/default.test
new file mode 100644
index 000000000000..94e2aef05572
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/mmio_abort/default.test
@@ -0,0 +1 @@
+arm64/mmio_abort
diff --git a/tools/testing/selftests/kvm/tests/arm64/no-vgic-v3/default.test b/tools/testing/selftests/kvm/tests/arm64/no-vgic-v3/default.test
new file mode 100644
index 000000000000..5fa28e3d6f9c
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/no-vgic-v3/default.test
@@ -0,0 +1 @@
+arm64/no-vgic-v3
diff --git a/tools/testing/selftests/kvm/tests/arm64/page_fault_test/default.test b/tools/testing/selftests/kvm/tests/arm64/page_fault_test/default.test
new file mode 100644
index 000000000000..dbf95af263d8
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/page_fault_test/default.test
@@ -0,0 +1 @@
+arm64/page_fault_test
diff --git a/tools/testing/selftests/kvm/tests/arm64/psci_test/default.test b/tools/testing/selftests/kvm/tests/arm64/psci_test/default.test
new file mode 100644
index 000000000000..1cbe0cee5277
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/psci_test/default.test
@@ -0,0 +1 @@
+arm64/psci_test
diff --git a/tools/testing/selftests/kvm/tests/arm64/set_id_regs/default.test b/tools/testing/selftests/kvm/tests/arm64/set_id_regs/default.test
new file mode 100644
index 000000000000..e305642fda26
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/set_id_regs/default.test
@@ -0,0 +1 @@
+arm64/set_id_regs
diff --git a/tools/testing/selftests/kvm/tests/arm64/smccc_filter/default.test b/tools/testing/selftests/kvm/tests/arm64/smccc_filter/default.test
new file mode 100644
index 000000000000..98dd986522a1
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/smccc_filter/default.test
@@ -0,0 +1 @@
+arm64/smccc_filter
diff --git a/tools/testing/selftests/kvm/tests/arm64/vcpu_width_config/default.test b/tools/testing/selftests/kvm/tests/arm64/vcpu_width_config/default.test
new file mode 100644
index 000000000000..d00fd74341ac
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/vcpu_width_config/default.test
@@ -0,0 +1 @@
+arm64/vcpu_width_config
diff --git a/tools/testing/selftests/kvm/tests/arm64/vgic_init/default.test b/tools/testing/selftests/kvm/tests/arm64/vgic_init/default.test
new file mode 100644
index 000000000000..7835ba6157b5
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/vgic_init/default.test
@@ -0,0 +1 @@
+arm64/vgic_init
diff --git a/tools/testing/selftests/kvm/tests/arm64/vgic_irq/default.test b/tools/testing/selftests/kvm/tests/arm64/vgic_irq/default.test
new file mode 100644
index 000000000000..387612d50530
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/vgic_irq/default.test
@@ -0,0 +1 @@
+arm64/vgic_irq
diff --git a/tools/testing/selftests/kvm/tests/arm64/vgic_lpi_stress/default.test b/tools/testing/selftests/kvm/tests/arm64/vgic_lpi_stress/default.test
new file mode 100644
index 000000000000..c31424bc5a88
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/vgic_lpi_stress/default.test
@@ -0,0 +1 @@
+arm64/vgic_lpi_stress
diff --git a/tools/testing/selftests/kvm/tests/arm64/vpmu_counter_access/default.test b/tools/testing/selftests/kvm/tests/arm64/vpmu_counter_access/default.test
new file mode 100644
index 000000000000..505743df541f
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/vpmu_counter_access/default.test
@@ -0,0 +1 @@
+arm64/vpmu_counter_access
diff --git a/tools/testing/selftests/kvm/tests/get-reg-list/default.test b/tools/testing/selftests/kvm/tests/get-reg-list/default.test
new file mode 100644
index 000000000000..07b9427b9f83
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/get-reg-list/default.test
@@ -0,0 +1 @@
+get-reg-list
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


