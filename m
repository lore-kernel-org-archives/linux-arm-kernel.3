Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7767EC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 18:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9ERlWy//d3vXfM6qe6RwNpiSNHM8JyZPnWWfaO2iUE=; b=osNnzA5YMuE8/VWQTyicZd0RBe
	pm72kbkF8H/oBABcL3j4Zoj+THTJSJ1dK7xRsDz5P2e7knHt71ajvq/QsLplC90Ojq7Q/SfGHSgL6
	f8fZp/xd2IzMsIrrvZHmkmlHmVHGUgLkeyAWdurE/rrRmUa8n3x1pPnOK7t0eIgTK9KByuCkJTHq1
	t8TRLOT9zgAEnxnocm9/mMAlaJaHkOpFi6oad3FlbGNF2NFMsK0x/DTxfkjXDtXxMFAumpM/tIV6n
	D7paEtHGsSA0r+XJ2IGLIrAU8sZto7jGeaGDZ2SQqGY+FrEzlbCjH/GENYxBgfEz2F9masmVxL6dT
	AKN1prZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXm4-0000000AM7a-1f4N;
	Mon, 12 May 2025 18:21:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXWD-0000000AHLQ-0Eqw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 18:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747073088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9ERlWy//d3vXfM6qe6RwNpiSNHM8JyZPnWWfaO2iUE=;
	b=b0VOavGGIaonihKmwEckP222SEnVsfP/l5agF6E0gBuyIJYMbn5rRiHHxaYw7YilS13GPo
	sUu+0WEWalCBOiKPg2L6eUZKG13uvgQPIZgh/zPgrpwNcQ5AZZNPR9eA4ruVFrdKzHRmwB
	Pt9/AZCMbmcxObGFfch6hYNpqSFPjBE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-9fb_4R8jOiSlXgEcXCHh-w-1; Mon,
 12 May 2025 14:04:44 -0400
X-MC-Unique: 9fb_4R8jOiSlXgEcXCHh-w-1
X-Mimecast-MFC-AGG-ID: 9fb_4R8jOiSlXgEcXCHh-w_1747073080
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A6C0C18002A5;
	Mon, 12 May 2025 18:04:39 +0000 (UTC)
Received: from intellaptop.lan (unknown [10.22.80.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2C18530001A1;
	Mon, 12 May 2025 18:04:33 +0000 (UTC)
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
Subject: [PATCH v5 3/6] KVM: add kvm_lock_all_vcpus and kvm_trylock_all_vcpus
Date: Mon, 12 May 2025 14:04:04 -0400
Message-ID: <20250512180407.659015-4-mlevitsk@redhat.com>
In-Reply-To: <20250512180407.659015-1-mlevitsk@redhat.com>
References: <20250512180407.659015-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_110449_183623_07D407D7 
X-CRM114-Status: GOOD (  17.59  )
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

In a few cases, usually in the initialization code, KVM locks all vCPUs
of a VM to ensure that userspace doesn't do funny things while KVM performs
an operation that affects the whole VM.

Until now, all these operations were implemented using custom code,
and all of them share the same problem:

Lockdep can't cope with simultaneous locking of a large number of locks of
the same class.

However if these locks are taken while another lock is already held,
which is luckily the case, it is possible to take advantage of little known
_nest_lock feature of lockdep which allows in this case to have an
unlimited number of locks of same class to be taken.

To implement this, create two functions:
kvm_lock_all_vcpus() and kvm_trylock_all_vcpus()

Both functions are needed because some code that will be replaced in
the subsequent patches, uses mutex_trylock, instead of regular mutex_lock.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 include/linux/kvm_host.h |  4 +++
 virt/kvm/kvm_main.c      | 59 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 1dedc421b3e3..a6140415c693 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1015,6 +1015,10 @@ static inline struct kvm_vcpu *kvm_get_vcpu_by_id(struct kvm *kvm, int id)
 
 void kvm_destroy_vcpus(struct kvm *kvm);
 
+int kvm_trylock_all_vcpus(struct kvm *kvm);
+int kvm_lock_all_vcpus(struct kvm *kvm);
+void kvm_unlock_all_vcpus(struct kvm *kvm);
+
 void vcpu_load(struct kvm_vcpu *vcpu);
 void vcpu_put(struct kvm_vcpu *vcpu);
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 69782df3617f..d660a7da3baa 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1368,6 +1368,65 @@ static int kvm_vm_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
+int kvm_trylock_all_vcpus(struct kvm *kvm)
+{
+	struct kvm_vcpu *vcpu;
+	unsigned long i, j;
+
+	lockdep_assert_held(&kvm->lock);
+
+	kvm_for_each_vcpu(i, vcpu, kvm)
+		if (!mutex_trylock_nest_lock(&vcpu->mutex, &kvm->lock))
+			goto out_unlock;
+	return 0;
+
+out_unlock:
+	kvm_for_each_vcpu(j, vcpu, kvm) {
+		if (i == j)
+			break;
+		mutex_unlock(&vcpu->mutex);
+	}
+	return -EINTR;
+}
+EXPORT_SYMBOL_GPL(kvm_trylock_all_vcpus);
+
+int kvm_lock_all_vcpus(struct kvm *kvm)
+{
+	struct kvm_vcpu *vcpu;
+	unsigned long i, j;
+	int r;
+
+	lockdep_assert_held(&kvm->lock);
+
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+		r = mutex_lock_killable_nest_lock(&vcpu->mutex, &kvm->lock);
+		if (r)
+			goto out_unlock;
+	}
+	return 0;
+
+out_unlock:
+	kvm_for_each_vcpu(j, vcpu, kvm) {
+		if (i == j)
+			break;
+		mutex_unlock(&vcpu->mutex);
+	}
+	return r;
+}
+EXPORT_SYMBOL_GPL(kvm_lock_all_vcpus);
+
+void kvm_unlock_all_vcpus(struct kvm *kvm)
+{
+	struct kvm_vcpu *vcpu;
+	unsigned long i;
+
+	lockdep_assert_held(&kvm->lock);
+
+	kvm_for_each_vcpu(i, vcpu, kvm)
+		mutex_unlock(&vcpu->mutex);
+}
+EXPORT_SYMBOL_GPL(kvm_unlock_all_vcpus);
+
 /*
  * Allocation size is twice as large as the actual dirty bitmap size.
  * See kvm_vm_ioctl_get_dirty_log() why this is needed.
-- 
2.46.0


