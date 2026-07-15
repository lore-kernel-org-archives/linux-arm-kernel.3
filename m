Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD46C44512
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFsKCHfHF0PQ0KPLko3wm2b5CFX96W1OLohO4+HO7B4=; b=qS8V9Y5QP8WiwuAdWQPDA8ReYH
	5glNwn78+HMJbeWZe9tVzK5T+tNY0zlqKKWb8GGguDxpvDw+3OVkqQPUjIAnRAF2/w5RKF0gXDu8e
	GowyzMyLdCEmValk/URJFo8LYOfGWkiZNfIuHhMZN5xvsSAIsq4MpGzoT/XHvUG5mwtU4eHav7QOf
	plBYPxIIuUgaRpbadKyc33q6isbbe0enkjhBubK8Uz/VtoNnpj5eSb0DKWFGt21kfOf7vXORaXPrn
	S9aTxbfSxL3GLKwWb7rE+sCPYrXAl8D7Qp9mROnuITyne7EKRPYilWgKKuG96XMAO9H2wHLjOzFIO
	HmxmXrXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0dp-0000000FA1g-2zHh;
	Wed, 15 Jul 2026 14:31:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0dk-0000000F9vJ-3gmN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Jul 2026 14:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VFsKCHfHF0PQ0KPLko3wm2b5CFX96W1OLohO4+HO7B4=; b=d/F0aeTpVvK/JhSUUH51d+Lcs2
	GRbELqGHHcmSjsgGdixTWYTBAdpKNklF6R9FNzu02A6TWQ4GFl8/UkNL7JIdAGg5KmHKa3ye2c0rq
	pZy5WHebM+ALeVestImYJi+fJXiy+0x0xLhsLQfwGwTygOcpgvnibmTYz1AtILSdgcx8svczzDRBT
	CviA6Zauk8wrZhxf7tn+lIO/3Nr7goTcOMXlzJ1ifVV8g9ehJRtlIUYRKP3YMejnT4GCJ8x13oo3B
	MvSIMG91aElTQu3HT8onXLQJLSj9gX3XEaYAKqYFq0eQzoSNdLQwHJaPhAb3kPq5exoU7BzyIKO68
	/7RBS4AQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wk0dh-0000000DMzc-2msa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:31:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 077731BA8;
	Wed, 15 Jul 2026 07:31:04 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AA253F7B4;
	Wed, 15 Jul 2026 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784125868; bh=dof2MvH5ZZdVUnaNbvRlQgoLjFLC9SgvdrrOrj7zQ/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o2jZ38OJ48MTBmi0sJcCw1LnH3btREr/ObkwuJ8+cifSdVYW5zzoV3EjgOvXr2rcr
	 mJ8SDezMSUUlDutNIoQfw1LeuMpJMpe5BIOHYrzuOasV8PoQomJuzvr+WeZxK5bkfw
	 FzDNCrzzcNBj8FLBPjK5P/rN2lz8fCrLHC+dbAao=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH v15 28/37] KVM: arm64: CCA: Support RSI_HOST_CALL
Date: Wed, 15 Jul 2026 15:28:30 +0100
Message-ID: <20260715142841.80544-29-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715142841.80544-1-steven.price@arm.com>
References: <20260715142841.80544-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_153109_973880_CE3C9FC3 
X-CRM114-Status: GOOD (  13.38  )
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

From: Joey Gouly <joey.gouly@arm.com>

Realm VMs can talk to the hypervisor using the RSI_HOST_CALL SMC. The
RMM forwards this to the host and KVM handles them as regular
hypercalls.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
Changes since v7:
 * Avoid turning a negative return from kvm_smccc_call_handler() into a
   error response to the guest. Instead propagate the error back to user
   space.
Changes since v4:
 * Setting GPRS is now done by kvm_rec_enter() rather than
   rec_exit_host_call() (see previous patch - arm64: RME: Handle realm
   enter/exit). This fixes a bug where the registers set by user space
   were being ignored.
---
 arch/arm64/kvm/rmi-exit.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/kvm/rmi-exit.c b/arch/arm64/kvm/rmi-exit.c
index c668cbfa971a..78d9189fd5ca 100644
--- a/arch/arm64/kvm/rmi-exit.c
+++ b/arch/arm64/kvm/rmi-exit.c
@@ -113,6 +113,19 @@ static int rec_exit_ripas_change(struct kvm_vcpu *vcpu)
 	return -EFAULT;
 }
 
+static int rec_exit_host_call(struct kvm_vcpu *vcpu)
+{
+	int i;
+	struct realm_rec *rec = &vcpu->arch.rec;
+
+	vcpu->stat.hvc_exit_stat++;
+
+	for (i = 0; i < REC_RUN_GPRS; i++)
+		vcpu_set_reg(vcpu, i, rec->run->exit.gprs[i]);
+
+	return kvm_smccc_call_handler(vcpu);
+}
+
 static void update_arch_timer_irq_lines(struct kvm_vcpu *vcpu)
 {
 	struct realm_rec *rec = &vcpu->arch.rec;
@@ -188,6 +201,8 @@ int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret)
 		return rec_exit_psci(vcpu);
 	case RMI_EXIT_RIPAS_CHANGE:
 		return rec_exit_ripas_change(vcpu);
+	case RMI_EXIT_HOST_CALL:
+		return rec_exit_host_call(vcpu);
 	}
 
 	kvm_pr_unimpl("Unsupported exit reason: %u\n",
-- 
2.43.0


