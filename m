Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12F9C369A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 01:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnuRl7pX40qfpQY8we1PeXSyE5JlXKbBJtvXtdb+Rj4=; b=bmpC8jzc1us87tAorUPuPTYZ8j
	LgQTYVFyyPT9s4BpqFPdPISPNX1EU6XDXTVoXD8SfokGtIcQsS7QuH2R1Z7rfJ9lVLJWmpMw8VORw
	nJul5KOCxhPCSrJgDoGHwgtrKzqyAtif/plZSSfbxvztIHz7sGbOxSlHiKesbza1zQsPV7vT4QkXc
	Utn6jRdy9ntTGxzbzAupNi+8of0n7NOnvfqwYz03xxUfXT+9vH3QvYrvmoyKCjrlkFf4UBxTbdyGP
	J1CTjNqD0i/DGkVfmqlsxspDGYCEJ8Wu5BXRgjj4LiDq1o4kFNE4PkdsWie/Zf3zBWGZ/a0nriWvR
	VS54a45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2KaT-00000005siR-1KiA;
	Wed, 09 Apr 2025 01:50:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2KTx-00000005rm8-2C0d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 01:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744163040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vnuRl7pX40qfpQY8we1PeXSyE5JlXKbBJtvXtdb+Rj4=;
	b=F2qJ3fOhm/qrW4B9jKkFphM5j7GRP/aslhR/oeQARGSc6nh9k7JFCBRVkad7iGtOCgYLih
	TWnIvSt90SsK+vv2+/TZquJONBQU7cfQG9axYsKLYkQH0zcXuoi4wzmoCyF7s9LrbErZ0m
	8CCwgpNv/fPDKtabTRBu4qauQoEK8fk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-KEvlSNwBOry_feClk1BOow-1; Tue,
 08 Apr 2025 21:42:03 -0400
X-MC-Unique: KEvlSNwBOry_feClk1BOow-1
X-Mimecast-MFC-AGG-ID: KEvlSNwBOry_feClk1BOow_1744162919
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A66A5180034D;
	Wed,  9 Apr 2025 01:41:58 +0000 (UTC)
Received: from starship.lan (unknown [10.22.65.191])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3D7991801766;
	Wed,  9 Apr 2025 01:41:52 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	kvm-riscv@lists.infradead.org,
	Oliver Upton <oliver.upton@linux.dev>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jing Zhang <jingzhangos@google.com>,
	Waiman Long <longman@redhat.com>,
	x86@kernel.org,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zenghui Yu <yuzenghui@huawei.com>,
	Borislav Petkov <bp@alien8.de>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	Sebastian Ott <sebott@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sean Christopherson <seanjc@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 2/4] KVM: x86: move sev_lock/unlock_vcpus_for_migration to kvm_main.c
Date: Tue,  8 Apr 2025 21:41:34 -0400
Message-Id: <20250409014136.2816971-3-mlevitsk@redhat.com>
In-Reply-To: <20250409014136.2816971-1-mlevitsk@redhat.com>
References: <20250409014136.2816971-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_184401_689356_EDA6AD32 
X-CRM114-Status: GOOD (  22.31  )
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

Move sev_lock/unlock_vcpus_for_migration to kvm_main and call the
new functions the kvm_lock_all_vcpus/kvm_unlock_all_vcpus
and kvm_lock_all_vcpus_nested.

This code allows to lock all vCPUs without triggering lockdep warning
about reaching MAX_LOCK_DEPTH depth by coercing the lockdep into
thinking that we release all the locks other than vcpu'0 lock
immediately after we take them.

No functional change intended.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/sev.c   | 65 +++---------------------------------
 include/linux/kvm_host.h |  6 ++++
 virt/kvm/kvm_main.c      | 71 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+), 61 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 0bc708ee2788..7adc54b1f741 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -1889,63 +1889,6 @@ enum sev_migration_role {
 	SEV_NR_MIGRATION_ROLES,
 };
 
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
@@ -2083,10 +2026,10 @@ int sev_vm_move_enc_context_from(struct kvm *kvm, unsigned int source_fd)
 		charged = true;
 	}
 
-	ret = sev_lock_vcpus_for_migration(kvm, SEV_MIGRATION_SOURCE);
+	ret = kvm_lock_all_vcpus_nested(kvm, false, SEV_MIGRATION_SOURCE);
 	if (ret)
 		goto out_dst_cgroup;
-	ret = sev_lock_vcpus_for_migration(source_kvm, SEV_MIGRATION_TARGET);
+	ret = kvm_lock_all_vcpus_nested(source_kvm, false, SEV_MIGRATION_TARGET);
 	if (ret)
 		goto out_dst_vcpu;
 
@@ -2100,9 +2043,9 @@ int sev_vm_move_enc_context_from(struct kvm *kvm, unsigned int source_fd)
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
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 1dedc421b3e3..30cf28bf5c80 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1015,6 +1015,12 @@ static inline struct kvm_vcpu *kvm_get_vcpu_by_id(struct kvm *kvm, int id)
 
 void kvm_destroy_vcpus(struct kvm *kvm);
 
+int kvm_lock_all_vcpus_nested(struct kvm *kvm, bool trylock, unsigned int role);
+void kvm_unlock_all_vcpus(struct kvm *kvm);
+
+#define kvm_lock_all_vcpus(kvm, trylock) \
+	kvm_lock_all_vcpus_nested(kvm, trylock, 0)
+
 void vcpu_load(struct kvm_vcpu *vcpu);
 void vcpu_put(struct kvm_vcpu *vcpu);
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 69782df3617f..71c0d8c35b4b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1368,6 +1368,77 @@ static int kvm_vm_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
+
+/*
+ * Lock all VM vCPUs.
+ * Can be used nested (to lock vCPUS of two VMs for example)
+ */
+int kvm_lock_all_vcpus_nested(struct kvm *kvm, bool trylock, unsigned int role)
+{
+	struct kvm_vcpu *vcpu;
+	unsigned long i, j;
+
+	lockdep_assert_held(&kvm->lock);
+
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+
+		if (trylock && !mutex_trylock_nested(&vcpu->mutex, role))
+			goto out_unlock;
+		else if (!trylock && mutex_lock_killable_nested(&vcpu->mutex, role))
+			goto out_unlock;
+
+#ifdef CONFIG_PROVE_LOCKING
+		if (!i)
+			/*
+			 * Reset the role to one that avoids colliding with
+			 * the role used for the first vcpu mutex.
+			 */
+			role = MAX_LOCK_DEPTH - 1;
+		else
+			mutex_release(&vcpu->mutex.dep_map, _THIS_IP_);
+#endif
+	}
+
+	return 0;
+
+out_unlock:
+
+	kvm_for_each_vcpu(j, vcpu, kvm) {
+		if (i == j)
+			break;
+
+#ifdef CONFIG_PROVE_LOCKING
+		if (j)
+			mutex_acquire(&vcpu->mutex.dep_map, role, 0, _THIS_IP_);
+#endif
+
+		mutex_unlock(&vcpu->mutex);
+	}
+	return -EINTR;
+}
+EXPORT_SYMBOL_GPL(kvm_lock_all_vcpus_nested);
+
+void kvm_unlock_all_vcpus(struct kvm *kvm)
+{
+	struct kvm_vcpu *vcpu;
+	unsigned long i;
+	bool first = true;
+
+	lockdep_assert_held(&kvm->lock);
+
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+		if (first)
+			first = false;
+		else
+			mutex_acquire(&vcpu->mutex.dep_map,
+					MAX_LOCK_DEPTH - 1, 0, _THIS_IP_);
+
+		mutex_unlock(&vcpu->mutex);
+	}
+}
+EXPORT_SYMBOL_GPL(kvm_unlock_all_vcpus);
+
+
 /*
  * Allocation size is twice as large as the actual dirty bitmap size.
  * See kvm_vm_ioctl_get_dirty_log() why this is needed.
-- 
2.26.3


