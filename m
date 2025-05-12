Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FA6C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 18:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6PrbmwQ6A0Seyvbao8fqw7a8VX7wKunfxAgqBK7Cp0=; b=f+cj1LLpxxcWKKDc+jP8A8K0uI
	bbwC8uQV0LX3UO9Th7n8NbpcQUZrpwpO3RWUarFAUvrNhP6FlGubuI7yfwclXphrWzYl9Rtndqzn1
	Gv2FWUM0vKnWbfXSNbr5///gG3l6MVMnfuZ/kHZ+qteYRD3i7ZUHEOGp894bIZZLfvpDIpPoBJcB/
	nwTiKZknd4IP+8K659dotOQSI1uN/PczL1WIM5Fr9ToaFYAkAmPO0Qx4cKva1G2fZlJLml6GHaZ62
	QYn7/RgzDvqcP9UA8OjeSZcF9GW0o5UF2kyxKYJSq0Ryyc4fclusmArv9s9QZhznlw/rhQEQ7BiL7
	ApF39F0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXo4-0000000AMk1-2hGs;
	Mon, 12 May 2025 18:23:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXWI-0000000AHOS-3jIc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 18:04:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747073094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q6PrbmwQ6A0Seyvbao8fqw7a8VX7wKunfxAgqBK7Cp0=;
	b=RV9fS8HrNxWKFTmdi+OlxpMChpVrEJevlC9CYJfVxI7ePxJ3wGM5GHaegq5XpXV0vByZdo
	cnJrIBaG0OuR3TfusAH+AwLpcERmL4M2ZkNqvjwUHgg5jKxz3UdbyWcH5lUZ3lr90qUVbk
	9eMjFqLZBq2WdqI8TJGG5iQChOBC8hI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-130-mGHcVdicNDaIEHmdxj9Oxw-1; Mon,
 12 May 2025 14:04:49 -0400
X-MC-Unique: mGHcVdicNDaIEHmdxj9Oxw-1
X-Mimecast-MFC-AGG-ID: mGHcVdicNDaIEHmdxj9Oxw_1747073085
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 894251800373;
	Mon, 12 May 2025 18:04:45 +0000 (UTC)
Received: from intellaptop.lan (unknown [10.22.80.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E1A5830002D4;
	Mon, 12 May 2025 18:04:39 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jing Zhang <jingzhangos@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sebastian Ott <sebott@redhat.com>,
	Shusen Li <lishusen2@huawei.com>,
	Waiman Long <longman@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexander Potapenko <glider@google.com>,
	kvmarm@lists.linux.dev,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Atish Patra <atishp@atishpatra.org>,
	Joey Gouly <joey.gouly@arm.com>,
	x86@kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	linux-riscv@lists.infradead.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	kvm-riscv@lists.infradead.org,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Ingo Molnar <mingo@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v5 4/6] x86: KVM: SVM: use kvm_lock_all_vcpus instead of a custom implementation
Date: Mon, 12 May 2025 14:04:05 -0400
Message-ID: <20250512180407.659015-5-mlevitsk@redhat.com>
In-Reply-To: <20250512180407.659015-1-mlevitsk@redhat.com>
References: <20250512180407.659015-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_110454_991740_DAFF2890 
X-CRM114-Status: GOOD (  16.04  )
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

Use kvm_lock_all_vcpus instead of sev's own implementation.

Because kvm_lock_all_vcpus uses the _nest_lock feature of lockdep, which
ignores subclasses, there is no longer a need to use separate subclasses
for source and target VMs.

No functional change intended.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/sev.c | 72 +++---------------------------------------
 1 file changed, 4 insertions(+), 68 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 0bc708ee2788..16db6179013d 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -1882,70 +1882,6 @@ static void sev_unlock_two_vms(struct kvm *dst_kvm, struct kvm *src_kvm)
 	atomic_set_release(&src_sev->migration_in_progress, 0);
 }
 
-/* vCPU mutex subclasses.  */
-enum sev_migration_role {
-	SEV_MIGRATION_SOURCE = 0,
-	SEV_MIGRATION_TARGET,
-	SEV_NR_MIGRATION_ROLES,
-};
-
-static int sev_lock_vcpus_for_migration(struct kvm *kvm,
-					enum sev_migration_role role)
-{
-	struct kvm_vcpu *vcpu;
-	unsigned long i, j;
-
-	kvm_for_each_vcpu(i, vcpu, kvm) {
-		if (mutex_lock_killable_nested(&vcpu->mutex, role))
-			goto out_unlock;
-
-#ifdef CONFIG_PROVE_LOCKING
-		if (!i)
-			/*
-			 * Reset the role to one that avoids colliding with
-			 * the role used for the first vcpu mutex.
-			 */
-			role = SEV_NR_MIGRATION_ROLES;
-		else
-			mutex_release(&vcpu->mutex.dep_map, _THIS_IP_);
-#endif
-	}
-
-	return 0;
-
-out_unlock:
-
-	kvm_for_each_vcpu(j, vcpu, kvm) {
-		if (i == j)
-			break;
-
-#ifdef CONFIG_PROVE_LOCKING
-		if (j)
-			mutex_acquire(&vcpu->mutex.dep_map, role, 0, _THIS_IP_);
-#endif
-
-		mutex_unlock(&vcpu->mutex);
-	}
-	return -EINTR;
-}
-
-static void sev_unlock_vcpus_for_migration(struct kvm *kvm)
-{
-	struct kvm_vcpu *vcpu;
-	unsigned long i;
-	bool first = true;
-
-	kvm_for_each_vcpu(i, vcpu, kvm) {
-		if (first)
-			first = false;
-		else
-			mutex_acquire(&vcpu->mutex.dep_map,
-				      SEV_NR_MIGRATION_ROLES, 0, _THIS_IP_);
-
-		mutex_unlock(&vcpu->mutex);
-	}
-}
-
 static void sev_migrate_from(struct kvm *dst_kvm, struct kvm *src_kvm)
 {
 	struct kvm_sev_info *dst = to_kvm_sev_info(dst_kvm);
@@ -2083,10 +2019,10 @@ int sev_vm_move_enc_context_from(struct kvm *kvm, unsigned int source_fd)
 		charged = true;
 	}
 
-	ret = sev_lock_vcpus_for_migration(kvm, SEV_MIGRATION_SOURCE);
+	ret = kvm_lock_all_vcpus(kvm);
 	if (ret)
 		goto out_dst_cgroup;
-	ret = sev_lock_vcpus_for_migration(source_kvm, SEV_MIGRATION_TARGET);
+	ret = kvm_lock_all_vcpus(source_kvm);
 	if (ret)
 		goto out_dst_vcpu;
 
@@ -2100,9 +2036,9 @@ int sev_vm_move_enc_context_from(struct kvm *kvm, unsigned int source_fd)
 	ret = 0;
 
 out_source_vcpu:
-	sev_unlock_vcpus_for_migration(source_kvm);
+	kvm_unlock_all_vcpus(source_kvm);
 out_dst_vcpu:
-	sev_unlock_vcpus_for_migration(kvm);
+	kvm_unlock_all_vcpus(kvm);
 out_dst_cgroup:
 	/* Operates on the source on success, on the destination on failure.  */
 	if (charged)
-- 
2.46.0


