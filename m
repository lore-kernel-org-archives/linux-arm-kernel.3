Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40A1CD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 06:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fZWED7+strAr60xfenjKYZKpvQ8pXiqF/YOTUO0ZIw=; b=oGxIhCQVrl+HGjmoS7yVAu+J9i
	L3QU8nMqWrO0xs+CEPhSvctZPgVD9My0SdH99HQzrNTL78yQUoJcCOTSPIvqrYdIHe6QVmZN6UQlr
	hXKYEqGNwDSkF7Wgl5q1Q+zZ7DG7DfvcgqIiHtTQvtisgwNzAYl7xa7JUxP+1vsNBd/tHYZCgxngI
	VNkItB/aHZuZZaleY7+MJQzxCyL/vahFwxkcZKdGWNUlp7eZz9JfiYu1RwFRvTSYBjwpb1qxt6z3E
	xAsRk9jiaOGkA9/KGIlu06mjq3BDyUCEQt32VgRDeAXDfriByxkCfGROA06F2eqSBQOfS4jnYN2cr
	Fv55eqQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrj-0000000AR4V-32sL;
	Fri, 12 Jun 2026 06:59:43 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrd-0000000AQxW-3Z9Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 06:59:39 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490b4d3d3e6so3970575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 23:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781247575; x=1781852375; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5fZWED7+strAr60xfenjKYZKpvQ8pXiqF/YOTUO0ZIw=;
        b=m4kj8eiswtXZ9u164jppvbwICIj+KW5GtG+bAEYKiG1x3ttk+DNwpua8FtjXbo8nW/
         ODq0Jvi0+BH4gJm9sTdu3QVF/6o0Xtb/VDOb5JBOqZISgrBidvQnrPrZQcdb1q2fDkC5
         2ubT9EPqlmcH75znwDufBlsdmcfZsJGZqQoTQUQWdBuwJYV4AWMusqXfeb9ubUI8a2+r
         wwNbnjOipWIC9JSkHpffI/FnS6QJh1KxZMMzUBb0DiwldyRzq3niSIEh6qBo0lhxsjAQ
         8urkoj+XlcZZzxx52LdpcuBWYRCqonBSiJqBt00FV5v5pJ2uVQhFHiZLPShpoHZJBn5b
         hW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247575; x=1781852375;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5fZWED7+strAr60xfenjKYZKpvQ8pXiqF/YOTUO0ZIw=;
        b=WNtfeAYK4GbV+ZbFs/8iUmsk1KaOEJN1bg1zvjNdKz1OaPFkpSDa6SovtVfThGe92X
         iPyUrSokaAG/KhibktxgGVxkQBy0BNvOWVeAglBOwO/i2PKail0Sb+wlgVD/zy4Dvyex
         GFGWXHDY9nnU52lGL7WVjjtTcDgsKntqi+RpB0LCaTFug8md70Nvk7Cid4ZHxO1AwXeU
         iYYEub9GIwhkVpeXXS8cIyvToWDjMFFgifEF3jfVfF3VSwsaaimfMN1LWclNFDU/r597
         2wZ2apO7gmymDk3wjV4zI5cM69iZICXP4vFb6ynEt899Hdti3CSDSvIm+k6gDjK8Hy4U
         VSjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MIPP/I1QSCSlbrn7hcn4uCbUJXruq/btLBRMIH66QptmT+BXIsGA5kn9/BVLeNtjyM5DRIUOpQ+/vP/CxWiCo@lists.infradead.org
X-Gm-Message-State: AOJu0YwW9vYpnyfGPTef/KRtMzFMOEIGLHo0mrmIig0wtoD/Trh6YjkY
	1JQPpc2d1XMTR+/gxC+DFUrhbP9zFkk70nHbiGexFKiHJfH/ZUVIE7s7XgamTcGNZDaETklv3KP
	6lg==
X-Received: from wmti3.prod.google.com ([2002:a05:600c:8b83:b0:490:ab10:cd32])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5942:b0:490:47e3:929a
 with SMTP id 5b1f17b1804b1-490ec4cd289mr10397555e9.6.1781247575054; Thu, 11
 Jun 2026 23:59:35 -0700 (PDT)
Date: Fri, 12 Jun 2026 07:59:22 +0100
In-Reply-To: <20260612065925.755562-1-tabba@google.com>
Mime-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612065925.755562-9-tabba@google.com>
Subject: [PATCH v1 08/11] KVM: arm64: Add host and hypervisor vCPU lookup primitives
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Per Larsen <perlarsen@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_235937_920715_44E45FD8 
X-CRM114-Status: GOOD (  16.38  )
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

From: Marc Zyngier <maz@kernel.org>

The nVHE hypervisor repeatedly resolves a host vCPU into the EL2
address space and validates that the loaded hyp vCPU matches it, with
that logic open-coded in each handler.

Add __get_host_hyp_vcpus() and the get_host_hyp_vcpus() macro, which
translate the host vCPU into the hypervisor's address space and, when
pKVM is enabled, also return the loaded hyp vCPU if it matches. If pKVM
is enabled but the loaded hyp vCPU does not correspond to the requested
host vCPU, both the host and hyp vCPU are returned as NULL. Convert
handle___kvm_vcpu_run() to use it.

No functional change intended.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Co-developed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 52 ++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 06db299c37a8..420fb19a6476 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -195,14 +195,45 @@ static void handle___pkvm_vcpu_put(struct kvm_cpu_context *host_ctxt)
 		pkvm_put_hyp_vcpu(hyp_vcpu);
 }
 
-static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
+static struct kvm_vcpu *__get_host_hyp_vcpus(struct kvm_vcpu *arg,
+					     struct pkvm_hyp_vcpu **hyp_vcpup)
 {
-	DECLARE_REG(struct kvm_vcpu *, host_vcpu, host_ctxt, 1);
-	int ret;
+	struct kvm_vcpu *host_vcpu = kern_hyp_va(arg);
+	struct pkvm_hyp_vcpu *hyp_vcpu = NULL;
 
 	if (unlikely(is_protected_kvm_enabled())) {
-		struct pkvm_hyp_vcpu *hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+		hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
 
+		if (!hyp_vcpu || hyp_vcpu->host_vcpu != host_vcpu) {
+			hyp_vcpu = NULL;
+			host_vcpu = NULL;
+		}
+	}
+
+	*hyp_vcpup = hyp_vcpu;
+	return host_vcpu;
+}
+
+#define get_host_hyp_vcpus(ctxt, regnr, hyp_vcpup)			\
+	({								\
+		DECLARE_REG(struct kvm_vcpu *, __vcpu, ctxt, regnr);	\
+		__get_host_hyp_vcpus(__vcpu, hyp_vcpup);		\
+	})
+
+static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
+{
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+	struct kvm_vcpu *host_vcpu;
+	int ret;
+
+	host_vcpu = get_host_hyp_vcpus(host_ctxt, 1, &hyp_vcpu);
+
+	if (!host_vcpu) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (unlikely(hyp_vcpu)) {
 		/*
 		 * KVM (and pKVM) doesn't support SME guests for now, and
 		 * ensures that SME features aren't enabled in pstate when
@@ -214,23 +245,16 @@ static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
 			goto out;
 		}
 
-		if (!hyp_vcpu) {
-			ret = -EINVAL;
-			goto out;
-		}
-
 		flush_hyp_vcpu(hyp_vcpu);
 
 		ret = __kvm_vcpu_run(&hyp_vcpu->vcpu);
 
 		sync_hyp_vcpu(hyp_vcpu);
 	} else {
-		struct kvm_vcpu *vcpu = kern_hyp_va(host_vcpu);
-
 		/* The host is fully trusted, run its vCPU directly. */
-		fpsimd_lazy_switch_to_guest(vcpu);
-		ret = __kvm_vcpu_run(vcpu);
-		fpsimd_lazy_switch_to_host(vcpu);
+		fpsimd_lazy_switch_to_guest(host_vcpu);
+		ret = __kvm_vcpu_run(host_vcpu);
+		fpsimd_lazy_switch_to_host(host_vcpu);
 	}
 out:
 	cpu_reg(host_ctxt, 1) =  ret;
-- 
2.54.0.1136.gdb2ca164c4-goog


